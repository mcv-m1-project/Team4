%BW2 = bwareaopen(BW,P) removes all connected components (objects) that have fewer than P pixels 
%from the binary image BW, producing another binary image, BW2. The default connectivity is 8 
%for two dimensions, 26 for three dimensions, and conndef(ndims(BW), 'maximal') for higher dimensions. This operation is known as an area opening.

%^No se si se puede utilizar esto iria bien como ultimo paso para quitar
%elementos conexos que son tan pequeños que no pueden ser señales

%https://es.mathworks.com/help/images/morphological-filtering.html

%La idea que se me ha ocurrido ha sido:

%1o dilatar para hacer la señal conexa con un operador pequeño (hay que
%ajustar thresholds del hsv)

%2o Hacer un imfill para rellenar la señal (tiene que ser conexa de ahi lo
%1o)

%3o Hacer un imopen para quitar el ruido con un operador mas grande ya que
%hemos dilatado antes
Im1 = imread('mask.01.001777.HSV.png');
figure(1)
imshow(Im1);

se1 = ones(5,5);
se2 = ones(8,8);
% Im1 = imfill(Image_mask);
% figure(2)
% imshow(Im1);

Im2 = imdilate(Im1,se1);
figure(2)
imshow(Im2);

Im3 = imfill(Im2,'holes');
figure(3)
imshow(Im3);

Im4 = imopen(Im3,se2);
figure(4)
imshow(Im4);


% Im3 = imtophat(Im2,se);
% figure(2)
% imshow(Im3);

% Im4 = imbothat(Im2,se);
% figure(3)
% imshow(Im4);

