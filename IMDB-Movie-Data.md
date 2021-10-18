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



### Loading library and dataset
```{R}
# Step 1: Load library
library(dplyr)
library(readr)

# Step 2: Load dataset
imdb <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/006-IMDB-data-from-2006-to-2016/main/IMDB-Movie-Data.csv")
View(imdb)
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
