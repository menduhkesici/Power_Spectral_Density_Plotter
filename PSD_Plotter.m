function varargout = PSD_Plotter(varargin)
% PSD_PLOTTER MATLAB code for PSD_Plotter.fig
%      PSD_PLOTTER, by itself, creates a new PSD_PLOTTER or raises the existing
%      singleton*.
%
%      H = PSD_PLOTTER returns the handle to a new PSD_PLOTTER or the handle to
%      the existing singleton*.
%
%      PSD_PLOTTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSD_PLOTTER.M with the given input arguments.
%
%      PSD_PLOTTER('Property','Value',...) creates a new PSD_PLOTTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PSD_Plotter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PSD_Plotter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PSD_Plotter

% Last Modified by GUIDE v2.5 06-Jul-2019 00:04:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PSD_Plotter_OpeningFcn, ...
                   'gui_OutputFcn',  @PSD_Plotter_OutputFcn, ...
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


% --- Executes just before PSD_Plotter is made visible.
function PSD_Plotter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PSD_Plotter (see VARARGIN)

% Choose default command line output for PSD_Plotter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
title('\fontsize{12}Load data to plot the PSD');
xlabel('Frequency (Hz)');
grid on

% UIWAIT makes PSD_Plotter wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = PSD_Plotter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Load.
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.mat');
handles.FullName = strcat(PathName, FileName);
Contents = whos('-file', handles.FullName);
N_c = length(Contents);
Names = zeros(N_c, 50);
for k = 1:N_c
    Names(k,1:50) = [Contents(k).name, zeros(1,50-length(Contents(k).name))];
end
handles.names = char(Names);
handles.range = 0;
guidata(hObject, handles)
set(handles.popupmenu1, 'string', handles.names);


function Freq_Range_Callback(hObject, eventdata, handles)
% hObject    handle to Freq_Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Freq_Range as text
%        str2double(get(hObject,'String')) returns contents of Freq_Range as a double

% --- Executes during object creation, after setting all properties.
function Freq_Range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Freq_Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function M_value_Callback(hObject, eventdata, handles)
% hObject    handle to M_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of M_value as text
%        str2double(get(hObject,'String')) returns contents of M_value as a double

% --- Executes during object creation, after setting all properties.
function M_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to M_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function K_value_Callback(hObject, eventdata, handles)
% hObject    handle to K_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K_value as text
%        str2double(get(hObject,'String')) returns contents of K_value as a double

% --- Executes during object creation, after setting all properties.
function K_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Periodogram.
function Periodogram_Callback(hObject, eventdata, handles)
% hObject    handle to Periodogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
if (freq_range > 0)
    result = periodogram(data);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}Periodogram of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

% --- Executes on button press in Correlogram.
function Correlogram_Callback(hObject, eventdata, handles)
% hObject    handle to Correlogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
if (freq_range > 0)
    result = correlogram(data);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}Correlogram of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

% --- Executes on button press in Blackman.
function Blackman_Callback(hObject, eventdata, handles)
% hObject    handle to Blackman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
M = str2double(get(handles.M_value,'String'));
if (freq_range > 0 && M > 0)
    result = blackman(data, M);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}PSD by Blackman-Tukey Method of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

% --- Executes on button press in Bartlett.
function Bartlett_Callback(hObject, eventdata, handles)
% hObject    handle to Bartlett (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
M = str2double(get(handles.M_value,'String'));
if (freq_range > 0 && M > 0)
    result = bartlett(data, M);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}PSD by Bartlett Method of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

% --- Executes on button press in Welch.
function Welch_Callback(hObject, eventdata, handles)
% hObject    handle to Welch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
M = str2double(get(handles.M_value,'String'));
K = str2double(get(handles.K_value,'String'));
if (freq_range > 0 && M > 0 && K > 0)
    result = welch(data, M, K);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}PSD by Welch Method of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

% --- Executes on button press in Daniell.
function Daniell_Callback(hObject, eventdata, handles)
% hObject    handle to Daniell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[data, data_name] = load_data(hObject, eventdata, handles);
set(handles.figure1, 'pointer', 'watch')
drawnow;
data = data - mean(data);
freq_range = str2double(get(handles.Freq_Range,'String'));
M = str2double(get(handles.M_value,'String'));
if (freq_range > 0 && M > 0)
    result = daniell(data, M);
    plot_data(result, freq_range, hObject, eventdata, handles)
    title(['\fontsize{12}PSD by Daniell Method of ', data_name]);
end
set(handles.figure1, 'pointer', 'arrow')

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function datapnl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datapnl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = strcat('Frequency Range is the sampling rate of the data.\n\n', ...
    'M is window length for Blackman-Tukey Method and Daniell Method.\n', ...
    'M is data length for Welch Method and Bartlett Method.\n', ...
    'M is optimally chosen as 1.5 times frequency.\n\n', ...
    'K is the overlapping data length for Welch Method.\n', ...
    'K is optimally chosen as M / 2.\n');
h = msgbox(sprintf(str),'Help');
set(h, 'position', [700 250 350 160]);
ah = get(h, 'CurrentAxes');
ch = get(ah, 'Children');
set(ch, 'FontSize', 10);

% --- Executes on button press in Data_Range.
function Data_Range_Callback(hObject, eventdata, handles)
% hObject    handle to Data_Range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load(handles.FullName)
data_num = get(handles.popupmenu1, 'Value');
data_name = strtrim(handles.names(data_num,:));
data = eval(data_name);
figure;
plot(data);
[x,y] = ginput(2);
handles.range1 = ceil(x(1));
handles.range2 = floor(x(2));
handles.range = 1;
close
guidata(hObject,handles)

function [y] = periodogram(x)
N = length(x);
x_fft = fftshift(fft(x));
y = abs(x_fft).^2 / N;

function [y] = correlogram(x)
x = x(1:1000);
N = length(x);
y = zeros(1, N);
f = -1/2:(1/(N-1)):1/2;
for w = 1:N
    total = 0;
    r_k = 0;
    for t = 1:N
        r_k = r_k + x(t) * conj(x(t)) / N;
    end
    total = total + r_k;
    for k = 1:(N-1)
        r_k = 0;
        for t = (k + 1):N
            r_k = r_k + x(t) * conj(x(t - k)) / N;
        end
        total = total + r_k * exp(-1i * 2 * pi * f(w) * k) + conj(r_k) * exp(1i * 2 * pi * f(w) * k);
    end
    y(w) = total;
end

function [y] = blackman(x, M)
x = x(1:1000);
N = length(x);
y = zeros(1, N);
f = -1/2:(1/(N-1)):1/2;
for w = 1:N
    total = 0;
    r_k = 0;
    for t = 1:N
        r_k = r_k + x(t) * conj(x(t)) / N;
    end
    total = total + r_k;
    for k = 1:(M-1)
        r_k = 0;
        for t = (k + 1):N
            r_k = r_k + x(t) * conj(x(t - k)) / N;
        end
        total = total + (1 - abs(k / M)) * (r_k * exp(-1i * 2 * pi * f(w) * k) + conj(r_k) * exp(1i * 2 * pi * f(w) * k));
    end
    y(w) = total;
end

function [y] = bartlett(x, M)
N = length(x);
N = floor(N / M) * M;
x = x(1:N);
L = N / M;
total = 0;
for k = 1:M:N
    x_fft = fftshift(fft(x(k:(k + M - 1))));
    x_periodogram = abs(x_fft).^2 / M;
    total = total + x_periodogram / L;
end
y = total;

function [y] = welch(x, M, K)
N = length(x);
for k = 1:M
    v_t(k) = 1;
end
P = sum(v_t.^2) / M;
N = floor((N - M) / K) * K + K;
total = 0;
S = 0;
for k = 1:K:N
    x_fft = fftshift(fft(x(k:(k + M - 1) .* v_t)));
    x_periodogram = abs(x_fft).^2 / (M * P);
    total = total + x_periodogram;
    S = S + 1;
end
y = total / S;

function [y] = daniell(x, M)
x = x(1:1000);
N = length(x);
y = zeros(1, N);
f = -1/2:(1/(N-1)):1/2;
for w = 1:N
    total = 0;
    r_k = 0;
    for t = 1:N
        r_k = r_k + x(t) * conj(x(t)) / N;
    end
    total = total + r_k;
    for k = 1:(M-1)
        r_k = 0;
        for t = (k + 1):N
            r_k = r_k + x(t) * conj(x(t - k)) / N;
        end
        total = total + (sin(k * pi / M) * M / (k * pi))*((1 - abs(k / M)) * (r_k * exp(-1i * 2 * pi * f(w) * k) + conj(r_k) * exp(1i * 2 * pi * f(w) * k)));
    end
    y(w) = abs(total);
end

function [data, data_name] = load_data(hObject, eventdata, handles)
load(handles.FullName)
data_num = get(handles.popupmenu1, 'Value');
data_name = strtrim(handles.names(data_num,:));
data = eval(data_name);
if handles.range == 1
    data = data(handles.range1:handles.range2);
end
data_type = get(handles.datapnl, 'SelectedObject');
data_type = get(data_type, 'String');
if data_type(1:4) == 'Gyro'
    data = data * 3600;
end
if data_type(1:4) == 'Acce'
    data = data / 9.8;
end

function [] = plot_data(data, freq_range, hObject, eventdata, handles)
f = -freq_range/2:(freq_range/(length(data)-1)):freq_range/2;
data_type = get(handles.datapnl, 'SelectedObject');
data_type = get(data_type, 'String');
if data_type(1:4) == 'Gyro'
    data = sqrt(data / freq_range);
end
if data_type(1:4) == 'Acce'
    data = data / freq_range;
end
loglog(f(floor(end/2)+1:end), data(floor(end/2)+1:end))
xlabel('Frequency (Hz)');
if data_type(1:4) == 'Gyro'
    ylabel(['Power/Frequency (' char(176) '/h/\surdHz)']);
end
if data_type(1:4) == 'Acce'
    ylabel('Power/Frequency (g^2/Hz)');
end
grid on
