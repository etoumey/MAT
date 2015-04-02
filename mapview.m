function varargout = mapview(varargin)
% MAPVIEW MATLAB code for mapview.fig
%      MAPVIEW, by itself, creates a new MAPVIEW or raises the existing
%      singleton*.
%
%      H = MAPVIEW returns the handle to a new MAPVIEW or the handle to
%      the existing singleton*.
%
%      MAPVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPVIEW.M with the given input arguments.
%
%      MAPVIEW('Property','Value',...) creates a new MAPVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mapview_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mapview_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mapview

% Last Modified by GUIDE v2.5 02-Apr-2015 14:44:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mapview_OpeningFcn, ...
                   'gui_OutputFcn',  @mapview_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before mapview is made visible.
function mapview_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mapview (see VARARGIN)

% Choose default command line output for mapview
imshow('map.jpg');
handles.output = hObject;
set(handles.text3, 'String', 0)
control = 1;
f = impoint(gca, 0,0);
h = impoint(gca, 0,0);
while str2double(get(handles.text3, 'String')) == 0
    if control == 1
        addNewPositionCallback(f, @(f) set(handles.text1, 'String', f(1)));
        addNewPositionCallback(f, @(f) set(handles.text2, 'String', f(2)));
        h = impoint(gca);
        setColor(h,'k')
        pos = getPosition(h);
        delete(f);
    elseif control == 2
        addNewPositionCallback(h, @(h) set(handles.text1, 'String', h(1)));
        addNewPositionCallback(h, @(h) set(handles.text2, 'String', h(2)));
        f = impoint(gca);
        setColor(f,'k')
        pos = getPosition(f);
        delete(h);
    end
    set(handles.text1, 'String', pos(1));
    set(handles.text2, 'String', pos(2));
    if control == 1
        control = 2;
    else 
        control = 1;
    end
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mapview wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mapview_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function map_ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to map_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate map_ax



% --- Executes on button press in calculate_pb.
function calculate_pb_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text3, 'String', 1)
close('all')


% --- Executes on button press in begin_pb.
function begin_pb_Callback(hObject, eventdata, handles)
% hObject    handle to begin_pb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
