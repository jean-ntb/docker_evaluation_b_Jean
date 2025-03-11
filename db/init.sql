-- Création des bases de données
CREATE DATABASE IF NOT EXISTS docker_doc;
CREATE DATABASE IF NOT EXISTS docker_doc_dev;

-- Création de l'utilisateur db_client avec le bon mode d'authentification
CREATE USER IF NOT EXISTS 'db_client'@'%' IDENTIFIED WITH mysql_native_password BY 'password';

-- Accorder les privilèges nécessaires
GRANT ALL PRIVILEGES ON docker_doc.* TO 'db_client'@'%';
GRANT ALL PRIVILEGES ON docker_doc_dev.* TO 'db_client'@'%';
FLUSH PRIVILEGES;

-- Sélectionner et configurer la base docker_doc
USE docker_doc;
CREATE TABLE IF NOT EXISTS article (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(32),
    body TEXT
);

-- Sélectionner la base docker_doc_dev et créer la table article
USE docker_doc_dev;
CREATE TABLE IF NOT EXISTS article (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(32),
    body TEXT
);

-- Insertion des données de test dans docker_doc_dev
INSERT INTO article (title, body) VALUES
('Docker overview', 'Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly'),
('What is a container?', 'Imagine you’re developing a killer web app that has three main components - a React frontend, a Python API, and a PostgreSQL database. If you wanted to work on this project, you’d have to install Node, Python, and PostgreSQL.');
