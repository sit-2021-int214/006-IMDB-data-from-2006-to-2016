# Library
library(readr)
library(dplyr)
library(stringr)
library(ggplot2)
library(lubridate)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
View(dataset)

glimpse(dataset)


#Part3

#1. ให้แสดง category ของสินค้าว่ามีประเภทอะไรบ้าง และแต่ละประเภทมียอดขายรวมเท่าไหร่ แสดงผลลัพธ์เป็น subcategory และ totalsales


subcat <- dataset %>% 
  group_by(dataset$`Sub-Category`) %>%
  select(Category, Sales) %>%
  summarise(sum(Sales)) %>%
  rename(subcategory = `dataset$\`Sub-Category\``) %>%
  rename(totalsales = `sum(Sales)`)
print(subcat)


#2. ให้แสดงจำนวนการขายทั้งหมดของปี 2015-2017 แสดงผลลัพธ์เป็น totalsalesnum

dataset %>% 
  mutate(year = year(dmy(dataset$`Order Date`))) %>% 
  filter(year >= 2015 & year <= 2017) %>% 
  count() %>% 
  rename(totalsalesnum = n)

#3. ให้หายอดขายที่ต่ำสุดและสูงสุดแบ่งเป็น category

#find Min
Min <- dataset %>% 
  select(Category,Sales) %>% 
  filter( dataset$Sales == min(dataset$Sales))
print(Min)

#find Max
Max <- dataset %>% 
  select(Category,Sales) %>% 
  filter( dataset$Sales == max(dataset$Sales))
print(Max)

#4. หาชื่อสินค้าที่มียอดขายสูงที่สุดและต่ำที่สุด

#find max
maxsale <- dataset %>% 
  group_by(`Product Name`) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale == max(totalsale))
print(maxsale)

#find min
minsale <- dataset %>% 
  group_by(`Product Name`) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale == min(totalsale))
print(minsale)

#5. ให้แสดงยอดขายรวมของแต่ละ city ที่มียอดขายรวมมากกว่าหรือเท่ากับ 50000 เรียงยอดขายรวมจากมากไปน้อย

cities <- dataset %>% 
  group_by(City) %>% 
  summarise(totalsale = sum(Sales)) %>%
  filter(totalsale >= 50000) %>%
  arrange(desc(totalsale))
print(cities)

#6. ให้แสดงจำนวนลูกค้าทั้งหมดในแต่ละ segment แสดงจำนวนลูกค้าทั้งหมดเป็น totalcus

dataset %>% 
  count(Segment) %>% 
  group_by(Segment) %>% 
  rename(totalcus = n)

#Part4

#bar

bar <- dataset %>% 
  filter(Category == 'Office Supplies') %>% 
  ggplot(aes(x = `Sub-Category`)) + 
  geom_bar(aes(color = `Sub-Category`))
bar

#pie

ggplot(dataset, aes(x = '', fill = Segment,)) +
  geom_bar(width = 1) +
  coord_polar("y")

