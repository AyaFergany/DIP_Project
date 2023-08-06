function varargout = ColorHistogramImg(varargin)
% COLORHISTOGRAMIMG MATLAB code for ColorHistogramImg.fig
%      COLORHISTOGRAMIMG, by itself, creates a new COLORHISTOGRAMIMG or raises the existing
%      singleton*.
%
%      H = COLORHISTOGRAMIMG returns the handle to a new COLORHISTOGRAMIMG or the handle to
%      the existing singleton*.
%
%      COLORHISTOGRAMIMG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORHISTOGRAMIMG.M with the given input arguments.
%
%      COLORHISTOGRAMIMG('Property','Value',...) creates a new COLORHISTOGRAMIMG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ColorHistogramImg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ColorHistogramImg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ColorHistogramImg

% Last Modified by GUIDE v2.5 26-Apr-2022 14:54:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ColorHistogramImg_OpeningFcn, ...
                   'gui_OutputFcn',  @ColorHistogramImg_OutputFcn, ...
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


% --- Executes just before ColorHistogramImg is made visible.
function ColorHistogramImg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ColorHistogramImg (see VARARGIN)

% Choose default command line output for ColorHistogramImg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ColorHistogramImg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ColorHistogramImg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global image
image=strcat(pathname,filename);
axes(handles.axes1);
imshow(image);
global original
original=imread(image);

[rows,columns,matrixno]=size(original);
% rgb matrixes
r = zeros(256, 1);
g = zeros(256, 1);
b = zeros(256, 1);
% main loop
for i = 1:size(original, 1)
   for j = 1:size(original,2)
       pix = original(i,j,1:3);
       r(pix(1)+1) = r(pix(1)+1) + 1;
       g(pix(2)+1) = g(pix(2)+1) + 1;
       b(pix(3)+1) = b(pix(3)+1) + 1;
   end
end


axes(handles.axes2);
bar(r, 'BarWidth', 1, 'FaceColor', 'red');
 axes(handles.axes3);
 bar(g, 'BarWidth', 1, 'FaceColor', 'green');
 axes(handles.axes4);
 bar(b, 'BarWidth', 1, 'FaceColor', 'blue');

 
