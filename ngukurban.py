import json
import sqlite3


class NgukurBanBackend:
    def __init__(self):
        self.conn = sqlite3.connect("ngukurban")
        self.cursor = self.conn.cursor()

    def create_tables(self):
        with open(
            "deteksiban.sql", "r"
        ) as sqlfile:  # Pastikan nama file dan pathnya sesuai
            sqlscript = sqlfile.read()
        self.cursor.executescript(sqlscript)
        self.conn.commit()  # Simpan perubahan ke database

    def save_user(
        self,
        id_user,
        username,
        email,
        password_user,
    ):
        try:
            self.cursor.execute(
                "INSERT INTO user (id_user, username, email, password_user,) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                (
                     id_user,
                     username,
                     email,
                     password_user,
                ),
            )
            self.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error:", str(e))
            return False

    def save_perbandingan_ban(self, id_perbandingan_ban, id_ban, status_perbandingan_ban):
        try:
            # Mengonversi list deskripsi menjadi format JSON
        
            self.cursor.execute(
                "INSERT INTO perbandingan_ban (id_perbandingan_ban, id_ban, status_perbandingan_ban) VALUES (?, ?, ?)"
            )
            self.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error saat menyimpan data kategori:", str(e))
            return False


    def save_gambar_ban(self, image_ban):
        try:
            self.cursor.execute(
                "INSERT INTO gambar_ban (image_data) VALUES (?)", (image_ban,)
            )
            self.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error saat menyimpan data gambar:", str(e))
            return False