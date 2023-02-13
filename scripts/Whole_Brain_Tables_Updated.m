%Older Adults pre

%defining and loading rois
cd '/scratch/kathios.n/odessa_ROIs'
roi_list = dir('*.mat');

%define subjects
cd '/Volumes/Promise_Pegasus/mci_spm_musbid/pre';
sublistYA = struct('path', {'/scratch/o.deng/first_level_VocalNonvocal/FKEE','/scratch/o.deng/first_level_VocalNonvocal/JSCH', '/scratch/o.deng/first_level_VocalNonvocal/LGEN', '/scratch/o.deng/first_level_VocalNonvocal/GHER', '/scratch/o.deng/first_level_VocalNonvocal/LDIR', '/scratch/o.deng/first_level_VocalNonvocal/JPRE', '/scratch/o.deng/first_level_VocalNonvocal/CWEI', '/scratch/o.deng/first_level_VocalNonvocal/MBLO', '/scratch/o.deng/first_level_VocalNonvocal/EROS', '/scratch/o.deng/first_level_VocalNonvocal/TCIE', '/scratch/o.deng/first_level_VocalNonvocal/GCAS', '/scratch/o.deng/first_level_VocalNonvocal/DFAI', '/scratch/o.deng/first_level_VocalNonvocal/JKAY', '/scratch/o.deng/first_level_VocalNonvocal/DCAT', '/scratch/o.deng/first_level_VocalNonvocal/SCAE', '/scratch/o.deng/first_level_VocalNonvocal/EHER', '/scratch/o.deng/first_level_VocalNonvocal/LJAC', '/scratch/o.deng/first_level_VocalNonvocal/ASHA', '/scratch/o.deng/first_level_VocalNonvocal/JSCH', '/scratch/o.deng/first_level_VocalNonvocal/LGEN', '/scratch/o.deng/first_level_VocalNonvocal/GHER', '/scratch/o.deng/first_level_VocalNonvocal/LDIR', '/scratch/o.deng/first_level_VocalNonvocal/JPRE', '/scratch/o.deng/first_level_VocalNonvocal/CWEI', '/scratch/o.deng/first_level_VocalNonvocal/MBLO', '/scratch/o.deng/first_level_VocalNonvocal/EROS', '/scratch/o.deng/first_level_VocalNonvocal/TCIE', '/scratch/o.deng/first_level_VocalNonvocal/GCAS', '/scratch/o.deng/first_level_VocalNonvocal/DFAI', '/scratch/o.deng/first_level_VocalNonvocal/JKAY', '/scratch/o.deng/first_level_VocalNonvocal/DCAT', '/scratch/o.deng/first_level_VocalNonvocal/SCAE', '/scratch/o.deng/first_level_VocalNonvocal/EHER', '/scratch/o.deng/first_level_VocalNonvocal/LJAC', '/scratch/o.deng/first_level_VocalNonvocal/ASHA', '/scratch/o.deng/first_level_VocalNonvocal/GSHA', '/scratch/o.deng/first_level_VocalNonvocal/ELAR', '/scratch/o.deng/first_level_VocalNonvocal/BFOR', '/scratch/o.deng/first_level_VocalNonvocal/AZHA', '/scratch/o.deng/first_level_VocalNonvocal/SLEE', '/scratch/o.deng/first_level_VocalNonvocal/LGAR', '/scratch/o.deng/first_level_VocalNonvocal/CZAL', '/scratch/o.deng/first_level_VocalNonvocal/APOP', '/scratch/o.deng/first_level_VocalNonvocal/LWIE', '/scratch/o.deng/first_level_VocalNonvocal/GWAI', '/scratch/o.deng/first_level_VocalNonvocal/SCAM', '/scratch/o.deng/first_level_VocalNonvocal/KCHU', '/scratch/o.deng/first_level_VocalNonvocal/KPLU', '/scratch/o.deng/first_level_VocalNonvocal/KWAL', '/scratch/o.deng/first_level_VocalNonvocal/ZCAR', '/scratch/o.deng/first_level_VocalNonvocal/JLAW', '/scratch/o.deng/first_level_VocalNonvocal/ASUR', '/scratch/o.deng/first_level_VocalNonvocal/IZIK', '/scratch/o.deng/first_level_VocalNonvocal/SAPE', '/scratch/o.deng/first_level_VocalNonvocal/TBOY', '/scratch/o.deng/first_level_VocalNonvocal/MCHI', '/scratch/o.deng/first_level_VocalNonvocal/JCLA', '/scratch/o.deng/first_level_VocalNonvocal/SSOH', '/scratch/o.deng/first_level_VocalNonvocal/AWIL', '/scratch/o.deng/first_level_VocalNonvocal/STHO', '/scratch/o.deng/first_level_VocalNonvocal/MBIC', '/scratch/o.deng/first_level_VocalNonvocal/CKOB', '/scratch/o.deng/first_level_VocalNonvocal/CNOR', '/scratch/o.deng/first_level_VocalNonvocal/ALIU', '/scratch/o.deng/first_level_VocalNonvocal/OKHE', '/scratch/o.deng/first_level_VocalNonvocal/OEGB', '/scratch/o.deng/first_level_VocalNonvocal/EMCG', '/scratch/o.deng/first_level_VocalNonvocal/YDIA', '/scratch/o.deng/first_level_VocalNonvocal/MCHO', '/scratch/o.deng/first_level_VocalNonvocal/ETIN', '/scratch/o.deng/first_level_VocalNonvocal/SSHA'});

%define empty array
vocalnonvocalROIs = cell(1, numel(sublistYA));

marsbar('on')
%loop through all participants and ROIs
for subs = 1:numel(sublistYA)
% Make marsbar design object
D = mardo(strcat(sublistYA(subs).path, '/', 'SPM.mat'));
% Set fmristat AR modelling
D = autocorr(D, 'fmristat', 2);

    for rois = 1:numel(roi_list)
        % Make marsbar ROI object
        R(rois, subs) = maroi(strcat(roi_list(rois).folder,'/',roi_list(rois).name));
        % Fetch data into marsbar data object
        Y  = get_marsy(R(rois), D, 'mean');
        %Summarize data
        vocalnonvocalROIs{subs}(:, rois) = summary_data(marsy(Y));
    end
end
