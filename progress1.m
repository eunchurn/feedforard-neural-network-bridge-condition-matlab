clear all; clc; close all;

% 1:지간길이 2: DB하중 3: ADTT 4: 표면염화물량 5: 염분량 6: 평균습도 7: 적설량 8: 공용기간 9: 상태 10: 교량번호 11: 경간장번호

[num,txt,raw]=xlsread('db-newmethod.xls','DB_newmethod','B2:L6410');
%%

bn=1:33787;
timevec=[];
statevec=[];
loadvec=[];
adttvec=[];
surfacevec=[];
saltvec=[];
humidvec=[];
snowvec=[];

for kk=1:33787
    data = num(num(:,10)==kk,:);
    if length(data)
        times=unique(data(:,8));
        spans=unique(data(:,11));
        for ii=1:length(times)
            if std(data(data(:,8)==times(ii),9))
                states(ii)=mean(data(data(:,8)==times(ii),9));
                loads(ii)=mean(data(data(:,8)==times(ii),2));
                adtts(ii)=mean(data(data(:,8)==times(ii),3));
                surface(ii)=mean(data(data(:,8)==times(ii),4));
                salts(ii)=mean(data(data(:,8)==times(ii),5));
                humids(ii)=mean(data(data(:,8)==times(ii),6));
                snows(ii)=mean(data(data(:,8)==times(ii),7));
                timess(ii)=times(ii);
            end
        end
        timevec=[timevec,timess];
        statevec=[statevec,states];
        loadvec=[loadvec,loads];
        adttvec=[adttvec,adtts];
        surfacevec=[surfacevec,surface];
        saltvec=[saltvec,salts];
        humidvec=[humidvec,humids];
        snowvec=[snowvec,snows];
    end
    states=[];timess=[];loads=[];adtts=[];surface=[];salts=[];humids=[];snows=[];
end
nzstatevec=statevec(statevec~=0);
nztimevec=timevec(statevec~=0);
nzloadsvec=loadvec(statevec~=0);
nzadttvec=adttvec(statevec~=0);
nzsurfacevec=surfacevec(statevec~=0);
nzsaltvec=saltvec(statevec~=0);
nzhumidvec=humidvec(statevec~=0);
nzsnowvec=snowvec(statevec~=0);
%%
input=[nztimevec;nzloadsvec;nzadttvec;nzsurfacevec;nzsaltvec;nzhumidvec;nzsnowvec];
output=nzstatevec;


%%
ii=0;
for kk=1:40
    range=and(kk-0.5<=timevec,timevec<kk+0.5);
    if sum(range)
        [f(:,kk),xi(:,kk)] = ksdensity(statevec(range));
        if max(f(:,kk))<50
            ii=ii+1;
            tt(ii)=kk;
            xxi(:,ii)=xi(:,kk);
            ff(:,ii)=f(:,kk);
            mm(ii)=mean(statevec(range));
            st(ii)=std(statevec(range));
        end
    end
end

close all
figure,plot(round(nztimevec),nzstatevec,'.k')
xlabel('Quantized Time (year)')
ylabel('Non zero std. state (score)')

figure,histogram(nzstatevec,'Normalization','pdf')

figure,plot(tt,mm,':.r')
xlabel('Time (year)')
ylabel('Mean of state (score)')

figure,plot(tt,st,':.r')
xlabel('Time (year)')
ylabel('Standard deviation of state (score)')

figure,surf(tt,xxi(:,1),ff)
xlabel('Time (year)')
ylabel('State (score)')
zlabel('Estimated probability density')

[Mfitresult, Mgof] = fitsMeans(tt, mm, st);


%%

year=60;
for kk=1:year
    y(kk)=annfn2([kk;input(2:end,1)]);
end

figure,plot(1:60,y)

[r,c]=size(input);

for kk=1:c
    yy(kk)=annfn2(input(:,kk));
end
figure
plot(input(1,:),output,'.k',input(1,:),yy,'.r')


