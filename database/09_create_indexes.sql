
-- 09_create_indexes.sql

-- Author lookups
CREATE INDEX idx_authors_user_id
ON authors(user_id);

-- Book lookups
CREATE INDEX idx_books_author_id
ON books(author_id);

-- Platform lookups
CREATE INDEX idx_book_platforms_book_id
ON book_platforms(book_id);

-- Ticket filtering and sorting
CREATE INDEX idx_tickets_author_id
ON tickets(author_id);

CREATE INDEX idx_tickets_status
ON tickets(status);

CREATE INDEX idx_tickets_category
ON tickets(category);

CREATE INDEX idx_tickets_priority
ON tickets(priority);

CREATE INDEX idx_tickets_created_at
ON tickets(created_at);

CREATE INDEX idx_tickets_assigned_admin
ON tickets(assigned_admin_id);

-- Message history
CREATE INDEX idx_messages_ticket_id
ON messages(ticket_id);

CREATE INDEX idx_messages_sender
ON messages(sender_user_id);

-- Internal notes
CREATE INDEX idx_internal_notes_ticket_id
ON internal_notes(ticket_id);

