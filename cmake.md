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
## Checking target 64-bit or 32-bit system
```
if (CMAKE_SIZEOF_VOID_P EQUAL 8)

elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)

endif ()
```

## Checking target operating system

[Checking-Platform](https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Checking-Platform)


