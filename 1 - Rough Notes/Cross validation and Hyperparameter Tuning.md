tags: [[Machine Learning]], [[Sampling]] 
## Cross validation
1. Hold Out Method - Train-Test split
2. K-Fold Cross Validation
		In this method, we create k copy of data.
		Each set of data is divided into k folds (samples) of data.
		The model is trained using k - 1 samples, and tested using one sample.
		At the end, we compute the accuracy of each and average it.
3. Stratified K-Fold Cross Validation
		In this, it will sample based on the data distribution.
4. Leave One Out C.V.
		One sample for testing and the rest for testing
5. Leave p-out cross validation
		leave p no of samples

Leave one out and leave p-out are bad for big datasets. Only applicable for small datasets.


### Hyperparameter Tuning

Algorithm such as Random forest classifier have many parameters such as no of trees (n_estimators), depth of each tree (max_depth) etc.

This helps us to select the best parameters which yields in best accuracy.