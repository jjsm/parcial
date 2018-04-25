--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "CUSTOMERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ORDERS" 
   (	"ID" NUMBER, 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "SALESMAN" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VIEW_1" ("SALES_NAME", "CUSTOMER_NAME", "COUNTRY") AS 
  SELECT s.name sales_name,c.name customer_name, c.country country
from customers c INNER JOIN  salesman s ON c.SALESMAN_ID=S.ID  WHERE c.country=s.country
--------------------------------------------------------
--  DDL for View VIEW_2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VIEW_2" ("ID", "NAME", "COUNTRY", "GRADE", "SALESMAN_ID", "SALESMAN_NAME", "COMMISSION") AS 
  select c."ID",c."NAME",c."COUNTRY",c."GRADE",c."SALESMAN_ID",s.name salesman_name ,s.commission commission  from customers c inner join salesman s on c.SALESMAN_ID=s.id where s.COMMISSION>=0.12
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VIEW_3" ("CUSTOMER_NAME", "COUNTRY", "ORDER_NUMBER", "ORDER_DATE", "ORDER_AMOUNT") AS 
  select c.name customer_name, c.country country, o.id order_number,o.order_date, o.amount order_amount 
from orders o  left join customers c on o.CUSTOMER_ID=c.id  
order by o.order_date asc
--------------------------------------------------------
--  DDL for Index SYS_C007394
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007394" ON "ORDERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007395
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007395" ON "CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007396
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007396" ON "SALESMAN" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "SALESMAN" ("ID") ENABLE
