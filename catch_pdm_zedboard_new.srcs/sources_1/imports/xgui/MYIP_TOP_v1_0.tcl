# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "RSP_ERROR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RSP_OKAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RSP_RETRY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RSP_SPLIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRN_BUSY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRN_IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRN_NONSEQ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TRN_SEQ" -parent ${Page_0}


}

proc update_PARAM_VALUE.RSP_ERROR { PARAM_VALUE.RSP_ERROR } {
	# Procedure called to update RSP_ERROR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RSP_ERROR { PARAM_VALUE.RSP_ERROR } {
	# Procedure called to validate RSP_ERROR
	return true
}

proc update_PARAM_VALUE.RSP_OKAY { PARAM_VALUE.RSP_OKAY } {
	# Procedure called to update RSP_OKAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RSP_OKAY { PARAM_VALUE.RSP_OKAY } {
	# Procedure called to validate RSP_OKAY
	return true
}

proc update_PARAM_VALUE.RSP_RETRY { PARAM_VALUE.RSP_RETRY } {
	# Procedure called to update RSP_RETRY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RSP_RETRY { PARAM_VALUE.RSP_RETRY } {
	# Procedure called to validate RSP_RETRY
	return true
}

proc update_PARAM_VALUE.RSP_SPLIT { PARAM_VALUE.RSP_SPLIT } {
	# Procedure called to update RSP_SPLIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RSP_SPLIT { PARAM_VALUE.RSP_SPLIT } {
	# Procedure called to validate RSP_SPLIT
	return true
}

proc update_PARAM_VALUE.TRN_BUSY { PARAM_VALUE.TRN_BUSY } {
	# Procedure called to update TRN_BUSY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRN_BUSY { PARAM_VALUE.TRN_BUSY } {
	# Procedure called to validate TRN_BUSY
	return true
}

proc update_PARAM_VALUE.TRN_IDLE { PARAM_VALUE.TRN_IDLE } {
	# Procedure called to update TRN_IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRN_IDLE { PARAM_VALUE.TRN_IDLE } {
	# Procedure called to validate TRN_IDLE
	return true
}

proc update_PARAM_VALUE.TRN_NONSEQ { PARAM_VALUE.TRN_NONSEQ } {
	# Procedure called to update TRN_NONSEQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRN_NONSEQ { PARAM_VALUE.TRN_NONSEQ } {
	# Procedure called to validate TRN_NONSEQ
	return true
}

proc update_PARAM_VALUE.TRN_SEQ { PARAM_VALUE.TRN_SEQ } {
	# Procedure called to update TRN_SEQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TRN_SEQ { PARAM_VALUE.TRN_SEQ } {
	# Procedure called to validate TRN_SEQ
	return true
}


proc update_MODELPARAM_VALUE.TRN_IDLE { MODELPARAM_VALUE.TRN_IDLE PARAM_VALUE.TRN_IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRN_IDLE}] ${MODELPARAM_VALUE.TRN_IDLE}
}

proc update_MODELPARAM_VALUE.TRN_BUSY { MODELPARAM_VALUE.TRN_BUSY PARAM_VALUE.TRN_BUSY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRN_BUSY}] ${MODELPARAM_VALUE.TRN_BUSY}
}

proc update_MODELPARAM_VALUE.TRN_NONSEQ { MODELPARAM_VALUE.TRN_NONSEQ PARAM_VALUE.TRN_NONSEQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRN_NONSEQ}] ${MODELPARAM_VALUE.TRN_NONSEQ}
}

proc update_MODELPARAM_VALUE.TRN_SEQ { MODELPARAM_VALUE.TRN_SEQ PARAM_VALUE.TRN_SEQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TRN_SEQ}] ${MODELPARAM_VALUE.TRN_SEQ}
}

proc update_MODELPARAM_VALUE.RSP_OKAY { MODELPARAM_VALUE.RSP_OKAY PARAM_VALUE.RSP_OKAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RSP_OKAY}] ${MODELPARAM_VALUE.RSP_OKAY}
}

proc update_MODELPARAM_VALUE.RSP_ERROR { MODELPARAM_VALUE.RSP_ERROR PARAM_VALUE.RSP_ERROR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RSP_ERROR}] ${MODELPARAM_VALUE.RSP_ERROR}
}

proc update_MODELPARAM_VALUE.RSP_RETRY { MODELPARAM_VALUE.RSP_RETRY PARAM_VALUE.RSP_RETRY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RSP_RETRY}] ${MODELPARAM_VALUE.RSP_RETRY}
}

proc update_MODELPARAM_VALUE.RSP_SPLIT { MODELPARAM_VALUE.RSP_SPLIT PARAM_VALUE.RSP_SPLIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RSP_SPLIT}] ${MODELPARAM_VALUE.RSP_SPLIT}
}

