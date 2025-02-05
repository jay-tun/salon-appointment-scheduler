# Salon Appointment Scheduler  

This is a **Bash and PostgreSQL-based** project for scheduling salon appointments, created as part of the FreeCodeCamp Relational Database Certification.  

## 📂 Project Files
- **salon.sql** – Contains the PostgreSQL database schema and initial data setup.
- **salon.sh** – A Bash script that interacts with the database, allowing customers to book appointments.

## 🛠️ Setup Instructions
1. Clone this repository:  
   ```
   git clone git@github.com:jay-tun/salon-appointment-scheduler.git
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

