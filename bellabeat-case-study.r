{"metadata":{"kernelspec":{"name":"ir","display_name":"R","language":"R"},"language_info":{"name":"R","codemirror_mode":"r","pygments_lexer":"r","mimetype":"text/x-r-source","file_extension":".r","version":"4.0.5"}},"nbformat_minor":4,"nbformat":4,"cells":[{"source":"<a href=\"https://www.kaggle.com/code/osamaalaa2001/bellabeat-case-study?scriptVersionId=106316470\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown","outputs":[],"execution_count":0},{"cell_type":"markdown","source":"## Let's Start With Asking a Question What Is Bellabeat?\n* Bellabeat is a high-tech manufacturer of health-focused products for women.Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. Urška Sršen, co-founder and Chief Creative Officer of Bellabeat company. \n\n## The Scenario\n*  You are a junior data analyst working on the marketing analyst team at Bellabeat, Urška Sršen believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. You have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices. The insights you discover will then help guide marketing strategy for the company. You will present your analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.\n\n## In this session we will follow the Data Analysis General lifecycle \n*  **Ask -> Prepare -> Process -> Analyze -> Share -> Act.** \n \n* **So without Wasting any more time let's directly dive into it.**\n\n","metadata":{}},{"cell_type":"markdown","source":"## 1. Ask Step\n* This is such an important step as asking the right questions gives u the ability to reach your goal faster with accurate conclusions so what should we ask about? we have to ask questions to define the problem + what are the expectations to solve this problem? + who are the key stakeholders? \n\n\n\n**a.\tWhat is the problem we are trying to solve?**\n* Analysis of smart device fitness data to gain insights, and explore trends into how consumers are using their smart devices.\n\n\n**b.\tWhen can we say that we solved the problem?**\n*  Get the insights we discovered then help guide marketing strategy for the company.\n\n\n**c.\tWho are the key stakeholders?**\n*  **1. Urška Sršen**: Bellabeat’s co-founder and Chief Creative Officer. \n*  **2. Sando Mur**: Mathematician and Bellabeat’s cofounder.\n\n\n**Notice: All the answers extracted from the Scenario go back to see what exactly I mean** ","metadata":{}},{"cell_type":"markdown","source":"## 2. Prepare Step\n* After getting answers now we know what is the data we are looking for. We are looking for fitness data so let’s google it. Hmm, here is what I found:\n\n* [FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) (CC0: Public Domain, dataset made available through Mobius): This Kaggle data set contains personal fitness tracker from thirty fitbit users.\n\n###\tData checkpoints R-O-C-C-C: (Reliable, Original, Comprehensive, Current, Cited)\n\na.\tThe data from **Reliable** source is the data being collected via Amazon Mechanical Turk.\n\nb.\tAs it’s not internal data and it’s not collected by Bellabeat so it’s **not Original data** (second-party data).\n\nc.\t**Not Comprehensive** as the number of observations is just 33 cases so it’s not enough for the study and may cause bias.\n\nd.\tThe data is **Not Current**, as it’s in 2016 so considered not current.\n\ne.\tThe data is **Cited** by many who used this data.\n\n\n### Data Deep Exploration: (Security, Structure, Organization, Integrity)\n\na.  The data is **public domain and open-source** so that means you can copy, edit, and publish without permission.\n\nb.\tAs it's a small data set The data is stored in 18 **spreadsheets in long format**.\n\nc.\tThe data is already **sorted** by the date, and there is **no filter** applied.\n\nd.\tThe data is Accurate, and completed, but not consistent.\n\n## Preparation Step Conclusion\n* The data has limitations and it’s **not comprehensive** as there are just 33 cases but we can rely on it if you are looking for better accuracy and unbiased data. add other data to your study but never forget to check the preparation points again on the new data you add.\n","metadata":{}},{"cell_type":"markdown","source":"## 3. Process Step\n* As we finished exploring the data now It's time to take action and get our hands dirty with the data. \n* As R is such a powerful programming language in Data Analysis and statistics plus cleaning and preprocessing the data we will use it and exploit all these advantages and get better insights and accurate conclusions, let's go.\n\n### R Processing checkpoints\n\n* **a. Loading packages and datasets.**\n* **b. Preview the data and make sure from being loaded successfully.**\n* **c. Core Cleaning (check format, remove duplicates, handle null values, clean columns names, fix inconsistency, and misspelling).**\n* **d. The final step is to merge datasets if needed.**\n\n## Import Packages \n* first of all we have to install and load the packages we need for cleaning, preprocessing, and analysis.\n### Packages Needed \n* **tidyverse :** collection of R packages designed for data science.\n* **here :** here package is to enable easy file referencing.\n* **skimr :** compact and Flexible Summaries of Data.\n* **lubridate :** deals with date-time data in an easier way.\n* **ggrepel :** ggrepel provides geoms for ggplot2 to repel overlapping text labels. \n* **janitor:** for examining and cleaning dirty data. ","metadata":{}},{"cell_type":"code","source":"# 1. For the first time use the install.packages(package_name) command to install the package before loading. \n# 2. Load packages for loading packages we use library funciton. \n\nlibrary(tidyverse)   # collection of R packages designed for data science.\nlibrary(here)        # here package is to enable easy file referencing.\nlibrary(skimr)       # compact and Flexible Summaries of Data.\nlibrary(lubridate)   # deal with date-time data in easier way.\nlibrary(ggrepel)     # ggrepel provides geoms for ggplot2 to repel overlapping text labels. \nlibrary(janitor)     # for examining and cleaning dirty data. \n","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"## DataSets Import\n* As we see there are in [fitness_data](http://https://www.kaggle.com/arashnic/fitbit) 18 files but we will just select the most effective files with useful data for our expected conclusions it's like feature selection in Machine learning and deep learning.So we will select:\n\n* **dailyActivity.**\n* **dailySleep.**\n* **hourlySteps.**\n* **hourlyintensity.**\n\n* Note: we will not consider Weight(8 users), heart_rate(7 users) as we don't have enough users.\n","metadata":{}},{"cell_type":"code","source":"# for data set import we will use read_csv(\"file_path\") function from readr nested package in tidyverse bigger package.\n# note: assignment to new variable try to use reliable lowerchase names and use underscore to split words\n\ndaily_activity <- read_csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\ndaily_sleep <- read_csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")\nhourly_steps <- read_csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv\")\nhourly_intensity <- read_csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/hourlyIntensities_merged.csv\")","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"## Preveiw The Data \n* Congratulations Eng, you loaded the data but wait we have to make sure that the data is fine so we have many options to see our data :\n\n* **view()** : tibble package.\n* **str()** : utils package.\n* **head()** : utils package.\n* **select()** : dplyr package (nested package in tidyverse).\n* **glimpse()** : dplyr package (nested package in tidyverse).","metadata":{}},{"cell_type":"code","source":"# we will choose head(object,n) funciton the see the first 6 rows n=6 by default.\nhead(daily_activity)\nhead(daily_sleep)\nhead(hourly_steps)\nhead(hourly_intensity)","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"# We will choose str(object,..) funciton the see the data summary (columns data types, number of rows, number of columns).\nstr(daily_activity)\nstr(daily_sleep)\nstr(hourly_steps)\nstr(hourly_intensity)","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"## Core Cleaning \n\n* **Check the first let's check the number of users using n_unique(x) function from skimr package.**\n","metadata":{}},{"cell_type":"code","source":"# calculate number of unique(distinct) records (Id: for distinct users). \nn_unique(daily_activity$Id)\nn_unique(daily_sleep$Id)\nn_unique(hourly_steps$Id)\nn_unique(hourly_intensity$Id)","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"* **Look for any dublicates using sum(duplicated(data)).**","metadata":{}},{"cell_type":"code","source":"# calculate the number of doplicate rows and null values for daily_active dataset \nsum(duplicated(daily_activity))\nsum(is_null(daily_activity))\n\n# calculate the number of doplicate rows and null values for daily_sleep dataset \nsum(duplicated(daily_sleep))\nsum(is_null(daily_sleep))\n\n# calculate the number of doplicate rows and null values for hourly_steps dataset \nsum(duplicated(hourly_steps))\nsum(is_null(hourly_steps))\n\n# calculate the number of doplicate rows and null values for hourly_steps dataset \nsum(duplicated(hourly_intensity))\nsum(is_null(hourly_intensity))\n","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"* **As we see there are just 3 duplicated rows in daily_sleep so now let's remove duplicates and null values using distinct - drop_na().**","metadata":{}},{"cell_type":"code","source":"# remove duplicates and store it again in daily_sleep using pipe \ndaily_sleep <- daily_sleep %>% distinct()\n\n# to make sure that you removed all duplicates \nsum(duplicated(daily_sleep))\n","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"* **Cleaning column names as we have to ensure that all column names are using the right format and syntax (lowercase, not starting with numbers or any symbol, using underscore to split words).**","metadata":{}},{"cell_type":"code","source":"# Using clean_names function to ensure it's in the right format, second line to turn all names to lowercase  \nclean_names(daily_activity)\ndaily_activity <- rename_with(daily_activity, tolower)\n\nclean_names(daily_sleep)\ndaily_sleep <- rename_with(daily_sleep, tolower)\n\nclean_names(hourly_steps)\nhourly_steps <- rename_with(hourly_steps, tolower)\n\nclean_names(hourly_intensity)\nhourly_intensity <- rename_with(hourly_intensity, tolower)","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"* **Consistency of data,time columns**\n","metadata":{}},{"cell_type":"code","source":"# run it one as then the column names (activitydata,sleepdata) will change.\n# using pipe the rename functio changes the column name and mutate funciton changes the coulmn format.\n# in hourly_steps convert date to date-time.\n\ndaily_activity <- daily_activity %>%\n  rename(date = activitydate) %>%\n  mutate(date = as_date(date, format = \"%m/%d/%Y\"))\n\ndaily_sleep <- daily_sleep %>%\n  rename(date = sleepday) %>%\n  mutate(date = as_date(date,format =\"%m/%d/%Y %I:%M:%S %p\" , tz=Sys.timezone()))\n\nhourly_steps <- hourly_steps %>% \n  rename(date_time = activityhour) %>% \n  mutate(date_time = as.POSIXct(date_time,format =\"%m/%d/%Y %I:%M:%S %p\" , tz=Sys.timezone()))\n\nhourly_intensity <- hourly_intensity %>% \n  rename(date_time = activityhour) %>%\n  mutate(date_time = as.POSIXct(date_time,format =\"%m/%d/%Y %I:%M:%S %p\" , tz=Sys.timezone()))\n\n# ensure the date-time columns is formatted and column names are clean using head function.\n\nhead(daily_activity)\nhead(daily_sleep)\nhead(hourly_steps)\nhead(hourly_intensity)\n","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"## Finally merge the data \n* note that u are not forced to do all these steps during processing data it always depends on the data remember that.","metadata":{}},{"cell_type":"code","source":"# Merging(joining) the 2 datasets using id + date column as they common in both datasets.\n# glimpse functio to get the new dataset description summary.\ndaily_activity_sleep <- merge(daily_activity, daily_sleep, by=c (\"id\", \"date\"))\nglimpse(daily_activity_sleep)","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"## 4-5. Analyze and Share \n* Now it's the time to analyze the data to get insights. but before you start look again at the data and note down all your thoughts. and try to make relations among features and remember to take your time and trust me it deserves.\n\n### From **daily_activity** dataset\n* Study The relation between **steps-calories** ( we will use **scatter plot** as we study a relation ).\n* Compare between **Very Active Distance Averge - Light Active distanve Average.** ","metadata":{}},{"cell_type":"code","source":"# View the daily_activity dataset to ensure the columns names \nhead(daily_activity)\n\n# calculate the total steps average \naverage_steps <- mean(daily_activity$totalsteps)\naverage_steps\n\n# Steps Vs Calories\nggplot(data=daily_activity,mapping= aes(x=totalsteps, y=calories, color=id))+\n    geom_point()+\n    geom_smooth()+\n    labs(title=\"Total Steps vs Calories.\", subtitle=\"This graph shows the relation between total Number of steps and lost calories.\", caption=\"visualized using R.\")","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"# now let's calculate the average for high active and light active distances using bar charts \naverage_very_high_distance <- mean(daily_activity$veryactivedistance)\naverage_light_distance <- mean(daily_activity$lightactivedistance)\ncalory_per_step <- sum(daily_activity$calories)/sum(daily_activity$totalsteps)\n\naverage_very_high_distance \naverage_light_distance\ncalory_per_step","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"### Conclusion\n* The average_steps around 7500 steps.\n* There is a Positive Relationship between the total number of steps and the number of taken calories.\n* As we see the average light active distance is almost = 2 * average very high active distance.\n* calory per step = 0.3 cal/step and this is not the ordinary value as with the normal case the value should be around 0.05 cal/step and that's direct tells us that highly active steps burn more calories than light active steps.","metadata":{}},{"cell_type":"markdown","source":"### daily_activity_sleep dataset \n* View the dataset using the head function.\n* Compare between the time in bed and actual time sleeping.\n* Study the correlation between calories and time in bed for understanding user general behavior **use scatter plot**.\n* Study the correlation between sleep time and sedentary-time.","metadata":{}},{"cell_type":"code","source":"# View the dataset using head funciton.\nhead(daily_activity_sleep)\n\n#Compare between the time in bed and actual time sleeping.\nwasted_time_in_bed_in_days <- ((sum (daily_activity_sleep$totaltimeinbed) - sum(daily_activity_sleep$totalminutesasleep))/60)/24\nwasted_time_in_bed_in_days\n\n# The correlation between calories and time in bed for understanding user general behaviour.\nggplot(data=daily_activity_sleep, aes(x=totaltimeinbed, y=calories))+\n    geom_point()+\n    geom_smooth()+\n    labs(title=\"Calories vs Bed-time.\", subtitle=\"This graph shows the relation between total Number of taken calories and time in bed.\", caption=\"visualized using R.\")\n\n# Study the correlation between sleep-time and sedentary-time\nggplot(data=daily_activity_sleep, aes(x=totalminutesasleep, y=sedentaryminutes))+\n    geom_point()+\n    geom_smooth()+\n    labs(title=\"Sleep-time vs Sedentary-time.\", subtitle=\"This graph shows the relation between sleep time and sedentary time in minutes.\", caption=\"visualized using R.\")\n","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"### Conclusion\n* As we see there are around 11 days in total wasted in bedtime without sleeping.\n* for user behavior analysis there is no correlation between taken calories and bedtime or the relation is not clear as the sample is just 33 users so that's maybe caused bias.\n* as we see with the last visual there is a negative correlation between sedentary time and sleep-time.","metadata":{}},{"cell_type":"markdown","source":"### hourly_intensity dataset \n* Analyze the data to obtain the active-inactive ranges.","metadata":{}},{"cell_type":"code","source":"# Split the data in date_time column and store it in new columns \nhourly_intensity$time <- format(hourly_intensity$date_time, format = \"%H:%M:%S\")\nhourly_intensity$date <- format(hourly_intensity$date_time, format = \"%m/%d/%y\")\n\n# View the data to ensure all the data in the right place   \nhead(hourly_intensity)\n\n# Now calculate the average intensity and group by time then store it in new dataset. \nhourly_intensity_new <- hourly_intensity %>%\n                        group_by(time)%>%\n                        drop_na()%>%\n                        summarize(total_intensity_mean = mean(totalintensity))\n\n# View the data to ensure the grouping by done successfully. \nhead(hourly_intensity_new)\n\n# create a visualization using histogram             \nggplot(data=hourly_intensity_new, aes(x=time, y=total_intensity_mean)) + geom_histogram(stat = \"identity\", fill=\"Dark blue\") +\n  theme(axis.text.x = element_text(angle = 90)) + # this for handling time text and prevent any combination\n  labs(title=\"Average Total Intensity vs. Time\")","metadata":{"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"### Conclusion\n* as we see from the last visual the active hours strat from 5 am to 11 pm and inactive range from 12 am till 4 am. ","metadata":{}},{"cell_type":"markdown","source":"## 6. Act \n* After finishing cleaning, pre-processing, and analysis now it's time to take action.\n* take a quick look at our analysis conclusions to get Business Recommendations so let's go.","metadata":{}},{"cell_type":"markdown","source":"\n## Business Recommendations Based on Conclusions\n\n\n\n\n* 1. The average number of steps is 7638 so we can send a notification to all who reach more than 5000 to encourage him/her to achieve 10,000 steps for better health in the long run as recommended by CDC Organization.\n\n\n* 2. There is a Positive Relationship between the total number of steps and the number of burned calories so we will recommend sending a reminder notification to those who are interested in a fit body to keep on the plan for a healthy life.\n\n\n* 3. As we know the average light active distance is almost = 2 * average very high active distance so we can recommend a plan for sports awareness and recommend different plans for all users.\n\n\n* 4. Based on analysis there are around 11 days in total wasted in bedtime without sleeping by 33 users during a month so we have to manage this time by suggesting relaxing music helping for sleeping based on the user data.\n\n\n* 5. As we knew there is a negative relationship between sedentary time and sleep-time so we can suggest a program to reduce sedentary time to improve sleeping quality and manage sleeping time with fixed cycles.\n\n\n* 6. From hourly intensities, we can know the most active and inactive hours so if we need to send any notification or any important message we should stick with the active range from 7 am - 10 pm.  ","metadata":{}},{"cell_type":"markdown","source":"* Finally, big thanks to [ANASTASIIA CHEBOTINA](http://https://www.kaggle.com/code/chebotinaa/bellabeat-case-study-with-r) , [MACARENA LACASA](https://www.kaggle.com/code/macarenalacasa/capstone-case-study-bellabeat) for their wonderful work in this case study which helped me a lot.","metadata":{}}]}