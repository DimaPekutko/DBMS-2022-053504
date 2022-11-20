DROP TABLE IF EXISTS users_roles    CASCADE;
DROP TABLE IF EXISTS users          CASCADE;
DROP TABLE IF EXISTS users_logs     CASCADE;
DROP TABLE IF EXISTS categories     CASCADE;
DROP TABLE IF EXISTS subcategories  CASCADE;
DROP TABLE IF EXISTS products_descs CASCADE;
DROP TABLE IF EXISTS products       CASCADE;
DROP TABLE IF EXISTS product_images CASCADE;


CREATE TABLE IF NOT EXISTS users_roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    role_id INT REFERENCES users_roles(id) ON DELETE SET NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    status VARCHAR(100) NOT NULL DEFAULT 'active'
);


CREATE TABLE IF NOT EXISTS users_logs (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE SET NULL,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS subcategories (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id) ON DELETE CASCADE,
    name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS products_descs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    description VARCHAR(1000) NOT NULL
);


CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    subcategory_id INT REFERENCES subcategories(id) ON DELETE SET NULL,
    products_desc_id INT REFERENCES products_descs(id) ON DELETE SET NULL,
    status VARCHAR(100) NOT NULL DEFAULT 'active'
);


CREATE TABLE IF NOT EXISTS product_images (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE CASCADE,
    url VARCHAR(300)
);


CREATE INDEX users_idx          ON users (id);
CREATE INDEX products_idx       ON products (id);
CREATE INDEX products_descs_idx ON products_descs (id);

