CREATE TABLE User_table (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50),
    Password_user VARCHAR(50),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(50),
    DateOfBirth DATE
);
CREATE TABLE Address (
    AddressID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StreetAddress VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Manufacturer VARCHAR(50),
    Category VARCHAR(50)
);
CREATE TABLE Cart (
    CartID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ProductID INT,
    Quantity INT,
    AddedToCartDate TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Command (
    CommandID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ProductID INT,
    Quantity INT,
    OrderDate TIMESTAMP,
    Status ENUM('Processing', 'Shipped', 'Delivered'),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CommandID INT,
    TotalAmount DECIMAL(10, 2),
    InvoiceDate TIMESTAMP,
    PaymentMethodID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (CommandID) REFERENCES Command(CommandID),
    FOREIGN KEY (PaymentMethodID) REFERENCES Payment(PaymentID)
);
CREATE TABLE Rate (
    RateID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    UserID INT,
    Rating INT,
    Review TEXT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PaymentType VARCHAR(50),
    AccountNumber VARCHAR(50)
);