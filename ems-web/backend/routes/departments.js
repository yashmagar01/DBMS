const express = require('express');

const router = express.Router();
const sampleDepartments = [
  { dept_id: 1, dept_name: 'Engineering' },
  { dept_id: 2, dept_name: 'Human Resources' },
];

router.get('/', async (req, res) => {
  res.json(sampleDepartments);
});

module.exports = router;
