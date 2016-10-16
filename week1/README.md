#Team4

PATH Folder Dataset:
- './train' {.img}
- './train/gt' {.txt}
- './train/mask' {.png}

Execution instructions:

Place the provided training and testing datasets inside a folder named 'train', so that the training dataset can be found at "/train" and with the structure given in the training dataset (.txt in folder /gt and .png in folder/mask)

Analyze Dataset
Run Task1, it analizes all the dataset inside train. We get parameters as the coordinates of the signal (tly, tlx, bly, blx), width, height, bounding box, ground truth, type of the signal (A, B, C, D, E, F), filling ratio, form factor, frequency of appearance of each signal, name of the file and its position in the dataset. 

Run Task2, two new folders will be created in the same folder as "/train" is, one for the training split "/train_split" and another for the validation split "validation_split" where you can find the 70% of the images and the 30% classified in the type of signals of Task1.

Run Task3, new folders are created. One inside "/train_split/mask" where you can find all the masks of each image separated by type of signals.
The other folder is gonna be created in "/validation_split/mask" with the masks of each image of the validation split (also separated as in the train_split).

Run Task4, at the end you will have all the average parameters for each kind of color space that we have worked in (RGB,HSB &LAB).

Run Task5,converting an RGB image into normalized RGB removes the effect of any intensity variations.
