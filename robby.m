function varargout = robby(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @robby_OpeningFcn, ...
    'gui_OutputFcn',  @robby_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



% --- Executes just before robby is made visible.
function robby_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
global autoPlayFlag
autoPlayFlag = 0;
global seeWholeMapFlag
seeWholeMapFlag = 0;
% Update handles structure
global trueMap des_x des_y kown_Map now_x now_y count_step
count_step = 0;
now_x =1;
now_y = 1;
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
des_x=ceil(rand(1)*10);
des_y=ceil(rand(1)*10);
%choose the destination randomly
trueMap(des_x,des_y)=0;
trueMap(1,1) = 0;
kown_Map = ones(size(trueMap))*(-1);
mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, [], handles.axes1)
kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
fire_map = grassfire(kown_Map,des_x, des_y);
trace = find_one_best_trace(fire_map, now_x, now_y);

mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, handles.axes1)
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = robby_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global autoPlayFlag
global kown_Map trueMap des_x des_y count_step
global now_x
global now_y

if ~autoPlayFlag && now_y-1>0 && kown_Map(now_x, now_y-1)==0
    count_step = count_step + 1;
    now_y = now_y - 1;
    kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    fire_map = grassfire(kown_Map,des_x, des_y);
    trace = find_one_best_trace(fire_map, now_x, now_y);
    
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, handles.axes1)
    myString = sprintf('您使用步数: %d', count_step);
    set(handles.text2, 'String', myString);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global autoPlayFlag
global kown_Map trueMap des_x des_y count_step
global now_x
global now_y

if ~autoPlayFlag && now_y+1<=size(trueMap,2) && kown_Map(now_x, now_y+1)==0
    
    count_step = count_step + 1;
    now_y = now_y + 1;
    kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    fire_map = grassfire(kown_Map,des_x, des_y);
    trace = find_one_best_trace(fire_map, now_x, now_y);
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, handles.axes1)
    myString = sprintf('您使用步数: %d', count_step);
    set(handles.text2, 'String', myString);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global autoPlayFlag
global kown_Map trueMap des_x des_y count_step
global now_x
global now_y

if ~autoPlayFlag && now_x-1>0 && kown_Map(now_x-1, now_y)==0
    count_step = count_step + 1;
    now_x = now_x - 1;
    kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    fire_map = grassfire(kown_Map,des_x, des_y);
    trace = find_one_best_trace(fire_map, now_x, now_y);
    
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, handles.axes1)
    myString = sprintf('您使用步数: %d', count_step);
    set(handles.text2, 'String', myString);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global autoPlayFlag
global kown_Map trueMap des_x des_y count_step
global now_x
global now_y

if ~autoPlayFlag && now_x+1<=size(trueMap,1) && kown_Map(now_x+1, now_y)==0
    
    count_step = count_step + 1;
    now_x = now_x + 1;
    kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    fire_map = grassfire(kown_Map,des_x, des_y);
    trace = find_one_best_trace(fire_map, now_x, now_y);
    
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, handles.axes1)
    myString = sprintf('您使用步数: %d', count_step);
    set(handles.text2, 'String', myString);
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
global autoPlayFlag
global kown_Map trueMap des_x des_y count_step
global now_x
global now_y
if  get(hObject,'Value')
    autoPlayFlag = 1;
    now_x=1;
    now_y=1;
    kown_Map = ones(size(trueMap))*(-1);
    trace = [];
    count_step = 0;
    pause_t = 1;
    axe =  handles.axes1;
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, trace, axe)
    pause(pause_t)
    mFinished = 0;
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
    myString = sprintf('Robby使用步数: %d', count_step);
    set(handles.text3, 'String', myString);
else
    count_step = 0;
    autoPlayFlag = 0;
    now_x =1;
    now_y =1;
    kown_Map = ones(size(trueMap))*(-1);
     kown_Map = update_kown_Map(kown_Map, trueMap, now_x, now_y);
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, [], handles.axes1)
end



% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
global seeWholeMapFlag

global kown_Map trueMap des_x des_y
global now_x
global now_y
if get(hObject,'Value')
    seeWholeMapFlag = 1;
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, [], handles.axes1)
else
    seeWholeMapFlag = 0;
    mImshow(kown_Map, trueMap, now_x, now_y, des_x, des_y, [], handles.axes1)
    
end


% Hint: get(hObject,'Value') returns toggle state of radiobutton2
