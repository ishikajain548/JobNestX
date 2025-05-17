# 💼 JobNestX - Job Portal Web Application

JobNestX is a dynamic job portal web application built using 
**JSP**, **Servlets**, and **MySQL**. It allows job seekers to apply for jobs, recruiters to post/manage jobs, and administrators to manage the overall platform.

---

## 📚 Table of Contents


- [🚀 Features](#-features)
- [🛠️ Tech Stack](#️-tech-stack)
- [📁 Project Structure](#-project-structure)
- [📦 Database Tables](#database-tables)
- [⚙️ Installation and Setup](#installation-and-setup)
- [🔗 Accessing the Project](#-accessing-the-project)
- [📸 Screenshots](#-screenshots)
- [🔮 Future Improvements](#future-improvements)
- [👩‍💻 Author](#author)

------

## 🚀 Features

### 👤 Job Seekers
- Register and log in
- View job listings
- Apply for jobs
- Track application status

### 🧑‍💼 Recruiters
- Register and wait for admin approval
- Post new jobs
- View and manage applicants

### 🛡️ Admin
- Dashboard for admin controls
- Approve recruiters and jobs
- Manage recruiters and job postings
- View and respond to contact form messages
- Mark messages as read or delete them

### 🌐 General
- Contact form (data saved in DB)
- About Us page
- Responsive design using Bootstrap 5

---

## 🛠️ Tech Stack

| Category    | Technology               |
|-------------|--------------------------|
| Frontend    | HTML5, CSS3, Bootstrap 5 |
| Backend     | JSP, Servlets (Java EE)  |
| Database    | MySQL (JDBC Connection)  |
| Server      | Apache Tomcat            |
| IDE         | NetBeans 8.2             |

---

## 📁 Project Structure

JobPortal/
├── WEB-INF/
| ├── web.xml
├── Web Pages/
│ ├── admin/ 
│ ├── jobseeker/ 
│ ├── recruiter/
│ ├── uploads/ 
│ ├── images/ 
│ ├── index.jsp
│ ├── about.jsp
│ ├── contact.jsp
├── Source Packages/
│ └── servlets/ 
├── db/
│ └── schema.sql
├── screenshots/
│ └── *.png
└── README.md
---

## Database Tables
- `users` - Stores all user accounts (admin, recruiter, job seeker)
- `jobs` - Job postings by recruiters
- `applications` - Job applications submitted by job seekers
- `contact_messages` - Messages submitted through contact form

---

## ⚙️ Installation and Setup

1. **Clone the Repository**

2. **Import into IDE**  
   Open your Java IDE (e.g., NetBeans) and import the project.

3. **Database Setup**
   - Make sure MySQL is running.
   - Create the database:
     ```sql
     CREATE DATABASE job_portal;
     ```
   - Import the schema using the provided SQL file:
     Run commands from `db/schema.sql`

4. **Update DB Configuration**  
   In your `DBConnection.java`:
   ```java
   String url = "jdbc:mysql://localhost:3308/job_portal";
   String username = "root";
   String password = "root";

5.Run the project on a Java EE server (like Apache Tomcat).

---

🔗 Accessing the Project

Once the server is running, visit the project in your browser:

http://localhost:8080/JobPortal/

> 📌 **Note:** If your server runs on a different port (e.g., 7777), adjust the URL accordingly:
http://localhost:7777/JobPortal/

Also, make sure the context path (e.g., `JobPortal`) matches your deployment settings.

---

## 📸 Screenshots

### 🔹 Home Page
screenshots/homePage.png
screenshots/homePage2.png

### 🔹 Job Seeker Dashboard
screenshots/jobSeeker-Dashboard.png

### 🔹 Recruiter Dashboard
screenshots/recruiterDashboard.png

### 🔹 Admin Panel
screenshots/adminDashboard.png

### 🔹 About Us
screenshots/aboutUs.png
screenshots/aboutUs2.png

### 🔹 Contact
screenshots/contact.png

---

🔮 Future Improvements
- Add password encryption for user security
- Implement email notifications for recruiter approval and   job applications
- Add pagination and search filters for job listings


👩‍💻 Author
- Developed by Ishika Jain

---

Thank you for using JobNestX!

