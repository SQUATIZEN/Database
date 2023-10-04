-- Membuat pengguna admin
CREATE USER 'admin'@'nama_host' IDENTIFIED BY 'admin123';

-- Memberikan hak penuh (ALL PRIVILEGES) pada tabel Kondisi Ban kepada pengguna admin
GRANT ALL PRIVILEGES ON ngukurban.kondisi_ban TO 'admin'@'nama_host';

-- Membuat pengguna biasa
CREATE USER 'user'@'nama_host' IDENTIFIED BY 'user123';

-- Memberikan akses baca (SELECT) pada tabel Kondisi Ban kepada pengguna biasa
GRANT SELECT ON ngukurban.kondisi_ban TO 'user'@'nama_host';

-- Mencabut akses baca (SELECT) pada tabel Kondisi Ban dari pengguna biasa
REVOKE SELECT ON ngukurban.kondisi_ban FROM 'user'@'nama_host';