CREATE TABLE books (
    book_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    source_book_id VARCHAR(20) UNIQUE NOT NULL,
    author_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20),
    genre VARCHAR(100),
    publication_date DATE,
    status VARCHAR(50) NOT NULL,
    mrp NUMERIC(10, 2),
    author_royalty_per_copy NUMERIC(10, 2),
    total_copies_sold INTEGER DEFAULT 0,
    total_royalty_earned NUMERIC(12, 2),
    royalty_paid NUMERIC(12, 2),
    royalty_pending NUMERIC(12, 2),
    last_royalty_payout_date DATE,
    print_partner VARCHAR(150),

    CONSTRAINT fk_book_author
        FOREIGN KEY (author_id)
        REFERENCES authors(author_id)
);