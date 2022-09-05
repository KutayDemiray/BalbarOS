# Build Instructions
Before starting, make sure you have all the dependencies listed [here](https://wiki.osdev.org/Meaty_Skeleton#Dependencies).

1. Install the cross-compiler as instructed in [here](crosscompiler/README.md).
2. Run `./build.sh`.
    * If this does not work, run `./config.sh` and `./headers.sh` (in this order), then try again.
    * (Optional) `./build.sh -j<n>` adds the `-j<n>` flag to internal make calls.
3. Run `./iso.sh`. This will create a disk image.
4. Run `./qemu.sh` to boot the OS in a QEMU environment.
    * You can probably use the disk image with other tools as well, but no guarantees.