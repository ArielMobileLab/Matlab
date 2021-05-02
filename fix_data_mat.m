clear;
clc;
load('Tobi.mat', 'Tobidata')
load('Amp.mat', 'Ampdata')
 %------------------------------------------------------
Participant_ID='test3 '; % Plugin the user ID.
 %------------------------------------------------------

Participant_ID=strtrim(Participant_ID);
h = Ampdata(16,end);
m = Ampdata(17,end);
if(m<10)
    m = "0" + m;
end
stemp = Ampdata(18,end);
s = round(stemp,0);
endtime ="(" + h + ";" + m + ";" + s + ")";

headersTobi=[
    "measurement time"
    "simulation time"
    "Pupil center RIGHT eye_X"
    "Pupil center RIGHT eye_Y"
    "Pupil center RIGHT eye_Z"
    "Pupil center LEFT eye_X"
    "Pupil center LEFT eye_Y"
    "Pupil center LEFT eye_Z"
    "Pupil diameter RIGHT"
    "Pupil diameter LEFT"
    "Gaze direction RIGHT eye_X"
    "Gaze direction RIGHT eye_Y"
    "Gaze direction RIGHT eye_Z"
    "Gaze direction LEFT eye_X"
    "Gaze direction LEFT eye_Y"
    "Gaze direction LEFT eye_Z"
    "Gaze position_X"
    "Gaze position_Y"
    "Gaze position 3D_X"
    "Gaze position 3D_Y"
    "Gaze position 3D_Z"
    "Gyroscope_X"
    "Gyroscope_Y"
    "Gyroscope_Z"
    "Accelerometer_X"
    "Accelerometer_Y"
    "Accelerometer_Z"
    "Time-H"
    "Time-M"
    "Time-S"
    ];
headersAmp=[
    "measurement time" %1
    "simulation time"  %2
    "GSR"              %3
    "ECG"              %4
    "EEG_1"            %5
    "EEG_2"            %6
    "EEG_3"            %7
    "EEG_4"            %8
    "EEG_5"            %9
    "EEG_6"            %10
    "EEG_7"            %11
    "EEG_8"            %12
    "EEG_9"            %13
    "EEG_10"           %14
    "EEG_11"           %15
    "EEG_12"           %16
    "Time-H"           %17
    "Time-M"           %18
    "Time-S"           %19
    ];


AMP=[headersAmp';Ampdata'];
TOBI=[headersTobi';Tobidata'];

fprintf('Please use one of the following names for saving the data:\n');
fprintf('--------------------------------------------------------\n');
fprintf('For Training:\n');
fprintf('                 %s_TRAINING \n',Participant_ID);
fprintf('--------------------------------------------------------\n');
fprintf('For ACC scenario:\n');
fprintf('                 %s_LOAD 1 TTC 1\n',Participant_ID);
fprintf('                 %s_LOAD 1 TTC 2\n',Participant_ID);
fprintf('                 %s_LOAD 2 TTC 1\n',Participant_ID);
fprintf('                 %s_LOAD 2 TTC 2\n',Participant_ID);
fprintf('                 %s_LOAD 3 TTC 1\n',Participant_ID);
fprintf('                 %s_LOAD 3 TTC 2\n',Participant_ID);
fprintf('--------------------------------------------------------\n');
fprintf('For Latency scenario:\n');
fprintf('                 %s_LATENCY 1\n',Participant_ID);
fprintf('                 %s_LATENCY 2\n',Participant_ID);
fprintf('                 %s_LATENCY 3\n',Participant_ID);
fprintf('--------------------------------------------------------\n');
fprintf('For Spacial scenario:\n');
fprintf('                 %s_ALLOCENTRIC\n',Participant_ID);
fprintf('                 %s EGOCENTRIC\n',Participant_ID);
fprintf('--------------------------------------------------------\n');

prompt = '<strong>Enter participant and scenario name (copy from above):</strong>';
foldername = sprintf('%s at %s',input(prompt,'s'),endtime);
foldername = strtrim(foldername);
 direc = [ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\' foldername '\'];
 mkdir([ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\' foldername '\']);
 
 filename1 = sprintf('Tobii Data of %s.xlsx',foldername);
 filename2 = sprintf('g.techAmp Data of %s.xlsx',foldername);
 
 fullFileName1 = fullfile(direc,filename1);
 fullFileName2 = fullfile(direc,filename2);

 xlswrite(fullFileName1,TOBI)
 xlswrite(fullFileName2,AMP)
 
 fprintf('<strong>DATA SAVED!</strong>\n');
 
 

