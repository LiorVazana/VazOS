ASM=nasm

SRC_DIR=src
BUILD_DIR=build

run:
	$(ASM) $(SRC_DIR)/Bootloader/bootloader.asm -f bin -o $(BUILD_DIR)/main.bin
	qemu-system-x86_64 -fda $(BUILD_DIR)/main.bin

