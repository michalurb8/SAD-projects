katastrofy <- read.csv("/Users/user/Downloads/katastrofy.csv")

antonov <- subset(katastrofy, substr(katastrofy$Type,1,7) == "Antonov")
liczba_antonov = length(antonov$Date)
liczba_wszystkich = length(katastrofy$Date)
stosunek = liczba_antonov / liczba_wszystkich

slices <- c(liczba_antonov, liczba_wszystkich)
lbls <- c("Antonov", "Reszta")
pie(slices, labels = lbls, main="Pie Katastrofy z udziałem samolotów Antonov")
