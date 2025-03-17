// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 12:28:55 2025
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
