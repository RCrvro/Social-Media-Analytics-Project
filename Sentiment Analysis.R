##Lexicon-based Sentiment Analysis
#Removed duplicates for each community
#Lemmatization with POS tagging

library(tidytext) 
library(syuzhet)
library(dplyr)
library(ggplot2)
library(fmsb)

#Load database
db <- read.csv("/Users/riccardocervero/Desktop/db.csv")

#Analyse total database
result <- get_nrc_sentiment(as.character(db$text))
#Count emotion and polarity
new_result <- data.frame(colSums(result))
names(new_result)[1] <- "count"
new_result <- cbind("sentiment" = rownames(new_result), new_result)
rownames(new_result) <- NULL
new_result

#Plot barcharts
qplot(sentiment, data=new_result[1:8,], weight=count, geom="bar",fill=sentiment)+ggtitle("QAnon tweets - Emotions")
qplot(sentiment, data=new_result[9:10,], weight=count, geom="bar",fill=sentiment)+ggtitle("QAnon tweets - Polarity")

write.csv(result,"/Users/riccardocervero/Desktop/EmotionTab.csv")