library(tidyverse)
library(dplyr)

# read two csv files
# fertility: The number of children that would be born to each woman in different countries from 1799 to 2099.
# life: life expectancy at birth for female in different countries from 1949 to 2098.
fertility <- read.csv("https://raw.githubusercontent.com/MA615-WujiShan/Assignment-2/main/children_per_woman_total_fertility.csv",
         header = TRUE)
life <- read.csv("https://raw.githubusercontent.com/MA615-WujiShan/Assignment-2/main/life_expectancy_female.csv",
                        header = TRUE)

# delete column year 1799-1948, and year 2099 which does not match those in life dataset in fertility dataset
new_fertility <- subset(fertility, select = -c(2:151, 302))

# tidy fertility dataset
fertility_pivot <- new_fertility %>% 
  pivot_longer(-country, names_to = "years", values_to = "fertility")

# tidy life dataset
life_pivot <- life %>%
  pivot_longer(-country, names_to = "years", values_to = "life")

# get the join dataset which contains all matched countries and years of fertility and life
fertility_life <- inner_join(life_pivot, fertility_pivot, by = c("country", "years"))
