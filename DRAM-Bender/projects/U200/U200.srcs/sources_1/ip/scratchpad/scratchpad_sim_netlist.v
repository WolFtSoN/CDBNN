// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 14:32:38 2025
// Host        : u200-station running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/user/workspace/SiMRA-DRAM/DRAM-Bender/projects/U200/U200.srcs/sources_1/ip/scratchpad/scratchpad_sim_netlist.v
// Design      : scratchpad
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "scratchpad,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module scratchpad
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.119075 mW" *) 
  (* C_FAMILY = "virtexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "scratchpad.mem" *) 
  (* C_INIT_FILE_NAME = "scratchpad.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  scratchpad_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29696)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
