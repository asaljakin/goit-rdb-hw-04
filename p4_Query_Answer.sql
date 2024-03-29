USE mydb;

-- 1) Визначте, скільки рядків ви отримали (за допомогою оператора COUNT).
SELECT COUNT(*) as total FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
;

-- 2)Змініть декілька операторів INNER на LEFT чи RIGHT. Визначте, що відбувається з кількістю рядків. Чому? Напишіть відповідь у текстовому файлі.
SELECT COUNT(*) as total FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id
LEFT JOIN employees ON orders.employee_id = employees.employee_id
LEFT JOIN shippers ON orders.shipper_id = shippers.id
LEFT JOIN order_details ON orders.id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.id
LEFT JOIN suppliers ON products.supplier_id = suppliers.id
LEFT JOIN categories ON products.category_id = categories.id;

-- Коли змінюєтся тип зв'язку з INNER JOIN на LEFT JOIN або RIGHT JOIN, кількість обраних рядків змінюється через різницю в тому, як ці зв'язки обробляють відсутні збіги між таблицями:
-- INNER JOIN повертає рядки лише тоді, коли існує збіг у обох таблицях. Якщо збігів немає, рядки не включаються до результату.
-- LEFT JOIN повертає всі рядки з лівої таблиці, незалежно від того, чи є збіги в правій таблиці. Для рядків, які не мають збігів, у правій таблиці будуть значення NULL.
-- RIGHT JOIN працює протилежно до LEFT JOIN і повертає всі рядки з правої таблиці, а також збіги з лівої таблиці.
-- Таким чином, якщо змінювати INNER JOIN на LEFT JOIN або RIGHT JOIN, можливо отримати більше рядків у результаті, оскільки може включати рядки, які не мають збігів у зв'язаній таблиці,
--  заповнюючи відсутні дані значеннями NULL.
-- В данному випадку при змінні INNER JOIN на LEFT JOIN кількість рядків не зміниласьб тому що всі значення присутні у всіх з'єднаних таблицях.

-- 3)Оберіть тільки ті рядки, де employee_id > 3 та ≤ 10.
SELECT COUNT(*) as total FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
WHERE employees.employee_id>3 AND employees.employee_id<=10
;

-- 4)Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, 
-- середню кількість товару (кількість товару знаходиться в order_details.quantity)
SELECT 
	categories.name, 
    COUNT(*) as total,
    AVG(order_details.quantity) as avg_quantity
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
WHERE employees.employee_id>3 AND employees.employee_id<=10
GROUP BY categories.name
;

-- 5)Відфільтруйте рядки, де середня кількість товару більша за 21.
SELECT categories.name, AVG(order_details.quantity), COUNT(*) as total FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
WHERE employees.employee_id>3 AND employees.employee_id<=10
GROUP BY categories.name
HAVING AVG(order_details.quantity)>21;

-- 6)Відсортуйте рядки за спаданням кількості рядків. 
SELECT categories.name, AVG(order_details.quantity), COUNT(*) as total FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
WHERE employees.employee_id>3 AND employees.employee_id<=10
GROUP BY categories.name
HAVING AVG(order_details.quantity)>21
ORDER BY total DESC;

-- 7)Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.
SELECT categories.name, AVG(order_details.quantity), COUNT(*) as total FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN employees ON orders.employee_id = employees.employee_id
INNER JOIN shippers ON orders.shipper_id = shippers.id
INNER JOIN order_details ON orders.id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.id
INNER JOIN suppliers ON products.supplier_id = suppliers.id
INNER JOIN categories ON products.category_id = categories.id
WHERE employees.employee_id>3 AND employees.employee_id<=10
GROUP BY categories.name
HAVING AVG(order_details.quantity)>21
ORDER BY total DESC
LIMIT 4 OFFSET 1;



