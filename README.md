# Currency exchange - hidden markov
Project created for Advanced Econometrics II (org. Zaawansowana Ekonometria II) classes at WNE UW

Language:
 - Polish - classes, report and code comments

Semester: III (MA studies)

## About
The main objective of this project was to practice econometric methods learned during classes. We've got 4 parts of the material and we had to perpare 3 models, each from different part. This repo is about 3rd part named "time series analysis". The goal of this research was to investigate currency rates (in USD) fluctuations using hidden markov models. We downloaded data from fxtop.com, page contained data from central banks. Our idea was to check different fluctuations profiles (long swings, asymmetric swings and random walk) for floating rates (NZD, AUD, EUR, CHF) and mixed rates (HKD, GMD, LKR), and it was based on the literature (Ayodeji 2016). During analysis we saw possible cointegration of AUD (australian dollar) and NZD (new zeland dolar). We decided to test it via Engle-Granger procedure based od cointegration vector estimation, augmented Dicky-Fuller and Breusch-Godfrey tests. We found that NZD and AUD are not cointegrated. 
Our hypothesis was that floating rates are described by two states (appreciation and depreciation) for floating rates and 3 (constant state added) states for mixed rates. We also wanted to investigate types of rates fluctuations. In our Markov models we usually switched constant, variance and AR(1) component. We selected the best model for each rate via information criteria and log-likelihood value.

