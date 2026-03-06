tile = imread('tile2.png');
figure, imshow(tile)

%gray
gray = rgb2gray(tile);
figure, imshow(gray)

%intensity adjustment
adjusted = imadjust(gray);
figure, imshow(adjusted)
imhist(adjusted)

%binary
bw1 = imbinarize(adjusted);
figure, imshow(bw1)

%closing
se1 = strel("disk",7);
closing = imclose(bw1,se1);
figure, imshow(closing)

mask = imdilate(bwperim(closing), strel('disk',3));
final = labeloverlay(tile, mask, 'Colormap',[1 0 0], 'Transparency',0.75);
figure, imshow(final)

subplot(3,3,1), imshow(tile), title("Original")
subplot(3,3,2), imshow(gray), title("Gray Scale")
subplot(3,3,3), imhist(gray), title("Histogram of gray scale")
subplot(3,3,4), imshow(adjusted), title("Adjusted")
subplot(3,3,5), imhist(adjusted), title("Histogram of Adjusted")
subplot(3,3,6), imshow(bw1), title("Binary")
subplot(3,3,7), imshow(closing), title("Closing")
subplot(3,3,8), imshow(final), title("Pin Hole detected")


