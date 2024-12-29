CREATE USER 'vaniliauser'@'localhost' IDENTIFIED BY 'vanilia';
CREATE USER 'vaniliauser'@'%' IDENTIFIED BY 'vanilia';
GRANT SELECT ON frankfurtdb.* TO 'vaniliauser'@'localhost';
GRANT SELECT ON frankfurtdb.* TO 'vaniliauser'@'%';

CREATE USER 'verikokouser'@'localhost' IDENTIFIED BY 'verikoko';
CREATE USER 'verikokouser'@'%' IDENTIFIED BY 'verikoko';
GRANT ALL PRIVILEGES ON frankfurtdb.* TO 'verikokouser'@'localhost';
GRANT ALL PRIVILEGES ON frankfurtdb.* TO 'verikokouser'@'%';

CREATE USER 'pasenger'@'%' IDENTIFIED BY 'pasenger';
GRANT INSERT ON frankfurtdb.passenger TO 'pasenger'@'%';