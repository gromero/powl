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
