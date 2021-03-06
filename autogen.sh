#!/bin/sh

set -e

# Constants
ACLOCAL="aclocal"
AUTOHEADER="autoheader"
AUTOMAKE="automake"
AUTOCONF="autoconf"
LIBTOOLIZE="libtoolize"

if [ "$1" = "clean" ]; then
    # Cleanup
    echo "Cleanup"
    rm -rf m4 .libs autom4te*.cache scripts aclocal.m4 configure config.log config.status config.guess config.sub .deps stamp-h1 depcomp install-sh ltmain.sh missing libtool config.h config.h.in ar-lib
    rm -f *.o *.la *.lo *.slo Makefile.in Makefile
    rm -f libsass/*.o libsass/*.la libsass/*.lo libsass/*.slo libsass/.dirstamp
    exit
fi

echo "Running aclocal"
${ACLOCAL}

echo "Running libtoolize"
${LIBTOOLIZE} -c

echo "Running autoheader"
${AUTOHEADER}

echo "Running automake"
${AUTOMAKE} -a

echo "Running autoconf"
${AUTOCONF}
