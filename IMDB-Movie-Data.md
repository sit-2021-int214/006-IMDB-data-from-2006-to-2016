# IMDB-data-from-2006-to-2016 Dataset

Original Dataset from [IMDB-Movie-Data](./IMDB-Movie-Data.csv)

## Overview

กลุ่มของเราเลือกชุดข้อมูลนี้เพราะอยากรู้ว่าหนังที่ได้รับความนิยมใน IMDB ของช่วงปี 2006-2016 มีเรื่องอะไรบ้าง rating ของหนังแต่ละเรื่องเป็นยังไง ความยาวของหนังแต่ละเรื่องอยู่ที่เท่าไหร่ มีหนังประเภทอะไรบ้าง และนักแสดงกับผู้กำกับคือใคร

### Tools

- R Language
- R Studio Desktop


### Steps

1. Define a question <br/>
2. Load datasets <br/>
3. Explore the dataset <br/>
4. Cleaning Dataset <br/>
5. Exploratory Data Analysis

## 1. Define a question

1. หนังเรื่องไหนมีผลโหวตมากที่สุดและน้อยที่สุด <br/>
2. มีหนังกี่เรื่องที่มี rating มากกว่า 8.0 และมีเรื่องอะไรบ้าง <br/>
3. หนังที่ rating สูงที่สุดในแต่ละปีมีเรื่องอะไรบ้าง (แสดงผลลัพธ์แยกเป็นปี 2006-2016) <br/>
4. ให้แสดงหนังของผู้กำกับ Christopher Nolan มีเรื่องอะไรบ้าง <br/>
5. มีหนังเรื่องอะไรบ้างที่มีความยาวมากกว่าหรือเท่ากับ 3 ชั่วโมง ให้แสดง title, genre และ runtime <br/>
6. มีหนังในปี 2014-2016 กี่เรื่อง

## 2. Load dataset
```{R}
# Step 1: Load library
library(dplyr)
library(readr)

# Step 2: Load dataset
imdb <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/006-IMDB-data-from-2006-to-2016/main/IMDB-Movie-Data.csv"
```

## 3. Explore the dataset
```{R}
View(imdb)
glimpse(imdb)
```

In this dataset has
```{R}
Rows: 1,000
Columns: 12
$ Rank               <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,~
$ Title              <chr> "Guardians of the Galaxy", "Prometheus", "Split", "Sing", "Suicide Squad", "The Great Wall", "La L~
$ Genre              <chr> "Action,Adventure,Sci-Fi", "Adventure,Mystery,Sci-Fi", "Horror,Thriller", "Animation,Comedy,Family~
$ Description        <chr> "A group of intergalactic criminals are forced to work together to stop a fanatical warrior from t~
$ Director           <chr> "James Gunn", "Ridley Scott", "M. Night Shyamalan", "Christophe Lourdelet", "David Ayer", "Yimou Z~
$ Actors             <chr> "Chris Pratt, Vin Diesel, Bradley Cooper, Zoe Saldana", "Noomi Rapace, Logan Marshall-Green, Micha~
$ Year               <int> 2014, 2012, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 20~
$ Runtime..Minutes.  <int> 121, 124, 117, 108, 123, 103, 128, 89, 141, 116, 133, 127, 133, 107, 109, 87, 139, 123, 118, 116, ~
$ Rating             <dbl> 8.1, 7.0, 7.3, 7.2, 6.2, 6.1, 8.3, 6.4, 7.1, 7.0, 7.5, 7.8, 7.9, 7.7, 6.4, 6.6, 8.2, 6.7, 8.1, 8.0~
$ Votes              <int> 757074, 485820, 157606, 60545, 393727, 56036, 258682, 2490, 7188, 192177, 232072, 93103, 323118, 1~
$ Revenue..Millions. <dbl> 333.13, 126.46, 138.12, 270.32, 325.02, 45.13, 151.06, NA, 8.01, 100.01, 234.02, 169.27, 532.17, 2~
$ Metascore          <int> 76, 65, 62, 59, 40, 42, 93, 71, 78, 41, 66, 74, 65, 81, 70, 61, 71, 58, 69, 81, 49, 96, 72, 56, 32~
```

## 4. Cleaning Dataset
```{R}
# Change revenue from not applicable to unidentified
imdb$Revenue..Millions. <- imdb$Revenue..Millions. %>%
  replace(is.na(imdb$Revenue..Millions.),"unidentified")
# Change revenue from not applicable to no score
imdb$Metascore <- imdb$Metascore %>%
  replace(is.na(imdb$Metascore),"no score")
```

## 5. Exploratory Data Analysis

1) หนังเรื่องไหนมีผลโหวตมากที่สุดและน้อยที่สุด
```{R}
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
```
result:
```{R}
#min
  Title              Votes
1 Paint It Black      61

#max
  Title              Votes
1 The Dark Knight   1791916
```

2) มีหนังกี่เรื่องที่มี rating มากกว่า 8.0 และมีเรื่องอะไรบ้าง
```{R}
Rating <- imdb %>%
  select(Title,Rating) %>%
  filter(imdb$Rating>8)
  Rating %>% 
  count()
print(Rating)
```
result: `59`
```{R}
   n
1 59

   Title                                          Rating               Title                                          Rating
1  Guardians of the Galaxy                         8.1              31 Twin Peaks: The Missing Pieces                  8.1
2  La La Land                                      8.3              32 Spotlight                                       8.1
3  Hacksaw Ridge                                   8.2              33 Warrior                                         8.2
4  Lion                                            8.1              34 Into the Wild                                   8.1
5  Bahubali: The Beginning                         8.3              35 The Imitation Game                              8.1
6  Interstellar                                    8.6              36 Pan's Labyrinth                                 8.2
7  Star Wars: Episode VII - The Force Awakens      8.1              37 The Grand Budapest Hotel                        8.1
8  The Dark Knight                                 9.0              38 Inside Out                                      8.2
9  The Prestige                                    8.5              39 The Intouchables                                8.6
10 Mad Max: Fury Road                              8.1              40 There Will Be Blood                             8.1
11 Zootopia                                        8.1              41 Rush                                            8.1
12 The Avengers                                    8.1              42 The Bourne Ultimatum                            8.1
13 Inglourious Basterds                            8.3              43 3 Idiots                                        8.4
14 Inception                                       8.8              44 Jagten                                          8.3
15 The Wolf of Wall Street                         8.2              45 The Lives of Others                             8.5
16 Gone Girl                                       8.1              46 Paint It Black                                  8.3
17 Prisoners                                       8.1              47 Up                                              8.3
18 The Help                                        8.1              48 Mommy                                           8.1
19 Kimi no na wa                                   8.6              49 WALLE                                           8.4
20 The Departed                                    8.5              50 Relatos salvajes                                8.1
21 12 Years a Slave                                8.1              51 Gran Torino                                     8.2
22 Harry Potter and the Deathly Hallows: Part 2    8.1              52 Toy Story 3                                     8.3
23 Dangal                                          8.8              53 Hachi: A Dog's Tale                             8.1
24 The Dark Knight Rises                           8.5              54 Incendies                                       8.2
25 Whiplash                                        8.5              55 El secreto de sus ojos                          8.2
26 No Country for Old Men                          8.1              56 PK                                              8.2
27 Shutter Island                                  8.1              57 How to Train Your Dragon                        8.1
28 Room                                            8.2              58 Koe no katachi                                  8.4
29 Django Unchained                                8.4              59 Taare Zameen Par                                8.5
30 Ah-ga-ssi                                       8.1

```

3) หนังที่ rating สูงที่สุดในแต่ละปีมีเรื่องอะไรบ้าง (แสดงผลลัพธ์แยกเป็นปี 2006-2016)
```{R}
aggregate(Title ~ Year , data = imdb, max)
```
result:
```{R}
   Year              Title
1  2006     X-Men: The Last Stand
2  2007     Zodiac
3  2008     Zack and Miri Make a Porno
4  2009     Zombieland
5  2010     Winter's Bone
6  2011     Your Highness
7  2012     Zero Dark Thirty
8  2013     World War Z
9  2014     X-Men: Days of Future Past
10 2015     Zipper
11 2016     Zootopia
```

4) ให้แสดงหนังของผู้กำกับ Christopher Nolan มีเรื่องอะไรบ้าง
```{R}
imdb %>% 
  select(Title, Director) %>% 
  filter(imdb$Director == 'Christopher Nolan') %>% 
  table()
```
result:
```{R}
                                Director
  Title                     Christopher Nolan
  Inception                         1
  Interstellar                      1
  The Dark Knight                   1
  The Dark Knight Rises             1
  The Prestige                      1
```

5) มีหนังเรื่องอะไรบ้างที่มีความยาวมากกว่าหรือเท่ากับ 3 ชั่วโมง ให้แสดง title, genre และ runtime
```{R}
imdb %>% 
  select(Title,Genre,Runtime..Minutes.) %>% 
  filter(Runtime..Minutes. >= 180) %>% 
  arrange(Title,Genre,Runtime..Minutes.)
```
result:
```{R}
  Title                    Genre                   Runtime..Minutes.
1 Grindhouse               Action,Horror,Thriller        191
2 Inland Empire            Drama,Mystery,Thriller        180
3 La vie d'adèle le        Drama,Romance                 180
4 The Hateful Eight        Crime,Drama,Mystery           187
5 The Wolf of Wall Street  Biography,Comedy,Crime        180
```

6) มีหนังในปี 2014-2016 กี่เรื่อง
```{R}
movie <- imdb %>%
  select(Year) %>%
  filter(imdb$Year >= 2014 & imdb$Year <= 2016) %>%
  count()
print(movie)
```

result: `522`
```{R}
    n
1 522
```

## About Us

งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี

### Team: ไอรดา


|No.| Name                   | Student ID     |
|:-:| ---------------------- | -------------- |
| 1 | กัณฑ์พงษ์ ศรีสุธาภัทร์      | 63130500004    |
| 2 | กิตติภูมิ อ่วมทอน          | 63130500006    |
| 3 | ณัฏฐกรณ์ โชติภัทรจินดา    | 63130500029    |

### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))
