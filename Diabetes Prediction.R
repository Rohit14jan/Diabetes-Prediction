#clear the enviornment
rm(list=ls()) 

#loading csv files
diabetes_test = read.csv("diabetes_test.csv") 
diabetes_train = read.csv("diabetes_train.csv") 

#install.packages("caTools")
#loading the library caTools
library(caTools) 

#train dataset column names 
colnames(diabetes_train) 

#logistic model creation
lm_1 = glm(Outcome ~.,data =diabetes_train,family = binomial)
#summary of lm_1
summary(lm_1)

#Model with important variables only
lm_2 = glm(Outcome ~ Pregnancies+Glucose+BloodPressure+BMI,data =diabetes_train,family = binomial)
#summary of lm_2
summary(lm_2)

#prediction on model using test dataset
predictions = predict(lm_2, type="response", newdata=diabetes_test)

#data frame creation and adding predictions
diabetespredDF = data.frame(diabetes_test,predictions)
diabetespredDF$diabetesprediction = diabetespredDF$predictions>0.5

#categorize the predictions against the actual values - confusion matrix
# >0.5 = TRUE and <0.5 = FALSE as per prediction values
cf = table(diabetespredDF$Outcome,diabetespredDF$diabetesprediction)
# checking if it is a data frame
cf = as.data.frame.matrix(table(diabetespredDF$Outcome,diabetespredDF$diabetesprediction))

# view table of Cf
View(cf)

# accuracy of the model
accuracy = (96+34)/(96+12+26+34) 
truepositive = (96)/(96+12+26+34)
truenegative = (34)/(96+12+26+34)
Falsepositive = (26)/(96+12+26+34) #type1 error
Falsenegative = (12)/(96+12+26+34) #type2 error
