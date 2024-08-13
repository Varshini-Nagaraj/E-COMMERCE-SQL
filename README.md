1.SELECT Reviews.rating, Reviews.comment, Users.name AS reviewer, Reviews.review_date
FROM Reviews
JOIN Users ON Reviews.user_id = Users.user_id
WHERE Reviews.product_id = 1;
![AMAZON 1](https://github.com/user-attachments/assets/0b0c26b4-ffa0-4af3-9c60-7524ea642ce5)


  2.SELECT * FROM Products
WHERE category = 'Electronics';
![AMAZON 2](https://github.com/user-attachments/assets/0e3b0820-a529-4804-ba1c-240c2b0df31c)
