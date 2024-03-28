USE  LibraryManagement;

INSERT INTO authors (author_name)
VALUES ('Jane Austen'), ('George Orwell'),('F. Scott Fitzgerald');

INSERT INTO genres (genre_name)
VALUES ('Novel'), ('Dystopian Fiction'),('Tragedy');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES ('Pride and Prejudice', '1913', 1,1),
	('1984', '1949', 2,2),
    ('The Great Gatsby','1925',3,3);

INSERT INTO users (username, email)
VALUES ('Emily Johnson', 'emily.johnson@example.com'),
	('Michael Smith', 'michael.smith@example.com'),
	('Jack Davis', 'jack.davis@example.com');    

INSERT INTO borrowed_books (borrow_date, return_date, book_id, user_id)
VALUES ('2023-05-01', '2023-08-15', 1,1),
	('2023-07-20', '2023-11-30', 2,2),
	('2024-02-13', null, 3,3); 