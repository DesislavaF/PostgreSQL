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

