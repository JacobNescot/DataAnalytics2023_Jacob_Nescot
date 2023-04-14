library(MASS)
library(tree)


set.seed(2)
head(Boston)
help('Boston')

train = sample(1:nrow(Boston),size = 0.7*nrow(Boston))
train2 = sample(1:nrow(Boston), nrow(Boston)/2)
train_data <- Boston[train, ]
test_data <- Boston[-train, ]

tree.boston = tree(medv ~., Boston, subset = train2)
summary(tree.boston)

tree(formula = medv~. , data = Boston , subset = train2)
plot(tree.boston)
text(tree.boston, pretty = 0)

# The variable "lstat" measure the percentage of the individuals with lower socioeconomics status.
# The tree indicates that the lower values of lstat corresponds to more expensive house.
# Now we use the cv.tree() function to see whether pruning the tree will
# improve performance.
#cv - is cross validation 

cv.boston = cv.tree(tree.boston)
plot(cv.boston$size, cv.boston$dev, typ = 'b')

prune.boston = prune.tree(tree.boston, best = 5)
plot(prune.boston)
text(prune.boston , pretty = 0)


yhat=predict(tree.boston ,newdata=Boston[-train ,])
boston.test=Boston[-train ,"medv"]
plot(yhat,boston.test)
# adding the abline()
abline(0,1)
mean((yhat-boston.test)^2)
sqrt(19.631)
#3.340688 = Root mean square error 
# Bagging and Random Forest Example
library(randomForest)
set.seed(2)
bag.boston = randomForest(medv ~., data=Boston, subset = train, mtry=13, importance= TRUE)
bag.boston
# The argument mtry=13 indicates that all 13 predictors should be considered
# for each split of the tree—in other words, that bagging should be done.
# How well does this bagged model perform on the test set?
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
plot(yhat.bag, boston.test)
# adding the abline()
abline(0,1)
mean((yhat.bag-boston.test)^2)

bad.boston =
  bag.boston=randomForest(medv~.,data=Boston,subset=train, mtry=13,ntree=25)

yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
mean((yhat.bag-boston.test)^2)

set.seed(2)
rf.boston=randomForest(medv~.,data=Boston,subset=train,
                       mtry=6,importance =TRUE)
yhat.rf = predict(rf.boston ,newdata=Boston[-train ,])
mean((yhat.rf-boston.test)^2)

importance (rf.boston)

varImpPlot (rf.boston)




#rf_model <- randomForest(medv ~. , data = train_data , ntree = 500)
#rf_predection <- predict(rf_model, newdata = test_data)

#rmse <- sqrt(mean(rf_predection))
train = sample(1:nrow(Boston),size = 0.7*nrow(Boston))
train_data <- Boston[train, ]
test_data <- Boston[-train, ]

tree.boston = tree(medv ~., Boston, subset = train_data)
summary(tree.boston)

tree(formula = medv~. , data = Boston , subset = train_data)
plot(tree.boston)
text(tree.boston, pretty = 0)

# The variable "lstat" measure the percentage of the individuals with lower socioeconomics status.
# The tree indicates that the lower values of lstat corresponds to more expensive house.
# Now we use the cv.tree() function to see whether pruning the tree will
# improve performance.
#cv - is cross validation 

cv.boston = cv.tree(tree.boston)
plot(cv.boston$size, cv.boston$dev, typ = 'b')

prune.boston = prune.tree(tree.boston, best = 5)
plot(prune.boston)
text(prune.boston , pretty = 0)


yhat=predict(tree.boston ,newdata= test_data)
boston.test=Boston[-train ,"medv"]
plot(yhat,boston.test)
# adding the abline()
abline(0,1)
mean((yhat-boston.test)^2)
sqrt(25.46054)
#5.045844 = Root mean square error 

rf.boston=randomForest(medv~.,data=Boston,subset=train_data,
                       mtry=6,importance =TRUE)
yhat.rf = predict(rf.boston ,newdata=test_data)
mean((yhat.rf-boston.test)^2)

importance (rf.boston)

varImpPlot (rf.boston)

