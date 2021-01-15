#Mengatur lokasi kerja
wd <- "D:/wd"
setwd(wd)
getwd()

#Memasukkan dan menggunakan dataset
dataset <- read.csv("train.csv", header = TRUE, sep = ",")
head(dataset)
input=dataset[,2:7]
head(dataset)
View(input)

#Mengunduh dan menggunakan library yang akan digunakan
install.packages("tidyverse")
install.packages("gridExtra")
install.packages("ggplot2")
install.packages("factoextra")
install.packages("cluster")
library(cluster)
library(ggplot2)
library(factoextra)
library(tidyverse)
library(gridExtra)

#Mencari jumlah cluster dari dataset
fviz_nbclust(input,kmeans,method = "silhouette")

#Membuat variabel kmeans
k3 <- kmeans(input,centers=3,nstart = 25)

#Menampilkan hasil cluster
fviz_cluster(k3,geom = "point",data=input)+ggtitle("Data train jika dibagi 3 Cluster")

#Melihat rangkuman variabel k3
k3

#Mengunduh package dan menggunakan library
install.packages("colorspace")
install.packages("maggritr")
library(colorspace)
library(magrittr)

#skala dataset di cluster
sc <- input %>% scale() %>% dist(method = "euclidean") %>%  hclust(method = "ward.D2")
#Melihat model yang telah dibuat
sc
#Membuat model
fviz_dend(sc,k=3,
          cex = 0.5,
          k_colors = c("#2E9FDF","#FC4E07","#00AFBB"),
          color_labels_by_k = TRUE,
          rect = TRUE)
#Melihat isi cluster
k3$size
