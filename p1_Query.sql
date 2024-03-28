CREATE SCHEMA LibraryManagement;

USE  LibraryManagement;

CREATE TABLE authors(
	id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) 
);

CREATE TABLE genres(
	genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100)    
);

CREATE TABLE books(
	book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100), 
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users(
	user_id  INT AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(100), 
    email  VARCHAR(100)
);

CREATE TABLE borrowed_books(
	borrow_id  INT AUTO_INCREMENT PRIMARY KEY,
    borrow_date  DATE, 
    return_date  DATE,
    book_id INT,
    user_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
