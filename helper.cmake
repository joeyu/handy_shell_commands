# Debug purpose functions
function(print_target_property tgt prop)
    if (NOT TARGET ${tgt})
        message(WARNING '${tgt}' is NOT a legal TARGET!)
        return ()
    endif ()
    get_target_property(prop_val ${tgt} ${prop})
    message(${tgt}.${prop} == ${prop_val})
endfunction()

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
