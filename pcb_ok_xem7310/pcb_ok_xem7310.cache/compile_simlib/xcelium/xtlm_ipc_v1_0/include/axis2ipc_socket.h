
// (c) Copyright(C) 2013 - 2019 by Xilinx, Inc. All rights reserved.
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
//
#include "ipc_port.h"
#include "axi2ipc_socket.h"

namespace xsc
{
class axis2ipc_socket : public axi2ipc_socket_base<xtlm::axis_payload>
{
public:
	axis2ipc_socket(sc_core::sc_module_name name, std::string ipi_name,
			unsigned int max_out_trans = 1);
	virtual ~axis2ipc_socket();
	SC_HAS_PROCESS(axis2ipc_socket);

protected:
	//For handling response from IPC
	virtual void response_thread() override;

	//!< Method responsible for handling packing of data
	virtual void packetize_and_send() override;

};

using axis_frames = std::vector<std::vector<std::pair<xtlm::axis_payload*, unsigned int> > >;
class axis2ipc_frame_socket: public axi2ipc_socket_base<axis_frames>
{
public:
	axis2ipc_frame_socket(sc_core::sc_module_name name, std::string ipi_name,
			unsigned int max_out_trans = 1);
	virtual ~axis2ipc_frame_socket();
	SC_HAS_PROCESS(axis2ipc_frame_socket);
protected:
	//For handling response from IPC
	virtual void response_thread() override;

	//!< Method responsible for handling packing of data
	virtual void packetize_and_send() override;
private:
	void convert_xtlm_payload_to_ipc_packet(xtlm::axis_payload *xtlm_payload,
			xtlm_ipc::axi_stream_packet *ipc_packet);
	std::vector<char> m_message_buffer;
	std::vector<char> m_header_buffer;
	xtlm_ipc::axi_stream_frames m_axis_ipc_frames; //!< Protobuf payload (IPC payload)
};

}
