/*
 Navicat Premium Data Transfer

 Source Server         : BackendTest
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : localhost:5432
 Source Catalog        : restdbtest
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 20/10/2022 22:34:01
*/


-- ----------------------------
-- Sequence structure for customer_customer_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "customer_customer_id_seq";
CREATE SEQUENCE "customer_customer_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for forspan_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "forspan_no_seq";
CREATE SEQUENCE "forspan_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for gendor_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "gendor_no_seq";
CREATE SEQUENCE "gendor_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "order_no_seq";
CREATE SEQUENCE "order_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for shiptment_shipment_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "shiptment_shipment_no_seq";
CREATE SEQUENCE "shiptment_shipment_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for size_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "size_no_seq";
CREATE SEQUENCE "size_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for style_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "style_no_seq";
CREATE SEQUENCE "style_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for style_type_no_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "style_type_no_seq";
CREATE SEQUENCE "style_type_no_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 32767
START 1
CACHE 1;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS "admin";
CREATE TABLE "admin" (
  "user" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(60) COLLATE "pg_catalog"."default",
  "password" varchar(25) COLLATE "pg_catalog"."default",
  "position" varchar(25) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS "bill";
CREATE TABLE "bill" (
  "order_no" int8 NOT NULL,
  "status" int2,
  "price" numeric(10,2)
)
;

-- ----------------------------
-- Records of bill
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "customer";
CREATE TABLE "customer" (
  "customer_id" int8 NOT NULL DEFAULT nextval('customer_customer_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "surname" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO "customer" ("customer_id", "name", "surname", "type") VALUES (1, 'cc', 'ca', 'ge');
INSERT INTO "customer" ("customer_id", "name", "surname", "type") VALUES (2, 'ae', 'cd', 'ae');
INSERT INTO "customer" ("customer_id", "name", "surname", "type") VALUES (3, 'ff', 'fh', 'ge');
COMMIT;

-- ----------------------------
-- Table structure for forspan
-- ----------------------------
DROP TABLE IF EXISTS "forspan";
CREATE TABLE "forspan" (
  "no" int8 NOT NULL DEFAULT nextval('forspan_no_seq'::regclass),
  "key" varchar(50) COLLATE "pg_catalog"."default",
  "value" int4,
  "price" float8
)
;

-- ----------------------------
-- Records of forspan
-- ----------------------------
BEGIN;
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (1, 'gendor', 1, 20);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (2, 'gendor', 2, 25);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (3, 'size', 1, 250);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (4, 'size', 2, 300);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (5, 'size', 3, 325);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (6, 'size', 4, 350);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (7, 'size', 5, 400);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (8, 'style_type', 1, 50);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (9, 'style_type', 2, 75);
INSERT INTO "forspan" ("no", "key", "value", "price") VALUES (10, 'style_type', 3, 120);
COMMIT;

-- ----------------------------
-- Table structure for gendor
-- ----------------------------
DROP TABLE IF EXISTS "gendor";
CREATE TABLE "gendor" (
  "no" int2 NOT NULL DEFAULT nextval('gendor_no_seq'::regclass),
  "gendor" varchar(20) COLLATE "pg_catalog"."default",
  "gendor_en" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of gendor
-- ----------------------------
BEGIN;
INSERT INTO "gendor" ("no", "gendor", "gendor_en") VALUES (1, 'ชาย', 'men');
INSERT INTO "gendor" ("no", "gendor", "gendor_en") VALUES (2, 'หญิง', 'women');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS "order";
CREATE TABLE "order" (
  "no" int8 NOT NULL DEFAULT nextval('order_no_seq'::regclass),
  "customer_id" int8,
  "price_total" float8,
  "order_date" timestamp(0),
  "status" int2
)
;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS "order_list";
CREATE TABLE "order_list" (
  "order_no" int8 NOT NULL,
  "list_no" int4 NOT NULL,
  "gendor" varchar(20) COLLATE "pg_catalog"."default",
  "style" int2,
  "size" int2,
  "price" float8,
  "amount" int4,
  "amount_price" numeric(10,2)
)
;

-- ----------------------------
-- Records of order_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shiptment
-- ----------------------------
DROP TABLE IF EXISTS "shiptment";
CREATE TABLE "shiptment" (
  "shipment_no" int8 NOT NULL DEFAULT nextval('shiptment_shipment_no_seq'::regclass),
  "order_no" int8,
  "receiver" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "sub_dis" varchar(60) COLLATE "pg_catalog"."default",
  "dist" varchar(60) COLLATE "pg_catalog"."default",
  "province" varchar(60) COLLATE "pg_catalog"."default",
  "zip" varchar(5) COLLATE "pg_catalog"."default",
  "ex_date" date,
  "trace" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2,
  "admin" varchar(255) COLLATE "pg_catalog"."default",
  "tel" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of shiptment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS "size";
CREATE TABLE "size" (
  "no" int2 NOT NULL DEFAULT nextval('size_no_seq'::regclass),
  "size" varchar(5) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of size
-- ----------------------------
BEGIN;
INSERT INTO "size" ("no", "size") VALUES (2, 'S');
INSERT INTO "size" ("no", "size") VALUES (1, 'XS');
INSERT INTO "size" ("no", "size") VALUES (3, 'M');
INSERT INTO "size" ("no", "size") VALUES (4, 'L');
INSERT INTO "size" ("no", "size") VALUES (5, 'XL');
COMMIT;

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS "style";
CREATE TABLE "style" (
  "no" int2 NOT NULL DEFAULT nextval('style_no_seq'::regclass),
  "style_type" int2,
  "style_value" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of style
-- ----------------------------
BEGIN;
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (1, 1, 'Red');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (2, 1, 'Black');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (3, 1, 'Green');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (4, 2, 'dots');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (5, 2, 'drawing');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (6, 2, 'calligraphy');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (7, 3, 'Batman');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (8, 3, 'Iron Man');
INSERT INTO "style" ("no", "style_type", "style_value") VALUES (9, 3, 'Spiderman');
COMMIT;

-- ----------------------------
-- Table structure for style_type
-- ----------------------------
DROP TABLE IF EXISTS "style_type";
CREATE TABLE "style_type" (
  "no" int2 NOT NULL DEFAULT nextval('style_type_no_seq'::regclass),
  "style_type" varchar(25) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of style_type
-- ----------------------------
BEGIN;
INSERT INTO "style_type" ("no", "style_type") VALUES (1, 'Plain color');
INSERT INTO "style_type" ("no", "style_type") VALUES (2, 'Patterns');
INSERT INTO "style_type" ("no", "style_type") VALUES (3, 'Figures');
COMMIT;

-- ----------------------------
-- View structure for product
-- ----------------------------
DROP VIEW IF EXISTS "product";
CREATE VIEW "product" AS  SELECT concat(gendor.no, size.no, st.style_no, st.styleno) AS product,
    gendor.gendor_en,
    size.size,
    st.style,
    pr.price AS gprice,
    sz.price AS sprice,
    slt.price AS tprice,
    sz.price + pr.price + slt.price AS price
   FROM gendor
     CROSS JOIN size
     CROSS JOIN ( SELECT style_type.no AS style_no,
            style.no AS styleno,
            concat(style_type.style_type, ' ', style.style_value) AS style
           FROM style,
            style_type
          WHERE style_type.no = style.style_type) st
     LEFT JOIN ( SELECT forspan.value,
            forspan.price
           FROM forspan
          WHERE forspan.key::text = 'gendor'::text) pr ON gendor.no = pr.value
     LEFT JOIN ( SELECT forspan.value,
            forspan.price
           FROM forspan
          WHERE forspan.key::text = 'size'::text) sz ON size.no = sz.value
     LEFT JOIN ( SELECT forspan.value,
            forspan.price
           FROM forspan
          WHERE forspan.key::text = 'style_type'::text) slt ON st.style_no = slt.value;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "customer_customer_id_seq"
OWNED BY "customer"."customer_id";
SELECT setval('"customer_customer_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "forspan_no_seq"
OWNED BY "forspan"."no";
SELECT setval('"forspan_no_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "gendor_no_seq"
OWNED BY "gendor"."no";
SELECT setval('"gendor_no_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "order_no_seq"
OWNED BY "order"."no";
SELECT setval('"order_no_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "shiptment_shipment_no_seq"
OWNED BY "shiptment"."shipment_no";
SELECT setval('"shiptment_shipment_no_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "size_no_seq"
OWNED BY "size"."no";
SELECT setval('"size_no_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "style_no_seq"
OWNED BY "style"."no";
SELECT setval('"style_no_seq"', 9, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "style_type_no_seq"
OWNED BY "style_type"."no";
SELECT setval('"style_type_no_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table admin
-- ----------------------------
ALTER TABLE "admin" ADD CONSTRAINT "admin_pkey" PRIMARY KEY ("user");

-- ----------------------------
-- Primary Key structure for table bill
-- ----------------------------
ALTER TABLE "bill" ADD CONSTRAINT "bill_pkey" PRIMARY KEY ("order_no");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

-- ----------------------------
-- Primary Key structure for table forspan
-- ----------------------------
ALTER TABLE "forspan" ADD CONSTRAINT "forspan_pkey" PRIMARY KEY ("no");

-- ----------------------------
-- Primary Key structure for table gendor
-- ----------------------------
ALTER TABLE "gendor" ADD CONSTRAINT "gendor_pkey" PRIMARY KEY ("no");

-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE "order" ADD CONSTRAINT "order_pkey" PRIMARY KEY ("no");

-- ----------------------------
-- Primary Key structure for table order_list
-- ----------------------------
ALTER TABLE "order_list" ADD CONSTRAINT "order_list_pkey" PRIMARY KEY ("order_no", "list_no");

-- ----------------------------
-- Primary Key structure for table shiptment
-- ----------------------------
ALTER TABLE "shiptment" ADD CONSTRAINT "shiptment_pkey" PRIMARY KEY ("receiver");

-- ----------------------------
-- Primary Key structure for table size
-- ----------------------------
ALTER TABLE "size" ADD CONSTRAINT "size_pkey" PRIMARY KEY ("no");

-- ----------------------------
-- Primary Key structure for table style
-- ----------------------------
ALTER TABLE "style" ADD CONSTRAINT "style_pkey" PRIMARY KEY ("no");

-- ----------------------------
-- Primary Key structure for table style_type
-- ----------------------------
ALTER TABLE "style_type" ADD CONSTRAINT "style_type_pkey" PRIMARY KEY ("no");
