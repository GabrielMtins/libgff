# libgffimage
Load ff images in C
## How to install
```
git clone https://github.com/GabrielMtins/libgffimage.git
cd libgffimage
make
sudo make install
```
## Structures
ffimage - a structure that holds the image data  
```
typedef struct{
	uint8_t* buffer;
	int width, height;
} ffimage;
```
ffcolor - a structure that holds color data   
```
typedef struct{
	uint8_t r, g, b, a;
} ffcolor;
```
## Functions
```
ffimage* ffimage_create(int width, int height); // creates a ffimage

void ffimage_clear(ffimage* self, ffcolor c); // paints the whole image with the color c

void ffimage_drawPixel(ffimage* self, int i, int j, ffcolor c); // draw a pixel with the color c at the point (i, j)

void ffimage_drawRect(ffimage* self, int x, int y, int w, int h, ffcolor c); // draw a rect with the color c at the point (x, y) with the width w and height h

void ffimage_drawLine(ffimage* self, int x1, int y1, int x2, int y2, int thickness, ffcolor c); // draw a line at the point (x1, y1) to the point (x2, y2) with a thickness defined in pixels and with the color c

void ffimage_saveAs(ffimage* self, const char* filename); // save the image with the name filename

void ffimage_destroy(ffimage* self); // free the memory occupied by the image
```
