#include <stdio.h>
#include "platform.h"

void update();

int main() {
	printf("Hello, World\n");
	initPlatform(1280, 720);

	platformUpdateLoop(update);
}

void update() {
	// log("Updating");
}
