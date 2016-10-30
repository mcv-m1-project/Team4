Task 1:

In this Task we implemented the Connected Component Labeling (CCL) algorithm. We have used the masks obtained in the masks obtained in the Week 2 after applying morphological operators in the space HSV.
Finally we obtained the windows candidates and we have saved it as a .mat file.

Task 2:

In this second Task we implemented the Sliding Window algorithm. To decide the appropiate size of the window that we will use, he have create a GetWindowSize() function. This Function using the .txt training information calculate de "mean window". This window will be used in the following tasks.
Finally we obtained the windows candidates and we have saved it as a .mat file.

Task 3:

In this third Task we implemented the Integral Image to improve efficiency of feature computation. After implementing both methods, we can see that the execution time is reduced.
Finally we obtained the windows candidates and we have saved it as a .mat file.

Task 4:

In the Task 4, we have evaluated our region-based methods implemented in the tasks before and the one that has been implmented in the Task 5. We load the diferent windowCandidate.mat that we have saved and evaluate the data obtained in the function created testBbox() where we calculate the properties Precision, Recall, Accuracy, F1, True Positive, False Negative and Sensitivity by applying the functions PerformanceAccumulationWindow and PerformanceEvaluationWindow.

Task 5:

In the optional task, Task 5. We improved efficiency of feature computation using convolutions. After implementing the three methods, we can see that the execution time is reduced.
Finally we obtained the windows candidates and we have saved it as a .mat file and calculated the properties Precision, Recall, Accuracy, F1, True Positive, False Negative and Sensitivity by applying the functions PerformanceAccumulationWindow and PerformanceEvaluationWindow.
