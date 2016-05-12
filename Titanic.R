##  Exercise 1: Titanic (Missing Data)
##  Exercise 2: QPlot Assignment appended to same file (as both asked for same file name)

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


## QPlot Assignment


library(ggplot2)

## Step 0 
## Use Cleaned Titanic Data from earlier assignment
titanic_clean<-read.csv("C:/Users/Mark's/Desktop/Data Science/DataScienceAssignments/Titanic/titanic_clean.csv", header=TRUE)
titanic<-data.frame(titanic_clean)

# Check out the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + 
  geom_bar(position = "dodge")

# Use ggplot() for the second instruction
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + 
  geom_bar(position = "dodge") + 
  facet_grid(. ~ survived)

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction
ggplot(titanic, aes(x = factor(pclass), y = age, col = factor(sex))) + 
  geom_jitter(size = 3, alpha = 0.5, position = posn.j) + 
  facet_grid(. ~ survived)
