
clc;
close all;
clear all;


sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_5dB/Arousal_high/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_5dB/Arousal_high/'
filename =  'airport_5dB_Arousal_high.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);

sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_5dB/Arousal_low/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_5dB/Arousal_low/'
filename =  'airport_5dB_Arousal_low.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_10dB/Arousal_high/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_10dB/Arousal_high/'
filename =  'airport_10dB_Arousal_high.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_10dB/Arousal_low/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_10dB/Arousal_low/'
filename =  'airport_10dB_Arousal_low.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_15dB/Arousal_high/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_15dB/Arousal_high/'
filename =  'airport_15dB_Arousal_high.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_15dB/Arousal_low/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_15dB/Arousal_low/'
filename =  'airport_15dB_Arousal_low.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_20dB/Arousal_high/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_20dB/Arousal_high/'
filename =  'airport_20dB_Arousal_high.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP/noise_IEMOCAP/recordings_audio_airport_20dB/Arousal_low/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/recordings_audio_airport_20dB/Arousal_low/'
filename =  'airport_20dB_Arousal_low.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);

sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/datasets/IEMOCAP/class/Arousal_high/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/clean/Arousal_high/'
filename =  'clean_Arousal_high.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
sourcefolder = '//media/amrgaballah/Backup_Plus/exp_j2/datasets/IEMOCAP/class/Arousal_low/';
spectfolder = '//media/amrgaballah/Backup_Plus/exp_j2/noise/IEMOCAP_spectral/clean/Arousal_low/'
filename =  'clean_Arousal_low.mat'
 
extract_spectral_descriptors_Aco_mod(sourcefolder, spectfolder,filename);
