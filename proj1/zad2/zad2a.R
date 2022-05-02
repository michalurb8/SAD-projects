katastrofy <- read.csv("/Users/user/Downloads/katastrofy.csv")

kwartal1 <- subset(katastrofy, substr(katastrofy$Date,1,2) == "01" | substr(katastrofy$Date,1,2) == "02" | substr(katastrofy$Date,1,2) == "03")
kwartal2 <- subset(katastrofy, substr(katastrofy$Date,1,2) == "04" | substr(katastrofy$Date,1,2) == "05" | substr(katastrofy$Date,1,2) == "06")
kwartal3 <- subset(katastrofy, substr(katastrofy$Date,1,2) == "07" | substr(katastrofy$Date,1,2) == "08" | substr(katastrofy$Date,1,2) == "09")
kwartal4 <- subset(katastrofy, substr(katastrofy$Date,1,2) == "10" | substr(katastrofy$Date,1,2) == "11" | substr(katastrofy$Date,1,2) == "12")

kwartaly <- c(length(kwartal1[,1]), length(kwartal2[,1]), length(kwartal3[,1]), length(kwartal4[,1]))

barplot(kwartaly, col = c("lightblue", "blue", "lightcyan", 
                           "lavender"), names.arg = c("Q1","Q2","Q3","Q4"))


lata <- split(stosunek, substr(katastrofy$Date,7,10))
