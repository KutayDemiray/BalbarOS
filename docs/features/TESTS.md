# Tests

## Testing Capabilities
* `libtest`, which contains all available tests.
    * Issue: Add a good way to choose whether or not to run tests. Currently it works with manual preprocessor definitions.
    * Issue: Cannot link libk (or other libraries) to tests using a regular `-libk` argument to the compiler.
        * Current workaround is to add the necessary `.o` files to `libtest.a` (check the Makefile), but this is horrible and should be fixed ASAP

Below is a list of tests available in the `libtest` library.

## C Library Implementation
* Stack smashing protector
    * Not working quite as expected