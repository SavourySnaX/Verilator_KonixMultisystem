module m_FILL                                                                   //[DRAM.NET:00133] MODULE FILL;
(                                                                               //[DRAM.NET:00133] MODULE FILL;

    input    MasterClock,
    input    inDD_0,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_1,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_2,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_3,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_4,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_5,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    inDD_6,                                                            //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_0,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_1,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_2,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_3,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_4,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_5,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    A_6,                                                               //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    input    ENAB,                                                              //[DRAM.NET:00135] INPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6,A_0,A_1,A_2,A_3,A_4,A_5,A_6,ENAB;
    output    outDD_0, enDD_0,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_1, enDD_1,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_2, enDD_2,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_3, enDD_3,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_4, enDD_4,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_5, enDD_5,                                                  //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
    output    outDD_6, enDD_6                                                   //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
);                                                                              //[DRAM.NET:00133] MODULE FILL;
                                                                                //[DRAM.NET:00137] LEVEL FUNCTION;
wire drv0_outDD_0;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_0;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_1;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_1;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_2;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_2;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_3;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_3;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_4;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_4;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_5;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_5;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_outDD_6;                                                              //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;
wire drv0_enDD_6;                                                               //[DRAM.NET:00136] OUTPUTS	DD_0,DD_1,DD_2,DD_3,DD_4,DD_5,DD_6;

assign drv0_outDD_0 = A_0; assign drv0_enDD_0 = ENAB;                           //[DRAM.NET:00140] D_0_(DD_0) = BTS4B(A_0,ENAB);
assign drv0_outDD_1 = A_1; assign drv0_enDD_1 = ENAB;                           //[DRAM.NET:00141] D_1_(DD_1) = BTS4B(A_1,ENAB);
assign drv0_outDD_2 = A_2; assign drv0_enDD_2 = ENAB;                           //[DRAM.NET:00142] D_2_(DD_2) = BTS4B(A_2,ENAB);
assign drv0_outDD_3 = A_3; assign drv0_enDD_3 = ENAB;                           //[DRAM.NET:00143] D_3_(DD_3) = BTS4B(A_3,ENAB);
assign drv0_outDD_4 = A_4; assign drv0_enDD_4 = ENAB;                           //[DRAM.NET:00144] D_4_(DD_4) = BTS4B(A_4,ENAB);
assign drv0_outDD_5 = A_5; assign drv0_enDD_5 = ENAB;                           //[DRAM.NET:00145] D_5_(DD_5) = BTS4B(A_5,ENAB);
assign drv0_outDD_6 = A_6; assign drv0_enDD_6 = ENAB;                           //[DRAM.NET:00146] D_6_(DD_6) = BTS4B(A_6,ENAB);
assign outDD_0 = (drv0_outDD_0 & drv0_enDD_0);
assign enDD_0 = drv0_enDD_0;
assign outDD_1 = (drv0_outDD_1 & drv0_enDD_1);
assign enDD_1 = drv0_enDD_1;
assign outDD_2 = (drv0_outDD_2 & drv0_enDD_2);
assign enDD_2 = drv0_enDD_2;
assign outDD_3 = (drv0_outDD_3 & drv0_enDD_3);
assign enDD_3 = drv0_enDD_3;
assign outDD_4 = (drv0_outDD_4 & drv0_enDD_4);
assign enDD_4 = drv0_enDD_4;
assign outDD_5 = (drv0_outDD_5 & drv0_enDD_5);
assign enDD_5 = drv0_enDD_5;
assign outDD_6 = (drv0_outDD_6 & drv0_enDD_6);
assign enDD_6 = drv0_enDD_6;
endmodule                                                                       //[DRAM.NET:00147] END MODULE;
