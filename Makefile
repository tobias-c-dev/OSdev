# directories 
SRC_DIR = src 
BUILD_DIR = build 

# tools
ASM = nasm
QEMU = qemu-system-x86_64

# targets
all: $(BUILD_DIR)/boot.bin

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/Stage_1/bootloader.asm 
	mkdir -p $(BUILD_DIR)
	$(ASM) -f bin $< -o $@

run: $(BUILD_DIR)/boot.bin
	$(QEMU) -drive format=raw,file=$(BUILD_DIR)/boot.bin

debug: $(BUILD_DIR)/boot.bin
	$(QEMU) -drive format=raw,file=$(BUILD_DIR)/boot.bin -s -S &
	gdb -x scripts/debug.gdb

clean: 
	rm -rf $(BUILD_DIR)
