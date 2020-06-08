#Install and load RBotometer
devtools::install_github("mkearney/botornot")
library(tweetbotornot)

#Load database
db <- read.csv("/Users/riccardocervero/Desktop/QAnonRidotto.csv")
users <- as.vector(unique(db$User))

#Estimate probability for each user
data <- tweetbotornot(users)

#Order based on probability
data <- data[order(data$prob_bot,decreasing = TRUE), ]

#Write to csv
write.csv(data,"/Users/riccardocervero/Desktop/bot.csv")
