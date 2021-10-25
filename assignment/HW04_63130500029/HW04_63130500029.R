#Library
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

#Dataset
store <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

#Part1
#Explore Dataset
View(store)
#or
glimpse(store)

#Part2
install.packages("lubridate")
library(lubridate, warn.conflicts = FALSE)
x <- c("happy", "sad", "boring")
str_length(x)
# [1] 5 3 6
str_subset(x, "[sr]")
#> [1] "sad" "boring"

ymd(20010404)
#> [1] "2001-04-04"
mdy("4/4/44")
#> [1] "2044-04-04"

#Part3
#1 Find order ID that bought technology category
tech <- store %>% filter(store$Category == "Technology")
tech %>% distinct(tech$Customer.ID)

#2 Find the name of the customer who bought the most.
store %>% select(Customer.Name,Sales) %>%
  group_by(Customer.Name) %>% summarise(sumSales = sum(Sales)) %>%
  slice_max(sumSales)

#3 Find furniture that has sales less than 1000 and count the order.
store %>% filter(store$Sales < 1000 & store$Category == 'Furniture') %>% count() %>% rename(SaleLessThan1000 = n)


#4 Find number of customer who live in west side.
store %>% select(Customer.ID,Region) %>% filter(Region == 'West') %>% count() %>% rename(numberOfWestCustomer = n)

#5 Find customer name that bought the lowest price.
store %>% select(Customer.Name,Sales) %>% slice_min(Sales)

#6 Find 10 customer name that bought the highest price.
store %>% select(Customer.Name,Sales) %>% slice_max(Sales , n=10 )

  
# part 4
#1 scatter plot
scat_plot <- store %>% filter(Sub.Category == 'Furnishings') %>% ggplot(aes(x=Order.ID,y=Sales))+
  geom_point(aes(color=Sales))
scat_plot

# lollipop plot

#2 create data
group = c(store %>% distinct(Region))
value = c(store %>% count(Region) %>% select(n))
group <- as.character(unlist(group)) 
value <- as.numeric(unlist(value)) 
data <- data.frame(group,value)
View(data)

# plot graph
ggplot(data, aes(x=group, y=value)) +
  geom_segment( aes(x=group, xend=group, y=0, yend=value), color="grey") +
  geom_point( color="orange", size=4) +
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  xlab("Region") +
  ylab("Sum of each region")

