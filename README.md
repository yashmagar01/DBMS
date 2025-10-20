# 🚀 Employee Management System (EMS) - Cloud Deployment Ready

A **production-ready, full-stack Employee Management System** with cloud database integration, user authentication, and role-based access control.

## ✨ Features

### 🔐 **Authentication & Security**
- **User Registration/Login** with bcrypt password hashing
- **JWT-based Authentication** with 24-hour token expiration
- **Role-based Access Control** (Employee, HR, Admin)
- **User-scoped Data Isolation** - each user sees only their data

### 🎨 **Modern UI/UX**
- **Responsive Bootstrap 5** design
- **Dark Mode Toggle** with persistent preferences
- **Real-time Statistics Dashboard**
- **Advanced Search & Filtering**
- **Sortable Columns** with visual indicators
- **Toast Notifications** for user feedback
- **Department Color-coded Badges**

### 📊 **Database & API**
- **Multi-user Architecture** with shared database
- **RESTful API** with complete CRUD operations
- **MySQL Integration** with connection pooling
- **Cloud Database Ready** (PlanetScale, Railway, Render)

### 🚀 **Deployment Ready**
- **Vercel** frontend deployment configuration
- **Render** backend deployment configuration
- **Environment-based Configuration**
- **CORS handling** for cross-origin requests

---

## 🛠️ Tech Stack

### **Backend**
- **Node.js** + **Express.js** (REST API)
- **MySQL2** (Database driver with promises)
- **bcrypt** (Password hashing)
- **jsonwebtoken** (JWT authentication)
- **CORS** (Cross-origin resource sharing)

### **Frontend**
- **HTML5** + **CSS3** + **Vanilla JavaScript**
- **Bootstrap 5** (Responsive UI framework)
- **Bootstrap Icons** (Modern icon library)

### **Database**
- **MySQL 8.0+** (Relational database)
- **Cloud Compatible** (PlanetScale, Railway, Render)

---

## 📁 Project Structure

```
ems-web/
├── backend/
│   ├── server.js              # Express server with auth middleware
│   ├── db.js                  # Database connection pool
│   ├── routes/
│   │   ├── auth.js           # Signup/login endpoints
│   │   ├── employees.js      # User-scoped CRUD operations
│   │   ├── departments.js    # Department management
│   │   └── projects.js       # Project management
│   ├── utils/
│   │   └── authMiddleware.js # JWT validation & role checking
│   ├── package.json          # Dependencies & scripts
│   └── test-db.js            # Database connection test
├── frontend/
│   ├── index.html            # Main dashboard
│   ├── login.html            # User login page
│   ├── signup.html           # User registration page
│   ├── css/
│   │   └── style.css         # Custom styling & dark mode
│   └── js/
│       └── app.js            # Frontend logic & API integration
├── cloud_db_setup.sql        # Cloud database schema
├── .env.example             # Environment variables template
├── vercel.json              # Vercel deployment config
├── render.yaml              # Render deployment config
└── README.md                # This file
```

---

## 🚀 Quick Start (Local Development)

### **1. Database Setup**
```bash
# Run in MySQL Workbench or CLI
mysql -u root -p < cloud_db_setup.sql
```

### **2. Backend Setup**
```bash
cd backend
npm install
cp ../.env.example .env  # Configure your database credentials
npm start
# Server runs on http://localhost:3000
```

### **3. Frontend Access**
```bash
# Open in browser (no build required)
open frontend/index.html
# Or serve with any static server
```

### **4. Create Account & Login**
- Visit `login.html` or `signup.html`
- Use demo accounts:
  - **Admin**: admin@ems.com / Admin@123
  - **HR**: hr@ems.com / Hr@123
  - **Employee**: employee@ems.com / Employee@123

---

## ☁️ Cloud Deployment

### **Database (Choose One)**

#### **Option 1: PlanetScale**
```bash
# Connect to PlanetScale CLI
pscale connect ems-cloud --org your-org
# Run the cloud_db_setup.sql script in PlanetScale dashboard
```

#### **Option 2: Railway**
```bash
# Create MySQL database in Railway dashboard
# Run cloud_db_setup.sql in Railway database console
```

#### **Option 3: Render PostgreSQL** (Alternative)
```bash
# Use PostgreSQL instead of MySQL
# Update .env with PostgreSQL credentials
# Modify queries in routes/ files
```

### **Backend Deployment (Render)**

1. **Connect Repository**
   ```bash
   git init
   git add .
   git commit -m "Deploy EMS to cloud"
   git remote add origin https://github.com/yourusername/ems-cloud.git
   git push -u origin main
   ```

2. **Deploy to Render**
   ```bash
   # In Render dashboard:
   # 1. New Service → Web Service
   # 2. Connect GitHub repo
   # 3. Set Runtime: Node.js
   # 4. Build Command: cd backend && npm install
   # 5. Start Command: cd backend && npm start
   # 6. Add Environment Variables (from .env.example)
   ```

3. **Environment Variables for Render**
   ```
   NODE_ENV=production
   DB_HOST=your-db-host.railway.app
   DB_USER=your-db-user
   DB_PASS=your-db-password
   DB_NAME=ems_cloud
   JWT_SECRET=your-secret-key
   FRONTEND_URL=https://your-frontend-domain.vercel.app
   ```

### **Frontend Deployment (Vercel)**

1. **Deploy Frontend**
   ```bash
   # Install Vercel CLI
   npm i -g vercel

   # Deploy
   vercel --prod
   ```

2. **Update API URLs**
   - Replace `your-backend-domain.onrender.com` in `frontend/js/app.js`
   - Update CORS origins in `backend/server.js`

---

## 🔧 Environment Configuration

### **Local Development (.env)**
```env
DB_HOST=localhost
DB_USER=root
DB_PASS=your-password
DB_NAME=ems_cloud
JWT_SECRET=your-secret-key
PORT=3000
NODE_ENV=development
```

### **Production (.env.example)**
```env
DB_HOST=your-db-host.planetscale.com
DB_USER=your-db-user
DB_PASS=your-db-password
DB_NAME=ems_cloud
JWT_SECRET=your-production-secret
PORT=10000
NODE_ENV=production
FRONTEND_URL=https://your-frontend.vercel.app
```

---

## 🔐 Authentication Flow

### **1. User Registration**
```javascript
POST /api/auth/signup
{
  "name": "John Doe",
  "email": "john@company.com",
  "password": "SecurePass123",
  "role": "employee"
}
```

### **2. User Login**
```javascript
POST /api/auth/login
{
  "email": "john@company.com",
  "password": "SecurePass123"
}
// Returns: { token: "jwt-token", user: { user_id, name, email, role } }
```

### **3. Protected API Access**
```javascript
GET /api/employees
Authorization: Bearer jwt-token
// Returns: User's employees only (scoped by user_id_fk)
```

---

## 📊 Database Architecture

### **Multi-User Design**
- **Shared Database**: One database for all users
- **User Isolation**: Each user sees only their data via `user_id_fk`
- **Automatic Cleanup**: CASCADE deletes when user is removed

### **Tables Structure**
```sql
users (user_id, name, email, password_hash, role)
employees (emp_id, first_name, last_name, email, dept_id, job_id, salary, user_id_fk)
departments (dept_id, dept_name, user_id_fk)
jobs (job_id, job_title, user_id_fk)
```

---

## 🎯 API Endpoints

### **Authentication**
- `POST /api/auth/signup` - Create new user account
- `POST /api/auth/login` - User login (returns JWT)

### **Employees (Protected)**
- `GET /api/employees` - Get user's employees
- `POST /api/employees` - Create new employee
- `PUT /api/employees/:id` - Update employee
- `DELETE /api/employees/:id` - Delete employee

### **Departments & Jobs**
- Similar CRUD operations, scoped to user

---

## 🔒 Security Features

### **Authentication**
- **bcrypt** password hashing (salt rounds: 10)
- **JWT tokens** with 24-hour expiration
- **Token validation** middleware on protected routes

### **Authorization**
- **Role-based Access**: Employee, HR, Admin roles
- **User Data Isolation**: Users see only their data
- **Input Validation**: Server-side validation for all inputs

### **Production Security**
- **CORS Configuration**: Controlled cross-origin access
- **Environment Variables**: No hardcoded secrets
- **SQL Injection Prevention**: Parameterized queries
- **Error Handling**: No sensitive data in error responses

---

## 🚀 Deployment Checklist

### **✅ Pre-deployment**
- [ ] Database setup completed (cloud_db_setup.sql)
- [ ] Environment variables configured
- [ ] Dependencies installed (`npm install`)
- [ ] Local testing completed

### **✅ Backend Deployment (Render)**
- [ ] Git repository connected
- [ ] Environment variables set in Render dashboard
- [ ] Database connection verified
- [ ] Health check endpoint working (`/health`)

### **✅ Frontend Deployment (Vercel)**
- [ ] Vercel account connected
- [ ] Build settings configured (vercel.json)
- [ ] API URLs updated for production
- [ ] Static assets deployed

### **✅ Post-deployment**
- [ ] Test signup/login functionality
- [ ] Verify CRUD operations work
- [ ] Check responsive design on mobile
- [ ] Validate dark mode functionality
- [ ] Confirm user data isolation

---

## 🐛 Troubleshooting

### **Common Issues**

**500 Internal Server Error**
```bash
# Check backend console for detailed error
# Common causes:
# - Database connection issues
# - Missing environment variables
# - SQL syntax errors
```

**401 Unauthorized**
```bash
# Token expired or invalid
# Clear localStorage and login again
localStorage.clear();
window.location.href = 'login.html';
```

**CORS Errors**
```bash
# Update FRONTEND_URL in backend .env
# Add your Vercel domain to CORS origins
```

**Database Connection Issues**
```bash
# Test connection locally first
cd backend && node test-db.js

# Check environment variables match database credentials
```

---

## 📈 Performance & Scalability

### **Optimizations Implemented**
- **Connection Pooling**: MySQL2 pool for database connections
- **Efficient Queries**: JOIN queries for related data
- **Client-side Caching**: localStorage for user sessions
- **Lazy Loading**: Table content loads dynamically

### **Scalability Features**
- **Stateless Backend**: No server-side sessions
- **Database Indexing**: Optimized for large datasets
- **CDN Ready**: Static assets served from CDN
- **Horizontal Scaling**: Backend can be deployed on multiple instances

---

## 🎨 UI/UX Features

### **Dashboard**
- **Real-time Statistics**: Employee count, average salary, departments
- **Search & Filter**: Multi-field search across employees
- **Sortable Columns**: Click headers to sort data
- **Responsive Design**: Works on all device sizes

### **User Experience**
- **Loading States**: Visual feedback during API calls
- **Error Handling**: User-friendly error messages
- **Form Validation**: Real-time validation feedback
- **Accessibility**: ARIA labels and keyboard navigation

### **Authentication**
- **Secure Forms**: Password requirements and validation
- **Session Management**: Automatic token refresh
- **Logout Functionality**: Secure session cleanup

---

## 🔮 Future Enhancements

### **Phase 2 Features**
- **Email Notifications**: Welcome emails, password resets
- **Advanced Analytics**: Charts and graphs for employee data
- **File Uploads**: Employee photos, document attachments
- **Audit Logging**: Track all data changes
- **API Rate Limiting**: Prevent abuse
- **Two-Factor Authentication**: Enhanced security

### **Phase 3 Features**
- **Mobile App**: React Native companion app
- **Real-time Updates**: WebSocket integration
- **Advanced Reporting**: Custom report generation
- **Multi-language Support**: Internationalization
- **Advanced Permissions**: Granular role permissions

---

## 📞 Support & Documentation

### **Getting Help**
1. Check this README for common issues
2. Review deployment logs in Render/Vercel dashboards
3. Test database connectivity with `test-db.js`
4. Verify environment variables are correctly set

### **API Documentation**
- **Authentication**: `/api/auth/*` endpoints
- **Employees**: `/api/employees` CRUD operations
- **Error Codes**: Standard HTTP status codes
- **Response Format**: JSON with consistent structure

---

## 🏆 Project Status

**✅ FULLY IMPLEMENTED & DEPLOYMENT READY**

- **Authentication System**: ✅ Complete
- **User Data Isolation**: ✅ Implemented
- **Cloud Database Ready**: ✅ Configured
- **Frontend Enhancement**: ✅ Advanced UI
- **Deployment Configs**: ✅ Ready for production
- **Security Measures**: ✅ Production-grade
- **Documentation**: ✅ Comprehensive

**Ready for immediate deployment to production! 🚀**

---

## 📝 Version History

- **v2.0.0**: Cloud deployment with authentication (Current)
- **v1.0.0**: Local development with basic CRUD
- **v0.1.0**: Initial prototype with sample data
