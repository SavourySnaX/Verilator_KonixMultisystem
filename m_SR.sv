module m_SR                                                                     //[LEGO.NET:00237] MODULE SR;
(                                                                               //[LEGO.NET:00237] MODULE SR;

    input    S,                                                                 //[LEGO.NET:00239] INPUTS	S,R;
    input    R,                                                                 //[LEGO.NET:00239] INPUTS	S,R;
    output    Q,                                                                //[LEGO.NET:00240] OUTPUTS	Q,QL;
    output    QL                                                                //[LEGO.NET:00240] OUTPUTS	Q,QL;
);                                                                              //[LEGO.NET:00237] MODULE SR;
                                                                                //[LEGO.NET:00241] LEVEL FUNCTION;
assign Q = ~(S & QL);                                                           //[LEGO.NET:00243] Q_(Q) = ND2A(S,QL);
assign QL = ~(R & Q);                                                           //[LEGO.NET:00244] QL_(QL) = ND2A(R,Q);
endmodule                                                                       //[LEGO.NET:00245] END MODULE;
