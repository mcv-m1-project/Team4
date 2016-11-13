#Week 4 (Team 4)

* **Task 1:**</br>
Use Task1.m</br>
We have used the UCM Method to generate different segmentation regions for each image. Then we get the windowsCandidates depends on the generated regions.</br>
To avoid false windowCandidates we have filtered them using Template Matching from Week 3 to save only the good windows as a .mat file.
</br>
</br>
* **Task 2:**</br>
Use Task2_Hough.m</br>
You need to have the masks & .mat from previous weeks and also the .jpg (images) so the formula CirculaHough_GRD works. Here we compute Hough for circles, squares and triangles and we decide if the windows Candidates from previous weeks are really circles, squares or triangles or not.
</br>
</br>
* **Task 3:**</br>
Use Task3.m</br>
Finally, in this Task 3, we before calculte the ground truth "gt" of all the files in “Validation Train” using the function getGroundTruth(dirname, gtTxtFiles).</br>
Then we create a function testBbox(gtTxtFiles, gt, dirname).</br>
For all the files: we load the windowCandidates and compare it with its ground truth using the function PerformanceAccumulationWindow() to obtain the number of True Positive, False Negative and False Positive. Finally, we use the function PerformanceEvaluationWindow(TP, FN, FP) to obtain Precision, Sensitivity and Accuracy.</br>
Then we calculate Recall and F1 with the known formula.
