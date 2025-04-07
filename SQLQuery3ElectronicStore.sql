CREATE DATABASE ElectronicsStore

CREATE TABLE Categorie(
[categorie_id] INT PRIMARY KEY IDENTITY(1,1),
[categorie] NVARCHAR(100)
);

CREATE TABLE Brand(
[brand_id] INT PRIMARY KEY IDENTITY(1,1),
[brand] NVARCHAR(100)
);

CREATE TABLE [Product](
[product_id] INT PRIMARY KEY IDENTITY(1,1),
[name] NVARCHAR(100),
[categorie_id] INT FOREIGN KEY REFERENCES [Categorie]([categorie_id]) ON DELETE SET NULL,
[brand_id] INT FOREIGN KEY REFERENCES [Brand]([brand_id]) ON DELETE SET NULL ON UPDATE CASCADE,
[price] DECIMAL,
[available] NVARCHAR(10)
);

CREATE TABLE Client(
[client_id] INT PRIMARY KEY IDENTITY(1,1),
[first_name] NVARCHAR(100),
[surname] NVARCHAR(100),
[phone_number] NVARCHAR(10)
);

CREATE TABLE [Order](
[order_id] INT PRIMARY KEY IDENTITY(1,1),
[product_id] INT FOREIGN KEY REFERENCES [Product]([product_id]) ON DELETE SET DEFAULT,
[client_id] INT FOREIGN KEY REFERENCES [Client]([client_id]) ON DELETE CASCADE,
[data_odrer] DATE,
[amount] INT
);

INSERT INTO Categorie (categorie) VALUES
(N'Смартфони'),
(N'Лаптопи'),
(N'Таблети'),
(N'Монитори'),
(N'Аксесоари');

INSERT INTO Brand (brand) VALUES
(N'Apple'),
(N'Samsung'),
(N'Lenovo'),
(N'Dell'),
(N'Asus');

INSERT INTO [Product] (name, categorie_id, brand_id, Price, available) VALUES
('iPhone 14', 1, 1, 1199.99, 50),
('Samsung Galaxy S23', 1, 2, 999.99, 40),
('MacBook Pro 16"', 2, 1, 2499.99, 30),
('Dell XPS 13', 2, 4, 1399.99, 20),
('Logitech Mouse', 5, 5, 29.99, 100);

INSERT INTO Client(first_name, surname, phone_number) VALUES
(N'Иван', N'Иванов', '0888123456'),
(N'Мария', N'Петрова', '0877654321'),
(N'Александър', N'Николов', '0898765432'),
(N'Елена', N'Димова', '0887456234'),
(N'Георги', N'Колев', '0876987456');

INSERT INTO [Order](product_id, client_id, data_odrer, amount) VALUES
(1, 1, '2025-04-01', 1),
(2, 2, '2025-04-02', 2),
(3, 3, '2025-04-03', 1),
(4, 4, '2025-04-04', 1),
(5, 5, '2025-04-05', 3);

SELECT * FROM [Product]
SELECT * FROM [Product] WHERE (price>200)
SELECT [Product].name 
FROM [Product] 
JOIN 
Brand ON [Product].brand_id=Brand.brand_id
WHERE (brand='Samsung')

SELECT TOP 1 * FROM [Product] ORDER BY price DESC

Select * FROM Client ORDER BY surname ASC

Select Client.first_name, Client.surname,[Order].data_odrer
FROM [Order]
LEFT JOIN 
Client ON [Order].client_id=Client.client_id

Select SUM(price*available) FROM [Product]

Select Client.first_name
FROM [Order]
LEFT JOIN 
Client ON Client.client_id=[Order].client_id
WHERE [Order].order_id IS NULL

UPDATE [Product]
SET price=price+price*0.1
WHERE(brand_id=1)

DELETE Client
WHERE client_id=2

DELETE [Product]
WHERE brand_id=1

DELETE [Product]
WHERE product_id=4