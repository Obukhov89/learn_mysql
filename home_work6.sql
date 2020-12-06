USE snet0611;

/* ������� �1

����� ����� ��������� ������������. 
�� ���� ������������� ���. ���� ������� ��������, 
������� ������ ���� ������� � ��������� ������������� (������� ��� ���������).
*/

SELECT 
	from_user_id AS '�����������',
	to_user_id AS '����������', 
	COUNT(id) AS 'sum' 
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id ORDER BY sum DESC LIMIT 1; 

/* ������� �2

���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���..
*/

SELECT 
	COUNT(*) as '����� ������'
FROM likes_user 
WHERE users_id IN (
  SELECT users_id FROM users WHERE (birthday + INTERVAL 10 YEAR) > NOW()); 

/* ������� �3

���������� ��� ������ �������� ������ (�����): ������� ��� �������.
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
 
