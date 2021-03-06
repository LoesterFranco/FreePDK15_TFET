; 15nm FreePDK(TM) Initialization File (.cdsinit)
;
; Copyright (c) 2013-2016 North Carolina State University. All Rights
; Reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are
; met:
; 
; 1. Redistributions of source code must retain the above copyright
; notice, this list of conditions and the following disclaimer.
; 
; 2. Redistributions in binary form must reproduce the above copyright
; notice, this list of conditions and the following disclaimer in the
; documentation and/or other materials provided with the distribution.
; 
; 3. Neither the name of the copyright holder nor the names of its
; contributors may be used to endorse or promote products derived from
; this software without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
; HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

procedure( pdkAppendTechfile( @key (libname "NCSU_TechLib_FreePDK15") )
  prog( (libID techFileID ret )
    printf("Begin pdkAppendTechfile\n")

    filename = strcat( getShellEnvVar( "PDK_DIR" ) "/cdslib/build/cds/FreePDK.tf")
    path = strcat( getShellEnvVar( "PDK_DIR" ) "/cdslib/" libname )
    printf("Loading %L into %L..." filename path )
    techFileID = techOpenTechFile( libname "tech.db" "a" )
    ret = tcLoadTechFile( techFileID filename )
    if( ret == t then
        techSaveTechFile( techFileID )
    else
        printf("ERROR: Aborting tech file compilation...\n" )
        return( nil )
    ) ;if
    printf("Techfile successfully appended.\n")

    ; Update the CDF for the NCSU_Devices_FreePDK45 library
    ;loadi( strcat( getShellEnvVar("PDK_DIR") "/ncsu_basekit/skill/cdf/loadSkill.il"))
    ;logf(LOG_INFO "CDF Data for Devices library successfully updated." )
   
    printf("Finished pdkAppendTechfile")
  ) ;prog
) ;procedure pdkAppendTechfile


procedure( pdkCompileTechfile( @key (libname "NCSU_TechLib_FreePDK15") )
  prog( (libID techFileID ret )
    printf("Begin pdkCompileTechfile\n")

    ret = ddCreateLib( libname strcat( "../../" libname ) )
    if( ret == nil then
        printf("ERROR: Could not create library %L...\n" libname )
        return( nil )
    ) ;if

    filename = strcat( getShellEnvVar( "PDK_DIR" ) "/cdslib/build/cds/FreePDK.tf")
    path = strcat( getShellEnvVar( "PDK_DIR" ) "/cdslib/" libname )
    printf("Loading %L into %L..." filename path )
    techFileID = techOpenTechFile( libname "tech.db" "w" )
    ret = tcLoadTechFile( techFileID filename )
    if( ret == t then
        techSaveTechFile( techFileID )
    else
        printf("ERROR: Aborting tech file compilation...\n" )
        return( nil )
    ) ;if
    printf("Techfile successfully appended.\n")

    ; Update the CDF for the NCSU_Devices_FreePDK45 library
    ;loadi( strcat( getShellEnvVar("PDK_DIR") "/ncsu_basekit/skill/cdf/loadSkill.il"))
    ;logf(LOG_INFO "CDF Data for Devices library successfully updated." )
   
    printf("Finished pdkCompileTechfile")
  ) ;prog
) ;procedure pdkCompileTechfile


