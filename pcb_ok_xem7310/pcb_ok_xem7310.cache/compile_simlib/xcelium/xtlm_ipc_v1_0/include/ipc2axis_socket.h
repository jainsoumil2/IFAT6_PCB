
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

#pragma once

#include "ipc2axi_socket.h"
#include "xtlm_ipc_axis.pb.h"

namespace xsc
{
class ipc2axis_socket : public ipc2axi_socket_base<xtlm::axis_payload>
{
public:
	ipc2axis_socket(sc_core::sc_module_name name, std::string ipi_name,
			unsigned int max_out_trans = 1);
	virtual ~ipc2axis_socket();
	SC_HAS_PROCESS(ipc2axis_socket);

	virtual void send_response(xtlm::axis_payload* payload = nullptr) override;
protected:
	virtual void parse_array_and_set_payload_dealy(const unsigned char* buffer,
			unsigned int buffer_len, xtlm::axis_payload* &payload,
			sc_core::sc_time &delay) override;
private:
	xtlm_ipc::axi_stream_packet m_axis_packet;
	xtlm_ipc::axi_stream_resp m_axis_resp;
	xtlm::xtlm_axis_mem_manager m_mem_manager;
	unsigned char* m_axis_resp_buffer;
	unsigned int m_axis_resp_buffer_len;

};

using axis_frames = std::vector<std::vector<std::pair<xtlm::axis_payload*, unsigned int> > >;
class ipc2axis_frame_socket: public ipc2axi_socket_base< axis_frames >
{
public:
	ipc2axis_frame_socket(sc_core::sc_module_name name, std::string ipi_name,
			unsigned int max_out_trans = 1);
	virtual ~ipc2axis_frame_socket();
	virtual void send_response(axis_frames* frames = nullptr) override;
protected:
	virtual void parse_array_and_set_payload_dealy(const unsigned char* buffer,
			unsigned int buffer_len, axis_frames* &payload,
			sc_core::sc_time &delay) override;
private:
	xtlm::xtlm_axis_mem_manager m_mem_manager;
	xtlm_ipc::axi_stream_frames m_axis_ipc_frames;
	xtlm_ipc::axi_stream_resp m_axis_resp;
	std::vector<char> m_axis_resp_buffer;

	/*!
	 * @brief Function to convert Protobuf payload to xtlm compatible payload
	 * @param
	 * @return returns XTLM axi stream payload
	 */
	std::pair<xtlm::axis_payload*, unsigned int > convert_ipc_payload_to_xtlm_payload(
			const xtlm_ipc::axi_stream_packet ipc_packet);

	axis_frames m_axis_frames; //!< Array to store parsed Payloads
};

}
