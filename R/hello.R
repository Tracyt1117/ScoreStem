# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

library(mlr)

#' @import mlr randomForest e1071 FactoMineR factoextra
NULL

#' readMatrix
#'
#' Read data for training
#'
#' @param dir the path of the matrix to be read
#'
#' @return list object of the read matrix
#' @export
#'

readMatrix <- function(dir) {
  matrix <- read.csv(dir)
  return(matrix)
}

#' scorePrediction
#'
#' Predict the stemscore of predictSet with trainSet and selected machine learning algorithm.
#'
#' @param algorithm the algorithm used for learning. 'SVM','randomForest','naiveBayes' are supported.
#' @param trainSet the data for training. With stem state labelled.
#' @param predictSet the data for predictiton.
#' @param target the label column of the trainSet
#'
#' @return prediction result in the form of list
#' @export
#' @examples
#' load('../data/test.RData')
#' scorePrediction('SVM',trainSet = test, predictSet = test, target='label')
#'
scorePrediction <- function(algorithm, trainSet, predictSet,target){
  task = makeClassifTask(id = "stemScore", data = trainSet, target = target, positive = 1)
  if (algorithm == 'randomForest') {
    lrn = makeLearner("classif.randomForest", predict.type = "prob", fix.factors.prediction = TRUE)
    model = train(lrn, task)
    newData.pred = predict(model, newdata = predictSet)
    pred = as.data.frame(newData.pred)
    return(pred)
  }

  if (algorithm == 'SVM') {
    lrn = makeLearner("classif.svm", predict.type = "prob", fix.factors.prediction = TRUE)
    model = train(lrn, task)
    newData.pred = predict(model, newdata = predictSet)
    pred = as.data.frame(newData.pred)
    return(pred)
  }

  if (algorithm == 'naiveBayes') {
    lrn = makeLearner("classif.naiveBayes", predict.type = "prob", fix.factors.prediction = TRUE)
    model = train(lrn, task)
    newData.pred = predict(model, newdata = predictSet)
    pred = as.data.frame(newData.pred)
    return(pred)
  }

  else {
    print('Input algorithm is not supported.')
  }

}

#' PCAVisualization
#'
#' Visualize the prediction result with PCA to check if the predicted stem cell can be distinguished from non-stem cell.
#'
#' @param predictSet Data for stemscore prediction.
#' @param predictResult The result from scorePrediction function
#'
#' @return a plot of PCA dimentional reduction
#' @export
#' @examples
#' load('../data/test.RData')
#' prediction = scorePrediction('SVM',trainSet = test, predictSet = test, target='label')
#' PCAVisualization(test[1:13190],prediction)
#'
PCAVisualization <- function(predictSet, predictResult){
  predictSet.pca <- FactoMineR::PCA(predictSet, graph = FALSE)

  label = c()
  for (i in seq_along(predictResult$response)){
    if (predictResult$response[i] == 1){
      label <- c(label,'Stem')
    }
    else {
      label <- c(label,'NonStem')
    }
  }

  factoextra::fviz_pca_ind(predictSet.pca,
               geom.ind = "point",
               col.ind=label,
               addEllipses = TRUE,
               legend.title = "Groups"
  )

}

