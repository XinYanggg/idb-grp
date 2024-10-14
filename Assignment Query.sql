CREATE DATABASE Assignment;
USE Assignment;

----------WaiYang----------
CREATE TABLE Book_Information (
BookID NVARCHAR(50) NOT NULL PRIMARY KEY,
Book_Name NVARCHAR(50),
Unit_Price DECIMAL(5,2),
Total_Pages INT,
Published_Date DATE,
AuthorID NVARCHAR(50) FOREIGN KEY REFERENCES Author(AuthorID),
PublisherID NVARCHAR(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
ISBN_Number NVARCHAR(50));
INSERT INTO Book_Information VALUES
('B10001','The Great Gatsby',12.99,192,'1 September 2014','A10001','PU005','978-0-7432-7356-5'),
('B10002','To Kill a Mockingbird',14.5,281,'15 August 2016','A10005','PU002','978-0-06-112008-4'),
('B10003','1984',11.99,328,'10 October 2018','A10003','PU003','978-0-452-28423-4'),
('B10004','Pride and Prejudice',9.99,279,'20 July 2020','A10003','PU004','978-0-14-143951-8'),
('B10005','The Catcher in the Rye',13.75,224,'28 September 2013','A10005','PU005','978-0-316-76948-7'),
('B10006','The Hobbit',16.99,300,'5 August 2010','A10003','PU005','978-0-261-10229-5'),
('B10007','The Hunger Games',14.25,374,'12 October 2009','A10001','PU004','978-0-439-02349-8'),
('B10008','The Alchemist',10.5,208,'10 July 2012','A10002','PU003','978-0-06-231500-7'),
('B10009','Harry Potter and the Sorcerer''s Stone',19.99,320,'15 September 2011','A10004','PU001','978-0-545-01022-1'),
('B10010','The Lord of the Rings: The Fellowship of the Ring',18.25,432,'22 August 2015','A10003','PU004','978-0-618-34625-7');
CREATE TABLE Member_Details (
MemberID NVARCHAR(50) NOT NULL PRIMARY KEY,
Name NVARCHAR(50),
Class NVARCHAR(50) FOREIGN KEY REFERENCES Membership(Class),
Date_of_Birth DATE,
Address NVARCHAR(100));
INSERT INTO Member_Details VALUES
('M0001','Alice Johnson','Classic','15 April 1990','123 Jalan Merdeka, Taman Seri'),
('M0002','Bob Smith','Classic','20 August 1985','456 Jalan Sentosa, Taman Bahagia'),
('M0003','Carol Davis','Classic','10 February 1992','789 Persiaran Damai, Bandar Damansara'),
('M0004','David Wilson','Gold','5 July 1988','101 Jalan Harmoni, Taman Murni'),
('M0005','Emma Brown','Platinum','30 December 1995','202 Lorong Sejahtera, Taman Baiduri');
CREATE TABLE Purchase_Details (
PurchaseID NVARCHAR(50) NOT NULL PRIMARY KEY,
Purchased_Placed DATE,
MemberID NVARCHAR(50) FOREIGN KEY REFERENCES Member_Details(MemberID),
Ship_Date DATE,
PaymentID NVARCHAR(50) FOREIGN KEY REFERENCES Payment_Method(PaymentID),
StatusID NVARCHAR(50) FOREIGN KEY REFERENCES Order_Status(StatusID),
Total_amount DECIMAL (5,2),
Total DECIMAl (5,2));
INSERT INTO Purchase_Details VALUES
('P0001','10 October 2023','M0004','15 October 2023','PM004','OS01',35.49,24.79),
('P0002','12 October 2023','M0002','18 October 2023','PM002','OS03',46.29,32.4),
('P0003','14 October 2023','M0003','19 October 2023','PM005','OS01',33.48,24.19),
('P0004','16 October 2023','M0004','20 October 2023','PM001','OS02',30.49,25.14),
('P0005','18 October 2023','M0005','24 October 2023','PM003','OS01',61.98,52.42);
INSERT INTO Purchase_Details VALUES
('P0006','19 October 2023','M0004','25 October 2023','PM004','OS01',14.25,13.82)
CREATE TABLE Supply_Details (
SupplyID NVARCHAR(50) NOT NULL PRIMARY KEY,
PublisherID NVARCHAR(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
PaymentID NVARCHAR(50) FOREIGN KEY REFERENCES Payment_Method(PaymentID),
Purchased_Placed DATE,
StatusID NVARCHAR(50) FOREIGN KEY REFERENCES Order_Status(StatusID));
INSERT INTO Supply_Details VALUES
('S0001','PU004','PM001','10 October 2023','OS02'),
('S0002','PU004','PM002','10 October 2023','OS04'),
('S0003','PU001','PM003','2 October 2023','OS03'),
('S0004','PU003','PM004','5 October 2023','OS02'),
('S0005','PU005','PM005','18 October 2023','OS01'),
('S0006','PU002','PM002','22 October 2023','OS03');
CREATE TABLE Promotion (
PromotionID NVARCHAR(50) NOT NULL PRIMARY KEY,
Promotion NVARCHAR(50),
Description NVARCHAR(100),
Requirement NVARCHAR(100),
Percentage_Deducted INT,
Start_Date DATE,
End_Date DATE);
INSERT INTO Promotion VALUES
('D001','FallSale','Newiee Buyer','First-time buyers',15,'6 September 2023',NULL),
('D002','AutumnPromo','Seasonal Promotion','Purchase of 3 or more books',1,'23 September 2023','22 December 2023'),
('D003','OctoberOffer','October Promotion','Purchase total over $50',2,'1 October 2023','31 October 2023'),
('D004','BackToSchool','School Term Begins','Purchase of textbooks',15,'23 February 2023','1 March 2023'),
('D005','Birthday Promo','Only for birthday person','Purchase made on birthday',3,'6 September 2023',NULL),
('D006','HallowenSale','Halloween Celebration','Purchase of horror or thriller books',1,'15 October 2023','7 November 2023'),
('D007','NovemberDiscount','November Promotion','Purchase of 2 or more novels',15,'1 November 2023','30 November 2023');
----------Anson----------
CREATE TABLE Membership(
Class NVARCHAR(50) NOT NULL PRIMARY KEY, 
Member_Benefit_Percentage INT);
INSERT INTO Membership VALUES
('Classic' , 0),
('Gold', 3),
('Platinum', 5);
CREATE TABLE Genre_Categorization(
BookID NVARCHAR(50) FOREIGN KEY REFERENCES Book_Information(BookID),
GenreID NVARCHAR(50) FOREIGN KEY REFERENCES Genre(GenreID));
INSERT INTO Genre_Categorization VALUES
('B10001', 'G001'),
('B10001', 'G002'),
('B10002', 'G002'),
('B10002', 'G003'),
('B10003', 'G004'),
('B10003', 'G005'),
('B10004', 'G003'),
('B10004', 'G001'),
('B10005', 'G002'),
('B10005', 'G003'),
('B10006', 'G003'),
('B10006', 'G005'),
('B10007', 'G004'),
('B10008', 'G001'),
('B10008', 'G002'),
('B10009', 'G004'),
('B10009', 'G001'),
('B10010', 'G002');
CREATE TABLE Publisher(
PublisherID NVARCHAR(50) NOT NULL PRIMARY KEY,
Publisher_Name NVARCHAR(50));
INSERT INTO Publisher VALUES 
('PU001', 'Scribber'),
('PU002', 'Harper Lee'),
('PU003', 'Signet'),
('PU004', 'Penguin'),
('PU005', 'Little, Brown');
CREATE TABLE Order_Status(
StatusID NVARCHAR(50) NOT NULL PRIMARY KEY,
Status_Name NVARCHAR(50));
INSERT INTO Order_Status VALUES 
('OS01', 'Confirm'),
('OS02', 'Packing'),
('OS03', 'In Transit'),
('OS04', 'Delivered');
CREATE TABLE Genre(
GenreID NVARCHAR(50) NOT NULL PRIMARY KEY,
Genre_Name NVARCHAR(50));
INSERT INTO Genre VALUES 
('G001', 'Classic Literature'),
('G002', 'Fiction'),
('G003', 'Legal Drama'),
('G004', 'Dystopian'),
('G005', 'Political Fiction');
CREATE TABLE Discount_Applied(
PurchaseID NVARCHAR(50) FOREIGN KEY REFERENCES Purchase_Details(PurchaseID),
PromotionID NVARCHAR(50) FOREIGN KEY REFERENCES Promotion(PromotionID));
INSERT INTO Discount_Applied VALUES
('P0001', 'D003'),
('P0001', 'D006'),
('P0002', 'D005'),
('P0003', 'D007'),
('P0003', 'D004'),
('P0004', 'D001'),
('P0005', 'D004');
----------XinYang----------
----------Author----------
--Create Table for Author
CREATE TABLE Author(
AuthorID NVARCHAR(50) NOT NULL PRIMARY KEY,
Author_Fist_Name NVARCHAR(50),
Author_Last_Name NVARCHAR(50));
--Insert Info for Author
INSERT INTO Author VALUES
('A10001', 'F. Scott', 'Fitzgerald'),
('A10002', 'Harper', 'Lee'),
('A10003', 'George', 'Orwell'),
('A10004', 'Jane', 'Austen'),
('A10005', 'J.D.', 'Salinger');
SELECT * FROM Author;
----------Payment_Method----------
--Create Table for Payment_Method
CREATE TABLE Payment_Method(
PaymentID NVARCHAR(50) NOT NULL PRIMARY KEY,
Payment_Name NVARCHAR(50),
Intermiadiary NVARCHAR(50));
--Insert Info for Payment_Method
INSERT INTO Payment_Method VALUES
('PM001', 'Credit Card / Debit Card', 'May Bank'),
('PM002', 'PayPal', NULL),
('PM003', 'Touch n'' Go', NULL),
('PM004', 'Online Banking', 'FPX'),
('PM005', 'Cash on Delivery', NULL);
SELECT * FROM Payment_Method;
----------Shopping_cart----------
--Create Table for Shopping_cart
CREATE TABLE Shopping_cart(
MemberID NVARCHAR(50) FOREIGN KEY REFERENCES Member_Details(MemberID),
BookID NVARCHAR(50) FOREIGN KEY REFERENCES Book_Information(BookID),
Quantity INT);
--Insert Info for Shopping_cart
INSERT INTO Shopping_cart VALUES
('M0001', 'B10001', 5),
('M0002', 'B10004', 2),
('M0004', 'B10009', 1),
('M0002', 'B10010', 3),
('M0001', 'B10003', 2);
SELECT * FROM Shopping_cart;
----------Review----------
--Create Table for Review
CREATE TABLE Review(
BookID NVARCHAR(50) FOREIGN KEY REFERENCES Book_Information(BookID),
MemberID NVARCHAR(50) FOREIGN KEY REFERENCES Member_Details(MemberID),
Review NVARCHAR(500),
Rating DECIMAL(3,2));
--Insert Info for Review
INSERT INTO Review VALUES
('B10001', 'M0003', 'Glamorous yet tragic ', 7.8),
('B10001', 'M0005', 'Wealth and illusion ', 6.8),
('B10004', 'M0004', 'Timeless love story', 8.4),
('B10004', 'M0005', 'Timeless prejudice', 7.5),
('B10004', 'M0003', 'Delightful Fantasy', 6.6),
('B10007', 'M0004', 'Thrilling dystopian series ', 7.2),
('B10007', 'M0005', 'Thrilling survival tale ', 8.4),
('B10008', 'M0003', 'Inspirational self-discovery', 6.2),
('B10008', 'M0005', 'Philosophical self-discovery', 8.8),
('B10008', 'M0004', 'Spellbinding wizarding world', 9.1);
SELECT * FROM Review;
-----------Books_of_Supply----------
--Create Table for Books_of_Suupply
CREATE TABLE Books_of_Supply(
SupplyID NVARCHAR(50) FOREIGN KEY REFERENCES Supply_Details(SupplyID),
BookID NVARCHAR(50) FOREIGN KEY REFERENCES Book_Information(BookID),
Number_of_book_ordered INT,
Remark NVARCHAR(500));
--Insert Info for Books_of_Supply
INSERT INTO Books_of_Supply VALUES
('S0001', 'B10010', 60, NULL),
('S0001', 'B10003', 60, NULL),
('S0002', 'B10008', 60, NULL),
('S0003', 'B10004', 60, NULL),
('S0004', 'B10001', 80, NULL),
('S0005', 'B10009', 50, NULL),
('S0005', 'B10006', 20, 'Order Failed, book cracked'),
('S0005', 'B10005', 80, NULL),
('S0006', 'B10002', 25, NULL),
('S0006', 'B10007', 30, 'Delivery Delay');
SELECT * FROM Books_of_Supply;



----------Books_of_Purchase----------
--Create Table for Books_of_Purchase
CREATE TABLE Books_of_Purchase(
PurchaseID NVARCHAR(50) FOREIGN KEY REFERENCES Purchase_Details(PurchaseID),
BookID NVARCHAR(50) FOREIGN KEY REFERENCES Book_Information(BookID),
Quantity INT,
Amount DECIMAL(5,2));

--Insert Info for Books_of_Purchase
INSERT INTO Books_of_Purchase VALUES
('P0001', 'B10004', 1, 9.99),
('P0001', 'B10007', 2, 28.5),
('P0002', 'B10005', 2, 26.3),
('P0002', 'B10009', 1, 19.99),
('P0003', 'B10001', 1, 12.99),
('P0003', 'B10004', 1, 9.99),
('P0003', 'B10008', 1, 10.5),
('P0004', 'B10008', 1, 10.5),
('P0004', 'B10009', 1, 19.99),
('P0005', 'B10001', 1, 12.99),
('P0005', 'B10004', 1, 9.99),
('P0005', 'B10007', 2, 28.5),
('P0005', 'B10008', 1, 10.5);
INSERT INTO Books_of_Purchase VALUES
('P0006', 'B10007', 1, 14.25);

SELECT * FROM Books_of_Purchase;


--Q1
SELECT P.PublisherID, P.Publisher_Name, COUNT(B.BookID) AS NumberOfBooks FROM Publisher P
INNER JOIN Book_Information B ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherID, P.Publisher_Name
ORDER BY P.PublisherID;

--OR

SELECT P.PublisherID, P.Publisher_Name, COUNT(B.BookID) AS NumberOfBooks FROM Publisher P, Book_Information B
WHERE B.PublisherID = P.PublisherID
GROUP BY P.PublisherID, P.Publisher_Name
ORDER BY P.PublisherID;


--Q2
SELECT M.MemberID, M.Name, B.BookID, B.Book_Name, S.Quantity FROM Shopping_cart S, Book_Information B, Member_Details M
WHERE S.BookID = B.BookID AND S.MemberID = M.MemberID
ORDER BY M.MemberID, BookID;

--OR

SELECT M.MemberID, M.Name, B.BookID, B.Book_Name, S.Quantity FROM Shopping_cart S
INNER JOIN Book_Information B ON B.BookID = S.BookID
INNER JOIN Member_Details M ON M.MemberID = S.MemberID
ORDER BY M.MemberID, B.BookID;


--Q8
SELECT TOP 3 B.BookID, B.Book_Name, SUM(P.Quantity) AS NumberOfSales FROM Book_Information B, Books_of_Purchase P
WHERE B.BookID = P.BookID
GROUP BY B.BookID, B.Book_Name
ORDER BY NumberOfSales DESC, B.BookID;

--OR

SELECT TOP 3 B.BookID, B.Book_Name, SUM(P.Quantity) AS NumberOfSales FROM Book_Information B
JOIN Books_of_Purchase P ON B.BookID = P.BookID
GROUP BY B.BookID, B.Book_Name
ORDER BY NumberOfSales DESC, B.BookID;


--Q12
SELECT M.MemberID, M.Name, COUNT(D.PurchaseID) AS NumbersOfOrders FROM Member_Details M, Purchase_Details D
WHERE D.MemberID = M.MemberID
GROUP BY M.MemberID, M.Name
HAVING COUNT(D.PurchaseID) > 2
ORDER BY M.MemberID;

--OR

SELECT  M.MemberID, M.Name, COUNT(D.PurchaseID) AS NumbersOfOrders FROM Member_Details M
INNER JOIN Purchase_Details D ON M.MemberID = D.MemberID
GROUP BY M.MemberID, M.Name
HAVING COUNT(D.PurchaseID) > 2
ORDER BY M.MemberID;







SELECT P.PublisherID, P.Publisher_Name, COUNT(B.BookID) AS NumberOfBooks FROM Publisher P, Book_Information B
where P.PublisherID = B.PublisherID 
GROUP BY P.PublisherID, P.Publisher_Name
HAVING COUNT(B.BookID) > 2
ORDER BY P.PublisherID;