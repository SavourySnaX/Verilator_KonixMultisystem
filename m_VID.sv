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

    inout    A_0,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_1,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_2,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_3,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_4,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_5,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_6,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_7,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_8,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_9,                                                               //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_10,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_11,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_12,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_13,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_14,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_15,                                                              //[00017] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_16,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_17,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_18,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    A_19,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_0,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_1,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_2,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_3,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_4,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_5,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_6,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_7,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_8,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_9,                                                               //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_10,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_11,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_12,                                                              //[00018]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
    inout    D_13,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    D_14,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    D_15,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_0,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_1,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_2,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_3,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_4,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_5,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_6,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_7,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_8,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_9,                                                              //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_10,                                                             //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_11,                                                             //[00019]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
    inout    PD_12,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    inout    PD_13,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    inout    PD_14,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
    inout    PD_15,                                                             //[00020]    PD_12,PD_13,PD_14,PD_15,VADL_0,VADL_1,VADL_2,VADL_3,VADL_4,VADL_5,VADL_6,
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
//    output    A_0,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_1,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_2,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_3,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_4,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_5,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_6,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_7,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_8,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_9,                                                            //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_10,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_11,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_12,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_13,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_14,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_15,                                                           //[00025] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_16,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_17,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_18,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    A_19,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_0,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_1,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_2,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_3,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_4,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_5,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_6,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_7,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_8,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_9,                                                            //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_10,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_11,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_12,                                                           //[00026]    A_16,A_17,A_18,A_19,D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,
//    output    D_13,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    D_14,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    D_15,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_0,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_1,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_2,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_3,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_4,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_5,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_6,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_7,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_8,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_9,                                                           //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_10,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_11,                                                          //[00027]    D_13,D_14,D_15,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,PD_8,PD_9,PD_10,PD_11,
//    output    PD_12,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
//    output    PD_13,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
//    output    PD_14,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
//    output    PD_15,                                                          //[00028]    PD_12,PD_13,PD_14,PD_15,VAD_0,VAD_1,VAD_2,VAD_3,VAD_4,VAD_5,VAD_6,VAD_7,ADEN,
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
    output    DQCLK,                                                             //[00035]    GPIOL_1,DQCLK;



output SA_0,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_1,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_2,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_3,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_4,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_5,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_6,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_7,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_8,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_9,                                                                      //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_10,                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_11,                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_12,                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_13,                                                                     //[00066]    SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,
output SA_14,                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
output SA_15,                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
output SA_16,                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
output SA_17,                                                                     //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);
output SAEN                                                                      //[00067]    SA_14,SA_15,SA_16,SA_17,SAEN,MUXL,BRD,DRD,BWR,DWR);

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

/* Clock generator */

m_CLOCK CLOCK_ (.MCK(XTALL),.VRD(VRD),.VWR(VWR),.NTSC(NTSC),.FAST(FAST),.TSTCLK(TSTCLK),.LP(LP),.PCLKL(PCLKL),.CCLK(ICCLK),.CHROMAL(CHROMAL),.DQCLK(DQCLK));//[00041] CLOCK_(PCLKL,ICCLK,CHROMAL,DQCLK) = CLOCK(XTALL,VRD,VWR,NTSC,FAST,TSTCLK,LP);

/* IO decodes */

m_IODEC IODEC_ (.RESETL_0(RESETL_0),.CLK(CCLK),.IOML(IOML),.VRD(VRD),.VWR(VWR),.A_0(A_0),.A_1(A_1),.A_2(A_2),.A_3(A_3),.A_4(A_4),.A_5(A_5),.A_6(A_6),.A_7(A_7),.IORDL(IORDL),.IOWRL(IOWRL),.BCSL(BCSL),.JOYL_0(JOYL_0),.JOYL_1(JOYL_1),.JOYL_2(JOYL_2),.SSIORD(SSIORD),.INTL(INTLLD),.INTH(INTH),.STARTL(STARTL),.STARTH(STARTH),.HCNTL(HCNTL),.HCNTH(HCNTH),.VCNTL(VCNTL),.VCNTH(VCNTH),.SCRL_0(SCRL_0),.SCRL_1(SCRL_1),.SCRL_2(SCRL_2),.MODE(MODE),.BORDL(BORDL),.BORDH(BORDH),.TRANS(TRANS),.MASK(MASK),.INDEX(INDEX),.ENDL(ENDL),.ENDH(ENDH),.MEMLD(MEMLD),.DIAGL_0(DIAGL_0),.DIAG_1(DIAG_1),.LPL_0(LPL_0),.LPL_1(LPL_1),.LPL_2(LPL_2),.LPL_3(LPL_3),.STATL(STATL),.LCD(LCD),.ACK(ACK),.DIS(DIS),.GPIOL_0(GPIOL_0),.GPIOL_1(GPIOL_1));//[00045] IODEC_(IORDL,IOWRL,BCSL,JOYL_0,JOYL_1,JOYL_2,SSIORD,INTLLD,INTH,STARTL,STARTH,
                                                                                //[00046]    HCNTL,HCNTH,VCNTL,VCNTH,SCRL_0,SCRL_1,SCRL_2,MODE,BORDL,BORDH,TRANS,MASK,
                                                                                //[00047]    INDEX,ENDL,ENDH,MEMLD,DIAGL_0,DIAG_1,LPL_0,LPL_1,LPL_2,LPL_3,STATL,LCD,ACK,
                                                                                //[00048]    DIS,GPIOL_0,GPIOL_1) = IODEC(RESETL_0,CCLK,IOML,VRD,VWR,A_0,A_1,A_2,A_3,A_4,
                                                                                //[00049]    A_5,A_6,A_7);

/* Bus manager */

m_BM BM_ (.A_0(A_0),.A_1(A_1),.A_2(A_2),.A_3(A_3),.A_4(A_4),.A_5(A_5),.A_6(A_6),.A_7(A_7),.A_8(A_8),.A_9(A_9),.A_10(A_10),.A_11(A_11),.A_12(A_12),.A_13(A_13),.A_14(A_14),.A_15(A_15),.A_16(A_16),.A_17(A_17),.A_18(A_18),.A_19(A_19),.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.D_8(D_8),.D_9(D_9),.D_10(D_10),.D_11(D_11),.D_12(D_12),.D_13(D_13),.D_14(D_14),.D_15(D_15),.RESETL_0(RESETL_0),.VADL_0(VADL_0),.VADL_1(VADL_1),.VADL_2(VADL_2),.VADL_3(VADL_3),.VADL_4(VADL_4),.VADL_5(VADL_5),.VADL_6(VADL_6),.VADL_7(VADL_7),.VAL_8(VAL_8),.VAL_9(VAL_9),.VAL_10(VAL_10),.VAL_11(VAL_11),.VAL_12(VAL_12),.VAL_13(VAL_13),.VAL_14(VAL_14),.VAL_15(VAL_15),.VDL_8(VDL_8),.VDL_9(VDL_9),.VDL_10(VDL_10),.VDL_11(VDL_11),.VDL_12(VDL_12),.VDL_13(VDL_13),.VDL_14(VDL_14),.VDL_15(VDL_15),.VRD(VRD),.VWR(VWR),.ASL_16(ASL_16),.ASL_17(ASL_17),.ASL_18(ASL_18),.ASL_19(ASL_19),.IOML(IOML),.ALEL(ALEL),.INTAL(INTAL),.HLDAL(HLDAL),.BHOLDL(BHOLDL),.BWORD(BWORD),.DWORD(DWORD),.VHOLDL(VHOLDL),.SSIORD(SSIORD),.JOYL_0(JOYL_0),.JOYL_1(JOYL_1),.SA_0(SA_0),.SA_1(SA_1),.SA_2(SA_2),.SA_3(SA_3),.SA_4(SA_4),.SA_5(SA_5),.SA_6(SA_6),.SA_7(SA_7),.SA_8(SA_8),.SA_9(SA_9),.SA_10(SA_10),.SA_11(SA_11),.SA_12(SA_12),.SA_13(SA_13),.SA_14(SA_14),.SA_15(SA_15),.SA_16(SA_16),.SA_17(SA_17),.SAEN(SAEN),.MUXL(MUXL),.BRD(BRD),.DRD(DRD),.BWR(BWR),.DWR(DWR),.VAD_0(VAD_0),.VAD_1(VAD_1),.VAD_2(VAD_2),.VAD_3(VAD_3),.VAD_4(VAD_4),.VAD_5(VAD_5),.VAD_6(VAD_6),.VAD_7(VAD_7),.ADEN(ADEN),.VAL_0(VAL_0),.VAL_1(VAL_1),.VAL_2(VAL_2),.VAL_3(VAL_3),.VAL_4(VAL_4),.VAL_5(VAL_5),.VAL_6(VAL_6),.VAL_7(VAL_7),.VA_8(VA_8),.VA_9(VA_9),.VA_10(VA_10),.VA_11(VA_11),.VA_12(VA_12),.VA_13(VA_13),.VA_14(VA_14),.VA_15(VA_15),.AEN(AEN),.VAL_16(VAL_16),.VAL_17(VAL_17),.DEN(DEN),.VD_8(VD_8),.VD_9(VD_9),.VD_10(VD_10),.VD_11(VD_11),.VD_12(VD_12),.VD_13(VD_13),.VD_14(VD_14),.VD_15(VD_15),.VRDL(VRDL),.VWRL(VWRL),.HOLDL(HOLDL),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.PALCS(PALCS),.DCSL(DCSL),.RDL(RDL),.WRL(WRL));//[00054] BM_(A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,A_16,
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

m_MEM MEM_ (.RESETL_0(RESETL_0),.CLK(CCLK),.DQCLK(DQCLK),.BMREQ(BMREQ),.DMREQ(DMREQ),.HLDAL(HLDAL),.RDL(RDL),.WRL(WRL),.IOML(IOML),.A_0(A_0),.A_18(A_18),.A_19(A_19),.VBUSYL_0(VBUSYL_0),.VBUSYL_1(VBUSYL_1),.VCS(VCS),.VOE(VOE),.VCAS(VCAS),.VRAS(VRAS),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.MEMLD(MEMLD),.PSUEDO(PSUEDO),.BWORD(BWORD),.DWORD(DWORD),.CAS(CAS),.MUXL(MUXL),.WAITL(WAITL),.SCE_0(SCE_0),.SCE_1(SCE_1),.WE(WE),.DWE(DWE),.CS_0(CS_0),.CS_1(CS_1),.OE(OE));//[00073] MEM_(CAS,MUXL,WAITL,SCE_0,SCE_1,WE,DWE,CS_0,CS_1,OE) = MEM(RESETL_0,CCLK,DQCLK,
                                                                                //[00074]    BMREQ,DMREQ,HLDAL,RDL,WRL,IOML,A_0,A_18,A_19,VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,
                                                                                //[00075]    VRAS,WD_0,WD_1,WD_2,WD_3,MEMLD,PSUEDO,BWORD,DWORD);

/* Video timing generator */

m_VTIM VTIM_ (.RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.MODE_0(MODE_0),.MODE_1(MODE_1),.SCRL_0(SCRL_0),.SCRL_1(SCRL_1),.SCRL_2(SCRL_2),.VVACTIVE(VVACTIVE),.HVACTIVE(HVACTIVE),.VSTART(VSTART),.HC_0(HC_0),.HC_1(HC_1),.HC_2(HC_2),.HC_3(HC_3),.HD1(HD1),.PSUEDO(PSUEDO),.HVHOLD(HVHOLD),.NOWRAP(NOWRAP),.VBUSYL_0(VBUSYL_0),.VBUSYL_1(VBUSYL_1),.VCS(VCS),.VOE(VOE),.VCAS(VCAS),.VRAS(VRAS),.SAEN(SAEN),.SA_0(SA_0),.SA_1(SA_1),.SA_2(SA_2),.SA_3(SA_3),.SA_4(SA_4),.SA_5(SA_5),.SA_6(SA_6),.SA_7(SA_7),.SA_8(SA_8),.SA_9(SA_9),.SA_10(SA_10),.SA_11(SA_11),.SA_12(SA_12),.SA_13(SA_13),.SA_14(SA_14),.SA_15(SA_15),.SA_16(SA_16),.SA_17(SA_17),.VHOLDL(VHOLDL),.PIXLD_0(PIXLD_0),.PIXLD_1(PIXLD_1),.PIXAD_0(PIXAD_0),.PIXAD_1(PIXAD_1));//[00081] VTIM_(VBUSYL_0,VBUSYL_1,VCS,VOE,VCAS,VRAS,SAEN,SA_0,SA_1,SA_2,SA_3,SA_4,SA_5,
                                                                                //[00082]    SA_6,SA_7,SA_8,SA_9,SA_10,SA_11,SA_12,SA_13,SA_14,SA_15,SA_16,SA_17,VHOLDL,
                                                                                //[00083]    PIXLD_0,PIXLD_1,PIXAD_0,PIXAD_1) = VTIM(RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,
                                                                                //[00084]    WD_4,WD_5,WD_6,WD_7,MODE_0,MODE_1,SCRL_0,SCRL_1,SCRL_2,VVACTIVE,HVACTIVE,
                                                                                //[00085]    VSTART,HC_0,HC_1,HC_2,HC_3,HD1,PSUEDO,HVHOLD,NOWRAP);

/* Horizontal Timebase */

m_HCNT HCNT_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.HCNTL(HCNTL),.HCNTH(HCNTH),.LPL_0(LPL_0),.LPL_1(LPL_1),.LP(LP),.HLOCK(HLOCK),.NTSC(NTSC),.GENLOCK(GENLOCK),.OPEN(OPEN),.NEXTV(NEXTV),.HVACTIVE(HVACTIVE),.HSYNC(HSYNC),.HC_0(HC_0),.HC_1(HC_1),.HC_2(HC_2),.HC_3(HC_3),.HBORDER(HBORDER),.HBLANKING(HBLANKING),.HVSYNC(HVSYNC),.LPSET(LPSET),.LPCLK(LPCLK),.HD1(HD1),.HVHOLD(HVHOLD),.HINT(HINT));//[00091] HCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,HVACTIVE,HSYNC,HC_0,HC_1,HC_2,HC_3,
                                                                                //[00092]    HBORDER,HBLANKING,HVSYNC,LPSET,LPCLK,HD1,HVHOLD,HINT) = HCNT(D_0,D_1,D_2,D_3,
                                                                                //[00093]    D_4,D_5,D_6,D_7,RESETL_0,CCLK,WD_0,WD_1,WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,HCNTL,
                                                                                //[00094]    HCNTH,LPL_0,LPL_1,LP,HLOCK,NTSC,GENLOCK,OPEN,NEXTV);

/* Vertical Timebase */

m_VCNT VCNT_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.VCNTL(VCNTL),.VCNTH(VCNTH),.LPL_2(LPL_2),.LPL_3(LPL_3),.VLOCK(VLOCK),.NTSC(NTSC),.GENLOCK(GENLOCK),.STARTL(STARTL),.STARTH(STARTH),.ENDL(ENDL),.ENDH(ENDH),.INTL(INTLLD),.INTH(INTH),.HBORDER(HBORDER),.HBLANKING(HBLANKING),.HVSYNC(HVSYNC),.LPCLK(LPCLK),.HD1(HD1),.DIAG(VCEN),.LORES(LORES),.HINT(HINT),.VVACTIVE(VVACTIVE),.VSYNC(VSYNC),.VINT(VINT),.BORDER(BORDER),.BLANKING(BLANKING),.STARTD(VSTART),.NEXTV(NEXTV));//[00099] VCNT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,VVACTIVE,VSYNC,VINT,BORDER,BLANKING,
                                                                                //[00100]    VSTART,NEXTV) = VCNT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,CCLK,WD_0,WD_1,
                                                                                //[00101]    WD_2,WD_3,WD_4,WD_5,WD_6,WD_7,VCNTL,VCNTH,LPL_2,LPL_3,VLOCK,NTSC,GENLOCK,
                                                                                //[00102]    STARTL,STARTH,ENDL,ENDH,INTLLD,INTH,HBORDER,HBLANKING,HVSYNC,LPCLK,HD1,VCEN,
                                                                                //[00103]    LORES,HINT);

/* Pixel generator */

m_PIX PIX_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.P7L_0(PD_0),.P7L_1(PD_1),.P7L_2(PD_2),.P7L_3(PD_3),.P7L_4(PD_4),.P7L_5(PD_5),.P7L_6(PD_6),.P7L_7(PD_7),.P7L_8(PD_8),.P7L_9(PD_9),.P7L_10(PD_10),.P7L_11(PD_11),.P7L_12(PD_12),.P7L_13(PD_13),.P7L_14(PD_14),.P7L_15(PD_15),.RESETL_0(RESETL_0),.CLK(CCLK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.WD_5(WD_5),.WD_6(WD_6),.WD_7(WD_7),.MODE(MODE),.BORDL(BORDL),.BORDH(BORDH),.TRANS(TRANS),.MASK(MASK),.INDEX(INDEX),.BORDER(BORDER),.BLANKING(BLANKING),.HC_0(HC_0),.HC_1(HC_1),.A_0(A_0),.A_1(A_1),.A_2(A_2),.A_3(A_3),.A_4(A_4),.A_5(A_5),.A_6(A_6),.A_7(A_7),.A_8(A_8),.RDL(RDL),.WRL(WRL),.WE(WE),.PALCS(PALCS),.PIXLD_0(PIXLD_0),.PIXLD_1(PIXLD_1),.PIXAD_0(PIXAD_0),.PIXAD_1(PIXAD_1),.TMODE(TMODE),.IDL_0(VADL_0),.IDL_1(VADL_1),.IDL_2(VADL_2),.IDL_3(VADL_3),.IDL_4(VADL_4),.IDL_5(VADL_5),.IDL_6(VADL_6),.IDL_7(VADL_7),.IDL_8(VDL_8),.IDL_9(VDL_9),.IDL_10(VDL_10),.IDL_11(VDL_11),.IDL_12(VDL_12),.IDL_13(VDL_13),.IDL_14(VDL_14),.IDL_15(VDL_15),.RL_0(RL_0),.RL_1(RL_1),.RL_2(RL_2),.RL_3(RL_3),.GL_0(GL_0),.GL_1(GL_1),.GL_2(GL_2),.GL_3(GL_3),.BL_0(BL_0),.BL_1(BL_1),.BL_2(BL_2),.BL_3(BL_3),.INC_2(INCL),.MODE_0(MODE_0),.MODE_1(MODE_1),.GENLOCK(GENLOCK),.LORES(LORES),.NOWRAP(NOWRAP),.PA_0(PA_0),.PA_1(PA_1),.PA_2(PA_2),.PA_3(PA_3),.PA_4(PA_4),.PA_5(PA_5),.PA_6(PA_6),.PA_7(PA_7),.POE(POE),.PWE(PWE),.PCS(PCS));//[00109] PIX_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,PD_0,PD_1,PD_2,PD_3,PD_4,PD_5,PD_6,PD_7,
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

m_INT INT_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.RESETL_0(RESETL_0),.CLK(CCLK),.VINT(VINT),.AIL_0(AIL_0),.AIL_1(AIL_1),.AIL_2(AIL_2),.INTAL(INTAL),.ACK(ACK),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.DIS(DIS),.INTL(INTL));//[00123] INT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,INTL) = INT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,
                                                                                //[00124]    D_7,RESETL_0,CCLK,VINT,AIL_0,AIL_1,AIL_2,INTAL,ACK,WD_0,WD_1,WD_2,WD_3,DIS);

/* Status and diagnostic */

m_STAT STAT_ (.D_0(D_0),.D_1(D_1),.D_2(D_2),.D_3(D_3),.D_4(D_4),.D_5(D_5),.D_6(D_6),.D_7(D_7),.RESETL_0(RESETL_0),.WD_0(WD_0),.WD_1(WD_1),.WD_2(WD_2),.WD_3(WD_3),.WD_4(WD_4),.STATL(STATL),.DIAGL_0(DIAGL_0),.DIAG_1(DIAG_1),.LCD(LCD),.LPSET(LPSET),.PALL(PALL),.PSRAML(PSRAML),.FASTL(FASTL),.XTALL(XTALL),.OPEN(OPEN),.NTSC(NTSC),.TESTENL(TESTENL),.PSUEDO(PSUEDO),.VCEN(VCEN),.TMODE(TMODE),.FAST(FAST),.TSTCLK(TSTCLK),.MO(MO),.DOEN(DOEN));//[00129] STAT_(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,OPEN,NTSC,TESTENL,PSUEDO,VCEN,TMODE,FAST,
                                                                                //[00130]    TSTCLK,MO,DOEN) = STAT(D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,RESETL_0,WD_0,WD_1,
                                                                                //[00131]    WD_2,WD_3,WD_4,STATL,DIAGL_0,DIAG_1,LCD,LPSET,PALL,PSRAML,FASTL,XTALL);

endmodule                                                                       //[00134] END MODULE;