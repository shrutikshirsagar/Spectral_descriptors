function extract_spectral_descriptors_Aco_mod(sourcefolder,spectfolder,filename)
if(isempty(dir(spectfolder)))
mkdir(spectfolder);
end

myFiles = dir(fullfile(sourcefolder,'*.wav'));

X_Centroid=[];Y_Centroid=[];
X_Spread=[];Y_Spread=[];
X_Skewness=[];Y_Skewness=[];
X_Kurtosis=[];Y_Kurtosis=[];
X_Entropy=[];Y_Entropy=[];
X_Flatness=[];Y_Flatness=[];
X_Crest=[];Y_Crest=[];
X_Slope=[];Y_Slope=[];
X_Decrease=[];Y_Decrease=[];
X_Roll=[];Y_Roll=[];

for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(sourcefolder, baseFileName);
    [data,fs]=audioread(fullFileName);
   

    try
        [M,F1,T1]= modspecgram(data,fs, 1024,0.75*1024, 1024, 64,512);
    catch
        continue
    end
    P = (abs(M)).^2;
    P_new = [];
    for i=1:size(P,2) %%%% colums (33 17) so consider 33 as first column
        col = P(:,i); %%%% consider each column iteratively
        col(end,:) = []; %%%% subtract one final column for reshaping
        
        
        
        y = reshape(col, [32 16]);  %%%% I want have a group of 4 bins across column
        out = sum(y,1)    ;       %%%% sum across column 1*8 dimension final
        outa = out.' ;             %%%% transpose to put in new matrix
        P_new=[P_new ,outa]  ;     %%%%% stack it horizontally
        
        
    end
    P_new1 = [];               %%%% assign final matrix
    for i1=1:size(P_new,1)    %%%% as we have 8*17 from earlier matrix
        col1 = P_new(i1,:);    %%%% consider each row iteratevely
        col1(:,end) = [];      %%%%% subract  one final  raw for reshaping
        
        
        
        y1 = reshape(col1, [16 16]) ;   %%%% I want to group of 4 bins across rows
        out1 = sum(y1,1);             %%% reshape it and take sum
        
        P_new1=[P_new1; out1] ;        %%%%% stack it vertically and geta final matrix
        
        
    end
    F = linspace(0,8000,16);
    T = linspace(0,32,16);
    B  = (P_new1)/sum(sum(P_new1));
    
    %%%%%Spectral Centroid
    M1=[];
    for i=1:size(B,2)  %%%% across acoustic
        
        a=sum(F.*B(:,i)');
        b=sum(B(:,i));
        s_c = a./b;
        M1=[M1,s_c];
    end
    X_Centroid=[X_Centroid;M1];
    M11=[];
    for i1=1:size(B,1)        %%%% across modulation
        a1=sum(T'.*B(i1,:)');
        b1=sum(B(i1,:));
        M11=[M11,a1./b1];
    end
    Y_Centroid=[Y_Centroid;M11];
    
    %%%%%Spectral Spread
    M2=[];
    for i=1:size(B,2)
        a=sum((((F-M1(i)).^2).*B(:,i)'));
        b=sum(B(:,i));
        M2=[M2,sqrt(a./b)];
    end
    X_Spread=[X_Spread;M2];
    M22=[];
    for i=1:size(B,1)
        a=sum((((T-M11(i)).^2)'.*B(i,:)'));
        b=sum(B(i,:));
        M22=[M22,sqrt(a./b)];
    end
    Y_Spread=[Y_Spread;M22];
    
    %%%%%Spectral Skewness
    M3=[];
    for i=1:size(B,2)
        a=sum((((F-M1(i)).^3).*B(:,i)'));
        b=(M2(i).^3).*sum(B(:,i));
        M3=[M3,a./b];
    end
    X_Skewness=[X_Skewness;M3];
    M33=[];
    for i=1:size(B,1)
        a=sum((((T-M11(i)).^3)'.*B(i,:)'));
        b=(M22(i).^3).*sum(B(i,:));
        M33=[M33,a./b];
    end
    Y_Skewness=[Y_Skewness;M33];
    
    %%%%%Spectral kurtosis
    M4=[];
    for i=1:size(B,2)
        a=sum((((F-M1(i)).^4).*B(:,i)'));
        b=(M2(i).^4).*sum(B(:,i));
        M4=[M4,a./b];
    end
    X_Kurtosis=[X_Kurtosis;M4];
    M44=[];
    for i=1:size(B,1)
        a=sum((((T-M11(i)).^4)'.*B(i,:)'));
        b=(M22(i).^4).*sum(B(i,:));
        M44=[M44,a./b];
    end
    Y_Kurtosis=[Y_Kurtosis;M44];
    
    %%%%%Spectral Entropy
    M5=[];
    for i=1:size(B,2)
        a=-sum(log10(B(:,i)).*B(:,i))./log10(16);
        %b=((M2(:,floor(i/4)+1)).^4).*sum(BB(:,i:i+3),2);
        M5=[M5,a];
    end
    X_Entropy=[X_Entropy;M5];
    M55=[];
    for i=1:size(B,1)
        a=-sum(log10(B(i,:)).*B(i,:))./log10(16);
        %b=((M2(:,floor(i/4)+1)).^4).*sum(BB(:,i:i+3),2);
        M55=[M55,a];
    end
    Y_Entropy=[Y_Entropy;M55];
    
    %%%%%Spectral Flatness
    M6=[];
    for i=1:size(B,2)
        a=prod(B(:,i)).^(1/16);
        b=(1/16)*sum(B(:,i));
        M6=[M6,a./b];
    end
    X_Flatness=[X_Flatness;M6];
    M66=[];
    for i=1:size(B,1)
        a=prod(B(i,:)).^(1/16);
        b=(1/16)*sum(B(i,:));
        M66=[M66,a./b];
    end
    Y_Flatness=[Y_Flatness;M66];
    
    %%%%%Spectral Crest
    M7=[];
    for i=1:size(B,2)
        a=max(B(:,i))/(sum(B(:,i))/16);
        M7=[M7,a];
    end
    X_Crest=[X_Crest;M7];
    M77=[];
    for i=1:size(B,1)
        a=max(B(i,:))/(sum(B(i,:))/16);
        M77=[M77,a];
    end
    Y_Crest=[Y_Crest;M77];
    
    %%%%%Spectral Slope
    M8=[];
    for i=1:size(B,2)
        a=sum((F-mean(F)).*(B(:,i)'-mean(B(:,i)')));
        b=sum((F-mean(F)).^2);
        M8=[M8,a/b];
    end
    X_Slope=[X_Slope;M8];
    M88=[];
    for i=1:size(B,1)
        a=sum((T-mean(T))'.*(B(i,:)'-mean(B(i,:)')));
        b=sum((T-mean(T)).^2);
        M88=[M88,a/b];
    end
    Y_Slope=[Y_Slope;M88];
    
    %%%%%Spectral Decrease
    M9=[];
    for i=2:size(B,2)
        a=((2:size(B(:,i),1))-1).^-1;
        b=sum((B(2:end,i)-B(1,i)).*a');
        c=sum(B(2:end,i));
        M9=[M9,b/c];
    end
    X_Decrease=[X_Decrease;M9];
    M99=[];
    for i=2:size(B,1)
        a=((2:size(B(i,:),2))-1).^-1;
        b=sum((B(i,2:end)-B(i,1)).*a);
        c=sum(B(i,2:end));
        M99=[M99,b/c];
    end
    Y_Decrease=[Y_Decrease;M99];
    
    %%%%%Spectral Roll off
    M10=[];
    for i=1:size(B,2)
        Roll_Th=0.85*sum(B(:,i));
        for j=1:size(B,1)
            if sum(B(1:j,i)) >= Roll_Th
                M10=[M10,F(j)];
                break;
            else
                continue;
            end
        end
    end
    X_Roll=[X_Roll;M10];
    M100=[];
    for i=1:size(B,1)
        Roll_Th=0.85*sum(B(i,:));
        for j=1:size(B,2)
            if sum(B(i,1:j)) >= Roll_Th
                M100=[M100,T(j)];
                break;
            else
                continue;
            end
        end
    end
    Y_Roll=[Y_Roll;M100];
outpath = fullfile(spectfolder ,filename)   
save(outpath, 'X_Centroid', 'Y_Centroid', 'X_Spread', 'Y_Spread', 'X_Skewness','Y_Skewness', 'X_Kurtosis', 'Y_Kurtosis', 'X_Entropy', 'Y_Entropy', 'X_Flatness', 'Y_Flatness', 'X_Crest', 'Y_Crest', 'X_Slope', 'Y_Slope', 'X_Decrease', 'Y_Decrease', 'X_Roll', 'Y_Roll')  
end
