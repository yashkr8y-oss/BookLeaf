
-- 08_create_support_tables.sql

-- 1. Support tickets
CREATE TABLE tickets (
    ticket_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    author_id BIGINT NOT NULL,
    book_id BIGINT,

    subject VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,

    category VARCHAR(100) NOT NULL DEFAULT 'General Inquiry'
        CHECK (category IN (
            'Royalty & Payments',
            'ISBN & Metadata Issues',
            'Printing & Quality',
            'Distribution & Availability',
            'Book Status & Production Updates',
            'General Inquiry'
        )),

    priority VARCHAR(20) NOT NULL DEFAULT 'Medium'
        CHECK (priority IN ('Critical', 'High', 'Medium', 'Low')),

    status VARCHAR(30) NOT NULL DEFAULT 'Open'
        CHECK (status IN (
            'Open',
            'In Progress',
            'Waiting for Author',
            'Resolved',
            'Closed'
        )),

    assigned_admin_id BIGINT,
    attachment_url TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ticket_author
        FOREIGN KEY (author_id)
        REFERENCES authors(author_id),

    CONSTRAINT fk_ticket_book
        FOREIGN KEY (book_id)
        REFERENCES books(book_id),

    CONSTRAINT fk_ticket_admin
        FOREIGN KEY (assigned_admin_id)
        REFERENCES users(user_id)
);


-- 2. Ticket conversation messages
CREATE TABLE messages (
    message_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    ticket_id BIGINT NOT NULL,
    sender_user_id BIGINT NOT NULL,

    message_body TEXT NOT NULL,
    attachment_url TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_message_sender
        FOREIGN KEY (sender_user_id)
        REFERENCES users(user_id)
);


-- 3. Private admin notes
CREATE TABLE internal_notes (
    note_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    ticket_id BIGINT NOT NULL,
    admin_user_id BIGINT NOT NULL,

    note_body TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_note_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets(ticket_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_note_admin
        FOREIGN KEY (admin_user_id)
        REFERENCES users(user_id)
);
