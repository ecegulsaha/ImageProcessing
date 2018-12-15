
%siyah beyaz resim üzerinde objeleri bulma algoritması
%Görüntüyü okuma 
resimOrjinal = imread('sekil1.jpg');
resimSiyah = im2bw(resimOrjinal,0.9);
esikdeger = graythresh(resimOrjinal);
if 1==round(esikdeger)
resimSiyah=~(resimSiyah);
end
resimSiyah = bwareaopen(resimSiyah,25);
[Nesneler,Label] = bwboundaries(resimSiyah,'noholes');

imshow(label2rgb(Label, @jet, [.3 .3 .3]))
hold on
for i = 1:length(Nesneler)
  sinirlar = Nesneler{i};
  plot(sinirlar(:,2), sinirlar(:,1), 'w', 'LineWidth', 1)
end
fprintf('Nesneler işaretlenmiştir. Toplam Nesne Sayısı=%d\n',i)
