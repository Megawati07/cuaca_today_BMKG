massage('Loading Packages')
library(rvest)
library(rlang)
library(mongolite)

massage('Scraping Data Cuaca')

# Mengambil data dari website
url <- "https://www.bmkg.go.id/cuaca/prakiraan-cuaca-indonesia.bmkg"
html <- read_html(url)
count <- html_text(html_nodes(html, ".maincounter-number"), trim=T)

# Menampiln data dengan tabel
data<- html %>% html_nodes("table") %>% html_table()
data

# Mendefinisikan nama variabel
data2 <- data[[2]]
data3 <- data2[-c(2,3,4,5),]
colnames(data3)<- c("X1" = "Kota", "X2" = "Perkiraan Cuaca Pagi", "X3" = "Perkiraan Cuaca Siang","X4" = "Perkiraan Cuaca Malam", "X5" = "Perkiraan Cuaca Dini Hari", "X6" = "Suhu", "X7" = "Kelembapan" )
data3

# Memisahkan Variabel Suhu menjadi minimum dan maksimum
d1 <- data.frame(do.call('rbind', strsplit(as.character(data3$`Suhu`),'-',fixed=TRUE)))
colnames(d1)<- c("X1" = "Suhu_Minimum", "X2" = "Suhu_Maksimum")
d1

# Memisahkan Variabel Kelembapan menjadi minimum dan maksimum
d2 <- data.frame(do.call('rbind', strsplit(as.character(data3$`Kelembapan`),'-',fixed=TRUE)))
colnames(d2)<- c("X1" = "Kelembapan_Minimum", "X2" = "Kelembapan_Maksimum")
d2

# Mengganti variabel Suhu dan Kelembapan dengan variabel suhu min max
data4 <- cbind(data3[,-c(6,7)], d1, d2)
data4

# Mengubah variabel-variabel tertentu menjadi numerik
variabel_ubah <- c("Suhu_Minimum", "Suhu_Maksimum", "Kelembapan_Minimum", "Kelembapan_Maksimum" )  
data4[,variabel_ubah] <- sapply(data4[,variabel_ubah], as.numeric)
data4

# Mengurutkan data berdasarkan suhu maksimum
datafix <- data4[order(data4$Suhu_Maksimum,decreasing = T),]

# Mongo db 
massage('Input Data ke MongoDB Atlas')
atlas_connect <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db         = Sys.getenv("ATLAS_DB"),
  url        = Sys.getenv("ATLAS_URL")
)

atlas_connect$insert(datafix)
rm(atlas_connect)
