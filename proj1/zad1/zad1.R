# FUNCTION FOR DATA PREPROCESSING
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

data = clean_data(read.csv("./proj1/zad1/data/k_d_7.csv", header=FALSE))
all_locations = sort(unique(data[,"Nazwa"]))

chosen_locations = c("DOLINA PIĘCIU STAWÓW", "CIESZANÓW", "POLANA CHOCHOŁOWSKA")
data_in_chosen = data[data[,"Nazwa"] %in% chosen_locations,]

# 1ai

boxplot(as.double(Max)~Nazwa,
        data=data_in_chosen,
        main="Maximum temperature for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0
        )

# 1aii

data_in_chosen['Wahanie'] = data_in_chosen["Max"] - data_in_chosen["Min"]

boxplot(as.double(Wahanie)~Nazwa,
        data=data_in_chosen,
        main="Day-night temperature difference for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0
        )

# 1aiii

diffs = data.frame()
for(loc in chosen_locations)
{
  new_frame = data.frame(Nazwa = loc, Różnica = diff(data_in_chosen[data_in_chosen[,"Nazwa"] == loc,"Max"]))
  diffs = rbind(diffs, new_frame)
}

boxplot(Różnica~Nazwa,
        data=diffs,
        main="Temperature difference between consecutive days for each localization",
        xlab="Localization",
        ylab="Degrees Celsius",
        col="orange",
        border="black",
        range=0,
        grid=T
)

# 1b

location = "GORZYŃ" #### CHOSEN LOCATION FOR 1B

loc_diffs = diff(data[data[,"Nazwa"] == location,"Max"])
diffs_m = mean(loc_diffs)
diffs_sd = sd(loc_diffs)
text = paste("Distribution of temperature difference between consecutive days in",location)
hist(loc_diffs,
     probability=T,
     breaks=20,
     main=text,
     xlab="Temperature difference",
     ylab="Probability"
)
curve(dnorm(x, mean=diffs_m, sd=diffs_sd), add=T)

epsilon = 2 #### CHOSEN ERROR VALUE
sum(abs(loc_diffs) <= epsilon)/length(loc_diffs)
    