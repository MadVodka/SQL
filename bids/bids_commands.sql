#1
SELECT users.full_name,
       a.bid_id,
       a.title
FROM users
INNER JOIN
  (SELECT bids.bid_id,
          bids.users_user_id,
          items.title
   FROM items
   INNER JOIN bids ON items.item_id = bids.items_item_id) as a ON users.user_id = a.users_user_id
WHERE user_id=1;

#2
SELECT users.user_id,
       users.full_name,
       items.title
FROM users
INNER JOIN items ON users.user_id = items.users_user_id
WHERE users.user_id = 5;

#3
SELECT title
FROM items
WHERE title LIKE '%зо%';

#4
SELECT title,
       description
FROM items
WHERE description LIKE '%кожа%';

#5
SELECT users.user_id,
       users.full_name,
       avg(items.start_price) as avg_price
FROM users
INNER JOIN items ON users.user_id = items.users_user_id
GROUP BY users.user_id;

#6
SELECT items.item_id,
       items.title,
       max(bids.bid_value) as max_bid_price
FROM items
INNER JOIN bids ON items.item_id = bids.items_item_id
GROUP BY items.item_id;

#7
SELECT users.user_id,
       users.full_name,
       items.title
FROM users
INNER JOIN items ON users.user_id = items.users_user_id
WHERE current_date() <= items.stop_date;

#8
INSERT INTO users (full_name, billing_address, login, password)
VALUES ('Стивен Сигал', 'Ижкомбанк', 'steve', 'v438vwj21');

#9
INSERT INTO items (title, description, start_price, bid_increment, start_date, stop_date, users_user_id)
VALUES ('Стол', 'Офисный стол из дуба', '400', '20', '2019-08-23', '2019-09-01', '6');

#10
DELETE
FROM bids
WHERE users_user_id = 4;

#11
DELETE
FROM items
WHERE users_user_id = 3;

#12
UPDATE items
SET start_price=start_price*2
WHERE users_user_id=1;