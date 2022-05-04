DROP DATABASE IF EXISTS ts_server;
CREATE DATABASE ts_server;

USE ts_server;

CREATE TABLE IF NOT EXISTS roles (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(role_id) REFERENCES roles(id)
);


CREATE TABLE IF NOT EXISTS messages (
    id INT NOT NULL AUTO_INCREMENT,
    receiver_id INT NOT NULL,
    expeditor_id INT NOT NULL,
    content INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(receiver_id) REFERENCES users(id)
    FOREIGN KEY(expeditor_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS Room (
    id INT NOT NULL AUTO_INCREMENT,
    admin_id INT NOT NULL,
    RoomName VARCHAR(255) NOT NULL,
    code INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(admin_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS GroupUser (
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
    
);

CREATE TABLE IF NOT EXISTS ListRoom (
    id INT NOT NULL AUTO_INCREMENT,
    RoomName VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id) REFERENCES Room(id)
);


INSERT INTO roles (name) VALUES("chatter");
INSERT INTO roles (name) VALUES("admin");
INSERT INTO users (username, password, role_id) VALUES("Bedo","toto",1);
INSERT INTO users (username, password, role_id) VALUES("Styven","toto",1);
INSERT INTO users (username, password, role_id) VALUES("Enzo","toto",2);
INSERT INTO users (username, password, role_id) VALUES("Karl","toto",2);
