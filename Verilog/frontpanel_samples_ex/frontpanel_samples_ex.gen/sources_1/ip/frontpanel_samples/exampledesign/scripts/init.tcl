
proc configureAndRunTcl {file deleteTCL} {
    set_property used_in_synthesis false [get_files  $file]
    set_property used_in_implementation false [get_files  $file]
    set_property used_in_simulation false [get_files  $file]
    source [get_files  $file]
    
    # For use when we don't want to include the tcl build script
    # in the end generated example design project. This SHOULD
    # be done with Block Designer projects. The user is recommended
    # to "Export" our generated block design to tcl if required.
    if {$deleteTCL} {
        remove_files [get_files $file]
        return
    }
}

# The original FrontPanel XCI used to generate the example design
# is brought over from the initiator project. We remove this and 
# generate our own below for the Counters example.
remove_files [get_files *.xci]

# Below we source the example project TCL build script. Each example
# design will have one located within their folder.

configureAndRunTcl rtl_counters_project.tcl false


