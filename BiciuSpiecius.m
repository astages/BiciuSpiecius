function [fMin, xMin] = BiciuSpiecius(funkcija,a,b)
% Realizacija pagrysta Monte Carlo2 adaptyvus failu
% Paleidimas: [f_Min, x_Min] = BiciuSpiecius(@shub,-10,10)
n=2;%Dimensija (matavimas)
k=55;%Tasku (vektoriu) skaicius, generuojame 50 tasku
x = a + (b-a) .* rand(k,n); %Perdaryti, kad generuotu dvimacius vektorius
f1=[];
for i=1:k
    f(i)=funkcija(x(i,:));%Imame visa eilute, perduodame reiksmes x1, x2
end
%Surusiuosiu visas k reiksmes ir isrinksiu 10 maziausiu pagal funkcijos
%reiksmes
[f_sort, f_sort_ind] = sort(f); % Surusiuoja visas 60 reiksm.
x_sort = x(f_sort_ind,:);
f_sort_10 = f_sort(1:10); % Isrenka 10 is surusiuotu
x_sort_10 = x_sort(1:10,:); % Isrenka 10 is surusiuotu

% Surasta kol kas geriausia reiksmes ir taskas
fMin =  f_sort(1);
xMin = x_sort(1,:);

% Nubraizome ka gavome po 55 bandymu
hold on;
scatter(x(:,1),x(:,2),'b.');
scatter(x_sort_10(:,1),x_sort_10(:,2),'r*');
for i=1:10
    text(x_sort_10(i,1)+0.3,x_sort_10(i,2),num2str(i));
end
%text(xMin(1)+0.3,xMin(2),num2str(fMin));
rectangle('Position',[a,a,b-a,b-a],...
    'Linewidth',5,'Linestyle','--')

% Nauju tasku gavimas vidurkio principu
% Mazas pvz., "suleisiu" 1 taska su 2
m = 0;
for j=1:9
 for jj=j+1:10
     m=m+1;
    x_naujas= (x_sort_10(j,:) + x_sort_10(jj,:))/2;
       f_naujas = funkcija(x_naujas(1,:))
         if (fMin > f_naujas)
   fMin = f_naujas;
        end;
        scatter(x_naujas(1,1),x_naujas(1,2),'y*'); 
        if mod(m,5)==1
  text(x_naujas(1,1)+0.3,x_naujas(1,2),num2str(m));
        end;
    end;
 end;
%Nubreziu nauja taska
%scatter(x_naujas(1,1),x_naujas(1,2),'g*');
%text(x_naujas(1,1)+0.3,x_naujas(1,2),num2str(f_naujas));

    






