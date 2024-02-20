CREATE DATABASE Library1
USE Library1
CREATE TABLE Books
(
Id INT PRIMARY KEY,
Name NVARCHAR(100) CHECK (LEN(NAME)<=100 AND LEN(NAME)>=2),
AuthorId INT ,
PageCount INT CHECK (PageCount>=10) FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
)
DROP TABLE Books
DROP TABLE Authors

CREATE TABLE Authors
(
Id INT PRIMARY KEY,
Name NVARCHAR(100) ,
Surname NVARCHAR(100) 
)

----Id,Name,PageCount ve AuthorFullName columnlarının valuelarını qaytaran bir view yaradın
CREATE VIEW VW_New_Books
AS SELECT 
Books.Id,Books.Name,Books.PageCount,
CONCAT(A.Name,' ',A.Surname) AS FullName
FROM Books 
JOIN Authors AS A ON A.Id=Books.AuthorId

SELECT * FROM VW_New_Books;

-----Göndərilmiş axtarış dəyərinə görə həmin axtarış dəyəri name və ya authorFullName-lərində olan Book-ları
---Id,Name,PageCount,AuthorFullName columnları şəklində göstərən procedure yazın
CREATE PROCEDURE Books_Search_
@SEARCH NVARCHAR(100)
AS SELECT 
Books.Id,Books.Name,Books.PageCount,
CONCAT(A.Name,' ',A.Surname) AS FullName
FROM Books 
JOIN Authors AS A ON A.Id=Books.AuthorId
WHERE 
Books.Name LIKE CONCAT('%',@SEARCH,'%') OR  CONCAT(A.Name, ' ', A.Surname) LIKE CONCAT('%',@SEARCH,'%') 




