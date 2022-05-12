katastrofy <- read.csv("./proj1/zad2/katastrofy.csv")
katastrofy <- katastrofy[,c("Date", "Type")]

grouped <- aggregate(. ~ substr(Type, 1, 7), data=katastrofy, FUN=length)
colnames(grouped) <- c("Name", "Count")
grouped$Name <- tolower(grouped$Name)
grouped <- grouped[-1,c(1,2)]

threshold <- 90
filtered <- grouped[(grouped[,2] > threshold), ]

pie(filtered$Count,
    labels = filtered$Name,
    main=paste("Pie chart of plane type count of crashed planes \n",
              "Counting only planes with more than",
              threshold,
              "crashes")
    )

