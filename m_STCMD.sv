                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
stcmd
15/10/88

Blitter command read state machine

Note - that irc[4] is brought out as the command read cycle request, comcrq

****************************************************************************/

module m_STCMD                                                                  //[00014] MODULE STCMD;
(                                                                               //[00014] MODULE STCMD;

    input    CCLK,                                                              //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    CYCEND,                                                            //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    ICYCEND,                                                           //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    RDCMD,                                                             //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    RESET,                                                             //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    RUN,                                                               //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    input    SRESET,                                                            //[00016] INPUTS	CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET;
    output    LDSAL_0,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDSAL_1,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDSAL_2,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDDAL_0,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDDAL_1,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDDAL_2,                                                          //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDCMPL,                                                           //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDOUTL,                                                           //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    LDMODL,                                                           //[00017] OUTPUTS	LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
    output    COMDN,                                                            //[00018]    COMDN,IRC_4,LDCMDL;
    output    IRC_4,                                                            //[00018]    COMDN,IRC_4,LDCMDL;
    output    LDCMDL                                                            //[00018]    COMDN,IRC_4,LDCMDL;
);                                                                              //[00014] MODULE STCMD;
                                                                                //[00019] LEVEL FUNCTION;
wire CYCENDL;                                                                   //[00024] CYCENDL_(CYCENDL) = N1A(CYCEND);
wire RESETL;                                                                    //[00025] RESETL_(RESETL) = N1B(RESET);
wire SRESETL;                                                                   //[00026] SRESETL_(SRESETL) = N1A(SRESET);
wire RC_3;                                                                      //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);
wire RCL_2;                                                                     //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);
wire RCL_1;                                                                     //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);
wire RCL_0;                                                                     //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);
wire CMDENDL;                                                                   //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);
wire RCL_4;                                                                     //[00032] RC4T0GEN_(RC4T_0) = ND3A(RCL_4,RCL_5,RUN);
wire RCL_5;                                                                     //[00032] RC4T0GEN_(RC4T_0) = ND3A(RCL_4,RCL_5,RUN);
wire RC4T_0;                                                                    //[00032] RC4T0GEN_(RC4T_0) = ND3A(RCL_4,RCL_5,RUN);
wire RC_4;                                                                      //[00033] RC4T1GEN_(RC4T_1) = ND3A(RC_4,RCL_5,CMDENDL);
wire RC4T_1;                                                                    //[00033] RC4T1GEN_(RC4T_1) = ND3A(RC_4,RCL_5,CMDENDL);
wire RC_5;                                                                      //[00034] RC4T2GEN_(RC4T_2) = ND3A(RCL_4,RC_5,RDCMD);
wire RC4T_2;                                                                    //[00034] RC4T2GEN_(RC4T_2) = ND3A(RCL_4,RC_5,RDCMD);
wire RC4T_3;                                                                    //[00035] RC4T3GEN_(RC4T_3) = ND2A(RC_4,CYCENDL);
wire RC5T_0;                                                                    //[00038] RC5T0GEN_(RC5T_0) = ND2A(RCL_4,RC_5);
wire RC5T_1;                                                                    //[00039] RC5T1GEN_(RC5T_1) = ND3A(RC_4,RCL_5,COMDN);
wire RC5T_2;                                                                    //[00040] RC5T2GEN_(RC5T_2) = ND3A(RC_4,RC_5,CYCENDL);
wire IRC_5;                                                                     //[00041] RC5GEN_(IRC_5) = ND3A(RC5T_0,RC5T_1,RC5T_2);
wire RC_0;                                                                      //[00050] IRC1GEN_(IRCT_1) = AO2A(RC_0,RC_1,RCL_0,RCL_1);
wire RC_1;                                                                      //[00050] IRC1GEN_(IRCT_1) = AO2A(RC_0,RC_1,RCL_0,RCL_1);
wire IRCT_1;                                                                    //[00050] IRC1GEN_(IRCT_1) = AO2A(RC_0,RC_1,RCL_0,RCL_1);
wire RCCL_1;                                                                    //[00051] CRC1GEN_(RCCL_1) = ND2A(RC_0,RC_1);
wire RC_2;                                                                      //[00052] CRC2GEN_(RCCL_2) = ND2A(RC_2,RCC_1);
wire RCC_1;                                                                     //[00052] CRC2GEN_(RCCL_2) = ND2A(RC_2,RCC_1);
wire RCCL_2;                                                                    //[00052] CRC2GEN_(RCCL_2) = ND2A(RC_2,RCC_1);
wire RCC_2;                                                                     //[00054] RCC2INV_(RCC_2) = N1A(RCCL_2);
wire IRCT_2;                                                                    //[00055] IRC2GEN_(IRCT_2) = AO2A(RC_2,RCC_1,RCL_2,RCCL_1);
wire RCL_3;                                                                     //[00056] IRC3GEN_(IRCT_3) = AO2A(RC_3,RCC_2,RCL_3,RCCL_2);
wire IRCT_3;                                                                    //[00056] IRC3GEN_(IRCT_3) = AO2A(RC_3,RCC_2,RCL_3,RCCL_2);
wire CNTCLR;                                                                    //[00058] CNTC_0_(CNTCLR) = NR2A(RCL_4,RCL_5);
wire CNTEN;                                                                     //[00059] CNTC_1_(CNTEN) = NR3A(RCL_4,RC_5,CYCENDL);
wire CNTDIS;                                                                    //[00060] CNTC_2_(CNTDIS) = NR3A(RCL_4,RC_5,CYCEND);
wire CNTINL_0;                                                                  //[00062] CNTINL_0_(CNTINL_0) = AO2A(CNTEN,RCL_0,CNTDIS,RC_0);
wire CNTINL_1;                                                                  //[00063] CNTINL_1_(CNTINL_1) = AO2A(CNTEN,IRCT_1,CNTDIS,RC_1);
wire CNTINL_2;                                                                  //[00064] CNTINL_2_(CNTINL_2) = AO2A(CNTEN,IRCT_2,CNTDIS,RC_2);
wire CNTINL_3;                                                                  //[00065] CNTINL_3_(CNTINL_3) = AO2A(CNTEN,IRCT_3,CNTDIS,RC_3);
wire IRC_0;                                                                     //[00066] IRC_0_(IRC_0) = NR2A(CNTCLR,CNTINL_0);
wire IRC_1;                                                                     //[00067] IRC_1_(IRC_1) = NR2A(CNTCLR,CNTINL_1);
wire IRC_2;                                                                     //[00068] IRC_2_(IRC_2) = NR2A(CNTCLR,CNTINL_2);
wire IRC_3;                                                                     //[00069] IRC_3_(IRC_3) = NR2A(CNTCLR,CNTINL_3);
wire ILDSAL_0;                                                                  //[00086] LDSA0T_(ILDSAL_0) = ND6A(RCL_0,RCL_1,RCL_2,RCL_3,RC_4,ICYCEND);
wire ILDSAL_1;                                                                  //[00087] LDSA1T_(ILDSAL_1) = ND5A(RC_0,RCL_1,RCL_2,RCL_3,ICYCEND);
wire ILDSAL_2;                                                                  //[00088] LDSA2T_(ILDSAL_2) = ND5A(RCL_0,RC_1,RCL_2,RCL_3,ICYCEND);
wire LDSATL_0;                                                                  //[00089] LDSALT_0_(LDSATL_0,LDSAT_0) = FD4A(ILDSAL_0,CCLK,RESETL);
wire LDSAT_0;                                                                   //[00089] LDSALT_0_(LDSATL_0,LDSAT_0) = FD4A(ILDSAL_0,CCLK,RESETL);
wire LDSATL_1;                                                                  //[00090] LDSALT_1_(LDSATL_1,LDSAT_1) = FD4A(ILDSAL_1,CCLK,RESETL);
wire LDSAT_1;                                                                   //[00090] LDSALT_1_(LDSATL_1,LDSAT_1) = FD4A(ILDSAL_1,CCLK,RESETL);
wire LDSATL_2;                                                                  //[00091] LDSALT_2_(LDSATL_2,LDSAT_2) = FD4A(ILDSAL_2,CCLK,RESETL);
wire LDSAT_2;                                                                   //[00091] LDSALT_2_(LDSATL_2,LDSAT_2) = FD4A(ILDSAL_2,CCLK,RESETL);
wire ILDDAL_0;                                                                  //[00098] LDDA0T_(ILDDAL_0) = ND5A(RC_0,RC_1,RCL_2,RCL_3,ICYCEND);
wire ILDDAL_1;                                                                  //[00099] LDDA1T_(ILDDAL_1) = ND4A(RCL_0,RCL_1,RC_2,ICYCEND);
wire ILDDAL_2;                                                                  //[00100] LDDA2T_(ILDDAL_2) = ND4A(RC_0,RCL_1,RC_2,ICYCEND);
wire LDDATL_0;                                                                  //[00101] LDDAL_0_(LDDATL_0,LDDAT_0) = FD4A(ILDDAL_0,CCLK,RESETL);
wire LDDAT_0;                                                                   //[00101] LDDAL_0_(LDDATL_0,LDDAT_0) = FD4A(ILDDAL_0,CCLK,RESETL);
wire LDDATL_1;                                                                  //[00102] LDDAL_1_(LDDATL_1,LDDAT_1) = FD4A(ILDDAL_1,CCLK,RESETL);
wire LDDAT_1;                                                                   //[00102] LDDAL_1_(LDDATL_1,LDDAT_1) = FD4A(ILDDAL_1,CCLK,RESETL);
wire LDDATL_2;                                                                  //[00103] LDDAL_2_(LDDATL_2,LDDAT_2) = FD4A(ILDDAL_2,CCLK,RESETL);
wire LDDAT_2;                                                                   //[00103] LDDAL_2_(LDDATL_2,LDDAT_2) = FD4A(ILDDAL_2,CCLK,RESETL);
wire ILDCMDL;                                                                   //[00110] LDCMDGEN_(ILDCMDL) = ND3A(RC_4,RC_5,ICYCEND);
wire LDCMDTL;                                                                   //[00111] LDCMDL_(LDCMDTL,LDCMDT) = FD4A(ILDCMDL,CCLK,RESETL);
wire LDCMDT;                                                                    //[00111] LDCMDL_(LDCMDTL,LDCMDT) = FD4A(ILDCMDL,CCLK,RESETL);
wire ILDMODL;                                                                   //[00114] LDMODGEN_(ILDMODL) = ND4A(RCL_0,RC_1,RC_2,ICYCEND);
wire LDMODTL;                                                                   //[00115] LDMODL_(LDMODTL,LDMODT) = FD4A(ILDMODL,CCLK,RESETL);
wire LDMODT;                                                                    //[00115] LDMODL_(LDMODTL,LDMODT) = FD4A(ILDMODL,CCLK,RESETL);
wire ILDCMPL;                                                                   //[00118] LDCMPGEN_(ILDCMPL) = ND4A(RC_0,RC_1,RC_2,ICYCEND);
wire LDCMPTL;                                                                   //[00119] LDCMPL_(LDCMPTL,LDCMPT) = FD4A(ILDCMPL,CCLK,RESETL);
wire LDCMPT;                                                                    //[00119] LDCMPL_(LDCMPTL,LDCMPT) = FD4A(ILDCMPL,CCLK,RESETL);
wire ILDOUTL;                                                                   //[00122] LDOUTGEN_(ILDOUTL) = ND3A(RCL_0,RC_3,ICYCEND);
wire LDOUTTL;                                                                   //[00123] LDOUTL_(LDOUTTL,LDOUTT) = FD4A(ILDOUTL,CCLK,RESETL);
wire LDOUTT;                                                                    //[00123] LDOUTL_(LDOUTTL,LDOUTT) = FD4A(ILDOUTL,CCLK,RESETL);

/* Invert inputs as required */

assign CYCENDL = ~CYCEND;                                                       //[00024] CYCENDL_(CYCENDL) = N1A(CYCEND);
assign RESETL = ~RESET;                                                         //[00025] RESETL_(RESETL) = N1B(RESET);
assign SRESETL = ~SRESET;                                                       //[00026] SRESETL_(SRESETL) = N1A(SRESET);

/* Generate the inputs for bits 4 and 5 */

assign CMDENDL = ~(RC_3 & RCL_2 & RCL_1 & RCL_0);                               //[00030] CMDEGEN_(CMDENDL) = ND4A(RC_3,RCL_2,RCL_1,RCL_0);

assign RC4T_0 = ~(RCL_4 & RCL_5 & RUN);                                         //[00032] RC4T0GEN_(RC4T_0) = ND3A(RCL_4,RCL_5,RUN);
assign RC4T_1 = ~(RC_4 & RCL_5 & CMDENDL);                                      //[00033] RC4T1GEN_(RC4T_1) = ND3A(RC_4,RCL_5,CMDENDL);
assign RC4T_2 = ~(RCL_4 & RC_5 & RDCMD);                                        //[00034] RC4T2GEN_(RC4T_2) = ND3A(RCL_4,RC_5,RDCMD);
assign RC4T_3 = ~(RC_4 & CYCENDL);                                              //[00035] RC4T3GEN_(RC4T_3) = ND2A(RC_4,CYCENDL);
assign IRC_4 = ~(RC4T_0 & RC4T_1 & RC4T_2 & RC4T_3);                            //[00036] RC4GEN_(IRC_4) = ND4A(RC4T_0,RC4T_1,RC4T_2,RC4T_3);

assign RC5T_0 = ~(RCL_4 & RC_5);                                                //[00038] RC5T0GEN_(RC5T_0) = ND2A(RCL_4,RC_5);
assign RC5T_1 = ~(RC_4 & RCL_5 & COMDN);                                        //[00039] RC5T1GEN_(RC5T_1) = ND3A(RC_4,RCL_5,COMDN);
assign RC5T_2 = ~(RC_4 & RC_5 & CYCENDL);                                       //[00040] RC5T2GEN_(RC5T_2) = ND3A(RC_4,RC_5,CYCENDL);
assign IRC_5 = ~(RC5T_0 & RC5T_1 & RC5T_2);                                     //[00041] RC5GEN_(IRC_5) = ND3A(RC5T_0,RC5T_1,RC5T_2);

/* Generate the inputs for bits 0 to 3, the counter.
This is cleared during the read command state, and allowed to count
during the read operands state at the cycle end, e.g.
Bit0 = /(rc[4] . rc[5]) . ((rc[4] . /rc[5] . cycend) . /rc[0]
			  +(rc[4] . /rc[5] . /cycend) . rc[0])
 */

assign IRCT_1 = ~((RC_0 & RC_1)|(RCL_0 & RCL_1));                               //[00050] IRC1GEN_(IRCT_1) = AO2A(RC_0,RC_1,RCL_0,RCL_1);
assign RCCL_1 = ~(RC_0 & RC_1);                                                 //[00051] CRC1GEN_(RCCL_1) = ND2A(RC_0,RC_1);
assign RCCL_2 = ~(RC_2 & RCC_1);                                                //[00052] CRC2GEN_(RCCL_2) = ND2A(RC_2,RCC_1);
assign RCC_1 = ~RCCL_1;                                                         //[00053] RCC1INV_(RCC_1) = N1A(RCCL_1);
assign RCC_2 = ~RCCL_2;                                                         //[00054] RCC2INV_(RCC_2) = N1A(RCCL_2);
assign IRCT_2 = ~((RC_2 & RCC_1)|(RCL_2 & RCCL_1));                             //[00055] IRC2GEN_(IRCT_2) = AO2A(RC_2,RCC_1,RCL_2,RCCL_1);
assign IRCT_3 = ~((RC_3 & RCC_2)|(RCL_3 & RCCL_2));                             //[00056] IRC3GEN_(IRCT_3) = AO2A(RC_3,RCC_2,RCL_3,RCCL_2);
/* The common count control terms */
assign CNTCLR = ~(RCL_4 | RCL_5);                                               //[00058] CNTC_0_(CNTCLR) = NR2A(RCL_4,RCL_5);
assign CNTEN = ~(RCL_4 | RC_5 | CYCENDL);                                       //[00059] CNTC_1_(CNTEN) = NR3A(RCL_4,RC_5,CYCENDL);
assign CNTDIS = ~(RCL_4 | RC_5 | CYCEND);                                       //[00060] CNTC_2_(CNTDIS) = NR3A(RCL_4,RC_5,CYCEND);
/* Generate the counter control bits */
assign CNTINL_0 = ~((CNTEN & RCL_0)|(CNTDIS & RC_0));                           //[00062] CNTINL_0_(CNTINL_0) = AO2A(CNTEN,RCL_0,CNTDIS,RC_0);
assign CNTINL_1 = ~((CNTEN & IRCT_1)|(CNTDIS & RC_1));                          //[00063] CNTINL_1_(CNTINL_1) = AO2A(CNTEN,IRCT_1,CNTDIS,RC_1);
assign CNTINL_2 = ~((CNTEN & IRCT_2)|(CNTDIS & RC_2));                          //[00064] CNTINL_2_(CNTINL_2) = AO2A(CNTEN,IRCT_2,CNTDIS,RC_2);
assign CNTINL_3 = ~((CNTEN & IRCT_3)|(CNTDIS & RC_3));                          //[00065] CNTINL_3_(CNTINL_3) = AO2A(CNTEN,IRCT_3,CNTDIS,RC_3);
assign IRC_0 = ~(CNTCLR | CNTINL_0);                                            //[00066] IRC_0_(IRC_0) = NR2A(CNTCLR,CNTINL_0);
assign IRC_1 = ~(CNTCLR | CNTINL_1);                                            //[00067] IRC_1_(IRC_1) = NR2A(CNTCLR,CNTINL_1);
assign IRC_2 = ~(CNTCLR | CNTINL_2);                                            //[00068] IRC_2_(IRC_2) = NR2A(CNTCLR,CNTINL_2);
assign IRC_3 = ~(CNTCLR | CNTINL_3);                                            //[00069] IRC_3_(IRC_3) = NR2A(CNTCLR,CNTINL_3);

/* The state latches */

FD2A RCLATCH_0__inst (.q(RC_0),.qL(RCL_0),.d(IRC_0),.clk(CCLK),.rL(SRESETL));   //[00073] RCLATCH_0_(RC_0,RCL_0) = FD2A(IRC_0,CCLK,SRESETL);
FD2A RCLATCH_1__inst (.q(RC_1),.qL(RCL_1),.d(IRC_1),.clk(CCLK),.rL(SRESETL));   //[00074] RCLATCH_1_(RC_1,RCL_1) = FD2A(IRC_1,CCLK,SRESETL);
FD2A RCLATCH_2__inst (.q(RC_2),.qL(RCL_2),.d(IRC_2),.clk(CCLK),.rL(SRESETL));   //[00075] RCLATCH_2_(RC_2,RCL_2) = FD2A(IRC_2,CCLK,SRESETL);
FD2A RCLATCH_3__inst (.q(RC_3),.qL(RCL_3),.d(IRC_3),.clk(CCLK),.rL(SRESETL));   //[00076] RCLATCH_3_(RC_3,RCL_3) = FD2A(IRC_3,CCLK,SRESETL);
FD2A RCLATCH_4__inst (.q(RC_4),.qL(RCL_4),.d(IRC_4),.clk(CCLK),.rL(SRESETL));   //[00077] RCLATCH_4_(RC_4,RCL_4) = FD2A(IRC_4,CCLK,SRESETL);
FD2A RCLATCH_5__inst (.q(RC_5),.qL(RCL_5),.d(IRC_5),.clk(CCLK),.rL(SRESETL));   //[00078] RCLATCH_5_(RC_5,RCL_5) = FD2A(IRC_5,CCLK,SRESETL);

/* Decodes from the state */

assign COMDN = ~(CMDENDL | CYCENDL);                                            //[00082] COMDGEN_(COMDN) = NR2A(CMDENDL,CYCENDL);

/* Source address load */

assign ILDSAL_0 = ~(RCL_0 & RCL_1 & RCL_2 & RCL_3 & RC_4 & ICYCEND);            //[00086] LDSA0T_(ILDSAL_0) = ND6A(RCL_0,RCL_1,RCL_2,RCL_3,RC_4,ICYCEND);
assign ILDSAL_1 = ~(RC_0 & RCL_1 & RCL_2 & RCL_3 & ICYCEND);                    //[00087] LDSA1T_(ILDSAL_1) = ND5A(RC_0,RCL_1,RCL_2,RCL_3,ICYCEND);
assign ILDSAL_2 = ~(RCL_0 & RC_1 & RCL_2 & RCL_3 & ICYCEND);                    //[00088] LDSA2T_(ILDSAL_2) = ND5A(RCL_0,RC_1,RCL_2,RCL_3,ICYCEND);
FD4A LDSALT_0__inst (.q(LDSATL_0),.qL(LDSAT_0),.d(ILDSAL_0),.clk(CCLK),.sL(RESETL));//[00089] LDSALT_0_(LDSATL_0,LDSAT_0) = FD4A(ILDSAL_0,CCLK,RESETL);
FD4A LDSALT_1__inst (.q(LDSATL_1),.qL(LDSAT_1),.d(ILDSAL_1),.clk(CCLK),.sL(RESETL));//[00090] LDSALT_1_(LDSATL_1,LDSAT_1) = FD4A(ILDSAL_1,CCLK,RESETL);
FD4A LDSALT_2__inst (.q(LDSATL_2),.qL(LDSAT_2),.d(ILDSAL_2),.clk(CCLK),.sL(RESETL));//[00091] LDSALT_2_(LDSATL_2,LDSAT_2) = FD4A(ILDSAL_2,CCLK,RESETL);
assign LDSAL_0 = ~(LDSAT_0 | RESET);                                            //[00092] LDSA_0_(LDSAL_0) = NR2A(LDSAT_0,RESET);
assign LDSAL_1 = ~(LDSAT_1 | RESET);                                            //[00093] LDSA_1_(LDSAL_1) = NR2A(LDSAT_1,RESET);
assign LDSAL_2 = ~(LDSAT_2 | RESET);                                            //[00094] LDSA_2_(LDSAL_2) = NR2A(LDSAT_2,RESET);

/* Destination address load */

assign ILDDAL_0 = ~(RC_0 & RC_1 & RCL_2 & RCL_3 & ICYCEND);                     //[00098] LDDA0T_(ILDDAL_0) = ND5A(RC_0,RC_1,RCL_2,RCL_3,ICYCEND);
assign ILDDAL_1 = ~(RCL_0 & RCL_1 & RC_2 & ICYCEND);                            //[00099] LDDA1T_(ILDDAL_1) = ND4A(RCL_0,RCL_1,RC_2,ICYCEND);
assign ILDDAL_2 = ~(RC_0 & RCL_1 & RC_2 & ICYCEND);                             //[00100] LDDA2T_(ILDDAL_2) = ND4A(RC_0,RCL_1,RC_2,ICYCEND);
FD4A LDDAL_0__inst (.q(LDDATL_0),.qL(LDDAT_0),.d(ILDDAL_0),.clk(CCLK),.sL(RESETL));//[00101] LDDAL_0_(LDDATL_0,LDDAT_0) = FD4A(ILDDAL_0,CCLK,RESETL);
FD4A LDDAL_1__inst (.q(LDDATL_1),.qL(LDDAT_1),.d(ILDDAL_1),.clk(CCLK),.sL(RESETL));//[00102] LDDAL_1_(LDDATL_1,LDDAT_1) = FD4A(ILDDAL_1,CCLK,RESETL);
FD4A LDDAL_2__inst (.q(LDDATL_2),.qL(LDDAT_2),.d(ILDDAL_2),.clk(CCLK),.sL(RESETL));//[00103] LDDAL_2_(LDDATL_2,LDDAT_2) = FD4A(ILDDAL_2,CCLK,RESETL);
assign LDDAL_0 = ~(LDDAT_0 | RESET);                                            //[00104] LDDA_0_(LDDAL_0) = NR2A(LDDAT_0,RESET);
assign LDDAL_1 = ~(LDDAT_1 | RESET);                                            //[00105] LDDA_1_(LDDAL_1) = NR2A(LDDAT_1,RESET);
assign LDDAL_2 = ~(LDDAT_2 | RESET);                                            //[00106] LDDA_2_(LDDAL_2) = NR2A(LDDAT_2,RESET);

/* Other load signals */

assign ILDCMDL = ~(RC_4 & RC_5 & ICYCEND);                                      //[00110] LDCMDGEN_(ILDCMDL) = ND3A(RC_4,RC_5,ICYCEND);
FD4A LDCMDL__inst (.q(LDCMDTL),.qL(LDCMDT),.d(ILDCMDL),.clk(CCLK),.sL(RESETL)); //[00111] LDCMDL_(LDCMDTL,LDCMDT) = FD4A(ILDCMDL,CCLK,RESETL);
assign LDCMDL = ~(RESET | LDCMDT);                                              //[00112] LDCMDG_(LDCMDL) = NR2A(RESET,LDCMDT);

assign ILDMODL = ~(RCL_0 & RC_1 & RC_2 & ICYCEND);                              //[00114] LDMODGEN_(ILDMODL) = ND4A(RCL_0,RC_1,RC_2,ICYCEND);
FD4A LDMODL__inst (.q(LDMODTL),.qL(LDMODT),.d(ILDMODL),.clk(CCLK),.sL(RESETL)); //[00115] LDMODL_(LDMODTL,LDMODT) = FD4A(ILDMODL,CCLK,RESETL);
assign LDMODL = ~(LDMODT | RESET);                                              //[00116] LDMODG_(LDMODL) = NR2A(LDMODT,RESET);

assign ILDCMPL = ~(RC_0 & RC_1 & RC_2 & ICYCEND);                               //[00118] LDCMPGEN_(ILDCMPL) = ND4A(RC_0,RC_1,RC_2,ICYCEND);
FD4A LDCMPL__inst (.q(LDCMPTL),.qL(LDCMPT),.d(ILDCMPL),.clk(CCLK),.sL(RESETL)); //[00119] LDCMPL_(LDCMPTL,LDCMPT) = FD4A(ILDCMPL,CCLK,RESETL);
assign LDCMPL = ~(RESET | LDCMPT);                                              //[00120] LDCMPG_(LDCMPL) = NR2A(RESET,LDCMPT);

assign ILDOUTL = ~(RCL_0 & RC_3 & ICYCEND);                                     //[00122] LDOUTGEN_(ILDOUTL) = ND3A(RCL_0,RC_3,ICYCEND);
FD4A LDOUTL__inst (.q(LDOUTTL),.qL(LDOUTT),.d(ILDOUTL),.clk(CCLK),.sL(RESETL)); //[00123] LDOUTL_(LDOUTTL,LDOUTT) = FD4A(ILDOUTL,CCLK,RESETL);
assign LDOUTL = ~(RESET | LDOUTT);                                              //[00124] LDOUTG_(LDOUTL) = NR2A(RESET,LDOUTT);

endmodule                                                                       //[00126] END MODULE;