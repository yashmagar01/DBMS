const express = require('express');
const pool = require('../db');
const { authenticateToken } = require('../utils/authMiddleware');

const router = express.Router();

// Apply authentication middleware to all routes
router.use(authenticateToken);

// GET all employees (scoped to user's data)
router.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT
        e.emp_id,
        e.first_name,
        e.last_name,
        e.email,
        e.salary,
        e.hire_date,
        d.dept_name,
        j.job_title
      FROM employees e
      LEFT JOIN departments d ON e.dept_id = d.dept_id
      LEFT JOIN jobs j ON e.job_id = j.job_id
      WHERE e.user_id_fk = ?
      ORDER BY e.emp_id
    `, [req.user_id]);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching employees:', err);
    res.status(500).json({ error: 'Failed to fetch employees' });
  }
});

// POST new employee (scoped to user's data)
router.post('/', async (req, res) => {
  try {
    const { first_name, last_name, email, dept_name, job_title, salary } = req.body;

    // Validate required fields
    if (!first_name || !last_name) {
      return res.status(400).json({ error: 'First name and last name are required' });
    }

    // Get or create department for this user
    let dept_id = null;
    if (dept_name) {
      const [deptRows] = await pool.query('SELECT dept_id FROM departments WHERE dept_name = ? AND user_id_fk = ?', [dept_name, req.user_id]);
      if (deptRows.length > 0) {
        dept_id = deptRows[0].dept_id;
      } else {
        const [deptResult] = await pool.query('INSERT INTO departments (dept_name, user_id_fk) VALUES (?, ?)', [dept_name, req.user_id]);
        dept_id = deptResult.insertId;
      }
    }

    // Get or create job for this user
    let job_id = null;
    if (job_title) {
      const [jobRows] = await pool.query('SELECT job_id FROM jobs WHERE job_title = ? AND user_id_fk = ?', [job_title, req.user_id]);
      if (jobRows.length > 0) {
        job_id = jobRows[0].job_id;
      } else {
        const [jobResult] = await pool.query('INSERT INTO jobs (job_title, user_id_fk) VALUES (?, ?)', [job_title, req.user_id]);
        job_id = jobResult.insertId;
      }
    }

    // Insert employee for this user
    const [result] = await pool.query(
      'INSERT INTO employees (first_name, last_name, email, dept_id, job_id, salary, user_id_fk) VALUES (?, ?, ?, ?, ?, ?, ?)',
      [first_name, last_name, email || null, dept_id, job_id, salary || null, req.user_id]
    );

    res.status(201).json({ emp_id: result.insertId, message: 'Employee added successfully' });
  } catch (err) {
    console.error('Error adding employee:', err);
    res.status(500).json({ error: 'Failed to add employee' });
  }
});

// PUT update employee (scoped to user's data)
router.put('/:id', async (req, res) => {
  try {
    const empId = req.params.id;
    const { first_name, last_name, email, dept_name, job_title, salary } = req.body;

    // Validate required fields
    if (!first_name || !last_name) {
      return res.status(400).json({ error: 'First name and last name are required' });
    }

    // Verify employee belongs to user
    const [empRows] = await pool.query('SELECT emp_id FROM employees WHERE emp_id = ? AND user_id_fk = ?', [empId, req.user_id]);
    if (empRows.length === 0) {
      return res.status(404).json({ error: 'Employee not found or access denied' });
    }

    // Get or create department for this user
    let dept_id = null;
    if (dept_name) {
      const [deptRows] = await pool.query('SELECT dept_id FROM departments WHERE dept_name = ? AND user_id_fk = ?', [dept_name, req.user_id]);
      if (deptRows.length > 0) {
        dept_id = deptRows[0].dept_id;
      } else {
        const [deptResult] = await pool.query('INSERT INTO departments (dept_name, user_id_fk) VALUES (?, ?)', [dept_name, req.user_id]);
        dept_id = deptResult.insertId;
      }
    }

    // Get or create job for this user
    let job_id = null;
    if (job_title) {
      const [jobRows] = await pool.query('SELECT job_id FROM jobs WHERE job_title = ? AND user_id_fk = ?', [job_title, req.user_id]);
      if (jobRows.length > 0) {
        job_id = jobRows[0].job_id;
      } else {
        const [jobResult] = await pool.query('INSERT INTO jobs (job_title, user_id_fk) VALUES (?, ?)', [job_title, req.user_id]);
        job_id = jobResult.insertId;
      }
    }

    // Update employee
    await pool.query(
      'UPDATE employees SET first_name = ?, last_name = ?, email = ?, dept_id = ?, job_id = ?, salary = ? WHERE emp_id = ? AND user_id_fk = ?',
      [first_name, last_name, email || null, dept_id, job_id, salary || null, empId, req.user_id]
    );

    res.json({ message: 'Employee updated successfully' });
  } catch (err) {
    console.error('Error updating employee:', err);
    res.status(500).json({ error: 'Failed to update employee' });
  }
});

// DELETE employee (scoped to user's data)
router.delete('/:id', async (req, res) => {
  try {
    const empId = req.params.id;

    // Verify employee belongs to user
    const [empRows] = await pool.query('SELECT emp_id FROM employees WHERE emp_id = ? AND user_id_fk = ?', [empId, req.user_id]);
    if (empRows.length === 0) {
      return res.status(404).json({ error: 'Employee not found or access denied' });
    }

    await pool.query('DELETE FROM employees WHERE emp_id = ? AND user_id_fk = ?', [empId, req.user_id]);
    res.json({ message: 'Employee deleted successfully' });
  } catch (err) {
    console.error('Error deleting employee:', err);
    res.status(500).json({ error: 'Failed to delete employee' });
  }
});

module.exports = router;
