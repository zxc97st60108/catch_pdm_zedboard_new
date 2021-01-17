module d_ff (
           input      clk,
           input      rst_n,
           input      en,
           input    [15:0]  d1,
           input    [15:0]  d2,
           output reg [15:0] q
       );

always@(posedge clk or negedge rst_n)
    if (!rst_n)
        q <= d1;
    else if (en)
        q <= d1;
    else
        q <= d2;

endmodule
