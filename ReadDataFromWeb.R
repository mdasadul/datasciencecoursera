if(!file.exists("./data")){
  dir.create("./data")
}

fileurl<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./data/restaurants.csv", method = "curl")
restData<-read.csv("./data/restaurants.csv")