-- Active: 1700629920401@@127.0.0.1@3306@ngukurban
CREATE DATABASE IF NOT EXISTS ngukurban;

USE ngukurban;

CREATE TABLE IF NOT EXISTS user (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password_user VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS ban (
  id_ban INT AUTO_INCREMENT PRIMARY KEY,
  id_user INT,
  foto_ban VARCHAR(200) NOT NULL,
  FOREIGN KEY (id_user) REFERENCES user(id_user) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS perbandingan_ban (
  id_perbandingan_ban INT AUTO_INCREMENT PRIMARY KEY,
  id_ban INT,
  status_perbandingan_ban VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_ban) REFERENCES ban(id_ban) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS kondisi_ban (
  id_kondisi_ban INT AUTO_INCREMENT PRIMARY KEY,
  id_ban INT,
  id_perbandingan_ban INT,
  status_kondisi_ban VARCHAR(100) NOT NULL,
  FOREIGN KEY (id_ban) REFERENCES ban(id_ban) ON DELETE CASCADE,
  FOREIGN KEY (id_perbandingan_ban) REFERENCES perbandingan_ban(id_perbandingan_ban) ON DELETE CASCADE
) ENGINE=InnoDB;