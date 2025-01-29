create table menu (
	id SERIAL primary key,
	name VARCHAR(100) not null,
	price NUMERIC(10, 2) not null
);

create table customers (
	id SERIAL primary key,
	name VARCHAR(100) not null,
	phone NUMERIC(20) not null
);

ALTER TABLE customers
RENAME COLUMN price TO phone;


create table orders (
	id SERIAL primary key,
	customer_id INTEGER not null,
	item_id INTEGER not null,
	order_data DATE not null,
	quantity INTEGER not null,
	CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES menu(id)
);

insert into menu (name, price) values 
('Pizza', 15.99),
('Burger', 14.99),
('Pasta', 12.50),
('Salad', 9.99);

insert into customers (name, phone) values 
('Desislava Filipova', '0884885535'),
('Dimitar Bandgev', '0893636927'),
('Monika Mihova', '0876003203');


insert into orders (customer_id, item_id, order_data, quantity) values 
(1, 1, '2025-01-19', 2), 
(1, 2, '2025-01-20', 1), 
(2, 3, '2025-01-02', 1), 
(3, 4, '2025-01-03', 3); 


SELECT * FROM customers;

SELECT * FROM customers WHERE name = 'Desislava Filipova';

SELECT o.id AS order_id, o.order_data, m.name AS item_name, o.quantity, m.price
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN menu m ON o.item_id = m.id
WHERE c.name = 'Desislava Filipova';
