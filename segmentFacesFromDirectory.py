# This is a script meant to find all faces in a folder of images and create a cropped image
# of each face. 

import numpy as np
import cv2
import os
import time 

importFolder = "testFolder"
exportFolder = "testExport"

validExtensions = {'.jpg','.jpeg','.png','.gif'}

face_cascade = cv2.CascadeClassifier('../opencv/data/haarcascades/haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('../opencv/data/haarcascades/haarcascade_eye.xml')

# Do not change 
totalImages = 0
trueFolderName = ""

"""
Find all images in a folder, segment the faces, and create
an image of each face. 

@param path : A string which points to a directory to import images from. 
"""
def segmentFaces(folderPath):
    # Adapted from : http://stackoverflow.com/questions/3964681/find-all-files-in-directory-with-extension-txt-in-python
    for file in os.listdir(folderPath):
        # Adapted from : http://stackoverflow.com/questions/541390/extracting-extension-from-filename-in-python
        fileName, fileExtension = os.path.splitext(file)
        if fileExtension in validExtensions:
            imgFileName = folderPath + os.sep + file
            print fileName
            cropFace(imgFileName, fileName, fileExtension) 

"""
Creates a cropped photo of all faces in an image. 
@param imgPath : A string representing the relative path to an image with which to 
crop faces out of. 
"""
def cropFace(imgPath, fileName, extension):
    global importFolder

    # Load the image. 
    img = cv2.imread(imgPath)

    # Convert to grayscale. 
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Detect faces. Adapted from : http://docs.opencv.org/2.4/modules/objdetect/doc/cascade_classification.html
    # Parameter specifying how much the image size is reduced at each image scale.
    scaleFactor  = 1.2
    # Parameter specifying how many neighbors each candidate rectangle should have to retain it.
    minNeighbors = 5

    # Computer magic 
    faces = face_cascade.detectMultiScale(gray, scaleFactor, minNeighbors)

    # Go through every face in the image and crop it out. 
    faceNum = 0
    for (x,y,w,h) in faces:
        # For now, set the name of the images to be the original file name plus
        # an indicator number. 
        croppedFileName = trueFolderName + os.sep + fileName + "_" + str(faceNum) + extension

        # Crop out the face using openCV's interesting image convention
        # [Y1:Y2, X1,X2] 
        cropped_face = img[y:y+h,x:x+w]

        # Write the image to the out folder. 
        cv2.imwrite(croppedFileName, cropped_face)

        # Increment the number of faces we've seen in the image. 
        faceNum += 1

    cv2.imshow('img',img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

"""
Attempt to create a directory. Add the epoch time to the end to avoid 
directory name conflicts.
@param directoryName : A string representing the name of the directory to create. 
"""
def createDirectory(directoryName):
    global trueFolderName
    newDirectoryName = directoryName + "_" + str(int(time.time()))
    trueFolderName = newDirectoryName
    os.makedirs(newDirectoryName)

# Run image segmentation program. 
def run():
    global importFolder, exportFolder
    createDirectory(exportFolder)
    segmentFaces(importFolder)

run()
