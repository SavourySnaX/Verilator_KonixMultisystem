                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/***************************************************************************
state
15/10/88

Blitter state machines

This section contains the state machines, counters, command registers and
general control logic for the blitter.

****************************************************************************/
module m_STATE                                                                  //[00015] MODULE STATE;
(                                                                               //[00015] MODULE STATE;

    input    inD_0,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_1,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_2,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_3,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_4,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_5,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_6,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    inD_7,                                                               //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    ACKINT,                                                            //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    BORROW,                                                            //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    CCLK,                                                              //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    CMDWRL,                                                            //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    CONWRL,                                                            //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    DAM1L,                                                             //[00017] INPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ACKINT,BORROW,CCLK,CMDWRL,CONWRL,DAM1L,
    input    ID_0,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_1,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_2,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_3,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_4,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_5,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_6,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    ID_7,                                                              //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    INCRDL,                                                            //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    INHIB,                                                             //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    OUTCRDL,                                                           //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    RESET,                                                             //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    SAM1L,                                                             //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
    input    STRD,                                                              //[00019]    STRD,WAITL;
    input    WAITL,                                                             //[00019]    STRD,WAITL;
                                                                                //[00018]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,INHIB,OUTCRDL,RESET,SAM1L,
                                                                                //[00019]    STRD,WAITL;
    output    outD_0,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_1,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_2,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_3,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_4,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_5,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_6,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    outD_7,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_0,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_1,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_2,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_3,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_4,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_5,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_6,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    enD_7,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    ADDBACKL,                                                         //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    ADDBLDL,                                                          //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    ADSTP,                                                            //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    DATOEL,                                                           //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    ICNT_0,                                                           //[00020] OUTPUTS	D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,ADDBACKL,ADDBLDL,ADSTP,DATOEL,ICNT_0,
    output    ICNT_1,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    ICNT_2,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    INCYCL,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDCMPL,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDDAL_0,                                                          //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDDAL_1,                                                          //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDDAL_2,                                                          //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDDSTL,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDMODL,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDPATL,                                                           //[00021]    ICNT_1,ICNT_2,INCYCL,LDCMPL,LDDAL_0,LDDAL_1,LDDAL_2,LDDSTL,LDMODL,LDPATL,
    output    LDSAL_0,                                                          //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    LDSAL_1,                                                          //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    LDSAL_2,                                                          //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    LDSRCL,                                                           //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    LDSTPL,                                                           //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    LINDR,                                                            //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    PCEN,                                                             //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    RES_0,                                                            //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    RES_1,                                                            //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    RUN,                                                              //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    SDASEL,                                                           //[00022]    LDSAL_0,LDSAL_1,LDSAL_2,LDSRCL,LDSTPL,LINDR,PCEN,RES_0,RES_1,RUN,SDASEL,
    output    SRCENF,                                                           //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    SRCLTOH,                                                          //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    SRCRD,                                                            //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    SSWAP,                                                            //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    STOP,                                                             //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    UPDDSTL,                                                          //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    UPDPCL,                                                           //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    UPDSRCL,                                                          //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    UPSLDL,                                                           //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    BMREQ,                                                            //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    BRD,                                                              //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    BWR,                                                              //[00023]    SRCENF,SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDPCL,UPDSRCL,UPSLDL,BMREQ,BRD,BWR,
    output    BWORD                                                             //[00024]    BWORD;
);                                                                              //[00015] MODULE STATE;
                                                                                //[00025] LEVEL FUNCTION;
wire COMDN;                                                                     //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire DSTUP;                                                                     //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire IQUIET;                                                                    //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire OUTER0L;                                                                   //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire PARDN;                                                                     //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire PARRD;                                                                     //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire SRESET;                                                                    //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire SRCUP;                                                                     //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire INLP;                                                                      //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire LDICNTL;                                                                   //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire RDCMD;                                                                     //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire RDPAR;                                                                     //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire OTCLKL;                                                                    //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire IUPDDSTL;                                                                  //[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
wire IUPDSRCL;                                                                  //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
wire CYCEND;                                                                    //[00037]    COMDN,COMCRQ,LDCMDL) = STCMD(CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET);
wire ICYCEND;                                                                   //[00037]    COMDN,COMCRQ,LDCMDL) = STCMD(CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET);
wire LDOUTL;                                                                    //[00036] STCMD_(LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
wire COMCRQ;                                                                    //[00037]    COMDN,COMCRQ,LDCMDL) = STCMD(CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET);
wire LDCMDL;                                                                    //[00037]    COMDN,COMCRQ,LDCMDL) = STCMD(CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET);
wire PARCRQ;                                                                    //[00041] STPARAM_(PARCRQ,PARDN,LDINRL,LDPATL,LDSTPL,ILDPATL) = STPARAM(CYCEND,ICYCEND,
wire LDINRL;                                                                    //[00041] STPARAM_(PARCRQ,PARDN,LDINRL,LDPATL,LDSTPL,ILDPATL) = STPARAM(CYCEND,ICYCEND,
wire ILDPATL;                                                                   //[00041] STPARAM_(PARCRQ,PARDN,LDINRL,LDPATL,LDSTPL,ILDPATL) = STPARAM(CYCEND,ICYCEND,
wire COLST;                                                                     //[00047]    SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL) = STINNER(BORROW,CCLK,COLST,
wire CYCST;                                                                     //[00048]    CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,INLP,INNER0,IUPDDSTL,
wire DSTEN;                                                                     //[00048]    CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,INLP,INNER0,IUPDDSTL,
wire ICYCST;                                                                    //[00048]    CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,INLP,INNER0,IUPDDSTL,
wire INNER0;                                                                    //[00048]    CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,INLP,INNER0,IUPDDSTL,
wire RESUME;                                                                    //[00049]    IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,SRESET);
wire SRCEN;                                                                     //[00049]    IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,SRESET);
wire DSTWR;                                                                     //[00046] STINNER_(ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,
wire IDSTWR;                                                                    //[00046] STINNER_(ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,
wire INCLKL;                                                                    //[00046] STINNER_(ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,
wire INCRQ;                                                                     //[00046] STINNER_(ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,
wire ICNT_8;                                                                    //[00060]    SRCENF,SRCUP,SRESET) = CMDREGS(D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,
wire ICNT_3;                                                                    //[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
wire ICNT_4;                                                                    //[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
wire ICNT_5;                                                                    //[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
wire ICNT_6;                                                                    //[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
wire ICNT_7;                                                                    //[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,

/* Outer loop state machine */

m_STOUTER STOUTER_ (.COMDN(COMDN),.DSTUP(DSTUP),.IQUIET(IQUIET),.OUTER0L(OUTER0L),.PARDN(PARDN),.PARRD(PARRD),.SRESET(SRESET),.SRCUP(SRCUP),.CCLK(CCLK),.ADSTP(ADSTP),.INLP(INLP),.LDICNTL(LDICNTL),.RDCMD(RDCMD),.RDPAR(RDPAR),.SDASEL(SDASEL),.OTCLKL(OTCLKL),.IUPDDSTL(IUPDDSTL),.IUPDSRCL(IUPDSRCL));//[00030] STOUTER_(ADSTP,INLP,LDICNTL,RDCMD,RDPAR,SDASEL,OTCLKL,IUPDDSTL,
                                                                                //[00031]    IUPDSRCL) = STOUTER(COMDN,DSTUP,IQUIET,OUTER0L,PARDN,PARRD,SRESET,SRCUP,
                                                                                //[00032]    CCLK);

/* Command read state machine */

m_STCMD STCMD_ (.CCLK(CCLK),.CYCEND(CYCEND),.ICYCEND(ICYCEND),.RDCMD(RDCMD),.RESET(RESET),.RUN(RUN),.SRESET(SRESET),.LDSAL_0(LDSAL_0),.LDSAL_1(LDSAL_1),.LDSAL_2(LDSAL_2),.LDDAL_0(LDDAL_0),.LDDAL_1(LDDAL_1),.LDDAL_2(LDDAL_2),.LDCMPL(LDCMPL),.LDOUTL(LDOUTL),.LDMODL(LDMODL),.COMDN(COMDN),.IRC_4(COMCRQ),.LDCMDL(LDCMDL));//[00036] STCMD_(LDSAL_0,LDSAL_1,LDSAL_2,LDDAL_0,LDDAL_1,LDDAL_2,LDCMPL,LDOUTL,LDMODL,
                                                                                //[00037]    COMDN,COMCRQ,LDCMDL) = STCMD(CCLK,CYCEND,ICYCEND,RDCMD,RESET,RUN,SRESET);

/* Parameter read state machine */

m_STPARAM STPARAM_ (.CYCEND(CYCEND),.ICYCEND(ICYCEND),.SRESET(SRESET),.CCLK(CCLK),.RDPAR(RDPAR),.PARCRQ(PARCRQ),.PARDN(PARDN),.LDINRL(LDINRL),.LDPATL(LDPATL),.LDSTPL(LDSTPL),.ILDPATL(ILDPATL));//[00041] STPARAM_(PARCRQ,PARDN,LDINRL,LDPATL,LDSTPL,ILDPATL) = STPARAM(CYCEND,ICYCEND,
                                                                                //[00042]    SRESET,CCLK,RDPAR);

/* Inner loop state machine */

m_STINNER STINNER_ (.BORROW(BORROW),.CCLK(CCLK),.COLST(COLST),.CYCEND(CYCEND),.CYCST(CYCST),.DAM1L(DAM1L),.DSTEN(DSTEN),.ICYCEND(ICYCEND),.ICYCST(ICYCST),.ILDPATL(ILDPATL),.INHIB(INHIB),.INLP(INLP),.INNER0(INNER0),.IUPDDSTL(IUPDDSTL),.IUPDSRCL(IUPDSRCL),.LINDR(LINDR),.RES_0(RES_0),.RESET(RESET),.RESUME(RESUME),.SAM1L(SAM1L),.SRCEN(SRCEN),.SRCENF(SRCENF),.SRESET(SRESET),.ADDBACKL(ADDBACKL),.ADDBLDL(ADDBLDL),.DSTWR(DSTWR),.IDSTWR(IDSTWR),.INCLKL(INCLKL),.INCRQ(INCRQ),.IQUIET(IQUIET),.LDDSTL(LDDSTL),.LDSRCL(LDSRCL),.SRCLTOH(SRCLTOH),.SRCRD(SRCRD),.SSWAP(SSWAP),.STOP(STOP),.UPDDSTL(UPDDSTL),.UPDSRCL(UPDSRCL),.UPSLDL(UPSLDL));//[00046] STINNER_(ADDBACKL,ADDBLDL,DSTWR,IDSTWR,INCLKL,INCRQ,IQUIET,LDDSTL,LDSRCL,
                                                                                //[00047]    SRCLTOH,SRCRD,SSWAP,STOP,UPDDSTL,UPDSRCL,UPSLDL) = STINNER(BORROW,CCLK,COLST,
                                                                                //[00048]    CYCEND,CYCST,DAM1L,DSTEN,ICYCEND,ICYCST,ILDPATL,INHIB,INLP,INNER0,IUPDDSTL,
                                                                                //[00049]    IUPDSRCL,LINDR,RES_0,RESET,RESUME,SAM1L,SRCEN,SRCENF,SRESET);

/* Memory interface state machine */

m_STMEM STMEM_ (.ACKINT(ACKINT),.CCLK(CCLK),.COMCRQ(COMCRQ),.IDSTWR(IDSTWR),.INCRQ(INCRQ),.INHIB(INHIB),.PARCRQ(PARCRQ),.RESET(RESET),.RES_0(RES_0),.RES_1(RES_1),.WAITL(WAITL),.CYCEND(CYCEND),.CYCST(CYCST),.DATOEL(DATOEL),.ICYCEND(ICYCEND),.ICYCST(ICYCST),.INCYCL(INCYCL),.PCEN(PCEN),.UPDPCL(UPDPCL),.BMREQ(BMREQ),.BRD(BRD),.BWR(BWR),.BWORD(BWORD));//[00053] STMEM_(CYCEND,CYCST,DATOEL,ICYCEND,ICYCST,INCYCL,PCEN,UPDPCL,BMREQ,BRD,BWR,
                                                                                //[00054]    BWORD) = STMEM(ACKINT,CCLK,COMCRQ,IDSTWR,INCRQ,INHIB,PARCRQ,RESET,RES_0,
                                                                                //[00055]    RES_1,WAITL);

/* State machine command registers */

wire CMDREGS_out_D_1, CMDREGS_out_D_2;
wire CMDREGS_en_D_1, CMDREGS_en_D_2;

m_CMDREGS CMDREGS_ (.inD_1(inD_1),.inD_2(inD_2),
                    .outD_1(CMDREGS_out_D_1),.outD_2(CMDREGS_out_D_2),
                    .enD_1(CMDREGS_en_D_1),.enD_2(CMDREGS_en_D_2),
    .CCLK(CCLK),.CMDWRL(CMDWRL),.CONWRL(CONWRL),.ICNT_8(ICNT_8),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.LDMODL(LDMODL),.LDCMDL(LDCMDL),.RESET(RESET),.STOP(STOP),.STRD(STRD),.COLST(COLST),.DSTEN(DSTEN),.DSTUP(DSTUP),.LINDR(LINDR),.PARRD(PARRD),.RES_0(RES_0),.RES_1(RES_1),.RESUME(RESUME),.RUN(RUN),.SRCEN(SRCEN),.SRCENF(SRCENF),.SRCUP(SRCUP),.SRESET(SRESET));//[00059] CMDREGS_(D_1,D_2,COLST,DSTEN,DSTUP,LINDR,PARRD,RES_0,RES_1,RESUME,RUN,SRCEN,
                                                                                //[00060]    SRCENF,SRCUP,SRESET) = CMDREGS(D_1,D_2,CCLK,CMDWRL,CONWRL,ICNT_8,ID_0,ID_1,
                                                                                //[00061]    ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDMODL,LDCMDL,RESET,STOP,STRD);

/* Inner loop length counter */

m_INNERCNT INNERCNT_ (.CCLK(CCLK),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.LDINRL(LDINRL),.LDMODL(LDMODL),.LDICNTL(LDICNTL),.INCLKL(INCLKL),.RESET(RESET),.INNER0(INNER0),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.ICNT_3(ICNT_3),.ICNT_4(ICNT_4),.ICNT_5(ICNT_5),.ICNT_6(ICNT_6),.ICNT_7(ICNT_7),.ICNT_8(ICNT_8));//[00065] INNERCNT_(INNER0,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
                                                                                //[00066]    ICNT_8) = INNERCNT(CCLK,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,LDINRL,
                                                                                //[00067]    LDMODL,LDICNTL,INCLKL,RESET);

/* Outer loop length counter */

wire OUTERCNT_out_D_0,OUTERCNT_out_D_1,OUTERCNT_out_D_2,OUTERCNT_out_D_3,OUTERCNT_out_D_4,OUTERCNT_out_D_5,OUTERCNT_out_D_6,OUTERCNT_out_D_7;
wire OUTERCNT_en_D_0,OUTERCNT_en_D_1,OUTERCNT_en_D_2,OUTERCNT_en_D_3,OUTERCNT_en_D_4,OUTERCNT_en_D_5,OUTERCNT_en_D_6,OUTERCNT_en_D_7;

m_OUTERCNT OUTERCNT_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
                      .outD_0(OUTERCNT_out_D_0),.outD_1(OUTERCNT_out_D_1),.outD_2(OUTERCNT_out_D_2),.outD_3(OUTERCNT_out_D_3),.outD_4(OUTERCNT_out_D_4),.outD_5(OUTERCNT_out_D_5),.outD_6(OUTERCNT_out_D_6),.outD_7(OUTERCNT_out_D_7),
                      .enD_0(OUTERCNT_en_D_0),.enD_1(OUTERCNT_en_D_1),.enD_2(OUTERCNT_en_D_2),.enD_3(OUTERCNT_en_D_3),.enD_4(OUTERCNT_en_D_4),.enD_5(OUTERCNT_en_D_5),.enD_6(OUTERCNT_en_D_6),.enD_7(OUTERCNT_en_D_7),
    .CCLK(CCLK),.ICNT_0(ICNT_0),.ICNT_1(ICNT_1),.ICNT_2(ICNT_2),.ICNT_3(ICNT_3),.ICNT_4(ICNT_4),.ICNT_5(ICNT_5),.ICNT_6(ICNT_6),.ICNT_7(ICNT_7),.ID_0(ID_0),.ID_1(ID_1),.ID_2(ID_2),.ID_3(ID_3),.ID_4(ID_4),.ID_5(ID_5),.ID_6(ID_6),.ID_7(ID_7),.INCRDL(INCRDL),.LDOUTL(LDOUTL),.OTCLKL(OTCLKL),.OUTCRDL(OUTCRDL),.RESET(RESET),.OUTER0L(OUTER0L));//[00071] OUTERCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OUTER0L) = OUTERCNT(D_0,D_1,D_2,D_3,
                                                                                //[00072]    D_4,D_5,D_6,D_7,CCLK,ICNT_0,ICNT_1,ICNT_2,ICNT_3,ICNT_4,ICNT_5,ICNT_6,ICNT_7,
                                                                                //[00073]    ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7,INCRDL,LDOUTL,OTCLKL,OUTCRDL,RESET);

assign outD_0 = (OUTERCNT_out_D_0 & OUTERCNT_en_D_0);
assign outD_1 = (OUTERCNT_out_D_1 & OUTERCNT_en_D_1) | (CMDREGS_out_D_1 & CMDREGS_en_D_1);
assign outD_2 = (OUTERCNT_out_D_2 & OUTERCNT_en_D_2) | (CMDREGS_out_D_2 & CMDREGS_en_D_2);
assign outD_3 = (OUTERCNT_out_D_3 & OUTERCNT_en_D_3);
assign outD_4 = (OUTERCNT_out_D_4 & OUTERCNT_en_D_4);
assign outD_5 = (OUTERCNT_out_D_5 & OUTERCNT_en_D_5);
assign outD_6 = (OUTERCNT_out_D_6 & OUTERCNT_en_D_6);
assign outD_7 = (OUTERCNT_out_D_7 & OUTERCNT_en_D_7);

assign enD_0 = OUTERCNT_en_D_0;
assign enD_1 = OUTERCNT_en_D_1 | CMDREGS_en_D_1;
assign enD_2 = OUTERCNT_en_D_2 | CMDREGS_en_D_2;
assign enD_3 = OUTERCNT_en_D_3;
assign enD_4 = OUTERCNT_en_D_4;
assign enD_5 = OUTERCNT_en_D_5;
assign enD_6 = OUTERCNT_en_D_6;
assign enD_7 = OUTERCNT_en_D_7;


endmodule                                                                       //[00075] END MODULE;