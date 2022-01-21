-- query 1
-- Write a query to display the member id, member name, city and membership status who are all having life time membership.
-- Hint: Life time membership status is “Permanent”.
select member_id,member_name,city,membership_status

from lms_members

where membership_status='permanent';

select*from lms_book_issue;
 

-- query 2 
-- Write a query to display the member id, member name who have not returned the books. Hint: Book return status is book_issue_status ='Y' or 'N'.

select bd.book_code,bd.publication,bd.price,sd.SUPPLIER_NAME,

count(bi.book_code)

From lms_book_details bd

join lms_suppliers_details sd 

join lms_book_issue bi

on sd.SUPPLIER_ID= bd.SUPPLIER_ID 

and bd.BOOK_CODE=bi.BOOK_CODE

group by bd.BOOK_CODE

Having count(bi.book_code)=(select count(Book_code)

from lms_book_issue

group by book_code

order by count(Book_code)desc

limit 1);


-- query 3
-- Write a query to display the member id, member name who have taken the book with book code 'BL000002'.

select member_id,member_name 

from lms_members 

where member_id in

(select member_id 

from lms_book_issue

where book_code like'%02');


-- query 4 
-- Write a query to display the book code, book title and author of the books whose author name begins with 'P'.

select book_code,author,book_title

from lms_book_details

where author like 'p%';


-- query 5
-- Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.

select count(category) no_of_books

from lms_book_details 

where category ='java'; 


-- query 6
-- Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.

select category,count(category) no_of_book

from lms_book_details

where category ='java' or category='C'

group by category; 


-- query 7
-- Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.

select count(author) no_of_books

from lms_book_details

where publication like 'p%'; 


-- query 8
-- Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".

select book_title,book_code

from lms_book_details

where book_code in

(select book_code 

from lms_book_issue

where date_issue ='2012-04-01');


-- query 9
-- Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.

select member_id,member_name,date_register,date_expire

from lms_members

where date_expire<'2013-04-00';


-- query 10
-- write a query to display the member id, member name, date of registration, membership status of the members who registered before "March 2012" 
-- and membership status is "Temporary"

select member_name,member_id,date_register,membership_status

from lms_members

where membership_status='temporary' and date_register<'2012-03-00';


-- query 11
-- Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint: Display the member name in title case with alias name 'Name'.


select member_id,member_name name,city

from lms_members

where city='delhi' or city='chennai';


-- query 12
-- Write a query to concatenate book title, author and display in the following format.

-- Book_Title_is_written_by_Author
-- Example: Let Us C_is_written_by_Yashavant Kanetkar
-- Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name.

select concat(book_title,'_Is_Written_by_',author)

from lms_book_details;


-- query 13
-- Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.

select avg(price) as averageprice from lms_book_details

where category='java';



-- query 14
-- Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.

select supplier_id,supplier_name,email

from lms_suppliers_details

where email like '%gmail%';


-- query 15
-- Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone number or email or address with 
-- alias name “CONTACTDETAILS”. If phone number is null then display email, even if email also null then display the address of the supplier. Hint: Use Coalesce function.

SELECT supplier_Name,supplier_id, 

COALESCE(contact,email,address) contactaddress

FROM lms_suppliers_details;

select supplier_name,supplier_id,contact,

if (contact is null,'no','yes') 

from lms_suppliers_details;


-- query 16
-- Write a query to display the member id, member name of the members, book code and book title of the books taken by them.

SELECT m.MEMBER_ID, m.MEMBER_NAME, m.CITY,m.membership_status,

SUM(f.FINE_AMOUNT) AS Fine

FROM LMS_MEMBERS m JOIN

LMS_BOOK_ISSUE i ON m.MEMBER_ID = i.MEMBER_ID 

JOIN

LMS_FINE_DETAILS f ON i.FINE_RANGE = f.FINE_RANGE

GROUP BY m.MEMBER_ID, m.MEMBER_NAME, m.CITY,m.membership_status;

-- avg problems


-- query 1
-- Write a query to display the member id, member name of the members, book code and book title of the books taken by them.

select member_id,member_name,book_title,book_code

from lms_members

join 

lms_fine_details;


-- query 2
-- Write a query to display the total number of books available in the library with alias name “NO_OF_BOOKS_AVAILABLE” (Which is not issued).
--  Hint: The issued books details are available in the LMS_BOOK_ISSUE table.



select count(book_code)no_books_available

from lms_book_details 

where book_code not in (select book_code from lms_book_issue);


-- query 3
-- Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100.

select m.member_id,m.member_name,f.fine_range,sum(f.fine_amount)

from lms_members m

join

lms_fine_details f

join

lms_book_issue bi

on m.member_id=bi.member_id and

f.fine_range=bi.fine_range

group by m.member_id

having sum(f.fine_amount)>100; 


-- query 4
-- Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is "6”. 
-- Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.

select book_code,book_title,

publication,price,book_edition,publish_date

from lms_book_details

order by book_edition,publication,publish_date ;


-- query 5
-- Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in ascending order.

select book_code,book_title,rack_num

from lms_book_details

where rack_num='A1'

ORDER BY BOOK_title;


-- query 6
-- Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date. 
-- Hint: Date_return is due date and Date_returned is actual book return date.



select m.member_id,m.member_name,bi.date_return,bi.date_returned

from lms_members m

join

lms_book_issue bi

on m.member_id=bi.member_id

where date_return != date_returned;


-- query 7
-- Write a query to display the member id, member name and date of registration who have not taken any book.

select m.member_id,m.member_name,m.date_register

from lms_members m

where member_id not in(select member_id from lms_book_issue);


-- query 8
-- Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.

select member_id,member_name 

from

lms_members 

where 

member_id not in(select bi.member_id 

from lms_book_issue bi

join lms_fine_details f

on f.fine_range=bi.fine_range

where year(date_returned)=2012

group by bi.member_id

having sum(f.fine_amount)>0);


-- query 9
-- Write a query to display the date on which the maximum numbers of books were issued and the number of books issued with alias name “NOOFBOOKS”.


select count(date_issue)no_of_books,date_issue from lms_book_issue

group by book_code

having count(date_issue)=

(select count(date_issue)

from lms_book_issue

group by date_issue

order by count(date_issue)desc


limit 1);

-- query 10
-- Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’.

select book_title,supplier_id

from lms_book_details

where author like 'h%'

and supplier_id='S01'

and book_edition=5;


-- query 11
-- Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.

select count(rack_num)no_of_books,rack_num

from lms_book_details

group by rack_num

order by count(rack_num);


-- query 12
-- Write a query to display book issue number, member name, date or registration, date of expiry, book title, category author,
-- price, date of issue, date of return, actual returned date, issue status, fine amount.

select member_name,book_title,category,author,price,

date_issue,date_return,date_returned,book_issue_no

fine_amount

from lms_book_details

join lms_members

join lms_suppliers_details

join lms_book_issue

join lms_fine_details;


-- query 13
-- Write a query to display the book code, title, publish date of the books which is been published in the month of December.
select book_code,book_title,publish_date

from lms_book_details

where month(publish_date)=12;


-- query 14
-- Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is "5”. 
-- Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.

select book_code,book_title,bd.supplier_id,max(price)

,supplier_name

from lms_book_details bd 

join lms_suppliers_details sd

on sd.supplier_id=bd.supplier_id

group by supplier_id;


-- query 15

select book_code,book_title,

publication,datediff(current_date,publish_date)no_of_days

from lms_book_details

order by datediff(current_date,publish_date) ;

select * from LMS_BOOK_ISSUE ;

select * from lms_members;

select * from LMS_BOOK_DETAILS;

select * from LMS_FINE_DETAILS;

select * from LMS_SUPPLIERS_DETAILS;





-