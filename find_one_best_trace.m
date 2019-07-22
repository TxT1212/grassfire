function trace = find_one_best_trace(fire_map, now_x, now_y)

nowDist = fire_map(now_x, now_y);
if (nowDist == inf)
    trace = [];
    return
end
trace = zeros(nowDist,2);
fire_map_expand = ones(size(fire_map,1)+2, size(fire_map, 2)+2)*inf;
fire_map_expand(2:end-1,2:end-1) = fire_map;
now_x = now_x +1;
now_y = now_y +1;
while 1
    found = 0;
    if(fire_map_expand(now_x-1, now_y)<nowDist)
        now_x = now_x-1;
        found = 1;
    end
    if(fire_map_expand(now_x+1, now_y)<nowDist && ~found)
        now_x = now_x+1;
        found = 1;
    end
    if(fire_map_expand(now_x, now_y-1)<nowDist && ~found)
        now_y = now_y-1;
        found = 1;
    end
    if(fire_map_expand(now_x, now_y+1)<nowDist && ~found)
        now_y = now_y+1;
        found = 1;
    end
    if(nowDist == 0 || found == 0)
        break;
    end
    trace(nowDist,1) = now_x;
    trace(nowDist,2) = now_y;
    nowDist = nowDist -1;
end
trace = trace - 1;

end
