#include <kernel/tty.h>
#include <stdio.h>
#ifdef __RUN_TESTS
#include <test/runtests.h>
#endif

void kernel_main(void) {
  terminal_initialize();
  printf("Hello, kernel World!\nThis \t is \t a \t line \t with \t some \t\t tabs \t\t inbetween \t!");
#ifdef __RUN_TESTS
  run_tests();
  printf("Test phase over\n");
#endif
}
