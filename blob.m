tile = imread('tile6.png');
figure, imshow(tile)

%inverse
complement = imcomplement(tile);
figure, imshow(complement)

%gray
gray = rgb2gray(complement);
figure,imshow(gray)

%binary
bw1 = imbinarize(gray,"adaptive","ForegroundPolarity","dark");
figure, imshow(bw1)

%open
se1 = strel("disk", 2);
opening = imopen(bw1,se1);
figure, imshow(opening)

mask = imdilate(bwperim(opening), strel('disk',3));
final = labeloverlay(tile, mask, 'Colormap',[1 0 0], 'Transparency',0.75);
figure, imshow(final)

subplot(3,2,1), imshow(tile), title("Original")
subplot(3,2,2), imshow(complement), title("Complement")
subplot(3,2,3), imshow(gray), title("Gray Scale")
subplot(3,2,4), imshow(bw1), title("Binary")
subplot(3,2,5), imshow(opening), title("Closing")
subplot(3,2,6), imshow(final), title("Blob detected")