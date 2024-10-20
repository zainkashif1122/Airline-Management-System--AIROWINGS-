# Airline-Management-System-AIROWINGS
Take a look at my Airline Management System! ✈️ This comprehensive database project handles flights, passengers, and more to streamline airline operations.

## Table of Contents
1. [Introduction](#introduction)
2. [Project Overview](#project-overview)
3. [Installation](#installation)
4. [File Structure](#file-structure)
5. [Technologies Used](#technologies-used)
6. [Entities and Attributes](#entities-and-attributes)
7. [Relationships](#relationships)
8. [Entity Relationship Diagram](#entity-relationship-diagram)
9. [Relational Schema](#relational-schema)
10. [SQL Scripts](#sql-scripts)
11. [Future Improvements](#future-improvements)
12. [Feedback and Support](#feedback-and-support)
13. [Stay Tuned](#stay-tuned)

## Introduction

Welcome to the AIROWINGS Airline Management System project! This project is designed to manage and streamline airline operations, including aircraft management, flight scheduling, passenger bookings, crew assignments, and maintenance scheduling.

## Project Overview

The AIROWINGS system is a comprehensive database solution for managing various aspects of airline operations. It includes functionalities for:
- Aircraft and flight management
- Passenger and baggage handling
- Crew assignments and scheduling
- Ticketing and payment processing
- Maintenance scheduling and record-keeping

## Installation

To set up the AIROWINGS database on your local system, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/zainkashif1122/airowings-dbms.git

2. **Navigate to the project directory:**
   ```bash
   cd airowings-dbms

3. **Create and set up the database:**
   ```bash
   mysql -u zainkashif1122 -p
   CREATE DATABASE AIROWINGS;
   USE AIROWINGS;

4. Run the SQL scripts to create tables and insert data:
   ```bash
   SOURCE scripts/schema.sql;

## File Structure

Here is the structure of the project:

- [`script.sql`](Script.sql): The SQL file containing all SQL queries.
- [`wordDocument.docx`](WordDocument.docx): The DOCX file with detailed information about the project.
- [`mySQLRelationalSchemaPNG.png`](MySQLRelationSchemaPNG.png): The PNG file containing the relational schema generated by MySQL Workbench.
- [`mySQLRelationalSchemaFile.mwb`](MySQLRelationalSchemaFile.mwb): The MWB file that can be opened in MySQL Workbench.
- [`entityRelationalDiagram.png`](EntityRelationalDiagram.png): The file containing the Entity-Relationship Diagram (ERD) of the project.
- [`relationalSchema.png`](RelationalSchema.png): The file with the relational schema created manually.

## Technologies Used

- **Languages**:
  - SQL: For defining and manipulating the database schema and data.

- **Software**:
  - MySQL Workbench: For writing and executing SQL queries, and visualizing the database schema.
  - XAMPP Control Panel: For managing the MySQL database server.
  - ERDPlus: For creating Entity-Relationship Diagrams (ERDs) and relational schemas manually.

## Entities and Attributes

Detailed information about entities and their attributes is included in the attached [`Word document`](WordDocument.docx).

## Relationships

Detailed relationships between entities are outlined in the attached [`Word document`](WordDocument.docx).

## Entity Relationship Diagram

Refer to the [`ERD.png`](EntityRelationalDiagram.png) file for the visual representation of the database schema.

## Relational Schema

The relational schema is defined in the SQL script file [`script.sql`](Script.sql). This file includes table definitions and foreign key constraints.

For visual representations of the relational schema, you can access the following files:
- [`MySQLRSPNG.png`](MySQLRelationSchemaPNG.png): Generated by MySQL Workbench.
- [`MySQLRSFile.mwb`](MySQLRelationalSchemaFile.mwb): The MySQL Workbench file that you can open for visual schema design.
- [`RSPNG.png`](RelationalSchema.png): Manually created visual representation of the relational schema.

## SQL Scripts

### Database Creation and Table Definition

- Run the SQL script [`script.sql`](Script.sql) to create the database schema:

  ```sql
  -- Create the database
  CREATE DATABASE AIROWINGS;
  USE AIROWINGS;

  -- Create tables and set up relationships
  SOURCE scripts/schema.sql;

### Sample Data Insertion
  
- Insert sample data using the provided SQL file (if applicable):

  ```sql
  SOURCE scripts/data.sql;

> **Note**: Sample data is also already inserted in the tables; you can directly run the queries from [`script.sql`](Script.sql).

## Future Improvements

- **User Interface**: Develop a user-friendly graphical interface for database management.
- **Advanced Analytics**: Implement analytics for flight operations and maintenance insights.
- **Real-Time Features**: Add real-time flight tracking and passenger management capabilities.

## Feedback and Support

For any questions, issues, or support, please open an issue on the [`GitHub Issues page`](https://github.com/zainkashif1122/airowings-dbms/issues) or contact here **`zainkashif1122@gmail.com`**.

## Stay Tuned

Follow this repository to stay updated with new features and improvements. Check back regularly for the latest developments.
