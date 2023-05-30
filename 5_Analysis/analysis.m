EEG = loadcurry('D:\data\0803_fujunwen\1_1\1700_test1-1.cdt', 'KeepTriggerChannel', 'True', 'CurryLocations', 'False');
EEG.etc.eeglabvers = '2022.1'; % this tracks which version of EEGLAB is being used, you may ignore it
EEG = eeg_checkset(EEG);
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_editeventvals(EEG,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',1,'delete',0);
EEG = eeg_checkset( EEG );
EEG = pop_importevent( EEG, 'event','D:\\fjw\\05_all_events_time\\1_1.txt','fields',{'latency','type'},'skipline',1,'timeunit',1);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  }, [-1  2], 'newname', 'filter_50 epochs', 'epochinfo', 'yes');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1000 0] ,[]);
EEG = eeg_checkset( EEG );
pop_ADJUST_interface( 1_1.set );
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_subcomp( EEG, [], 0);
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_mergeset( ALLEEG, [1   2   3   4   5   6   7   8   9  10  11  12  13  14  15], 1);
EEG = eeg_checkset( EEG );
EEG = pop_selectevent( EEG, 'type',[7:10] ,'deleteevents','off','deleteepochs','on','invertepochs','off');
EEG = eeg_checkset( EEG );
figure; pop_timtopo(EEG, [-1000  1999], [NaN], 'ERP data and scalp maps of Merged datasets');
EEG = eeg_checkset( EEG );
EEG = eeg_checkset( EEG );
EEG = pop_mergeset( ALLEEG, [1   2   3   4   5   6   7   8   9  10], 1);
EEG.setname='cut in';
EEG = eeg_checkset( EEG );
EEG = pop_dipfit_settings( EEG, 'hdmfile','D:\\eeglab\\plugins\\dipfit\\standard_BEM\\standard_vol.mat','coordformat','MNI','mrifile','D:\\yanyi\\2022\\ruanjian\\eeglab\\plugins\\dipfit\\standard_BEM\\standard_mri.mat','chanfile','D:\\yanyi\\2022\\ruanjian\\eeglab\\plugins\\dipfit\\standard_BEM\\elec\\standard_1005.elc','coord_transform',[0.71809 -16.0107 2.2157 0.086177 0.0021195 -1.5726 1.1658 1.0625 1.1532] ,'chansel',[1:60] );
EEG = pop_dipfit_gridsearch(EEG, [1:50] ,[-85     -77.6087     -70.2174     -62.8261     -55.4348     -48.0435     -40.6522     -33.2609     -25.8696     -18.4783      -11.087     -3.69565      3.69565       11.087      18.4783      25.8696      33.2609      40.6522      48.0435      55.4348      62.8261      70.2174      77.6087           85] ,[-85     -77.6087     -70.2174     -62.8261     -55.4348     -48.0435     -40.6522     -33.2609     -25.8696     -18.4783      -11.087     -3.69565      3.69565       11.087      18.4783      25.8696      33.2609      40.6522      48.0435      55.4348      62.8261      70.2174      77.6087           85] ,[0      7.72727      15.4545      23.1818      30.9091      38.6364      46.3636      54.0909      61.8182      69.5455      77.2727           85] ,0.4);
EEG = pop_multifit(EEG, [1:25] ,'threshold',100,'plotopt',{'normlen','on'});
pop_dipplot( EEG, [1:25] ,'mri','D:\\eeglab\\plugins\\dipfit\\standard_BEM\\standard_mri.mat','normlen','on');
% ERP图
figure; pop_plottopo(EEG, [1:60] , 'cut in', 0, 'ydir',1);
% Time/frequency analysis
figure; pop_newtimef( EEG, 1, 1, [-1000  1999], [3         0.8] , 'topovec', 1, 'elocs', EEG.chanlocs, 'chaninfo', EEG.chaninfo, 'caption', 'FP1', 'baseline',[0], 'plotphase', 'off', 'padratio', 1, 'winsize', 1000);'
% ERP map series
pop_topoplot(EEG, 1, [-1000:500:1500 1999] ,'cut in',[3 3] ,0,'electrodes','on');'


