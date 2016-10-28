Task1:

This Task is computed by the different functions called:
-myerosiongray
-mydilategray
-myTopHat
-myOpening
-myErosion (only BW picture)
-myDualTopHat
-MyClosing

---------------------------------------------------------------------------------------------------------------------------------------

Task2:

Task2 is used to compare the results between the functions created for us (called before, "myerosiongray", "mydilategray", etc) and the original functions ("imrode", "imdilate", etc). We measure the computational efficiency (%) of our programed operators in time and the difference. 

----------------------------------------------------------------------------------------------------------------------------------------

Task3:

Task3 is used to Improve our mask with the commands Opening, Closing, Dilation, etc. from Matlab.
To Execute Task3 you need to have a directory name called 'test' where the masks from week 1 are separated in order the different traffic signals (A, B, C,etc). 
Task3Comparacio is used to Compare this new improved masks to the ones we had before (always talking about the validation_split made in week1).

Inside Task3 there are implemented the next functions:
                              -Mejora
                                                        
Inside "Task3Comparacio" there are implemented the functions:
                              -TesteigMask        --> PerformanceAcumulationPixel   &    PerformanceEvaluationPixel
                              -Calculate Average
                              
If you want to execute 2nd part of Task 3 (used as an improvement for the test masks of week1 to upload to the virtual server) you need to discomment the 2nd part and to comment the 1st one.
Also you need a directory inside 'test/test/images' where you have all the images and another called 'test/test/masks' where you have the masks to improve.
     
----------------------------------------------------------------------------------------------------------------------------------------

Task4:

Task4 is used to compute the Histograms of the first week validation test images.

From directory'/train' we read all the masks and .txt.

Then we use function "GetParameters" to adquire all the parameters of the different masks (a struct with the brx, bly, filling ratio, etc).

Then in the function "CreateHistogram" not only we create the histogram for each type of signals (ABC, DF & E) but we also create the directories for them (original images).

Finally, inside "HistogramBackProjection" We compare our images with the histograms in order to create the masks that we are gonna test.


In order to present the masks of the different images of the "Test" in order to upload them inside the virtual server, it is necessary to discomment part 2 of Task4 and to comment part1.
Inside this part2, the function used is gonna be "HistogramBackProjectiontest".
