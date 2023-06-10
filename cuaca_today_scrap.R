message('Loading Packages')
library(rvest)
library(rlang)
library(mongolite)

message('Scraping Data Cuaca')

# Mengambil data dari website
url <- "https://www.bmkg.go.id/cuaca/prakiraan-cuaca-indonesia.bmkg"
html <- read_html(url)

# Menampiln data dengan tabel
data<- html %>% html_nodes("table") %>% html_table()

# Mendefinisikan nama variabel
data2 <- data[[2]]
nc<-ncol(data2)
data3 <- data2[-c(2,3,4,5),c(1,2,nc-1,nc)] # hanya mengambil perkiraan cuaca siang
colnames(data3)<- c("X1" = "Kota", "X2" = "Perkiraan Cuaca Siang", "X3" = "Suhu", "X4" = "Kelembapan" )

# Memisahkan Variabel Suhu menjadi minimum dan maksimum
d1 <- data.frame(do.call('rbind', strsplit(as.character(data3$`Suhu`),'-',fixed=TRUE)))
colnames(d1)<- c("X1" = "Suhu_Minimum", "X2" = "Suhu_Maksimum")

# Memisahkan Variabel Kelembapan menjadi minimum dan maksimum
d2 <- data.frame(do.call('rbind', strsplit(as.character(data3$`Kelembapan`),'-',fixed=TRUE)))
colnames(d2)<- c("X1" = "Kelembapan_Minimum", "X2" = "Kelembapan_Maksimum")

# Mengganti variabel Suhu dan Kelembapan dengan variabel suhu min max
data4 <- cbind(data3[,-c(3,4)], d1, d2)

# Mengubah variabel-variabel tertentu menjadi numerik
variabel_ubah <- c("Suhu_Minimum", "Suhu_Maksimum", "Kelembapan_Minimum", "Kelembapan_Maksimum" )  
data4[,variabel_ubah] <- sapply(data4[,variabel_ubah], as.numeric)

# Mengurutkan data berdasarkan suhu maksimum
datafix <- data4[order(data4$Suhu_Maksimum,decreasing = T),]

# Mongo db 
message('Input Data ke MongoDB Atlas')
atlas_connect <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db         = Sys.getenv("ATLAS_DB"),
  url        = Sys.getenv("ATLAS_URL")
)

atlas_connect$insert(datafix)
rm(atlas_connect)

