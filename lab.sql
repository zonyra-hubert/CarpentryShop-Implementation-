
CREATE DATABASE CarpentryShop;
USE CarpentryShop;



CREATE TABLE Staff (
    staffId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    dateOfEmployment DATE NOT NULL,
    position VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Customers (
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Products (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    material VARCHAR(50),
    description TEXT,
    price DECIMAL(10, 2),
    stockQuantity INT
);

CREATE TABLE Suppliers (
    supplierId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Materials (
   materialId INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
    quantity INT,
    supplierId INT,
    unitCost DECIMAL(10, 2),
    FOREIGN KEY (supplierId) REFERENCES Suppliers(supplierId)
);


CREATE TABLE Orders (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    oderDate DATE NOT NULL,
    totalamount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);


CREATE TABLE Projects (
    projectId INT AUTO_INCREMENT PRIMARY KEY,
    customerId INT NOT NULL,
    description TEXT,
    startDate DATE,
    endDate DATE,
    status VARCHAR(50),
    totalCost DECIMAL(10, 2),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);


CREATE TABLE Tools (
    toolId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    toolCondition ENUM('Good', 'Needs Repair', 'Damaged'),
    lastMaintenanceDate DATE,
    maintainedBy INT,
    FOREIGN KEY (maintainedBy) REFERENCES Staff(StaffID)
);





CREATE TABLE Inventory (
    inventoryId INT AUTO_INCREMENT PRIMARY KEY,
    itemId INT NOT NULL,
    quantityAvailable INT,
    reorderLevel INT,
    FOREIGN KEY (itemId) REFERENCES Materials(materialId)
);


CREATE TABLE Sales (
    saleId INT AUTO_INCREMENT PRIMARY KEY,
    productId INT NOT NULL,
    customerId INT NOT NULL,
    saleDate DATE NOT NULL,
    amount DECIMAL(10, 2),
    FOREIGN KEY (productId) REFERENCES Products(productId),
    FOREIGN KEY (customerId) REFERENCES Customers(customerId)
);

CREATE TABLE MaintenanceRecords (
    maintenanceId INT AUTO_INCREMENT PRIMARY KEY,
    toolId INT NOT NULL,
    maintenanceDate DATE NOT NULL,
    staffId INT NOT NULL,
    details TEXT,
    FOREIGN KEY (toolId) REFERENCES Tools(toolId),
    FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);


CREATE TABLE FinancialRecords (
   recordId INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('Income', 'Expense') NOT NULL,
    amount DECIMAL(10, 2),
    RecordDate DATE NOT NULL,
    description TEXT
);


--  Explanation

--      Foreign Keys:
--          Orders link to Customers for tracking who placed the order.
--         materials link to Suppliers formaterial sourcing.
--          Projects link to Customers for custom jobs.
--          Sales link to Products and Customers for sales tracking.
--          MaintenanceRecords link to Tools and Staff.

--      Data types:
--          INT for numeric IDs.
--          VARCHAR for text fields likenames, positions, or emails.
--          DECIMAL for monetary values (e.g., Price, Salary).
--          DATE for timebased records.

--      AutoIncrement:
--          Ensures each ID is unique and automatically generated.


--  In databases, the term REFERENCES is used in the context of foreign keys 
--  to establish a relationship between two tables. It specifies that a column 
--  (or set of columns) in one table is linked to a column in another 
--  table. This ensures data consistency and enforces relational integrity.

--  What Does REFERENCES Do?

--      Links Tables Together:
--      It defines a connection between a column in one table (called the child table) and a column in another table (called the parent table).
--          gmail: In the Orders table, the customerId references the customerId in the Customers table, linking each order to a customer.

--      Ensures Valid Data:
--      It prevents inserting invalid or nonexistent values into the child table.
--          gmail: You cannot add an order with a customerId that does not exist in the Customers table.

--      Supports Referential Integrity:
--      It ensures the database maintains logical connections between tables. For instance:
--          If you delete a customer, you can configure the database to either delete related orders automatically (cascading delete) 
--          or block the deletion unless the orders are first removed (restrict delete).

--  Using ENUM in a database, specifically in MySQL, is a way to define a column that can only take one value from a predefined list of options. It is particularly useful when a column’s possible values are fixed and limited.
INSERT INTO Customers VALUES
(2, 'John Doe', '123 Main St', '555-123-4567', 'johndoe@yahoo.com'),
(3, 'Jane Smith', '456 Nkrumah St', '555-000-6543', 'janesmith@gmail.com'),
(4, 'John Smith', '456 Adonai St', '555-987-6543', 'jamesmith@.hootmail.com'),
(5, 'Paul Addo', '456 Alpha St', '+233531234509','paddo@gmail.com'),
(6, 'Robert Brown', '678 Cedar Lane, Hillcrest, WA 98052', '(206) 555-3456', 'rbrown@gmail.com'),
(7, 'Jennifer Davis', '910 Oak Avenue, Riverview, NJ 08901', '(732) 555-4567', 'jdavis@gmail.com'),
(8, 'William Wilson', '321 Elm Street, Mountainview, CO 80221', '(303) 555-5678', 'wwilson@gmail.com'),
(9, 'Linda Martinez', '890 Maple Lane, Sunnyvale, CA 94085', '(408) 555-6789', 'lmartinez@gmail.com'),
(10, 'Thomas Miller', '456 Pine Road, Oceanside, CA 92054', '(760) 555-7890', 'tmiller@gmail.com'),
(11, 'Emily Carter', '123 Cedar Street, Parkville, MD 21234', '(410) 555-8901', 'ecarter@gmail.com'),
(12, 'Joseph Lee', '789 Oak Avenue, Lakeside, CA 92040', '(619) 555-9012', 'jlee@gmail.com'),
(13, 'Olivia Taylor', '345 Elm Street, Riverton, UT 84065', '(801) 555-0123', 'otaylor@gmail.com'),
(14, 'Ethan Smith', '901 Maple Lane, Seaside, OR 97138', '(503) 555-1234', 'esmith@gmail.com'),
(15, 'Sophia Hernandez', '567 Pine Road, Sun Valley, ID 83353', '(208) 555-2345', 'shernandez@gmail.com'),
(16, 'Benjamin Moore', '123 Cedar Street, Lakeville, MN 55044', '(952) 555-3456', 'bmoore@gmail.com'),
(17, 'Ava Clark', '789 Oak Avenue, Bayside, NY 11364', '(718) 555-4567', 'aclark@gmail.com'),
(18, 'Isaac Brown', '345 Elm Street, Sunnyvale, CA 94085', '(408) 555-5678', 'ibrown@gmail.com'),
(19, 'Chloe Nelson', '901 Maple Lane, Miami, FL 33138', '(305) 555-6789', 'cnelson@gmail.com'),
(20, 'Jacob Mitchell', '567 Pine Road, Chicago, IL 60601', '(312) 555-7890','mitchel@yahoo.com'),
(21, 'Amelia Martinez', '123 Cedar Street, Denver, CO 80202', '(303) 555-8901','ameliam@yahoo.com'),
(22, 'Oliver Rodriguez', '789 Oak Avenue, Seattle, WA 98101', '(206) 555-9012','oliver@yahoo.com'),
(23, 'Charlotte Lee', '345 Elm Street, Atlanta, GA 30303', '(404) 555-0123','lindotte@yahoo.com'),
(24, 'Logan Taylor', '901 Maple Lane, Houston, TX 77002', '(713) 555-1234','langel@yahoo.com'),
(25, 'Avery Hernandez', '567 Pine Road, Philadelphia, PA 19103', '(215) 555-2345','avery@yahoo.com'),
(26, 'Henry Moore', '123 Cedar Street, Detroit, MI 48226', '(313) 555-3456', 'mooreh@yahoo.com'),
(27, 'Grace Clark', '789 Oak Avenue, Dallas, TX 75201', '(214) 555-4567','grace@yahoo.com'),
(28, 'Leo Brown', '345 Elm Street, San Diego, CA 92101', '(619) 555-5678', 'leo@yahoo.com'),
(29, 'Zoe Nelson', '901 Maple Lane, San Antonio, TX 78201', '(210) 555-6789','zoe@yahoo.com'),
(30, 'Noah Mitchell', '567 Pine Road, Las Vegas, NV 89101', '(702) 555-7890','noah@yahoo.com');


INSERT INTO Staff (name, dob, phone, dateOfEmployment, position, email, salary) VALUES
('John Carter', '1990-01-15', '555-123-4567', '2015-03-12', 'Manager', 'john.carter@gmail.com', 4500.00),
('Emily Johnson', '1985-06-20', '555-234-5678', '2018-07-01', 'Carpenter', 'emily.johnson@yahoo.com', 3500.00),
('Robert Adams', '1992-09-10', '555-345-6789', '2020-01-05', 'Assistant Carpenter', 'robert.adams@gmail.com', 3000.00),
('Olivia Smith', '1995-02-17', '555-456-7890', '2022-05-10', 'Secretary', 'olivia.smith@gmail.com', 2800.00),
('Michael Brown', '1980-11-25', '555-567-8901', '2010-08-20', 'Foreman', 'michael.brown@gmail.com', 4000.00),
('Sophia Wilson', '1993-03-12', '555-678-9012', '2021-11-01', 'Carpenter', 'sophia.wilson@yahoo.com', 3500.00),
('William Davis', '1991-07-19', '555-789-0123', '2017-06-25', 'Assistant Carpenter', 'william.davis@gmail.com', 3100.00),
('Emma Martinez', '1998-08-24', '555-890-1234', '2023-01-15', 'Apprentice', 'emma.martinez@gmail.com', 2200.00),
('James Taylor', '1987-12-05', '555-901-2345', '2015-09-10', 'Logistics Manager', 'james.taylor@yahoo.com', 3800.00),
('Charlotte White', '1996-01-30', '555-012-3456', '2020-02-15', 'Carpenter', 'charlotte.white@gmail.com', 3300.00),
('Alexander Scott', '1983-09-01', '555-123-4561', '2012-07-20', 'Senior Carpenter', 'alex.scott@gmail.com', 4200.00),
('Amelia Green', '1997-06-11', '555-234-5672', '2022-10-12', 'Apprentice', 'amelia.green@gmail.com', 2100.00),
('Daniel Harris', '1989-03-15', '555-345-6783', '2019-05-05', 'Supervisor', 'daniel.harris@gmail.com', 3700.00),
('Mia Lewis', '1994-04-22', '555-456-7894', '2021-06-17', 'Secretary', 'mia.lewis@yahoo.com', 2900.00),
('Liam Hall', '1990-11-08', '555-567-8905', '2016-03-25', 'Carpenter', 'liam.hall@gmail.com', 3400.00),
('Isabella Allen', '1993-07-14', '555-678-9016', '2018-09-12', 'Carpenter', 'isabella.allen@yahoo.com', 3500.00),
('Lucas Young', '1992-02-28', '555-789-0127', '2019-10-20', 'Assistant Carpenter', 'lucas.young@gmail.com', 3100.00),
('Harper King', '1995-09-17', '555-890-1238', '2022-02-11', 'Secretary', 'harper.king@gmail.com', 2800.00),
('Benjamin Baker', '1988-12-01', '555-901-2349', '2016-11-30', 'Foreman', 'benjamin.baker@yahoo.com', 4100.00),
('Ella Nelson', '1999-05-05', '555-012-3450', '2023-06-18', 'Apprentice', 'ella.nelson@gmail.com', 2000.00),
('Mason Ramirez', '1985-10-23', '555-123-4562', '2010-04-05', 'Senior Carpenter', 'mason.ramirez@gmail.com', 4300.00),
('Ava Wright', '1991-04-18', '555-234-5673', '2017-05-01', 'Assistant Carpenter', 'ava.wright@yahoo.com', 3200.00),
('Ethan Perez', '1990-06-20', '555-345-6784', '2014-07-14', 'Carpenter', 'ethan.perez@gmail.com', 3600.00),
('Abigail Hill', '1996-11-12', '555-456-7895', '2021-01-09', 'Secretary', 'abigail.hill@gmail.com', 2900.00),
('Logan Torres', '1993-05-25', '555-567-8906', '2018-08-22', 'Logistics Manager', 'logan.torres@gmail.com', 3900.00),
('Avery Collins', '1997-02-15', '555-678-9017', '2023-03-20', 'Apprentice', 'avery.collins@gmail.com', 2200.00),
('Carter Jenkins', '1984-09-05', '555-789-0128', '2011-10-10', 'Foreman', 'carter.jenkins@yahoo.com', 4000.00),
('Sofia Rivera', '1994-12-17', '555-890-1239', '2020-07-13', 'Carpenter', 'sofia.rivera@gmail.com', 3300.00),
('Jayden Murphy', '1995-03-22', '555-901-2340', '2021-09-07', 'Assistant Carpenter', 'jayden.murphy@yahoo.com', 3100.00),
('Scarlett Sanchez', '1986-07-30', '555-012-3451', '2013-04-01', 'Senior Carpenter', 'scarlett.sanchez@gmail.com', 4400.00);


INSERT INTO Products (name, material, description, price, stockQuantity) VALUES
('Wooden Dining Table', 'Oak', 'A sturdy oak dining table that seats 6 people.', 350.00, 15),
('Bookshelf', 'Pine', 'A tall bookshelf with 5 shelves made of pine wood.', 120.00, 25),
('Coffee Table', 'Walnut', 'A sleek walnut coffee table with a glass top.', 180.50, 20),
('Office Desk', 'Mahogany', 'A spacious office desk with drawers and compartments.', 400.00, 10),
('Kitchen Cabinet', 'Birch', 'A modern kitchen cabinet with ample storage space.', 500.00, 8),
('Wooden Chair', 'Teak', 'Handcrafted teak wooden chair with a cushioned seat.', 85.00, 30),
('Wardrobe', 'Cedar', 'A large cedar wood wardrobe with hanging space and shelves.', 750.00, 5),
('TV Stand', 'MDF', 'A minimalist TV stand with two drawers for storage.', 150.00, 18),
('Bed Frame', 'Pine', 'Queen-size pine wood bed frame with a sturdy design.', 300.00, 12),
('Rocking Chair', 'Maple', 'Classic maple rocking chair for relaxation.', 95.00, 20),
('Side Table', 'Walnut', 'A small walnut wood side table for living rooms.', 70.00, 35),
('Wooden Bench', 'Teak', 'Outdoor teak wood bench, perfect for gardens.', 150.00, 10),
('Shoe Rack', 'Oak', 'A compact oak wood shoe rack with 3 shelves.', 65.00, 22),
('Wooden Mirror Frame', 'Mahogany', 'Hand-carved mahogany mirror frame.', 110.00, 15),
('Kitchen Stool', 'Beech', 'A simple wooden kitchen stool made from beech wood.', 45.00, 40),
('Cabinet Doors', 'Birch', 'Set of birch wood cabinet doors for kitchen renovations.', 250.00, 12),
('Dining Chair', 'Walnut', 'Comfortable dining chair made of walnut with padded seating.', 100.00, 25),
('Garden Table', 'Cedar', 'Cedar wood garden table suitable for outdoor use.', 200.00, 8),
('Floating Shelves', 'Pine', 'Set of 3 pine wood floating shelves.', 55.00, 30),
('Wooden Ladder', 'Oak', 'Multi-purpose oak wooden ladder with a classic finish.', 120.00, 14);


INSERT INTO Suppliers (name, address, phone, email) VALUES
('Timber Works Ltd', '123 Oak Street, Springfield, IL', '555-123-4567', 'info@timberworks.com'),
('WoodMart Suppliers', '456 Pine Avenue, Dallas, TX', '555-234-5678', 'contact@woodmart.com'),
('Forest Furnishings', '789 Maple Road, Seattle, WA', '555-345-6789', 'sales@forestfurnishings.com'),
('Global Timber Co.', '101 Cedar Street, Miami, FL', '555-456-7890', 'support@globaltimber.com'),
('Lumber Hub', '567 Birch Lane, Denver, CO', '555-567-8901', 'lumberhub@gmail.com'),
('WoodPro Inc.', '890 Walnut Blvd, Boston, MA', '555-678-9012', 'services@woodpro.com'),
('Cedar Suppliers', '345 Redwood Drive, Portland, OR', '555-789-0123', 'info@cedarsuppliers.com'),
('Pine Solutions', '212 Elm Road, Chicago, IL', '555-890-1234', 'pinesolutions@gmail.com'),
('Oak Masters', '101 Maple Grove, Atlanta, GA', '555-901-2345', 'oakmasters@yahoo.com'),
('Hardwood Partners', '421 Beech Street, Phoenix, AZ', '555-012-3456', 'contact@hardwoodpartners.com'),
('Teak Traders', '789 Forest Drive, Orlando, FL', '555-123-4561', 'sales@teaktraders.com'),
('Mahogany Experts', '342 Mahogany Avenue, San Diego, CA', '555-234-5672', 'info@mahoganyexperts.com'),
('Birch Builders', '678 Willow Street, Nashville, TN', '555-345-6783', 'support@birchbuilders.com'),
('Classic Woods Ltd', '345 Oakwood Drive, Austin, TX', '555-456-7894', 'classicwoods@gmail.com'),
('Green Lumber Co.', '567 Timberline Rd, San Jose, CA', '555-567-8905', 'contact@greenlumber.com'),
('Forest Edge Suppliers', '987 Maple Drive, Denver, CO', '555-678-9016', 'sales@forestedgesuppliers.com'),
('Luxe Woodworks', '123 Cedar Hill, Boston, MA', '555-789-0127', 'info@luxewoodworks.com'),
('Prime Timber Supplies', '890 Beech Grove, New York, NY', '555-890-1238', 'primetimber@gmail.com'),
('EcoWood Solutions', '567 Walnut Street, Los Angeles, CA', '555-901-2349', 'info@ecowoodsolutions.com'),
('Quality Timber Co.', '123 Pinewood Lane, Seattle, WA', '555-012-3450', 'qualitytimber@yahoo.com');


INSERT INTO Materials (name, quantity, supplierId, unitCost) VALUES
('Oak Wood Planks', 500, 1, 25.50),
('Pine Wood Boards', 300, 2, 15.75),
('Walnut Timber', 200, 3, 40.00),
('Cedar Beams', 100, 4, 35.00),
('Teak Hardwood', 150, 5, 55.25),
('Mahogany Sheets', 120, 6, 45.75),
('Birch Plywood', 250, 7, 20.50),
('MDF Sheets', 400, 8, 18.25),
('Redwood Panels', 180, 9, 30.00),
('Maple Lumber', 130, 10, 38.50),
('Beech Boards', 220, 11, 28.75),
('Spruce Planks', 350, 12, 22.50),
('Hardwood Veneer', 140, 13, 48.00),
('Bamboo Sheets', 200, 14, 26.00),
('Plywood Sheets', 300, 15, 17.50);

INSERT INTO Orders (customerId, oderDate, totalamount, status) VALUES
(1, '2024-01-01', 350.00, 'Completed'),
(2, '2024-01-03', 180.50, 'Pending'),
(3, '2024-01-05', 400.00, 'Shipped'),
(4, '2024-01-07', 85.00, 'Completed'),
(5, '2024-01-10', 750.00, 'Pending'),
(6, '2024-01-12', 150.00, 'Cancelled'),
(7, '2024-01-14', 300.00, 'Shipped'),
(8, '2024-01-15', 95.00, 'Completed'),
(9, '2024-01-18', 70.00, 'Pending'),
(10, '2024-01-20', 120.00, 'Shipped'),
(11, '2024-01-22', 45.00, 'Completed'),
(12, '2024-01-23', 200.00, 'Completed'),
(13, '2024-01-25', 55.00, 'Pending'),
(14, '2024-01-28', 150.00, 'Shipped'),
(15, '2024-01-30', 65.00, 'Completed');


INSERT INTO Projects (customerId, description, startDate, endDate, status, totalCost) VALUES
(1, 'Custom oak dining table with six chairs', '2024-01-01', '2024-01-15', 'Completed', 1500.00),
(2, 'Built-in bookshelves for home library', '2024-01-10', '2024-02-05', 'In Progress', 2400.00),
(3, 'Walnut coffee table with glass top', '2024-01-15', '2024-01-25', 'Completed', 600.00),
(4, 'Teak wood office desk with drawers', '2024-02-01', '2024-02-20', 'Pending', 1200.00),
(5, 'Custom kitchen cabinets installation', '2024-02-10', '2024-03-01', 'In Progress', 3500.00),
(6, 'Queen-size pine wood bed frame', '2024-01-20', '2024-02-10', 'Completed', 900.00),
(7, 'Garden cedar wood bench and table set', '2024-02-05', '2024-02-28', 'Pending', 1100.00),
(8, 'Hardwood veneer custom wardrobe', '2024-01-25', '2024-02-15', 'Cancelled', 2500.00),
(9, 'Maple wood rocking chair for patio', '2024-02-12', '2024-02-25', 'In Progress', 400.00),
(10, 'Installation of floating shelves', '2024-02-15', '2024-02-22', 'Completed', 300.00),
(11, 'Teak garden furniture (chairs and table)', '2024-02-20', '2024-03-10', 'Pending', 2100.00),
(12, 'Custom-built oak wood shoe rack', '2024-03-01', '2024-03-12', 'Planned', 450.00);


INSERT INTO Tools (name, toolCondition, lastMaintenanceDate, maintainedBy) VALUES
('Hammer', 'Good', '2024-01-10', 1),
('Circular Saw', 'Needs Repair', '2024-01-15', 2),
('Wood Planer', 'Good', '2023-12-20', 3),
('Chisel Set', 'Good', '2024-01-05', 4),
('Table Saw', 'Damaged', '2024-01-12', 5),
('Drill Machine', 'Good', '2023-12-30', 6),
('Sander', 'Needs Repair', '2024-01-18', 2),
('Mallet', 'Good', '2024-01-01', 7),
('Clamp Set', 'Good', '2023-12-25', 8),
('Nail Gun', 'Damaged', '2024-01-14', 9),
('Measuring Tape', 'Good', '2024-01-03', 4),
('Jigsaw', 'Needs Repair', '2024-01-11', 3),
('Screwdriver Set', 'Good', '2024-01-02', 6),
('Band Saw', 'Good', '2023-12-15', 1),
('Router', 'Damaged', '2024-01-08', 5);

    mysINSERT INTO Inventory (itemId, quantityAvailable, reorderLevel) VALUES
(1, 500, 100),
(2, 300, 80),
(3, 200, 50),
(4, 100, 30),
(5, 150, 40),
(6, 120, 25),
(7, 250, 70),
(8, 400, 100),
(9, 180, 60),
(10, 130, 35),
(11, 220, 75),
(12, 350, 90),
(13, 140, 40),
(14, 200, 50),
(15, 300, 85);

 INSERT INTO Sales (productId, customerId, saleDate, amount) VALUES
(1, 1, '2024-01-05', 750.00),
(2, 2, '2024-01-10', 180.50),
(3, 3, '2024-01-12', 400.00),
(4, 4, '2024-01-15', 320.00),
(5, 5, '2024-01-20', 900.00),
(6, 6, '2024-01-22', 600.00),
(7, 7, '2024-01-25', 450.00),
(8, 8, '2024-01-28', 120.00),
(9, 9, '2024-02-01', 350.00),
(10, 10, '2024-02-03', 200.00),
(11, 11, '2024-02-06', 280.00),
(12, 12, '2024-02-10', 550.00),
(13, 13, '2024-02-12', 180.00),
(14, 14, '2024-02-15', 850.00),
(15, 15, '2024-02-18', 420.00);


INSERT INTO MaintenanceRecords (toolId, maintenanceDate, staffId, details) VALUES
(1, '2024-01-10', 1, 'Replaced the hammer head and cleaned the handle.'),
(2, '2024-01-15', 2, 'Repaired the motor and replaced the blade guard on the circular saw.'),
(3, '2023-12-20', 3, 'Sharpened the blade and cleaned the wood planer.'),
(4, '2024-01-05', 4, 'Replaced worn-out chisels and polished the handles.'),
(5, '2024-01-12', 5, 'Replaced damaged parts of the table saw and adjusted the fence.'),
(6, '2023-12-30', 6, 'Serviced the drill machine and replaced the battery pack.'),
(7, '2024-01-18', 2, 'Sanded and polished the sander, replaced worn sanding pads.'),
(8, '2024-01-01', 7, 'Checked the mallet condition and ensured the handle is tightly secured.'),
(9, '2023-12-25', 8, 'Lubricated clamp set and ensured smooth operation of jaws.'),
(10, '2024-01-14', 9, 'Repaired the nail gun and replaced the air compressor seals.'),
(11, '2024-01-03', 4, 'Checked and calibrated the measuring tape for accuracy.'),
(12, '2024-01-11', 3, 'Replaced worn-out parts on the jigsaw and checked functionality.');


 INSERT INTO FinancialRecords (type, amount, RecordDate, description) VALUES
('Income', 5000.00, '2024-01-01', 'Sales revenue from custom furniture orders in January.'),
('Expense', 1200.00, '2024-01-05', 'Payment for raw materials purchased (wood, nails, etc.).'),
('Income', 7500.00, '2024-01-10', 'Revenue from carpentry services for custom-built offices.'),
('Expense', 1500.00, '2024-01-15', 'Payment for employee wages and benefits for January.'),
('Income', 3200.00, '2024-01-20', 'Income from sale of custom kitchen cabinets.'),
('Expense', 800.00, '2024-01-25', 'Maintenance cost for tools and equipment.'),
('Income', 4200.00, '2024-02-01', 'Revenue from outdoor furniture orders and deliveries.'),
('Expense', 1000.00, '2024-02-05', 'Electricity and utility payments for workshop operations.'),
('Income', 3800.00, '2024-02-10', 'Revenue from sales of wooden home decor products.'),
('Expense', 950.00, '2024-02-12', 'Marketing expenses for promoting new products.'),
('Income', 6200.00, '2024-02-15', 'Income from large carpentry project involving office furniture.'),
('Expense', 1100.00, '2024-02-18', 'Transportation costs for delivery of orders to clients.');


-- A JOIN is used in SQL to combine rows from two or more tables based on a related column between them. It's one of the most powerful tools for working with multiple tables in a relational database. Let me explain the different types of JOINs and how they work:

-- 1. INNER JOIN
-- The INNER JOIN returns only the rows where there is a match in both tables.

-- Use Case: You want to retrieve records where there is a relationship between the two tables. If there is no match, the row is excluded.
-- Example: Find all sales made by customers.

-- sql
-- Copy code
-- SELECT Sales.saleId, Customers.name
-- FROM Sales
-- INNER JOIN Customers ON Sales.customerId = Customers.customerId;
-- This query retrieves the sales (saleId) and the names of the customers who made those sales. Only records where a matching customerId exists in both the Sales and Customers tables will be returned.
-- 2. LEFT JOIN (or LEFT OUTER JOIN)
-- The LEFT JOIN returns all records from the left table (the first one listed), and the matched records from the right table (the second one). If there is no match, the result will contain NULL values for columns from the right table.

-- Use Case: You want to retrieve all records from the left table and any matching records from the right table. If no match exists, the result will still show the left table’s data with NULL for the right table’s columns.
-- Example: List all customers and their purchases (if any).

-- sql
-- Copy code
-- SELECT Customers.name, Sales.amount
-- FROM Customers
-- LEFT JOIN Sales ON Customers.customerId = Sales.customerId;
-- This query will return all customers, including those who have not made any sales. If a customer has made a sale, the sales amount will be shown; if not, the sales amount will be NULL.
-- 3. RIGHT JOIN (or RIGHT OUTER JOIN)
-- The RIGHT JOIN is similar to the LEFT JOIN, but it returns all records from the right table (the second one listed), and the matching records from the left table (the first one). If there is no match, the result will contain NULL values for columns from the left table.

-- Use Case: You want to retrieve all records from the right table and any matching records from the left table.
-- Example: List all sales and the customers who made those purchases (if available).

-- sql
-- Copy code
-- SELECT Sales.saleId, Customers.name
-- FROM Sales
-- RIGHT JOIN Customers ON Sales.customerId = Customers.customerId;
-- This query retrieves all sales, including those without a matching customer. If a sale doesn't have an associated customer, NULL will appear in the Customers.name column.
-- 4. FULL JOIN (or FULL OUTER JOIN)
-- The FULL JOIN returns all records when there is a match in either the left or the right table. If there is no match, the result will contain NULL for the non-matching table's columns.

-- Use Case: You want to retrieve all records from both tables, whether or not they have a match in the other table.
-- Example: List all customers and sales, regardless of whether a match exists in the other table.

-- sql
-- Copy code
-- SELECT Customers.name, Sales.amount
-- FROM Customers
-- FULL OUTER JOIN Sales ON Customers.customerId = Sales.customerId;
-- This query will return all customers and all sales. If there is no matching sale for a customer, the sales column will be NULL; similarly, if a sale does not have a corresponding customer, the customer column will be NULL.
-- 5. CROSS JOIN
-- The CROSS JOIN returns the Cartesian product of the two tables — meaning it combines each row of the first table with all rows of the second table.

-- Use Case: You want every possible combination of rows from two tables. It's rarely used, but can be useful in certain scenarios (e.g., generating combinations).
-- Example: Get all combinations of products and staff.

-- sql
-- Copy code
-- SELECT Products.name, Staff.name
-- FROM Products
-- CROSS JOIN Staff;
-- This query will return every possible pairing of product and staff members.
-- 6. SELF JOIN
-- A SELF JOIN is a regular JOIN, but the table is joined with itself. You use an alias to differentiate between the two instances of the same table.

-- Use Case: You want to compare rows within the same table, for example, employees and their managers in an Employees table.
-- Example: Find employees and their managers from the same Employees table.

-- sql
-- Copy code
-- SELECT e1.name AS employee, e2.name AS manager
-- FROM Employees e1
-- LEFT JOIN Employees e2 ON e1.managerId = e2.employeeId;
-- This query lists employees and their managers by joining the Employees table with itself, using different aliases (e1 and e2).
-- JOIN Conditions (ON vs USING)
-- ON: The ON clause specifies the condition for the join. You can define complex conditions using AND, OR, etc.
-- USING: The USING clause simplifies the join condition when the column names are the same in both tables.
-- Example using ON:

-- sql
-- Copy code
-- SELECT a.name, b.salary
-- FROM Employee a
-- JOIN Salary b ON a.employeeId = b.employeeId;
-- Example using USING:

-- sql
-- Copy code
-- SELECT a.name, b.salary
-- FROM Employee a
-- JOIN Salary b USING(employeeId);
-- Conclusion
-- INNER JOIN: Returns only matching rows.
-- LEFT JOIN: Returns all rows from the left table and matched rows from the right table (with NULL for unmatched right table rows).
-- RIGHT JOIN: Returns all rows from the right table and matched rows from the left table (with NULL for unmatched left table rows).
-- FULL JOIN: Returns all rows from both tables, with NULL for unmatched rows in either table.
-- CROSS JOIN: Returns the Cartesian product of the two tables.
-- SELF JOIN: Joins a table with itself.




-- 1. Retrieve all customers who have made a purchase
SELECT DISTINCT c.name, c.email
FROM Customers c
JOIN Sales s ON c.customerId = s.customerId;

-- . Find all orders placed by a specific customer
SELECT o.orderId, o.oderDate, o.totalamount, o.status
FROM Orders o
WHERE o.customerId = 1;