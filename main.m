% main
trueMap=rand(10,10);
for i=1:10
    for j=1:10
        if trueMap(i,j)>0.7
            trueMap(i,j)=1;
        else
            trueMap(i,j)=0;
        end
    end
end
des_x=round(rand(1)*10);
des_y=round(rand(1)*10);
%choose the destination randomly
trueMap(des_x,des_y)=0;


mFinished = 0;
% trueMap = zeros(5);
% trueMap = ones(5);
% trueMap(1:5,1)=zeros(5,1);
kown_Map = ones(size(trueMap))*(-1);
ini_x = 1;
ini_y = 1;
% des_x = 5;
% des_y = 5;
now_x = ini_x;
now_y = ini_y;
trace = [];


count_step = 0;
pause_t = 1;


axe =  axes('Position',[0 0 1 1]);

mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, axe)
pause(pause_t)
while(~mFinished)
    count_step = count_step + 1;
    kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    fire_map = grassfire(kown_Map,des_x, des_y);
    trace = find_one_best_trace(fire_map, now_x, now_y);
    impossibility = isempty(trace);
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, axe)
    if impossibility
        break
    end
    now_x = trace(end,1);
    now_y = trace(end,2);
    if(now_x==des_x && now_y==des_y)
        mFinished = 1;
    end    
    pause(pause_t)
end












