module FFT32_tb; 

reg  clk_20,clk_100,reset_all;
reg signed[15:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, 
x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31;
wire signed [15:0] out_real_0, out_imag_0,out_real_1, 
out_imag_1,out_real_2, out_imag_2,out_real_3, out_imag_3,
out_real_4, out_imag_4,out_real_5, out_imag_5,out_real_6, 
out_imag_6,out_real_7, out_imag_7,out_real_8, out_imag_8,out_real_9,
 out_imag_9,out_real_10, out_imag_10,out_real_11, out_imag_11,out_real_12,
  out_imag_12,out_real_13, out_imag_13,out_real_14, out_imag_14,out_real_15, 
  out_imag_15,out_real_16, out_imag_16,out_real_17, out_imag_17,out_real_18, 
  out_imag_18,out_real_19, out_imag_19,out_real_20, out_imag_20,out_real_21, 
  out_imag_21,out_real_22, out_imag_22,out_real_23, out_imag_23,out_real_24, 
  out_imag_24,out_real_25, out_imag_25,out_real_26, out_imag_26,out_real_27, 
  out_imag_27,out_real_28, out_imag_28,out_real_29, out_imag_29,out_real_30, 
  out_imag_30,out_real_31, out_imag_31;
 




FFT32 FFT32_i
( 
.clk_20(clk_20),.clk_100(clk_100),.reset_all(reset_all),
.x0(x0), 
.x1(x1), 
.x2(x2), 
.x3(x3), 
.x4(x4), 
.x5(x5), 
.x6(x6), 
.x7(x7), 
.x8(x8), 
.x9(x9), 
.x10(x10), 
.x11(x11), 
.x12(x12), 
.x13(x13), 
.x14(x14), 
.x15(x15), 
.x16(x16), 
.x17(x17), 
.x18(x18), 
.x19(x19), 
.x20(x20), 
.x21(x21), 
.x22(x22), 
.x23(x23), 
.x24(x24), 
.x25(x25), 
.x26(x26), 
.x27(x27), 
.x28(x28), 
.x29(x29), 
.x30(x30), 
.x31(x31),
.out_real_0(out_real_0), .out_real_1(out_real_1), .out_real_2(out_real_2), .out_real_3(out_real_3), 
.out_real_4(out_real_4), .out_real_5(out_real_5), .out_real_6(out_real_6), .out_real_7(out_real_7),
 .out_real_8(out_real_8), .out_real_9(out_real_9), .out_real_10(out_real_10), .out_real_11(out_real_11),
  .out_real_12(out_real_12), .out_real_13(out_real_13), .out_real_14(out_real_14), .out_real_15(out_real_15),
   .out_real_16(out_real_16), .out_real_17(out_real_17), .out_real_18(out_real_18), .out_real_19(out_real_19),
    .out_real_20(out_real_20), .out_real_21(out_real_21), .out_real_22(out_real_22), .out_real_23(out_real_23),
     .out_real_24(out_real_24), .out_real_25(out_real_25), .out_real_26(out_real_26), .out_real_27(out_real_27), 
     .out_real_28(out_real_28), .out_real_29(out_real_29), .out_real_30(out_real_30), .out_real_31(out_real_31), 
     .out_imag_0(out_imag_0), .out_imag_1(out_imag_1), .out_imag_2(out_imag_2), .out_imag_3(out_imag_3), 
     .out_imag_4(out_imag_4), .out_imag_5(out_imag_5), .out_imag_6(out_imag_6), .out_imag_7(out_imag_7), 
     .out_imag_8(out_imag_8), .out_imag_9(out_imag_9), .out_imag_10(out_imag_10), .out_imag_11(out_imag_11),
      .out_imag_12(out_imag_12), .out_imag_13(out_imag_13), .out_imag_14(out_imag_14), .out_imag_15(out_imag_15),
       .out_imag_16(out_imag_16), .out_imag_17(out_imag_17), .out_imag_18(out_imag_18), .out_imag_19(out_imag_19),
        .out_imag_20(out_imag_20), .out_imag_21(out_imag_21), .out_imag_22(out_imag_22), .out_imag_23(out_imag_23), 
        .out_imag_24(out_imag_24), .out_imag_25(out_imag_25), .out_imag_26(out_imag_26), .out_imag_27(out_imag_27), 
        .out_imag_28(out_imag_28), .out_imag_29(out_imag_29), .out_imag_30(out_imag_30), .out_imag_31(out_imag_31)
);
initial clk_100 =0;
always #5 clk_100 =~ clk_100;
initial clk_20 =0;
always #25 clk_20 =~ clk_20;
initial
begin 
reset_all=1'b0;
#5;
reset_all=1'b1;
#70;
reset_all=1'b0;
x0=16'b0000000100000000 ;
x1=16'b0000000000000000 ;
x2=16'b0000000000000000 ;
x3=16'b0000000000000000 ;
x4=16'b0000000000000000 ;
x5=16'b0000000000000000 ;
x6=16'b0000000000000000 ;
x7=16'b0000000000000000 ;
x8=16'b0000000000000000 ;
x9=16'b0000000000000000 ;
x10=16'b0000000000000000 ;
x11=16'b0000000000000000 ;
x12=16'b0000000000000000 ;
x13=16'b0000000000000000 ;
x14=16'b0000000000000000 ;
x15=16'b0000000000000000 ;
x16=16'b0000000000000000 ;
x17=16'b0000000000000000 ;
x18=16'b0000000000000000 ;
x19=16'b0000000000000000 ;
x20=16'b0000000000000000 ;
x21=16'b0000000000000000 ;
x22=16'b0000000000000000 ;
x23=16'b0000000000000000 ;
x24=16'b0000000000000000 ;
x25=16'b0000000000000000 ;
x26=16'b0000000000000000 ;
x27=16'b0000000000000000 ;
x28=16'b0000000000000000 ;
x29=16'b0000000000000000 ;
x30=16'b0000000000000000 ;
x31=16'b0000000000000000 ;
#300;
$finish;
end 
endmodule