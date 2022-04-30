#WCZYTANIE I PRZYGOTOWANIE DANYCH

clean_data <- function(frame) {
  frame = data.frame(lapply(frame, function(x) { gsub("<a3>", "Ł", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<8c>", "Ś", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<d1>", "Ń", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<ca>", "Ę", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<d3>", "Ó", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<af>", "Ż", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("<a5>", "Ą", x) }));
  frame = data.frame(lapply(frame, function(x) { gsub("ӯ",   "ÓŻ", x) }));
  names(frame) = c("Kod",
                   "Nazwa",
                   "Rok",
                   "Miesiąc",
                   "Dzień",
                   "Max",
                   "Status_pomiaru_TMAX",
                   "Min",
                   "Status_pomiaru_TMIN",
                   "Średnia",
                   "Status_pomiaru_STD",
                   "Temperatura_minimalna_przy_gruncie",
                   "Status_pomiaru_TMNG",
                   "Suma_dobowa_opadów",
                   "Status_pomiaru_SMDB",
                   "Rodzaj_opadu",
                   "Wysokość_pokrywy_śnieżnej",
                   "Status_pomiaru PKSN")
  frame$Max = as.double(frame$Max)
  frame$Min = as.double(frame$Min)
  return(frame);
}

july = clean_data(read.csv("k_d_7.csv", header=FALSE))
locations = sort(unique(july[,"Nazwa"]))

chosen = c("DOLINA PIĘCIU STAWÓW", "CIESZANÓW", "JAROCIN")
july = july[july[,"Nazwa"] %in% chosen,]

#ZADANIE 1ai

boxplot(as.double(Max)~Nazwa,
        data=july,
        main="Maximum temperature for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0
        )

#ZADANIE 1aii

july['Wahanie'] = july["Max"] - july["Min"]

boxplot(as.double(Wahanie)~Nazwa,
        data=july,
        main="Day-night temperature difference for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0
        )

#ZADANIE 1aiii

diffs = data.frame()
for(loc in chosen)
{
  diffs = rbind(diffs, data.frame(Nazwa = loc, Różnica = diff(july[july[,"Nazwa"] == loc,"Max"])))
}

boxplot(Różnica~Nazwa,
        data=diffs,
        main="Difference between days for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0
)

