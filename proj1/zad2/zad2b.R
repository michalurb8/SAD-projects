katastrofy <- read.csv("/Users/user/Downloads/katastrofy.csv")
lata <- split(stosunek, substr(katastrofy$Date,7,10))
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
barplot(a, names.arg =b)

loty <- read.csv("/Users/user/Downloads/loty.csv")
katastrofyLoty = c()
katastrofyLoty[1] = liczba_katastrof[[93]] / loty[[2]][1]
katastrofyLoty[2] = liczba_katastrof[[94]] / loty[[2]][2]
katastrofyLoty[3] = liczba_katastrof[[95]] / loty[[2]][3]
katastrofyLoty[4] = liczba_katastrof[[96]] / loty[[2]][4]
katastrofyLoty[5] = liczba_katastrof[[97]] / loty[[2]][5]
katastrofyLoty[6] = liczba_katastrof[[98]] / loty[[2]][6]
barplot(katastrofyLoty, names.arg = c("2004","2005","2006","2007","2008","2009"))
