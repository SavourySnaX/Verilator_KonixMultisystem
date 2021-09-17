                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/********************************************************
*	vid-hdl						*
*	2/11/88						*
********************************************************/

/*
This module is the video block within the SLIPSTREAM chip on the ACW
*/

module m_VID                                                                    //[00015] MODULE VID;
(                                                                               //[00015] MODULE VID;

    input    inA_0,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_1,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_2,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_3,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_4,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_5,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_6,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_7,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_8,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_9,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_10,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_11,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_12,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_13,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_14,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_15,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    input    inA_16,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_17,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_18,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inA_19,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_0,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_1,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_2,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_3,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_4,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_5,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_6,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_7,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_8,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_9,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_10,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_11,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_12,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    input    inD_13,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inD_14,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inD_15,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_0,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_1,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_2,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_3,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_4,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_5,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_6,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_7,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_8,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_9,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_10,                                                             //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_11,                                                             //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    input    inPD_12,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    inPD_13,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    inPD_14,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    inPD_15,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_0,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_1,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_2,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_3,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_4,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_5,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_6,                                                            //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    input    VADL_7,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_8,                                                             //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_9,                                                             //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_10,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_11,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_12,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_13,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_14,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VAL_15,                                                            //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_8,                                                             //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_9,                                                             //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
    input    VDL_10,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VDL_11,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VDL_12,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VDL_13,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VDL_14,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VDL_15,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VRD,                                                               //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VWR,                                                               //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    VLOCK,                                                             //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    HLOCK,                                                             //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    PALL,                                                              //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    PSRAML,                                                            //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
    input    ASL_16,                                                            //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    ASL_17,                                                            //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    ASL_18,                                                            //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    ASL_19,                                                            //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    RESETL_0,                                                          //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    IOML,                                                              //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    ALEL,                                                              //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    INTAL,                                                             //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    BMREQ,                                                             //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    DMREQ,                                                             //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    HLDAL,                                                             //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    XTALL,                                                             //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
    input    AIL_0,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    AIL_1,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    AIL_2,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    LP,                                                                //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    BHOLDL,                                                            //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    BWORD,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    DWORD,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    FASTL,                                                             //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    BRD,                                                               //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    DRD,                                                               //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    BWR,                                                               //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    DWR,                                                               //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    input    CCLK,                                                              //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
                                                                                //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
                                                                                //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
                                                                                //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
                                                                                //[00021]    VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,VDL_9,
                                                                                //[00022]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,VLOCK,HLOCK,PALL,PSRAML,
                                                                                //[00023]    ASL_16,ASL_17,ASL_18,ASL_19,RESETL_0,IOML,ALEL,INTAL,BMREQ,DMREQ,HLDAL,XTALL,
                                                                                //[00024]    AIL_0,AIL_1,AIL_2,LP,BHOLDL,BWORD,DWORD,FASTL,BRD,DRD,BWR,DWR,CCLK;
    output    outA_0,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_1,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_2,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_3,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_4,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_5,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_6,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_7,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_8,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_9,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_10,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_11,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_12,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_13,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_14,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_15,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    outA_16,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_17,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_18,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outA_19,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_0,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_1,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_2,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_3,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_4,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_5,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_6,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_7,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_8,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_9,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_10,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_11,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_12,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    outD_13,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outD_14,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outD_15,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_0,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_1,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_2,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_3,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_4,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_5,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_6,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_7,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_8,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_9,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_10,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_11,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    outPD_12,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    outPD_13,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    outPD_14,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    outPD_15,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    enA_0,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_1,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_2,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_3,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_4,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_5,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_6,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_7,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_8,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_9,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_10,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_11,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_12,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_13,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_14,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_15,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    output    enA_16,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_17,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_18,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enA_19,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_0,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_1,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_2,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_3,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_4,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_5,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_6,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_7,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_8,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_9,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_10,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_11,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_12,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    output    enD_13,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enD_14,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enD_15,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_0,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_1,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_2,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_3,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_4,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_5,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_6,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_7,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_8,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_9,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_10,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_11,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    output    enPD_12,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    enPD_13,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    enPD_14,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    enPD_15,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_0,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_1,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_2,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_3,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_4,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_5,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_6,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAD_7,                                                            //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    ADEN,                                                             //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
    output    VAL_0,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_1,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_2,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_3,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_4,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_5,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_6,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VAL_7,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_8,                                                             //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_9,                                                             //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_10,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_11,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_12,                                                            //[00029]    VAL_0,VAL_1,VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,
    output    VA_13,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VA_14,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VA_15,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    AEN,                                                              //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VAL_16,                                                           //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VAL_17,                                                           //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    DEN,                                                              //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_8,                                                             //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_9,                                                             //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_10,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_11,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_12,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_13,                                                            //[00030]    VA_13,VA_14,VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,
    output    VD_14,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    VD_15,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    VRDL,                                                             //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    VWRL,                                                             //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    INTL,                                                             //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    VSYNC,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    HSYNC,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    TESTENL,                                                          //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    PCLKL,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    HOLDL,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    SCE_0,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    SCE_1,                                                            //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    WE,                                                               //[00031]    VD_14,VD_15,VRDL,VWRL,INTL,VSYNC,HSYNC,TESTENL,PCLKL,HOLDL,SCE_0,SCE_1,WE,
    output    DWE,                                                              //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    CS_0,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    CS_1,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    RL_0,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    RL_1,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    RL_2,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    RL_3,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    GL_0,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    GL_1,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    GL_2,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    GL_3,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    BL_0,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    BL_1,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    BL_2,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    BL_3,                                                             //[00032]    DWE,CS_0,CS_1,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,
    output    CHROMAL,                                                          //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    JOYL_0,                                                           //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    JOYL_1,                                                           //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    JOYL_2,                                                           //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    OE,                                                               //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    CAS,                                                              //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    IORDL,                                                            //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    IOWRL,                                                            //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    BCSL,                                                             //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    DCSL,                                                             //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    ICCLK,                                                            //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    WAITL,                                                            //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    RDL,                                                              //[00033]    CHROMAL,JOYL_0,JOYL_1,JOYL_2,OE,CAS,IORDL,IOWRL,BCSL,DCSL,ICCLK,WAITL,RDL,
    output    WRL,                                                              //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_0,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_1,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_2,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_3,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_4,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_5,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_6,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PA_7,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    POE,                                                              //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PWE,                                                              //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    PCS,                                                              //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    MO,                                                               //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    INCL,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    DOEN,                                                             //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    GPIOL_0,                                                          //[00034]    WRL,PA_0,PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS,MO,INCL,DOEN,GPIOL_0,
    output    GPIOL_1,                                                          //[00035]    GPIOL_1,DQCLK;
    output    DQCLK                                                             //[00035]    GPIOL_1,DQCLK;



);                                                                              //[00015] MODULE VID;
                                                                                //[00036] LEVEL FUNCTION;
wire NTSC;                                                                      //[00041] CLOCK_(PCLKL,ICCLK,CHROMAL,DQCLK) = CLOCK(XTALL,VRD,VWR,NTSC,FAST,TSTCLK,LP);
wire FAST;                                                                      //[00041] CLOCK_(PCLKL,ICCLK,CHROMAL,DQCLK) = CLOCK(XTALL,VRD,VWR,NTSC,FAST,TSTCLK,LP);
wire TSTCLK;                                                                    //[00041] CLOCK_(PCLKL,ICCLK,CHROMAL,DQCLK) = CLOCK(XTALL,VRD,VWR,NTSC,FAST,TSTCLK,LP);
wire SSIORD;                                                                    //[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
wire INTLLD;                                                                    //[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
wire INTH;                                                                      //[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
wire STARTL;                                                                    //[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
wire STARTH;                                                                    //[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
wire HCNTL;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire HCNTH;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire VCNTL;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire VCNTH;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire SCRL_0;                                                                    //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire SCRL_1;                                                                    //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire SCRL_2;                                                                    //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire MODE;                                                                      //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire BORDL;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire BORDH;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire TRANS;                                                                     //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire MASK;                                                                      //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
wire INDEX;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire ENDL;                                                                      //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire ENDH;                                                                      //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire MEMLD;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire DIAGL_0;                                                                   //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire DIAG_1;                                                                    //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire LPL_0;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire LPL_1;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire LPL_2;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire LPL_3;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire STATL;                                                                     //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire LCD;                                                                       //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire ACK;                                                                       //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
wire DIS;                                                                       //[00048]    DIS,GPIOL_0,GPIOL_1) = IODEC(RESETL_0,CCLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,
wire VHOLDL;                                                                    //[00065]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
wire MUXL;                                                                      //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
wire WD_0;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_1;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_2;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_3;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_4;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_5;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_6;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire WD_7;                                                                      //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire PALCS;                                                                     //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
wire VBUSYL_0;                                                                  //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
wire VBUSYL_1;                                                                  //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
wire VCS;                                                                       //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
wire VOE;                                                                       //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
wire VCAS;                                                                      //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
wire VRAS;                                                                      //[00075]    VRAS,WD_0,WD_1,WD_2,WD_3,MEMLD,PSUEDO,BWORD,DWORD);
wire PSUEDO;                                                                    //[00075]    VRAS,WD_0,WD_1,WD_2,WD_3,MEMLD,PSUEDO,BWORD,DWORD);
wire MODE_0;                                                                    //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
wire MODE_1;                                                                    //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
wire VVACTIVE;                                                                  //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
wire HVACTIVE;                                                                  //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
wire VSTART;                                                                    //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HC_0;                                                                      //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HC_1;                                                                      //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HC_2;                                                                      //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HC_3;                                                                      //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HD1;                                                                       //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire HVHOLD;                                                                    //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire NOWRAP;                                                                    //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);
wire PIXLD_0;                                                                   //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
wire PIXLD_1;                                                                   //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
wire PIXAD_0;                                                                   //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
wire PIXAD_1;                                                                   //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
wire GENLOCK;                                                                   //[00094]    HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV);
wire OPEN;                                                                      //[00094]    HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV);
wire NEXTV;                                                                     //[00094]    HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV);
wire HBORDER;                                                                   //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire HBLANKING;                                                                 //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire HVSYNC;                                                                    //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire LPSET;                                                                     //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire LPCLK;                                                                     //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire HINT;                                                                      //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
wire VCEN;                                                                      //[00102]    STARTL,STARTH,ENDL,ENDH,INTLLD,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,VCEN,
wire LORES;                                                                     //[00103]    LORES,HINT);
wire VINT;                                                                      //[00099] VCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
wire BORDER;                                                                    //[00099] VCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
wire BLANKING;                                                                  //[00099] VCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
wire TMODE;                                                                     //[00117]    TMODE,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,VADL_7,VDL_8,VDL_9,

wire SA_0;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_1;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_2;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_3;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_4;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_5;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_6;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_7;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_8;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_9;                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_10;                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_11;                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_12;                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_13;                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
wire SA_14;                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
wire SA_15;                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
wire SA_16;                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
wire SA_17;                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
wire SAEN;                                                                      //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);



/* Clock generator */

m_CLOCK CLOCK_ (.MCK(XTALL),.VRD(VRD),.VWR(VWR),.NTSC(NTSC),.FAST(FAST),.TSTCLK(TSTCLK),.LP(LP),.PCLKL(PCLKL),.CCLK(ICCLK),.CHROMAL(CHROMAL),.DQCLK(DQCLK));//[00041] CLOCK_(PCLKL,ICCLK,CHROMAL,DQCLK) = CLOCK(XTALL,VRD,VWR,NTSC,FAST,TSTCLK,LP);

/* IO decodes */

m_IODEC IODEC_ (.RESETL_0(RESETL_0),.CLK(CCLK),.IOML(IOML),.VRD(VRD),.VWR(VWR),.A_0(inA_0),.A_1(inA_1),.A_2(inA_2),.A_3(inA_3),.A_4(inA_4),.A_5(inA_5),.A_6(inA_6),.A_7(inA_7),.IORDL(IORDL),.IOWRL(IOWRL),.BCSL(BCSL),.JOYL_0(JOYL_0),.JOYL_1(JOYL_1),.JOYL_2(JOYL_2),.SSIORD(SSIORD),.INTL(INTLLD),.INTH(INTH),.STARTL(STARTL),.STARTH(STARTH),.HCNTL(HCNTL),.HCNTH(HCNTH),.VCNTL(VCNTL),.VCNTH(VCNTH),.SCRL_0(SCRL_0),.SCRL_1(SCRL_1),.SCRL_2(SCRL_2),.MODE(MODE),.BORDL(BORDL),.BORDH(BORDH),.TRANS(TRANS),.MASK(MASK),.INDEX(INDEX),.ENDL(ENDL),.ENDH(ENDH),.MEMLD(MEMLD),.DIAGL_0(DIAGL_0),.DIAG_1(DIAG_1),.LPL_0(LPL_0),.LPL_1(LPL_1),.LPL_2(LPL_2),.LPL_3(LPL_3),.STATL(STATL),.LCD(LCD),.ACK(ACK),.DIS(DIS),.GPIOL_0(GPIOL_0),.GPIOL_1(GPIOL_1));//[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
                                                                                //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
                                                                                //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
                                                                                //[00048]    DIS,GPIOL_0,GPIOL_1) = IODEC(RESETL_0,CCLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,
                                                                                //[00049]    A_5,A_6,A_7);

/* Bus manager */

wire BM_outD_0,BM_outD_1,BM_outD_2,BM_outD_3,BM_outD_4,BM_outD_5,BM_outD_6,BM_outD_7,BM_outD_8,BM_outD_9,BM_outD_10,BM_outD_11,BM_outD_12,BM_outD_13,BM_outD_14,BM_outD_15;
wire BM_enD_0,BM_enD_1,BM_enD_2,BM_enD_3,BM_enD_4,BM_enD_5,BM_enD_6,BM_enD_7,BM_enD_8,BM_enD_9,BM_enD_10,BM_enD_11,BM_enD_12,BM_enD_13,BM_enD_14,BM_enD_15;

m_BM BM_ (.inA_0(inA_0),.inA_1(inA_1),.inA_2(inA_2),.inA_3(inA_3),.inA_4(inA_4),.inA_5(inA_5),.inA_6(inA_6),.inA_7(inA_7),.inA_8(inA_8),.inA_9(inA_9),.inA_10(inA_10),.inA_11(inA_11),.inA_12(inA_12),.inA_13(inA_13),.inA_14(inA_14),.inA_15(inA_15),.inA_16(inA_16),.inA_17(inA_17),.inA_18(inA_18),.inA_19(inA_19),.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),.inD_8(inD_8),.inD_9(inD_9),.inD_10(inD_10),.inD_11(inD_11),.inD_12(inD_12),.inD_13(inD_13),.inD_14(inD_14),.inD_15(inD_15),
          .outA_0(outA_0),.outA_1(outA_1),.outA_2(outA_2),.outA_3(outA_3),.outA_4(outA_4),.outA_5(outA_5),.outA_6(outA_6),.outA_7(outA_7),.outA_8(outA_8),.outA_9(outA_9),.outA_10(outA_10),.outA_11(outA_11),.outA_12(outA_12),.outA_13(outA_13),.outA_14(outA_14),.outA_15(outA_15),.outA_16(outA_16),.outA_17(outA_17),.outA_18(outA_18),.outA_19(outA_19),.outD_0(BM_outD_0),.outD_1(BM_outD_1),.outD_2(BM_outD_2),.outD_3(BM_outD_3),.outD_4(BM_outD_4),.outD_5(BM_outD_5),.outD_6(BM_outD_6),.outD_7(BM_outD_7),.outD_8(BM_outD_8),.outD_9(BM_outD_9),.outD_10(BM_outD_10),.outD_11(BM_outD_11),.outD_12(BM_outD_12),.outD_13(BM_outD_13),.outD_14(BM_outD_14),.outD_15(BM_outD_15),
          .enA_0(enA_0),.enA_1(enA_1),.enA_2(enA_2),.enA_3(enA_3),.enA_4(enA_4),.enA_5(enA_5),.enA_6(enA_6),.enA_7(enA_7),.enA_8(enA_8),.enA_9(enA_9),.enA_10(enA_10),.enA_11(enA_11),.enA_12(enA_12),.enA_13(enA_13),.enA_14(enA_14),.enA_15(enA_15),.enA_16(enA_16),.enA_17(enA_17),.enA_18(enA_18),.enA_19(enA_19),.enD_0(BM_enD_0),.enD_1(BM_enD_1),.enD_2(BM_enD_2),.enD_3(BM_enD_3),.enD_4(BM_enD_4),.enD_5(BM_enD_5),.enD_6(BM_enD_6),.enD_7(BM_enD_7),.enD_8(BM_enD_8),.enD_9(BM_enD_9),.enD_10(BM_enD_10),.enD_11(BM_enD_11),.enD_12(BM_enD_12),.enD_13(BM_enD_13),.enD_14(BM_enD_14),.enD_15(BM_enD_15),
    .RESETL_0(RESETL_0),.VADL_0(VADL_0),.VADL_1(VADL_1),.VADL_2(VADL_2),.VADL_3(VADL_3),.VADL_4(VADL_4),.VADL_5(VADL_5),.VADL_6(VADL_6),.VADL_7(VADL_7),.VAL_8(VAL_8),.VAL_9(VAL_9),.VAL_10(VAL_10),.VAL_11(VAL_11),.VAL_12(VAL_12),.VAL_13(VAL_13),.VAL_14(VAL_14),.VAL_15(VAL_15),.VDL_8(VDL_8),.VDL_9(VDL_9),.VDL_10(VDL_10),.VDL_11(VDL_11),.VDL_12(VDL_12),.VDL_13(VDL_13),.VDL_14(VDL_14),.VDL_15(VDL_15),.VRD(VRD),.VWR(VWR),.ASL_16(ASL_16),.ASL_17(ASL_17),.ASL_18(ASL_18),.ASL_19(ASL_19),.IOML(IOML),.ALEL(ALEL),.INTAL(INTAL),.HLDAL(HLDAL),.BHOLDL(BHOLDL),.BWORD(BWORD),.DWORD(DWORD),.VHOLDL(VHOLDL),.SSIORD(SSIORD),.JOYL_0(JOYL_0),.JOYL_1(JOYL_1),.SA_0(SA_0),.SA_1(SA_1),.SA_2(SA_2),.SA_3(SA_3),.SA_4(SA_4),.SA_5(SA_5),.SA_6(SA_6),.SA_7(SA_7),.SA_8(SA_8),.SA_9(SA_9),.SA_10(SA_10),.SA_11(SA_11),.SA_12(SA_12),.SA_13(SA_13),.SA_14(SA_14),.SA_15(SA_15),.SA_16(SA_16),.SA_17(SA_17),.SAEN(SAEN),.MUXL(MUXL),.BRD(BRD),.DRD(DRD),.BWR(BWR),.DWR(DWR),.VAD_0(VAD_0),.VAD_1(VAD_1),.VAD_2(VAD_2),.VAD_3(VAD_3),.VAD_4(VAD_4),.VAD_5(VAD_5),.VAD_6(VAD_6),.VAD_7(VAD_7),.ADEN(ADEN),.VAL_0(VAL_0),.VAL_1(VAL_1),.VAL_2(VAL_2),.VAL_3(VAL_3),.VAL_4(VAL_4),.VAL_5(VAL_5),.VAL_6(VAL_6),.VAL_7(VAL_7),.VA_8(VA_8),.VA_9(VA_9),.VA_10(VA_10),.VA_11(VA_11),.VA_12(VA_12),.VA_13(VA_13),.VA_14(VA_14),.VA_15(VA_15),.AEN(AEN),.VAL_16(VAL_16),.VAL_17(VAL_17),.DEN(DEN),.VD_8(VD_8),.VD_9(VD_9),.VD_10(VD_10),.VD_11(VD_11),.VD_12(VD_12),.VD_13(VD_13),.VD_14(VD_14),.VD_15(VD_15),.VRDL(VRDL),.VWRL(VWRL),.HOLDL(HOLDL),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.PALCS(PALCS),.DCSL(DCSL),.RDL(RDL),.WRL(WRL));//[00054] BM_(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,A_16,
                                                                                //[00055]    A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,
                                                                                //[00056]    D_14,D_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,VAL_0,VAL_1,
                                                                                //[00057]    VAL_2,VAL_3,VAL_4,VAL_5,VAL_6,VAL_7,VA_8,VA_9,VA_10,VA_11,VA_12,VA_13,VA_14,
                                                                                //[00058]    VA_15,AEN,VAL_16,VAL_17,DEN,VD_8,VD_9,VD_10,VD_11,VD_12,VD_13,VD_14,VD_15,
                                                                                //[00059]    VRDL,VWRL,HOLDL,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,PALCS,DCSL,RDL,
                                                                                //[00060]    WRL) = BM(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,
                                                                                //[00061]    A_15,A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,
                                                                                //[00062]    D_12,D_13,D_14,D_15,RESETL_0,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,
                                                                                //[00063]    VADL_6,VADL_7,VAL_8,VAL_9,VAL_10,VAL_11,VAL_12,VAL_13,VAL_14,VAL_15,VDL_8,
                                                                                //[00064]    VDL_9,VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15,VRD,VWR,ASL_16,ASL_17,ASL_18,
                                                                                //[00065]    ASL_19,IOML,ALEL,INTAL,HLDAL,BHOLDL,BWORD,DWORD,VHOLDL,SSIORD,JOYL_0,JOYL_1,
                                                                                //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
                                                                                //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);

/* Memory timing generator */

m_MEM MEM_ (.RESETL_0(RESETL_0),.CLK(CCLK),.DQCLK(DQCLK),.BMREQ(BMREQ),.DMREQ(DMREQ),.HLDAL(HLDAL),.RDL(RDL),.WRL(WRL),.IOML(IOML),.A_0(inA_0),.A_18(inA_18),.A_19(inA_19),.VBUSYL_0(VBUSYL_0),.VBUSYL_1(VBUSYL_1),.VCS(VCS),.VOE(VOE),.VCAS(VCAS),.VRAS(VRAS),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.MEMLD(MEMLD),.PSUEDO(PSUEDO),.BWORD(BWORD),.DWORD(DWORD),.CAS(CAS),.MUXL(MUXL),.WAITL(WAITL),.SCE_0(SCE_0),.SCE_1(SCE_1),.WE(WE),.DWE(DWE),.CS_0(CS_0),.CS_1(CS_1),.OE(OE));//[00073] MEM_(CAS,MUXL,WAITL,SCE_0,SCE_1,WE,DWE,CS_0,CS_1,OE) = MEM(RESETL_0,CCLK,DQCLK,
                                                                                //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
                                                                                //[00075]    VRAS,WD_0,WD_1,WD_2,WD_3,MEMLD,PSUEDO,BWORD,DWORD);

/* Video timing generator */

m_VTIM VTIM_ (.RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.MODE_0(MODE_0),.MODE_1(MODE_1),.SCRL_0(SCRL_0),.SCRL_1(SCRL_1),.SCRL_2(SCRL_2),.VVACTIVE(VVACTIVE),.HVACTIVE(HVACTIVE),.VSTART(VSTART),.HC_0(HC_0),.HC_1(HC_1),.HC_2(HC_2),.HC_3(HC_3),.HD1(HD1),.PSUEDO(PSUEDO),.HVHOLD(HVHOLD),.NOWRAP(NOWRAP),.VBUSYL_0(VBUSYL_0),.VBUSYL_1(VBUSYL_1),.VCS(VCS),.VOE(VOE),.VCAS(VCAS),.VRAS(VRAS),.SAEN(SAEN),.SA_0(SA_0),.SA_1(SA_1),.SA_2(SA_2),.SA_3(SA_3),.SA_4(SA_4),.SA_5(SA_5),.SA_6(SA_6),.SA_7(SA_7),.SA_8(SA_8),.SA_9(SA_9),.SA_10(SA_10),.SA_11(SA_11),.SA_12(SA_12),.SA_13(SA_13),.SA_14(SA_14),.SA_15(SA_15),.SA_16(SA_16),.SA_17(SA_17),.VHOLDL(VHOLDL),.PIXLD_0(PIXLD_0),.PIXLD_1(PIXLD_1),.PIXAD_0(PIXAD_0),.PIXAD_1(PIXAD_1));//[00081] VTIM_(VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
                                                                                //[00082]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
                                                                                //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
                                                                                //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
                                                                                //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);

/* Horizontal Timebase */

wire HCNT_outD_0,HCNT_outD_1,HCNT_outD_2,HCNT_outD_3,HCNT_outD_4,HCNT_outD_5,HCNT_outD_6,HCNT_outD_7;
wire HCNT_enD_0,HCNT_enD_1,HCNT_enD_2,HCNT_enD_3,HCNT_enD_4,HCNT_enD_5,HCNT_enD_6,HCNT_enD_7;

m_HCNT HCNT_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
              .outD_0(HCNT_outD_0),.outD_1(HCNT_outD_1),.outD_2(HCNT_outD_2),.outD_3(HCNT_outD_3),.outD_4(HCNT_outD_4),.outD_5(HCNT_outD_5),.outD_6(HCNT_outD_6),.outD_7(HCNT_outD_7),
              .enD_0(HCNT_enD_0),.enD_1(HCNT_enD_1),.enD_2(HCNT_enD_2),.enD_3(HCNT_enD_3),.enD_4(HCNT_enD_4),.enD_5(HCNT_enD_5),.enD_6(HCNT_enD_6),.enD_7(HCNT_enD_7),
    .RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.HCNTL(HCNTL),.HCNTH(HCNTH),.LPL_0(LPL_0),.LPL_1(LPL_1),.LP(LP),.HLOCK(HLOCK),.NTSC(NTSC),.GENLOCK(GENLOCK),.OPEN(OPEN),.NEXTV(NEXTV),.HVACTIVE(HVACTIVE),.HSYNC(HSYNC),.HC_0(HC_0),.HC_1(HC_1),.HC_2(HC_2),.HC_3(HC_3),.HBORDER(HBORDER),.HBLANKING(HBLANKING),.HVSYNC(HVSYNC),.LPSET(LPSET),.LPCLK(LPCLK),.HD1(HD1),.HVHOLD(HVHOLD),.HINT(HINT));//[00091] HCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
                                                                                //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
                                                                                //[00093]    D_4,D_5,D_6,D_7,RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,HCNTL,
                                                                                //[00094]    HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV);

/* Vertical Timebase */

wire VCNT_outD_0,VCNT_outD_1,VCNT_outD_2,VCNT_outD_3,VCNT_outD_4,VCNT_outD_5,VCNT_outD_6,VCNT_outD_7;
wire VCNT_enD_0,VCNT_enD_1,VCNT_enD_2,VCNT_enD_3,VCNT_enD_4,VCNT_enD_5,VCNT_enD_6,VCNT_enD_7;

m_VCNT VCNT_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
              .outD_0(VCNT_outD_0),.outD_1(VCNT_outD_1),.outD_2(VCNT_outD_2),.outD_3(VCNT_outD_3),.outD_4(VCNT_outD_4),.outD_5(VCNT_outD_5),.outD_6(VCNT_outD_6),.outD_7(VCNT_outD_7),
              .enD_0(VCNT_enD_0),.enD_1(VCNT_enD_1),.enD_2(VCNT_enD_2),.enD_3(VCNT_enD_3),.enD_4(VCNT_enD_4),.enD_5(VCNT_enD_5),.enD_6(VCNT_enD_6),.enD_7(VCNT_enD_7),
    .RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.VCNTL(VCNTL),.VCNTH(VCNTH),.LPL_2(LPL_2),.LPL_3(LPL_3),.VLOCK(VLOCK),.NTSC(NTSC),.GENLOCK(GENLOCK),.STARTL(STARTL),.STARTH(STARTH),.ENDL(ENDL),.ENDH(ENDH),.INTL(INTLLD),.INTH(INTH),.HBORDER(HBORDER),.HBLANKING(HBLANKING),.HVSYNC(HVSYNC),.LPCLK(LPCLK),.HD1(HD1),.DIAG(VCEN),.LORES(LORES),.HINT(HINT),.VVACTIVE(VVACTIVE),.VSYNC(VSYNC),.VINT(VINT),.BORDER(BORDER),.BLANKING(BLANKING),.STARTD(VSTART),.NEXTV(NEXTV));//[00099] VCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
                                                                                //[00100]    VSTART,NEXTV) = VCNT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CCLK,WD_0,WD_1,
                                                                                //[00101]    WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,
                                                                                //[00102]    STARTL,STARTH,ENDL,ENDH,INTLLD,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,VCEN,
                                                                                //[00103]    LORES,HINT);

/* Pixel generator */

wire PIX_outD_0,PIX_outD_1,PIX_outD_2,PIX_outD_3,PIX_outD_4,PIX_outD_5,PIX_outD_6,PIX_outD_7;
wire PIX_enD_0,PIX_enD_1,PIX_enD_2,PIX_enD_3,PIX_enD_4,PIX_enD_5,PIX_enD_6,PIX_enD_7;

m_PIX PIX_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),.inP7L_0(inPD_0),.inP7L_1(inPD_1),.inP7L_2(inPD_2),.inP7L_3(inPD_3),.inP7L_4(inPD_4),.inP7L_5(inPD_5),.inP7L_6(inPD_6),.inP7L_7(inPD_7),.inP7L_8(inPD_8),.inP7L_9(inPD_9),.inP7L_10(inPD_10),.inP7L_11(inPD_11),.inP7L_12(inPD_12),.inP7L_13(inPD_13),.inP7L_14(inPD_14),.inP7L_15(inPD_15),
            .outD_0(PIX_outD_0),.outD_1(PIX_outD_1),.outD_2(PIX_outD_2),.outD_3(PIX_outD_3),.outD_4(PIX_outD_4),.outD_5(PIX_outD_5),.outD_6(PIX_outD_6),.outD_7(PIX_outD_7),.outP7L_0(outPD_0),.outP7L_1(outPD_1),.outP7L_2(outPD_2),.outP7L_3(outPD_3),.outP7L_4(outPD_4),.outP7L_5(outPD_5),.outP7L_6(outPD_6),.outP7L_7(outPD_7),.outP7L_8(outPD_8),.outP7L_9(outPD_9),.outP7L_10(outPD_10),.outP7L_11(outPD_11),.outP7L_12(outPD_12),.outP7L_13(outPD_13),.outP7L_14(outPD_14),.outP7L_15(outPD_15),
            .enD_0(PIX_enD_0),.enD_1(PIX_enD_1),.enD_2(PIX_enD_2),.enD_3(PIX_enD_3),.enD_4(PIX_enD_4),.enD_5(PIX_enD_5),.enD_6(PIX_enD_6),.enD_7(PIX_enD_7),.enP7L_0(enPD_0),.enP7L_1(enPD_1),.enP7L_2(enPD_2),.enP7L_3(enPD_3),.enP7L_4(enPD_4),.enP7L_5(enPD_5),.enP7L_6(enPD_6),.enP7L_7(enPD_7),.enP7L_8(enPD_8),.enP7L_9(enPD_9),.enP7L_10(enPD_10),.enP7L_11(enPD_11),.enP7L_12(enPD_12),.enP7L_13(enPD_13),.enP7L_14(enPD_14),.enP7L_15(enPD_15),
    .RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.MODE(MODE),.BORDL(BORDL),.BORDH(BORDH),.TRANS(TRANS),.MASK(MASK),.INDEX(INDEX),.BORDER(BORDER),.BLANKING(BLANKING),.HC_0(HC_0),.HC_1(HC_1),.A_0(inA_0),.A_1(inA_1),.A_2(inA_2),.A_3(inA_3),.A_4(inA_4),.A_5(inA_5),.A_6(inA_6),.A_7(inA_7),.A_8(inA_8),.RDL(RDL),.WRL(WRL),.WE(WE),.PALCS(PALCS),.PIXLD_0(PIXLD_0),.PIXLD_1(PIXLD_1),.PIXAD_0(PIXAD_0),.PIXAD_1(PIXAD_1),.TMODE(TMODE),.IDL_0(VADL_0),.IDL_1(VADL_1),.IDL_2(VADL_2),.IDL_3(VADL_3),.IDL_4(VADL_4),.IDL_5(VADL_5),.IDL_6(VADL_6),.IDL_7(VADL_7),.IDL_8(VDL_8),.IDL_9(VDL_9),.IDL_10(VDL_10),.IDL_11(VDL_11),.IDL_12(VDL_12),.IDL_13(VDL_13),.IDL_14(VDL_14),.IDL_15(VDL_15),.RL_0(RL_0),.RL_1(RL_1),.RL_2(RL_2),.RL_3(RL_3),.GL_0(GL_0),.GL_1(GL_1),.GL_2(GL_2),.GL_3(GL_3),.BL_0(BL_0),.BL_1(BL_1),.BL_2(BL_2),.BL_3(BL_3),.INC_2(INCL),.MODE_0(MODE_0),.MODE_1(MODE_1),.GENLOCK(GENLOCK),.LORES(LORES),.NOWRAP(NOWRAP),.PA_0(PA_0),.PA_1(PA_1),.PA_2(PA_2),.PA_3(PA_3),.PA_4(PA_4),.PA_5(PA_5),.PA_6(PA_6),.PA_7(PA_7),.POE(POE),.PWE(PWE),.PCS(PCS));//[00109] PIX_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,
                                                                                //[00110]    PD_8,PD_9,PD_10,PD_11,PD_12,PD_13,PD_14,PD_15,RL_0,RL_1,RL_2,RL_3,GL_0,GL_1,
                                                                                //[00111]    GL_2,GL_3,BL_0,BL_1,BL_2,BL_3,INCL,MODE_0,MODE_1,GENLOCK,LORES,NOWRAP,PA_0,
                                                                                //[00112]    PA_1,PA_2,PA_3,PA_4,PA_5,PA_6,PA_7,POE,PWE,PCS) = PIX(D_0,D_1,D_2,D_3,D_4,
                                                                                //[00113]    D_5,D_6,D_7,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
                                                                                //[00114]    PD_12,PD_13,PD_14,PD_15,RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,
                                                                                //[00115]    WD_7,MODE,BORDL,BORDH,TRANS,MASK,INDEX,BORDER,BLANKING,HC_0,HC_1,A_0,A_1,A_2,
                                                                                //[00116]    A_3,A_4,A_5,A_6,A_7,A_8,RDL,WRL,WE,PALCS,PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1,
                                                                                //[00117]    TMODE,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,VADL_7,VDL_8,VDL_9,
                                                                                //[00118]    VDL_10,VDL_11,VDL_12,VDL_13,VDL_14,VDL_15);

/* Interupt handler */

wire INT_outD_0,INT_outD_1,INT_outD_2,INT_outD_3,INT_outD_4,INT_outD_5,INT_outD_6,INT_outD_7;
wire INT_enD_0,INT_enD_1,INT_enD_2,INT_enD_3,INT_enD_4,INT_enD_5,INT_enD_6,INT_enD_7;

m_INT INT_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
            .outD_0(INT_outD_0),.outD_1(INT_outD_1),.outD_2(INT_outD_2),.outD_3(INT_outD_3),.outD_4(INT_outD_4),.outD_5(INT_outD_5),.outD_6(INT_outD_6),.outD_7(INT_outD_7),
            .enD_0(INT_enD_0),.enD_1(INT_enD_1),.enD_2(INT_enD_2),.enD_3(INT_enD_3),.enD_4(INT_enD_4),.enD_5(INT_enD_5),.enD_6(INT_enD_6),.enD_7(INT_enD_7),
    .RESETL_0(RESETL_0),.CLK(CCLK),.VINT(VINT),.AIL_0(AIL_0),.AIL_1(AIL_1),.AIL_2(AIL_2),.INTAL(INTAL),.ACK(ACK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.DIS(DIS),.INTL(INTL));//[00123] INT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,INTL) = INT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,
                                                                                //[00124]    D_7,RESETL_0,CCLK,VINT,AIL_0,AIL_1,AIL_2,INTAL,ACK,WD_0,WD_1,WD_2,WD_3,DIS);

/* Status and diagnostic */

wire STAT_outD_0,STAT_outD_1,STAT_outD_2,STAT_outD_3,STAT_outD_4,STAT_outD_5,STAT_outD_6,STAT_outD_7;
wire STAT_enD_0,STAT_enD_1,STAT_enD_2,STAT_enD_3,STAT_enD_4,STAT_enD_5,STAT_enD_6,STAT_enD_7;

m_STAT STAT_ (.inD_0(inD_0),.inD_1(inD_1),.inD_2(inD_2),.inD_3(inD_3),.inD_4(inD_4),.inD_5(inD_5),.inD_6(inD_6),.inD_7(inD_7),
            .outD_0(STAT_outD_0),.outD_1(STAT_outD_1),.outD_2(STAT_outD_2),.outD_3(STAT_outD_3),.outD_4(STAT_outD_4),.outD_5(STAT_outD_5),.outD_6(STAT_outD_6),.outD_7(STAT_outD_7),
            .enD_0(STAT_enD_0),.enD_1(STAT_enD_1),.enD_2(STAT_enD_2),.enD_3(STAT_enD_3),.enD_4(STAT_enD_4),.enD_5(STAT_enD_5),.enD_6(STAT_enD_6),.enD_7(STAT_enD_7),
    .RESETL_0(RESETL_0),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.STATL(STATL),.DIAGL_0(DIAGL_0),.DIAG_1(DIAG_1),.LCD(LCD),.LPSET(LPSET),.PALL(PALL),.PSRAML(PSRAML),.FASTL(FASTL),.XTALL(XTALL),.OPEN(OPEN),.NTSC(NTSC),.TESTENL(TESTENL),.PSUEDO(PSUEDO),.VCEN(VCEN),.TMODE(TMODE),.FAST(FAST),.TSTCLK(TSTCLK),.MO(MO),.DOEN(DOEN));//[00129] STAT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,FAST,
                                                                                //[00130]    TSTCLK,MO,DOEN) = STAT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,
                                                                                //[00131]    WD_2,WD_3,WD_4,STATL,DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL);

/* MUX bidirectional busses to next level */

assign outD_0  = (BM_outD_0  & BM_enD_0 ) | (HCNT_outD_0 & HCNT_enD_0) | (VCNT_outD_0 & VCNT_enD_0) | (PIX_outD_0 & PIX_enD_0) | (INT_outD_0 & INT_enD_0) | (STAT_outD_0 & STAT_enD_0);
assign outD_1  = (BM_outD_1  & BM_enD_1 ) | (HCNT_outD_1 & HCNT_enD_1) | (VCNT_outD_1 & VCNT_enD_1) | (PIX_outD_1 & PIX_enD_1) | (INT_outD_1 & INT_enD_1) | (STAT_outD_1 & STAT_enD_1);
assign outD_2  = (BM_outD_2  & BM_enD_2 ) | (HCNT_outD_2 & HCNT_enD_2) | (VCNT_outD_2 & VCNT_enD_2) | (PIX_outD_2 & PIX_enD_2) | (INT_outD_2 & INT_enD_2) | (STAT_outD_2 & STAT_enD_2);
assign outD_3  = (BM_outD_3  & BM_enD_3 ) | (HCNT_outD_3 & HCNT_enD_3) | (VCNT_outD_3 & VCNT_enD_3) | (PIX_outD_3 & PIX_enD_3) | (INT_outD_3 & INT_enD_3) | (STAT_outD_3 & STAT_enD_3);
assign outD_4  = (BM_outD_4  & BM_enD_4 ) | (HCNT_outD_4 & HCNT_enD_4) | (VCNT_outD_4 & VCNT_enD_4) | (PIX_outD_4 & PIX_enD_4) | (INT_outD_4 & INT_enD_4) | (STAT_outD_4 & STAT_enD_4);
assign outD_5  = (BM_outD_5  & BM_enD_5 ) | (HCNT_outD_5 & HCNT_enD_5) | (VCNT_outD_5 & VCNT_enD_5) | (PIX_outD_5 & PIX_enD_5) | (INT_outD_5 & INT_enD_5) | (STAT_outD_5 & STAT_enD_5);
assign outD_6  = (BM_outD_6  & BM_enD_6 ) | (HCNT_outD_6 & HCNT_enD_6) | (VCNT_outD_6 & VCNT_enD_6) | (PIX_outD_6 & PIX_enD_6) | (INT_outD_6 & INT_enD_6) | (STAT_outD_6 & STAT_enD_6);
assign outD_7  = (BM_outD_7  & BM_enD_7 ) | (HCNT_outD_7 & HCNT_enD_7) | (VCNT_outD_7 & VCNT_enD_7) | (PIX_outD_7 & PIX_enD_7) | (INT_outD_7 & INT_enD_7) | (STAT_outD_7 & STAT_enD_7);
assign outD_8  = (BM_outD_8  & BM_enD_8 );
assign outD_9  = (BM_outD_9  & BM_enD_9 );
assign outD_10 = (BM_outD_10 & BM_enD_10);
assign outD_11 = (BM_outD_11 & BM_enD_11);
assign outD_12 = (BM_outD_12 & BM_enD_12);
assign outD_13 = (BM_outD_13 & BM_enD_13);
assign outD_14 = (BM_outD_14 & BM_enD_14);
assign outD_15 = (BM_outD_15 & BM_enD_15);

assign enD_0  = BM_enD_0 | HCNT_enD_0 | VCNT_enD_0 | PIX_enD_0 | INT_enD_0 | STAT_enD_0; 
assign enD_1  = BM_enD_1 | HCNT_enD_1 | VCNT_enD_1 | PIX_enD_1 | INT_enD_1 | STAT_enD_1; 
assign enD_2  = BM_enD_2 | HCNT_enD_2 | VCNT_enD_2 | PIX_enD_2 | INT_enD_2 | STAT_enD_2; 
assign enD_3  = BM_enD_3 | HCNT_enD_3 | VCNT_enD_3 | PIX_enD_3 | INT_enD_3 | STAT_enD_3; 
assign enD_4  = BM_enD_4 | HCNT_enD_4 | VCNT_enD_4 | PIX_enD_4 | INT_enD_4 | STAT_enD_4; 
assign enD_5  = BM_enD_5 | HCNT_enD_5 | VCNT_enD_5 | PIX_enD_5 | INT_enD_5 | STAT_enD_5; 
assign enD_6  = BM_enD_6 | HCNT_enD_6 | VCNT_enD_6 | PIX_enD_6 | INT_enD_6 | STAT_enD_6; 
assign enD_7  = BM_enD_7 | HCNT_enD_7 | VCNT_enD_7 | PIX_enD_7 | INT_enD_7 | STAT_enD_7; 
assign enD_8  = BM_enD_8 ; 
assign enD_9  = BM_enD_9 ; 
assign enD_10 = BM_enD_10; 
assign enD_11 = BM_enD_11; 
assign enD_12 = BM_enD_12; 
assign enD_13 = BM_enD_13; 
assign enD_14 = BM_enD_14; 
assign enD_15 = BM_enD_15; 

endmodule                                                                       //[00134] END MODULE;