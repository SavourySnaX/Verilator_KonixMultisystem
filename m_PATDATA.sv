                                                                                //[00001] COMPILE;
                                                                                //[00002] DIRECTORY MASTER;
/****************************************************************************
patdata
10/10/88

Pattern data register

****************************************************************************/

module m_PATDATA                                                                //[00012] MODULE PATDATA;
(                                                                               //[00012] MODULE PATDATA;

    input    LDPATL,                                                            //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_0,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_1,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_2,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_3,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_4,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_5,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_6,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    input    ID_7,                                                              //[00014] INPUTS	LDPATL,ID_0,ID_1,ID_2,ID_3,ID_4,ID_5,ID_6,ID_7;
    output    PATD_0,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_1,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_2,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_3,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_4,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_5,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_6,                                                           //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
    output    PATD_7                                                            //[00015] OUTPUTS	PATD_0,PATD_1,PATD_2,PATD_3,PATD_4,PATD_5,PATD_6,PATD_7;
);                                                                              //[00012] MODULE PATDATA;
                                                                                //[00016] LEVEL FUNCTION;
wire PATDL_0;                                                                   //[00019] DSTDL_0_(PATD_0,PATDL_0) = LD2A(ID_0,LDPATL);
wire PATDL_1;                                                                   //[00020] DSTDL_1_(PATD_1,PATDL_1) = LD2A(ID_1,LDPATL);
wire PATDL_2;                                                                   //[00021] DSTDL_2_(PATD_2,PATDL_2) = LD2A(ID_2,LDPATL);
wire PATDL_3;                                                                   //[00022] DSTDL_3_(PATD_3,PATDL_3) = LD2A(ID_3,LDPATL);
wire PATDL_4;                                                                   //[00023] DSTDL_4_(PATD_4,PATDL_4) = LD2A(ID_4,LDPATL);
wire PATDL_5;                                                                   //[00024] DSTDL_5_(PATD_5,PATDL_5) = LD2A(ID_5,LDPATL);
wire PATDL_6;                                                                   //[00025] DSTDL_6_(PATD_6,PATDL_6) = LD2A(ID_6,LDPATL);
wire PATDL_7;                                                                   //[00026] DSTDL_7_(PATD_7,PATDL_7) = LD2A(ID_7,LDPATL);

LD2A DSTDL_0__inst (.q(PATD_0),.qL(PATDL_0),.d(ID_0),.en(LDPATL));              //[00019] DSTDL_0_(PATD_0,PATDL_0) = LD2A(ID_0,LDPATL);
LD2A DSTDL_1__inst (.q(PATD_1),.qL(PATDL_1),.d(ID_1),.en(LDPATL));              //[00020] DSTDL_1_(PATD_1,PATDL_1) = LD2A(ID_1,LDPATL);
LD2A DSTDL_2__inst (.q(PATD_2),.qL(PATDL_2),.d(ID_2),.en(LDPATL));              //[00021] DSTDL_2_(PATD_2,PATDL_2) = LD2A(ID_2,LDPATL);
LD2A DSTDL_3__inst (.q(PATD_3),.qL(PATDL_3),.d(ID_3),.en(LDPATL));              //[00022] DSTDL_3_(PATD_3,PATDL_3) = LD2A(ID_3,LDPATL);
LD2A DSTDL_4__inst (.q(PATD_4),.qL(PATDL_4),.d(ID_4),.en(LDPATL));              //[00023] DSTDL_4_(PATD_4,PATDL_4) = LD2A(ID_4,LDPATL);
LD2A DSTDL_5__inst (.q(PATD_5),.qL(PATDL_5),.d(ID_5),.en(LDPATL));              //[00024] DSTDL_5_(PATD_5,PATDL_5) = LD2A(ID_5,LDPATL);
LD2A DSTDL_6__inst (.q(PATD_6),.qL(PATDL_6),.d(ID_6),.en(LDPATL));              //[00025] DSTDL_6_(PATD_6,PATDL_6) = LD2A(ID_6,LDPATL);
LD2A DSTDL_7__inst (.q(PATD_7),.qL(PATDL_7),.d(ID_7),.en(LDPATL));              //[00026] DSTDL_7_(PATD_7,PATDL_7) = LD2A(ID_7,LDPATL);

endmodule                                                                       //[00028] END MODULE;