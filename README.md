[![Build Status](https://travis-ci.org/frithnanth/raku-Math-Libgsl-Multiset.svg?branch=master)](https://travis-ci.org/frithnanth/raku-Math-Libgsl-Multiset)

NAME
====

Math::Libgsl::Multiset - An interface to libgsl, the Gnu Scientific Library - Multisets.

SYNOPSIS
========

```perl6
use Math::Libgsl::Multiset;
```

DESCRIPTION
===========

Math::Libgsl::Multiset is an interface to the multiset functions of libgsl, the Gnu Scientific Library.

This package provides both the low-level interface to the C library (Raw) and a more comfortable interface layer for the Raku programmer.

### new(:$n!, :$k!)

### new($n!, $k!)

The constructor accepts two parameters: the total number of elements in the set and the number of elements chosen from the set; the parameters can be passed as Pair-s or as single values. The multiset object is already initialized in lexicographically first multiset, i.e. 0 repeated $k times.

### init(:$start? = TOP)

This method initialize the multiset object and returns **self**. The default is to initialize the object in lexicographically first multiset, but by specifying the optional parameter **$start** as **BOTTOM** the initialization is performed in the lexicographically last multiset, i.e. $n − 1 repeated $k times. TOP and BOTTOM are declared as values of the Starting-point enum.

### copy($src! where * ~~ Math::Libgsl::Combination)

This method copies the multiset **$src** into the current multiset object and returns **self**.

### get(Int $elem! --> Int)

This method returns the multiset value at position **$elem**.

### all(--> Seq)

This method returns a Seq of all the elements of the current multiset.

### size(--> List)

This method returns the (n, k) parameters of the current multiset object.

### is-valid(--> Bool)

This method checks whether the current multiset is valid: the k elements should lie in the range 0 to $n − 1, with each value occurring once at most and in nondecreasing order.

### next()

### prev()

These functions advance or step backwards the multiset and return **self**, useful for method chaining.

### bnext(--> Bool)

### bprev(--> Bool)

These functions advance or step backwards the multiset and return a Bool: **True** if successful or **False** if there's no more multiset to produce.

### write(Str $filename! --> Int)

This method writes the multiset data to a file.

### read(Str $filename! --> Int)

This method reads the multiset data from a file. The multiset must be of the same size of the one to be read.

### fprintf(Str $filename!, Str $format! --> Int)

This method writes the multiset data to a file, using the format specifier.

### fscanf(Str $filename!)

This method reads the multiset data from a file. The multiset must be of the same size of the one to be read.

C Library Documentation
=======================

For more details on libgsl see [https://www.gnu.org/software/gsl/](https://www.gnu.org/software/gsl/). The excellent C Library manual is available here [https://www.gnu.org/software/gsl/doc/html/index.html](https://www.gnu.org/software/gsl/doc/html/index.html), or here [https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf](https://www.gnu.org/software/gsl/doc/latex/gsl-ref.pdf) in PDF format.

Prerequisites
=============

This module requires the libgsl library to be installed. Please follow the instructions below based on your platform:

Debian Linux
------------

    sudo apt install libgsl23 libgsl-dev libgslcblas0

That command will install libgslcblas0 as well, since it's used by the GSL.

Ubuntu 18.04
------------

libgsl23 and libgslcblas0 have a missing symbol on Ubuntu 18.04. I solved the issue installing the Debian Buster version of those three libraries:

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgslcblas0_2.5+dfsg-6_amd64.deb)

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgsl23_2.5+dfsg-6_amd64.deb)

  * [http://http.us.debian.org/debian/pool/main/g/gsl/libgsl-dev_2.5+dfsg-6_amd64.deb](http://http.us.debian.org/debian/pool/main/g/gsl/libgsl-dev_2.5+dfsg-6_amd64.deb)

Installation
============

To install it using zef (a module management tool):

    $ zef install Math::Libgsl::Combination

AUTHOR
======

Fernando Santagata <nando.santagata@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Fernando Santagata

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

