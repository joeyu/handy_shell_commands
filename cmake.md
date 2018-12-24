# `cmake` tips

Functions list below can be got from [here](./helper.cmake)

## Getting help information on property
The following `cmake` shell command gets help information on `property`:
```
$ cmake --help-property "CXX_STANDARD"
```
And, `cmake --help-property-list` gives all property names.


## Printing property value(s) of a target
The following function prints the value of property `prop` of target `tgt`:
```
function(print_target_property tgt prop)
    if (NOT TARGET ${tgt})
        message(WARNING '${tgt}' is NOT a legal TARGET!)
        return ()
    endif ()
    get_target_property(prop_val ${tgt} ${prop})
    message(${tgt}.${prop} == ${prop_val})
endfunction()
```
Refering to [How to print all the properties of a target in cmake?](https://stackoverflow.com/questions/32183975/how-to-print-all-the-properties-of-a-target-in-cmake), The following function prints all properties of target `tgt`:
```
function(print_target_properties tgt)
    if(NOT TARGET ${tgt})
        message(WARNING "There is no target named '${tgt}'")
        return()
    endif()

    # Get all propreties that cmake supports
    execute_process(COMMAND cmake --help-property-list OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)

    # Convert command output into a CMake list
    string(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
    string(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
    # Fix https://stackoverflow.com/questions/32197663/how-can-i-remove-the-the-location-property-may-not-be-read-from-target-error-i
    list(FILTER CMAKE_PROPERTY_LIST EXCLUDE REGEX "^LOCATION|^LOCATION_|_LOCATION$")
    list(REMOVE_DUPLICATES CMAKE_PROPERTY_LIST)
                            
    foreach (prop ${CMAKE_PROPERTY_LIST})
        string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" prop ${prop})

        # message ("Checking ${prop}")
        get_property(propval TARGET ${tgt} PROPERTY ${prop} SET)
        if (propval)
            get_target_property(propval ${tgt} ${prop})
            message ("${tgt}.${prop} == ${propval}")
        endif()
     endforeach(prop)
endfunction(print_target_properties)

```


## Specifying C++ language standard
The following specifies C++11 globally and makes effect on all subsequent targets:
```
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
```

The above doesn't affect CUDA targets, to make effect on CUDA targets,
```
set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CUDA_STANDARD_REQUIRED ON)
```

The following specifies C++11 to the specific target `tgt`:
```
target_compile_features(tgt PUBLIC cxx_std_11)
```

`target_compile_features` works for CUDA target too.


## Adding preprocessor definitions
The following adds preprocessor definitions globally and makes effect on all subsequent targets:
```
add_compile_definitions(VAR1=1 VAR2=2)
```

The following adds preprocessor definitions to the specific target `tgt`:
```
target_compile_definitions(tgt PUBLIC VAR3=3 VAR4=4)
```


## Adding `include` directories
The following adds `include` directories globally and makes effect on all subsequent targets:
```
include_directories(DIR1 DIR2)
```

The following adds `include` directories to the specific target `tgt`:
```
target_include_directories(tgt PUBLIC DIR3 DIR3)
```


## Checking target 64-bit or 32-bit system
```
if (CMAKE_SIZEOF_VOID_P EQUAL 8)

elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)

endif ()
```


## Adding pre/post build commands to target
The following post-build copies file `src1.c` to the CONFIG(e.g. Debug/Release) folder of the binary directory:
```
add_custom_command(TARGET tgt POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_SOURCE_DIR}/src1.c $<TARGET_PROPERTY:tgt,BINARY_DIR>/$<CONFIG>) 
```


## Checking target operating system

[Checking-Platform](https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Checking-Platform)


