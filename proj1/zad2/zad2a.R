katastrofy <- read.csv("./proj1/zad2/katastrofy.csv")
katastrofy['Year'] <- substr(katastrofy$Date, start=7, stop=10)
katastrofy['Month'] <- substr(katastrofy$Date, start=1, stop=2)
katastrofy['Quarter'] <- (as.numeric(substr(katastrofy$Date, start=1, stop=2))-1)%/%3 + 1
katastrofy['Count'] <- c(1)
katastrofy <- katastrofy[,c('Date', 'Year', 'Quarter', 'Count')]
katastrofy <- katastrofy[order(as.Date(katastrofy$Date, format="%m/%d/%Y")),]

grouped <- aggregate(Count ~ Quarter + Year, data=katastrofy, FUN=length)

first_year <- as.numeric(katastrofy$Year[1])
first_quarter <- as.numeric(katastrofy$Quarter[1])
last_index <- nrow(katastrofy)
last_year <- as.numeric(katastrofy$Year[last_index])
last_quarter <- as.numeric(katastrofy$Quarter[last_index])
total_quarters <- 4*(last_year - first_year) - 1 + last_quarter + (5 - first_quarter)

missed_quarters <- total_quarters - nrow(grouped)

crashes <- c(grouped$Count, rep(0, missed_quarters))

hist(crashes,
     probability=T,
     breaks=max(grouped$Count),
     main="Number of crashes in quarter periods over the years",
     xlab="Number of crashes",
     ylab="Probability"
)
x = seq(0,max(grouped$Count))
y = dpois(x, lambda = mean(grouped$Count))
points(x,y)

