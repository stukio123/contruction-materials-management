CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;
GO

-- Tạo bảng Customers để lưu thông tin khách hàng
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactInfo VARCHAR(150),
    Address VARCHAR(150),
    Email VARCHAR(100),
    TaxID VARCHAR(50)
);

-- Tạo bảng Items để lưu thông tin thiết bị và vật tư
CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    ItemType VARCHAR(50),  -- "Equipment" hoặc "Supply"
    Specifications VARCHAR(255)
);

-- Tạo bảng SalesInvoice để lưu thông tin hóa đơn bán hàng
CREATE TABLE SalesInvoice (
    InvoiceID INT PRIMARY KEY,
    InvoiceDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Tạo bảng InvoiceItems để lưu chi tiết các mặt hàng trong hóa đơn
CREATE TABLE InvoiceItems (
    InvoiceItemID INT PRIMARY KEY,
    InvoiceID INT,
    ItemID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (InvoiceID) REFERENCES SalesInvoice(InvoiceID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Tạo bảng ItemOrigins để lưu thông tin xuất xứ và giá thành
CREATE TABLE ItemOrigins (
    OriginID INT PRIMARY KEY,
    ItemID INT,
    Origin VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Tạo bảng ItemTypes để lưu loại vật tư và đơn vị tính
CREATE TABLE ItemTypes (
    ItemTypeID INT PRIMARY KEY,
    ItemTypeName VARCHAR(100),
    Unit VARCHAR(50)
);

-- Thêm cột ItemTypeID vào bảng Items và thiết lập khóa ngoại
ALTER TABLE Items
ADD ItemTypeID INT,
ADD FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes(ItemTypeID);

-- Tạo bảng PriceType để lưu loại giá
CREATE TABLE PriceType (
    PriceTypeID INT PRIMARY KEY,
    PriceTypeName VARCHAR(50) -- 'Labor' hoặc 'Material'
);

-- Tạo bảng ItemPrices để quản lý đơn giá dựa trên ngày hiệu lực
CREATE TABLE ItemPrices (
    PriceID INT PRIMARY KEY,
    ItemID INT,
    PriceTypeID INT,
    Price DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (PriceTypeID) REFERENCES PriceType(PriceTypeID)
);
