#include <kernel/tty.h>
#include <stdio.h>
#ifdef __RUN_TESTS
#include <test/runtests.h>
#endif

void kernel_main(void) {
  terminal_initialize();
  printf("Hello, kernel World!\n");
#ifdef __RUN_TESTS
  run_tests();
  printf("Test phase over\n");
#endif
}
