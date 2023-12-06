CREATE DATABASE catalog_of_things;

CREATE TABLE book (
    id INTEGER PRIMARY KEY,
    publisher VARCHAR(100),
    publish_date DATE,
    cover_state VARCHAR(100),
    item_id INTEGER,
    FOREIGN KEY (item_id) REFERENCES item (id)
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150),
    color VARCHAR(150)
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (label_id) REFERENCES label (id)
);

CREATE INDEX idx_book_item_id ON book(item_id);
CREATE INDEX idx_item_label_id ON item(label_id);
