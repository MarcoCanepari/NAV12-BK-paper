

% This function converts n consecutive tsm files into matlab images
clear all
[file perc]=uigetfile('*.tsm','load first file');
n=input('Enter the number of images');
fn=str2num(file(1,end-5:end-4));
for k=fn:fn+n-1,
   ds=num2str(k);
   if length(ds)==1,
      ds=['0',ds];
   end
   file1(k-fn+1,:)=[file(1,1:end-6),ds,file(1,end-3:end)];
end   

for k=1:n,
   file=file1(k,:);
   mfile=['m',file(1:end-4)];
   display(file);
   YYY = fitsread(file);
   [a b c] = size (YYY);
   YY= int16(YYY);
   Y = swapbytes(YY);
   eval(['save ',mfile,' Y']);  
end   

