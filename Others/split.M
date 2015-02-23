function split(filename,foldername) 
%split('Chen','new')
%create a folder for the 175 data
folder = sprintf('%s_%d',foldername,date);
    mkdir(folder)
%output for "groupname"sheet   
 file = sprintf('%s.xlsx',filename);
       num = xlsread(file,2);
       path='Groupname.txt';
       dlmwrite(sprintf('%s/%s',folder,path),num,'delimiter','\t','precision',14,'newline','pc');
%loop for the other 174 sheet   
    for i = 3:176
       file = sprintf('%s.xlsx',filename);
       num = xlsread(file,i);
       path=sprintf('%d.txt',i-2);
       dlmwrite(sprintf('%s/%s',folder,path),num,'delimiter','\t','precision',14,'newline','pc');
    end
    
