
// (c) Copyright(C) 2017 by  Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.

#include "utils/xtlm_cmnhdr.h"
#ifdef XTLM_DLL
#define XTLM_RD_PROTOCOL_CHECKER_EXPORT XTLM_EXPORT
#else
#define XTLM_RD_PROTOCOL_CHECKER_EXPORT XTLM_IMPORT
#endif

#include <sstream>
#include <map>

#include "xtlm_interfaces/xtlm_aximm_initiator_base.h"
#include "xtlm_interfaces/xtlm_aximm_target_base.h"
#include "xtlm_generic_payload/aximm_payload.h"

#include "xtlm_sockets/xtlm_aximm_initiator_socket.h"
#include "xtlm_sockets/xtlm_aximm_target_socket.h"
#include "xtlm_generic_payload/xtlm_aximm_phases.h"

namespace xtlm {

class rd_prot_chkr_imp;
class XTLM_RD_PROTOCOL_CHECKER_EXPORT xtlm_aximm_rd_protocol_checker: public sc_core::sc_module,
		public xtlm_aximm_target_base,
		public xtlm_aximm_initiator_base {
public:
	SC_HAS_PROCESS(xtlm_aximm_rd_protocol_checker);
	xtlm_aximm_rd_protocol_checker(sc_core::sc_module_name, unsigned int width =
			32, xtlm::aximm::granularity = aximm::TRANSACTION);
	tlm::tlm_sync_enum nb_transport_fw(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&);
	tlm::tlm_sync_enum nb_transport_bw(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&);
	~xtlm_aximm_rd_protocol_checker();

	//xtlm target and initiator sockets
	xtlm_aximm_target_socket target_socket;
	xtlm_aximm_initiator_socket initiator_socket;

private:
	void nb_transport_fw_pre_checks(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&);
	void nb_transport_fw_post_checks(aximm_payload&, tlm::tlm_phase&,
			tlm::tlm_phase&, sc_core::sc_time&, tlm::tlm_sync_enum);

	void nb_transport_bw_pre_checks(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&);
	void nb_transport_bw_post_checks(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&, tlm::tlm_sync_enum status);

	void nb_transport_response_checks(aximm_payload&, tlm::tlm_phase&,
			sc_core::sc_time&, const char* txt2, const char* txt3,
			const char* txt4);

	void check_initial_state(aximm_payload& trans, const char* txt2);
	void copy_payload_and_update_state(aximm_payload&);
	void check_trans_not_modified(aximm_payload& trans, const char* txt2);
	void protocol_error(aximm_payload& trans);

private:
	typedef unsigned char uchar_t;
	rd_prot_chkr_imp* imp;
	std::ostringstream txt;
};

} // namespace xtlm


