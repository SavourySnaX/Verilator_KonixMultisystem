                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
addrout
19/10/88

Blitter output address multiplexer

Two signals, pcen and srcen enable program and source addresses for output.
Pcen takes priority.

A18 and A19 have their own enables to get them out damn fast.

****************************************************************************/

module m_ADDROUT                                                                //[00017] MODULE ADDROUT;
(                                                                               //[00017] MODULE ADDROUT;

    inout    A_0,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_1,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_2,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_3,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_4,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_5,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_6,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_7,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_8,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_9,                                                               //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_10,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_11,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_12,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_13,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_14,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_15,                                                              //[00019] INPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
    inout    A_16,                                                              //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    inout    A_17,                                                              //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    inout    A_18,                                                              //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    inout    A_19,                                                              //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_0,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_1,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_2,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_3,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_4,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_5,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_6,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_7,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_8,                                                             //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
    input    SAL_9,                                                             //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_10,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_11,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_12,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_13,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_14,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_15,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_16,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_17,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_18,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    SAL_19,                                                            //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
    input    DAL_0,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_1,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_2,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_3,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_4,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_5,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_6,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_7,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_8,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_9,                                                             //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_10,                                                            //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_11,                                                            //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
    input    DAL_12,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_13,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_14,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_15,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_16,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_17,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_18,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    DAL_19,                                                            //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    PCL_0,                                                             //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    PCL_1,                                                             //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    PCL_2,                                                             //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
    input    PCL_3,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_4,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_5,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_6,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_7,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_8,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_9,                                                             //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_10,                                                            //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_11,                                                            //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_12,                                                            //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_13,                                                            //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_14,                                                            //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
    input    PCL_15,                                                            //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    PCL_16,                                                            //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    PCL_17,                                                            //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    PCL_18,                                                            //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    PCL_19,                                                            //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    PCEN,                                                              //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    SRCRD,                                                             //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
    input    BUSOE                                                              //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
                                                                                //[00020]    A_16,A_17,A_18,A_19,SAL_0,SAL_1,SAL_2,SAL_3,SAL_4,SAL_5,SAL_6,SAL_7,SAL_8,
                                                                                //[00021]    SAL_9,SAL_10,SAL_11,SAL_12,SAL_13,SAL_14,SAL_15,SAL_16,SAL_17,SAL_18,SAL_19,
                                                                                //[00022]    DAL_0,DAL_1,DAL_2,DAL_3,DAL_4,DAL_5,DAL_6,DAL_7,DAL_8,DAL_9,DAL_10,DAL_11,
                                                                                //[00023]    DAL_12,DAL_13,DAL_14,DAL_15,DAL_16,DAL_17,DAL_18,DAL_19,PCL_0,PCL_1,PCL_2,
                                                                                //[00024]    PCL_3,PCL_4,PCL_5,PCL_6,PCL_7,PCL_8,PCL_9,PCL_10,PCL_11,PCL_12,PCL_13,PCL_14,
                                                                                //[00025]    PCL_15,PCL_16,PCL_17,PCL_18,PCL_19,PCEN,SRCRD,BUSOE;
//    output    A_0,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_1,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_2,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_3,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_4,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_5,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_6,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_7,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_8,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_9,                                                            //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_10,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_11,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_12,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_13,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_14,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_15,                                                           //[00026] OUTPUTS	A_0,A_1,A_2,A_3,A_4,A_5,A_6,A_7,A_8,A_9,A_10,A_11,A_12,A_13,A_14,A_15,
//    output    A_16,                                                           //[00027]    A_16,A_17,A_18,A_19;
//    output    A_17,                                                           //[00027]    A_16,A_17,A_18,A_19;
//    output    A_18,                                                           //[00027]    A_16,A_17,A_18,A_19;
//    output    A_19                                                            //[00027]    A_16,A_17,A_18,A_19;
);                                                                              //[00017] MODULE ADDROUT;
                                                                                //[00028] LEVEL FUNCTION;
wire SRCRDL;                                                                    //[00033] SRCRDINV_(SRCRDL) = N1C(SRCRD);
wire SRCSEL;                                                                    //[00034] SRCSEL_(SRCSEL) = B3A (SRCRD);
wire DSTSEL;                                                                    //[00035] DSTSEL_(DSTSEL) = NR2C (SRCRD,PCEN);
wire DSTSELH;                                                                   //[00036] DSTSELH_(DSTSELH) = NR2C (SRCRD,PCEN);
wire PCENB;                                                                     //[00037] PCENB_(PCENB) = B3A (PCEN);
wire AOUT_0;                                                                    //[00041] AOUT_0_(AOUT_0) = AO11A(PCENB,PCL_0,DSTSEL,DAL_0,SRCSEL,SAL_0);
wire AOUT_1;                                                                    //[00042] AOUT_1_(AOUT_1) = AO11A(PCENB,PCL_1,DSTSEL,DAL_1,SRCSEL,SAL_1);
wire AOUT_2;                                                                    //[00043] AOUT_2_(AOUT_2) = AO11A(PCENB,PCL_2,DSTSEL,DAL_2,SRCSEL,SAL_2);
wire AOUT_3;                                                                    //[00044] AOUT_3_(AOUT_3) = AO11A(PCENB,PCL_3,DSTSEL,DAL_3,SRCSEL,SAL_3);
wire AOUT_4;                                                                    //[00045] AOUT_4_(AOUT_4) = AO11A(PCENB,PCL_4,DSTSEL,DAL_4,SRCSEL,SAL_4);
wire AOUT_5;                                                                    //[00046] AOUT_5_(AOUT_5) = AO11A(PCENB,PCL_5,DSTSEL,DAL_5,SRCSEL,SAL_5);
wire AOUT_6;                                                                    //[00047] AOUT_6_(AOUT_6) = AO11A(PCENB,PCL_6,DSTSEL,DAL_6,SRCSEL,SAL_6);
wire AOUT_7;                                                                    //[00048] AOUT_7_(AOUT_7) = AO11A(PCENB,PCL_7,DSTSEL,DAL_7,SRCSEL,SAL_7);
wire AOUT_8;                                                                    //[00049] AOUT_8_(AOUT_8) = AO11A(PCENB,PCL_8,DSTSEL,DAL_8,SRCSEL,SAL_8);
wire AOUT_9;                                                                    //[00050] AOUT_9_(AOUT_9) = AO11A(PCENB,PCL_9,DSTSEL,DAL_9,SRCSEL,SAL_9);
wire AOUT_10;                                                                   //[00051] AOUT_10_(AOUT_10) = AO11A(PCENB,PCL_10,DSTSEL,DAL_10,SRCSEL,SAL_10);
wire AOUT_11;                                                                   //[00052] AOUT_11_(AOUT_11) = AO11A(PCENB,PCL_11,DSTSEL,DAL_11,SRCSEL,SAL_11);
wire AOUT_12;                                                                   //[00053] AOUT_12_(AOUT_12) = AO11A(PCENB,PCL_12,DSTSEL,DAL_12,SRCSEL,SAL_12);
wire AOUT_13;                                                                   //[00054] AOUT_13_(AOUT_13) = AO11A(PCENB,PCL_13,DSTSEL,DAL_13,SRCSEL,SAL_13);
wire AOUT_14;                                                                   //[00055] AOUT_14_(AOUT_14) = AO11A(PCENB,PCL_14,DSTSEL,DAL_14,SRCSEL,SAL_14);
wire AOUT_15;                                                                   //[00056] AOUT_15_(AOUT_15) = AO11A(PCENB,PCL_15,DSTSEL,DAL_15,SRCSEL,SAL_15);
wire AOUT_16;                                                                   //[00057] AOUT_16_(AOUT_16) = AO11A(PCENB,PCL_16,DSTSEL,DAL_16,SRCSEL,SAL_16);
wire AOUT_17;                                                                   //[00058] AOUT_17_(AOUT_17) = AO11A(PCENB,PCL_17,DSTSEL,DAL_17,SRCSEL,SAL_17);
wire AOUT_18;                                                                   //[00059] AOUT_18_(AOUT_18) = AO11A(PCEN,PCL_18,DSTSELH,DAL_18,SRCRD,SAL_18);
wire AOUT_19;                                                                   //[00060] AOUT_19_(AOUT_19) = AO11A(PCEN,PCL_19,DSTSELH,DAL_19,SRCRD,SAL_19);

/* Generate select */

assign SRCRDL = ~SRCRD;                                                         //[00033] SRCRDINV_(SRCRDL) = N1C(SRCRD);
assign SRCSEL = SRCRD;                                                          //[00034] SRCSEL_(SRCSEL) = B3A (SRCRD);
assign DSTSEL = ~(SRCRD | PCEN);                                                //[00035] DSTSEL_(DSTSEL) = NR2C (SRCRD,PCEN);
assign DSTSELH = ~(SRCRD | PCEN);                                               //[00036] DSTSELH_(DSTSELH) = NR2C (SRCRD,PCEN);
assign PCENB = PCEN;                                                            //[00037] PCENB_(PCENB) = B3A (PCEN);

/* Select the output bits */

assign AOUT_0 = ~((PCENB & PCL_0) | (DSTSEL & DAL_0) | (DAL_0 & SRCSEL));       //[00041] AOUT_0_(AOUT_0) = AO11A(PCENB,PCL_0,DSTSEL,DAL_0,SRCSEL,SAL_0);
assign AOUT_1 = ~((PCENB & PCL_1) | (DSTSEL & DAL_1) | (DAL_1 & SRCSEL));       //[00042] AOUT_1_(AOUT_1) = AO11A(PCENB,PCL_1,DSTSEL,DAL_1,SRCSEL,SAL_1);
assign AOUT_2 = ~((PCENB & PCL_2) | (DSTSEL & DAL_2) | (DAL_2 & SRCSEL));       //[00043] AOUT_2_(AOUT_2) = AO11A(PCENB,PCL_2,DSTSEL,DAL_2,SRCSEL,SAL_2);
assign AOUT_3 = ~((PCENB & PCL_3) | (DSTSEL & DAL_3) | (DAL_3 & SRCSEL));       //[00044] AOUT_3_(AOUT_3) = AO11A(PCENB,PCL_3,DSTSEL,DAL_3,SRCSEL,SAL_3);
assign AOUT_4 = ~((PCENB & PCL_4) | (DSTSEL & DAL_4) | (DAL_4 & SRCSEL));       //[00045] AOUT_4_(AOUT_4) = AO11A(PCENB,PCL_4,DSTSEL,DAL_4,SRCSEL,SAL_4);
assign AOUT_5 = ~((PCENB & PCL_5) | (DSTSEL & DAL_5) | (DAL_5 & SRCSEL));       //[00046] AOUT_5_(AOUT_5) = AO11A(PCENB,PCL_5,DSTSEL,DAL_5,SRCSEL,SAL_5);
assign AOUT_6 = ~((PCENB & PCL_6) | (DSTSEL & DAL_6) | (DAL_6 & SRCSEL));       //[00047] AOUT_6_(AOUT_6) = AO11A(PCENB,PCL_6,DSTSEL,DAL_6,SRCSEL,SAL_6);
assign AOUT_7 = ~((PCENB & PCL_7) | (DSTSEL & DAL_7) | (DAL_7 & SRCSEL));       //[00048] AOUT_7_(AOUT_7) = AO11A(PCENB,PCL_7,DSTSEL,DAL_7,SRCSEL,SAL_7);
assign AOUT_8 = ~((PCENB & PCL_8) | (DSTSEL & DAL_8) | (DAL_8 & SRCSEL));       //[00049] AOUT_8_(AOUT_8) = AO11A(PCENB,PCL_8,DSTSEL,DAL_8,SRCSEL,SAL_8);
assign AOUT_9 = ~((PCENB & PCL_9) | (DSTSEL & DAL_9) | (DAL_9 & SRCSEL));       //[00050] AOUT_9_(AOUT_9) = AO11A(PCENB,PCL_9,DSTSEL,DAL_9,SRCSEL,SAL_9);
assign AOUT_10 = ~((PCENB & PCL_10) | (DSTSEL & DAL_10) | (DAL_10 & SRCSEL));   //[00051] AOUT_10_(AOUT_10) = AO11A(PCENB,PCL_10,DSTSEL,DAL_10,SRCSEL,SAL_10);
assign AOUT_11 = ~((PCENB & PCL_11) | (DSTSEL & DAL_11) | (DAL_11 & SRCSEL));   //[00052] AOUT_11_(AOUT_11) = AO11A(PCENB,PCL_11,DSTSEL,DAL_11,SRCSEL,SAL_11);
assign AOUT_12 = ~((PCENB & PCL_12) | (DSTSEL & DAL_12) | (DAL_12 & SRCSEL));   //[00053] AOUT_12_(AOUT_12) = AO11A(PCENB,PCL_12,DSTSEL,DAL_12,SRCSEL,SAL_12);
assign AOUT_13 = ~((PCENB & PCL_13) | (DSTSEL & DAL_13) | (DAL_13 & SRCSEL));   //[00054] AOUT_13_(AOUT_13) = AO11A(PCENB,PCL_13,DSTSEL,DAL_13,SRCSEL,SAL_13);
assign AOUT_14 = ~((PCENB & PCL_14) | (DSTSEL & DAL_14) | (DAL_14 & SRCSEL));   //[00055] AOUT_14_(AOUT_14) = AO11A(PCENB,PCL_14,DSTSEL,DAL_14,SRCSEL,SAL_14);
assign AOUT_15 = ~((PCENB & PCL_15) | (DSTSEL & DAL_15) | (DAL_15 & SRCSEL));   //[00056] AOUT_15_(AOUT_15) = AO11A(PCENB,PCL_15,DSTSEL,DAL_15,SRCSEL,SAL_15);
assign AOUT_16 = ~((PCENB & PCL_16) | (DSTSEL & DAL_16) | (DAL_16 & SRCSEL));   //[00057] AOUT_16_(AOUT_16) = AO11A(PCENB,PCL_16,DSTSEL,DAL_16,SRCSEL,SAL_16);
assign AOUT_17 = ~((PCENB & PCL_17) | (DSTSEL & DAL_17) | (DAL_17 & SRCSEL));   //[00058] AOUT_17_(AOUT_17) = AO11A(PCENB,PCL_17,DSTSEL,DAL_17,SRCSEL,SAL_17);
assign AOUT_18 = ~((PCEN & PCL_18) | (DSTSELH & DAL_18) | (DAL_18 & SRCRD));    //[00059] AOUT_18_(AOUT_18) = AO11A(PCEN,PCL_18,DSTSELH,DAL_18,SRCRD,SAL_18);
assign AOUT_19 = ~((PCEN & PCL_19) | (DSTSELH & DAL_19) | (DAL_19 & SRCRD));    //[00060] AOUT_19_(AOUT_19) = AO11A(PCEN,PCL_19,DSTSELH,DAL_19,SRCRD,SAL_19);

/* Enable the data onto the address bus */

assign A_0 = BUSOE ? AOUT_0 : 1'bZ;                                             //[00064] ADRIV_0_(A_0) = BTS4B(AOUT_0,BUSOE);
assign A_1 = BUSOE ? AOUT_1 : 1'bZ;                                             //[00065] ADRIV_1_(A_1) = BTS4B(AOUT_1,BUSOE);
assign A_2 = BUSOE ? AOUT_2 : 1'bZ;                                             //[00066] ADRIV_2_(A_2) = BTS4B(AOUT_2,BUSOE);
assign A_3 = BUSOE ? AOUT_3 : 1'bZ;                                             //[00067] ADRIV_3_(A_3) = BTS4B(AOUT_3,BUSOE);
assign A_4 = BUSOE ? AOUT_4 : 1'bZ;                                             //[00068] ADRIV_4_(A_4) = BTS4B(AOUT_4,BUSOE);
assign A_5 = BUSOE ? AOUT_5 : 1'bZ;                                             //[00069] ADRIV_5_(A_5) = BTS4B(AOUT_5,BUSOE);
assign A_6 = BUSOE ? AOUT_6 : 1'bZ;                                             //[00070] ADRIV_6_(A_6) = BTS4B(AOUT_6,BUSOE);
assign A_7 = BUSOE ? AOUT_7 : 1'bZ;                                             //[00071] ADRIV_7_(A_7) = BTS4B(AOUT_7,BUSOE);
assign A_8 = BUSOE ? AOUT_8 : 1'bZ;                                             //[00072] ADRIV_8_(A_8) = BTS4B(AOUT_8,BUSOE);
assign A_9 = BUSOE ? AOUT_9 : 1'bZ;                                             //[00073] ADRIV_9_(A_9) = BTS4B(AOUT_9,BUSOE);
assign A_10 = BUSOE ? AOUT_10 : 1'bZ;                                           //[00074] ADRIV_10_(A_10) = BTS4B(AOUT_10,BUSOE);
assign A_11 = BUSOE ? AOUT_11 : 1'bZ;                                           //[00075] ADRIV_11_(A_11) = BTS4B(AOUT_11,BUSOE);
assign A_12 = BUSOE ? AOUT_12 : 1'bZ;                                           //[00076] ADRIV_12_(A_12) = BTS4B(AOUT_12,BUSOE);
assign A_13 = BUSOE ? AOUT_13 : 1'bZ;                                           //[00077] ADRIV_13_(A_13) = BTS4B(AOUT_13,BUSOE);
assign A_14 = BUSOE ? AOUT_14 : 1'bZ;                                           //[00078] ADRIV_14_(A_14) = BTS4B(AOUT_14,BUSOE);
assign A_15 = BUSOE ? AOUT_15 : 1'bZ;                                           //[00079] ADRIV_15_(A_15) = BTS4B(AOUT_15,BUSOE);
assign A_16 = BUSOE ? AOUT_16 : 1'bZ;                                           //[00080] ADRIV_16_(A_16) = BTS4B(AOUT_16,BUSOE);
assign A_17 = BUSOE ? AOUT_17 : 1'bZ;                                           //[00081] ADRIV_17_(A_17) = BTS4B(AOUT_17,BUSOE);
assign A_18 = BUSOE ? AOUT_18 : 1'bZ;                                           //[00082] ADRIV_18_(A_18) = BTS4C(AOUT_18,BUSOE);
assign A_19 = BUSOE ? AOUT_19 : 1'bZ;                                           //[00083] ADRIV_19_(A_19) = BTS4C(AOUT_19,BUSOE);

endmodule                                                                       //[00085] END MODULE;