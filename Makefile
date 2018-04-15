GAME_NAME=testGame

ifneq (, $(findstring MSYS_NT, $(shell uname)))
all:
	$(MAKE) bWindows
	$(MAKE) rWindows

debugC:
	cmd /c "devenv /Run bin\${GAME_NAME}.exe"
endif

ifeq ($(shell uname), Linux)
all:
	$(MAKE) bLinux
	$(MAKE) rLinux
endif

bWindows:
	cmd /c "cl -MTd -Zi -EHsc -nologo -Iinclude/win32 lib/win32/*.lib src/*.cpp -Fdbin/main.pdb -Fobin/ -link /DEBUG -out:bin/${GAME_NAME}.exe"
	cp lib/win32/SDL2-d.dll bin/SDL2.dll
	cp lib/win32/glew32.dll bin
	cp lib/win32/OpenAl32-d.dll bin/OpenAl32.dll
	cp lib/win32/libcurl.dll bin
	cp lib/win32/libcurl-d.dll bin
	cp -r assets bin

rWindows:
	@echo .
	@echo .
	@echo .
	@(cd bin; ./${GAME_NAME}.exe)

bLinux:
	@echo Stub
	@echo Stub
