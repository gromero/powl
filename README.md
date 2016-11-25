Usage:

```
make
make view # to view difference between used symbols
```

On POWER8:
```
$ ./powl_26 ; ./powl_27
26
2.700000e+01
```

On x64:
```
$ ./powl_26 ; ./powl_27
27
2.700000e+01
```

No difference on x64, but on POWER8 the cast code adds, where __fixtfdi is the culprit:
```
__fixtfdi
__fixdfdi
__fixsfdi
__fixunsdfsi
__fixunssfsi
__floatditf
__floatunditf
__floatdidf
__floatundidf
__floatdisf
__floatundisf
__fixunstfdi
```
Actually this is indeed due to the soft double-dobue emulation. In that case two
float registers (f1, f2, etc) will keep the long double value. Question remains
on why powl() return a value slightly below 27, that when casted yields 26 and
not 27. One options is to use new `__float128` type that use VSX instructions or
use `-mlong-double-64`.

Thus after adding `-mlong-double-64`:
```
$ ./powl_26 ; ./powl_27
27
2.700000e+01
```

A excellent reference is Meissner's [wiki](https://gcc.gnu.org/wiki/Ieee128PowerPC).
