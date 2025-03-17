// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 11 12:28:53 2025
// Host        : u200-station running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pr_read_mem_sim_netlist.v
// Design      : pr_read_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "pr_read_mem,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31520)
`pragma protect data_block
lmShveIY2RW5CYR85xLkqaTrHxql5fvOWy+pPaPfQQL/nEbrQJXih0JS+hzfeBUiIxH1BsN3DXJS
TDoSwvP1i+dILfg9Qz92lx5R8v4xY4u8Y8ofuu1ZY6rNbcqvZY750xL8HspnQBhX9zX7Bx/TrLb0
5PabozVTsSwJ3W15dOrg36LFNHyU/xmZDm64fSXTnBfwEkAbwASqLhu5O1tvJDjKv4OZOr9Nvgtc
6EH4i11LGZ/aVoW3aq+hq6olAz6NrPbFOtIEpgWPjr4MNW4vJBe24wNt+JqLia91Dx2cIqbkfyE6
a15o13ASO1N8ZUj1dmJbzbAI0CUYJIVVDOArQI1+dgwFC5NeMd+rus630T+nrdtwcw2bJzHOcgLc
Nkw/FmMVt70rSBZ4oO93AZwKsBU/4giLU1sL3YcW9vqZ/coDpwkxasJ+oacEKrm79Rltuq0rohju
gYs8ON1W53bf6zzBwhZXH5UXSLUGzsUdPVRR679ekeic9DYvD/yQEpOHOVXGb5fTk1kAz39APESx
4bSDmup1/bmGPyRHRNCxYw2cGqADCU23OvxS5hxQ50iD/Ww6Do2nRfhmeuQIkUaOqXy6GzzXYX4D
I8bYSb3uEIGlKdL6RNiUccZfTeO02atPpm8mcRF3KwVhSu50F4EFDwBJpuv5Bxx5cZxST86icPTt
oap7wOExK9+pgdxELNEdtS1Wkr2bKkiqE43k4qJnhUWBQIQ3sMyD7xBVDhojo5X4MdE3HUBKh3fv
a7YoQwD4HO1jjPeLZnYw2US7jPFfQe0uMCsf87V0Ev9hr/sbpeX/AZcEDDJoZuSFW8ZF6XE7I88E
x9iEJgZQSDNPWFh+G4bDQotXfL/bmL3WsJfTKFdsH0A/FR0JvSS1Vtn4vbT5M39f4Ms40Ca9Uv00
Uj9I+xMX0dTrXflg/l5G9csLs6QEmYfohg2jjZ35ordsQQU/szPjcna/emg4lf4jhvZtBsSh5ONW
14Tx0IdkkdV9NZhTM/6/l6Y1mxxG2SM5orF/EKhN/dI7VlY7hZmoYBvBSczQz4tty6Al0kv2OOwl
/20ITRZ9wBpzxLaCVqx8YZUNimyB8LqoLpq6jW5CnQ9e2Z6JP3PzAOqp4XwARIGYdFnclliBGb0f
Y0NGWN0vHhRVjpC6UuG917gOM9AwOAVQmtki3z7fsS5UshnGi/rir8i2cMCi/IW9agwsJPdJeZnr
sM7dSKxQL2pzw22RFS+pvpQjxZKWec/crRi1JyQAXw6CzUG9qnjOR3qiokDMnZ4n5aJxk/hlBb8I
mYpmMhh/AcFx+o9BSmn774Sg6QctMKKkYnL8P0GsUQf+AHdo36EepggaEtKdp6lYuoTHc/vFXkZU
AtwO6h2VCAwyH8Juu8pyVBcnT9elHoFj7z1Lt/O6t+vZ3NgEt2/Bzsgb5uclqtslniq6cZWfdmC1
KcQ2vejgKqMk8PtSFmjwcV136Jnsyd2bAeTyAEOHFEPFgwpi0BOlvxH1uP3VhKQHkQrND1GsDZ31
b+JS8D0wJmcU75hOGGzKA9yz8rS67xJ/PpmoXTBr+0qgu17KPZEGZh40WSqRaPt3A54ed0g5pqc/
BYrP22sSudMHSYujldHgA5mDO4e+eRvscXBft9DBWpe1AzHQV3PApXuCWhKibkim1YOcpiZIh7IR
3u4owacjPAtc2UTUln65cXznmao7Vpq1suoPWpMSyOlsd8h6xSdgC2+NrXoUW/qOQ6iamt2WHJIv
SEl8SeMevRyfY01vbuIUk7100vf0hSY3/jAUlMGAcDZOOitCwZgy/5inqiwIlak8baMVAiNHvC/V
tsOXUOARFWZE6M6tsbcbWcskW16qbN5V8ON8SSyRDMd+YcKlMJ06Vfc8zYoRPWGWq1a1zHKLy64e
GzA95qPlL8WhNn7gRPFjaC8xF7wj4Q+BeTHdTTkcC9XTEYQmeLmsTeCd8XTu1cEnO+KYPKSXcADB
n81hM0QxJgs32CdW2zqndLmDWOYrsJsVPoXUywOU7A4YsYQWvHgN/4mrgbYs59CkUKUjmHI6udbd
mp8F/hs84btlpUXFb8+NT8C55+BC2fNveePYlDvyELCivgdkaLJCQxEpcedRPDJ1wy/jQXRCwsoE
wASlySEB5SwQXpHtEfz4b/sf40Wq2IA/4+FNfu9c2yInb1Wq/D9IK7b3sHq8/frXBAsyShgmS4yg
546NCJQP4uG7PC3Gb6StdJkwGP4k+SlE03bcOBtn4jb/U//EneX3b9MB31QV/MUB8xi4nx7cbSV7
35lsTQICGbKEkQDvmeKKo0s7YEuT5oD4WtZ9e+C+3CTiA/wBgXNUmr8GnJ/9UhUHGwoGypwMuPus
p6tg2dV9b6Fx9Iu/wS173NYspxhZK49+jaaqdK/3vdeNlLKGnrF5wM0Mp1VMD02mZbamp4mUCB66
WQrOGfB5vlHH10cMVFSb6V14IGIcSZaanMgrymzu1x7WGtFcUdCjKRsOZqtmWIiLn6nyh6nwnMv+
LHeqGlZ0g01qJgtJDSJFXag2T262wRGcgNDGwIw9O3M9S38to0kZ06/O1apyrrG69EDhJqNis9H4
1PIQ9Svmj7LnjPHrJcRTt2i4qJRIgWYSmOcrgVOKHInfDpcl+udz0CsGzRvnl3Ss4AM8repgMrRK
UWFzuV11RQiMbCMLJ3WlC7FjOKXG5HWLWoMDCJSTipVzyKNFUv4+5s6Ubk2JhcWP/Jb6j8jvIXMm
Q+kyI8sYQaY7PJ0z1cxIXPjCRCfuNQtJS4FMyAnUKrMINkldmUPY4YtKPyA7z9B7vtGEOgXdWMHW
dwH2RIrlAeH0NaBrpn+zVs93bzOiWKrcGlBU9SP/hY5BhsewVOKOQj8HCAjNgxaeb537LUrxUJAY
QTgIV0EJsGpAW+GnwIOH3tmT4b1hz6CwlKL72/VpFdrLqk8lg62rNQ4MUKNMK/ZkpPQA3zdKAGnA
UmBId+g/ZWsAHJuqWT8TRtw26FJovqRovyfE8AmldPs4IUo6ppZdKwUx5Do+EF7XLbznFa3ZWJyA
qHYH1bv15YH++Qix/olaSg3FVfxz5aiVMgNOn9Ete2qdFiLiNou+4dd13enZDjQpogqxKryx3rsi
27GmnXpL0E2mDhyP5cO18bKPhoLGjzg+Ux55MEQDGJh6gfh/uLldf9cRdknue932z/eM4+gPV8UO
a8qIQwOeOijvAIcyqn19alkCI5LAFvSspzoO9g0jUEZjvitZRy4Zh6NJc7ZvJQcdoivID3ET3Tk1
X4JfaEzHAHZ714B6q1mfrdnCPHtQ/g0p05YrdBX7bnG8J52kmny9yl9KrQBEB9O2f7KxTo2WE/K6
Ns1OXxflYGXatJNxm+6fpY1nTjfVJNWqKjuETpUMb4hUocEI5AGa26OxeARa/zISU9ee0pAXnEHQ
vIJXkyMwfXiyQNAQPT/5kelyOTaXRssuaUvoqiTM8CLnyHv+ClzUVjnr6uqsN3EKcFOsN9+qMPOS
EjJkEGo8IagbHW46a3jo/R9S5jJrwkqbBTYlYbXQFH6Cg0U9EWMryf8uchGEi2ObMa4bWMuJNx7Q
qBUycz1jp5Lo6toYtDaWTA0CikAJZGDJPwm8uhX29eWyCfVxSAnHWd/K5ZLLQNeqVbzgyZ4AEG+P
4I4rKAzbbwfAMEYe5BjPmXEcUI34HwhjixVLVD62FDz+M2bHnoBNV1onkOl57tysLMzJ78CE1dN6
EsSpgxoObG+k+rqW6Y3+d81LbfiPKQXDb1V5ouxGfoxCsI1buIUZPmSsgfNXc9cDXhrO8OSiJm94
AwQx4gwNJqsKm9PM20yPzicnqbVe5pWX0iCoPtXsJrknPsI9cc56ziqK0hGvSpYHiMQUl7HtQE1X
mes8gEGv9koJrfSlaxJ05TXFVPlXE2mMf8aXYOCBoGHcr3OekHjogwQxpPwIoQAE+M+4u3dCjMZJ
vOyl7kdErRCmW2gOL3BdRAFqx0oVpA5tpNstrl+J9W+AT5RmxB1K0RabVpGTPEKlw0b72lDyE/9R
ty9iEiCNp3c3sWNsgEdjul2LeS7wlbLGA54I3HiXuugk7vaXdlP7olecSrg28Rjm48/Ysf+E+mzG
SI5oqM8+M40w5VeETvUoiDpGceywQElBhoIlSWv6MKeXrRCYNa0w3dkV9bzxQ7QKV+54lwG96aPp
24pCyz8i3C8CvVWM0fQsv+2WxjbZEYXn2Iq5PMCgG7CdAPMMRvmCDpMFo71vwj8gKplm8q8QVzma
R5hFLVDGnvSntc5vS/1l6V5TJAz1ftpjraoUkMiRs6n/3TwFWx2kV1K5xY/fgZ6ppYKecNGw7deB
+l/sZnLozcbBGxdTDmrf7JWIyKiehlXavlSLZU6JptXFIsRj9IMy80ueaFJJFJbe0kfxMYq/rlAd
6E8LFsp35dDD80lCV8kWHIs607xtOTW4P+ddXOm0+a1M4+7IP5t2kjMqvL52ACdcL0vvQlsE6e/0
+gbKu18sLZxpK/IuBbePeuVGWQJY6CZb+H7Q0P1C+FcEkPs4zb0KtBpcwiZctgiMoi+ht5WWLMuR
BeYjch9lZc8YlDmzMU7F9cqmgqW5Bu+rZnqxDYgu//JTS4wZkotc1sZdexT06C/0xwks3p1+JAvj
Apb3YGi03jwtUnyip9wlPb84j5GukxeLBCscfoAEvmKawHvI7FteBh4Uc6Z2RGWUEsGSYPXnpAQ5
CHYnigK82ksmgmXPpmQuUSZd+r1oEFb+TEb5Ln2m6OW8GQnTav6Y3AEjitIXdyv74yZ46o5Qe2zS
UZrPCS+XOfoSkjyfrmJescUptLqjKdv6jeCXS/+FpT7dW7/NRXt8p1VZ0psnwwX/gS0dP1FSjHER
BXhWfB4C8FGBdfmQRCG+XsBScQxxYILwhYqP4v3UAG7mmEYC64dAD2wS1VSKPrVnkl7iFaM86Eo/
UWQil7WZrhZil1+KeJqdvtY9hoTCAa6j+v06GGTySDNAcanqI8z0NKbthYth43E4d+IvFISvJuPm
X8tgIxMxHAbVmwWsNVVx9dyShs8UYP35tdVIDxjxaId2YA6py9pPVQCfSeIvAoqr/e2eCLmARK0a
XTlHkrIuGRieey7unNATnIzHB2kWZqYL7k6WdDUfj0U6zpe1BJHBVW2tsCwmNZYQl1TmcmmPnAgH
tbB5KPt+zgm0YuJu6Yh47IF1WDFJ3WJWMfHiu0kKvdL855+5I3U1K8Q6XBiDOermG7H+h9Wg3ZT8
ifkaUHQ+JB8wfwCiOY2Ibwyzkg76ZCTkmGT+IcFKaZEqJ4mbHh3W/IQKgcDFXJlx7Ihu+PO1Sk7D
meX8sfnBY+Mp8DTAacwN8sGyMgFWRebsDSaAk6tgnrHw6QfvpCdVJpmKQmJItsmqfY3zcTc3tm3v
FJlz0Hq6E6Rp9jsE7II+ZqC5hp54xw8Qfm9ANN6GrBDiOsZKOIXuo8AIKadnkrFl85xb1kYAeUhV
0sVvD63YFbT6/4VJLLcPRFT/pZJwOn+QR/ecauC00FrsxCS/wXaFKexYCrgSoNosJ14Jt07gARtm
EFcPNz1DR//kk04TFzD5kGw2+MljQU49f/S1dLztHxeBSuqtCmTCYY4QsFOstqHYwUOtj/+yt16E
wo9vY8E9o3HoiupKpp0vhFZkDjIfcv18Aa+FndhjSsi8byclnIYdKZSOEg6uTZSeDZPEmO35y18l
h+ytjIDCGkntaWhMdg0IagWku2aQz0QoANuK6EpZ4H9uWFk71rytuJ1cz9Y+37LaqBb9q7VznQqP
xhc3jnR2qw2+rK9rH4BZGCjXxz0PqiXQuBVDH6h3dHu32QWDHQI03PHXyznA50Dky7/igUEK7gpx
/o2hpFbHw4f5+4i6IllP7uODZVl2Ibn7MtWPC93MGSvOoPTcWSztZfJsTgW78Nm28X2o66QXY4Qk
ApOJWlQx1ZskwohsHYZKpNqwi088OooAl3R7bjwRMyc6EtdV6b4+RY8pyG6rGQVu52DNqNNyIwW2
gV+yqK1Jg4yLSL/z6OUlofaA7HYuzJnqUk163NFRElCAvbBEDAjJ2f/n8KzYXyIhOvpvHKbLHaBd
BztrmotuJeyXdfKZzvltN0YFPR2u4JBXQju6krlLeqUk2ytzRreJfjEGlA29cJMpxkemxvo9CTJn
g1Lpb4fr+WazO6jRThAtT1RoDpLSa2ZxhrT7CCIZRxu4KNFRqIysfpA1b3zTQdKtL74AZDqQ37nK
/lNfjE3wz7fereS0KGN853P3nbwOLBhjvgRi+XiHjepdOtLdwdZjkV6ZMqFcy6vkczBz0OK5nhQd
XwEf81k135hnAkJCT/bFUjsXjy0frohPRoBGXoW0fw3tq9fQW9M2U1slMHwluS8lt1nqXM/gteJh
3IHNcQQ1Mm3bY17zQA6FMuMx0l9FiS3VCDvdXw7+rQX5bs8uxcafq7tZDWzow70tg1HhwNIMIHcN
yoCIi5TYVgGD/sCItWumbs6f4AMoqf4hAd47Bpqs0eVhJ8Obc9nScgUWqd2nQRifp8An6zERPtVP
HdHwhmgyGxpRAFV6Y6/nSfQM7P+MQE2nVroBF7NqwgQHQFu602QHZGzsF8n3SIYS7RhCKvylomrV
4vmg+hhiCIekwjq8JV3xISMojgd2cY8uhOcJYZXMIvzG8Yrz+/hprtRoO1OUhrvE5LpygTy4Yhg2
swquNUma4mbAMDSDezfWFh8CflgoloSKvlbLOypDggs0tlwHJvF9sUu9uqCYvQpU9+0tam6ITV9r
DOwhbuXgtGM8NcM7v95ey50UJTkOymh9Smf3KElpgDYReKD6b/aNEePvhn+OT/PndS0PxoGwOuZr
ENC27vHyOw2GJ2FnlG6cLsm6sTSgG62XbAaK8QzeMhizl9lO5yyxhHRQ7o/jFhrlM8TYTslyMcfR
gF3jlDpyef+40Bx6tG7GRZheTfJsx88fiOzMmUxDm9j2KX4+kBhdZPNZcK/0G67NITR4BHLONFAT
t0StFdZvVeN2aw84zkUa9hWw/ReHJRgqp3bWu1YK+iBbNVRNroJ6t9zIMpdLAepaY/9R9xnB3ep4
8qC2HjZWz0jaU7Ao9rzoPIRqxIJQ4kWfvPz3fkLH40bPPD4Yly63xn+TMOFBgtFxQvgkYf8KhSdK
H4M9WqZ6fiFeAhWfw40coJYJtHxASDsyPzYq3tEvMJV096p2X9VJYC1tfbiO3BqEDHdVqn55XxOH
8yfvFV6H5yKM21CZTGaWhL0qB4j4bkG7C40u45OOba8IaN7sQa/shPsD0zVi+WOqeDsWDj9xunGd
zAPMQ1UBRfFmc78cHzsF88XcrehN8BO3QuDjvAVpolsxhOIaBHS4p0HQ0O/WpdNTnza+9kdvJ+cz
AXrgx3DzAq2Ol0HeJ/QJyXDTRWE19AJsYGBv3FoBOpVlJhCU1IXR8/uFxBPSnuzgqSHhmnCV4aZE
7XCSOKvViQ7kkIh0cSnxxuEjinf/MCsfPSAxoLYL8BPlKp+L29Lcg+iNqk/g63BKq9qOjUpybxuS
rPg9fyDXe8mztnsuDAnzREQGAnM6+DeEAu1h0sAJMFsV8V0Pn55FPsIt7Vyt5SVkXIeErfrjvbxk
QfxNwjb1sYOQs/sSNy30WkbvNG+Hcltu0gq9DSc8+smBgULLYo9JnzCKMwqMWTBNkwYqjl5/YBdc
f9lz2ag9ZwYEv2rs+0nnWpxkLSelGSDeGXRKnWjlUElkxRq30Dk33DGI6lToHh8lP7If7FUtMRiM
r4SWZFRvYkv6TITZOYkEXGuTZCfzCqomEx4DUJXmoaZqhGQTfnehO2yLYYGH1TU7WXty02EyIHIB
GIdAocPgF+TGf3lHfGIGMPc1a0LlgzaWAKYp/lH2OGdfL49PpiMMCJIlp0vLShqCtAfmdM8eN23h
PTomV+CWd66JlOimc/l7ya4+SXbG+lIG3CbFIrL2IcKorLEvA8iwDxyYuGVLHM8/FZxDlhbhoWNw
tQ23pET/qFTx2ZAtInfDREiNIYXSZWue5mS5bR0doAlxtRjTPSMMXas74QzaSCEIHl5GNGqYp0hc
Kmfc9q6/cLjrtbIk9K5pJgG+j2YhSVso5HnqNUrLJqfu41nOL2nP6pWtSIxcwCrYAjJDggyigCww
2CdOxO0O5uo/W12J2MAaq2MeQ2F3RYvfqMJD2aq7EDsAuOvz6BYcZ5/1IUUiJuDk233EIEPsmEs2
V8V7kRCCxpSqoZopBhVf+MgsdULgE0cPSZXTICax3uaMaO/x0J8pU3S4H55DQjCqe3OStOAz7yip
o9EBJX2179BJoCStcC2LGNxW3FAlCMsMU3diPFtnar+QPxxG477S4EayCU/i0UMtZZKbv7fAy71v
R52gJ2YsBJPBeoKuzBnzmrbuxx7NUn/sydgViqAjW1FAX0jdH9VU1jdOoGwrPf7L9p97udoRFhtH
H6XhTfXqxJTYuMfYFiY33K69xilV46HeV95u4tAJTnwfjt8IOgcPkB0iRlbxw5qLUXUVMUcNzrXM
iHSPGM+ZuSVhdQh0n1jR09p0jiB+kOTO9Bg3BFsltay1yAqfln5U45/RsFOFbRUTy6sCJLUXEHUJ
7mRJyUP8PXMhCeG7ROkZxfKeFgHx48EmirZnV+zF4jF3YoSYuUGTt0oD8dLvGPgVjI2U4vWHfYEI
0LRn0E0l8TFY3CnmDbWhpyeS/zZwN0jKEsQeVHsRcvDBzQCIKVXdy4Y3eRKaeZRq7Q0eD0NWMf6K
NrJhoz2wE0lxjEEdnObL/egALbVOcYKCep/oYh5z4HqKL65DmF+HgBoJ0DhTjmVIkIt1OxMybm6N
p8NDT5e1gUW9QqnzXh6BNkDWM6r5R7ZXaENjCFmpyN71gPn+wz8AEzbtrc5X5hEABTk8N5K4LPOY
ZihK8jgCS0LxaqL4Kirw47ohMlGiBSCxuSkzXRIaNIot0iVegcV9g7Lidfw8penN9T/YglSnUD3m
zBKLu9ts3W3eFppMP8aaB2D356TccfpV03x+y+nI1G1USAVElw+Wc8kO/Dk0Bc4QkEMpmp7FT7KO
NETtQclj93aun37nYZedJaihu+jA/KpVO05VHSOAb0BOMXnZYgInzHP4lH7I13FttWLHTAR2wT6+
dYkFlly562kHBoGmmSGkIYNqOaRwQQnjItY6GQCzqukwUtoCLxU5IskRJLFtvuWLyat/YvzNFPtV
SNi4pHs0Ha3di5p7Wawo0ni38JyCOKJS6z/MJBARxQ+AJA0YwREHickYoniTjU8zH7wdKNRopjHH
VNOW3BZrcFY18K9rdT4X1YSmPdecQB7GoJY7sxn50S0O2JStjxsqfIaaVj1fZTPs/ow/dlgz4ZcU
o7oXRl0yLeCNn0koTI8S8CkoprX49rmOiKJEYsHd2vqECymv9ZVd9nSFo2Gu8NQ3kBJ0S4C9Qa+J
rsh4eIco+fHsHZT5+y2cOYXedB0HArfKeHfXnMOE/M7c2jW/XQFZtT2fDgPQx0Wuuxf7f7gYQ0Fz
F0yqNEO9nrgFwCDjsz6sBVhi73ZBewMEN+uAFpMn59VZv2BZdul8L+J3hs1toQrLtyiAfR5nlsK+
v/TSfmvLXoTeXHGpKt3ifNb0LxypacnS9uM+t1DiFvr811NQkoUIC9GXPgAbNRnxug0POkzfKBj6
4+CRAVKuiWEKZ59CV2ujaQ/9NZswA/nVfNS6p821L5331AwaSg2rVJ3hixkvWsEq9dCCm7SDPVty
BiY1xjVj2FrPhKO6wnJxZoP74B7mb2rEm72jeV2b0+TeQB6ebuEOrsA3CzBdFICo4iQewsorYHpZ
DOeKpf21FWXc9jQc43RNlWTNC4ycjV7nmGgt8W+0J+1ZI8JLu/frxRLrZzRAOMn6GwDp7jRqM9lo
OhhR9lipO+FW0MQ10WaISX6NF2iJxvyjEi7HG3VHcScSCBb/fbfrdBG1PFatkGVMk+aezpOqZc5T
AkRJnkvCYyxvMsnwaWtFMCeEjnY+by3xZ7JctOAT6DHA2Z4gYv14mWN0DcitOT60JNDoBKQU5cdp
VcACYx2fsK/cOT81/qZKrAfbvVn00snjqC41RadXW7Dg1wqW01Vnwy35lvy52ihPdtRLaQtUB86C
IjEzVzKUkA3CbCGXEYiH3Qu8lNi7oPax0T4UclSLKJgunE8eOGOIVPWMy1L/jfPX0/Id20CiBHVw
DIlfF01jXU1Ig9N+AepBM5YWDvbBeXZA8uDhhO16ccG+Q9UHkFJshyuoLCnbR6b4qt4SpZobV+YT
HCzKsS/RvkahD96i6DkRByc2giZvSHwtjFl+KZe0sgZWG6MsEguQ6KCp5i2zyjrlcKWx6PtoQ/hK
qKj+BUI8sucZiAMjONeE8NxqIuTB7sGLGPKpYWlXHaNMfKQZEJF9KYd/yu/fkO5dI5nwy1Y3ShaH
ZGqMADqFpM1Qh6t6ULRU9tzSlicrS0iinS/+PVpoXRzkHcKvCYFDaS/+babeXlAzPM886tXkWVHD
bgWRhT8yHd4cG2+XufxFmKCCq0wFETEN7MTNNX7QieQHpuMwyW+35C+iDWYIbfRX+jQ5M5yN/at2
TH5tK/eFHuAstrMH4ZWplcLDiAnXJnaBpKQc6VB4GBqVNaqkvZUqTxwWYZChZE9Y49ksCSj1Iw2w
ifyBBdhhM4jHQLNvFVKVNpdkuAvB5LD+N1j2GGyHz+b/mcj64rEnpHOqVMbFW+vtLUnIqaKACqQV
OeaNP2oJ8fO2DChkq15P4Im2SBnYUs+kZ5djAXMFXOWlxtT5VEtQfpSRDQg7TY81NEyCM/twrqtk
XkRFmpUPcikouzaCegJHDqsxPyq4TGH1lPQJQLtNsAPSmc6g27qTf88HPqUmww11mQCEsBxPbNVQ
ikpqFMUBoh3A036VhY3e0Fh4Nhss2q1lqfQh5Yp+sipX2O6W8f+s9+R1rb0SOaoOnjoPYjQ+5aUe
hID4EXrBIkgZc0vsFerAxl9i2D1HEHsKOew+EM0IY6pHyviH/gmf5CtpPqtaPj+2tGJX/MRGUZC2
FBC2Bw58mOOYArcaboc6JyeTsBCMwVeBY3rTecGuFBoW/O8Ez/cMWaXgQryqmSmFQkujSzLOw5bG
lCuCWGlEyDRrwTgefKs5WzqwDUTN4qHBJY/h7FU2SiYTmXbLWFpsVFycAfj06MuyHoqphM2bAvfu
szr9OgvRLWwASqAOnlmP5Xq83nYdsHSKyNaPE18RH5Bunewt9rKtaiYZR+ZPPCN7ikJ7k/mQ/cn1
v3P6IDg/3QDaNgg+vXG+Xl1KAW6DkKl0/5fM2s22+Pi4JVDaFa8WY2cL27+zBY0/eCBHoEM8wolc
wyWlpNsyGSAXppF3SnQvUtFFvvgNVV6IZYnZjBSCDBAHpq08fceN8OcsvvYZ951HygH/joub/qV9
Zs/gysnKEYTrB5luBs4MqfRXuuuKeKfg3VxJhs2LpsyIj2/yIZP6aNmHuNi6nqN132ki6JFLGcJM
3D9Qw+r0hljOfQWCRrj9YMGo14jIQTmQWzYezIeabRLBLtOzrWlv+frKrAmhyeu1NqQxfwyfZNsD
7VkJpD167JWRqsXzocVZIc5nH71grsl8hNFTZ5Qk8EkLVeFT21yF1+3ounQjFV+9FHnOnlDcNoqP
8uA5UN/Sq9FbqanyuCpBtVyy8YZOGUOL4e0Qo8wNU9LtbDT498wCEUa47tTDRfBsWZ0shLsa4Li/
JDY6r9BAoefFDN0+cZ7NpDx0OhhkiBAt2M2CP5r9G+TTaxNzL4iIi9aJ4prFuLC4E60xNP5HwCZR
V4jOJGSPFwcI5XY1LmgbxO3btqdqzxIPxPsSbbV+EEXFlscZdzhwdq6Sl3EWeTRW98kn6sqWMUeo
RIKiy/8iknmjn81CVUsF18kxIqphelXUVWEOSQDZJ2TcFpsNzO4YWlipcmTjc6OiNWCVffS/Hch+
F7OQd5G0SYrRYsG8jeBuVAcDVSdgKP4nQtI7jRGHiEa5o03PCzgr4CnMDBEAquHJWf0wSuWkS/Bv
+yRja8bQ77yz8vPhulVvZDjuTkzGoap2IqCOp50aquG2ZHum5iYFZsRaPfmXMJrXofdPqpQEvRkE
3T7oanrQ5jS5BFjf6m2zleR9rvxOo2D3pbvhsxuro62pj2rtO96/+6SKI6gTU/ZhOI/ESD2I+f1r
ECjHuyT0cb0Kj5I6sI4Q1+EniJvESUa/KYRm1BHds0e7fxXqzEnHb62HW2ppuqrk/dWydBOZV/jq
MxO87u50+yxPqH4LobInRS8wu8R5194wNasA4Z5ywvxLtbaBsh6AX8/45goQlFSavqrxcSmK2K/l
QCehgV5fcCZjEhv0USZ10oJ+YikSP9dxgTARkRbverPjfQBoNB645cAuBeNzgW7JnkLEeAn74yYZ
tWKexzDoeHvnbq+8dzUNGXdIAEqKGjNWC0cBsHgAQPdZl4ZTqg5C/+cOVfayr3qsDQ9kUONhGYCH
l7PoSKBy+DYmkvFdpB3a0UEYaKJfuiC6CQWgijQ2Leo4QwcV924d9I02XGBbNoAOT1Kxh9NKt8zL
vDpHJeFhm2+2po1QynMc/Ocn0+FEo1cG5Sal2MNfmD5JT5iTKNYJpIriW0PQe2E5CmW+nGOimZW/
sDeyj58IpzwhUKiK3aKQZ6lmHMpaRyHsJgZLN1A8fUXBpL9Hr94WEp/mPXjsT02XX1OWb7npH2Nf
k5G7f5iLUQB6WpZussbWr7jjwc7XbHzu2QZEx9ZKHafPeLqxptcHaX61j+XaOCphzy+9bdntcpAL
w5ZgYcYwKm0BDsvlehwxhXmiu2iso2OKU2xpCXf2QRWLJG0RplpEbbX0waCIl7dS31jpKoblHSt7
6lWk/nj2lQ+JUs7voAZ6jMtpc77mS1sn1JJbir1BeNwT+T5lSkIR/TE2KvYh6DgtpfWK4HUIZhkV
WV5GFzC1OJXud6w65DNMme/0BAinYP2eIFZAQYajA8i563BwaYF0Wbv2FvyNVsyI3ytTMq5bKSpe
RNWzpGOX/sZjI98bHZ7mUCtwHhQQed+77dAyF0G4RXIXK09c1z+UmsKNGk3YU5bUpkRZ8ljM4+3n
gZrvvaNQuuA6uTJddXtivtx5rVx0sh1qFrUBjXVI0lDWYuBYYgspw9/5Saf/pfTT04tFQrrWMWhQ
bpEVTnK+wGsFLEITW77pcy7jlhSh6jkUEhPSNWC97wiaN446gRmyLBeFMJX3hPbfKlR3ww2R1sVV
0roTfxSlY8mX1zKMt061fSQo0anEqHdgusatwCX8osMqfvCwdtpmYEfgkisa9NwLhV+WFXQl1Tdq
AksQfQr6wK/YX1UnAJK57oJCZ0etvw2FOeHfLIrGCQByhEmnDQKWOHyAJnNL/wbh+6M5Uk//Iywy
jrSohTAKjGTXnc/wTuKxKQ5xDVYCAISXfGVxO6iBtU8Ct0J5Qdap2l+J0buK280eQfLu/7jByVuo
RX9Qq9YN7gON99OK0hT8DOgX9owu5AHfYVa48j/uFeHch6bN97hBfFdDAlsxkKq+voebCZPXUsVf
UBv8bOBYtBPOOwezHROQC7rdqtdsMbynTPjdzkcd44kPbIjjd/WJvnTsaP0JxA1bBTfVfUfoQ8Ys
47gnw1F5NeWASFCBIxOOYtmCYdWHSvp7xS7de/ltR5eGVxgDbdiq74xp4Qqcj1m8MdfGj7fOCk58
UV2JIOKV1OljzOqM5bRW91G4VoCyqk2Ee1uqXADmWKlJFd7XqgZMH8F+GY+oX3ikUh168pgVx8UA
wmutJVHebKVVb1yiOtzESQNBRmk9panIp2VGy9pc62V8iFwRbeCiwGz5xw1+oHyRe08/hs/qxdRL
gJ24Ef/WGvP9jYGEFl+ihqrdz0yyRjobst090oPG4GRhXI0WJWUu4teKT86liehzaHU+OuMNMl1A
QxsrQQdHkY1L+tp15NaCfCNcbk/md52xuY7nJp3wpk9hy5wFd8Hvx49VXFc/Bq87q08E2MYtbvYa
XhUCICSd0PNzIAey7cgtYKS8VgquFLUqIhuANosGy2Nn+klj5DNjZNAJQycryJiD73hZMbZcNuGE
YqqjhJgiaaAHIDRvpFwJqw+UxL7K5mUZYzW2Td+bGEX/ISJLmse4g/T3aRElQ0CGuWuLXVU/5EJ7
fgg6d7YxH2yDLJki3EgegT7UH93R8CRHxk+Y/QIF7weP1bsz1aL7j4suqH58PC3NyXfiL8J6Fe2H
EyG7fBaAzJ5aj3qsmFVuRVr7Tf3fHZfZnY1eRpdKTn0FPSX7oMLuWh62SXBg2LPIgZA08IwuhUSb
8t+Zni4JkP4th30rg7orhXuk7huF70JUYiNRMhm0nTykDqLvJrEorOApdcVTek964bbiUpfaGLI/
tSccYBM5wOkvmLNE8Ky5yXaxOjFCN1lSVudZZ3Nwmd9mNSZp8OYbW/BG99tKRK/SaZDkUzCg+aWR
saIpAHCllkMOhwqP0B+SsnU+Whcp4g8K6DuK4O4fCGQQwiGflzZCLxsWNCH8FcJrEeQimtjuF95G
Hw39MVebl8xNYfYTT4mYFQG7R5jCGdydz1r3xveXXZ/QlGKK+yrcSw385fuxMM+3EBzcLscVoA01
z3CMeWbCZLZ+5/hIY6qDJ1XncZa1THwHUfK+6ArgZ7G1axlC6EmXh2y+cKLyqvi/8b9C8Ez/O+tu
AG08xOhT9WRwXMzPIRIwaX69YaNxMjwXfKbMW9B+lsTAKdGJJA585nemzvcb0kwux3EUJjFf7+pc
dZrS9+PXXvUkocAyKZ+IzRJE5Oi8fa248UdZjSfIpOph5XKkzhx8fIcnMdFnjYQ4HgurPeVvZBHq
dbb5HMoUMiXJDYpRHMXPk0AR0PW0KWQZH9q/w+lqxf5WUkSjqBGkWgYROGwWmP4vZDPQhtgw8T8z
bwkjOBbOd2O9oM7Z/rO1CKFzkctkww6AcyJaArBK0wj8fqHTuKLuWs+51dTWqhTPtVrgy6TkqMvX
E5LrJM1K9M5YT0WseXq117Yw33cDC97swmvh2mr4o0AH2n87LxkCLY/2LtNY86hq9PCltGLWPQhh
PLDs6+dC0jtTzFCfSvc6OY7uP1Pb7nQMK68QBNphcH2Ja7oX7SH/0poIjGDfzrJVJ4sbsJ+cXJCD
dsV/8m+raP7sGfE7OYgsccVaUrlHu5SEBmZ5qchr4gmNMIvXh5BUoZcIx/PtjOBXIs46pEL45QF0
keJ9qn4XP9UDAi/3n8DBnBA1O65YnGRWR0xl99XqKNt7Nu2ngTwds6v+eOcr/6NlWCmUZnkuQMvp
a22aClSMnBALV5FOOVTsxiOoLibTgw7UZu2OShKiWOOmCK8XqozaVysH7jyvwDrWYsn0CKl6m8QO
Rbwl30HEvaIJtNaTHNATaJGqWYu9XxEdKaTVP3K/iZq9ILZfXtqSjidzHmi/miWiGHZvjhoYMyIz
QvWXnQbJ+fPJGfmeJXBbva1Jo0bpejj3zvZ15EHDR/DrBqIIVrb4GYr9WghyjemT8j03Zj+NOAXU
FdHqSlPqpcpNtk3iIs8jNKa3EcT4owdpOf2jIabwnvNEG4QW176Z6ngidah36wFWlAWAaZmQ8mmQ
vzMGE22C7ojPDlpB/5qn5Dd9mBSvtSydRy4zrBQl150nQRpW90fXfbsINOjX8u5heyOYcIaf3Mh5
Ic0XI1B785rYAGQqDrMDeaJlLehtc2Oo6SpgxwPdQ8SvWyJQ02kvhkSym3eKfRVqcXQWWrqyfvnh
eWy6ZmexoKG0TqkwNrijhFbvW1Us6vSrernnmh68+nyvNR21nLQeUn4qOcndeplC7I6XI+MiW8jy
ZvAjVjwk4XbON4pVT/jHwaBHPWCOdNWB2IGjwRKMzpKgY9/mChm20zy+xxALs7aZLsdxIDOrZ5NJ
x/z5i7FZ5Pi119Avji9+3AIDeOyFacEIslM+GplDb72wTeay/vuIWnBk7UmEqwfZfK9rfQaJJFjD
z5T6vVKmwgWq/MEN4fWgmNV1bNNqy+WFQH86xAwgcaUpP8BSx6S+A7GBcvnBuoVaAm3hB4VyrY/H
yCKaHqFGYzd0fUxRgivAmN+kNVD3SgnlDR9oMTkRBslWM4xFzkVGh6f0refeQUX0kPkOaifXsZl3
3V/w/qMSSwTuDV2whvSlHuL6ABxZaLL2bVS9c1RHHiCbI71qucnmN2o1BXbarpUoGBQzv8xw4yXx
tYAp+Mzcu6cgoEdtMoBccjRlfctiLjFscMT15yzA4XcGqT3Z+AkUFCv/2/EJWttGJmuwJZ1V9OPk
dPe8I4F9JPe4bcZpFUwHEl3jpfbx9aygLXQYKYHJ+uUVLyk2EzAL97rLfjuFxbtYdFpnn9T9hN1j
JrGWl7wBW+fymbFJZch1/H0fQbM9t+39p8BdBifHUiqqSz1A87XUA2y4sRiqdMQPHzob7bE2R3/H
Uraa6/Pkx3acdpykFF4SESHsoujZu5eUfaXeFDzOpdKvnoMJQdPejtachr6buOPAC5N7sESVgdwh
AmVebuvr+MaN0Qln5BUZGDYm59BqQlXC6Lhh442glF5AMhUwVSit700Jk3BjZxtkM+MIjB7G4q3L
W5l7TpHYptjU5+9mWBFgfxpAbIdqo2uD6Jlo2zQuQ1KhhVAuKtE6MYevNLWAq6ZAG/ZYMpKtldmp
z/uGv01Frf1oNOuH//Ez9xz8yJJzY1Au/5NxqClB+r+fjYP8xhasAFzor5Roc4aj8nj0MIvyaycm
scs7/Q+M2QUiK9IPkSC3BzZ5nuxzSjvOjbfk0kptrzZQymQeVrHghpMX1Mh/EijtvmEKxCrBlOzd
/VOfQhKyRtltW032wh86VgcWu/R+9LGjuTD9luC3KAnvGUryLBWMTviTFXfrHcPlesOL5r5TOWfs
5NS0BTMqOwnanVckAXLzqHYc8Ao09mvXzndqOxCeY6us/Rie8JxpaxEY5mKzD/BsfmXa6PhPkW7v
ONb1Pq5zNJIrMGLCWC5Ib1NgOYqoh1G1KfHFpnnNLLAM8TH9B64/Yt17J8BCMpwfyhIZuxvcmZcw
JeuwJwkUTNk8oxgOvrq4wV/K88Q/vrLmOBgYS4TOJ/DL7sju25cXALIE9cECbP8MfKf5g2+gOUsd
qLiuYcsHD6WKXU3uUIfnniPzX7vXVqNkOxOoG0lYDCQNW6vMGl1Rx8plnIBro8jiFwjFrMP+7Mph
6ZmRI0qdjDhE5rwgndDsdDIlPqGJ8omta2YVirQl152TKCODplEFMV7BA70PC98q/LFM2nKvhux5
9XZA9GeEsep+Z2ez9oB8m97b59rFjZ/Zr/Y8LF7BurBeZn2Rhrj3UGcuEwjHW+ZZ2ZtC7eMRxjod
sr03vusJYLlBYOecHhpAToJMBhNo4Lq0l3WyXjnBJIRdT92rKmlCH/I/W8fF4fFZAUHofq2l96/g
03DfVdk+dCx4VrAms6gHaIxzo9feNZ0wjtXAoo6DsDs959/JWr//Cr+nHlu0rTBYS3W8lz3gfvzk
9y3D0giDsiZiM4yPhAJIHdteDel56QYCmD1qC02n2AyVo1pU0HFgHyeglek26jN+IoOKTEN0eSai
lB029S7WyAqk84rvwRXfOtys9AWhPEmCKzsqkP8nVpDsD7lXVnCzyvwR1SxUNkrQ1QneMVIsYkxA
niEKdFSzOdvwMcdnyOstmxP+91zJxnNt/PvRWv/oquHOqi1yNQdLXYSdcGo8bawX+P/W7Eamuhtk
IObWjqotdWsGE/TN1WUDkkj5TvZjtbw+3294kVRKVWOzu6+4OSUSFDScPumM3uwg2RBltL5YV+ya
jE1vNUd9KhuXwzy0Ew9HpKFfJ65jJX8OY/jU9TFJALa2LylFj1u3xsS4b6ddrYEcUxIXKH3pZj4N
RtFF5gDIq+HKFJWjb2ns5DPxwHqueP4vk5o/fUOTUKP0/nlnkfeeYxEIpfGpWWwDCrMoUzsHHK1e
+V6EfRQSnmw0j9E8c1ukk/hamVFmAlC911hMOJBSqBBppTKyw7kKJ4HzVdeUtSuWPOd/28W3MuB6
O3N8v9CEuQqqDvvwEOwMJpbtj0KSNdt7Jog/c+e/JGOEReHDODwZDbrFLZXCIb/ati7m/aPP/qqz
Eoh5XFBIA/byatPZecvdVi1pVeGyEfVEGEHlSsNblkWQtYanyiaPzmsI7H1a54ZImL4ei0fG8X9x
72QtYQQd8SNDk3zH0OioP7OuxLRMIuIqCE8Vnb2B2UlqbocI1hNM3SHuInNSyJBCzYusVWJOa0Bb
fDreJSruz5JJ7MgRIGRdOoCVU59oM1+bJe04LKtGjwnMWdvKOZ7F6KLSVFGD07+RdtMndu6eFw+g
Oy18uLv5Nr+OlieyVWDyFqKKvwkb/jJYtLJAEyKiC0B3ALpdmSn5sQUQ4ycpKmYkxn3j3VBQLRFX
CSVTy+yJvWjVJ0hXgdXGje5P116YcAw12niKr3v5YIETB3XUzJ5YwljkuwJZWX96NgSh6k+gYo4z
cILY8gVb2IALvdEDpOmoDDW7FCLFVerQ+vpflrtXrdYm64mFdlyyzJi1maO7jc5yC//WLxOH2izs
lFq+jvYWwMGJfrOrtogmlPYtD9gWDr46+ZeK8AECrGS4Q3QNV8+lGiccpXisTWXkvTXlaQK4fmXJ
GKnFiTYEv+w2ekivbHERN8qhw6GFikOMwnNe0FmVqvg3kmSI0f6A4yMFQ0vje8FLa5ituDkhjI3R
a4jRdOfeB28AMUCUeLYoIGA7TH2TN7r0L1rqS1mqcohLAR3X0yjP4W3uasFi+lz54A5D0EQXIlyo
ppbfoYFhexK0DV5QHQUNdoyOGwovEZFEbq2Bv6xyukFSBuEFKzFTXqI9NUT+vmLBnPHoGDbk18KJ
SJytnFqEkGAVkZkgY9oqWvc62FagFNJ1nQG8VNPXuG3aFSlFxUzdLL/KjXjkSS8G3GhKD3FSSrYi
kgv2jhpjQFBFkapyKkJ12cuAvBbyHOj3E3lVkOmtnYL4zniWtsFIWyb3yMHZy1WW/fFhC1stBMPF
2zdl2HMb4tj+dtTDiGfOwlEINRYBq9v8Tv3/t5AnmDkss6a77VMwzIdAKO+XCbGKOLJFXdsyiJht
Fmcgma+PSZ0G9/m+MwXI+iliiodDWdIrkQfHOzMbtr4pXGVn4Rj/IjIGe1aVmgKfV6t2zsv8GtCS
ZNZHd269A6P9xUDwiazJst3xwhH+7jofWjTgMP7myfknApU+p+KzTQ8RCcROStWaaP8PFrt8XU9M
zZGbk8/A+j7Hkg6GzV+fbMLU906oUHz6BAVx1bgaIl24FPAASQ30njZEtFU7IZKBdbmEzSBEQCjE
iefyq/fIRshQUKzA4dqHXp1Z5AtR3mVAn+yDNwY6QzoGFQs3DnJVVBcahwpjIXv878wFvQrCnjpp
YCTMg3kZaEuBIsPjp/tVTajwLz9o8KlM2tDwkWvSz/L6KU1Arj8Y3N3w9bQEGkWjyCDDFcA8f8WJ
AAUV83GfKuvvY+VMcNGTkgEirpTAmwZ92slmx4vMHoEA9fXvuay/yfJdPyRI+g8imPnFqqvPq8qU
3FHddzedKycgpngfpHL5uSA7O2kr5tp4R0vmz89rZ2lOf18a+kRe+OZ1cQK9IUyt/kRkj9bTh1/F
E5vib80zHo8WUDaM8zWD9gmcWKk0gzEAvG3yVIONk5LoVplg+0I/cpzoRh26qsfFSPcaklWzhsGX
LmV5XGKkf7O3CA61nP3z1qpCoQW733EXk77Itc0CjeSfgvnOT2CYdtm1KiExhaC2VjeMP57HiqA1
giRWZzieLD3qQh/mDeUV2HNtr1eZlcUm7XO8mW0ESHeCj1TstJU6d2OlsFgfegkCMN1xeNG6U9he
u0GyIA4tS92SSALR0eRA+K1aj+0eXcspZbK4yK66tJ6528nSbLsMtofVMixW1z/6Ehc+SEHwMjlP
sdTys0U5QgJiDRjHHxkec1NcTd6EowGwlxLKcltke2QndAPJwTyPvrTaH64hmbgOIcBgGlwtDHna
aGbdgerq7WBQ99stai543HXHlAmzMquH2tdTOUARl7UbYkGjpGkYUSGHLxIzXkKAGcYs56kTbWTj
gWrIi5SY9Lo9WjXnpVU3htMiDzY73Z1S8s90QMhEGY4C/YNVJPYUY+pNP9Gv8nXJswwENtJFCMi2
ar8CLXKR28rfvjM+GAWHJMOKlx/AYs02sEaDIK6+whmAyzhA8UceADhD7ClrXKjuDfhJqEwjco5p
vToYP6jAkjAcHHq9DLx3xgo27a7c1m5yDV4EF+XR7bowyUIpYQrs3CyYlD+3t4v4Jd1hg1BjyfJ+
6vsyOv0K+PKK/vXwdOmTocEqpkAohn4iKHKzmjo7FZu2S8sYauAiHeyo2AK4RF2pbF0BXZogW/ze
EPgwGCXe4P4qBoQcqx/czZbqgHilW3Cd0Ovf2+as1WHfndHaGLMwU5xSF3nh+B/wqb71Cccpg47I
vLGLiebXvLhpJDrhCbxLptrKm4sWsdmsFAANkus4b1oZGPV0qizAk5VigLhaoeynpxI603aiBW+q
WVEAU4kd+uJFSUg2RAYE6xnJSubN3GsgfOAaSnWXenKJ/T+9x5QUimy7k5Sqa5MFxglKFZ17Yf3c
8rtYSlCN6H2GCOFX1ch2/TBTHBzZI2rqSHCQT1DMY4aBtaYhqbH6JehqnvDNOy2CLH/b1GcYkVeV
TW248Qru8RsvdmZtePqCxUDCFH5UeREh/jHjiqKvNTI9+zVm+yRzm1YF0hhVsqesnTtW/pHWisTz
ypPgZF/p8EFNLEKdBo0LFkyaKOfWl9GyZjV1InDMWkMBrgpzpzM7699dWnTPDb6Sk7Aa6hz8rgN+
ZGUHGGytJ2ZRZjyIyxo/B+wUuR0zro60BNg7jD/91IVLuzVbCmTf7ITF8bO2y4bwN7f8s5j6ihix
2NCA+v/x43MO7uGxQMoClyxT+2K2KJwk5ZfnPCNGXY4cZMb4wKtOTbRpTgFcSRIkBlWyF2PcrVTz
aGiOKALMf24a6EapGowWGVcJrqf7T+J9tegDdW4aOUeDC7ERa9hTM3K7hmP64HHEpsSm/cgYde/m
OoNNpkUnQbfzbZllFbSANBk3OesqpsVxvZSaam6bdFmWoLYFAM6pzpMbVFuIFCT2GVqItqkYZQIW
R+lIX2gSsy81Q0AHivecXPb6Y22DyXFi1xlESr3MojcSZfAw8opLlVXgusFtpmNSnwog5XMol3wY
SRjBAULjQtRp/OyDXJwYFfhwtcDtBH2EjsFXDoMwuXjbNndf4CIFIdr94AO4A+GQ/MxeF1TGUshO
496B19QdtJa6XLoty9+d1pMW0hKi9IKwuqdAojFgvphqPcYb7t+yv2Qd7iIXW+gixUQqAbP92CVW
qgJ6OLHUmD51KhweQpjjdZRapQxjweb3q9qQ/8XGWs7QZ+Ni5hHcbZ3ds9pyg9qCBMeyOTy6Mzc/
BP694ryDq7E2J/O47RWrIRsEtxIyfrmiulKptLkEu+0X9lvAcXAVF0lJmg+NG+slLCP05mr87Spz
Fp7I/H0j3f5aGo9pur1BddJh2cTbW7X1QmHrnZwZr6bgHtob486Tm3bkamkKjVFFwl0S/4NbdAva
i6uqXAXytZ7BCTTseWfC3iAOVaPnQMEB+OIypBelCDjJleoVtSD7cZwZssRe4fgVSJyHrmKj0YV5
CzRqInLms8HAIgiJ/upguxnuDAeQeaboYho6k2pTXRKsdEe6Ql5EUW0yJXRhilYXOzNzIsP2P8Sg
VuvUOip5yWufIdwkKICWaobEQiztqtjDg5dS4r/2XCchX5bNC83ZqlJkbwNaKsHbF8bSoxJqi0Fd
3OmXO9DFDvbBUyTAwxn0kysSqfYnAhB5ZJfBHFbkLfqZsP8HaObcYUKIdUzxhtKV4nVes1jJ7OPz
Peg74362kGTc96rFm8h6DGageYSE9moJC/XJGsWACHxVq7yKQ8VGk4lurcYc51WWuR+Rr5JFypsx
27pqBbn7Sfke5NiOlh7mydQv+rq5qWIhQ58zvIlqghbiVUK+ZeG6jLSt2lDqMgK0zCptnhN7FfX0
9HbZ5R/d3X2pQ23D5bgXpqRht1g2ft2G6e8K97daw2hmOe1hy3LP1X/eDhRRXGiYBFx5MiFdxznF
kTmC6Wr8ZYtp24HfEL/7tQ9rxmUUCmUr46dYzsM8rDxheZEPe5haZ8y7u4j23VAv67FiAgB3TcIh
hxOdby/fGWcPYKqaOkB5DAHGG2FNyWyzQ9vFqT68ir+QEoOyfWu5srbuwIWm2dlCrYO+R0GgaHHo
pVMUpJ3AakeJcXDZi28l0+LfGTwOvQZWyQzduLhQ44b3NXErZy2dRjGJEJMJbkt+OAavzvGzRXrj
J8P1t+XL+uLXRMyEYlyUvrxFDtLPvilPGzYznJKnoEjA9kqYVBxH5s/UZGB77rlE177s7D5JUyJr
zqAsf/yjBldgMRXWOWqPra2yDbxCcyNDX+/DZGd7oeNT7rr1w1dPN4Ulr0qf8DtkiARojeAgMAPm
xTHa/eghuEqcesBGvExHOzc90yAutO2LLwOt0As3KQ0v9TUprWoC+xJuWjMWUyzqHZL3aQ3s1bs1
aDolIoeunJGfnDJPfchl8+2sS77/GomKkjhS/mXKDt+PcoSpFumMxmPPQ1eJydExikBF+ZG3JoLA
LS8F2d/HkGkOmJENxIl4P+JUkMyQfod23EOe6A3ay076uZueW6o2RV9/P12p+3yO48T+KXIg0Qe0
9lOYlJBlU5siC7tNNFjAOK62EBOhg77NtMPK4qPfgpAwFQjzbiSr2UirNt6BKqCW4ErNn7fg6fMj
U9gsMD5J4UFqSmvtyQ2b8aRH4DAlVf4N5AnIRhWqfFG1TY9dFSAKp/f/pPZOPdA53ITDM72v1nJw
pJEqAznN76pcR2zdqT6XtS40tyaOGXyFXPOstjwOBvRq6m3L8sx5isDyhz8lqHr+h9QzSPiFPKUA
PZG/xOGRrrCPysoKu/79/uulVsarDc6+GLoLFBhbROVpCZnWR6fIYADUerj4NoJ5/5NVoaPw/DTX
Hoi2FOp4Qf5RuT8b9EIj1rDPc+UyqbzgW2M212yEQDGNbKT55HfrRQQ1bbS4lCy+VAjaky5sUbXA
c/AKpuYPVcRCpA4DdsDwcJ4RaFOrzWRj3GdemN6Y+h0tj3AwbMnZeg30DJ0uyG9ML5ku6o2vO6XN
OkavCdmfIsNJkmzXa/VBOnkyG4q4KDlwCv03GrParmThi1KLAhPMoBqm5lTXk42acmcKM65Y+Q5C
QiOT/hxz+ellngugRvD0w/BIlasHpYqgArtjJJ8zydFrR2i6nhjz26NniOy3Gh1gsRGCs0nj0EqH
lIqEbi2KKougxxWLhvNvDL5MnAAYfB0onPTXn1HxvaEjzL/HPqjyE1Dln/Kp99eD1CQ3+DzCoghl
Q+Hcof2SmBgflILJ/NaoL8lsE2XbeKXlbq1ygFQFoxuTkmS93TXpw/7Bj05aqBv0qgPxXi0F82rE
DL8F/y1y4i1u+kady2sg79I3aDTlheFXOOlzWOriNm0Tc9x7FA/FYYAdALi2kJJddhAVwFQ+vpF5
V2zN+C5Zm1LZO6m+9IpLqpDuB6ThHlNOE9cLNik3gF80er0cYeSkRe4+SCKduQNYNzFq4W7LRtoY
gtWL6QfWIQ2bYIvfrdlnVPHe370I6J44v6zUBMErQ/eo5d8jC+maovjIcstyp+7IvoUMK4YVvZvo
XZPsn2GE5qRMP4VfOOi9ofkr/ynTl8w1MX59zk4nFBW7H1zbeVjYtwtVhpR8SmPH3UbKMaCxSHDw
GSiXgHxtjhhwUsgz9MpL1Hlm6+OVWq6nArprXOnc1aYXd6rdH45HP6BAyFVBBCvnq+kQHfAbxEnk
C9gd75Nr2zePRIbXE3LNEckpSiF87JRBFdL4DYl2ArWlkhYwreTeeIX9on4mPwwp1FS0oVTBzJQQ
H1/Ai4LjzrBUlDv7RUXof7MTSFGUUV88mTVQh3gIaV7KVsrfsluPVKGX1r23opWOlr3oYF/dYuSV
nboeWDV7CxrsfS3NUAbnE0LUpIu7rt180tMC4mQBtBMhJ2UpXc5u+y2tyaqw8qNysaMaDzqQVHtU
EXMO5j+BntYjYKbmj7BF7Dw5QlvhHAYJDoqnAi1mAEmMnbmWGVUDnaxFLvo45QkFWes5AMqv9jOc
m7rtGlY0UfGwOwJ4zBO1iPHmdyrcEqGTMsII/euy6kbP1IoELsvp3pvptAtNdLX7dZ5Ce7L3JSR8
HL21Q2wat2vzBA2x5ZZrWaJqmTiPqhoVKMtgsVstcTB/AghkfB9WtvHGaSVvbm1Bn9tl47s/9UJh
R6sSvhkkdLStaOprFQJxj6V8GUqWzuZFA3ThUY7swcQEL2JQwEkF9zkpVeE7c3TD0MUZBH/aIc6e
VSQVbBXP84VFPeO6ozhw/CFtJEn7wEAS9U4U+Qu5G3FxYZubmGxD6D69sELhrO/wVecvytHhUcRE
14bn15Am31vS/kWmEwisBIJTbko5CdlzfsJulRJhRssWBLZ4W+7uZtR0x22RSOAmVddGFgOwfQHZ
Ni3c7r5iXG6hiT86yI6aXyB4kpjbAsQ04h+wUgI5WEz3YpnpM+Xx1yGvstJji73pmesmJqOJz48U
8wfoJ6ZityzCySu/abXkCJk3Zs/6pIb2R372P6CQNT14xzt+sOK6ziZCfCoxV+ifUcKLXJq7XI8O
ORcu33ZsAZH/ous9kuSCxP6hO/ksuTOIEn9//28iNaIQC5/ah+846oAcgxs2BMjL0tL5N77IfNEc
6aCwFK2uKUpuMwk4Avxclt89vPkvDue6kXHckYML2RjqMybuKldrJX7Qk9kqnNcIkn+dG2ErrWlU
s/7S463RWztzb2tNxKgnCwEm92zYS+m4pcfiUwjsSfODxFrQnppPkiBjKMDvrlkIuZFzLmr8Vqib
gLqVeq31/8NnGtyWrJWmJ9mXLCRa3ZsQc+QTgPXfYiBWkWB3p3M1oO3yD4ckZYOIypD4tQhTtkx3
fT64+C22m87UhL6Jn6cguRupcS2pcXtVeEwAED+G+oUvjm3SPTVJKCudC3zlv3hJVi0ol7VmWp/i
7fRUvabGm8nabmbWpkxZOWLA0jfAvkyAPBgSJPUn8dummAQe1eU8S3xnTiWN5LVNChH0YAIQZALn
oyA3SX3dfb3QE+hAOPzITL0Ac4Cfd7dCs1K7MrHqcZZYm8RA83U5DTc0nhAFTcP/4iVGVZXjWArk
FLpoY/eV8Zn1YcPjghyoNxzYxjFkkpFWLNdfzAq7v8GT9cTP6ZXgu81mU7F481J4GKL8P/rAPGow
pRCW+Y8MZsnJ7LFJF4WD/zSU7qHXEHpNKoZ4IlDL49SX2gY4wqtsj89evxhPnDRMrokCaBswsdnr
k1VazsmvCfN4YHOKT1RkmqRCWnE7WobCopQYKCkkl6dGRRUzIvkAjGH4TIUWWuhIvKLxSvdnn7FM
StTUzvzEzwh5Osbnf0Mk5FflqCuMDD5LTG+srdwOfAaQdMb6wMbKwIBmJzVwHbGQZ6KDkzX71ysp
tMR5oP7Jpt3FvgTjQX3RvyaL+AMIAdK6i3+p0W8JpqkAfUW1J92X1F5UYVUM8pXJOfRNj1zcRHE8
YCSFWCPe1QhTBPbOzFz/gRlLxmJ/aIhPij9B3vqRNnA2TTbMQYsifZBXnZqv3FTnR2RXvEntA5TJ
4rXLp4e1niOs7lIWvtcY5NljDgXtevmrMRkzudDByqB+OWwcXxgFisAxUtnbeZpskeQD7gQMIJn2
YpgfMksTrZPfDgBvBuA5+79YWp6TJcnNy6ShNrG3M9Fcy2PSZaZ/jJZuyDu6aVTv9V8eiXNVjkz5
k8bak2qmDQdiAUuOkVMaczfNrzn+zOIgrkRwaiBgIiT7177I7M1yt/SPzX6SsNbkBMdVC9GhpAfs
mdPbPxwuvJA9MFUb1Vi1LJFW0LFR36+llgyMGS/w4O/jui5ZGbNO53uRrHmGS26lApAQ04krV/Cx
HEMT/0J1iq5cQzMI5kOw9OsBY3AFFr7KnVg6nNOsQq3ItpF1M6mvwaUsyc1XQHvWLE04aDLW7cPv
s2PtEzOy1esjOu9F6/tmPiH0UZKv1VmgVIIUbU1ilCU1W/WjnP2dVo/9ou9TIqqZ2Z9q158/gwQ9
gO5TM8x7WDyZIFETXMomb7/c7EYhLEod3NyA/laI6/KQONhS5XzcVp9P3hRhNxIElhRIEd4RgIQr
9LjEXVaqGnX6Yi+YGIiD6+8J9ZSw9ViR6hPjWAw+9/Cy07Td7ELLB3c0sByOAYsuu1r0IPp8Hkvq
yT5YPCG2C0Wph2NxYqAB1lT4KYkM4ADdPSPlta3N0jzMvj/92z2S245qw/Nzn56S2XHzLH6zJk40
Oa1NSfd4f8v32BFKsKiEbeU+esmE9P5jqpSKjp3bCXbYoCngfQsQoBBtSaW822O5PrHfg21CLpbz
Tyt5SxPpX+1NzrfGtW8jtS9+A7iT9W71fij8s22ndHDvjYGzsl7BOHUHNtFayW/ar++AjCbBLDxn
t0+gzTjpOj0NbwS1SFaiNRt00q0dFpjI7ymjV/n8nsztCV3KuFQJczn8br4bV/XWXzkmhXALlsx5
rnWrZVhUcQemTGJHpvkpb74EzBztDgoJq4mSKD8LwmNHQOFOvur7cF7zHGlyEmD8oQAy4LOK34vJ
kZQeNnnIN/pWrmkj4RFtXDQTkwuPgw8agD17gQ9zkxreMYYuy27jZrVGR46LDuQ5HJj4SK7AF7CK
73uGfFH25OJICSDDl9NhPHWFNElb4wE5nQ72kjc15RxyqhEusfBfNiey0JasDTDg1O/P4AZTwHjX
WvRpZJLesr91uwzBHlERb0SOKirSqCq0yVRYSxBSQ9By444ErcJnEGa69S/J92IrHuHYwJ5kQwna
S0rbvko9eVOAuS3qlExfyNZWQUTBmpLtPUns9kJuuxPYcR2TynnnHLIZoqcWH5MmwDwiaLn3Whse
Il3MqSDqoJk/kPISDcBXvgy6vjVYKGcwB+jOWx56t+O3J1tr6TJ8KyxlwTqzpqsFxhTldFWqmYjA
i8Qlb+vtR/yIIRl4u5EakL3HUmP7nqZ7JPsf8j4bNgXIopaUxcC7scAki7nWM/acKa138f+DZ0iP
ixMMzYM8eoPAtpZYRgcq/NvK1l4WDggB1ED7QymIcGHOTj5S+RDYvIR34U+lNC4BfPpj2YelJ26r
2CpptEUVdVV9wc3LXSrLslT827rgTVgk0z0SmmTvX/BI1CQNzsfpP440gc3+C6M4NjZTXPfuDaTa
/AeFECw8jJdVGG6xWnUgJHLxi1etU9UH+dzhcN8srW7XMHQxEoqdHSroF7WTUb1dh3VNjWEZYyye
S2Czs4II5WpfkfZ1GZBgMIDaClp36qzQUNScgx0AVVnEVJYAyyyo1LMbZgbzcf7ttPF0hYnYQGUg
aT5URthz7xvbYS9xRW1gsFr/rigIi7xrAW1B+/GjB4gXzIo+CWpToz/Qi+wvDbBtlenKyQeWifpA
WZDjRtGYjx+XVL8bM/9swSAaE7O0ujSD3msRcalbVTfIiybIpyYS4YCM9nXdtGqtMvkCqNDCKV4c
B6mQ4WiU6epFpkOmYSVIiPLFGKRFQY9qPzDftu/BoSbQy6m1pjd2a7cirbNAyHT3pbcHe5M7DrYd
BnS4WoZ1/uXM6wfNyD2MSCvwAFsr+TB9LjuIkyw/z9mofBJtfkf4QYr460CYqM2CX+NS+Eq3lfHg
kRiEPfzqYtaQhjYMKEnEVytoord3dx+2B4CXoW6ik4U3Jbsqqlu/pYyVXIAGia3JnDcd/zprDALJ
bMX7naCz2L+4tViLEKinBAhb/peB4uvrPgLCHXMKJJpAEDCErH7fkyeLI0iYA2HcIWmTVzwROke5
h9MKD+uDE1q8UZVEMME4nepRMD4q0nwtdaEjd9W0QgKnEXOz+cC5LwqACU6totaAHEVHrEf0W/j0
oc/cP8br94IhluWUDR3Ez1eFg2tnuTU5MKbZ7pCMX9kzcB3Gd7Mj0bg/vMJ743cC7VGk2oL1weWg
QzRuICyLtm1tjP4v7XQgRBe7v9JzJa2e3e9KZlbF9RZtpXMiBplIWfK2uJqMLhxk+/E8oMZbaCRP
do+39dIwKJgPmS0JveOplXbCmcPAvCsjAUx2fmnyQnrv6XR2+ZYdR56+Fy27GRVwqaR/wSgrs9Wa
SDuEB1rMioLdB5lBd2eXO8e6knSMZ6lAS+QPUuGjhUbKNYt7KoT1/t4VECwNlWhTi6A6B0eviIsc
hPfggNsoM5eRbJNLSWpR++u8bE2ExxWvR92LBxWBLDWgslfkxt2z3SW0zg2N4Pn9NGH3RCeZG63b
5x0hsh0vQ8LDBA/dly+dxRjT0Y66u+izKD0tE8tV0Nf3B1U+e8mMrAtgKRYq+uAesDp4QrzC4ZJF
3FncrgxI08ZP0NnQW0iCHLT3XwMErFBKA0sAUnAA0LWcXtKi1IV3VmSqR9VG227P/ui+JHNRW7/g
ROKycVfGLCCVwGuoxYlX0AnJvtHJ+pkpPk5XIyqZ0RHKr0eWvNqc2N9WU30yxvNPXDg14OGmILTe
p6Tj+HwJdTLud49wFD83qL35Yv72rOgvpgcgGnaJR/rQ2LJZFwM0A6kbp/ZJslZtS+Dz1TdtlK4R
9IVmadfSqPbB3UGDsJj9HCKvChkdpCaXqB5kJWKukHFO7OQjs/Gl+uWOc5Xw/nDsklZFSJSYk/9d
WUaV1MJcleKulyp90Xchs1TqyUrK8ZTSmR9QfHfXm3pWjEM0pmYeyFn63K8sdjHheV6xOMMFJkI9
kX4scav9Z5eVQpKcLvxDgNVXRUl5J9pZXG7xm3mvncHeS5E2NrVsavk2IPsUfl4/erVzHxXd4yfa
QfvzoNlU1RC4CoZTEEsKX+rn+KKaUdEqSTo5Aha0tIxxvefapLv7DMCBMDcRVFxcdu7h5sAjyFdT
ax9t1q6UPtbO7XEb5SSNb44iMYf2znWkWpJ4VI1IN9Kxg3qvM3pN1KWK36Z3W1us3T6C5tIw1UYe
0HYecUvV+XOUDjr45f5e3+gX5q1nmRLyidh1j6ZV3Dwyci4PAFDZS8xVQ30wxs1l9aJS7XyqheWm
PkHZYosWiFH1M1izWAdsNp3f83qveRsRrT+WT4lFCZbsvz5cibtEbiVs/f9XhH5a/s4MRkoplDuS
a+Zj4ZC+XVTwz7IgjHHtPu10/42AFSpz+glgnG/DKeolObLFwtpltwYwpeOgPXdjI1AaqN8rHeul
cNVDXisUZvlI3Z5cWR2fWTEFlLuUtO9vIdDudOthSGRvAU53aG12ocGJSWFGShlFHyAh6kQwd3Ie
rq1lNRmODjXfr+jNr7gLJfjMX0wMBfO7XjNl8oUjKdloNWIzkl3G3U/ntsnBcOfCDfxXhMZGTNZd
ms4T+dFS9VSrCIOrC5YXcNl3N7Uis8Ikgrsb5aPhMhOwdUzZ8ybRKZEL63MOnAD7QHZkvETH1i0p
iWIUNX05HKmjdXM2evpBYa9FgwYKoh6sXWpme5RWpbz4c9BHa+Le/4yCjnbEALS7UOpSiAN4Ewgz
BfvhL0mQIvXZM+PdALFCovhYzUYoZ74rDUeV0aWo4R5tavSmGsI7oFRiY6dG3wYliUQdGW3vhBQk
LsINhH12gNMrUlxw50MgQ1QVeRfwPXsSy9G7916T2s+r6MP9BWzgCk/IBu31aPIWnTbHU5tvNrJS
JgZbRW+LYiSuZOD+b1G0DoIkyf+4pI+FZU8JwtR4f7KU5hSX1Vi/uHWuPr4DVuxDrO5Srgqj49NF
3awOz/iZRst6pTfgE1bYxCQDGzTKKUS6c8de7PAkSS08ekI1PhCZ4HYdItz4aPEcCQoqUip2psuO
AnQdlodSG5zru/ECXPehnStSKpe49otffSR7aHJlKbrEyvfc+5pTqq3xYAgHzbReu8BsZkz38iGk
QLR1E3gjUfo18AII2TUd3FOYfE679PqIqjf1FUjrgeVMuhmU6qVK0n24iMm3jlO2Ewo0ItexDO6F
OHyOreGhB3TspINwoLt40etLhZ7onJ2n25sCZ5g/LL7I17CtNHF5mAYy+XAxl00jIlIXtmNeu2e1
GsgbE3sGrwfe+nCx59aZJSW77UCl9RorQiy/ZfqgGFkBCEI8IVXl0qIAqv1ItBOhh4oDPJqh8cIb
5jWvC43MSfoaOygFgsnCxc3LB1PQWJLhLFhO+Gz2Zwx1FR+Js0RjUkF+RNNgp36hhc++bYHJmMRp
wA1CqHZnUf8SsKm8fb7xhCCurpThd8Iwfhk+BSStMFjK4im21WN8VUION6sjWng/aRIAe8w73WDf
dBk20JkxdasjtCHpKnzYAOWjJsrhw4nTobjIzZS4AKrKraX9hE29EgRL4AriC4T5Zms0jSMrmFpy
nwXPNIypgrBUnAdSV7G7dVSgkCF/GkbMHkqG/pEaf23ri9jJOGKkKx4DAAuCbH6g/rNcfrMw/8gK
/DywL39NsVcc/0oYhjxS2J2ACdEmdNWeHZyj/D1mliDDmpxR4pu7deiNg//08pZGeckf103nYUG1
sr4TedcnRiujMWfD5UN3KrlwC86q9E8SQroH3ErEJq0ZfYUMm+dboD69QmP6LuP2hNd+JjpOovJa
VcYrutfH2furfFI/N8pgmvuGeCvvWJ1in/CdmnGDuQl7zYKwxWSs1qoC9HfC05QYvCtuRzJE2gkm
TO+4z40BrMgpDWB3rWh8cpNi98D6EhLQFcHA2WshHnb+XoTuam1iSmfFPA9rgxBhaTi9AZEFEE5Z
aus4rDBO04R5y1ys7qF3Xrvx0e0vXfx2GNoYiIsEquOb70oTRMqV5dc/+Oyz4RLVXv6QGaxVS0ic
zaLzqrNn1Z1GArvEgqussYLskjaF23sUSQVZGtCKxpToRz1DbF6VjtLK+ZKE1I9pLrZYtygNRURR
C1wW5bPdCiS3cNWmUTp6O00VB1fyw3xX1vrv2Fm11YptGGP/gmUwt4ZwAUl7sDy33NRuD/d+AVE4
M55EixDFU1oa1SoYkLfL9dXucUKwzsKRd1/7jsRyDezfcf30zumBicXFbrhWH242MgAwtYTd3jtf
701CJ6wFp5o7uED1GsJq/vO++JsSoRwpAkHVOlSdtX5gVFVGwDSFo4LVuMDuw4Gq69DBj4xPM34f
n0vxdX5DnzgQ1CJGqRqr7UUQvWPsUVn0KyP3cI5O7anE00WR9v7gV193wUPnEiy2embbKkr7RmSc
3kRLOQVHoobMG/bXN1KWbI7L2B7Hap5T3PPyKnKtmywYKCZjwv8r/aIknZOrwSkAO8lJZ9s4htfw
5TF5CAQQm8W8DK0XTL0olIYh1CulWGfpW4Uf/+OUvpvSWpbLo3xcLQzCy3ReLh0f4l1FnKGUQi1a
fc/YGBxeEemkYNRVYZMCQ9Rp8znA1RxLyQDEkaH0WmgY6xURn23A4WKCzJuY4rI2GwTvkMa6hk5h
+nXbz7BWgr19UvNyFJ3a1emD4FdEhS0Hm0vLgequ/g4zGfRcqm+k1HsJPyZ2cMoHaWsGkgkhgaYT
vXcX61vkTWoTEAYcqXtx314kLeWbeL+zPa1mtvE5W0cngnrS/W+8Imp+anTwCW4GY/0HOXfMLCCb
pFqxUU1u3o1qvl/OB9/UKlLbagY/vBAriyo9rA3hLPK/Jkz2wAW//GJFXoQ6ZkskMDmgbrHp/Y4C
BCUkiPazJ9/M3VDa1TGG2qhd9VfDyVDI+pwGvCqESY96wJ8/gVcG1HHIiuty7VAM8hXNP8J1bZdi
4tn9bKMeOl86zJBM1ZRZ8FX6ti2nshnnj9W2khl0MQs/+JnYVoHvs8IHiipFX+Hknmql5qsz0y2/
a5dxHnWdMCxWh6eUJF8kVURrktHx1yRbQs3yoQoHK/pCokgp5Jv9y6GB7PPCUFbMFS3mj6RKmNXh
pUSCfGwaX4SR3m3i3/lbNL6cfz8ok/L5LzItjEvuaDU93mzuuc5pvRRi3yOphYaqwqfgtnCZti0U
W4pYVDu+S+uiCmPgy6LJQiK6UBEgYo4jrdWrsKHbZKdcVMaR6Xu9YK22vmRtrPISYDjGA469uzpc
tgmZTYKiz/Mog/VqqiIcTxk+54SsLz3EqfP7YRtqpifyBqwUm6a1x36Dt1UUrgqOj3DEtzrJ3EPN
TvOa8LToFJqIvML2Sm6+c7gK6n0x8YnHTzAH8TpeTNkQzRAdWnIPX5XCehbtFX2f1Mq8/0rNnI+v
/7BJHk6cEIcZmLFOrfV1PDLPuTvIgFOh3J5EdrO5JR3/z43mejZGDbDIx5fOeH2CUj5/48h1/gTk
0exC+d6+4P/s7OFCuZQQqYsN49bVjTN5KoobZUSs9+6brfl0DsH0t5cGJcSkEEKnhm8RPhMqv0ay
wcOCZFUUvbr7kJpngWtKsS1tyzWRzls9BZh16ZFw7Hs79Le4Ew/0aL55XVnrr/NNEVj0Mp5fDZJ9
WAZt+tSPX6+6GDjJVSYJMgp0xPKcNNAvOFK0lF7oPm8/IFJ0gSqjZo4+HAnewrl5b/I23wkyyEG7
hQyE0LNRyKSKS02JjdoNNzGk6cSlNn9fwsMR/RKUjPS+dk0uxf99rdaQzY/yaiI3ix/gNO4DOC3W
bH+sHbZUIGlEDw2v0DMXXdUsacL1VVIQ5gL4grOUwJBuLLxZGXN1c9XhSRVGhzsaVZZiKtl2kfje
ukmMFd9GsxIfKsydpZbURjmVrXk+r81xIGtQIs0M4PgsQW3D/7CMaS5oJzy1YKEgaxZH93izPwV3
foLfVyyrAtGWve2/T3OJtao99LNOeqqXnDDZm2UgETcknjwY5kWdijsSX4IKglPF4+cjoInjp9Y+
nuOtStm7R3VP/MdBhWvi/VflXML6TUQXuUEOGgLlnq9w5+gMXyCtwlavF26HEs1+1hMRR2fCv3o7
zhiZtB2yGG1IyN+KYro/6O/m0T2upkuIjh+QkojaBwj3FyyVF87F74usQHBTaK7xSioQrD1tn64H
wUG9Zm82x3p8BWhkuYSFMwq2r+sSK32qgl3rmg08AdXqJ0iNeLREosl98q0fDEptEInPdei3VWU0
aHZ6JsZP2q9MjoELCP/oOtI4fxosFOf/Vw0kLpr4IXdiqkNS0f8/DycJi8kbYScSWfBKC/kr1luj
0p500vqdJFl0GU/XkUPrqFdbI1LFhVbpWyylgLL/wybhsw6GXCVEVQYlyXJBABt5b2vvqwbFBaKf
n3KgIF6Gy9fiTQMlymHrE08X6ZWCMBMGon62lwCzt6cW4L9anCs+nBycEd92ZKKNmOfOeIaRZArm
Hpi22V//Tr4b9Y0O2cnET1BdCs99si9aAjYCaxSuJzUq09deLWCs0Dt35uTKOFU9q0MryNQGlBfd
7WIaAHg8HUJTjeCC8rI/rTt1hApk2ffrv5hRFG71fVlLtajmcntJAEFJVnxQYsS/19Mktk4Ja9Bs
j3wRoutT60K9XlQyIvbUNGP0+URpLGTThrkZiKlgB5llJwgVBcrdpO8/eh19qauELfFb+y77bsr+
ZPYY1Jp0yzJl8FgfuXlNGdC3BTY9/hSlNRB+uTdKQ4Deb9x/O5lNOn2aHMDCfYYXeZ+sb6I/BvjG
02doew9x88EJwiQTyBFlaFBPUoT1x+arrbDnixGBX9yJpo7xUkaYZIUvF0ZQFfOyWB4+sbEF7ipr
OklO6ECpBK0wYR/nn8qx+xWLmNLm15d42Rt0Gh1CHn7ynak4iCtJrCTlEeuCFTUJ4euv0qRbhnyu
TtGC+krTAXsdpDHqwETniFnKq5M7PRjNckpMj4cymKXpMqH2k1iiJS0cGfZpp+FBZY4oy2E2dvGx
NU8as13xEzXVXJyjCQSQukDl1Pc393gOywpy92hs6x3dNgZjZn/bpZxrlLUysvOFH4zwyx/SaONp
5uJPLrZ/l8K05erfAgQ9iuz7nuKcskBwkKr+NMaFNhlbs6Et2tXZLZ9ULYDdlv+570W+qEO05wcA
KwHAnZWI99Pe1oW/OapCj2TgRbukIZHgiTTQfY62KVRRTrCkqhCbLhoZByU26uee6UC2nmZSiUmY
86FEDFlAW+wWK6zUXscXKooB0dQ6uPqBGzZNf64Cd4ehfPk7I/BCNBS8DH/NMZkj71+W31sytOKu
TjhpnXU0Ra4IIBG8EKPW/94icBpWtu4NfOOgYVm4am6IFA8WdbWbvPs+ksZh0L8oiJkIWGUfQYC7
5AgeS6g3KCC3EMx3+UsEMCvvBs+c7Rjqc0IVO7Xr+qoTCC3pFvbqTXLKw8FZVcmgiJFaTnuJlj+u
e2e9kg81IniAOf5WNeQqbXRqo1y/nGPMMSHV1QlgCEm6l55akZLsNELlJthgOjZNoSp2hfqczYep
y3cZJQ+idHrYo1eKdZUWhh+/ielpFIUHfq5Nu7zzCd9cPoSO8uRVRS/e2lXatxvh8P7RsNfI4wCI
C1thDJge+DwGif94UO9oRkWqzoui0/8DkoWAu/+v+JoHogFxs4BcUslzc5nzfgcXeoA6stIdDh9H
1Cpty3R7tSID4ITeqlAoFlYc3vdXqzetIo0lqGINtfA7HBXWjZKididfAK4K7bQwpnT0+Qc1SUbQ
gcDjAV9vUDj+qaBHEB4AOdNpj53Ccl++Th9JeEOUbzIh7Haf2omOXZtoqPTD/HI+sB4XCsZqSW/c
/+DOutuGoQu/EZXCfAnWYZG5EZc9sNg8RfdHbRp7eathRyeQ2P5mNYf/M6GkonPWnBuLhiDAcul4
r6Zqr11m8427PzaaQjb/zCxfmo/8hvPPicVd9TRy19KQNcHY5qUKzEiLAX6LRXdRKN/cgccZTutk
lzDkKZGblUlON2MsZbS0lXzfqfQzMTAY0fjswgLwR6zod7mkBZf06tdCv6GyidULzF8JzzN+OAR7
fMFRHtkySN2qFXQsLRKbjF8wXora4ofVP8oqRKKz5vBWP5iBVOonZ0tOjEN5yjd7YEBvq2WYrmpN
yutM6YE6IcMapC66dIzK4w3OEkVGtHTqC396S3dqni7hoRbNTszunlDOaaOxzDowK+kAV9reh4cy
eyjVp/hdFFAEkwVDgotaMs8BJ77nsrJQj+Vhe9TuiyjkCrGdLbzq5tTqq3IvdFIK8FkSx4j2qF5m
P33mtlNq/D6ayDdlFo10bSk8FvWtm93snWzTx3JpEAJrjq1+lmtkvwREGWIpILmXibAMUrXpqGdi
jiQO34Y4EO4c4w8njxYy/un19t6x3wtyH1HYwVipMl8B2Ivo8jDtfU+cQdw+jCzIO+2d+FS75aj3
KV/iNPfFIdhGLtkaaaZy1W3l/7nMQ5x/miqfBSnIJxXIOnfb1a2dyoPNmCFt+IWzPld1TOghtBBr
D5Wk9gVZJ/ZlWUvt0BFBq7r0WOQiznDXQk6u2duX87gVs1dItQOcFMOdJ8cWqUEgQyJhaY/0oukL
1BUa/2pbukGchY4IY4OtjpLczmlbemshFLq6NQlzcYss/+F0oXDWGE/8XENFPy4cfy148X6RyoY6
C0GzTBx77ak5VLuQSms46bdhv942gVAluthbV5xJdsraHm08cfG3gkYMe0KWZQ5fXp9sKj+32jkB
fklZfQKDMFkBkdvTjGB9NV4MtsSY1bxir7/6OgIXa/uNGQ9sRKE2OEiziFK2FhLGkWteptyOKY/7
5albKLfPhBqLWcaKvRps0TYzuvnA962fIxhm6eHdvvXCkSPJ7eQwZ3VNx61xx1cJYQLuYxwsZ22h
6wyDjsHwD4UH+u9mmgkD+hy0+E/nFVczipa4cti9DhR6dSy/kfOJHvPfo2lxeZhAEe1QKXhhovqo
tic2feESEBd5iduG1DPWNXWvKdWPPe3DCzmuedMgU4ZwjqR3W4HmDr9DaNg1pjgrvgUL9+1G/gvl
WhKr9B6DKeM1VN9WuiDyK4MsZW9P7Xp5GuDmi6HusCshe1/2OlUlbKzkJkOaQFkA7By0V4YWhQG8
MN4nNG4sS1JHGOFySLao70MUrHfvOerq3O6rvBn1WhgryviPJzMW/rI8XNjZ/q+BjAWTSPYxt3hy
jeKXGhvnaNn4b7CcAzM1EV9BuTcSubeyxVvLBcYFA1LVjPSLqptEM8yOqhACWF4CjPszoSNZhSfu
V82bJKBw02yI+MjJt9Kv5j94WD535S5JdCVEaVTOUCWC73sGQTgivyiU4dyOqisYNffkF7pgx1n3
7aGRJvOoSkbcljrxovxGtDMKTcKGdpTtTiwXKtdW6lb9Cq6/qpm0JTr6s9cOow5XmO0jIeN6huzh
ZHP9CAH8qkJTASMKfWOBZJJOcYtE+mWiP6sH4FIFEfkZ2EKoAFOzHLVyTzMnfyo+qMYeJajeMji8
FexGHW4cEuD7wKbxTLcZhKCIzZBXYNdLKcFTNjb/vsCcztT6L5iDTwrWHzxaXmAMV0wSL9fQiTPw
5O97HUm11plKmrSm79UwZS6YCJevQQ001z8v1REPXxku3hrOjD2b6glxHs+yvl1P9UKAZv2ti5Ja
azhY7QNYtR23elyjTkbaeGcO8vfJkepx9PM22F7HHlHRhUuLF7JeHR2k+pwTC421hGmtxtImh7tz
0Ci+ehVnNrrYi8cKPx78PJYxk9WOnsZ1B6kbsw9fmCHJNwANkpnmaDAVavorNFMwiVNEHQUVOiq2
SMF8yOG7i0AJ7oi/7wjXfclh5giDYe0e8fpIXM4qByl1jWmFfgAH+y1AOh1Ggk50L8Vmj0dVhD5c
+MxGsv/r5/oOohyQch+BJn7E8qIndZWG0WsI8PTwPaMXnpL/X+ISEylisZYNk0/USLeJWnAzK/23
wmr8F78O2k6KsjvpCZfmBcHesrzOpYm8GsfK5WdUDSjYav40pE3TaJ0avNiRNfXkkQAHvxJ/lVQm
Aku/w6dLTea29iwjTtiATW2u1wHK+rKmcbMbtKW2YNIK/qYcUXK9IZEt/+CkWxsGW6TSfsmiBncf
V6kz90BMUo+UIxsj74xNInJCrwpjc/n5z96BDgm130A8iLpnIAjFOaeYA0+Mc8Uv1MnA/kS1x+dN
s9k/6z/vyYjw80ylxKr3EzBy8jyN9cgIoqbXqlV7iWbF/U6VJ74wFxUtCZDMl7PWjNHxJsAsj5tg
jGZEkYB6Enf4JiCNGsSbcQojbzB+XjhRdZ2JSK2mBhI4zu5gPptwERkjXGgmPcPs8s+zXH7SF590
yS4Y/2Ud6BTvCOeXpC38BesYjKTj9EwjGCCq/6vF+2tleSeNgXPBckfYEeRKNOGgeRXC/7WuaJXu
N330lxk4j8LqeB0331r1fgCpXqqNNiLk5gyH1mCq63WPa6f+tpW+Atat/nzUmvzf9Xk0J8ufAWwG
c3UKgcLlPBKryxBLFsgKYeZ5NiTzL8cA6wIwmVtSKlQ8MpOF7hKBrKSwHIxMR1zX5MTdP275alqb
OjSXEr56KbniEGJLd/Tx39iYW6fXRMZHoCOLpTS9QlBBj7NzePgWTTS2pQrgVRFiuE4jfgTYZ3Rm
qvrGP97B69gyDLTc6ScmsEhup4QqCeRavFn8BxhxaW2MOygmX6IpSXUU/q1Yf1A2gV3Ry1VphO74
m64mshOFXeEjnusXUwc6gWQEsMd6UMpjrbJNfhkN8/QjC++P7SFwNu0ZDMaSvxJt+blO4RlxqZ1l
oafw9N3NhkRHjw8XyDcYPrxf+6ZE7kOnc7nEwB6KIPM72yBwlO5wN5L9p0qFiRYyNiu+9uO3KLWu
6xj5UlUUQfGXmcX9+QkH9/JADi+kxm7lEhX6VHIaVh7zDPdbZuD4xOQh4q/b2wQCqSVHRyQfRLRS
KWE9qFQQ//8sxbIV3kGVuoEXAkY43bYtpipEITLENW4ldcrETWNe02xv9ujzG3kIwk7TfKZu24v/
wA2ihVjzQ+v6Q6lfPqLo4M4Z6oagQPrtNxU+k228tTJNZSkz4bK345FbxCNOyxkycOChhcrNwyHc
Ctdlna2VGNqOTze/uf3aAhxFBy58js8kozLa6RIv60r54EQWtd5sBbM47OeGIrwruJKjh3OJc+2a
FlrJZ0XmKEt0eASRMOqOKLISSf1BnftUAZ+0hSVeCeqcsXz6dp7ZZKG1Cmbs9kjHi9lQjXVuQqfz
O+xcOL1mkMbFgLxEERVmA37AMaNpTOYMMgJ0n7IK9OGbnuhUnYhKNBby/3iEXSWwKg0A2bWIRntx
OT1gFfEi6+3a1sCutD6/8ekryE8vfp6z/vfPPkC4yQx7r/+SCMvkNCAmzLKe9J4FYhkxoW3DD0NH
mkhsv8j5Vd8l64TDRDlvAkxVj6h0RVDZ0UtwNJYIFkWSNNssrwDDFwdPGEVbCVUv9ScdFRTb6myU
pKynMccnk/6nQzHZpSuZvhScfQH90BHewbuiTRDrFLYZM7J+HWNo0UBF6sI2E65nYPuYyA8FlHP1
LxGRmruquEnosY4nugJjgDh5llySbQ/uxkIjmjia66p8WjnkrSf+raCTzp6+TQ6Suj6fyL9jbd0c
3aooeGzKz3bNb6B8yONJxjZkPgn24PzS6i3eVwrrAUcqNt9SK520pp3mQClUFR16EA6/z/0BxQSZ
QfqJLf0M7CTsOR13hUMQLbvIGI9G4Iy0Bp8r/SdnCyCK6IWgc5KEtn4yq9fg1dCf6JP42GRWqogd
0hbzvkD/x7l5BrLdHYIr+BzNLhGJtkHI9V1HfqB5xIIGwrA7LyVFowOrtWorc5SK/tmPPtPrKuIw
QIr+NV0KJXcVDQ7xkcSLPOwX6hAYTLDJFoOm3/Slk3G8YMsZEuZnEwv2wij3OVQjJ7/fUn/diVPf
J+gvVHB4Uyb13wjjopFymEcu8bSt58x/Ze3kfMf9q8iAIkEJTve1KbCIn9XmzoTsjyCuFWlProiu
TR0qVjB41oujN5T7/yj/YBHh79n6KnM8xNFuoBoJ7wL5tBs4EYSSBLrG7qBJ4ZbAfz/E9fuVoqEw
Yl+mIujdYEiyttQArZBSeUiH1i1i2ZnlGaIfEhy57ckJM4iKSzXEmMXDYp9Jvpm7XvqwDtYnGVhU
JzjOybS1VBRpGHWDsGMnILcYLtFavlAkKC2uoETPoPoQPnYv0HbiFOfro3S5O4EIIuKSntC4Veoe
rJcQkKbUE4QPagA5iE8aEd8jDrQmwHm/5Gs849kiRSFLM+0ffwV9PzK1EucWNID4gJctwbIffru4
2pVkFOVR2DOZz3ddsctXnyLlV/RDU1NwuQPLavRoRPmW3EtnUI8oltnw0SunQqt7/EFLhQxs7MOL
c2o2GrRqdyQAPrG4Y21Gw/plhIZKCk72MS0v0LqNPwups7Q2VKoAz5L7d7W/aE8p71gx6TtyK1+T
TzPDlM585S+d2GBmGtc2Dz5CI591rssnQGNZaLa4ZW0RRbO/CkEjifWgAR7LlQxoYvaKcb2JjyDJ
mEd2HoErp1CilUekZyD9GgXqB9eBCrziIH1CCX7xdyEGKAaln/J27qTLw1Jlfvoy5btTnIf98viM
Wq2vnyKbDHXtPV3zKJ3qkA/GbWUoERhjodA0uNN+ql66LRz/WlD/k7PNna3WzbPq3JJYETFtq6Gw
QVemlhYkmQAAI5ur5wfpVz+vgfPeMc2RwPehBfxF+IJ6B7t2QX0IeH0NN0EYNPQaKNgt5QNsWAjO
wfg7vefHl7fDH6XbuTeLmvBO4AlmoNoR1Ovvw7x8yPTwS5Av9rhCtRuBM5hy/HWXGrt/HZElgQdy
YcJXGVJOjNd8DafibOXqD5MQw0LaVX1mZYm8O0J6/lGmANz7Jo98HEWAn5V7LChWRd4bROZcAcLW
z0z7bbTZ7nQugK0n7gh5aZc7H/FLdqK3RfiA7XfmHOz504wnouzECC3+fS0xmpS3qVEek3jcXw2H
KASgm8ZS6XUuDPupq+AdiigZTwfig1H5Pdn1Z3aquAPyyf2vimuYShShHzt5LGtwStJnkVtVqJNH
rq3jArPEP+K4H81LedscYc4q7AnPkCPQ3xS11q8GI/chkm1wUvR3vir7vUhyJQtGqR14cmx9pr1n
b/uHtmILH7kcaNxy4c//glffyIgU2r+0YHmRJrarFlDfu4LMr49IsefYJzYJSsA60lH6exsHbG0K
YEjXprGtVwDevqYV613kMLSy96tjqyxbWCnOgdPAVW6DDMsa3QqHdF23qK8A3KymxXZ4vuoXsGnX
zJXa5qZfXeKpPqvckz2RAGPVrdModqkeTBoLjfFUYIDwnI4ygoHq70WwwCrJ4mmqA+YkgxgV1lKE
jtFqXdMixBvq1Xn72vEVNEDssUjNMfUaoCMxFDxbQJipE9PkgS70ZHv1sCbjN6KPK9dpk14YzORv
yymQDMAhulr8ZkWiMFJVVGzDzuRy6r8nmt7m0Cv4AOvK9ALhZZsERmzj1qhXxg2j7I8uZ9a4sdxg
kOZlTrgpumsvnhslyLsR0AHIeJCguanYYvOroQZ1vKM4SW0eYwX6ii7NtuwEXHADkmtHeC5ySIXh
qCfESEtBRYNZiLnZtF/sDsSUWyHM4P8QsO6x9IIZyRes415TzMM32WWvE/7hmK1ZYvbpi8FSwgwV
KrI0R4QrZ9RvSrEW88lL/LaxjNLFg99JyDy8AwpTpgoDVyRl2P+G+IPCM2iH3umatDGLmgeADpLU
OBoPN3UNo5s+qnfybJvdZK8zTo6vlGsMqYcJTXeJUBE/IP1DzpG2jAy229F/4Mstkc9ulr1xFFp3
WNZWJ8nVCWWLPVCeRhkWVu6VEuzuupgZe35ZikLEnHHv7US4WQnxeD6vlOKQe9v8mY2eRMlt4ReU
SaVxpaYK7Dh4z6LF4JI6HCKsXA/RB5CEfzo8JFHr87pIYUMuwsINsapfis9IDiGvBnY7VgyFIKWN
D19DFOIa/D13OBj1Xn5DBsY5tMtR1DW8mhmYz6SQwnG0p7Jnd+wjA+dgyUsCHxvF2sRHrRS7cLzU
VkEualjw5mpS4n3Qorn742kllmtkbAJcL5EyxTnuKPcF2PBZ7vPgkYPGojWsjCIcRjvE1XtuROMn
GP4JGPlds8GAj0NMsKZoHPLJqlKwpvQgpi7KLYrugPy5veolfpSv7A3dqfczzpsa4ZV76v+S0g6X
f4nUYs/v5aPmhWakGW+MEXW8jJPTN0TuzXePa+iiPFHx7lMIRamQOTkn6Z04qC/J8HwHxknRnilB
zkH2Wpe1RLVl2OX/cxECAbS2ZJFXR56ZzYbhN0D/QqjZmAa7eY0zxU4pFaWNzpK0NyphCpL0CjwB
/VGUGB8oMZiy9cGqTSINVdAxLTcDqnYrUaFPjdLiwIlj29NDLZWqGhCt24d72zzIkfqkGkEv4TAq
aUyR3X2eqbkET3/zLVzLwsbg1BQRwINENx2C76FSOPj/mPbPHUa9MN0/WusZ78kp4qHUued4lj2W
VcC4j9NjHYJ9EQp7JhEvIJBpDZvMWlccB4F/vHzl1j/jcr58TnISoDyRCS9tFeE4X2p5psEFTQOy
U2vxQyGKtfYDRa/umLjE2BKCUvqNi2sdyIKmTVSFj1nure5Qt2qAp9SheiYnH+ZIFWPD7C4O4BZP
4G4MyozGtC9YbymAsgQ5sVZiKRItdlwrMXxzuIh/cwRhh9OYP8BvJUuAB3njdka9mRkwW5vczOPp
cyl5jOjcsgdcV5G31GasjNi40dRFv18f3R63DzCT6SNf8GqlcSRbSKL8v3f2FhNioloruPFX+P2y
vVY2yccXxhFjQB2AKyR+Wv1A90R2lYDmjolKQM4MUpkua53z7Y6D7DT9c3JtRecXZmOPnnp/foal
z4NUhQDNssq+LbnLS7IKgwnOu7wzGBa3L7/OhqX91Ak+8/axPDqFqs2NpssyczfDuDE4ur6Z0WQf
khWLm6G5NcGDadHz+TM2xJ3nDTpCfT5/l7WuuvfSTVHb9V7H3hpYC8udjEJULgiKuFmPLUTxVNF6
7UOSa1FZoHsWgvImvUHL+VeXtUKMxXkFyUYgkdFIWai9zZsrJivxcmRqsf5VCZMuFHd+FgleYFsF
1ejPLOC7d6wnLnTVMd0TCFeHivSXBk8dJyR3hvRAu3teWy9/d/GjmsGakBGA9fq1uMaZ0fWrwos=
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
