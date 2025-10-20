const API = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
  ? 'http://localhost:3000/api/employees'
  : 'https://dbms-0i34.onrender.com/api/employees';

let employeesData = [];
let filteredData = [];
let sortState = { column: null, ascending: true };
let currentUser = null;

const elements = {
  tbody: document.querySelector('#empTable tbody'),
  loadingState: document.getElementById('loadingState'),
  emptyState: document.getElementById('emptyState'),
  statusAlert: document.getElementById('statusAlert'),
  addForm: document.getElementById('addForm'),
  submitButton: document.getElementById('submitEmployee'),
  addModal: document.getElementById('addModal'),
  modalTitle: document.getElementById('modalTitle'),
  empIdField: document.getElementById('empIdField'),
  searchInput: document.getElementById('searchInput'),
  resetFilters: document.getElementById('resetFilters'),
  darkModeToggle: document.getElementById('darkModeToggle'),
  toastContainer: document.getElementById('toastContainer'),
};

// Authentication helpers
function getAuthToken() {
  return localStorage.getItem('token');
}

function getCurrentUser() {
  const userStr = localStorage.getItem('user');
  return userStr ? JSON.parse(userStr) : null;
}

function isAuthenticated() {
  return !!getAuthToken() && !!getCurrentUser();
}

function logout() {
  localStorage.removeItem('token');
  localStorage.removeItem('user');
  window.location.href = 'login.html';
}

// API request with auth
async function apiRequest(url, options = {}) {
  const token = getAuthToken();
  if (token) {
    options.headers = {
      ...options.headers,
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    };
  }

  const response = await fetch(url, options);

  // Handle 401 - token expired or invalid
  if (response.status === 401) {
    logout();
    return;
  }

  return response;
}

// Dark mode toggle
function initDarkMode() {
  const savedTheme = localStorage.getItem('theme') || 'light';
  document.body.setAttribute('data-bs-theme', savedTheme);
  if (elements.darkModeToggle) {
    elements.darkModeToggle.checked = savedTheme === 'dark';

    elements.darkModeToggle.addEventListener('change', (e) => {
      const theme = e.target.checked ? 'dark' : 'light';
      document.body.setAttribute('data-bs-theme', theme);
      localStorage.setItem('theme', theme);
    });
  }
}

// Toast notifications
function showToast(type, message) {
  if (!elements.toastContainer) return;

  const toastId = `toast-${Date.now()}`;
  const bgClass = type === 'success' ? 'bg-success' : type === 'danger' ? 'bg-danger' : 'bg-warning';
  const toastHTML = `
    <div id="${toastId}" class="toast align-items-center text-white ${bgClass} border-0" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">${message}</div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  `;
  elements.toastContainer.insertAdjacentHTML('beforeend', toastHTML);
  const toastEl = document.getElementById(toastId);
  const toast = new bootstrap.Toast(toastEl, { delay: 3000 });
  toast.show();
  toastEl.addEventListener('hidden.bs.toast', () => toastEl.remove());
}

function toggleLoading(isLoading) {
  if (elements.loadingState) {
    elements.loadingState.classList.toggle('d-none', !isLoading);
  }
  if (document.getElementById('empTable')) {
    document.getElementById('empTable').classList.toggle('d-none', isLoading);
  }
  if (elements.emptyState) {
    elements.emptyState.classList.add('d-none');
  }
}

function showEmptyState(show) {
  if (elements.emptyState) {
    elements.emptyState.classList.toggle('d-none', !show);
  }
  if (document.getElementById('empTable')) {
    document.getElementById('empTable').classList.toggle('d-none', show);
  }
}

function showAlert(type, message) {
  if (!elements.statusAlert) return;

  const alertEl = elements.statusAlert;
  alertEl.className = `alert alert-${type}`;
  alertEl.textContent = message;
  alertEl.classList.remove('d-none');
  setTimeout(() => {
    alertEl.classList.add('d-none');
  }, 4000);
}

function getDeptBadgeClass(dept) {
  const deptLower = (dept || '').toLowerCase();
  if (deptLower.includes('engineering') || deptLower.includes('tech')) return 'badge-engineering';
  if (deptLower.includes('hr') || deptLower.includes('human')) return 'badge-hr';
  if (deptLower.includes('sales') || deptLower.includes('marketing')) return 'badge-sales';
  return 'badge-default';
}

function updateStats() {
  if (!employeesData.length) return;

  const total = employeesData.length;
  document.getElementById('totalEmployees').textContent = total;

  const salaries = employeesData.map(e => Number(e.salary)).filter(s => s > 0);
  const avgSalary = salaries.length ? Math.round(salaries.reduce((a, b) => a + b, 0) / salaries.length) : 0;
  document.getElementById('averageSalary').textContent = avgSalary ? `$${avgSalary.toLocaleString()}` : '—';

  const depts = new Set(employeesData.map(e => e.dept_name).filter(Boolean));
  document.getElementById('departmentCount').textContent = depts.size;

  const now = new Date();
  document.getElementById('lastUpdated').textContent = now.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' });
}

function renderTable(data = filteredData) {
  if (!data.length) {
    showEmptyState(true);
    if (elements.tbody) elements.tbody.innerHTML = '';
    return;
  }
  showEmptyState(false);

  if (elements.tbody) {
    elements.tbody.innerHTML = data
      .map((r) => {
        const deptBadge = r.dept_name
          ? `<span class="badge badge-dept ${getDeptBadgeClass(r.dept_name)}">${r.dept_name}</span>`
          : '';
        return `
          <tr data-emp-id="${r.emp_id}">
            <td>${r.emp_id ?? ''}</td>
            <td>${[r.first_name, r.last_name].filter(Boolean).join(' ')}</td>
            <td>${deptBadge}</td>
            <td>${r.job_title ?? ''}</td>
            <td class="text-end salary-cell">${r.salary ? '$' + Number(r.salary).toLocaleString() : ''}</td>
            <td class="text-center">
              <div class="action-buttons">
                <button class="btn btn-sm btn-outline-primary edit-btn" data-id="${r.emp_id}" title="Edit">
                  <i class="bi bi-pencil"></i>
                </button>
                <button class="btn btn-sm btn-outline-danger delete-btn" data-id="${r.emp_id}" title="Delete">
                  <i class="bi bi-trash"></i>
                </button>
              </div>
            </td>
          </tr>
        `;
      })
      .join('');

    // Attach event listeners
    document.querySelectorAll('.edit-btn').forEach(btn => {
      btn.addEventListener('click', () => handleEdit(btn.dataset.id));
    });
    document.querySelectorAll('.delete-btn').forEach(btn => {
      btn.addEventListener('click', () => handleDelete(btn.dataset.id));
    });
  }
}

async function loadEmployees() {
  try {
    toggleLoading(true);
    const response = await apiRequest(API);

    if (!response) return; // User was redirected due to 401

    if (!response.ok) {
      throw new Error(`Failed to load employees (status ${response.status})`);
    }

    employeesData = await response.json();
    filteredData = [...employeesData];
    updateStats();
    renderTable();
  } catch (err) {
    console.error(err);
    showAlert('danger', err.message || 'Unable to load employees.');
    employeesData = [];
    filteredData = [];
    if (elements.tbody) elements.tbody.innerHTML = '';
    showEmptyState(true);
  } finally {
    toggleLoading(false);
  }
}

function handleSearch() {
  const query = elements.searchInput ? elements.searchInput.value.toLowerCase().trim() : '';
  if (!query) {
    filteredData = [...employeesData];
  } else {
    filteredData = employeesData.filter(emp => {
      const fullName = `${emp.first_name} ${emp.last_name}`.toLowerCase();
      const dept = (emp.dept_name || '').toLowerCase();
      const job = (emp.job_title || '').toLowerCase();
      return fullName.includes(query) || dept.includes(query) || job.includes(query);
    });
  }
  renderTable();
}

function handleSort(column) {
  if (sortState.column === column) {
    sortState.ascending = !sortState.ascending;
  } else {
    sortState.column = column;
    sortState.ascending = true;
  }

  filteredData.sort((a, b) => {
    let valA, valB;
    if (column === 'name') {
      valA = `${a.first_name} ${a.last_name}`.toLowerCase();
      valB = `${b.first_name} ${b.last_name}`.toLowerCase();
    } else if (column === 'salary') {
      valA = Number(a.salary) || 0;
      valB = Number(b.salary) || 0;
    } else {
      valA = (a[column] || '').toString().toLowerCase();
      valB = (b[column] || '').toString().toLowerCase();
    }

    if (valA < valB) return sortState.ascending ? -1 : 1;
    if (valA > valB) return sortState.ascending ? 1 : -1;
    return 0;
  });

  document.querySelectorAll('.sortable').forEach(th => th.classList.remove('active'));
  document.querySelector(`[data-sort="${column}"]`).classList.add('active');
  renderTable();
}

function resetModal() {
  if (elements.modalTitle) elements.modalTitle.textContent = 'Add Employee';
  if (elements.empIdField) elements.empIdField.value = '';
  if (elements.addForm) {
    elements.addForm.reset();
    elements.addForm.classList.remove('was-validated');
  }
}

function handleEdit(empId) {
  const emp = employeesData.find(e => e.emp_id == empId);
  if (!emp) return;

  if (elements.modalTitle) elements.modalTitle.textContent = 'Edit Employee';
  if (elements.empIdField) elements.empIdField.value = emp.emp_id;

  const formFields = ['firstName', 'lastName', 'email', 'department', 'jobTitle', 'salary'];
  formFields.forEach(field => {
    const element = document.getElementById(field);
    if (element) {
      const value = emp[field.toLowerCase()] || (field === 'firstName' ? emp.first_name : '') || (field === 'lastName' ? emp.last_name : '') || '';
      element.value = value;
    }
  });

  const modal = new bootstrap.Modal(elements.addModal);
  modal.show();
}

async function handleDelete(empId) {
  if (!confirm('Are you sure you want to delete this employee?')) return;

  try {
    const response = await apiRequest(`${API}/${empId}`, { method: 'DELETE' });

    if (!response) return; // User was redirected

    if (!response.ok) throw new Error('Failed to delete employee.');

    showToast('success', 'Employee deleted successfully.');
    await loadEmployees();
  } catch (err) {
    console.error(err);
    showToast('danger', err.message || 'Failed to delete employee.');
  }
}

function validateForm(formData) {
  const first = formData.get('first_name')?.trim();
  const last = formData.get('last_name')?.trim();
  if (!first || !last) {
    showAlert('warning', 'First and last name are required.');
    return false;
  }
  const salary = formData.get('salary');
  if (salary && Number(salary) < 0) {
    showAlert('warning', 'Salary cannot be negative.');
    return false;
  }
  return true;
}

async function handleFormSubmit(e) {
  e.preventDefault();
  const form = e.target;
  const formData = new FormData(form);
  if (!validateForm(formData)) return;

  const payload = Object.fromEntries(formData.entries());
  const empId = payload.emp_id;
  delete payload.emp_id;

  if (elements.submitButton) {
    elements.submitButton.disabled = true;
    elements.submitButton.innerHTML = '<i class="bi bi-hourglass-split me-1"></i>Saving...';
  }

  try {
    const method = empId ? 'PUT' : 'POST';
    const url = empId ? `${API}/${empId}` : API;
    const response = await apiRequest(url, {
      method,
      body: JSON.stringify(payload)
    });

    if (!response) return; // User was redirected

    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(errorText || `Error ${empId ? 'updating' : 'adding'} employee.`);
    }

    showToast('success', `Employee ${empId ? 'updated' : 'added'} successfully.`);
    form.reset();
    const modal = bootstrap.Modal.getInstance(elements.addModal);
    modal?.hide();
    await loadEmployees();
  } catch (err) {
    console.error(err);
    showToast('danger', err.message || `Failed to ${empId ? 'update' : 'add'} employee.`);
  } finally {
    if (elements.submitButton) {
      elements.submitButton.disabled = false;
      elements.submitButton.innerHTML = '<i class="bi bi-save me-1"></i>Save';
    }
  }
}

// Initialize app
document.addEventListener('DOMContentLoaded', () => {
  // Check authentication
  if (!isAuthenticated()) {
    window.location.href = 'login.html';
    return;
  }

  currentUser = getCurrentUser();

  // Update navbar with user info
  const navbarBrand = document.querySelector('.navbar-brand');
  if (navbarBrand && currentUser) {
    navbarBrand.textContent = `EMS DMS - ${currentUser.name} (${currentUser.role})`;
  }

  // Add logout button if not exists
  const navbar = document.querySelector('.navbar');
  if (navbar && !document.getElementById('logoutBtn')) {
    const logoutDiv = document.createElement('div');
    logoutDiv.className = 'd-flex align-items-center gap-2 ms-auto';
    logoutDiv.innerHTML = `
      <span class="text-white">${currentUser.name}</span>
      <button class="btn btn-outline-light btn-sm" id="logoutBtn">
        <i class="bi bi-box-arrow-right me-1"></i>Logout
      </button>
    `;
    navbar.querySelector('.container-fluid').appendChild(logoutDiv);

    document.getElementById('logoutBtn').addEventListener('click', logout);
  }

  initDarkMode();
  loadEmployees();

  if (elements.addForm) {
    elements.addForm.addEventListener('submit', handleFormSubmit);
  }

  if (elements.searchInput) {
    elements.searchInput.addEventListener('input', handleSearch);
  }

  if (elements.resetFilters) {
    elements.resetFilters.addEventListener('click', () => {
      if (elements.searchInput) elements.searchInput.value = '';
      filteredData = [...employeesData];
      renderTable();
    });
  }

  document.querySelectorAll('.sortable').forEach(th => {
    th.addEventListener('click', () => handleSort(th.dataset.sort));
  });

  if (elements.addModal) {
    elements.addModal.addEventListener('hidden.bs.modal', resetModal);
  }

  if (document.getElementById('openAddModal')) {
    document.getElementById('openAddModal').addEventListener('click', resetModal);
  }
});
