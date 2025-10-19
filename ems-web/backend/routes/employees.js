const express = require('express');

const router = express.Router();
const sampleEmployees = [
  {
    emp_id: 1,
    first_name: 'Alice',
    last_name: 'Johnson',
    dept_name: 'Engineering',
    job_title: 'Developer',
    salary: 80000,
  },
];

router.get('/', async (req, res) => {
  res.json(sampleEmployees);
});

module.exports = router;
