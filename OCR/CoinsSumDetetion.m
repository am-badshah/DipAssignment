% {This script count the total number of coins and each coin value ang give you the sum.
[its a very basic one thats only check the size of each coin and if its in some area threshold its places into ones, two and fives].
NOTE: the images must be take from the same height as the algo is filtering the coins depending on its area }%
f=imread('abdul.jpg');
b=im2bw(f,130/255);

 b=imfill(b,'holes');
se=[0 1 0; 1 1 1; 0 1 0]; 
b = imopen(b,se);
imshow(b);

[L,N]=bwlabel(b,8);
ones=0;
twos=0;
fives=0;
props = regionprops(L,'Area');

for i = 1:N
ar = props(i).Area;
if(ar >= 120000 && ar <=135000)
    ones = ones+1;
else if(ar >= 150000 && ar <= 160000 )
        twos = twos+2;
    else  if(ar >= 160000 && ar <= 180000)
        fives = fives+5;
    end
end
end
end



 total=ones+twos+fives;
 figure
 imshow(f),title(sprintf('ONES = %ld, TWOS = %ld, FIVES = %ld: TOTAL=%ld',ones,twos/2,fives/5,total));
