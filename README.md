# Salon Appointment Scheduler  

This is a **Bash and PostgreSQL-based** project for scheduling salon appointments, created as part of the FreeCodeCamp Relational Database Certification.  

## 📌 Features
- Customers can book appointments for different salon services.
- If a customer is new, their details are saved automatically.
- Services and appointments are managed using a PostgreSQL database.
- The script ensures valid inputs and prevents duplicate customer entries.

## 📂 Project Files
- **salon.sql** – Contains the PostgreSQL database schema and initial data setup.
- **salon.sh** – A Bash script that interacts with the database, allowing customers to book appointments.

## 🛠️ Setup Instructions
1. Clone this repository:  
   ```
   git clone git@github.com:YOUR_GITHUB_USERNAME/salon-appointment-scheduler.git
   cd salon-appointment-scheduler
   ```
2. Import the database schema:
   ```
   psql -U freecodecamp -d salon -f salon.sql
   ```
3. Make the script executable:
   ```
   chmod +x salon.sh
   ```
4. Run the script:
   ```
   ./salon.sh
   ```

