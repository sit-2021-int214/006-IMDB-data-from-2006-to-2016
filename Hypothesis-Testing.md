## Analytical Inferential Statistics
จากข้อมูลภาพยนตร์ที่ได้รับความนิยม 1000 เรื่องใน IMDB ของช่วงปี 2006-2016 กลุ่มเราได้สนใจภาพยนตร์ของปี 2016 ซึ่งมีภาพยนตร์ 297 เรื่อง ซึ่งมีค่าเฉลี่ยของคะแนนอยู่ที่ 6.44 คะแนน และมีส่วนเบี่ยงเบนมาตรฐานอยู่ที่ 1.02 กลุ่มเราคาดว่าคะแนน IMDB ของภาพยนตร์ในปี 2016 ส่วนมากจะมากกว่า 6.5 คะแนน โดยมีระดับความเชื่อมั่นที่ 95%

### Step to do:

0. Assign variables:
    - μ0 or p0
    - x̄ or P̅
    - n
    - sd
    - α
1. State the hypothesis
2. Select Level of significance
3. Select Test statistic
    - z <- (xbar - u0) / (sd/sqrt(n))
4. Finding P-value approach or Critical Value approach
    - P-value for Z: pvalue <- pnorm(z)
    - Critical Value for Z: zalpha <- qnorm(alpha)
    - P-value for T: pvalue <- pt(q, df,lower.tail = TRUE)
    - talpha for T: talpha <- qt(p, df, lower.tail = TRUE)
5. Compare
6. Conclusion

### Step 0: Assign variables

```
n <- 297
sd <- 1.02
xbar <- 6.44
u0 <-  6.5
```

### Step 1: State the hypothesis

```
Ho: μ ≥ 6.5
Ha: μ < 6.5
```

### Step 2: Level of significance

```
alpha <- 0.05
```

### Step 3: Test statistic

```
z <- (xbar - u0) / (sd/sqrt(n))
```
Result
```
-1.013746
```
### Step 4: Finding P-value approach or Critical Value approach

```
pvalue <- pnorm(z)
zalpha <- qnorm(alpha)
```
Result
```
pvalue 0.1553519
zalpha -1.644854
```
### Step 5: Compare

```
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}
```
Result
```
P-value approach : "Accept H0"
Critical value approach : "Accept H0"
```

### Step 6: Conclusion

จากการทดสอบสมมติฐานสรุปได้ว่าภาพยนตร์ในปี 2016 ส่วนมากจะมีคะแนนมากกว่า 6.5 คะแนน
