# Business Contact Interaction Tracking System (November 2024)

## About
A relational database to track interactions between business contacts, developed as the final project for my Introduction to Database Management Systems course.

Note: the "docs" folder contains the full conceptual and logical data models as well as the project report.

## Enhanced Entity-Relationship (EER) Diagram

![eer-diagram](https://github.com/user-attachments/assets/2052f00a-0835-48c9-9bd2-d256a072d669)

## Data Dictionary

| Entity | Attribute | Description | Data Type and Length | Nulls |
| ------ | --------- | ----------- | -------------------- | ----- |
| Employee | userID | unique ID number of each employee in tracking system | VARCHAR(10) | no |
|          | firstName | employee's first name | VARCHAR(50) | no |
|          | lastName | employee's last name | VARCHAR(50) | no |
|          | jobTitle | employee's job title | VARCHAR(100) | no |
| Contact | salutation | honorific for contact | VARCHAR(10) | yes |
|         | secretaryID | ID number of contact's secretary | VARCHAR(10) | yes |
|         | personalComments | comments about contact | VARCHAR(500) | yes |
| Address | addressType | type of address (office, home, mailing) | VARCHAR(10) | no |
|         | streetAddress | street address | VARCHAR(200) | no |
|         | city | city | VARCHAR(50) | no |
|         | state | state (2-letter abbreviation) | VARCHAR(2) | no |
|         | zipCode | ZIP code (9-digit) | VARCHAR(9) | no |
| PhoneNumber | phoneNumberType | type of phone number (office, home, cell, fax) | VARCHAR(10) | no |
|             | phoneNumber | phone number | VARCHAR(10) | no |
| Email Address | emailAddressType | type of email address (office, home) | VARCHAR(10) | no |
|               | emailAddress | email address | VARCHAR(150) | no |
| InteractionEvent | eventID | unique ID number of each interaction in tracking system | VARCHAR(25) | no |
|                  | interactionEventType | type of interaction (phone call, email, postal mail) | VARCHAR(10) | no |
|                  | date | date of interaction | DATE | no |
|                  | comments | comments about interaction | VARCHAR(500) | yes |
| Company | companyID | unique ID number of each company in tracking system | VARCHAR(10) | no |
|         | companyName | company name | VARCHAR(100) | no |

## Relations

| Relation | Primary Key | Foreign Key |
| -------- | ----------- | ----------- |
| Employee (userID, firstName, lastName, jobTitle, companyID) | userID | companyID references Company (companyID) |
| Contact (userID, salutation, secretaryID, personalComments) | userID | userID references Employee (userID)<br>secretaryID references Employee (userID) |
| Subordinate (subordinateID, managerID, companyID) | subordinateID | subordinateID references Employee (userID)<br>managerID references Employee (userID)<br>(subordinateID, companyID) references Employee (userID, companyID)<br>(managerID, companyID) references Employee (userID, companyID) |
| Address (userID, addressType, streetAddress, city, state, zipCode) | (userID, addressType) | userID references Employee (userID) |
| PhoneNumber (userID, phoneNumberType, phoneNumber) | (userID, phoneNumberType) | userID references Employee (userID) |
| EmailAddress (userID, emailAddressType, emailAddress) | (userID, emailAddressType) | userID references Employee (userID) |
| InteractionEvent (eventID, interactionEventType, date, comments) | eventID | N/A |
| InteractionEventParticipation (eventID, userID) | (eventID, userID) | eventID references InteractionEvent (eventID)<br>userID references Employee (userID) |
| Company (companyID, companyName) | companyID | N/A |

## Constraints

In addition to the constraints specified in the conceptual design (data dictionary), every employee can have only one address of each address type, one phone number of each phone number type, and one email address of each email address type.

