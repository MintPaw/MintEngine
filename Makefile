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
	cmd /c "cl -MTd -Zi -EHsc -nologo -Iinclude/win32 -Iinclude/v8Includes lib/win32debug/*.lib src/*.cpp -Fdbin/main.pdb -Fobin/ -link /DEBUG -out:bin/${GAME_NAME}.exe"
	cp lib/win32debug/*.dll bin/
	cp lib/win32debug/v8bin/* bin/
	cp -r assets bin

rWindows:
	@echo .
	@echo .
	@echo .
	@(cd bin; ./${GAME_NAME}.exe)

bLinux:
	@echo Stub
	@echo Stub
