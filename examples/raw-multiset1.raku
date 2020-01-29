#!/usr/bin/env raku

# See "GNU Scientific Library" manual Chapter 11 Multisets, Paragraph 11.7 Examples

use lib 'lib';
use NativeCall;
use Math::Libgsl::Constants;
use Math::Libgsl::Raw::Multiset :ALL;

say "All multisets of {0,1,2,3} by size:";
for ^5 -> $i {
  my $c = gsl_multiset_calloc(4, $i);
  repeat {
    say '{' ~ $c.data[^(gsl_multiset_k($c))] ~ '}';
  }while gsl_multiset_next($c) == GSL_SUCCESS;
  gsl_multiset_free($c);
}
