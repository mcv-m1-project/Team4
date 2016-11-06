#Week 4 (Team 4)


Task 0:

In this Task, we have created the function createTemplate() to create 4 different temaples (Binary, Color, Grayscale and Edge) for each shape (Up Triangle, Down Triangle, Circle and Square). Before we have created the function getProperties() to obtain the bounding box area and the form factor for each type of signal.


Task 1:

In this Task, we implement the correlation between our templates from task0 with our masks. For that, we use the functions "PaintMask", which changes the masks to remove all the noise and images that are not signals and keeps only our windows Candidates, and also the function "ReadMat", which computes the names in order to load all the .mat and .png from previous weeks.


Task 2:

In this Task 2, we use the template edges from Task 0. We calculate the matrix D, which is the distance in the original binary image B for the pixel (i,j) to the nearest value whose value is “1”. The formula used is “bwdist()” to calculate the matrix D.
Our Goal is to minimize the sum of D multiplied by our Template T.


Task 3:

Finally, in this Task 3, we before calculte the ground truth "gt" of all the files in “Validation Train” using the function getGroundTruth(dirname, gtTxtFiles). Then ee create a function testBbox(gtTxtFiles, gt, dirname). For all the files: we load the windowCandidates and compare it with its ground truth using the function PerformanceAccumulationWindow() to obtain the number of True Positive, False Negative and False Positive. Finally, we use the function PerformanceEvaluationWindow(TP, FN, FP) to obtain Precision, Sensitivity and Accuracy. Then we calculate Recall and F1 with the known formula.

