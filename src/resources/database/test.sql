create schema if not exists test default character set utf8;
use test;
drop table if exists books;
create table books(id int(10) not null auto_increment,
				   title varchar(100),
                   description varchar(255),
                   author varchar(100),
                   isbn int(20),
                   printYear int(4),
                   readAlready boolean,
                   primary key (id))
 engine = innoDB
 default character set = utf8;
 insert into books (title, description, author, isbn, printYear, readAlready) values
 ('title_1', 'description_1', 'author_1', 1, 1991, false),
 ('title_2', 'description_2', 'author_2', 2, 1992, false),
 ('title_3', 'description_3', 'author_3', 3, 1993, false),
 ('title_4', 'description_4', 'author_4', 4, 1994, false),
 ('title_5', 'description_5', 'author_5', 5, 1995, false),
 ('title_6', 'description_6', 'author_6', 6, 1996, false),
 ('title_7', 'description_7', 'author_7', 7, 1997, false),
 ('title_8', 'description_8', 'author_8', 8, 1998, false),
 ('title_9', 'description_9', 'author_9', 9, 1999, false),
 ('title_10', 'description_10', 'author_10', 10, 2001, false),
 ('title_11', 'description_11', 'author_11', 11, 2002, false),
 ('title_12', 'description_12', 'author_12', 12, 2003, false),
 ('title_13', 'description_13', 'author_13', 13, 2004, false),
 ('title_14', 'description_14', 'author_14', 14, 2005, false),
 ('title_15', 'description_15', 'author_15', 15, 2006, false),
 ('title_16', 'description_16', 'author_16', 16, 2007, false),
 ('title_17', 'description_17', 'author_17', 17, 2008, false),
 ('title_18', 'description_18', 'author_18', 18, 2009, false),
 ('title_19', 'description_19', 'author_19', 19, 2010, false),
 ('title_20', 'description_20', 'author_20', 20, 2011, false),
 ('title_21', 'description_21', 'author_21', 21, 2012, false),
 ('title_22', 'description_22', 'author_22', 22, 2013, false),
 ('title_23', 'description_23', 'author_23', 23, 2014, false),
 ('title_24', 'description_24', 'author_24', 24, 2015, false),
 ('title_25', 'description_25', 'author_25', 25, 2016, false);
