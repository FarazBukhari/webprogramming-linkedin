﻿

/*Table structure for table "add_contact_notification" */

DROP TABLE IF EXISTS "add_contact_notification";

CREATE TABLE "add_contact_notification" (
  "id" SERIAL NOT NULL,
  "userid" integer NOT NULL references users("userid"),
  "contact_userid" integer NOT NULL references users("userid"),
  "personal_note" varchar(255) DEFAULT NULL,
  "relationid" varchar(255) NOT NULL,
  "time_date" date NOT NULL,
  PRIMARY KEY ("id")
  /*KEY "userId" ("userid"),
  KEY "contact_userId" ("contact_userid")
  CONSTRAINT "add_contact_notification_ibfk_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid"),
  CONSTRAINT "add_contact_notification_ibfk_2" FOREIGN KEY ("contact_userid") REFERENCES "users" ("userid")
*/);

/*Data for the table "add_contact_notification" */


/*Table structure for table "confirm" */

DROP TABLE IF EXISTS "confirm";

CREATE TABLE "confirm" (
  "id" SERIAL NOT NULL,
  "userid" varchar(128) NOT NULL,
  "key" varchar(128) NOT NULL,
  "email" varchar(250) DEFAULT NULL,
  PRIMARY KEY ("id")
);

/*Table structure for table "contacts_info" */

DROP TABLE IF EXISTS "contacts_info";

CREATE TABLE "contacts_info" (
  "contactId" SERIAL NOT NULL,
  "userIdd" integer DEFAULT NULL references users("userid"),
  "FName" varchar(40) NOT NULL,
  "LName" varchar(40) NOT NULL,
  "UserName" varchar(40) NOT NULL,
  "Email" varchar(40) NOT NULL,
  "Password" varchar(40) NOT NULL,
  "Type" varchar(40) NOT NULL,
  PRIMARY KEY ("contactId")
  /*KEY "userId" ("userIdd"),
  CONSTRAINT "userIdd" FOREIGN KEY ("userIdd") REFERENCES "users" ("userid") ON DELETE NO ACTION ON UPDATE NO ACTION
*/);

/*Data for the table "contacts_info" */

/*Table structure for table "relation_types" */

DROP TABLE IF EXISTS "relation_types";

CREATE TABLE "relation_types" (
  "id" SERIAL NOT NULL,
  "relation_name" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
);
/*Table structure for table "useradditionalinfo" */

DROP TABLE IF EXISTS "useradditionalinfo";

CREATE TABLE "useradditionalinfo" (
  "UserId" integer NOT NULL references users("userid"),
  "Country" varchar(255) NOT NULL,
  "PostalCode" integer NOT NULL,
  "JTitle" varchar(255) NOT NULL,
  "SelfEmp" boolean NOT NULL,
  "Company" varchar(255) DEFAULT NULL,
  "Industry" varchar(255) DEFAULT NULL,
  "TypeId" varchar(255) NOT NULL,
  "Picture" varchar(255) DEFAULT NULL,
  "thumbnail" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("UserId")
  /*KEY "userId" ("UserId"),
  KEY "typeId" ("YypeId"),
  CONSTRAINT "useradditionalinfo_ibfk_1" FOREIGN KEY ("UserId") REFERENCES "users" ("userid")
*/);
/*Table structure for table "users" */

DROP TABLE IF EXISTS "users";

CREATE TABLE "users" (
  "userid" SERIAL NOT NULL,
  "fname" varchar(255) NOT NULL,
  "lname" varchar(255) NOT NULL,
  "username" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "validate" boolean DEFAULT NULL,
  PRIMARY KEY ("userid")
);
/*Table structure for table "usertype" */

DROP TABLE IF EXISTS "usertype";

CREATE TABLE "usertype" (
  "TypeId" SERIAL NOT NULL,
  "Status" varchar(255) NOT NULL,
  PRIMARY KEY ("TypeId","Status")
);

/*Data for the table "usertype" */
