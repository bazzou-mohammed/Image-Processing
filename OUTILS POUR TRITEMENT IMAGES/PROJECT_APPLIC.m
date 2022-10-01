function varargout = PROJECT_APPLIC(varargin)
% PROJECT_APPLIC MATLAB code for PROJECT_APPLIC.fig
%      PROJECT_APPLIC, by itself, creates a new PROJECT_APPLIC or raises the existing
%      singleton*.
%
%      H = PROJECT_APPLIC returns the handle to a new PROJECT_APPLIC or the handle to
%      the existing singleton*.
%
%      PROJECT_APPLIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_APPLIC.M with the given input arguments.
%
%      PROJECT_APPLIC('Property','Value',...) creates a new PROJECT_APPLIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PROJECT_APPLIC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PROJECT_APPLIC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PROJECT_APPLIC

% Last Modified by GUIDE v2.5 20-Feb-2022 21:30:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PROJECT_APPLIC_OpeningFcn, ...
                   'gui_OutputFcn',  @PROJECT_APPLIC_OutputFcn, ...
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


% --- Executes just before PROJECT_APPLIC is made visible.
function PROJECT_APPLIC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PROJECT_APPLIC (see VARARGIN)

% Choose default command line output for PROJECT_APPLIC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PROJECT_APPLIC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PROJECT_APPLIC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
axes(handles.axes5)
hr = imhist(a(:,:,1)) ;
hv = imhist(a(:,:,2)) ;
hb = imhist(a(:,:,3)) ;
plot([hr hv hb]);
title('Histogramme')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
red=a(:,:,1);
axes(handles.axes5);
imagesc(red); colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=getappdata(0,'a');
i2=flipdim(i,2);
axes(handles.axes5);
imagesc(i2);colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
adjust=imadjust(a);
axes(handles.axes5);
imagesc(adjust);colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
rz=imresize(a,0.5);
axes(handles.axes5);
imshow(rz); colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
eq=histeq(a);
axes(handles.axes5);
imagesc(eq); colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
rotate=imrotate(a,90);
axes(handles.axes5);
imagesc(rotate);colormap gray; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
noise=imnoise(a,'salt & pepper');
a3=fspecial('average',[7,7]);
t_sp_a3=filter2(a3,noise);
axes(handles.axes5);
imagesc(t_sp_a3/255);colormap gray; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes5)
imhist(input); title('Histogramme')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
green=a(:,:,2);
axes(handles.axes5);
imagesc(green); colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
blue=a(:,:,3);
axes(handles.axes5);
imagesc(blue); colormap gray ; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
Negative=negative(a);
axes(handles.axes5)
imagesc(Negative); colormap gray; axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('.jpg');
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes3);
imagesc(a); colormap gray;axis off;
title('Original image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
setappdata(0,'a',a)
setappdata(0,'filename',a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_gray=rgb2gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes5);
imagesc(a_gray); colormap gray ;axis off; 
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,0.8);
axes(handles.axes5);
imagesc(a_bw);colormap gray ;axis off;
setappdata(0,'filename',a_bw); 
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imagesc(a); colormap gray ;axis off;
title('Modification image')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Terima kasih telah menggunakan Image Processing Tools by Dimas Reza')
pause(3)
close();
close();
