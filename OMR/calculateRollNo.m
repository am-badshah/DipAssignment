function rollNo = calculateRollNo(b)

se = strel('disk',5);
open = imopen(b,se);

[L,N]=bwlabel(open,8);
props = regionprops(L,'Centroid');

for i=1:N
    x(i)=props(i).Centroid(1);
    y(i)=props(i).Centroid(2);
end

rollNo=0;

for c=1:N
    for row=0:62:558
        if(y(c) > row && y(c) < row+62)
            d = row/62;
        end
    end
        if(x(c)> 50 && x(c) < 105)
            d=d*1000;
        else if(x(c)> 105 && x(c) < 175)
                d=d*100;
            else if(x(c)> 175 && x(c) < 245)
                    d=d*10;
                else if(x(c)> 245 && x(c) < 310)
                    d=d*1;
                    end
                end
            end
        end
rollNo=rollNo+d;
end
  
            
