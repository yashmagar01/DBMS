// backend/server.js
const express = require('express');
const cors = require('cors');
const employeesRouter = require('./routes/employees');
const departmentsRouter = require('./routes/departments');
const projectsRouter = require('./routes/projects');

require('dotenv').config();
const app = express();
app.use(cors());
app.use(express.json());
app.use('/api/employees', employeesRouter);
app.use('/api/departments', departmentsRouter);
app.use('/api/projects', projectsRouter);

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server listening on ${port}`));
