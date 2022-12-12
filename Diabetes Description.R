rm(list=ls())

#loading csv files
diabetes_train = read.csv("diabetes_train.csv")

#Summary
summary(diabetes_train)

hist(diabetes_train$Pregnancies, prob=F)
lines(density(diabetes_train$Pregnancies), col="green")

#Prior to generating the graph, graphical parameters are set with the par() command.
opar=par()                          
#mfrow to divide the plotting region into 3 rows and 3 columns
par(bg="white",mfrow=c(3,3),las=2,col="red")

plot(diabetes_train$Outcome, diabetes_train$Pregnancies, xlab="outcome",ylab="Pregnancies")
plot(diabetes_train$Outcome, diabetes_train$Glucose, xlab="outcome",ylab="Glucose")

plot(diabetes_train$Outcome, diabetes_train$BloodPressure, xlab="outcome",ylab="Blood Pressure")
plot(diabetes_train$Outcome, diabetes_train$SkinThickness, xlab="outcome",ylab="Skin Thickness")
plot(diabetes_train$Outcome, diabetes_train$Insulin, xlab="outcome",ylab="Insulin")
plot(diabetes_train$Outcome, diabetes_train$BMI, xlab="outcome",ylab="BMI")
plot(diabetes_train$Outcome, diabetes_train$DiabetesPedigreeFunction, xlab="outcome",ylab="Diabetes Pedigree function")
plot(diabetes_train$Outcome, diabetes_train$Agexlab="outcome",ylab="Age")

par(opar)



