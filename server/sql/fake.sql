
INSERT INTO users_roles (name) VALUES
    ('admin'),
    ('moderator'),
    ('user');


INSERT INTO users (role_id, name, email, password) VALUES
    (3, 'hola', 'some@lol.com', 'lolo'),
    (3, 'hola', 'some@lol.com', 'lolo'),
    (3, 'hola', 'some@lol.com', 'lolo'),
    (3, 'hola', 'some@lol.com', 'lolo');


SELECT * FROM users WHERE email LIKE "%@gmail.com"


INSERT INTO categories (name) VALUES
    ('tech'),
    ('clothes'),
    ('transport');


INSERT INTO subcategories (category_id, name) VALUES
    (2, 'tshirt'),
    (2, 'shoes'),
    (3, 'car');


INSERT INTO products_descs (name, price, description) VALUES
    ('Some tshirt', 20, 'Amazing tshirt desc...'),
    ('Some car', 20, 'Amazing car desc...'),
    ('Some shoes', 20, 'Amazing shoes desc...');


INSERT INTO products (user_id, subcategory_id, products_desc_id) VALUES
    (1, 1, 1),
    (2, 2, 3),
    (3, 3, 2);


-- delete user
DELETE FROM users WHERE users.id = 4;


-- update product description
UPDATE products_descs SET description = 'some new desc' WHERE products_descs.id = 1;


-- product page instance
SELECT products_descs.name, products_descs.price, products_descs.description, users.name, users.email FROM products_descs
    INNER JOIN products
        ON products.products_desc_id = products_descs.id
    INNER JOIN users
        ON products.user_id = users.id;


-- user with role
SELECT users.name, users.email, users.status, users_roles.name FROM users
    INNER JOIN users_roles
        ON users.role_id = users_roles.id;






