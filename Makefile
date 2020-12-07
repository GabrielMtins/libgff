
# Copyright (C) 2020  Gabriel Martins

# This file is part of gffimage.

# gffimage is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# gffimage is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
    
# You should have received a copy of the GNU Lesser General Public License
# along with gffimage.  If not, see <https://www.gnu.org/licenses/>
# Contact: gabrielmartinsthe@gmail.com

CC = gcc
EXEC ?= libgffimage.a

CCFLAGS := -Wall -Wextra -O2

SRC_DIR := source

BUILD_DIR := ./build

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJECTS := $(addprefix $(BUILD_DIR)/, $(SRC))
OBJECTS := $(addsuffix .o, $(OBJECTS))
INCLUDE := $(wildcard $(SRC_DIR)/*.h)

$(BUILD_DIR)/%.c.o: %.c
	mkdir -p $(BUILD_DIR)/$(SRC_DIR)
	$(CC) $(CCFLAGS) -c $< -o $@ $(CCFLAGS)

$(EXEC): $(OBJECTS)
	ar -crs $(EXEC) $(OBJECTS)

install:
	mkdir -p /usr/include/gffimage
	cp $(INCLUDE) /usr/include/gffimage/
	cp $(EXEC) /usr/local/lib/

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(EXEC)
