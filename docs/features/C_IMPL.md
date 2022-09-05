# C Features

## Available Features

* Partial stdlib
    * `abort()`
* Partial stdio
    * `printf()`, `putchar()`, `puts()`
        * `printf()`: Supports strings only, with `\n` and `\t` support 
* Partial string
    * `memcmp()`, `memcpy()`, `memmove()`, `memset()`, `strlen()`
* Stack smashing protector (basic)
    * Known issue: Instead of displaying a proper error message (from kernel panic or abort), the kernel just cannot boot up in case of a stack overflow

## Future Features
* Stack smashing protector
    * Add randomized smash guard
* stdio
    * `printf()` support for other types (regular chars, ints etc.)
* Basically most of the commonly used parts of C