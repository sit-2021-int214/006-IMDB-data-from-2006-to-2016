# IMDB-data-from-2006-to-2016 Dataset

Original Dataset from [IMDB-Movie-Data](./IMDB-Movie-Data.csv)

## Overview

กลุ่มของเราเลือกชุดข้อมูลนี้เพราะอยากรู้ว่าหนังที่ได้รับความนิยมใน IMDB ของช่วงปี 2006-2016 มีเรื่องอะไรบ้าง rating ของหนังแต่ละเรื่องเป็นยังไง ความยาวของหนังแต่ละเรื่องอยู่ที่เท่าไหร่ มีหนังประเภทอะไรบ้าง และนักแสดงกับผู้กำกับคือใคร

### Tools

- R Language
- R Studio Desktop


### Steps

1. Define a question <br/>
2. Search datasets from Kaggle <br/>
3. Retrieve the relevant dataset from Kaggle <br/>
4. Explore the dataset from the original dataset <br/>
5. Data Cleaning and Data Transformation <br/>
6. Exploratory Data Analysis <br/>

### Define a question

1. หนังเรื่องไหนมีผลโหวตมากที่สุดและน้อยที่สุด <br/>
2. มีหนังกี่เรื่องที่มี rating มากกว่า 8.0 และมีเรื่องอะไรบ้าง <br/>
3. หนังที่ rating สูงที่สุดในแต่ละปีมีเรื่องอะไรบ้าง (แสดงผลลัพธ์แยกเป็นปี 2006-2016) <br/>
4. ให้แสดงจำนวนหนังของผู้กำกับแต่ละคนว่ามีจำนวนเท่าไหร่ <br/>
5. หนังที่มีความยาวมากกว่า 2 ชั่วโมงครึ่ง



### Loading library and dataset and explore the dataset
```{R}
# Step 1: Load library
library(dplyr)
library(readr)

# Step 2: Load dataset
imdb <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/006-IMDB-data-from-2006-to-2016/main/IMDB-Movie-Data.csv")

# Step 3: explore the dataset
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

1) หนังเรื่องไหนมีผลโหวตมากที่สุดและน้อยที่สุด
```{R}

```

2) มีหนังกี่เรื่องที่มี rating มากกว่า 8.0 และมีเรื่องอะไรบ้าง
```{R}

```

3) หนังที่ rating สูงที่สุดในแต่ละปีมีเรื่องอะไรบ้าง (แสดงผลลัพธ์แยกเป็นปี 2006-2016)
```{R}

```

4) ให้แสดงจำนวนหนังของผู้กำกับแต่ละคนว่ามีจำนวนเท่าไหร่
```{R}

```

5) หนังที่มีความยาวมากกว่า 2 ชั่วโมงครึ่ง
```{R}

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
