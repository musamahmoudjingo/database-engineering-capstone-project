# Week 2

## Exercise: Create a virtual table to summarize data

### Task 1: Created the OrdersView and used it to fetch the data below.

```sql
Select * from OrdersView;
```

| OrderID | Quantity | Cost  |
|---------|----------|-------|
|       2 |        3 |  4.50 |
|       3 |        6 | 21.45 |
|       4 |        3 | 17.70 |
|       5 |        5 | 27.70 |
|       6 |        3 | 33.35 |
|       7 |        6 | 14.60 |
|       9 |        7 | 16.40 |
|      10 |        8 | 18.95 |
|      11 |        5 | 14.00 |
|      12 |        6 | 11.70 |
| ...     | ...      | ...   |
|     987 |        5 | 32.89 |
|     988 |        7 | 23.65 |
|     989 |        4 | 13.70 |
|     991 |        3 | 22.40 |
|     994 |        4 | 23.90 |
|     995 |        4 | 19.95 |
|     998 |        6 | 30.15 |
|     999 |        5 | 25.39 |
|    1000 |        4 | 18.94 |

749 rows

### Task 2: Fetch data using a JOIN

```sql
SELECT
    Customers.CustomerID AS CustomerID,
    Customers.Name AS CustomerName,
    OrdersItems.OrderID AS OrderID,
    SUM(Menu.Price) AS Cost,
    GROUP_CONCAT(Menu.Name) AS Items
FROM OrdersItems
INNER JOIN Menu ON OrdersItems.ItemID = Menu.ItemID
INNER JOIN Orders ON OrdersItems.OrderID = Orders.OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY OrdersItems.OrderID HAVING Cost > 30
ORDER BY Cost ASC;
```

| CustomerID | CustomerName        | OrderID | Cost  | Items                                                                                                                               |
|------------|---------------------|---------|-------|-------------------------------------------------------------------------------------------------------------------------------------|
|        276 | Chauncey Alu        |     998 | 30.15 | All Vegan,Avocado Cucumber and Tomato,Prawn and Oyster Mushrooms                                                                    |
|         47 | Layla Stainton      |     824 | 30.15 | Eggs Royal with Smoked Salmon,Eggs Benedict with Honey Roast Ham,Vegan - Gluten Free Chocolate & Caramel Cake                       |
|          9 | Bruis Jenkinson     |     250 | 30.15 | Chicken and Avocado Salad,Tuna in Olive Oil, Red Onion, Tomato and Greens,Vegan Carrot Cake                                         |
|        122 | Judah Prout         |     303 | 30.15 | Eggs Royal with Smoked Salmon,Greek Salad,Vegan - Gluten Free Chocolate & Caramel Cake                                              |
|        467 | Stavros McMichell   |     288 | 30.40 | Tuna and Cheese Melt,Halloumi Salad,Chicken and Avocado Salad                                                                       |
|        302 | Elyssa Lovat        |     683 | 30.45 | Grilled Salmon with Roasted Potato,Spicy Chicken with Brie,Crispy Bacon, Chicken and Cheddar Cheese                                 |
|         33 | Joyous Dickerson    |     246 | 30.65 | Eggs Florentine with Spinach,Goats Cheese, Roasted Red Pepper and Crushed Dates Toastie,Halloumi, Parma Ham and Peppers             |
|        326 | Zacharias Crossan   |     311 | 30.65 | Grilled Halloumi Cucumber and Tomatoes,Roasted Vegetables, Goats Cheese and Caramelised Onion,Crispy Bacon, Chicken and Cheddar     |
|        239 | Donny Semor         |     364 | 30.65 | Vegan Cheese, Avocado and Tomato,Prawn and Oyster Mushrooms,Goat Cheese Salad                                                       |
|        154 | Nikki felip         |     461 | 30.69 | Spicy Chicken with Brie,Cheddar and Honey Roast Ham,Full Vegetarian English Breakfast with Latte and Juice                          |
|         56 | Mandie Gransden     |     374 | 30.90 | Eggs Florentine with Spinach,Eggs Royal with Smoked Salmon,Egg and Toast and Beans                                                  |
|         19 | Bobby Alvarado      |     698 | 31.65 | Garden Breakfast,Roast Beef Onion, Mustard and Cheese Melt,Tuna Mayo                                                                |
|        313 | Neall Iacabucci     |     659 | 31.65 | All Vegan,Grilled Salmon with Roasted Potato,Cheese Toastie                                                                         |
|          9 | Bruis Jenkinson     |     401 | 31.69 | Roasted Vegetables. Mozzarella and Pesto,Crispy Bacon, Chicken and Cheddar,Full Vegetarian English Breakfast with Latte and Juice   |
|        268 | Alastair Battabee   |     276 | 31.89 | Crushed and Peppered Avocado,Eggs Benedict with Honey Roast Ham,Full English Breakfast with Tea                                     |
|        369 | Bellina Derkes      |     576 | 32.40 | Grilled Salmon with Roasted Potato,Prawn and Oyster Mushrooms,Porridge with Honey                                                   |
|         67 | Annette Lyness      |      24 | 32.85 | Cheddar and Crispy Bacon,Avocado Cheddar and Crispy Bacon,Goat Cheese Salad                                                         |
|        408 | Robin Code          |     263 | 32.85 | Eggs Florentine with Spinach,All Vegan,Avocado Cheddar and Crispy Bacon                                                             |
|        302 | Elyssa Lovat        |     987 | 32.89 | Eggs Florentine with Spinach,Cheddar and Honey Roast Ham,Full English Breakfast with Tea                                            |
|        332 | Merna Birkbeck      |     653 | 32.89 | Cheddar and Honey Roast Ham,Greek Salad,Full Vegetarian Breakfast with Tea                                                          |
|        465 | Valenka Grindell    |       6 | 33.35 | Poached Egg on Welsh Rarebit,Roasted Vegetables, Goats Cheese and Caramelised Onion,Halloumi Salad                                  |
|        426 | Jacquie Heinsh      |     290 | 33.65 | Tuna Mayo,Avocado Cheddar and Crispy Bacon,Avocado, Mango and Walnut Salad with Grated Cheddar                                      |
|         50 | Karlyn Nangle       |      84 | 33.65 | Grilled Salmon with Roasted Potato,Chicken, Spinach and Cheddar,Cheddar and Honey Roast Ham                                         |
|        442 | Aviva Custed        |     607 | 33.85 | Prawn and Oyster Mushrooms,Greek Salad,Goat Cheese Salad                                                                            |
|          6 | Marilee Hambelton   |     662 | 33.89 | Cheddar and Crispy Bacon,Tuna Mayo,Full Vegetarian English Breakfast with Latte and Juice                                           |
|        445 | Franky Gothrup      |     395 | 33.89 | All Vegan,Goat Cheese Salad,Full English Breakfast with Latte and Juice                                                             |
|        183 | Holt De Bruijne     |     844 | 33.93 | Feta Cheese, Spinach and Tomato,Full English Breakfast with Tea,Full English Breakfast with Latte and Juice                         |
|        134 | Alaric Satterlee    |     414 | 34.85 | Honey Roast Ham and Cheddar,Chicken and Avocado Salad,Salmon, Rocket and Peppered Avocado Salad with Oilive Oil Dressing            |
|        261 | Gates Woodroff      |     341 | 35.65 | Grilled Salmon with Roasted Potato,Spicy Chicken with Brie,Prawn, Crayfish and Asparagus                                            |
|        281 | Mariel De Domenicis |     275 | 35.89 | All Vegan,Salmon, Rocket and Peppered Avocado Salad with Oilive Oil Dressing,Full Vegetarian English Breakfast with Latte and Juice |
|         41 | Saxon Guillot       |     105 | 36.85 | Grilled Salmon with Roasted Potato,Cheddar and Honey Roast Ham,Spicy Chicken and Brie                                               |
|        238 | Lewes Devonish      |     625 | 37.85 | Eggs Royal with Smoked Salmon,Cheddar and Honey Roast Ham,Prawn, Crayfish and Asparagus                                             |

### Task 3: Using a sub query.

With the structure of my database it was better to use EXISTS in my sub query instead of ANY.

Since i had created a lot of orders in the database, i did not check which items had been order more than twice. I checked which items had a quantity greater than 2 in a single order.

```sql
SELECT `Name` FROM Menu WHERE EXISTS (SELECT 1 FROM OrdersItems WHERE OrdersItems.ItemID = Menu.ItemID AND OrdersItems.Quantity > 2);
```

| Name                                                               |
|--------------------------------------------------------------------|
| Eggs Florentine with Spinach                                       |
| Two Toast                                                          |
| Roasted Vegetables and Goats Cheese                                |
| Crushed and Peppered Avocado                                       |
| Eggs Royal with Smoked Salmon                                      |
| All Vegan                                                          |
| Garden Breakfast                                                   |
| Grilled Salmon with Roasted Potato                                 |
| Scrambled Eggs with Smoked Salmon                                  |
| Eggs Benedict with Honey Roast Ham                                 |
| Roast Chicken and Rocket with Cranberry Sauce                      |
| ...                                                                |
| Pistachio Dream                                                    |
| Raspberry Cheesecake                                               |
| Lemon Cheesecake                                                   |
| Full English Breakfast with Tea                                    |
| Full English Breakfast with Latte and Juice                        |
| Light English Breakfast                                            |
| Full Vegetarian Breakfast with Tea                                 |
| Full Vegetarian English Breakfast with Latte and Juice             |
| Avocado on Toast And 2 Eggs                                        |
| Egg and Toast and Beans                                            |
| Ham and Cheese Croissants                                          |
| Porridge with Honey                                                |

103 rows

## Exercise: Create optimized queries to manage and analyze data

### Task 1: Create Stored procedure GetMaxQuantity.

```sql
CALL GetMaxQuantity();
```

| Max Quantity in Order |
|-----------------------|
|                     9 |

### Task 2: Create prepared statement GetOrderDetail

```sql
SET @OrderID = 16;
EXECUTE GetOrderDetail USING @OrderID;
```

| OrderID | OrderNumber | CustomerName  | StaffName     | OrderType | Cost  | OrderDate           |
|---------|-------------|---------------|---------------|-----------|-------|---------------------|
|      16 | Order #16   | Chadd Peoples | Annissa Ouver | OFFLINE   | 16.85 | 2023-11-19 09:23:06 |

Task 3: Create stored procedure CancelOrder.

```sql
--- My database uses a dedicated OrderStatus table ao allow tracking 
--- the order status over time instead of only the last status.
--- The second parameter is remarks stored in the OrderStatus along with the status update

CALL CancelOrder(32, 'Custumer was being disrespectful to the server, manage asked the customer to leave');
```

| Confirmation                  |
|-------------------------------|
| Order #32 has been cancelled. |

## Exercise: Create SQL queries to check available bookings based on user input

### Task 1: Insert data.

```sql
INSERT INTO Bookings (`BookingID`, `CustomerID`, `TableID`, `Date`, `Time`, `NumberOfGuests`) VALUES
(1, 1, 5, '2022-10-10', '18:00:00', 2),
(2, 2, 3, '2022-11-12', '12:00:00', 6),
(3, 3, 2, '2022-10-11', '12:00:00', 4),
(4, 4, 2, '2022-10-13', '12:00:00', 2);
```

*Please note that my database structure is different from the one in the course instructions. My bookings table includes ```CustomerID```, ```time```, ```NumberOfGuests``` and ```CreatedAt``` columns.*


```sql
SELECT * FROM Bookings;
```

| BookingID | CustomerID | TableID | Date       | Time     | NumberOfGuests | CreatedAT           |
|-----------|------------|---------|------------|----------|----------------|---------------------|
|         1 |          1 |       5 | 2022-10-10 | 18:00:00 |              2 | 2023-12-24 13:47:21 |
|         2 |          2 |       3 | 2022-11-12 | 12:00:00 |              6 | 2023-12-24 13:47:21 |
|         3 |          3 |       2 | 2022-10-11 | 12:00:00 |              4 | 2023-12-24 13:47:21 |
|         4 |          4 |       2 | 2022-10-13 | 12:00:00 |              2 | 2023-12-24 13:47:21 |

### Task 2: Check table availability

Create the stored procedure

```sql
DELIMITER //
CREATE PROCEDURE `CheckBooking` (IN CheckBookingTableID INT, IN CheckBookingDate DATE, IN CheckBookingTime TIME)
BEGIN
    DECLARE IsTableBooked INT;

    SELECT EXISTS(
        SELECT 1 FROM Bookings WHERE Bookings.TableID = CheckBookingTableID AND Bookings.Date = CheckBookingDate AND Bookings.Time = CheckBookingTime
    ) INTO IsTableBooked;

    IF IsTableBooked = 1 THEN
        SELECT CONCAT('Table ', CheckBookingTableID, ' is already booked.') AS `Booking Status`;
    ELSE
        SELECT
            CONCAT('Table ', CheckBookingTableID, ' is available.') AS `Booking Status`;
    END IF;
END //
DELIMITER ;
```

Call the stored procedure.

```sql
CALL CheckBooking(3, '2022-11-12', '12:00');
```

| Booking Status             |
|----------------------------|
| Table 3 is already booked. |

### Task 3: Create stored procedure AddValidBooking

Create the stored procedure.

```sql
DELIMITER //
CREATE PROCEDURE AddValidBooking (
    IN ParamCustomerID INT,
    IN ParamTableID INT,
    IN ParamDate DATE,
    IN ParamTime TIME,
    IN ParamNumberOfGuests INT
)
BEGIN
    DECLARE IsTableAvailable INT;

    -- Check if the table is available at the specified date and time
    SELECT NOT EXISTS(
        SELECT 1 FROM Bookings WHERE TableID = ParamTableID AND Date = ParamDate AND Time = ParamTime
    ) INTO IsTableAvailable;

    -- Start a transaction
    START TRANSACTION;

    -- Check if the table is available
    IF IsTableAvailable THEN
        -- If available, insert the booking
        INSERT INTO Bookings (CustomerID, TableID, Date, Time, NumberOfGuests, CreatedAt) VALUES 
            (ParamCustomerID, ParamTableID, ParamDate, ParamTime, ParamNumberOfGuests, CURRENT_TIMESTAMP);

        COMMIT;
        SELECT 'Table is available, booking successful.' AS `Booking Status`;
    ELSE
        ROLLBACK;
        SELECT CONCAT('Table ', ParamTableID, ' is already booked - booking canceled') AS `Booking Status`;
    END IF;
END //
DELIMITER ;
```

Call the stored procedure

```sql
CALL AddValidBooking(16, 6, '2022-12-17', '18:00:00', 2);
```

The results

| Booking Status                          |
|-----------------------------------------|
| Table is available, booking successful. |

Call the store procedure with the same parameter again and the result is;

| Booking Status                               |
|----------------------------------------------|
| Table 6 is already booked - booking canceled |

## Exercise: Create SQL queries to add and update bookings

### Task 2: UpdateBooking stored procedure

Create the stored procedure

```sql
DELIMITER //
CREATE PROCEDURE `UpdateBooking` (
    IN UpdateBookingID INT,
    IN UpdateTableID INT,
    IN UpdateDate DATE,
    IN UpdateTime TIME
)
BEGIN
    DECLARE IsNewTableAvailable INT;

    -- Check if the new table is available
    SELECT NOT EXISTS(
        SELECT 1 
        FROM Bookings 
        WHERE
            TableID = UpdateTableID
            AND Date = UpdateDate
            AND Time = UpdateTime
            AND BookingID <> UpdateBookingID
    ) INTO IsNewTableAvailable;

    START TRANSACTION;

    -- If the new table is available, update the booking
    IF IsNewTableAvailable = 1 THEN
    
        UPDATE Bookings SET
            TableID = UpdateTableID,
            Date = UpdateDate,
            Time = UpdateTime
        WHERE BookingID = UpdateBookingID;

        COMMIT;

        SELECT CONCAT('Booking ', UpdateBookingID, ' updated.') AS Confirmation;
    ELSE
        SELECT CONCAT('Table ', UpdateTableID, ' is already booked.') AS Confirmation;
    END IF;
END //
DELIMITER ;
```

Before the update

```sql
SELECT * FROM Bookings;
```

| BookingID | CustomerID | TableID | Date       | Time     | NumberOfGuests | CreatedAT           |
|-----------|------------|---------|------------|----------|----------------|---------------------|
|         1 |          1 |       5 | 2022-10-10 | 18:00:00 |              2 | 2023-12-24 13:47:21 |
|         2 |          2 |       3 | 2022-11-12 | 12:00:00 |              6 | 2023-12-24 13:47:21 |
|         3 |          3 |       2 | 2022-10-11 | 12:00:00 |              4 | 2023-12-24 13:47:21 |
|         4 |          4 |       2 | 2022-10-13 | 12:00:00 |              2 | 2023-12-24 13:47:21 |
|         5 |         16 |       6 | 2022-10-10 | 18:00:00 |              2 | 2023-12-24 14:39:54 |
|         6 |         16 |       6 | 2022-12-17 | 18:00:00 |              2 | 2023-12-24 14:41:31 |

Call the stored procedure to update a booking

```sql
CALL UpdateBooking(2, 10, '2022-12-17', '16:00');
```

Result

| Confirmation       |
|--------------------|
| Booking 2 updated. |

Bookings table after the update

| BookingID | CustomerID | TableID | Date       | Time     | NumberOfGuests | CreatedAT           |
|-----------|------------|---------|------------|----------|----------------|---------------------|
|         1 |          1 |       5 | 2022-10-10 | 18:00:00 |              2 | 2023-12-24 13:47:21 |
|         2 |          2 |      10 | 2022-12-17 | 16:00:00 |              6 | 2023-12-24 13:47:21 |
|         3 |          3 |       2 | 2022-10-11 | 12:00:00 |              4 | 2023-12-24 13:47:21 |
|         4 |          4 |       2 | 2022-10-13 | 12:00:00 |              2 | 2023-12-24 13:47:21 |
|         5 |         16 |       6 | 2022-10-10 | 18:00:00 |              2 | 2023-12-24 14:39:54 |
|         6 |         16 |       6 | 2022-12-17 | 18:00:00 |              2 | 2023-12-24 14:41:31 |

### Task 3: CancelBooking stored procedure

Create the stored procedure

```sql
DELIMITER //
CREATE PROCEDURE `CancelBooking` (IN CancelBookingID INT)
BEGIN
    DECLARE IsBookingExists INT;

    -- Check if the booking exists
    SELECT EXISTS (
        SELECT 1 FROM Bookings WHERE BookingID = CancelBookingID
    ) INTO IsBookingExists;

    START TRANSACTION;

    IF IsBookingExists = 1 THEN
        
        DELETE FROM Bookings WHERE BookingID = CancelBookingID;
        COMMIT;

        SELECT CONCAT('Booking ', CancelBookingID, ' has been cancelled.') AS Confirmation;
    ELSE
        SELECT CONCAT('Booking ', CancelBookingID, ' does not exist.') AS Confirmation;
    END IF;
END //
DELIMITER ;
```

Call the stored procedure

```sql
CALL CancelBooking(6);
```

Results

| Confirmation                  |
|-------------------------------|
| Booking 6 has been cancelled. |
