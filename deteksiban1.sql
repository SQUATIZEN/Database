import mysql.connector
import cv2
import numpy as np

#KoneksiKeDatabase
conn = mysql.connector.connect(
    host="mariadb",
    user="root",
    password="password",
    database="ngukurban"
)
cursor = conn.cursor()

# MenyimpanDataBanDanHasilPengukurannyaKedalamDatabase
sql = "INSERT INTO Ban (id_ban, id_user, foto_ban) VALUES (%s, %s, %s)"
values = (id_ban, id_user, foto_ban)
cursor.execute(sql, values)
conn.commit()

#MendapatkanIndikatorTingkatKeausanDariDatabase
indicator_sql = "SELECT indikatoryangdipake FROM indikatoryangdipake"
cursor.execute(indicator_sql)
indicators = cursor.fetchall()

#MembandingkanHasilPengukurandDenganIndikatorTingkatKeausan
result = ""
for indicator in indicators:
    indicator_value = indicator[0]
    if hasilPengukuran >= indicator_value:
        result = "Ban Aus"
        break
    else:
        result = "Ban Bagus"

# MenampilkanHasilPengukuran
print("Hasil pengukuran ban:", hasilPengukuran)
print("Status ban:", result)

# Menutup koneksi
cursor.close()
conn.close()
