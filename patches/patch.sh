#!/bin/sh
# Execute this shell script to apply various patches to the Android
# codebase. Be sure to execute the script from the root of the 
# Android codebase (where patch.sh is located).

# CallStack backwards compatibility with SGX binary blob 
# From Chris Simmonds (csimmonds@2net.co.uk)  
cd system/core
patch -p1 < ../../device/ti/beagleboneblack/patches/0001-Fix-CallStack-API.patch
cd ../..

