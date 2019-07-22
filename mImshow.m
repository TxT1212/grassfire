function [] = mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, axe)
x = size(kown_Map, 1);
y = size(kown_Map, 2);
trace_map = zeros(x, y);

for i = 1:size(trace,1)
    trace_map(trace(i,1), trace(i,2)) = 1;
end
global seeWholeMapFlag
if isempty(seeWholeMapFlag)
    seeWholeMapFlag = 1;
end
for i = 1:x
    for j = 1:y
        if(kown_Map(i, j) == 0)
            rectangle(axe,'Position',[i,j,1,1], 'FaceColor',[1,1,1])
        elseif(kown_Map(i,j) == 1)
            rectangle(axe,'Position',[i,j,1,1], 'FaceColor',[0.6,0.3,0.3])
        elseif(trueMap(i,j) == 0 && seeWholeMapFlag)
            rectangle(axe,'Position',[i,j,1,1], 'FaceColor',[0.4,0.4,0.4])
        elseif(trueMap(i,j) == 1 && seeWholeMapFlag)
            rectangle(axe,'Position',[i,j,1,1], 'FaceColor',[0.4,0.2,0.2])
        elseif(~seeWholeMapFlag)
            rectangle(axe,'Position',[i,j,1,1], 'FaceColor',[0,0,0])
        end
        if(trace_map(i,j) == 1)
             rectangle(axe,'Position',[i+0.2,j+0.2,0.4,0.4], ...
                 'FaceColor',[0.3,0.6,0.3],'Curvature',1)
        end
    end
end

rectangle(axe,'Position',[now_x, now_y,1,1], 'FaceColor','r')
rectangle(axe,'Position',[des_x, des_y,1,1], 'FaceColor','g')


end