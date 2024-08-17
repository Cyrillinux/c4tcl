#!/bin/sh
# the next line restarts using tclsh\
exec tclsh "$0" "$@"
#*****************
#* C4TCL Example *
#*****************
# * Disclaimer of all warranties *
# Under GPL Lisence

lappend auto_path ./lib

package require c4tcl

#***********************
#* C FUNCTIONS
#*
_C_ {
    #ifdef _WIN32
    #define _WIN32_WINNT 0x0500
    #include <windows.h>
    #endif
    #include <stdio.h>
    #include <stdlib.h>
    
/******************
 * exampleAddCmd : function exampleCmd
 */
int exampleAddCmd (ClientData data, Tcl_Interp *interp, int argc, char **argv) {
//  get var values
    int a = (int) atoi(argv[1]);
    int b = (int) atoi(argv[2]);
//  result
    sprintf(interp->result, "%d", a + b);
    return TCL_OK;
}
/******************
 * Main entry point
 */
int libc4tcl_main (Tcl_Interp *interp, int argc, char **argv) {
    //  example Add Command
    Tcl_CreateCommand(interp, "example_add", (Tcl_CmdProc *) exampleAddCmd, NULL, NULL);
    return TCL_OK;
}

#    //END _C_ FUNCTIONS SECTION
} "$argv0 $argv" example -I./include


# TRY

puts [example_add 1 2]

