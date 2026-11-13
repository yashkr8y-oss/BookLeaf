CREATE TABLE book_platforms (
    platform_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id BIGINT NOT NULL,
    platform_name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_platform_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id)
        ON DELETE CASCADE,

    CONSTRAINT uq_book_platform
        UNIQUE (book_id, platform_name)
);