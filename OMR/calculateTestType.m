function tt = testType(b)

se = strel('disk',5);
open = imopen(b,se);
[L,N]=bwlabel(open,8);
props = regionprops(L,'Centroid');
% x = props.Centroid(1);
y = props.Centroid(2);

if(y > 65 && y < 125)
    tt='Quiz';
end
if( y > 125 && y < 190)
    tt = 'Sessional';
end
