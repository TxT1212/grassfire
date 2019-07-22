function kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y)
f1= now_x - 1 >0;
f2 = now_y -1 >0;
f3 = now_x +1 <= size(kown_Map,1);
f4 = now_y +1 <= size(kown_Map,2);
kown_Map(now_x,now_y) = trueMap(now_x,now_y);
if (f1&&f2)
    kown_Map( now_x-1, now_y-1) =trueMap( now_x-1, now_y-1);
end
if(f1)
    kown_Map( now_x-1, now_y) =trueMap( now_x-1, now_y);
end
if(f1&&f4)
    kown_Map( now_x-1, now_y+1) =trueMap( now_x-1, now_y+1);
end
if(f2)
    kown_Map( now_x, now_y-1) = trueMap( now_x, now_y-1);
end
if(f4)
    kown_Map( now_x, now_y+1) = trueMap( now_x, now_y+1);
end
if(f3&&f2)
    kown_Map( now_x+1, now_y-1) = trueMap( now_x+1, now_y-1);
end
if(f3)
    kown_Map( now_x+1, now_y) = trueMap( now_x+1, now_y);
end
if(f3&&f4)
    kown_Map( now_x+1, now_y+1) = trueMap( now_x+1, now_y+1);
end
end








