katastrofy <- read.csv("./proj1/zad2/katastrofy.csv")
katastrofy['Year'] <- substr(katastrofy$Date, start=7, stop=10)
katastrofy['Month'] <- substr(katastrofy$Date, start=1, stop=2)
katastrofy['Quarter'] <- (as.numeric(substr(katastrofy$Date, start=1, stop=2))-1)%/%3 + 1
katastrofy['Count'] <- c(1)
katastrofy <- katastrofy[,c('Year', 'Quarter', 'Count')]

grouped = aggregate(Count ~ Quarter + Year, data=katastrofy, FUN=length)

hist(grouped$Count,
     probability=T,
     breaks=max(grouped$Count),
     main="Number of crashes in quarter periods over the years",
     xlab="Number of crashes",
     ylab="Probability"
)
x = seq(0,max(grouped$Count))
y = dpois(x, lambda = mean(grouped$Count))
points(x,y)

