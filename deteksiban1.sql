import mysql.connector
import cv2
import numpy as np

#Koneksikedatabase
conn = mysql.connector.connect(
    host="mariadb",
    user="root",
    password="password",
    database="ngukurban"
)
cursor = conn.cursor()

# Menyimpandatabandanhasilpengukurannyakedalamdatabase
sql = "INSERT INTO Ban (id_ban, id_user, foto_ban) VALUES (%s, %s, %s)"
values = (id_ban, id_user, foto_ban)
cursor.execute(sql, values)
conn.commit()

#Mendapatkanindikatortingkatkeausandaridatabase
indicator_sql = "SELECT tread_depth_indicator FROM TreadDepthIndicator"
cursor.execute(indicator_sql)
indicators = cursor.fetchall()

#Membandingkanhasilpengukurandenganindikatortingkatkeausan
result = ""
for indicator in indicators:
    indicator_value = indicator[0]
    if tread_depth >= indicator_value:
        result = "Ban Aus"
        break
    else:
        result = "Ban Baik"

# Menampilkan hasil pengukuran
print("Hasil pengukuran ban:", tread_depth)
print("Status ban:", result)

# Menutup koneksi
cursor.close()
conn.close()
