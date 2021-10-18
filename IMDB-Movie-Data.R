# Load library
library(dplyr)
library(readr)

# Load dataset
imdb <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/006-IMDB-data-from-2006-to-2016/main/IMDB-Movie-Data.csv")

# explore the dataset
View(imdb)
glimpse(imdb)

# Cleaning Dataset
# Change revenue from not applicable to unidentified
imdb$Revenue..Millions. <- imdb$Revenue..Millions. %>%
  replace(is.na(imdb$Revenue..Millions.),"unidentified")
# Change revenue from not applicable to no score
imdb$Metascore <- imdb$Metascore %>%
  replace(is.na(imdb$Metascore),"no score")


# Exploratory Data Analysis

#  1. หนังเรื่องไหนมีผลโหวตมากที่สุดและน้อยที่สุด

#find min
Min <- imdb %>% 
  select(Title,Votes) %>% 
  filter( imdb$Votes == min(imdb$Votes))
print(Min)

#find max
Max <- imdb %>% 
  select(Title,Votes) %>% 
  filter( imdb$Votes == max(imdb$Votes))
print(Max)


#  2. มีหนังกี่เรื่องที่มี rating มากกว่า 8.0 และมีเรื่องอะไรบ้าง 
Rating <- imdb %>%
  select(Title,Rating) %>%
  filter(imdb$Rating>8)
  Rating %>% 
  count()
print(Rating)


#  3. หนังที่ rating สูงที่สุดในแต่ละปีมีเรื่องอะไรบ้าง (แสดงผลลัพ์6แยกเป็นปี 2006-2016) 
aggregate(Title ~ Year , data = imdb, max)



#  4. ให้แสดงหนังของผู้กำกับ Christopher Nolan มีเรื่องอะไรบ้าง
imdb %>% 
  select(Title, Director) %>% 
  filter(imdb$Director == 'Christopher Nolan') %>% 
  table()


#  5. มีหนังเรื่องอะไรบ้างที่มีความยาวมากกว่าหรือเท่ากับ 3 ชั่วโมง ให้แสดง title, genre และ runtime
imdb %>% 
  select(Title,Genre,Runtime..Minutes.) %>% 
  filter(Runtime..Minutes. >= 180) %>% 
  arrange(Title,Genre,Runtime..Minutes.)

# 6. มีหนังในปี 2014-2016 กี่เรื่อง
movie <- imdb %>%
  select(Year) %>%
  filter(imdb$Year >= 2014 & imdb$Year <= 2016) %>%
  count()
print(movie)