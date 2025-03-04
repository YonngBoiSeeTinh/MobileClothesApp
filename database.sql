
--CREATE DATABASE DBClothesShop
--GO

-- Bảng Categories

CREATE TABLE Categories (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
	image VARBINARY(MAX),
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO


-- Bảng Products
CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    price DECIMAL(18, 2) NOT NULL,
	promo int default  0,
	unit NVARCHAR(50),
	brand NVARCHAR(50) NULL,
	sold INT default  0,
	rate INT default  0,
	image VARBINARY(MAX),
    category_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);
GO

-- Bảng Colors

CREATE TABLE ColorSizes (
    id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL,
    color NVARCHAR(50) NOT NULL,
    size NVARCHAR(10) NOT NULL,
	code NVARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
	price DECIMAL(18, 2) ,
    FOREIGN KEY (product_id) REFERENCES Products(id),
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

GO
-- Bảng Users
CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    account INT,
    phone NVARCHAR(15),
    address NVARCHAR(255),
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
	image  VARBINARY(MAX),
	role INT,
	total_buy  DECIMAL(18, 2) DEFAULT 0
);


-- Bảng Roles
CREATE TABLE Roles (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
	promo INT,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
);

GO
GO
-- Bảng Account
CREATE TABLE Accounts (
    id INT PRIMARY KEY IDENTITY(1,1),
	user_id INT,
    email NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
);

-- Bảng Orders
CREATE TABLE Orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NULL,
    total_price DECIMAL(18, 2) NOT NULL,
    status NVARCHAR(50) DEFAULT 'Chờ xác nhận',
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
	name NVARCHAR(255) NULL,
	phone NVARCHAR(15) NULL,
    address NVARCHAR(255) NULL,
);
GO

-- Bảng OrderDetails
CREATE TABLE OrderDetails (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    color NVARCHAR(20) NULL,
	size NVARCHAR(20) NULL,
    quantity INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
	productId INT,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Cart (
    id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    user_id INT ,
	color NVARCHAR(20) NULL,
	size NVARCHAR(20) NULL,
    price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Bảng Promotion
CREATE TABLE Promotion (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    value DECIMAL(18, 2) NOT NULL,
	created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
	end_at DATETIME
);
GO
