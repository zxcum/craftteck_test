-- Для Postgres 13 
-- Создать таблицы

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    total_amount REAL NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Добавить данные
INSERT INTO Users (name, email) VALUES
    ('Иван Иванов', 'ivan@example.com'),
    ('Петр Петров', 'petr@example.com'),
    ('Сергей Сергеев', 'sergey@example.com');

INSERT INTO Orders (user_id, total_amount) VALUES
    (1, 10000.00),  -- Заказы для первого пользователя (Иван Иванов)
    (1, 20.00),
    (2, 150.00),  -- Заказы для второго пользователя (Петр Петров)
    (2, 300.25),
    (3, 7000.00),   -- Заказы для третьего пользователя (Сергей Сергеев)
    (3, 3000.00),
    (3, 125.00);


-- Код для вывода имени и суммы заказов пользователя
SELECT Users.name, SUM(Orders.total_amount) AS total
FROM Users
JOIN Orders ON Users.id = Orders.user_id
GROUP BY Users.id
HAVING SUM(Orders.total_amount) > 1000;