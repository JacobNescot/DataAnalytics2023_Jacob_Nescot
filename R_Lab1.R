#creating a dataframe 
#Example : RPI Weather dataframe

days <- c('Mon','Tues','Wed','Thur','Fri','Sat','Sun') #days
temp <- c(28,39,49,19,29,34.5,231)#temp
snowed <- c('T','T','F','T','T','T','F') #SNOWED ON DAYS T = TRUE F = FALSE
snowed
class(snowed)
help("data.frame")

emptyDataframe <- data.frame()
emptyDataframe

RPI_Weather_Week <- data.frame(days,temp,snowed,stringsAsFactors = TRUE)

RPI_Weather_Week

str(RPI_Weather_Week)
summary(RPI_Weather_Week)

RPI_Weather_Week[1,]
RPI_Weather_Week[,1]
stringsAsFactors = TRUE





###"C:\Users\Jacob\OneDrive\Documents\Rpi\Data_Analytics\EPI_data_2010.csv"

EPI_data <- read.csv(file.choose(), header = TRUE,skip = 1)

#EPI_data <- read.csv("C:\Users\Jacob\OneDrive\Documents\Rpi\Data_Analytics\EPI_data_2010.csv">/EPI_data_2010.csv")
EPI_data
View(EPI_data)
attach(EPI_data)
fix(EPI_data)
EPI
tf <- is.na(EPI)
E <- EPI[!tf]

summary(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30.,95.,1.0),probability = TRUE)
lines(density(EPI,na.rm = T,bw=1.))
rug(EPI)

plot(ecdf(EPI), do.points=F,verticals=T)
par(pty="s")
qqnorm(EPI);qqline((EPI))
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df = 5),x,xlab = "Q-Q plot for t dsn")
qqline(x)

AGRICULTURE
FORESTRY

summary(AGRICULTURE)
fivenum(AGRICULTURE,na.rm = TRUE)
stem(AGRICULTURE)
hist(AGRICULTURE)
hist(AGRICULTURE,seq(20.,65.,80),probability = T)