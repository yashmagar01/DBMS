const API = 'http://localhost:3000/api/employees';

let employeesData = [];
let filteredData = [];
let sortState = { column: null, ascending: true };

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

// Dark mode toggle
function initDarkMode() {
  const savedTheme = localStorage.getItem('theme') || 'light';
  document.body.setAttribute('data-bs-theme', savedTheme);
  elements.darkModeToggle.checked = savedTheme === 'dark';

  elements.darkModeToggle.addEventListener('change', (e) => {
    const theme = e.target.checked ? 'dark' : 'light';
    document.body.setAttribute('data-bs-theme', theme);
    localStorage.setItem('theme', theme);
  });
}

// Toast notifications
function showToast(type, message) {
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
  elements.loadingState.classList.toggle('d-none', !isLoading);
  document.getElementById('empTable').classList.toggle('d-none', isLoading);
  elements.emptyState.classList.add('d-none');
}

function showEmptyState(show) {
  elements.emptyState.classList.toggle('d-none', !show);
  document.getElementById('empTable').classList.toggle('d-none', show);
}

function showAlert(type, message) {
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
    elements.tbody.innerHTML = '';
    return;
  }
  showEmptyState(false);
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

async function loadEmployees() {
  try {
    toggleLoading(true);
    const res = await fetch(API);
    if (!res.ok) {
      throw new Error(`Failed to load employees (status ${res.status})`);
    }
    employeesData = await res.json();
    filteredData = [...employeesData];
    updateStats();
    renderTable();
  } catch (err) {
    console.error(err);
    showAlert('danger', err.message || 'Unable to load employees.');
    employeesData = [];
    filteredData = [];
    elements.tbody.innerHTML = '';
    showEmptyState(true);
  } finally {
    toggleLoading(false);
  }
}

function handleSearch() {
  const query = elements.searchInput.value.toLowerCase().trim();
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
  elements.modalTitle.textContent = 'Add Employee';
  elements.empIdField.value = '';
  elements.addForm.reset();
  elements.addForm.classList.remove('was-validated');
}

function handleEdit(empId) {
  const emp = employeesData.find(e => e.emp_id == empId);
  if (!emp) return;

  elements.modalTitle.textContent = 'Edit Employee';
  elements.empIdField.value = emp.emp_id;
  document.getElementById('firstName').value = emp.first_name || '';
  document.getElementById('lastName').value = emp.last_name || '';
  document.getElementById('email').value = emp.email || '';
  document.getElementById('department').value = emp.dept_name || '';
  document.getElementById('jobTitle').value = emp.job_title || '';
  document.getElementById('salary').value = emp.salary || '';

  const modal = new bootstrap.Modal(elements.addModal);
  modal.show();
}

async function handleDelete(empId) {
  if (!confirm('Are you sure you want to delete this employee?')) return;

  try {
    const res = await fetch(`${API}/${empId}`, { method: 'DELETE' });
    if (!res.ok) throw new Error('Failed to delete employee.');

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

  elements.submitButton.disabled = true;
  elements.submitButton.innerHTML = '<i class="bi bi-hourglass-split me-1"></i>Saving...';

  try {
    const method = empId ? 'PUT' : 'POST';
    const url = empId ? `${API}/${empId}` : API;
    const res = await fetch(url, {
      method,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
    });

    if (!res.ok) {
      const errorText = await res.text();
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
    elements.submitButton.disabled = false;
    elements.submitButton.innerHTML = '<i class="bi bi-save me-1"></i>Save';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  initDarkMode();
  loadEmployees();

  elements.addForm.addEventListener('submit', handleFormSubmit);
  elements.searchInput.addEventListener('input', handleSearch);
  elements.resetFilters.addEventListener('click', () => {
    elements.searchInput.value = '';
    filteredData = [...employeesData];
    renderTable();
  });

  document.querySelectorAll('.sortable').forEach(th => {
    th.addEventListener('click', () => handleSort(th.dataset.sort));
  });

  elements.addModal.addEventListener('hidden.bs.modal', resetModal);
  document.getElementById('openAddModal').addEventListener('click', resetModal);
});
