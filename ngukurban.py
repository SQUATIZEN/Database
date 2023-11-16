import sqlite3

class NgukurBanBackend:
    def __init__(data):
        data.conn = sqlite3.connect("ngukurban.db")
        data.cursor = data.conn.cursor()
        data.create_tables()  # Panggil fungsi ini untuk membuat tabel jika belum ada

    def create_tables(data):
        with open(
            "deteksiban.sql", "r"
        ) as sql_file:  # Pastikan nama file dan pathnya sesuai
            sql_script = sql_file.read()
        data.cursor.executescript(sql_script)
        data.conn.commit()  # Simpan perubahan ke database

    def simpan_user(data, username, email, password_user):
        try:
            data.cursor.execute(
                "INSERT INTO user (username, email, password_user) VALUES (?, ?, ?)",
                (username, email, password_user),
            )
            data.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error:", str(e))
            return False

    def simpan_ban(data, id_user, foto_ban):
        try:
            data.cursor.execute(
                "INSERT INTO ban (id_user, foto_ban) VALUES (?, ?)",
                (id_user, foto_ban),
            )
            data.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error:", str(e))
            return False

    def simpan_perbandingan_ban(data, id_ban, status_perbandingan_ban):
        try:
            data.cursor.execute(
                "INSERT INTO perbandingan_ban (id_ban , status_perbandingan_ban) VALUES (?, ?)",
                (id_ban, status_perbandingan_ban),
            )
            data.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error:", str(e))
            return False
    
    def simpan_kondisi_ban(data, id_ban, id_perbandingan_ban, status_kondisi_ban):
        try:
            data.cursor.execute(
                "INSERT INTO kondisi_ban (id_ban ,id_perbandingan_ban , status_kondisi_ban) VALUES (?, ?, ?)",
                (id_ban, id_perbandingan_ban, status_kondisi_ban),
            )
            data.conn.commit()  # Simpan perubahan ke database
            return True
        except Exception as e:
            print("Error saat menyimpan kondisi ban:", str(e))
            return False