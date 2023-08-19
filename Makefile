.PHONY: objs mkstatic all clean

PROJECT := hello


CUR_DIR := .

INC_DIR := $(CUR_DIR)/inc
SRC_DIR := $(CUR_DIR)/src
OBJ_DIR := $(CUR_DIR)/obj
BIN_DIR := $(CUR_DIR)/bin


LIB_DIR := $(CUR_DIR)/lib
LIB_STATIC := $(LIB_DIR)/static
LIB_SHARED := $(LIB_DIR)/shared


INC_FLAGS := -I $(INC_DIR)
CC :=gcc

objs:
	$(CC)  -c -o $(OBJ_DIR)/hello_world.o $(SRC_DIR)/hello_world.c  $(INC_FLAGS)
	$(CC)  -c -o $(OBJ_DIR)/hello_tuananh.o  $(SRC_DIR)/hello_tuananh.c $(INC_FLAGS)
	$(CC)  -c -o $(OBJ_DIR)/main.o main.c $(INC_FLAGS)
	
mkstatic: objs
	ar rcs $(LIB_STATIC)/libhello.a $(OBJ_DIR)/hello_world.o $(OBJ_DIR)/hello_tuananh.o
all: mkstatic
	$(CC)  $(OBJ_DIR)/main.o  -L$(LIB_STATIC) -l$(PROJECT) -o $(BIN_DIR)/$(PROJECT)

clean:
	rm -rf $(OBJ_DIR)/* $(LIB_STATIC)/libhello.a $(BIN_DIR)/$(PROJECT)

	
