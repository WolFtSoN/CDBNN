// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 12:28:54 2025
// Host        : u200-station running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/user/workspace/SiMRA-DRAM/DRAM-Bender/projects/U200/U200.srcs/sources_1/ip/pr_read_mem/pr_read_mem_sim_netlist.v
// Design      : pr_read_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pr_read_mem,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module pr_read_mem
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [63:0]dina;
  wire [63:0]douta;
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
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.931282 mW" *) 
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
  (* C_INIT_FILE = "pr_read_mem.mem" *) 
  (* C_INIT_FILE_NAME = "pr_read_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  pr_read_mem_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31472)
`pragma protect data_block
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
vLXMHQI0Vug=
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
