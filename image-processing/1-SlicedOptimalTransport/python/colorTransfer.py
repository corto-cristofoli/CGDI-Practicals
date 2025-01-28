import numpy as np
import cv2
import random as rd

PATH="../"

# Load an color image
source = cv2.imread(PATH+'pexelA-0.png',cv2.IMREAD_COLOR)
print("Source image " + str(source.shape))

# Load an color image
target = cv2.imread(PATH+'pexelB-0.png',cv2.IMREAD_COLOR)
print("Target image " + str(target.shape))

def image_show(nom,img):
    cv2.namedWindow(nom, cv2.WINDOW_NORMAL)
    cv2.imshow(nom,img)
    cv2.waitKey(0)

image_show('source', source)
image_show('target', target)

##Swapping the channels
output = source
rows,cols,nbchannels = source.shape


# for i in range(rows):
#   for j in range(cols):
#      color = source[i,j]
#      # color2 = [color[2], color[1], color[0]]
#      color2 = 0.21 * color[0] + 0.72 * color[1] + 0.07 * color[2]
#      output[i,j]=color2;

for k in range(1):
    print(f"{k}eme itération")
    pixelout = []
    pixeltrgt = []

    R,G,B = rd.random(), rd.random(), rd.random()

    def val(pxl,r,g,b,mat):
        return r*mat[pxl][0] + g*mat[pxl][1] + b*mat[pxl][2]

    for i in range(rows):
        for j in range(cols):
            pixelout.append((i,j))
            pixeltrgt.append((i,j))
    pixelout.sort(key=lambda x: val(x,R,G,B,output))
    pixeltrgt.sort(key=lambda x: val(x,R,G,B,target))

    for i in range(len(pixelout)):
        colout, coltarg = output[pixelout[i]], target[pixeltrgt[i]]

        vect = [0,0,0]
        vect[0] = abs( int((coltarg[0] - colout[0])*R) + output[pixelout[i]][0] )
        vect[1] = abs( int((coltarg[1] - colout[1])*G) + output[pixelout[i]][1] )
        vect[2] = abs( int((coltarg[2] - colout[2])*B) + output[pixelout[i]][2] )
        output[pixelout[i]] = [min(255, vect[0]), min(255, vect[1]), min(255, vect[2])]


print("Output image " + str(output.shape))
image_show('output', output)
cv2.destroyAllWindows()

print("Saving the output")
cv2.imwrite('output.png',output)

