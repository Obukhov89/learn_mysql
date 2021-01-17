/*Данная база данных разработана для сервиса онлайн библиотеки. */


create database test;

use test;

--serial = bigint unsigned not null auto_increment unique;
drop table if exists users;
create table users(
id serial,     
firstname varchar(45) not null,
lastname varchar(45) not null,
email varchar (120) default null,
phone varchar(20) default null,
birthday datetime default null,
adres varchar (100) default null,
gender char (1) default null,
created_at datetime default current_timestamp,
pas char (40) default null,
photo bigint unsigned default  null,
 primary key (id)
);

alter  table `users` add index (`lastname`);
alter table `users` add column (`user_read`int (150) not null);
alter table `users` add index (`user_read`);
alter table `users` add foreign key (`user_read`) references `user_books`(`books_read_user`);


drop table if exists user_books;
create table user_books(
id serial,
book_user_lastname varchar(45) not null,
primary key (id),
foreign key (`book_user_lastname`) references `users`(`lastname`),
foreign key (`id`) references `users` (`id`)
);

alter table user_books add column (`book_name`varchar(45) not null); 
alter table user_books add foreign key (`book_name`) references `books`(`category`);
alter table user_books add foreign key (`book_name`) references `books`(`book_name`);
alter table user_books add column (`books_read_user`int (150) not null);
alter table user_books add index (`books_read_user`);


drop table if exists books;
create table books(
id serial  ,
book_name varchar (150),
book_author varchar (150),
year_edited date not null,
number_of_pages bigint not null,
annotation varchar (10000),
category varchar (150),
primary key (id)
);

alter  table `books` add index (`book_name`);
alter  table `books` add index (`category`);

create table category_book(
id serial ,
category_name varchar(150),
category_raiting int (10) default null,
primary key (id)
);

alter table `category_book` add foreign key (`category_name`) references `books`(`category`);



create table books_authors(
id serial,
first_name varchar (45) not null,
last_name varchar(45) not null,
author_category varchar (150),
yeras_of_life datetime,
short_biography varchar(10000),
primary key (id),
foreign key (`id`) references `books`(`id`),
foreign key (`author_category`) references `category_book`(`category_name`),
foreign key (`author_category`) references `books`(`category`)

);

drop table if exists articles;
create table articles(
id serial,
article_name varchar (2500) not null,
article_author varchar (250) not null,
year_edited datetime not null,
article_annotation varchar (10000) not null,
article bigint unsigned default null,
primary key (id)
);

alter table `articles` modify column `article_name` varchar(300) not null;
alter table `articles` add index (`article_author`,`article_name`);
alter table `articles` add column (`article_category`varchar(150) default null);
alter table `articles` add index (`article_category`);
alter table `articles` add index (`article_name`);
alter table `articles` add column (`read_article`int(150)not null);
alter table `articles` add index (`read_article`);
alter table `articles` add foreign key (`read_article`) references `users` (`user_read`);

drop table if exists articles_authors;

create table articles_authors(
id serial ,
first_name varchar (45) not null,
last_name varchar(45) not null,
short_biography varchar (10000) default null,
author_category varchar (150) not null,
yeras_of_life datetime default null,
primary key (id),
foreign key (`id`) references `articles`(`id`),
foreign key (`author_category`) references `articles`(`article_author`)
);


create table articles_category(
id serial,
category_name varchar (200) default null,
article_name varchar (200) not null,
article_author varchar (200) not null,
primary key (id),
foreign key(`id`) references `articles` (`id`),
foreign key (`article_name`) references `articles`(`article_name`),
foreign key (`category_name`) references `articles`(`article_category`),
foreign key (`article_author`) references `articles_authors`(`author_category`)
);

drop table if exists likes;
create table likes(
	id serial primary key,
	user_id bigint unsigned not null,
	obj_id bigint unsigned not null,
	obj_type enum('books','authors_books','articles_authors','geners_books','articles_geners','articles'),
	foreign key (user_id) references users(id)

);


