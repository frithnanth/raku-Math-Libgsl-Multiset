use v6;

unit module Math::Libgsl::Raw::Multiset:ver<0.1.0>:auth<zef:FRITH>;

use NativeCall;

constant GSLHELPER = %?RESOURCES<libraries/gslhelper>;

sub LIB {
  run('/sbin/ldconfig', '-p', :chomp, :out).out.slurp(:close).split("\n").grep(/^ \s+ libgsl\.so\. \d+ /).sort.head.comb(/\S+/).head;
}

class gsl_multiset is repr('CStruct') is export {
  has size_t          $.n;
  has size_t          $.k;
  has CArray[size_t]  $.data;
}

# Multiset allocation
sub gsl_multiset_alloc(size_t $n, size_t $k --> gsl_multiset) is native(&LIB) is export(:multimem) { * }
sub gsl_multiset_calloc(size_t $n, size_t $k --> gsl_multiset) is native(&LIB) is export(:multimem) { * }
sub gsl_multiset_init_first(gsl_multiset $c) is native(&LIB) is export(:multimem) { * }
sub gsl_multiset_init_last(gsl_multiset $c) is native(&LIB) is export(:multimem) { * }
sub gsl_multiset_free(gsl_multiset $c) is native(&LIB) is export(:multimem) { * }
sub gsl_multiset_memcpy(gsl_multiset $dest, gsl_multiset $src --> int32) is native(&LIB) is export(:multimem) { * }
# Accessing multiset elements
sub gsl_multiset_get(gsl_multiset $c, size_t $i --> size_t) is native(&LIB) is export(:multiacc) { * }
# Multiset properties
sub gsl_multiset_n(gsl_multiset $c --> size_t) is native(&LIB) is export(:multiprop) { * }
sub gsl_multiset_k(gsl_multiset $c --> size_t) is native(&LIB) is export(:multiprop) { * }
sub gsl_multiset_data(gsl_multiset $c --> Pointer) is native(&LIB) is export(:multiprop) { * }
sub gsl_multiset_valid(gsl_multiset $c --> int32) is native(&LIB) is export(:multiprop) { * }
# Combination functions
sub gsl_multiset_next(gsl_multiset $c --> int32) is native(&LIB) is export(:multifunc) { * }
sub gsl_multiset_prev(gsl_multiset $c --> int32) is native(&LIB) is export(:multifunc) { * }
# Reading and writing multisets
sub mgsl_multiset_fwrite(Str $filename, gsl_multiset $p --> int32) is native(GSLHELPER) is export(:multiio) { * }
sub mgsl_multiset_fread(Str $filename, gsl_multiset $p --> int32) is native(GSLHELPER) is export(:multiio) { * }
sub mgsl_multiset_fprintf(Str $filename, gsl_multiset $p, Str $format --> int32) is native(GSLHELPER) is export(:multiio) { * }
sub mgsl_multiset_fscanf(Str $filename, gsl_multiset $p --> int32) is native(GSLHELPER) is export(:multiio) { * }
