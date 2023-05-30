
files = 'D:\data\0815_liuxiaochuan\'; 
subdir=dir(fullfile(files));
fileNum=size(subdir,1);
for i = 3:fileNum
    index = subdir(i).name;
    file_name = dir(['D:\data\0815_liuxiaochuan\' index '\*.cdt']);
    path = [file_name.folder,'\',file_name.name];
    EEG = loadcurry(path, 'KeepTriggerChannel', 'True', 'CurryLocations', 'False');

   
   
    EEG.etc.eeglabvers = '2022.1'; % this tracks which version of EEGLAB is being used, you may ignore it
    EEG = eeg_checkset(EEG);
    EEG = eeg_checkset( EEG );
    EEG = pop_select( EEG, 'nochannel',{'CB1','CB2','TRIGGER'});
    EEG.setname='delete_channels';
    EEG = eeg_checkset( EEG );
    EEG = pop_reref( EEG, [33 43] );
    EEG.setname='re-reference';
    EEG = eeg_checkset( EEG );
    EEG = pop_eegfiltnew(EEG, 'locutoff',0.5,'plotfreqz',1);
    EEG.setname='filter_0.5';
    EEG = eeg_checkset( EEG );
    EEG = pop_eegfiltnew(EEG, 'hicutoff',50,'plotfreqz',1);
    EEG.setname='filter_50';
    EEG = eeg_checkset( EEG );
    EEG = eeg_checkset( EEG );
    EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');
    EEG = eeg_checkset( EEG );
    save_name = ['ICA_' index '.set']
    EEG = pop_saveset( EEG, 'filename',save_name,'filepath','D:\\lxc\\10_ICA\\');
    EEG = eeg_checkset( EEG );
end