# Makefile de la práctica Mini Cloud Log Analyzer
# Comentarios en español para facilitar la comprensión a estudiantes principiantes.

PROJECT := analyzer
SRC := src/analyzer.s

# En AWS Ubuntu 24 ARM64, normalmente se usa 'as' y 'ld' nativos.
AS ?= as
LD ?= ld

# Herramientas alternativas para hosts que no son ARM64.
CLANG ?= clang
LLD ?= ld.lld

# Detecta arquitectura del host para elegir estrategia de compilación.
HOST_ARCH := $(shell uname -m)

.PHONY: all run test debug clean

all: $(PROJECT)

# Compilación principal:
# - En ARM64: as + ld (flujo clásico de GNU assembler).
# - En otra arquitectura: clang/lld con target AArch64 para generar el binario.
$(PROJECT): $(SRC)
ifeq ($(HOST_ARCH),aarch64)
	@echo "[INFO] Compilando en host ARM64 con as/ld..."
	$(AS) -o $(PROJECT).o $(SRC)
	$(LD) -o $(PROJECT) $(PROJECT).o
else
	@echo "[INFO] Host no ARM64 ($(HOST_ARCH)); compilando con clang/lld para AArch64..."
	$(CLANG) --target=aarch64-linux-gnu -c $(SRC) -o $(PROJECT).o
	$(CLANG) --target=aarch64-linux-gnu -nostdlib -fuse-ld=lld \
		-Wl,-e,_start -o $(PROJECT) $(PROJECT).o
endif

run: $(PROJECT)
	bash run.sh

test: $(PROJECT)
	bash tests/test.sh

# Desensamble para depuración (si hay herramienta disponible).
debug: $(PROJECT)
	@if command -v llvm-objdump >/dev/null 2>&1; then \
		echo "[INFO] Usando llvm-objdump"; \
		llvm-objdump -d $(PROJECT) | head -n 120; \
	elif command -v aarch64-linux-gnu-objdump >/dev/null 2>&1; then \
		echo "[INFO] Usando aarch64-linux-gnu-objdump"; \
		aarch64-linux-gnu-objdump -d $(PROJECT) | head -n 120; \
	else \
		echo "[WARN] No se encontró objdump para AArch64."; \
		exit 1; \
	fi

clean:
	rm -f $(PROJECT) $(PROJECT).o
