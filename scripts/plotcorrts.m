Info            = [];
Info.wdir       = '/scratch/o.deng/final/fc/CONN_preprocessing/VocalNonvocal/results/preprocessing/';
Info.session    = 0;        % 0 for all sessions, 1=session1, 2=session2, etc...
Info.nsub       = 58;       % Total number of subjects

% ROI is the main structure containing ROI names, data
ROI             = [];
ROI.ROI1_data   = [];
ROI.ROI2_data   = [];
ROI.ROI3_data   = [];
ROI.ROI4_data   = [];
ROI.ROI5_data   = [];
ROI.ROI6_data   = [];
ROI.ROI7_data   = [];

% Select pair of ROIs
ROI.ROI1_name   = 'atlas.aMTG r (Middle Temporal Gyrus, anterior division Right)';
ROI.ROI2_name   = 'atlas.aMTG l (Middle Temporal Gyrus, anterior division Left)';
ROI.ROI3_name   = 'atlas.pMTG r (Middle Temporal Gyrus, posterior division Right)';
ROI.ROI4_name   = 'atlas.pMTG l (Middle Temporal Gyrus, posterior division Left)';
ROI.ROI5_name   = 'atlas.aSTG l (Superior Temporal Gyrus, anterior division Left)';
ROI.ROI6_name   = 'atlas.aSTG r (Superior Temporal Gyrus, anterior division Right)';
ROI.ROI7_name   = 'atlas.HG l (Heschl''s Gyrus Left)';

for i=1:Info.nsub

    % Loading .MAT file
    matfile = [ 'ROI_Subject0', num2str(i, '%02i') ,'_Condition000.mat' ];

    %fprintf('\nLoading:\t %s', matfile);

    load([Info.wdir matfile]);

    ROI.names   = names;
    ROI.dsess   = data_sessions;

    % Find index of selected ROIs
    ROI.ROI1_idx    = find(strcmp(ROI.ROI1_name, names));
    ROI.ROI2_idx    = find(strcmp(ROI.ROI2_name, names));
    ROI.ROI3_idx    = find(strcmp(ROI.ROI3_name, names));
    ROI.ROI4_idx    = find(strcmp(ROI.ROI4_name, names));
    ROI.ROI5_idx    = find(strcmp(ROI.ROI5_name, names));
    ROI.ROI6_idx    = find(strcmp(ROI.ROI6_name, names));
    ROI.ROI7_idx    = find(strcmp(ROI.ROI7_name, names));

    % Extract BOLD data
    ROI.ROI1_data   = [ ROI.ROI1_data , cell2mat(data(ROI.ROI1_idx)) ];
    ROI.ROI2_data   = [ ROI.ROI2_data , cell2mat(data(ROI.ROI2_idx)) ];
    ROI.ROI3_data   = [ ROI.ROI3_data , cell2mat(data(ROI.ROI3_idx)) ];
    ROI.ROI4_data   = [ ROI.ROI4_data , cell2mat(data(ROI.ROI4_idx)) ];
    ROI.ROI5_data   = [ ROI.ROI5_data , cell2mat(data(ROI.ROI5_idx)) ];
    ROI.ROI6_data   = [ ROI.ROI6_data , cell2mat(data(ROI.ROI6_idx)) ];
    ROI.ROI7_data   = [ ROI.ROI7_data , cell2mat(data(ROI.ROI7_idx)) ];


    % Select sessions
    if Info.session == 0 ;
        ROI.cond = find(ROI.dsess);
    else
        ROI.cond = find(ROI.dsess == Info.session);
    end
end