function [wsal,acsal,tmpsal,cnt]=armado_vyc(went,dtmp,nw,repet)
%nw: cantidad de segmentos de velocidades; 
%went: vector de velocidades de entrada; 
%dtmp: vector de tiempos de duracion de las velocidades; 
%repet: repetición de la misma trayectoria.
l=1;
if repet==0
    repaux=nw;
else

    for k=1:repet
        for h=1:nw
            went(nw+l)=went(h);
            dtmp(nw+l)=dtmp(h);
            l=l+1;
        end
    end
    repaux=(repet+1)*nw;
end

for j=1:repaux
    if j==1
        [waux,acaux,tmpaux,cntaux]=gen_de_vel_y_ac(0,went(j),0,0);
        for i=1:cntaux
            wsal(i)=waux(i);
            acsal(i)=acaux(i);
            tmpsal(i)=tmpaux(i);
        end
        cnt=cntaux;
    else
        [waux,acaux,tmpaux,cntaux]=gen_de_vel_y_ac(went(j-1),went(j),tmpsal(cnt),acsal(cnt));
        for i=1:cntaux
            wsal(cnt+i)=waux(i);
            acsal(cnt+i)=acaux(i);
            tmpsal(cnt+i)=tmpaux(i);
        end
        cnt=cnt+cntaux;
    end
    [waux,acaux,tmpaux,cntaux]=gen_de_vel_y_ac2(went(j),dtmp(j),tmpsal(cnt));
    for i=1:cntaux
        wsal(cnt+i)=waux(i);
        acsal(cnt+i)=acaux(i);
        tmpsal(cnt+i)=tmpaux(i);
    end
    cnt=cnt+cntaux;
    if j==repaux
        [waux,acaux,tmpaux,cntaux]=gen_de_vel_y_ac(went(j),0,tmpsal(cnt),acsal(cnt));
        for i=1:cntaux
            wsal(cnt+i)=waux(i);
            acsal(cnt+i)=acaux(i);
            tmpsal(cnt+i)=tmpaux(i);
        end
        cnt=cnt+cntaux;
    end
end
