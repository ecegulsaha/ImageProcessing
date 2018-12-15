%B�lent S�YAH 081503030 Say�sal G�r�nt� ��leme 
%1.�dev siyah beyaz resim �zerinde objeleri bulma algoritmas�
%G�r�nt�y� okuma 
resimOrjinal = imread('BulentSiyah.jpg');
%G�r�nt� renkli bile olsa siyah beyaz resme d�n��t�r�lecek. ikinci
%parametre ile verilen de�ere kadar ki k�s�mlar beyaz geriye kalan k�s�m
%siyah olarak d�n��t�r�lecek. Bu kadar y�ksek verilmesinin nedeni
%incelenecek olan g�r�nt�n siyah ve beyaz renkler i�erecek olmas�d�r.
resimSiyah = im2bw(resimOrjinal,0.9);
%Esik de�er sayesinde g�r�nt� siyah zemin �zerine beyaz nesne, beyaz zemin
%�zerine siyah nesne oldu�unu anlayamam�z� sa�l�yor.D�n�� de�eri round
%fonksiyonu ile 0 veya 1 e yak�nl���na g�re hangi rengin yo�un oldu�unu
%anl�yoruz.
esikdeger = graythresh(resimOrjinal);
% e�er e�ikde�er 1 ise yani beyaz renk yo�unluktaysa o zaman renkleri
% de�i�tir. E�er 0 daha yak�nsa o zaman renkler oldu�u gibi kal�cak.
if 1==round(esikdeger)
resimSiyah=~(resimSiyah);
end
%G�r�nt� ba�lang��ta ne olursa olsun �uan beyaz zemin �zerine siyah nesne
%�eklinde d�n��t�r�ld�.
%E�er varsa nesneye ait olmayan kucuk pikseller onlar� g�rmezden
%gelicek.�zellikle paintle haz�rlad���m baz� resimlerde bu sorun ortaya
%��kt�.
resimSiyah = bwareaopen(resimSiyah,25);
%S�n�rlar� bulmak i�in t�m nesneler Nesneler de�i�kenine atan�yor. Ka�
%nesne varsa nesnesay�s�*1 lik array olu�ur. Burada her elemanda o nesnenin
%t�m piksel bilgileri tutulur. �Rene�in resimdeki ��gen nesnesinin
%�evresindeki t�m pikseller Nesneler de�i�kenin bir de�erine atan�r. Di�er
%t�m nesnelerde b�yle yap�l�r.
[Nesneler,Label] = bwboundaries(resimSiyah,'noholes');
%Bulunan nesneler bast�r�l�r. L label, k��eli parantez i�indeki de�erler 
%nesnelerin d���ndaki alan� yani arkaplan� renklendirme i�in
imshow(label2rgb(Label, @jet, [.3 .3 .3]))
%B�t�n nesnelerin etraf� 1 piksellik �erit ile �evreleniyor. B�ylece art�k 
%resimdeki nesneler belirlenmi� oldu.
hold on
for i = 1:length(Nesneler)
  sinirlar = Nesneler{i};
  plot(sinirlar(:,2), sinirlar(:,1), 'w', 'LineWidth', 1)
end
fprintf('Nesneler i�aretlenmi�tir. Toplam Nesne Say�s�=%d\n',i)