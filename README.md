# Google Data Analytics Capstone

## Cyclistic Case Study 

Note: This case study is heavily based on the [Somia Nasir's case study](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study)



### Cyclistic Trip Data Analysis Report

The current problem Cyclistic encountered is insufficient number of annual subscriptions. Therefore, marketing department pursue to achieve the business task of encouraging conversion of casual users to annual subscribers through effective deployment of digital marketing strategies. This report is aimed to provide three most suitable recommendations through Cyclistic’s historical trip data collected in 2023 by following steps of data analysis process: Ask, Prepare, Process, Analyse, Share, Act.



**Summary** 
- Membership users would be more likely using Cyclist for regular and commuting purpose with around 10 minutes per ride consistently.
-	Membership users prefer to hire bike on 8am and 5pm during weekdays, during the warmer weather (April to October) around their commute and residence.
-	Casual riders are more likely taking their trip for occasional and leisurely purpose for longer ride over the weekends.
-	Casual riders prefer to hire bike on the same weather, but during the daylight hours of weekend, making their trip mostly in the city centre. 

**Recommendations**
1. Diversify membership types for monthly and seasonal (about 3 months), or annual weekend-only memberships to boost the participation of weekend/season-based users.
2. Focus the marketing location on the city centre to increase the awareness of casual users, especially during the spring summer seasons. 
3. Introduce temporal/ongoing discounts. This will be beneficial for both types of users: Casual riders who take longer rides could increase their service reliance which could potentially lead them to purchase the annual membership. For annual members, it would consolidate their loyalty to the company.

 <br>

## ASK 
**Business question**   

The question given is figuring out the difference in the use of service between annual and casual users. 

It will be answered by comparing the data of their usage durations, regularities, station information, bike information etc. The insight from analysis will be used to decide effective market strategy to increase the conversion rate of casual users. 

The key stakeholders to be considered are consisted of executive members of the company, the marketing department and marketing analytics team, and CS team, the service management department, service users of all types, bike and parts suppliers, residents of Chicago and the city government of according department, and shareholders.  

 <br>

## PREPARE
**-Data Sources**   
Cyclistic’s historical trip data will be used to analyse and identify trends from January 2023 to December 2023 which was downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under [this license](https://divvybikes.com/data-license-agreement).   

**-Data Organisation**   
The files have been compiled in the form of yyyymm-divvy-tripdata. The files contain the information regarding trips made during that month encompassing the ride id, bike type, start and end time, each station name and ids, latitudinal and longitudinal information of commencing and terminating location with their membership status. The columns are named as ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat float, end_lng, member_casual.

 <br>

## PROCESS
Data Cleaning and Manipulation Process: The data will be processed by using BigQuery due to the size of the data needs to be handled.

**-Combining the Data**   
SQL : [Query](https://github.com/areumhan0423/Google-Data-Analytics-/blob/main/1%20%20Data%20Combining.sql)   

12 files (of each month) are uploaded as tables in the dataset ‘Cyclistic’. 
Then, another table of yearly compilation was created for analysis which contains 5,719,877 rows.   


**-Data Exploration**   
SQL : [Query](https://github.com/areumhan0423/Google-Data-Analytics-/blob/main/2%20%20Data%20Exploration.sql)   

1. The columns of table and the data types are as listed below. 
<img width="238" alt="Picture 1" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/997d5cca-0d4b-4144-9cd4-89f3fdddf53c">   

2. The nulls values of each column are shown below.   
<img width="762" alt="Picture 2" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/fc3461df-fefd-4b3b-965b-8d530ef525fc">   
 
3. Checking duplicate values in the table
<img width="156" alt="Picture 3" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/2f7a95ae-3525-4f0f-940e-33ac8e43e4d6">
 
4. Check all the ride id is consisted of 16 lengths.
<img width="150" alt="Picture 4" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/8d9f0ac6-981e-47da-a5be-39dd7c91a62f">
 
5. Check the different types of bikes and their numbers. 
<img width="211" alt="Picture 5" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/3fe0dcef-2913-4fe6-94d0-acffac085530"> 

The total number of bikes is 5719877 which confirms that all the ride id have their own bike type information.

6. Checking how many rows do not have entries for each start station name or start station id or both. 
<img width="266" alt="Picture 6" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/afe90686-6d85-4be3-8173-53f12add790b"> 

7. Same process for the end station entries.
<img width="266" alt="Picture 7" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/5caefd4c-3791-4676-b570-c025db358534"> 

8. Checking missing entries for start and end of latitude and longitude.
<img width="280" alt="Picture 8" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/71aab165-0eda-4953-a794-e4d0895d3943"> 


9. Check the types of memberships and their number of members.

<img width="216" alt="Picture 9" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/d6e6d3aa-6b63-4e1c-8ec6-6358f245d6dc"> 

The total number of memberships is 5719877 which confirms that every ride has been assigned into its types of memberships.

<br>

**-Data Cleaning**   
SQL Query : [Query](https://github.com/areumhan0423/Google-Data-Analytics-/blob/main/3%20%20Data%20Cleaning.sql)    

1. rows with null values are removed. 
2. ride_length, day_of_week, month columns are added to the table.
3. ride with lengths less than 1 minute and more than a day are removed.
4. The final table has 4243326 rows in total, eliminating 1476551 rows as a result.
<img width="156" alt="Picture 10" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/7725fe57-de86-4d1e-90f7-7db4cd243686">

<br>
<br>

## ANALYSE and SHARE
The fundamental business question we are going to answer by this analysis is   
**“what is the difference between the styles of using Cyclistic’s service between two types of users?”**   

SQL : [Query](https://github.com/areumhan0423/Google-Data-Analytics-/blob/main/4%20%20Data%20Visualisation.sql)   
Visualisation : [Tableau](https://public.tableau.com/app/profile/areum.han2957/viz/Cyclistic_17069105103280/stationsfrequency#1)

This can be broken down into four aspects. 

**1. Bike types** 
![Picture 11](https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/1fc1043c-e24a-4e7b-bc28-f2e0dd5bd37f)

Cyclistic has more members using bikes than casual members overall. Classic bikes have been used the most by both user types taking up more than 60% in total followed by electric bikes. Docked bike is the least travelled ride and only casual users utilise this type. 
  
**2. Next, trip count has been analysed by month, week, and hour.**

<img width="274" alt="Picture 12" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/30ea4eab-e051-47f9-86f3-111a17d9e9d4">   

The general trend throughout all user types is Sunday is the least and Saturday is the most used day of the week.
 
<img width="528" alt="Picture 13" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/b5e62d07-c1fe-438e-8768-3a88d38c8deb">   

**-Monthly trip**   
Both user types have demonstrated similar patterns throughout 2023, having more journeys from spring and going up to its peak during summer and gradually lessening it to autumn and making winter the driest season. Casual and membership users had the narrowest gap in July.   
**-Weekly trip**   
Weekly usage showed almost contrasting styles between the user types with membership users having more journeys on weekdays and decreasing by the weekend, whereas casual users travelled steadily through weekdays and by the weekend approaching, they gradually reached their peak on Saturday and remained relatively high until Sunday.   
**-Hourly trip**   
When it comes to hourly overlook, casual users increased continuously until the afternoon and had its peak around 5pm. In comparison, membership rides had two peaks at 8am and around 5pm which made the overlap with the casual members, and both diminished for the rest of the hours.    

-The overall bike hire was highest during summer and lowest in the winter. From the chart, it is likely that membership users are using Cyclistic as a regular commute method, and casual members would be more likely to use it for leisurely purposes.   

<br>

**3. Now the average duration of the trip is examined.**   

<img width="528" alt="Picture 14" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/afe46359-1297-45a4-861f-c44f0ed1727b">   

Overall, in contrast to the frequency graphs above, membership users took almost half of the trip duration than casual users. In every time frame, membership users remained relatively steady keeping their journey around 11-12minutes. Whereas casual users’ rides varied from a minimum of 15 minutes to a maximum of 29 minutes.    

Casual users' ride duration fluctuated since spring and decreased slightly from October to the end of 2023. The bigger variation was similarly observed on the day of the week average. When members were using bikes slightly more from Friday to Sunday, casual riders had their lowest point on Wednesday and went up until the weekend and made their way down from Monday. Both of users have shown their lowest duration in the early hours; 4 -6am was the quietest hour. Then casual users’ records went up steeply from the morning onward to the noon and gradually decreased to the afternoon hour and remained still.   

This can support the previous findings about the users that members would use the service more likely for their commute purposes considering this, and casual users made their journey outside of rush hour to travel for more assorted and personal purposes.   



**4. Location comparison**   
Lastly, the frequency of users’ visits to bike stations is analysed.   

<img width="544" alt="Picture 15" src="https://github.com/areumhan0423/Google-Data-Analytics-/assets/158506119/88ef2bf5-07d3-4057-b473-cdb6692a2957">   

Both start and end station frequency displays that casual users are more likely to use the city centre’s stations and membership users are relatively more dispersed into wider areas, presumably more residential part of the city.   

<br>

**Summary**

- Membership users would be more likely to use Cyclist for regular and commuting purposes with around 10 minutes per ride consistently.
- Membership users prefer to hire bikes at 8am and 5pm during weekdays, during the warmer weather (April to October).
- Casual riders are more likely to take their trip for occasional and leisurely purposes for longer rides over the weekends.
- Casual riders prefer to hire bikes in the same weather, but during the daylight hours of the weekend.

 <br>

## ACT
With the understanding of the differences between non/members in using Cyclistic’s service, an effective marketing strategy to increase the conversion rate of casual users can be developed.   


### Recommendations   
1. Diversify membership types for monthly and seasonal (about 3 month), or annual weekend only memberships to boost the participation of weekend/season-based users.
2. Introduce temporal/on-going discount. This will be beneficial for both types of users: For casual riders who take longer rides could increase their service reliance which could potentially lead them to purchase the annual membership. For annual members, it would consolidate their loyalty to the company.
3. Focus the marketing location on city centre to increase the awareness of casual users especially during spring summer seasons. 

