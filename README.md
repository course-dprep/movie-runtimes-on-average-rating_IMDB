# **IMDB - the impact of runtime on average rating**
This project examines the relationship between the runtime and average user rating of movies. We prepared IMDB data to analyze this potential effect.

## __Motivation__
Movies have a range of different runtimes. The longest movie ever made was over 35 days long (Lyon, 2023), while one of the shortest movies ever made was only 100 seconds long (Acuna, 2014). Even though these movies are definitely exceptions when it comes to runtimes, it does show the big range that exists in the movie industry. According to Follows (2021) "half of all Hollywood movies are between 96 and 120 minutes long, with the most popular runtime being 101 minutes". 

__Relevance__ </br>
It is interesting to assess whether the length of the movie influences a user's opinion (average rating) of the movie. The results of this project can give useful insights to, for example, movie production companies and streaming services, into how the runtimes of their movies affect ratings, and with that likely, the popularity and profitability of their movies.    

## __Method and results__
For this research, the following research question was formulated: *What is the relationship between the runtime and the average user rating for movies?* 
The research method in this analysis is linear regression. Linear regression is a statistical method that scientifically estimates the relationship between two variables. Therefore, it is well suited to use in our analysis with respect to the relationship between the runtime and the average user rating of a movie. 

To answer this question we make use of data from imdb.com, specifically the datasets 'title_basics.tsv' and 'title_ratings.tsv', which were downloaded from the following website: https://datasets.imdbws.com. 
The variables that were used for the analysis of our research question, were the following:

| Variable       | Description |
|------------|-----|
| titleType | the type/format of the title (e.g. movie, short, tvseries, tvepisode, video, etc.  |
| runtimeMinutes | primary runtime of the title, in minutes |
| averageRating | weighted average of all the indidivual user ratings |
| numVotes | Number of votes the title has received |
| isAdult | non-adult title; 1: adult title |
| startYear | represents the release year of a title |

To analyse the data, the program Rstudio was used. After downloading the data into Rstudio, the two datasets were merged into one dataset, 'data_merged.csv'. This merged dataset was used when cleaning our data. During the data-cleaning process, we only retained data for movies and excludes other types. Further, observations with missing values for the relevant variables in this research were removed. The dataset was extended with a variable that classifies movies as 'short' or 'long', and a variable that shows standardized ratings. Finally, the analysis included assumption checks and the examination of the research question using a linear regression.  

## __Conclusion__
We can conclude from our analysis that the run time of a movie has a small, but positive effect on the average rating. This suggests that a longer movie receives a higher average rating. As this effect is relatively small, it is important to take limitations and suggestions for further research into account. Firstly, there might be cultural differences in the perception of an 'ideal run time'. Further research could focus on average ratings from specific countries, continents or cultures, to see if there is a difference amongst them. Next to that, run time is probably not the most important factor for consumers in rating a certain movie. The narrative of the movie and the acting are factors that play a more important role. However, these factors are more difficult to quantify and were not available in the dataset.  

## __Repository overview__
```
├── README.md
├── data 
├── gen 
│   ├── analysis 
│   ├── data-preparation 
│   └── paper 
└── src 
    ├── analysis 
    ├── data-preparation 
    └── paper 
```

## __Prerequisites__
- R [Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- Make [Installation Guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
- Pandoc [Installation Guide](https://pandoc.org/installing.html)

In R, the following packages are used:
```
install.packages(dplyr)
install.packages(tidyverse)
install.packages(car)
install.packages(lmtest)
```

## __Running instructions__
### __Step by step__
In order to run the code of this project, please follow these instructions:

_Step 1._ Fork this repository </br></br>
_Step 2._ Open the command line / terminal and run the following code: </br>
```git clone https://github.com/{your username}/movie-runtimes-on-average-rating_IMDB.git``` </br></br>
_Step 3._ Set working directory to movie-runtimes-on-average-rating_IMDB and run the following command: ```make``` </br>

_Optional:_ To clean up all raw and unnecessary data files created during the pipeline process, run the following code in your command line / terminal: ```make clean```

_Note:_ the pipeline process will not work anymore once you close your command line/terminal.

### Alternative way
In case you wish to run the code in a more manual way, you can replace step 3 by running the code files in the order below:
- ../src/data-preparation/download_data.R
- ../src/data-preparation/merge_data.R
- ../src/data-preparation/clean_data.R
- ../src/analysis/model_results.R

The final pdf containing a project overview and the final results can be obtained by rendering the following Rmarkdown document:
- ../src/paper/data_analysis.Rmd

## __More resources__
For this project, we used the following resources:
- Course material from [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/) (Open Science course by dr. Hannes Datta)
- Installation guides and Principles of Project Setup and Workflow Management from [Tilburg Science Hub](https://tilburgsciencehub.com/tutorials/reproducible-research-and-automation/principles-of-project-setup-and-workflow-management/project-setup-overview/)

## __Last updated__
14 October 2023

## __About__
Thank you for your interest in our project! This project is part of our 'Data Preparation & Workflow Management' course at Tilburg University. The contributors are part of team 1, which consists of:
- [Lindsey Coover](https://github.com/lindseycoover) (l.e.coover@tilburguniversity.edu)
- [Renée Minten](https://github.com/ReneeMinten) (r.c.c.minten@tilburguniversity.edu)
- [Marlie Snoeijen](https://github.com/marliesnoeijen) (m.p.c.snoeijen@tilburguniversity.edu) 
- [Nikki Valen](https://github.com/NCPEValen) (n.c.p.e.valen@tilburguniversity.edu)
- [Fleur van Vugt](https://github.com/fleurvanvugt) (f.e.v.vanvugt@tilburguniversity.edu)
