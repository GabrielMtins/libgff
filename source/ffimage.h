#ifndef GFFIMAGE_H
#define GFFIMAGE_H

#include <stddef.h>
#include <stdint.h>

/*
    Copyright (C) 2020  Gabriel Martins

    This file is part of gffimage.

    gffimage is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    gffimage is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with gffimage.  If not, see <https://www.gnu.org/licenses/>
    Contact: gabrielmartinsthe@gmail.com
*/

typedef struct{
	uint8_t* buffer;
	int width, height;
} ffimage;

typedef struct{
	uint8_t r, g, b, a;
} ffcolor;

ffimage* ffimage_create(int width, int height);

void ffimage_clear(ffimage* self, ffcolor c);

void ffimage_drawPixel(ffimage* self, int i, int j, ffcolor c);

void ffimage_drawRect(ffimage* self, int x, int y, int w, int h, ffcolor c);

void ffimage_drawLine(ffimage* self, int x1, int y1, int x2, int y2, int thickness, ffcolor c);

void ffimage_saveAs(ffimage* self, const char* filename);

void ffimage_saveToOutput(ffimage* self);

void ffimage_destroy(ffimage* self);

#endif
