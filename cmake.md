# `cmake` tips

## Specifying C++ language standard
The following specifies C++11 globally and makes effect on all subsequent targets.
```
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
```

The following specifies C++11 to the specific target `tgt`:
```
target_compile_features(tgt PUBLIC cxx_std_11)
```
