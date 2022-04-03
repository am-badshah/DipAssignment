f = imread('2697.bmp');

neg = ~f;
testTypeImg = imcrop(neg,[0,0,250,200]);
tt = calculateTestType(testTypeImg);

rollNoImg = imcrop(neg,[0,440,320,1100]);
rollNo = calculateRollNo(rollNoImg);

marksImg = imcrop(neg,[485,162,790,906]);
marks = calculateMarks(marksImg);

imshow(f),title(sprintf('TEST type = %s : ROLL NO = %ld: Marks = %ld',tt,rollNo,marks));