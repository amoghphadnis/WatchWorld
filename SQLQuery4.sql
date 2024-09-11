CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

-- Insert sample data into Categories table
INSERT INTO Categories (CategoryName) VALUES ('Luxury Watches');
INSERT INTO Categories (CategoryName) VALUES ('Sports Watches');
INSERT INTO Categories (CategoryName) VALUES ('Smartwatches');
INSERT INTO Categories (CategoryName) VALUES ('Kids Watches');

CREATE TABLE Watches (
    WatchID INT PRIMARY KEY IDENTITY(1,1),
    WatchName NVARCHAR(100) NOT NULL,
    WatchBrand NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    WatchPrice DECIMAL(10, 2) NOT NULL,
    ImageUrl NVARCHAR(255) NOT NULL
);

-- Insert sample data into Watches table
INSERT INTO Watches (WatchName, WatchBrand, CategoryID, WatchPrice, ImageUrl) 
VALUES 
('Classic Leather Watch', 'Brand A', 1, 120.00, '/images/classic_leather_watch.jpg'),
('Digital Sports Watch', 'Brand B', 2, 85.00, '/images/digital_sports_watch.jpg'),
('Luxury Gold Watch', 'Brand C', 1, 350.00, '/images/luxury_gold_watch.jpg'),
('Stainless Steel Watch', 'Brand D', 2, 150.00, '/images/stainless_steel_watch.jpg'),
('Smartwatch Pro', 'Brand E', 3, 200.00, '/images/smartwatch_pro.jpg'),
('Vintage Pocket Watch', 'Brand F', 1, 180.00, '/images/vintage_pocket_watch.jpg'),
('Ladies Bracelet Watch', 'Brand G', 1, 110.00, '/images/ladies_bracelet_watch.jpg'),
('Solar Powered Watch', 'Brand H', 3, 140.00, '/images/solar_powered_watch.jpg'),
('Chronograph Watch', 'Brand I', 2, 220.00, '/images/chronograph_watch.jpg'),
('Kids Cartoon Watch', 'Brand J', 4, 35.00, '/images/kids_cartoon_watch.jpg');

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Admin', 'Customer'))
);

-- Insert sample data into Users table
INSERT INTO Users (FirstName, LastName, Email, Password, Role) 
VALUES 
('Amogh', 'Phadnis', 'amogh.phadnis@example.com', 'hashedpassword1', 'Admin'),
('Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', 'Customer');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into Orders table
INSERT INTO Orders (UserID, OrderDate, TotalAmount) 
VALUES 
(2, GETDATE(), 370.00),
(2, GETDATE(), 85.00);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    WatchID INT FOREIGN KEY REFERENCES Watches(WatchID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

-- Insert sample data into OrderDetails table
INSERT INTO OrderDetails (OrderID, WatchID, Quantity, UnitPrice) 
VALUES 
(1, 1, 1, 120.00),
(1, 7, 1, 110.00),
(2, 2, 1, 85.00);


