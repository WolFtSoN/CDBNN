// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 14:32:38 2025
// Host        : u200-station running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ scratchpad_sim_netlist.v
// Design      : scratchpad
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "scratchpad,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29744)
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
