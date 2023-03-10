use warehouse;

-- Find the item that has minimum weight.
SELECT ITEMNO, DESCRIPTION, WEIGHT
FROM ITEMS
WHERE WEIGHT = (SELECT MIN(WEIGHT) FROM ITEMS);

-- Find the different warehouses in “New York”.
SELECT *
FROM WAREHOUSES
WHERE CITY = 'New York';

-- Find the details of items ordered by a customer “John Doe”.
SELECT O.ONO, ODATE, I.ITEMNO, I.DESCRIPTION, I.WEIGHT, I.COST
FROM ORDERS O
INNER JOIN ORDER_ITEMS OI ON O.ONO = OI.ONO
INNER JOIN ITEMS I ON OI.ITEMNO = I.ITEMNO
INNER JOIN CUSTOMER C ON O.CNO = C.CNO
WHERE C.CNAME = 'John Doe';


-- Find a Warehouse which has maximum stores.
SELECT W.WID, W.WNAME, COUNT(S.WID) AS STORE_COUNT
FROM WAREHOUSES W
INNER JOIN STORES S ON W.WID = S.WID
GROUP BY W.WID, W.WNAME
ORDER BY STORE_COUNT DESC
LIMIT 1;

-- Find an item which is ordered for a minimum number of times.
SELECT I.ITEMNO, I.DESCRIPTION, COUNT(*) AS ORDER_COUNT
FROM ITEMS I
INNER JOIN ORDER_ITEMS OI ON I.ITEMNO = OI.ITEMNO
GROUP BY ITEMNO, DESCRIPTION
ORDER BY ORDER_COUNT
LIMIT 1;

-- Find the detailed orders given by each customer.
SELECT C.CNO, C.CNAME, O.ONO, O.ODATE, I.ITEMNO, I.DESCRIPTION, I.WEIGHT, I.COST
FROM CUSTOMER C
INNER JOIN ORDERS O ON C.CNO = O.CNO
INNER JOIN ORDER_ITEMS OI ON O.ONO = OI.ONO
INNER JOIN ITEMS I ON OI.ITEMNO = I.ITEMNO;
