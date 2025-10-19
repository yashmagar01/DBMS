Create database pr7;
use pr7;

create table Orders(
	cust_id INT auto_increment Primary key NOT NULL,
    order_id INT,
    items VARCHAR(500),
    amount decimal(8,2)
);

-- Data for table Orders
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (1, 101, 'Pancake, Cream Roll', 500);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (2, 102, 'Birthday Cake, Chocolate Muffin', 750);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (3, 103, 'Anniversary Cake, Vanilla Cupcake', 600);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (4, 104, 'Brownie, Strawberry Shortcake', 450);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (5, 105, 'Cheese Puff, Fruit Tart', 550);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (6, 106, 'Pineapple Pastry, Chocolate Cake', 800);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (7, 107, 'Mango Mousse, Almond Biscotti', 650);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (8, 108, 'Black Forest Cake, Cookies', 700);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (9, 109, 'Tiramisu, Coconut Ladoo', 560);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (10, 110, 'Red Velvet Cake, Cream Cheese Brownies', 720);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (11, 111, 'Lemon Tart, Choco Lava Cake', 580);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (12, 112, 'Gulab Jamun, Khoya Pastry', 530);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (13, 113, 'Maple Syrup Pancakes, Cashew Cookies', 610);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (14, 114, 'Rasmalai Cake, Butter Puffs', 490);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (15, 115, 'Pistachio Cake, Chocolate Chip Cookies', 670);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (16, 116, 'Peach Tart, Eclairs', 630);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (17, 117, 'Baklava, Marzipan Cake', 740);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (18, 118, 'Cupcakes, Pavlova', 660);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (19, 119, 'Fruit Cake, Milk Cake', 580);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (20, 120, 'Chocolate Torte, Donuts', 500);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (21, 121, 'Fudge Cake, Scones', 550);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (22, 122, 'Banana Bread, Fruit Mousse', 720);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (23, 123, 'Milk Bar Cake, Madeline', 600);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (24, 124, 'Churros, Vanilla Bean Cake', 490);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (25, 125, 'Pasta Pudding, Mocha Cake', 650);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (26, 126, 'Coconut Cake, Cinnamon Rolls', 600);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (27, 127, 'Cupcake Jar, Almond Crescent', 550);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (28, 128, 'Chocolate Souffle, Jeera Biscuits', 480);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (29, 129, 'Nut Cake, Swiss Roll', 570);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (30, 130, 'Butter Tart, Jaggery Cake', 640);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (31, 131, 'Raspberry Muffin, Fruit Slice', 430);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (32, 132, 'Choco Lava, Moon Cake', 600);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (33, 133, 'Birthday Brownie, Cheesecake', 710);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (34, 134, 'Tart, Pudding Cake', 480);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (35, 135, 'Milky Way Cake, Baklava', 690);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (36, 136, 'Saffron Cake, Cookies', 550);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (37, 137, 'Cheesecake Brownie, Coconut Ladoo', 620);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (38, 138, 'Eggless Cake, Platters', 580);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (39, 139, 'Peanut Butter Cookies, Vanilla Cake', 700);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (40, 140, 'Chocolate Chip Muffins, Eclairs', 450);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (41, 141, 'Fruit Tarts, Gulab Jamun Cake', 560);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (42, 142, 'Carrot Cake, Brown Butter Cookies', 620);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (43, 143, 'Chocolate Mousse, Birthday Cookies', 550);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (44, 144, 'Paneer Pastry, Kheer Pudding', 520);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (45, 145, 'Chocolate Fudge Cake, Kaju Katli', 680);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (46, 146, 'Custard Cake, Vanilla Pudding', 540);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (47, 147, 'Patties, Cup Cakes', 650);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (48, 148, 'Choco Hazelnut Tart, Milky Way', 610);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (49, 149, 'Almond Cake, Butterscotch Cake', 670);
INSERT INTO Orders (cust_id, order_id, items, amount) VALUES (50, 150, 'Paneer Tikka Puff, Eggless Chocolate Muffin', 550);


-- step 1
Select cust_id, order_id, items, amount, amount + 200 as total_amount 
From Orders;

-- step 2
Select cust_id, order_id, items, amount, amount - 100 as offer_price
From Orders;

-- step 3
Select cust_id, order_id, items, amount, amount * 5 as revised_amount
From Orders;

-- step 4
Select cust_id, order_id, items, amount, amount / 2 as half_amount
From Orders;

