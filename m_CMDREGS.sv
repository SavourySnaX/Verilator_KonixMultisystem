                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
cmdregs
15/10/88

Blitter state machine command registers

Parts of some of these registers lie elsewhere in the blitter.

****************************************************************************/

module m_CMDREGS                                                                //[00014] MODULE CMDREGS;
(                                                                               //[00014] MODULE CMDREGS;

    input    inD_1,                                                               //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    inD_2,                                                               //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    CCLK,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    CMDWRL,                                                            //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    CONWRL,                                                            //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ICNT_8,                                                            //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_0,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_1,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_2,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_3,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_4,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_5,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_6,                                                              //[00016] INPUTS	D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,
    input    ID_7,                                                              //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    input    LDMODL,                                                            //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    input    LDCMDL,                                                            //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    input    RESET,                                                             //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    input    STOP,                                                              //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    input    STRD,                                                              //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
                                                                                //[00017]    ID_7,LDMODL,LDCMDL,RESET,STOP,STRD;
    output    outD_1,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    outD_2,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    enD_1,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    enD_2,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    COLST,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    DSTEN,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    DSTUP,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    LINDR,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    PARRD,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    RES_0,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    RES_1,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    RESUME,                                                           //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    RUN,                                                              //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    SRCEN,                                                            //[00018] OUTPUTS	D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
    output    SRCENF,                                                           //[00019]    SRCENF,SRCUP,SRESET;
    output    SRCUP,                                                            //[00019]    SRCENF,SRCUP,SRESET;
    output    SRESET                                                            //[00019]    SRCENF,SRCUP,SRESET;
);                                                                              //[00014] MODULE CMDREGS;
                                                                                //[00020] LEVEL FUNCTION;
wire RESETL;                                                                    //[00023] RESETL_(RESETL) = N1A(RESET);
wire CMDLDL;                                                                    //[00028] CMDLDL_(CMDLDL) = AND2A(CMDWRL,LDCMDL);
wire SRESETL;                                                                   //[00029] COMR_0_(RUN,RUNL) = FD2A(ID_0,CMDLDL,SRESETL);
wire RUNL;                                                                      //[00029] COMR_0_(RUN,RUNL) = FD2A(ID_0,CMDLDL,SRESETL);
wire COLSTL;                                                                    //[00030] COMR_1_(COLST,COLSTL) = LD2A(ID_1,CMDLDL);
wire PARRDL;                                                                    //[00031] COMR_2_(PARRD,PARRDL) = LD2A(ID_2,CMDLDL);
wire SRCUPL;                                                                    //[00032] COMR_3_(SRCUP,SRCUPL) = LD2A(ID_3,CMDLDL);
wire DSTUPL;                                                                    //[00033] COMR_4_(DSTUP,DSTUPL) = LD2A(ID_4,CMDLDL);
wire SRCENL;                                                                    //[00034] COMR_5_(SRCEN,SRCENL) = LD2A(ID_5,CMDLDL);
wire DSTENL;                                                                    //[00035] COMR_6_(DSTEN,DSTENL) = LD2A(ID_6,CMDLDL);
wire SRCENFL;                                                                   //[00036] COMR_7_(SRCENF,SRCENFL) = LD2A(ID_7,CMDLDL);
wire LINDRL;                                                                    //[00040] MODL_3_(LINDR,LINDRL) = LD2A(ID_3,LDMODL);
wire RESL_0;                                                                    //[00041] MODL_5_(RES_0,RESL_0) = LD2A(ID_5,LDMODL);
wire RESL_1;                                                                    //[00042] MODL_6_(RES_1,RESL_1) = LD2A(ID_6,LDMODL);
wire RESCLRL;                                                                   //[00047] RESFF0_(RSM_0,RSML_0) = FD2A(ID_1,CONWRL,RESCLRL);
wire RSM_0;                                                                     //[00047] RESFF0_(RSM_0,RSML_0) = FD2A(ID_1,CONWRL,RESCLRL);
wire RSML_0;                                                                    //[00047] RESFF0_(RSM_0,RSML_0) = FD2A(ID_1,CONWRL,RESCLRL);
wire RSM_1;                                                                     //[00048] RESFF1_(RSM_1,RSML_1) = FD2A(RSM_0,CCLK,RESETL);
wire RSML_1;                                                                    //[00048] RESFF1_(RSM_1,RSML_1) = FD2A(RSM_0,CCLK,RESETL);
wire RSM_2;                                                                     //[00049] RESFF2_(RSM_2,RSML_2) = FD2A(RSM_1,CCLK,RESETL);
wire RSML_2;                                                                    //[00049] RESFF2_(RSM_2,RSML_2) = FD2A(RSM_1,CCLK,RESETL);
wire SRES_0;                                                                    //[00055] SRES0_(SRES_0,SRESL_0) = FD2A(ID_2,CONWRL,SRESETL);
wire SRESL_0;                                                                   //[00055] SRES0_(SRES_0,SRESL_0) = FD2A(ID_2,CONWRL,SRESETL);
wire SRES_1;                                                                    //[00056] SRES1_(SRES_1,SRESL_1) = FD2A(SRES_0,CCLK,RESETL);
wire SRESL_1;                                                                   //[00056] SRES1_(SRES_1,SRESL_1) = FD2A(SRES_0,CCLK,RESETL);
wire SRES_2;                                                                    //[00057] SRES2_(SRES_2,SRESL_2) = FD2A(SRES_1,CCLK,RESETL);
wire SRESL_2;                                                                   //[00057] SRES2_(SRES_2,SRESL_2) = FD2A(SRES_1,CCLK,RESETL);
wire SRES_3;                                                                    //[00058] SRES3_(SRES_3) = NR2A(SRESL_1,SRES_2);

assign RESETL = ~RESET;                                                         //[00023] RESETL_(RESETL) = N1A(RESET);

/* Command Register, this is loaded by a program fetch or by an IO write
cycle.  */

assign CMDLDL = CMDWRL & LDCMDL;                                                //[00028] CMDLDL_(CMDLDL) = AND2A(CMDWRL,LDCMDL);
FD2A COMR_0__inst (.q(RUN),.qL(RUNL),.d(ID_0),.clk(CMDLDL),.rL(SRESETL));       //[00029] COMR_0_(RUN,RUNL) = FD2A(ID_0,CMDLDL,SRESETL);
LD2A COMR_1__inst (.q(COLST),.qL(COLSTL),.d(ID_1),.en(CMDLDL));                 //[00030] COMR_1_(COLST,COLSTL) = LD2A(ID_1,CMDLDL);
LD2A COMR_2__inst (.q(PARRD),.qL(PARRDL),.d(ID_2),.en(CMDLDL));                 //[00031] COMR_2_(PARRD,PARRDL) = LD2A(ID_2,CMDLDL);
LD2A COMR_3__inst (.q(SRCUP),.qL(SRCUPL),.d(ID_3),.en(CMDLDL));                 //[00032] COMR_3_(SRCUP,SRCUPL) = LD2A(ID_3,CMDLDL);
LD2A COMR_4__inst (.q(DSTUP),.qL(DSTUPL),.d(ID_4),.en(CMDLDL));                 //[00033] COMR_4_(DSTUP,DSTUPL) = LD2A(ID_4,CMDLDL);
LD2A COMR_5__inst (.q(SRCEN),.qL(SRCENL),.d(ID_5),.en(CMDLDL));                 //[00034] COMR_5_(SRCEN,SRCENL) = LD2A(ID_5,CMDLDL);
LD2A COMR_6__inst (.q(DSTEN),.qL(DSTENL),.d(ID_6),.en(CMDLDL));                 //[00035] COMR_6_(DSTEN,DSTENL) = LD2A(ID_6,CMDLDL);
LD2A COMR_7__inst (.q(SRCENF),.qL(SRCENFL),.d(ID_7),.en(CMDLDL));               //[00036] COMR_7_(SRCENF,SRCENFL) = LD2A(ID_7,CMDLDL);

/* Mode Register */

LD2A MODL_3__inst (.q(LINDR),.qL(LINDRL),.d(ID_3),.en(LDMODL));                 //[00040] MODL_3_(LINDR,LINDRL) = LD2A(ID_3,LDMODL);
LD2A MODL_5__inst (.q(RES_0),.qL(RESL_0),.d(ID_5),.en(LDMODL));                 //[00041] MODL_5_(RES_0,RESL_0) = LD2A(ID_5,LDMODL);
LD2A MODL_6__inst (.q(RES_1),.qL(RESL_1),.d(ID_6),.en(LDMODL));                 //[00042] MODL_6_(RES_1,RESL_1) = LD2A(ID_6,LDMODL);

/* Blitter control register (part of) */

/* Resume is a pulse one tick wide produced when a 1 is written to bit 1 */
FD2A RESFF0__inst (.q(RSM_0),.qL(RSML_0),.d(ID_1),.clk(CONWRL),.rL(RESCLRL));   //[00047] RESFF0_(RSM_0,RSML_0) = FD2A(ID_1,CONWRL,RESCLRL);
FD2A RESFF1__inst (.q(RSM_1),.qL(RSML_1),.d(RSM_0),.clk(CCLK),.rL(RESETL));     //[00048] RESFF1_(RSM_1,RSML_1) = FD2A(RSM_0,CCLK,RESETL);
FD2A RESFF2__inst (.q(RSM_2),.qL(RSML_2),.d(RSM_1),.clk(CCLK),.rL(RESETL));     //[00049] RESFF2_(RSM_2,RSML_2) = FD2A(RSM_1,CCLK,RESETL);
assign RESUME = ~(RSML_1 | RSM_2);                                              //[00050] RESUME_(RESUME) = NR2A(RSML_1,RSM_2);
assign RESCLRL = ~(RSM_2 | RESET);                                              //[00051] RESCLR_(RESCLRL) = NR2A(RSM_2,RESET);

/* Sreset is a pulse one tick wide which is produced whenever a 1 is written
to the blitter control port on bit 2.  */
FD2A SRES0__inst (.q(SRES_0),.qL(SRESL_0),.d(ID_2),.clk(CONWRL),.rL(SRESETL));  //[00055] SRES0_(SRES_0,SRESL_0) = FD2A(ID_2,CONWRL,SRESETL);
FD2A SRES1__inst (.q(SRES_1),.qL(SRESL_1),.d(SRES_0),.clk(CCLK),.rL(RESETL));   //[00056] SRES1_(SRES_1,SRESL_1) = FD2A(SRES_0,CCLK,RESETL);
FD2A SRES2__inst (.q(SRES_2),.qL(SRESL_2),.d(SRES_1),.clk(CCLK),.rL(RESETL));   //[00057] SRES2_(SRES_2,SRESL_2) = FD2A(SRES_1,CCLK,RESETL);
assign SRES_3 = ~(SRESL_1 | SRES_2);                                            //[00058] SRES3_(SRES_3) = NR2A(SRESL_1,SRES_2);
assign SRESETL = ~(RESET | SRES_3);                                             //[00059] SRESETL_(SRESETL) = NR2A(RESET,SRES_3);
assign SRESET = ~SRESETL;                                                       //[00060] SRESET_(SRESET) = N1A(SRESETL);

/* Blitter status port (part of) */

assign outD_1 = STOP;                                                //[00064] STAT_1_(D_1) = BTS4A(STOP,STRD);
assign outD_2 = ICNT_8;                                              //[00065] STAT_2_(D_2) = BTS4A(ICNT_8,STRD);
assign enD_1 = STRD;                                                //[00064] STAT_1_(D_1) = BTS4A(STOP,STRD);
assign enD_2 = STRD;                                              //[00065] STAT_2_(D_2) = BTS4A(ICNT_8,STRD);

endmodule                                                                       //[00067] END MODULE;