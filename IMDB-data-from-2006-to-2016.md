# IMDB-data-from-2006-to-2016 Dataset

#Dataset from [IMDB-Movie-Data](./IMDB-Movie-Data.csv)

Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) From cats, there are 47 female cats and 97 male cats.
```{R}
gender <- factor(cats$Sex,labels=c("female","male"))
summary(gender)

# Using dplyr
cats$Sex %>% table()
```
   Descriptive statistics Statement
```{R}
ทำการ pipe ข้อมูล sex ของ cats
```

2.) From cats, max and min body weight is 3.9, 2 respectively.
```{R}
max(cats$Bwt)
min(cats$Bwt)

# Using dplyr
cats %>% dplyr::select(Bwt) %>% max()
cats %>% dplyr::select(Bwt) %>% min()

```
   Descriptive statistics Statement
```{R}
"cats %>% dplyr::select(Bwt)" = pipe ข้อมูล cats ไป select ค่า body weight
"%>% max()" = pipe หาค่า max
"%>% min()" = pipe หาค่า min
```

3.) From survey, number of student who applaud with "Right", "Left", "Neither" hand on top is 39, 50, 147 respectively.
```{R}
summary(survey$Clap)

# Using dplyr
survey$Clap %>% table()
```
   Descriptive statistics Statement
```{R}
ทำการ pipe ข้อมูล Clap ของ survey
```

4.) From survey, tallest male and female students is 200, 180.34 respectively.
```{R}
max(survey$Height[survey$Sex == 'Female'], na.rm = TRUE)
max(survey$Height[survey$Sex == 'Male'], na.rm = TRUE)

# Using dplyr
survey %>% filter(Sex == 'Female') %>% summarise(max(Height, na.rm = TRUE))
survey %>% filter(Sex == 'Male') %>% summarise(max(Height, na.rm = TRUE))
```
   Descriptive statistics Statement
```{R}
"survey %>% filter(Sex == 'Female')" = ทำการ pipe ข้อมูล survey ไป filter เพศชาย
"survey %>% filter(Sex == 'Male')"   = ทำการ pipe ข้อมูล survey ไป filter เพศหญิง
"%>% summarise(max(Height, na.rm = TRUE))" = pipe ข้อมูลไป summarise ความสูงโดยไม่เอาค่า NA

```

5.) From survey, There were 189 students who never smoked.
```{R}
table(survey$Smoke == 'Never')

# Using dplyr
survey %>% count(Smoke == "Never")
```
   Descriptive statistics Statement
```{R}
ทำการ pipe ข้อมูล survey ไป count คนที่ไม่เคยสูบบุหรี่
```


### Team: ไอรดา

1.StudentID: 63130500004 กัณฑ์พงษ์ ศรีสุธาภัทร์ <br/>
2.StudentID: 63130500006 กิตติภูมิ อ่วมทอน <br/>
3.StudentID: 63130500029 ณัฏฐกรณ์ โชติภัทรจินดา <br/>
