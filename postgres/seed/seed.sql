BEGIN TRANSACTION;

INSERT into users (name, email, entries, joined) values ('Test', 'test@test.com', 3, '2018-08-08 23:11:06.179');

INSERT into login (hash, email) values ('$2a$10$Fo2QnC/f0vTQesmgGE36y.oQJCcV/dmGiIsEYKq5FaOxcGeeFYxmW','test@test.com');

COMMIT;