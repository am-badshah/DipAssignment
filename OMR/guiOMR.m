function varargout = guiOMR(varargin)
% GUIOMR MATLAB code for guiOMR.fig
%      GUIOMR, by itself, creates a new GUIOMR or raises the existing
%      singleton*.
%
%      H = GUIOMR returns the handle to a new GUIOMR or the handle to
%      the existing singleton*.
%
%      GUIOMR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIOMR.M with the given input arguments.
%
%      GUIOMR('Property','Value',...) creates a new GUIOMR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiOMR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiOMR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiOMR

% Last Modified by GUIDE v2.5 08-Feb-2013 00:21:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiOMR_OpeningFcn, ...
                   'gui_OutputFcn',  @guiOMR_OutputFcn, ...
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


% --- Executes just before guiOMR is made visible.
function guiOMR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiOMR (see VARARGIN)

% Choose default command line output for guiOMR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiOMR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiOMR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[file path]=uigetfile('*.bmp');
a=imread([path file]);
axes(handles.axes1);
imshow(a);
set(handles.edit1,'String',file);
set(handles.testType,'String','nill');
set(handles.rollNo,'String','nill');
set(handles.marks,'String','nill');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
global a;
a=get(handles.edit1,'String');
f=imread(a);
axes(handles.axes1);
imshow(f);

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
global a;
neg = ~a;
testTypeImg = imcrop(neg,[0,0,250,200]);
tt = calculateTestType(testTypeImg);

rollNoImg = imcrop(neg,[0,440,320,1100]);
rollNo = calculateRollNo(rollNoImg);

marksImg = imcrop(neg,[485,162,790,906]);
marks = calculateMarks(marksImg);

prcntg=marks/12*100;
if(prcntg > 40.0)
    remarks = 'Pass';
else
    remarks = 'Failed';
end
set(handles.testType,'String',tt);
set(handles.rollNo,'String',rollNo);
set(handles.marks,'String',marks);
set(handles.prcntg,'String',prcntg);
set(handles.remarks,'String',remarks);


function testType_Callback(hObject, eventdata, handles)
% hObject    handle to testType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testType as text
%        str2double(get(hObject,'String')) returns contents of testType as a double


% --- Executes during object creation, after setting all properties.
function testType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rollNo_Callback(hObject, eventdata, handles)
% hObject    handle to rollNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rollNo as text
%        str2double(get(hObject,'String')) returns contents of rollNo as a double


% --- Executes during object creation, after setting all properties.
function rollNo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rollNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function marks_Callback(hObject, eventdata, handles)
% hObject    handle to marks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of marks as text
%        str2double(get(hObject,'String')) returns contents of marks as a double


% --- Executes during object creation, after setting all properties.
function marks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to marks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function prcntg_Callback(hObject, eventdata, handles)
% hObject    handle to prcntg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prcntg as text
%        str2double(get(hObject,'String')) returns contents of prcntg as a double


% --- Executes during object creation, after setting all properties.
function prcntg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prcntg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function remarks_Callback(hObject, eventdata, handles)
% hObject    handle to remarks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of remarks as text
%        str2double(get(hObject,'String')) returns contents of remarks as a double


% --- Executes during object creation, after setting all properties.
function remarks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to remarks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openKey.
function openKey_Callback(hObject, eventdata, handles)
% hObject    handle to openKey (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('key.txt');

% --- Executes on button press in openPaint.
function openPaint_Callback(hObject, eventdata, handles)
% hObject    handle to openPaint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
system('mspaint & 1.bmp');

% --- Executes on button press in opencurretnsheet.
function opencurretnsheet_Callback(hObject, eventdata, handles)
% hObject    handle to opencurretnsheet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
open(a);

% --- Executes on button press in openNewSheet.
function openNewSheet_Callback(hObject, eventdata, handles)
% hObject    handle to openNewSheet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('new.bmp');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen(cd);
