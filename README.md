# Cuaca di Indonesia Hari ini

<p align="center">
  <img width="800" height="200" src="https://github.com/Megawati07/cuaca_today_BMKG/blob/main/gambar1.jpg">
</p>

<div align="center">
 
  
[Tentang](#scroll-tentang)
•
[Dokumen](#green_book-dokumen)
•
[Visualisasi](#bar_chart-visualisasi)
•
[Pengembang](#bar_chart-pengembang)

</div>

## :scroll: Tentang
Indonesia merupakan negara beriklim tropis yang mempunyai dua musim, yaitu musim hujan dan musim kemarau. Perlu diingat bahwa cuaca di Indonesia dapat sangat bervariasi antar wilayah. Beberapa wilayah di Indonesia seperti Sumatera, Kalimantan, Sulawesi, dan Papua, memiliki hutan hujan tropis dan curah hujan yang tinggi sepanjang tahun. Sementara itu, wilayah-wilayah seperti Bali, Nusa Tenggara, dan sebagian Jawa, umumnya memiliki iklim kering dengan curah hujan yang lebih rendah.

Penting untuk selalu memperhatikan perkiraan cuaca terkini dari BMKG dan mengikuti informasi peringatan cuaca jika ada. Oleh karena itu project kali ini akan dilakukan scraping data cuaca di Indonesia yang bersumber dari website resmi Badan Meteorologi Klimatologi dan Geofisika (BMKG) https://www.bmkg.go.id/cuaca/prakiraan-cuaca-indonesia.bmkg. Website ini berisi informasi mengenai perkiraan cuaca, suhu dan kelembapan udara di masing-masing provinsi di Indonesia yang diwakili oleh ibu kota provinsi itu sendiri.

## :green_book: Dokumen
Contoh  **input** scraping yang terlihat pada Mongo DB
1. Provinsi dengan suhu tertinggi
  ```
{"_id":{"$oid":"6489cbb1576a68de080021a3"},
"Kota":"Surabaya",
"Perkiraan Cuaca Siang":"Cerah Berawan",
"Suhu_Minimum":{"$numberDouble":"26.0"},
"Suhu_Maksimum":{"$numberDouble":"34.0"},
"Kelembapan_Minimum":{"$numberDouble":"50.0"},
"Kelembapan_Maksimum":{"$numberDouble":"85.0"},
"hari_scrap":"2023-06-14",
"jam_scrap":"2023-06-14 14:16:15.437179"}
   ```
2. Provinsi dengan suhu terendah
  ```
  {"_id":{"$oid":"6489cbb1576a68de080021bf"},
  "Kota":"Samarinda",
  "Perkiraan Cuaca Siang":"Berawan",
  "Suhu_Minimum":{"$numberDouble":"23.0"},
  "Suhu_Maksimum":{"$numberDouble":"28.0"},
  "Kelembapan_Minimum":{"$numberDouble":"85.0"},
  "Kelembapan_Maksimum":{"$numberDouble":"100.0"},
  "hari_scrap":"2023-06-14",
  "jam_scrap":"2023-06-14 14:16:15.437179"}
  ```
Contoh **output** scraping yang terlihat pada Mongo DB
|    ID    | Kota      | Perkiraan Cuaca Siang | Suhu Min (°C) | Suhu Max (°C) | Kelembapan Min | Kelembapan Max |Tanggal     |Waktu (jam)  |
|:---------|:----------|:----------------------|:--------------|:--------------|:---------------|:---------------|:-----------|:------------|
| ...021b1 | Surabaya  | Cerah Berawan         |       26      |       34      |      50        |       85       |14 Juni 2023| 14:16:15    |
| ...021bf | Samarinda | Berawan               |       23      |       28      |      85        |       100      |14 Juni 2023| 14:16:15    |

Tabel diatas menunjukkan Provinsi Jawa Timur yang diwakili oleh Kota Surabaya memiliki suhu tertinggi yaitu 34(°C) sedangkan Provinsi Kalimantan Timur yang diwakili oleh Kota Samarinda menjadi daerah dengan suhu paling rendah yaitu 28(°C). Cuaca kedua provinsi tersebut diperkirakan berawan pada hari Rabu, 14 Juni 2023 pukul 14.16 WITA.
 
## :bar_chart: Visualisasi

<img width="800" height="200" src="C:/Users/Mega/OneDrive/DATA D/SEMESTER 2/Management Data Statistika/Project Praktikum UAS MDS/Suhu Max.jpg">
 
## :fairy_woman: Pengembang
Megawati (G1501221026) https://github.com/Megawati07
