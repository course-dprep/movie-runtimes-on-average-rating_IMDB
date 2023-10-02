# **IMDB - the impact of runtime on average rating**

*What is the relationship between the runtime and the average user rating for movies?*

## __Motivation__
Movies have a range of different runtimes. The longest movie ever made was over 35 days long (Lyon, 2023), while one of the shortest movies ever made was only 100 seconds long (Acuna, 2014). Even though these movies are definitley exceptions when it comes to runtimes, it does show the big range that exists in the movie industry. According to Follows (2021) "half of all Hollywood movies are between 96 and 120 minutes long, with the most popular running time being 101 minutes". 

__Relevance__

We want to know if the length of the movie runtime influences peoples opinion (average rating) about the movie. The results of this project can give useful insights to, for example, movie production companies and streaming services, into how the run times of their movies affect ratings, and with that likely, the popularity and profitability of their movies.    

## __Method and results__
For this research, the research question *What is the relationship between the runtime and the average user rating for movies?* was formulated. 

To answer this question we make use of data from imdb.com, in specific the datasets 'title_basics.tsv' and 'title_ratings.tsv', which were downloaded from the following website: https://datasets.imdbws.com. 
The variables that were used, were the following:

| Variable       | Description |
|------------|-----|
| titleType | the type/format of the title (e.g. movie, sohrt, tvseries, tvepisode, video, etc.  |
| primaryTitle   | the more popular title/the title used by the filmmakers on promotional material at the point of release  |
| runtimeMinutes | primary runtime of the title, in minutes |
| averageRating | weighted average of all the indidivual user ratings |

To analyse the data the program Rstudio was used. After downloading the data into Rstudio the two datasets were merged into one dataset, 'data_merged.csv'. This merged dataset was used when cleaning our data. After cleaning the data a data exploration was done using a Rmarkdown file. Lastly the data was analysed using a linear regression.  

Insert later: program(s) used, type of analysis, what did we do to clean and merge data

## __Repository overview__
├── README.md <br>
├── data <br>
├── gen <br>
│   ├── analysis <br>
│   ├── data-preparation <br>
│   └── paper <br>
└── src <br>
    ├── analysis <br>
    ├── data-preparation <br>
    └── paper <br>

## __Prerequisites__
- R [Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- Make [Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

For R, the following packages are used:
```
install.packages(dplyr)
install.packages(tidyverse)
```

## __Running instructions__
Insert later

## __More resources__
Optional

## __About__
Thank you for your interest in our project! This project is part of our 'Data Preparation & Workflow Management' course at Tilburg University. The contributors are part of team 1, which consists of:
- Lindsey Coover (l.e.coover@tilburguniversity.edu)
- Renée Minten (r.c.c.minten@tilburguniversity.edu)
- Marlie Snoeijen (m.p.c.snoeijen@tilburguniversity.edu) 
- Nikkie Valen (n.c.p.e.valen@tilburguniversity.edu)
- Fleur van Vugt (f.e.v.vanvugt@tilburguniversity.edu)
