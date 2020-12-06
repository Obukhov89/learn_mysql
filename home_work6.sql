USE snet0611;

/* Задание №1

Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, 
который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

SELECT 
	from_user_id AS 'Отправитель',
	to_user_id AS 'Получатель', 
	COUNT(id) AS 'sum' 
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id ORDER BY sum DESC LIMIT 1; 

/* Задание №2

Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
*/

SELECT 
	COUNT(*) as 'Сумма лайков'
FROM likes_user 
WHERE users_id IN (
  SELECT users_id FROM users WHERE (birthday + INTERVAL 10 YEAR) > NOW()); 

/* Задание №3

Определить кто больше поставил лайков (всего): мужчины или женщины.
 */ 

 
 SELECT IF(
(SELECT COUNT(*) FROM likes_user WHERE users_id IN (
SELECT users_id FROM users WHERE gender = 'm')
)
>
(SELECT COUNT(*) FROM likes_user WHERE users_id IN (
SELECT users_id FROM users WHERE gender = 'f')
) ,
'male', 'female') AS cnt;
 
