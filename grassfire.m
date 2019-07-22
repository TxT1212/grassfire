function distanceArr = grassfire (occupancy, dest_row, dest_col)
occupancy = occupancy > 0;
row=size(occupancy,1);
col=size(occupancy,2);
distanceArr = ones(size(occupancy,1),size(occupancy,2));
distance_search=ones(size(occupancy,1)+2,size(occupancy,2)+2);
distance_search = Inf*distance_search;
%Initialize all of the entries in the distance array to infinity;
distance_search(dest_row+1,dest_col+1)=0;
%Set the distance corresponding to the destination cell to zero;
distance_update=zeros(size(distanceArr));
while(1)
    if sum(sum(distance_search(2:end-1,2:end-1)==distance_update))==row*col
        break
    end
    distance_update=distance_search(2:end-1,2:end-1);
    for i=2:row+1
        for j=2:row+1
            if ~occupancy(i-1,j-1) && distance_search(i,j)==inf 
                min_step=min([distance_search(i,j)-1 distance_search(i+1,j) distance_search(i-1,j) distance_search(i,j+1) distance_search(i,j-1)]);
                distance_search(i,j)=min_step+1;
            end
        end
    end
end
distanceArr=distance_update;
end
    
                
            
            
            


