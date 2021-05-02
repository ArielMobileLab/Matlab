clear;
clc;
load('Baseline.mat', 'Baselinedata')
 %------------------------------------------------------
Participant_ID='test'; % Plugin the user ID.
 %------------------------------------------------------

headersBaseline=[
    "measurement time" %1
    "GSR"              %2
    "ECG"              %3
    "EEG_1"            %4
    "EEG_2"            %5
    "EEG_3"            %6
    "EEG_4"            %7
    "EEG_5"            %8
    "EEG_6"            %9
    "EEG_7"            %10
    "EEG_8"            %11
    "EEG_9"            %12
    "EEG_10"           %13
    "EEG_11"           %14
    "EEG_12"           %15
    ];


BASE=[headersBaseline';Baselinedata'];

foldername = sprintf('Baseline Data of %s',Participant_ID);

 direc = [ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\' foldername '\'];
 mkdir([ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\']);
 mkdir([ 'C:\Users\LAB-ORENMUZ\Desktop\CogantaDATA\Participants_DATA\' Participant_ID '\' foldername '\']);
 
 filename3 = sprintf('%s.xlsx',foldername);
 
 fullFileName3 = fullfile(direc,filename3);

 xlswrite(fullFileName3,BASE)
 
 fprintf('<strong>DATA SAVED!</strong>\n');
 
 

