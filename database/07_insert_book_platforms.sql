INSERT INTO book_platforms (book_id, platform_name)
SELECT
    b.book_id,
    v.platform_name
FROM (VALUES
    ('BK001', 'Amazon India'),
    ('BK001', 'Flipkart'),
    ('BK001', 'BookLeaf Store'),

    ('BK002', 'Amazon India'),
    ('BK002', 'BookLeaf Store'),

    ('BK003', 'Amazon India'),
    ('BK003', 'Flipkart'),
    ('BK003', 'Amazon US'),
    ('BK003', 'BookLeaf Store'),

    ('BK004', 'Amazon India'),
    ('BK004', 'Flipkart'),
    ('BK004', 'Amazon US'),
    ('BK004', 'Amazon UK'),
    ('BK004', 'BookLeaf Store'),

    ('BK005', 'Amazon India'),
    ('BK005', 'BookLeaf Store'),

    ('BK006', 'Amazon India'),
    ('BK006', 'Flipkart'),
    ('BK006', 'BookLeaf Store'),

    ('BK007', 'Amazon India'),
    ('BK007', 'BookLeaf Store'),

    ('BK008', 'Amazon India'),
    ('BK008', 'Flipkart'),
    ('BK008', 'BookLeaf Store'),

    ('BK009', 'Amazon India'),
    ('BK009', 'Amazon US'),
    ('BK009', 'BookLeaf Store'),

    ('BK010', 'Amazon India'),
    ('BK010', 'BookLeaf Store'),

    ('BK011', 'Amazon India'),
    ('BK011', 'Flipkart'),
    ('BK011', 'Amazon US'),
    ('BK011', 'BookLeaf Store'),

    ('BK012', 'Amazon India'),
    ('BK012', 'Flipkart'),
    ('BK012', 'BookLeaf Store'),

    ('BK014', 'Amazon India'),
    ('BK014', 'BookLeaf Store'),

    ('BK016', 'Amazon India'),
    ('BK016', 'BookLeaf Store'),

    ('BK017', 'Amazon India'),
    ('BK017', 'Flipkart'),
    ('BK017', 'Amazon US'),
    ('BK017', 'BookLeaf Store'),

    ('BK018', 'Amazon India'),
    ('BK018', 'BookLeaf Store')
) AS v(source_book_id, platform_name)
JOIN books b
    ON b.source_book_id = v.source_book_id
ON CONFLICT (book_id, platform_name) DO NOTHING;