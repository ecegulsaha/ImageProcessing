%Bülent SÝYAH 081503030 Sayýsal Görüntü Ýþleme 
%1.ödev siyah beyaz resim üzerinde objeleri bulma algoritmasý
%Görüntüyü okuma 
resimOrjinal = imread('BulentSiyah.jpg');
%Görüntü renkli bile olsa siyah beyaz resme dönüþtürülecek. ikinci
%parametre ile verilen deðere kadar ki kýsýmlar beyaz geriye kalan kýsým
%siyah olarak dönüþtürülecek. Bu kadar yüksek verilmesinin nedeni
%incelenecek olan görüntün siyah ve beyaz renkler içerecek olmasýdýr.
resimSiyah = im2bw(resimOrjinal,0.9);
%Esik deðer sayesinde görüntü siyah zemin üzerine beyaz nesne, beyaz zemin
%üzerine siyah nesne olduðunu anlayamamýzý saðlýyor.Dönüþ deðeri round
%fonksiyonu ile 0 veya 1 e yakýnlýðýna göre hangi rengin yoðun olduðunu
%anlýyoruz.
esikdeger = graythresh(resimOrjinal);
% eðer eþikdeðer 1 ise yani beyaz renk yoðunluktaysa o zaman renkleri
% deðiþtir. Eðer 0 daha yakýnsa o zaman renkler olduðu gibi kalýcak.
if 1==round(esikdeger)
resimSiyah=~(resimSiyah);
end
%Görüntü baþlangýçta ne olursa olsun þuan beyaz zemin üzerine siyah nesne
%þeklinde dönüþtürüldü.
%Eðer varsa nesneye ait olmayan kucuk pikseller onlarý görmezden
%gelicek.Özellikle paintle hazýrladýðým bazý resimlerde bu sorun ortaya
%çýktý.
resimSiyah = bwareaopen(resimSiyah,25);
%Sýnýrlarý bulmak için tüm nesneler Nesneler deðiþkenine atanýyor. Kaç
%nesne varsa nesnesayýsý*1 lik array oluþur. Burada her elemanda o nesnenin
%tüm piksel bilgileri tutulur. ÖReneðin resimdeki üçgen nesnesinin
%çevresindeki tüm pikseller Nesneler deðiþkenin bir deðerine atanýr. Diðer
%tüm nesnelerde böyle yapýlýr.
[Nesneler,Label] = bwboundaries(resimSiyah,'noholes');
%Bulunan nesneler bastýrýlýr. L label, köþeli parantez içindeki deðerler 
%nesnelerin dýþýndaki alaný yani arkaplaný renklendirme için
imshow(label2rgb(Label, @jet, [.3 .3 .3]))
%Bütün nesnelerin etrafý 1 piksellik þerit ile çevreleniyor. Böylece artýk 
%resimdeki nesneler belirlenmiþ oldu.
hold on
for i = 1:length(Nesneler)
  sinirlar = Nesneler{i};
  plot(sinirlar(:,2), sinirlar(:,1), 'w', 'LineWidth', 1)
end
fprintf('Nesneler iþaretlenmiþtir. Toplam Nesne Sayýsý=%d\n',i)