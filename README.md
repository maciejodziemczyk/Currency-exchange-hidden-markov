# Currency exchange - markov switching model
Project created for Advanced Econometrics II (org. Zaawansowana Ekonometria II) classes at WNE UW

Language:
 - Polish - classes, report and code comments

Semester: III (MA studies)

## About
The main objective of this project was to practice econometric methods learned during classes. We've got 4 parts of the material and we had to perpare 3 models, each from different part. This repo is about 3rd part named "time series analysis". The goal of this research was to investigate currency rates (in USD) fluctuations using markov switching models. We downloaded data from fxtop.com, this page contains data from central banks. Our idea was to check different fluctuations profiles (long swings, asymmetric swings and random walk) for floating rates (NZD, AUD, EUR, CHF) and mixed rates (HKD, GMD, LKR), and it was based on the literature (Ayodeji 2016). During analysis we saw possible cointegration of AUD (australian dollar) and NZD (new zeland dolar). We decided to test it via Engle-Granger procedure based od cointegration vector estimation, augmented Dicky-Fuller and Breusch-Godfrey tests. We found that NZD and AUD are not cointegrated. 
Our hypothesis was that floating rates are described by two states (appreciation and depreciation) for floating rates and 3 states (constant state added) for mixed rates. We also wanted to investigate types of rates fluctuations. In our Markov models we usually switched constant, variance and AR(1) component. We selected the best model for each rate using information criteria and log-likelihood value.

Findings
 - NZD and AUD are not cointegrated
 - floating rates are not always described by 2 states and mixed rates are not always described by 3 states
 - long swings for AUD, EUR, GMD and HKD
 - asymmetric swings for CHF
 - no random walk for considered rates
 - no known profile for NZD and LKR
 - NZD has constant mean, states only differ in variance

In this project I learnt about exchange rates modelling and practice my time series analysis skills (especially cointegration testing and markov models)

## Repository description
 - Kuzma_Odziemczyk_minimodel_3.pdf - project report (I strongly recommend you to read it)
 - adf.R - augmented Dicky-Fuller test written by my teacher
 - dane_raw.csv - raw data from fxtop.com
 - eurusd_d.csv data for EUR-USD pair
 - waluty.R - R script - basic preprocessing, analysis, plots and cointegration test
 
## Technologies
 - R (basic preprocessing, analysis, plots and cointegration test)
 - STATA (markov switching models estimation and hypotesis testing, not included)
 - LaTeX (report)
 
 ## Authors
 - Bartek Kuźma
 - Maciej Odziemczyk
 
 ## Note
 Markov models are difficult to estimate, we had many numerical problems so obtained results may be biased

