#-------------------------------------------------------------
# Generated Example Tcl script for IP 'frontpanel_samples' (opalkelly.com:ip:frontpanel:1.0)
#-------------------------------------------------------------

# Set up project params
set_param tcl.statsThreshold 360
set_param board.repoPaths C:/Users/jains/AppData/Roaming/Xilinx/Vivado/2023.2.2/xhub/board_store/xilinx_board_store
# Declare source IP directory
set srcIpDir "c:/Users/jains/OneDrive - UC San Diego/research/IFAT6/IFAT6_PCB/Verilog/IFAT6_PCB/IFAT6_PCB.gen/sources_1/ip/frontpanel_samples"

# Declare xci file location
set srcXciDir "c:/Users/jains/OneDrive - UC San Diego/research/IFAT6/IFAT6_PCB/Verilog/IFAT6_PCB/IFAT6_PCB.srcs/sources_1/ip/frontpanel_samples"

# Create project
puts "INFO: \[open_example_project\] Creating new example project..."
create_project -name frontpanel_samples_ex -force
set_property part xc7a200tfbg484-1 [current_project]
set_property target_language verilog [current_project]
set_property simulator_language MIXED [current_project]
set_property coreContainer.enable false [current_project]
# Set up imports directory
set projDir [get_property DIRECTORY [current_project]]
set importDir [file join $projDir imports]
file mkdir $importDir

set returnCode 0

# Set the repo paths from the original project
puts "INFO: \[open_example_project\] Loading IP Catalog..."
set_property ip_repo_paths [list c:/Users/jains/OneDrive - UC San Diego/research/IFAT6/IFAT6_PCB/Verilog/FrontPanel-Vivado-IP-Dist-v1.0.5] [current_project]
update_ip_catalog

# Set up pre-compilation paths

# Import the original IP (excluding example files)
puts "INFO: \[open_example_project\] Importing original IP ..."
import_ip -files [list [file join $srcIpDir ../../../../IFAT6_PCB.srcs/sources_1/ip/frontpanel_samples/frontpanel_samples.xci]] -name frontpanel_samples
if { $returnCode == 0 } { 
  reset_target {open_example} [get_ips frontpanel_samples]

  # Generate the IP
  proc _filter_supported_targets {targets ip} {
    set res {}
    set all [get_property SUPPORTED_TARGETS $ip]
    foreach target $targets {
      lappend res {*}[lsearch -all -inline -nocase $all $target]
    }
    return $res
  }
  puts "INFO: \[open_example_project\] Generating the example project IP ..."
  generate_target [_filter_supported_targets {instantiation_template synthesis simulation implementation shared_logic} [get_ips frontpanel_samples]] [get_ips frontpanel_samples]
} 

if { $returnCode == 0 } { 
  # Add example synthesis HDL files
  puts "INFO: \[open_example_project\] Adding example synthesis HDL files ..."
  add_files -quiet -copy_to $importDir -fileset [current_fileset] \
  [list [file join $srcIpDir exampledesign/counters.v]]
} 

if { $returnCode == 0 } { 
  # Add example miscellaneous synthesis files
  puts "INFO: \[open_example_project\] Adding example synthesis miscellaneous files ..."
  add_files -quiet -copy_to $importDir -fileset [current_fileset] \
  [list [file join $srcIpDir exampledesign/rtl_counters_project.tcl]] \
  [list [file join $srcIpDir exampledesign/Counters.xfp]]
} 

if { $returnCode == 0 } { 
  # Add example XDC files
  puts "INFO: \[open_example_project\] Adding example XDC files ..."
  add_files -quiet -copy_to $importDir -fileset [current_fileset -constrset] \
  [list [file join $srcIpDir exampledesign/counters_XEM7310MT-A200.xdc]]

} 

  # Set top
  set_property TOP [lindex [find_top] 0] [current_fileset]

if { $returnCode == 0 } { 
  puts "INFO: \[open_example_project\] Sourcing example extension scripts ..."
  # Source script extension file(s)
  puts "INFO: \[open_example_project\] Sourcing extension script: exampledesign/scripts/init.tcl"
  if {[catch {source [file join $srcIpDir exampledesign/scripts/init.tcl]} errMsg]} {
    puts "ERROR: \[open_example_project\] Open Example Project failed: Error encountered while sourcing custom IP example design script: exampledesign/scripts/init.tcl"
    puts "$errMsg"
    error "ERROR: see log file for details."
    incr returnCode
  }
}

if { $returnCode == 0 } { 
  # Update compile order
  update_compile_order -fileset [current_fileset]
  update_compile_order -fileset [current_fileset -simset]
  puts "INFO: \[open_example_project\] Rebuilding top IP..."
  set tfiles [get_files -filter {name=~"*.xci" || name=~"*.bd"}]
  foreach tfile $tfiles {
    if { [lsearch [list_property $tfile] PARENT_COMPOSITE_FILE ] == -1} {
      generate_target all $tfile
    }
  }
  export_ip_user_files -force
} 

if { $returnCode == 0 } { 
  # Versal design: make sure there is a PS BD cell
  set mpart [get_property part [current_project]]
  set fam [get_property C_FAMILY $mpart]
  if { [string compare $fam "versal"] == 0 } {
    set cips_vlnv "xilinx.com:ip:versal_cips:*"
    set psx_vlnv "xilinx.com:ip:psx_wizard:*"
    set ps_vlnv "xilinx.com:ip:ps_wizard:*"
    proc is_supported_by_part {part vlnv} {
      set ipdef [get_ipdefs $vlnv]
      if {$ipdef != ""} {
        set supported_parts [get_property supported_parts $ipdef]
        set supported [expr [string first $part $supported_parts] != -1]
        return $supported
      }
      return 0
    }
    set supports_cips [is_supported_by_part $mpart $cips_vlnv]
    set supports_psx [is_supported_by_part $mpart $psx_vlnv]
    set supports_ps [is_supported_by_part $mpart $ps_vlnv]
    if { $supports_ps || $supports_cips || $supports_psx } {
      set scopedBDs {}
      foreach ip [get_ips] {
        set ipBDList [get_files -quiet -of $ip *.bd]
        if { $ipBDList != {} } { 
           foreach ipBd $ipBDList { 
             lappend scopedBDs $ipBd
          }
        }
      }
      set allBDs [get_files *.bd]
      set bFoundPS 0
      set topBD1 ""
      set topBDNames {}
      foreach bd1 $allBDs {
        set bAlsoInIpBDs 0
        foreach bd2 $scopedBDs {
          if { $bd1 == $bd2 } {
            set bAlsoInIpBDs 1
            break 
          } 
        } 
        if { $bAlsoInIpBDs == 0 } { 
          set fname [file tail $bd1]
          set bUsedInSynth [get_property used_in_synthesis [get_files $fname]]
          if { $bUsedInSynth == 1 } { 
            set rname [file rootname $fname]
            set topBD1 $fname
            lappend topBDNames $rname 
          } 
        } 
      } 
      set PSIPs [get_ips -filter IPDEF=~"*versal_cips*"] 
      set PSIPs [concat $PSIPs [get_ips -filter IPDEF=~"*psx_wizard*"]] 
      set PSIPs [concat $PSIPs [get_ips -filter IPDEF=~"*ps_wizard*"]] 
      foreach PSIP $PSIPs {
        set bBDcontext [ get_property is_bd_context $PSIP ]
        if { $bBDcontext == 1 } { 
          foreach topBD $topBDNames {
            set namelen [string length $topBD]
            if { [string compare -length $namelen $PSIP $topBD] == 0 } {
              set bFoundPS 1 
              break 
            } 
          } 
        } else {
          set bFoundPS 1 
          break 
        } 
      } 
      if { $bFoundPS == 0 } {
        if { $topBD1 == "" } {
          set newname ""
          set bDone 0
          set bdctr 0
          while { $bDone == 0 } {
            set uname "design_${bdctr}"
            set bNotUnique 0
            foreach bdname $topBDNames {
              if { $bdname == $uname } {
                incr bdctr
                set bNotUnique 1
                break
              } 
            } 
            if { $bNotUnique == 0 } {
              set newname $uname
              set bDone 1
            } 
          } 
          puts "INFO: \[open_example_project\] Creating new BD $newname"
          create_bd_design $newname
          puts "INFO: \[open_example_project\] Creating new processing subsystem cell in BD $newname"
          if {$supports_ps} {
            create_bd_cell -type ip -vlnv $ps_vlnv "ps_wizard_0"
          } elseif {$supports_cips} {
            create_bd_cell -type ip -vlnv $cips_vlnv "cips_0"
          } elseif {$supports_psx} {
            create_bd_cell -type ip -vlnv $psx_vlnv "psx_wizard_0"
          }
          set wrapper [make_wrapper -files [get_files ${newname}.bd] -inst_template]
          if { [ catch { add_module_instance -module_name ${newname}_wrapper -inst_name ${newname}_i } msg ] } { 
            puts "DEBUG: \[open_example_project\] add_module_instance error: $msg "
            puts "ERROR: \[open_example_project\] Unable to add ${newname}_wrapper module to top module."
          } 
          puts "INFO: \[open_example_project\] Adding BD wrapper file: $wrapper"
          add_files -norecurse $wrapper 
          update_compile_order -fileset sources_1
          save_bd_design
        } else {
          open_bd_design $topBD1
          puts "INFO: \[open_example_project\] Creating new processing subsystem cell in existing BD $topBD1"
          if {$supports_ps} {
            create_bd_cell -type ip -vlnv $ps_vlnv "ps_wizard_0"
          } elseif {$supports_cips} {
            create_bd_cell -type ip -vlnv $cips_vlnv "cips_0"
          } elseif {$supports_psx} {
            create_bd_cell -type ip -vlnv $psx_vlnv "psx_wizard_0"
          }
          update_compile_order -fileset sources_1
          save_bd_design
        }
      }
    } else {
      puts "INFO: \[open_example_project\] Current part '$mpart' is not supported by versal_cips core, so CIPS will not be added to design if needed."
    }
  }
}
set dfile [file join $srcIpDir oepdone.txt]
if { [ catch { set doneFile [open $dfile w] } ] } {
} else { 
  puts $doneFile "Open Example Project DONE"
  close $doneFile
}
if { $returnCode != 0 } {
  puts "ERROR: \[open_example_project\] Problems were encountered while executing the example design script, please review the log file."
  error "ERROR: See log file for details."
  incr returnCode
} else {
  puts "INFO: \[open_example_project\] Open Example Project completed"
}
