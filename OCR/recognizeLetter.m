function l=recognizeLetter(f)
% f=imread('26.bmp');
[m,n]=size(f);
Letters='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
minSAD=1000;

for i=1:26
    t=imread(sprintf('%ld.bmp',i));
    t=imresize(t,[m,n]);
    d=abs(t-f);
    sad=sum(d(:));
    if(sad<minSAD)
        minSAD=sad;
        alph=i;
    end
end
l=Letters(alph);
% imshow(f),title(Letters(alph));