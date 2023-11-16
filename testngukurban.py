from ngukurban import NgukurBanBackend

# Import class and functions here

if __name__ == "__main__":
    # Create an instance of NgukurBanBackend class
    backend = NgukurBanBackend()

    # Call the desired methods
    backend.simpan_user("John", "john@example.com", "password123")
    backend.simpan_ban(1, "foto_ban.jpg")
    backend.simpan_perbandingan_ban(1, "completed")
    backend.simpan_kondisi_ban(1, 1, "good_condition")