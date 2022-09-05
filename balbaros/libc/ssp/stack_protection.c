#include <stdint.h>
#include <stdlib.h>

// We currently use an arbitrary hardcoded 32 or 64 bit number
// TODO: Randomize these numbers during boot
#if UINT32_MAX == UINTPTR_MAX
#define STACK_CHK_GUARD 0x4fe3ab12
#else
#define STACK_CHK_GUARD 0x5abf5891c32bead4
#endif

uintptr_t __stack_chk_guard = STACK_CHK_GUARD;

__attribute__((noreturn)) void __stack_chk_fail(void) {
#if __STDC_HOSTED__
  abort();
#elif __is_balbaros_kernel
  printf("Kernel fail");
  panic("Stack smashing detected");
#endif
}