const express = require('express');
const pool = require('../db');

const router = express.Router();

// GET all employees
router.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT 
        e.emp_id,
        e.first_name,
        e.last_name,
        e.email,
        e.salary,
        d.dept_name,
        j.job_title
      FROM employee e
      LEFT JOIN department d ON e.dept_id = d.dept_id
      LEFT JOIN job j ON e.job_id = j.job_id
      ORDER BY e.emp_id
    `);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching employees:', err);
    res.status(500).json({ error: 'Failed to fetch employees' });
  }
});

// POST new employee
router.post('/', async (req, res) => {
  try {
    const { first_name, last_name, email, dept_name, job_title, salary } = req.body;

    // Validate required fields
    if (!first_name || !last_name) {
      return res.status(400).json({ error: 'First name and last name are required' });
    }

    // Get or create department
    let dept_id = null;
    if (dept_name) {
      const [deptRows] = await pool.query('SELECT dept_id FROM department WHERE dept_name = ?', [dept_name]);
      if (deptRows.length > 0) {
        dept_id = deptRows[0].dept_id;
      } else {
        const [deptResult] = await pool.query('INSERT INTO department (dept_name) VALUES (?)', [dept_name]);
        dept_id = deptResult.insertId;
      }
    }

    // Get or create job
    let job_id = null;
    if (job_title) {
      const [jobRows] = await pool.query('SELECT job_id FROM job WHERE job_title = ?', [job_title]);
      if (jobRows.length > 0) {
        job_id = jobRows[0].job_id;
      } else {
        const [jobResult] = await pool.query('INSERT INTO job (job_title) VALUES (?)', [job_title]);
        job_id = jobResult.insertId;
      }
    }

    // Insert employee
    const [result] = await pool.query(
      'INSERT INTO employee (first_name, last_name, email, dept_id, job_id, salary) VALUES (?, ?, ?, ?, ?, ?)',
      [first_name, last_name, email || null, dept_id, job_id, salary || null]
    );

    res.status(201).json({ emp_id: result.insertId, message: 'Employee added successfully' });
  } catch (err) {
    console.error('Error adding employee:', err);
    res.status(500).json({ error: 'Failed to add employee' });
  }
});

// PUT update employee
router.put('/:id', async (req, res) => {
  try {
    const empId = req.params.id;
    const { first_name, last_name, email, dept_name, job_title, salary } = req.body;

    // Validate required fields
    if (!first_name || !last_name) {
      return res.status(400).json({ error: 'First name and last name are required' });
    }

    // Get or create department
    let dept_id = null;
    if (dept_name) {
      const [deptRows] = await pool.query('SELECT dept_id FROM department WHERE dept_name = ?', [dept_name]);
      if (deptRows.length > 0) {
        dept_id = deptRows[0].dept_id;
      } else {
        const [deptResult] = await pool.query('INSERT INTO department (dept_name) VALUES (?)', [dept_name]);
        dept_id = deptResult.insertId;
      }
    }

    // Get or create job
    let job_id = null;
    if (job_title) {
      const [jobRows] = await pool.query('SELECT job_id FROM job WHERE job_title = ?', [job_title]);
      if (jobRows.length > 0) {
        job_id = jobRows[0].job_id;
      } else {
        const [jobResult] = await pool.query('INSERT INTO job (job_title) VALUES (?)', [job_title]);
        job_id = jobResult.insertId;
      }
    }

    // Update employee
    await pool.query(
      'UPDATE employee SET first_name = ?, last_name = ?, email = ?, dept_id = ?, job_id = ?, salary = ? WHERE emp_id = ?',
      [first_name, last_name, email || null, dept_id, job_id, salary || null, empId]
    );

    res.json({ message: 'Employee updated successfully' });
  } catch (err) {
    console.error('Error updating employee:', err);
    res.status(500).json({ error: 'Failed to update employee' });
  }
});

// DELETE employee
router.delete('/:id', async (req, res) => {
  try {
    const empId = req.params.id;
    await pool.query('DELETE FROM employee WHERE emp_id = ?', [empId]);
    res.json({ message: 'Employee deleted successfully' });
  } catch (err) {
    console.error('Error deleting employee:', err);
    res.status(500).json({ error: 'Failed to delete employee' });
  }
});

module.exports = router;
