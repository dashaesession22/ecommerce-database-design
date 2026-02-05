CREATE TABLE [Customer] (
  [CustomerID] int PRIMARY KEY,
  [FirstName] nvarchar(255),
  [LastName] nvarchar(255),
  [Email] nvarchar(255),
  [Phone] nvarchar(255)
)
GO

CREATE TABLE [Address] (
  [AddressID] int PRIMARY KEY,
  [CustomerID] int,
  [Street] nvarchar(255),
  [City] nvarchar(255),
  [State] nvarchar(255),
  [Zip] nvarchar(255)
)
GO

CREATE TABLE [Category] (
  [CategoryID] int PRIMARY KEY,
  [CategoryName] nvarchar(255)
)
GO

CREATE TABLE [Product] (
  [ProductID] int PRIMARY KEY,
  [CategoryID] int,
  [ProductName] nvarchar(255),
  [Price] decimal
)
GO

CREATE TABLE [Order] (
  [OrderID] int PRIMARY KEY,
  [CustomerID] int,
  [ShippingAddressID] int,
  [OrderDate] datetime,
  [TotalAmount] decimal
)
GO

CREATE TABLE [OrderItem] (
  [OrderID] int,
  [ProductID] int,
  [Quantity] int
)
GO

ALTER TABLE [Address] ADD FOREIGN KEY ([CustomerID]) REFERENCES [Customer] ([CustomerID])
GO

ALTER TABLE [Product] ADD FOREIGN KEY ([CategoryID]) REFERENCES [Category] ([CategoryID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([CustomerID]) REFERENCES [Customer] ([CustomerID])
GO

ALTER TABLE [Order] ADD FOREIGN KEY ([ShippingAddressID]) REFERENCES [Address] ([AddressID])
GO

ALTER TABLE [OrderItem] ADD FOREIGN KEY ([OrderID]) REFERENCES [Order] ([OrderID])
GO

ALTER TABLE [OrderItem] ADD FOREIGN KEY ([ProductID]) REFERENCES [Product] ([ProductID])
GO
