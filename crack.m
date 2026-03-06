tile = imread('tile5.jpg');
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

%edge
edges = edge(bw1,"sobel");
figure, imshow(edges)

%gap
gap_fill = imfill(edges,'holes');
figure, imshow(gap_fill)

%dilation
se1 = strel("line",10,0);
dilated = imdilate(gap_fill,se1);
figure,imshow(dilated)

%closing
se2 = strel("disk",3);
close = imclose(dilated,se2);
figure, imshow(close)

%opening
se3 = strel("rectangle",[4 4]);
open = imopen(close,se3);
figure,imshow(open)

%smoothing
se4 = strel("disk",15);
smoothing = imclose(open,se4);
figure, imshow(smoothing)

%result
mask = imdilate(bwperim(smoothing), strel('disk',3));
final = labeloverlay(tile, mask, 'Colormap',[0 1 0], 'Transparency',0.4);
figure, imshow(final)


subplot(4,3,1), imshow(tile), title("Original")
subplot(4,3,2), imshow(gray), title("Gray Scale")
subplot(4,3,3), imhist(gray), title("Histogram of gray scale")
subplot(4,3,4), imshow(adjusted), title("Adjusted")
subplot(4,3,5), imhist(adjusted), title("Histogram of Adjusted")
subplot(4,3,6), imshow(bw1), title("Binary")
subplot(4,3,7), imshow(edges), title("Edge detection")
subplot(4,3,8), imshow(gap_fill), title("Gap Filling")
subplot(4,3,9), imshow(dilated), title("Dilation")
subplot(4,3,10), imshow(close), title("Closing")
subplot(4,3,11), imshow(open), title("Opening")
subplot(4,3,12), imshow(final), title("Cracks highlighted")

