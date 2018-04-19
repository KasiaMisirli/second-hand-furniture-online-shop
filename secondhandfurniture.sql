CREATE DATABASE secondhandfurniture; 

CREATE TABLE items (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) 
    ON DELETE CASCADE,
    description VARCHAR(400),
    price VARCHAR(100),
    pricetype VARCHAR(100),
    location VARCHAR(400)
);
INSERT INTO items (name, user_id, description, price, pricetype, location) VALUES ('Kasia', 1 , 'I want to sell my table' , '$10',  'non-negotiable','Reservoir');

CREATE TABLE users (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tel VARCHAR(100),
    password_digest VARCHAR(400) NOT NULL
);
INSERT INTO users (name, email, tel) VALUES ('Kasia', 'kasia.misirli@gmail.com', 'tel');
ALTER TABLE users RENAME COLUMN password TO password_digest; 


CREATE TABLE images (
    id SERIAL4 PRIMARY KEY,
    image VARCHAR(600),
    item_id INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items (id) 
    ON DELETE CASCADE
);
INSERT INTO images (image, item_id) VALUES ('table', 'https://secure.img1-fg.wfcdn.com/im/40312735/resize-h800%5Ecompr-r85/3888/38882205/Carlisle+Extendable+Dining+Table.jpg');