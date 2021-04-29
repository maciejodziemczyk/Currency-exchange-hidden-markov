
library('tseries')
library('xts')
library('dygraphs')
library('urca')
library('lmtest')
source("adf.R")

data=read.csv("eurusd_d.csv")
data$Data <- as.Date(data$Data)
data <- data[,c("Data","Zamkniecie")]
colnames(data) <- c("date", "close")
data$r <- diff.xts(100*log(data$close))
data <- na.omit(data)
r_xts = xts(data[, c("r")], order.by = data$date)
write.csv(data, "eurusd.csv")


dygraph(r_xts, main="log zwroty EUR:USD") %>% 
  dyRangeSelector(height = 50)

testdf(variable = data$r, adf_order = 5)
# poprawna liczba rozszerzeń ADF <=> brak autokorelacji reszt <=> p_bg > alpha
#     H0 dla testu Breusha-Godfreya: Brak autokorelacji
# test ADF H0: niestacjonarność
# bez rozszerzeń jest poprawny test, i odrzuca H0 o niestacjonarności


# WYKRESY WALUT #
#wczytywanie i przygotowywanie danych
data=read.csv("dane_raw.csv", sep=";")
for(i in 2:11){
  data[,i] <- as.numeric(gsub(",",".",data[,i]))
}
data$Date <- as.Date(data$Date, "%d.%m.%Y")
#data <- data[c("Date", "NZD", "PLN", "HKD", "GMD", "LKR", "BDT")]
data <- data[c("Date", "NZD", "AUD", "EUR", "CHF", "HKD", "GMD", "LKR")]
#data[1,"PLN"] <- NA
data <- data[data$Date >= "2000-01-01",]
xts_curr = xts(data[, -1], order.by = data$Date)
dygraph(xts_curr, main="") %>% 
  dyRangeSelector(height = 50) %>%
  dySeries("LKR", "BDT", axis = 'y2')


par(mfrow = c(1,1))
plot(data$Date, data$NZD, type ="l", col = "darkblue", ylim = c(0.4,1.1), lwd = 2, xlab="czas", ylab="")
lines(data$Date, data$AUD, type = "l", col = "darkred", lwd = 2)
legend("topleft",1,legend=c("NZD", "AUD"),
       col=c("darkblue", "darkred"), lty=1:1, lwd = 2:2, cex=1.5)

plot(data$Date, data$NZD, type="l", xlab="czas", ylab="NZD", lwd = 2, col = "darkblue")
plot(data$Date, data$AUD, type="l", xlab="czas", ylab="AUD", lwd = 2, col = "darkblue")
plot(data$Date, data$EUR, type="l", xlab="czas", ylab="EUR", lwd = 2, col = "darkblue")
plot(data$Date, data$CHF, type="l", xlab="czas", ylab="CHF", lwd = 2, col = "darkblue")
plot(data$Date, data$HKD, type="l", xlab="czas", ylab="HKD", lwd = 2, col = "darkblue")
plot(data$Date, data$GMD, type="l", xlab="czas", ylab="GMD", lwd = 2, col = "darkblue")
plot(data$Date, data$LKR, type="l", xlab="czas", ylab="LKR", lwd = 2, col = "darkblue")

# AUD i NZD wyglądają na skointegrowane
# testowanie stacjonarności zmiennych
testdf(variable = data$AUD, adf_order = 5)# 2 opóźnienia => BG przyjmuje H0 o braku autokorelacji, ADF brak podstaw do odrzucenia H0 o niestacjonarności 
testdf(variable = data$NZD, adf_order = 5)# 1 opóźnienie => BG przyjmuje H0 o braku autokorelacji, ADF brak podstaw do odrzucenia H0 o niestacjonarności

# pierwsze różnice AUD i NZD
dAUD <- diff.xts(data$AUD)
dNZD <- diff.xts(data$NZD)
# testowanie stacjonarności pierwszych różnic
testdf(variable = dAUD, adf_order = 5) # BG przyjmuje H0 o braku autokorelacji bez opóźnień, ADF odrzuca H0 o niestacjonarności
testdf(variable = dNZD, adf_order = 5) # BG przyjmuje H0 o braku autokorelacji bez opóźnień, ADF odrzuca H0 o niestacjonarności

# zatem AUD i NZD są I(1), można zatem sprawdzić czy są skointegrowane
# wektor kointegrujący
cointregress <- lm(data$AUD~data$NZD)
library(stargazer)
summary(cointregress)
stargazer(cointregress, type = "latex")
# dNZD silnie istotnie przy wyjaśnianiu dAUD
# testowanie stacjonarności reszt cointregress
testdf(variable = cointregress$residuals, adf_order = 5) # dla 1 opóźnienia BG przyjmuje H0 o braku autokorelacji bez opóźnień, ADF przyjmuje H0 o niestacjonarności
# Wniosek:
# brak kointegracji między AUD i NZD





