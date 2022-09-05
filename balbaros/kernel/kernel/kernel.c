#include <kernel/tty.h>
#include <stdio.h>
#ifdef __RUN_TESTS
#include <test/runtests.h>
#endif

void kernel_main(void) {
  terminal_initialize();
  // printf("Hello, kernel World!\nThis \t is \t a \t line \t with \t some \t\t tabs \t\t inbetween \t!");
  for (int i = 0; i < 35; i++) {
    for (int j = 0; j < i; j++) {
      printf("*");
    }
    printf("\n");
  }
#ifdef __RUN_TESTS
  run_tests();
  printf("Test phase over\n");
#endif
}
