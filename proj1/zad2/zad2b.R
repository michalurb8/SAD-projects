katastrofy <- read.csv("./proj1/zad2/katastrofy.csv")
stosunek <- 1:5268
lata <- split(stosunek, substr(katastrofy$Date,7,10))
liczba_katastrof=lapply(X=lata, FUN=length)
c <- 1
a = c()
b = c()
for(i in 1:98){
     a[i] <- liczba_katastrof[[i]]
}
k = 4
b[1]=1908
b[2]=1912
b[3]=1913
for(i in 1915:2009){
    b[k] = i
    k = k+1
}
barplot(a,
        names.arg =b,
        main="Number of crashes in consecutive years",
        xlab="Year",
        ylab="Number of crashes"
        )

loty <- read.csv("./proj1/zad2/loty.csv")
colnames(loty)[2] <- "Number"
loty$Number = loty$Number * 10 ** 6 # Convert back to millions
loty$Number = loty$Number /100      # Convert to percents
katastrofyLoty = c()
katastrofyLoty[1] = liczba_katastrof[[93]] / loty[[2]][1]
katastrofyLoty[2] = liczba_katastrof[[94]] / loty[[2]][2]
katastrofyLoty[3] = liczba_katastrof[[95]] / loty[[2]][3]
katastrofyLoty[4] = liczba_katastrof[[96]] / loty[[2]][4]
katastrofyLoty[5] = liczba_katastrof[[97]] / loty[[2]][5]
katastrofyLoty[6] = liczba_katastrof[[98]] / loty[[2]][6]
barplot(katastrofyLoty,
        names.arg = c("2004","2005","2006","2007","2008","2009"),
        main="Estimated probability that a flight ended in a crash",
        xlab="Year",
        ylab="Estimated probability [%]"
        )

