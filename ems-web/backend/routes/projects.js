const express = require('express');

const router = express.Router();
const sampleProjects = [
  { project_id: 1, project_name: 'Website Redesign', dept_id: 1 },
  { project_id: 2, project_name: 'Onboarding Revamp', dept_id: 2 },
];

router.get('/', async (req, res) => {
  res.json(sampleProjects);
});

module.exports = router;
