// Taken from https://embeddedartistry.com/blog/2020/05/18/implementing-stack-smashing-protection-for-microcontrollers-and-embedded-artistrys-libc/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <test/ssp/ssptest.h>

const char* __ssp_test_buffer_long = "This is a loooooooooooooong buffer";  // this is 35 char long

void ssp_test() {
  char buffer_short[20];

  // this should crash (cause kernel panic or abort)
  // however, in my experience the kernel just fails to load instead and no kernel panic or abort message was displayed
  // setting the buffer size > 35 works without a problem
  memcpy(buffer_short, __ssp_test_buffer_long, strlen(__ssp_test_buffer_long));

  printf("[TEST][SSP]: Overflow case run.\n");
}

/*
int main(void) {
  printf("Running stack overflow test program.\n");

  stack_overflows_here();

  return 0;
}
*/