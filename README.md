# ScoreStem

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Description

<!-- badges: start -->

<!-- badges: end -->

ScoreStem is a package designed for researchers in the field of single-cell transcriptome. It uses single-cell transcriptomic data with stem state to develop a machine learning model and then use the model to predict the stem score of each cell. Thus, it helps to characterize each subgroup of cells from single-cell transcriptomic data from the perspective of stemness. The user can specify machine learning algorithms like random forest, SVM and naïve bayes. The PCBC data is provides in the package and the users can select their own dataset. After prediction, PCA is utilized for the visualization of the result.

## Installation

The package can be installed from [GitHub](https://github.com/) with:

``` r
require("devtools")
devtools::install_github("Tracyt1117/scoreStem", build_vignettes = FALSE)
library("scoreStem")

```

## Overview

``` r
ls("scoreStem")
```

Note: Datasets are raw data found in inst/extdata/, and can be accessed
using the system.file function


``` r
```

Package Structure:

``` 
-ScoreStem
  |- ScoreStem.Rproj
  |- DESCRIPTION
  |- LISCENCE
  |- README
  |- inst
    |- extdata
      |- cleaned_data.csv
      |- test.csv
      |- train.csv
  |- man
    |- PCAVisualization.Rd
    |- readMatrix.Rd
    |- scorePrediction.Rd
  |- R
    |- hello.R

  
```

## Contributions

Each function of this package is written by Yutong Chen. The function scorePrediction() relies on mlr package for 
machine learning framework, and e1071 for SVM and niave bayes algorithms, and randomForest for random forest.
The function PCAVisualization relies on FactoMineR for PCA algorithm and factoextra for the scatter plot of 
PCA result. Data for training can be downloaded from (PCBC) dataset 
<https://www.synapse.org/>.(See reference 1)

## References

Salomonis, et al. Integrated Genomic Analysis of Diverse Induced Pluripotent Stem Cells from the Progenitor Cell Biology Consortium.
Stem Cell Reports, Volume 7, Issue 1, 12 July 2016, Pages 110-125, ISSN 2213-6711, http://dx.doi.org/10.1016/j.stemcr.2016.05.006.

Bischl B, Lang M, Kotthoff L, Schiffner J, Richter J, Studerus E,
Casalicchio G, Jones Z (2016). "mlr: Machine Learning in R."
_Journal of Machine Learning Research_, *17*(170), 1-5. <URL:
https://jmlr.org/papers/v17/15-066.html>.

David Meyer, Evgenia Dimitriadou, Kurt Hornik, Andreas Weingessel
and Friedrich Leisch (2020). e1071: Misc Functions of the
Department of Statistics, Probability Theory Group (Formerly:
E1071), TU Wien. R package version 1.7-4.
https://CRAN.R-project.org/package=e1071

A. Liaw and M. Wiener (2002). Classification and Regression by
randomForest. R News 2(3), 18--22.

Sebastien Le, Julie Josse, Francois Husson (2008). FactoMineR: An
R Package for Multivariate Analysis. Journal of Statistical
Software, 25(1), 1-18. 10.18637/jss.v025.i01

Alboukadel Kassambara and Fabian Mundt (2020). factoextra: Extract
and Visualize the Results of Multivariate Data Analyses. R package
version 1.0.7. https://CRAN.R-project.org/package=factoextra


## Acknowledgements

This package was developed as part of an assessment for 2020 BCB410H:
Applied Bioinformatics, University of Toronto, Toronto, CANADA
