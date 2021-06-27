clear all;

class = {'high', 'low'};
set = {'X_Centroid', 'X_Flatness','X_Slope', 'X_Entropy','X_Spread','X_Crest', 'X_Kurtosis', 'X_Roll','X_Skewness'}
for c = 1:length(class)
for s = 1:length(set)
    for i=1:16
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/clean/Arousal_' class{c} '/clean_Arousal_' class{c} '.mat']
    a71 = string(set(s))
    out1 = load(spectfolder, a71)
    a1 = out1.(set{s})(:,i)
    
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_0dB/Arousal_' class{c} '/Airport_odb_arousal_' class{c} '.mat']
    a72 = string(set(s))
    out2 = load(spectfolder, a72)
    a2 = out2.(set{s})(:,i)
    
    
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_5dB/Arousal_' class{c} '/airport_5dB_Arousal_' class{c} '.mat']
    a73 = string(set(s))
    out3 = load(spectfolder, a73)
    a3 = out3.(set{s})(:,i)
    
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_10dB/Arousal_' class{c} '/airport_10dB_Arousal_' class{c} '.mat']
    a74 = string(set(s))
    out4 = load(spectfolder, a74)
    a4 = out4.(set{s})(:,i)
    
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_15dB/Arousal_' class{c} '/airport_15dB_Arousal_' class{c} '.mat']
    a75 = string(set(s))
    out5 = load(spectfolder, a75)
    a5 = out5.(set{s})(:,i)
    
    spectfolder = ['//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_20dB/Arousal_' class{c} '/airport_20dB_Arousal_' class{c} '.mat']
    a76 = string(set(s))
    out6 = load(spectfolder, a76)
    a6 = out6.(set{s})(:,i)
    figure
    boxplot([a1,a2, a3,a4,a5,a6],'Notch','on','Labels',{'clean','0dB','5dB','10dB','15dB','20dB'},'Whisker',1)
    title(strcat('Impact of Acoustic centroid  ', string(i*500),'  Hz on amount of noise on', class{c} ,'_Arousal' ))
    xlabel('clean and SNR levels')
    ylabel(strcat('Acoustic_',string(set(s))))
    %title('Modulation specrogram fo')
    specFolder =fullfile('//media/amrgaballah/Backup_Plus/exp_j2/spec_desc_plots/Acoustic_descriptors', string(set(s)), '/',  class{c})
    if(isempty(dir(specFolder)))
        mkdir(specFolder);
    end
    name1 = strcat('X_', string(set(s)), '_', string(i*500));
    extentionnew='.jpg';
    out_name = append(name1, extentionnew)
    
    pathfile=fullfile(specFolder,out_name);
    saveas(gcf,pathfile)
    
    
    
    
    end
end
end
