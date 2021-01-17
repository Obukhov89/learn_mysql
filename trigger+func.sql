-- функция на проверку лайков пользователей книгам 
delimiter //
create function books_in_user (obj_id bigint,obj_type varchar(20))
returns boolean reads sql data 
	
	case obj_type
		when `user_books`then
			return exists (select 1 from user_books where id = obj_id);
		when `users`then
			return exists (select 1 from users where id = obj_id);
		else
			return false;
		end case;

delimiter ;
--тригер на лайки
delimiter


create trigger like_validation before insert on likes
for each row
begin 
	if !is_row_exists(new.obj_id, new.obj_type) then
		signal sqlstate '45000'
		set message_text = "Error adding like! Target table doesn't contain row id provided!";
	end if;
end//

delimiter ;