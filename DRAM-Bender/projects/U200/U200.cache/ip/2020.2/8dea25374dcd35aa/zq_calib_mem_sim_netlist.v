// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 12:28:57 2025
// Host        : u200-station running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zq_calib_mem_sim_netlist.v
// Design      : zq_calib_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "zq_calib_mem,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [5:0]addra;
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
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
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
  (* C_INIT_FILE = "zq_calib_mem.mem" *) 
  (* C_INIT_FILE_NAME = "zq_calib_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
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
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "virtexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31664)
`pragma protect data_block
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
vnaJWaORZ6syteilBtIV7pyyIPLZtMFrJkvU5QM=
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
