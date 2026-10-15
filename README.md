# My Donat - siap deploy di Railway

## Langkah
1. Extract zip, upload ISI folder ini ke repository GitHub baru
   (Dockerfile, railway.json, schema.sql, folder www harus di paling luar).
2. railway.com -> New Project -> **Deploy from GitHub repo** -> pilih repo.
3. Di project yang sama: **+ New -> Database -> Add MySQL**.
4. Klik service web (repo kamu) -> **Variables** -> tambahkan (Add Reference / ketik manual):
   - MYSQLHOST     = ${{MySQL.MYSQLHOST}}
   - MYSQLPORT     = ${{MySQL.MYSQLPORT}}
   - MYSQLUSER     = ${{MySQL.MYSQLUSER}}
   - MYSQLPASSWORD = ${{MySQL.MYSQLPASSWORD}}
   - MYSQLDATABASE = ${{MySQL.MYSQL_DATABASE}}
   - SETUP_KEY     = kunci rahasia buatanmu
   (jika nama service database-mu bukan "MySQL", ganti bagian depan referensinya)
5. Service web -> **Settings -> Networking -> Generate Domain**.
6. Buka `https://DOMAIN-KAMU/setup.php?key=ISI_SETUP_KEY` -> harus muncul "OK".
7. Buka `/login.php` dan daftar akun admin.

## Catatan
- Upload gambar baru disimpan di database (tidak hilang saat redeploy). Maks 3 MB.
- Hapus variable SETUP_KEY setelah setup selesai.
- Data lama dari XAMPP: export di phpMyAdmin, import ke MySQL Railway.
