##  Exercise 1: Titanic (Missing Data)

## Step 0
titanic_original<-read.csv("C:/Users/Mark's/Desktop/Data Science/DataScienceAssignments/Titanic/titanic_original.csv", header=TRUE)
titanic_df<-data.frame(titanic_original)

## Port of Embarkation
titanic_df$embarked[titanic_df$embarked==""] <- "S"

## Age
titanic_age_imp = transform(titanic_df, age = ifelse(is.na(age), mean(age, na.rm=TRUE), age))

## Boat (Blanks to NA)
titanic_age_imp$boat[titanic_age_imp$boat==""]  <- NA

## Create binary variable: Has cabin (1) or otherwise (0)
titanic_age_imp$has_cabin_number <- ifelse(titanic_age_imp$cabin=="", 
                        c(0), c(1)) 


## Export in csv format
write.csv(titanic_age_imp, "C:/Users/Mark's/Desktop/Data Science/DataScienceAssignments/Titanic/titanic_clean.csv")
