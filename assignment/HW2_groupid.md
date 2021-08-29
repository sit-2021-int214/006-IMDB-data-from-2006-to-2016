# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) From cats, there are 47 female cats and 97 male cats.
```{R}
gender <- factor(cats$Sex,labels=c("female","male"))
summary(gender)
```
   Descriptive statistics Statement
```{R}
จำแนกเพศแมวและเก็บไว้ใน gender และตั้งชื่อหัวข้อ column "labels=c("female","male")"
จากนั้นแสดงผลผลลัพธ์ "summary(gender)"
```


### Team: ไอรดา

1.StudentID: 63130500004 กัณฑ์พงษ์ ศรีสุธาภัทร์ <br/>
2.StudentID: 63130500006 กิตติภูมิ อ่วมทอน <br/>
3.StudentID: 63130500029 ณัฏฐกรณ์ โชติภัทรจินดา <br/>
