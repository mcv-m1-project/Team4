#Week 4 (Team 4)

Task 1:
Use Task1.m
We have used the UCM Method to generate different segmentation regions for each image. Then we get the windowsCandidates depends on the generated regions.
To avoid false windowCandidates we have filtered them using Template Matching from Week 3 to save only the good windows as a .mat file.

Task 2:
Use Task2_Hough.m
Geometric Heruistics. Circle search using rgb2gray().

Task 3:
Use Task3.m
Finally, in this Task 3, we before calculte the ground truth "gt" of all the files in “Validation Train” using the function getGroundTruth(dirname, gtTxtFiles).
Then we create a function testBbox(gtTxtFiles, gt, dirname).
For all the files: we load the windowCandidates and compare it with its ground truth using the function PerformanceAccumulationWindow() to obtain the number of True Positive, False Negative and False Positive. Finally, we use the function PerformanceEvaluationWindow(TP, FN, FP) to obtain Precision, Sensitivity and Accuracy.
Then we calculate Recall and F1 with the known formula.
