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
Hasil scraping yang terlihat pada Mongo DB
1. Provinsi dengan suhu tertinggi
  ```
  {"_id":{"$oid":"6489cbb1576a68de080021b1"},"Kota":"Manokwari",
  "Perkiraan Cuaca Siang":"Berawan"
  "Suhu_Minimum":{"$numberDouble":"24.0"},
  Suhu_Maksimum":{"$numberDouble":"32.0"},
  "Kelembapan_Minimum":{"$numberDouble":"70.0"},
  "Kelembapan_Maksimum":{"$numberDouble":"95.0"},
  "hari_scrap":"2023-06-14",
  "jam_scrap":"2023-06-14 14:16:15.437179"}
   ```
2. Provinsi dengan suhu terendah
  ```
  {"_id":{"$oid":"6489cbb1576a68de080021bf"},
  "Kota":"Samarinda","Perkiraan Cuaca Siang":"Berawan",
  "Suhu_Minimum":{"$numberDouble":"23.0"},
  "Suhu_Maksimum":{"$numberDouble":"28.0"},
  "Kelembapan_Minimum":{"$numberDouble":"85.0"},
  "Kelembapan_Maksimum":{"$numberDouble":"100.0"},
  "hari_scrap":"2023-06-14",
  "jam_scrap":"2023-06-14 14:16:15.437179"}
  ```
## :bar_chart: Visualisasi
 
## :fairy_woman: Pengembang
Megawati (G1501221026) https://github.com/Megawati07
