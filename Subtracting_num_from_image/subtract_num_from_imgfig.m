function varargout = subtract_num_from_imgfig(varargin)
% SUBTRACT_NUM_FROM_IMGFIG MATLAB code for subtract_num_from_imgfig.fig
%      SUBTRACT_NUM_FROM_IMGFIG, by itself, creates a new SUBTRACT_NUM_FROM_IMGFIG or raises the existing
%      singleton*.
%
%      H = SUBTRACT_NUM_FROM_IMGFIG returns the handle to a new SUBTRACT_NUM_FROM_IMGFIG or the handle to
%      the existing singleton*.
%
%      SUBTRACT_NUM_FROM_IMGFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBTRACT_NUM_FROM_IMGFIG.M with the given input arguments.
%
%      SUBTRACT_NUM_FROM_IMGFIG('Property','Value',...) creates a new SUBTRACT_NUM_FROM_IMGFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before subtract_num_from_imgfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to subtract_num_from_imgfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help subtract_num_from_imgfig

% Last Modified by GUIDE v2.5 27-Apr-2022 14:12:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @subtract_num_from_imgfig_OpeningFcn, ...
                   'gui_OutputFcn',  @subtract_num_from_imgfig_OutputFcn, ...
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


% --- Executes just before subtract_num_from_imgfig is made visible.
function subtract_num_from_imgfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to subtract_num_from_imgfig (see VARARGIN)

% Choose default command line output for subtract_num_from_imgfig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes subtract_num_from_imgfig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = subtract_num_from_imgfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global image
image=strcat(pathname,filename);
axes(handles.axes2);
imshow(image);
global original
original=rgb2gray(imread(image));


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global original
input=str2num(get(handles.edit1,'String'));
if ~isnumeric( input )
   warndlg('Please, Enter a number and try again');
elseif isempty(input)
    warndlg('Please, Enter a number and try again');
else
subtracted_img=original-input;
axes(handles.axes3);
imshow(subtracted_img);
end