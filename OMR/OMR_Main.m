%{
This script read an image in bmp, Using OMR it checks the quiz type [Quiz or Sessional], check the persons Roll No and calculate his Marks by checking
his answers. There is also a GUI made where you can select and image by browsing and it will show the results on GUI.
%}


f = imread('2697.bmp');

neg = ~f;
testTypeImg = imcrop(neg,[0,0,250,200]);
tt = calculateTestType(testTypeImg);

rollNoImg = imcrop(neg,[0,440,320,1100]);
rollNo = calculateRollNo(rollNoImg);

marksImg = imcrop(neg,[485,162,790,906]);
marks = calculateMarks(marksImg);

imshow(f),title(sprintf('TEST type = %s : ROLL NO = %ld: Marks = %ld',tt,rollNo,marks));
