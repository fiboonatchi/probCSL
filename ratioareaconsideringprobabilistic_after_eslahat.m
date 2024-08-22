
function [wl_126_a, wl_245_a, wl_370_a, wl_585_a, wl_126_m, wl_245_m, wl_370_m, wl_585_m, wl_ref_total_a, wl_ref_total_m, wbudget_d_ref_total,wbudget_d_126,wbudget_d_245,wbudget_d_370,wbudget_d_585]=ratioareaconsideringprobabilistic_after_eslahat(PECShist_MC,PECSbasinhist_MC,PECS126_MC,PECSbasin126_MC,PECS245_MC,PECSbasin245_MC,PECS370_MC,PECSbasin370_MC,PECS585_MC,PECSbasin585_MC,PCS_hist_MC,PCS_126_MC,PCS_245_MC,PCS_370_MC,PCS_585_MC,ECS_hist_MC,ECS_126_MC,ECS_245_MC,ECS_370_MC,ECS_585_MC)

%observed MAKH 1900-2021
cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\CSL\Yearly\CASPCOM_new');
fn='MAKH.xlsx';
makh_obs=xlsread(fn,'Sheet1','B1:B122');

%ANZALI 1941-2021
cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\CSL');
fn='enayatiCNRC1994-2021-CNRCme.xlsx';
anzali_obs=xlsread(fn,'Sheet1','B1:B81');

wl_126_a=zeros(86,10000);
wl_245_a=zeros(86,10000);
wl_370_a=zeros(86,10000);
wl_585_a=zeros(86,10000);

wl_126_m=zeros(86,10000);
wl_245_m=zeros(86,10000);
wl_370_m=zeros(86,10000);
wl_585_m=zeros(86,10000);


for j=1:10000;
    for i=1:7;
        
wl_126_m(i,j)=makh_obs(115+i);
wl_245_m(i,j)=makh_obs(115+i);
wl_370_m(i,j)=makh_obs(115+i);
wl_585_m(i,j)=makh_obs(115+i);

wl_126_a(i,j)=anzali_obs(74+i);
wl_245_a(i,j)=anzali_obs(74+i);
wl_370_a(i,j)=anzali_obs(74+i);
wl_585_a(i,j)=anzali_obs(74+i);

    end
end


caspianareafixed=43.5;
caspianareafixed2=43.5;
AreaCSbasinwithoutcs=396.994928-caspianareafixed;

cd('H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\Area');
load('fitt_model_area_CS');

folderPath ='H:\Downscaling\ensembles\caspian_basin\water budget_deterministic\Area\fitted_models';
fileList = dir(fullfile(folderPath, '*.mat'));
for i = 1:numel(fileList);
    filePath = fullfile(folderPath, fileList(i).name);
    load(filePath); 
end

for j=1:10000;
for i=8:86;
    
x=wl_126_a(i-1,j);  
      
 if -25 <= x && x <= -28;
    fittedmodel = fittedmodel1;
elseif -28 < x && x <= -29.2;
    fittedmodel = fittedmodel2;
elseif -29.2 < x && x <= -30.2;
    fittedmodel = fittedmodel3;
elseif -30.2 < x && x <= -31.2;
    fittedmodel = fittedmodel4;
elseif -31.2 < x && x <= -32.2;
    fittedmodel = fittedmodel5;
elseif -32.2 < x && x <= -33.2;
    fittedmodel = fittedmodel6;
elseif -33.2 < x && x <= -34.2;
    fittedmodel = fittedmodel7;
elseif -34.2 < x && x <= -35;
    fittedmodel = fittedmodel8;
end
    
area_scen=fittedmodel(x);   
ratio126(i,j)=(AreaCSbasinwithoutcs)/area_scen;
ratio_126_p(i,j)=caspianareafixed2/area_scen;
% ratio_126_p(i,j)=1;

wbudget_d_126(i,j)=(PCS_126_MC(i,j)*ratio_126_p(i,j)-ECS_126_MC(i,j)+PECSbasin126_MC(i,j)*ratio126(i,j))*0.001;
wl_126_a(i,j)=wl_126_a(i-1,j)+wbudget_d_126(i,j);
wl_126_m(i,j)=wl_126_m(i-1,j)+wbudget_d_126(i,j);

x=wl_245_a(i-1,j);  
      
 if -25 <= x && x <= -28;
    fittedmodel = fittedmodel1;
elseif -28 < x && x <= -29.2;
    fittedmodel = fittedmodel2;
elseif -29.2 < x && x <= -30.2;
    fittedmodel = fittedmodel3;
elseif -30.2 < x && x <= -31.2;
    fittedmodel = fittedmodel4;
elseif -31.2 < x && x <= -32.2;
    fittedmodel = fittedmodel5;
elseif -32.2 < x && x <= -33.2;
    fittedmodel = fittedmodel6;
elseif -33.2 < x && x <= -34.2;
    fittedmodel = fittedmodel7;
elseif -34.2 < x && x <= -35;
    fittedmodel = fittedmodel8;
 end
 

area_scen=fittedmodel(x);   
ratio245(i,j)=(AreaCSbasinwithoutcs)/area_scen;
ratio_245_p(i,j)=caspianareafixed2/area_scen;
% ratio_245_p(i,j)=1;

wbudget_d_245(i,j)=(PCS_245_MC(i,j)*ratio_245_p(i,j)-ECS_245_MC(i,j)+PECSbasin245_MC(i,j)*ratio245(i,j))*0.001;

wl_245_a(i,j)=wl_245_a(i-1,j)+wbudget_d_245(i,j);
wl_245_m(i,j)=wl_245_m(i-1,j)+wbudget_d_245(i,j);

x=wl_370_a(i-1,j);  
      
 if -25 <= x && x <= -28;
    fittedmodel = fittedmodel1;
elseif -28 < x && x <= -29.2;
    fittedmodel = fittedmodel2;
elseif -29.2 < x && x <= -30.2;
    fittedmodel = fittedmodel3;
elseif -30.2 < x && x <= -31.2;
    fittedmodel = fittedmodel4;
elseif -31.2 < x && x <= -32.2;
    fittedmodel = fittedmodel5;
elseif -32.2 < x && x <= -33.2;
    fittedmodel = fittedmodel6;
elseif -33.2 < x && x <= -34.2;
    fittedmodel = fittedmodel7;
elseif -34.2 < x && x <= -35;
    fittedmodel = fittedmodel8;
 end
    

area_scen=fittedmodel(x);   
ratio370(i,j)=(AreaCSbasinwithoutcs)/area_scen;
ratio_370_p(i,j)=caspianareafixed2/area_scen;
% ratio_370_p(i,j)=1;
wbudget_d_370(i,j)=(PCS_370_MC(i,j)*ratio_370_p(i,j)-ECS_370_MC(i,j)+PECSbasin370_MC(i,j)*ratio370(i,j))*0.001;
 
wl_370_a(i,j)=wl_370_a(i-1,j)+wbudget_d_370(i,j);
wl_370_m(i,j)=wl_370_m(i-1,j)+wbudget_d_370(i,j);

x=wl_585_a(i-1,j);  
      
 if -25 <= x && x <= -28;
    fittedmodel = fittedmodel1;
elseif -28 < x && x <= -29.2;
    fittedmodel = fittedmodel2;
elseif -29.2 < x && x <= -30.2;
    fittedmodel = fittedmodel3;
elseif -30.2 < x && x <= -31.2;
    fittedmodel = fittedmodel4;
elseif -31.2 < x && x <= -32.2;
    fittedmodel = fittedmodel5;
elseif -32.2 < x && x <= -33.2;
    fittedmodel = fittedmodel6;
elseif -33.2 < x && x <= -34.2;
    fittedmodel = fittedmodel7;
elseif -34.2 < x && x <= -35;
    fittedmodel = fittedmodel8;
 end
    
area_scen=fittedmodel(x);   
ratio585(i,j)=(AreaCSbasinwithoutcs)/area_scen;
ratio_585_p(i,j)=caspianareafixed2/area_scen;
% ratio_585_p(i,j)=1;

wbudget_d_585(i,j)=(PCS_585_MC(i,j)*ratio_585_p(i,j)-ECS_585_MC(i,j)+PECSbasin585_MC(i,j)*ratio585(i,j))*0.001;
wl_585_a(i,j)=wl_585_a(i-1,j)+wbudget_d_585(i,j);
wl_585_m(i,j)=wl_585_m(i-1,j)+wbudget_d_585(i,j);

end
end

%calcuulating makh level in the ref period from 1980-2014
%80 refers to 1979 one year befor 1980
wl_ref_m_1979=makh_obs(80);
wl_ref_a_1979=anzali_obs(31);
% wl_a_ref_1979=makh_obs(39);

for j=1:10000;
for i=1:35;
x(i)=anzali_obs(i+30);

if -25 <= x(i) && x(i) <= -28;
    fittedmodel = fittedmodel1;
elseif -28 < x(i) && x(i) <= -29.2;
    fittedmodel = fittedmodel2;
elseif -29.2 < x(i) && x(i) <= -30.2;
    fittedmodel = fittedmodel3;
elseif -30.2 < x(i) && x(i) <= -31.2;
    fittedmodel = fittedmodel4;
elseif -31.2 < x(i) && x(i) <= -32.2;
    fittedmodel = fittedmodel5;
elseif -32.2 < x(i) && x(i) <= -33.2;
    fittedmodel = fittedmodel6;
elseif -33.2 < x(i) && x(i) <= -34.2;
    fittedmodel = fittedmodel7;
elseif -34.2 < x(i) && x(i) <= -35;
    fittedmodel = fittedmodel8;
end

AreaCS=fittedmodel(x(i));
ratioref(i)=(AreaCSbasinwithoutcs)/AreaCS;
ratioref_p(i)=caspianareafixed2/AreaCS;
% ratioref_p(i)=1;

wbudget_d_ref_total(i,j)=(PCS_hist_MC(i,j)*ratioref_p(i)-ECS_hist_MC(i,j)+PECSbasinhist_MC(i,j)*ratioref(i))*0.001;
wl_ref_total_a(i,j)=wl_ref_a_1979+sum(wbudget_d_ref_total(1:i,j)); 
wl_ref_total_m(i,j)=wl_ref_m_1979+sum(wbudget_d_ref_total(1:i,j));  

end
end


for k=1:10000;
for i=1:78;
   
    cum_126(i,k)=sum(wbudget_d_126(1:i,k));
    cum_245(i,k)=sum(wbudget_d_245(1:i,k));
    cum_370(i,k)=sum(wbudget_d_370(1:i,k));
    cum_585(i,k)=sum(wbudget_d_585(1:i,k));
end
end




