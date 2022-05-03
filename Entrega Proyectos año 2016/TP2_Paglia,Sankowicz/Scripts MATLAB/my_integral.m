function res= my_integral(deltax, y)
%res=zeros(length(y));
res(1)=0;

for i=2:length(y)

    res(i)=(y(i-1)+y(i))*deltax+res(i-1);
        
    
end
