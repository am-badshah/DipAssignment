function marks =calculateMarks(b); 

se = strel('disk',5);
open = imopen(b,se);

[L, N]=bwlabel(open,8);
props = regionprops(L,'Centroid');
option=zeros(12,1);
answer =zeros(12,1);
% key = ['B' 'A' 'D' 'C' 'A' 'B' 'B' 'C' 'A' 'D' 'C' 'B'];
key = 'BADCABBCADCB';
for i=1:N
    x(i)=props(i).Centroid(1);
    y(i)=props(i).Centroid(2);
end

for c=1:N
    for row=0:62:682
        if(y(c) > row && y(c) < row+62)
            i=(row+62)/62;
        end
    end
         if(x(c) > 15 && x(c) < 80)
             option(i)=option(i)+1;
             answer(i)='A';
         end
         if(x(c) > 80 && x(c) < 145)
             option(i)=option(i)+1;
             answer(i)='B';
         end
         if(x(c) > 145 && x(c) < 210)
             option(i)=option(i)+1;
             answer(i)='C';
         end
         if(x(c) > 210 && x(c) < 275)
             option(i)=option(i)+1;
             answer(i)='D';
         end
end
for i=1:12
    if(option(i) == 0 || option(i) >1)
        answer(i)=0;
    end
end
marks=0;
for i=1:12
    if(key(i)==answer(i))
        marks=marks+1;
    end
end
