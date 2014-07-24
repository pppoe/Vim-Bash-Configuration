BUILD_DIR="./build/"
all:
	if [ ! -f $(BUILD_DIR)/Makefile ]; then cd $(BUILD_DIR) && cmake ../src ; fi && cd $(BUILD_DIR) && make
cmake:
	cd $(BUILD_DIR) && cmake ../src
clean:
	cd $(BUILD_DIR) && make clean
