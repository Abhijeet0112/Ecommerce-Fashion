# Ecommerce-Fashion

Ecommerce-Fashion is a **web-based fashion store** project developed using **JSP, Servlets, and MySQL**. This project primarily focuses on **CRUD (Create, Read, Update, Delete) operations** for managing products and product reviews.  

## Table of Contents  

- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Project Structure](#project-structure)  
- [Contributing](#contributing)  

## Features  

- **Product Management:**  
  - Add new fashion products (**Create**)  
  - View a list of available products (**Read**)  
  - Edit product details (**Update**)  
  - Remove products from inventory (**Delete**)  

- **Product Reviews:**  
  - Add a review for a product (**Create**)  
  - View product reviews (**Read**)  
  - Update a review (**Update**)  
  - Delete a review (**Delete**)  

> **Note:** User authentication and admin panel functionalities are planned for future updates.  

## Prerequisites  

Before running the project, ensure you have the following installed:  

- [Java Development Kit (JDK) 8 or higher](https://www.oracle.com/java/technologies/javase-downloads.html)  
- [Apache Tomcat 9 or higher](https://tomcat.apache.org/download-90.cgi)  
- [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)  
- [Eclipse IDE for Enterprise Java Developers](https://www.eclipse.org/downloads/packages/)  

## Installation  

1. **Clone the Repository**  

   ```bash
   git clone https://github.com/Abhijeet0112/Ecommerce-Fashion.git
   cd Ecommerce-Fashion
   ```

2. **Import the Project into Eclipse**  

   - Open **Eclipse IDE**.  
   - Go to **File** > **Import**.  
   - Select **Existing Projects into Workspace** under **General**.  
   - Browse to the cloned repository folder and select it.  
   - Click **Finish**.  

3. **Set Up the MySQL Database**  

   - Start your **MySQL server**.  
   - Create a new database named `ecommerce_fashion`:  

     ```sql
     CREATE DATABASE ecommerce_fashion;
     ```

   - Execute the provided SQL script (found in `src/main/resources/sql`) to create tables and insert initial data.  

4. **Configure Database Connection**  

   - Open the `db.properties` file in `src/main/resources`.  
   - Update the following details with your **MySQL credentials**:  

     ```properties
     db.url=jdbc:mysql://localhost:3306/ecommerce_fashion
     db.username=your_mysql_username
     db.password=your_mysql_password
     ```

5. **Deploy the Project to Tomcat**  

   - Ensure **Apache Tomcat** is added to Eclipse.  
   - Right-click on the project in **Project Explorer**.  
   - Select **Run As** > **Run on Server**.  
   - Choose **Apache Tomcat** and click **Finish**.  

## Usage  

Once the application is running:  

- **Product Management:**  
  - Navigate to `http://localhost:8080/Ecommerce-Fashion/products`.  
  - Add, view, edit, or delete products.  

- **Product Reviews:**  
  - Navigate to `http://localhost:8080/Ecommerce-Fashion/reviews`.  
  - Add, edit, or delete reviews for specific products.  

## Project Structure  

```
Ecommerce-Fashion/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── ecommerce/
│   │   │           ├── controllers/   # Servlets handling requests
│   │   │           ├── dao/           # Database operations
│   │   │           ├── models/        # Java classes for Products & Reviews
│   │   │           ├── services/      # Business logic
│   │   │
│   │   ├── webapp/
│   │   │   ├── products.jsp           # Product listing
│   │   │   ├── addProduct.jsp         # Form to add products
│   │   │   ├── editProduct.jsp        # Form to update products
│   │   │   ├── reviews.jsp            # Product reviews
│   │   │   ├── addReview.jsp          # Form to add reviews
│   │   │   ├── editReview.jsp         # Form to update reviews
│   │   │
│   ├── resources/
│   │   ├── sql/                       # SQL scripts for database setup
│   │   ├── db.properties               # Database configuration
│
├── pom.xml                             # Dependencies for Maven
├── README.md                           # Project documentation
```

## Contributing  

Contributions are welcome! To contribute:  

1. Fork the repository.  
2. Create a new branch (`git checkout -b feature-name`).  
3. Commit changes (`git commit -m "Add new feature"`).  
4. Push to the branch (`git push origin feature-name`).  
5. Open a Pull Request.  

---
