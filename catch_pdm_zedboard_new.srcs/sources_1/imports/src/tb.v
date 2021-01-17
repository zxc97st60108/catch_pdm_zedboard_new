`timescale 1ns/1ps
`include "pdm.v"
`include "read_ctrl.v"
`include "write_ctrl.v"
`include "dbuf.v"
`include "glitch_free.v"

module tb;

reg g_hclk_es1;
reg pdm_clk;
reg hreset_n;
reg [1:0] ctrl;
reg [31:0] haddr_reg;
reg pdm_signal ;
reg pdm_data [0:1536000];
// wire pdm_clk;
wire [31:0] dout;
wire  bsy;
reg[31:0] n;

pdm_m pdm(
          .AHBclk(g_hclk_es1),
          .PDMclk(pdm_clk),
          .rst(hreset_n),
          .ctrl(ctrl),
          .addr(haddr_reg),
          .pdm_signal(pdm_signal),
          .dout(dout),
          .bsy(bsy)
      );

initial begin : clk_100MHz
    g_hclk_es1 = 0;
    forever
        #5 g_hclk_es1 <= ~g_hclk_es1;
end

initial begin

    #1332
     n = 0;
    forever begin
        #666
         n = n+1;
    end
end

initial begin : clk_1_5MHz
    pdm_clk = 0;
    #1332
     forever begin
         //  pdm_signal <= pdm_data[n];
         #333 pdm_clk <= ~pdm_clk;

         // if(1536000>n)
         // else
         //     pdm_signal <= 0;
         if(n == 1000)
             $finish();
         // $display("pdm_clk = %d , pdm_signal = %d , n = %d \n", pdm_clk , pdm_signal , n );
     end
 end

 initial begin
     pdm_clk = 0;
     #1042
      forever begin
          #300
           pdm_signal <= pdm_data[n];

      end
  end

  initial begin
      $readmemb("pdm.txt",pdm_data);
      hreset_n = 0;
      pdm_clk = 0;
      g_hclk_es1 = 0;
      ctrl = 2'b00;
      haddr_reg = 32'h80000000;
      #20 hreset_n = 0;
      #10 hreset_n = 1;
      #10
       ctrl = 2'b10;
      #10
       ctrl = 2'b01;
      #10
       ctrl = 2'b00;

      // for(n=0;n<1048575;n=n+1)begin   //把八个存储单元的数字都读取出来，若存的数不到八
      // pdm_clk <= ~pdm_clk;
      // #333

      //     pdm_signal <= pdm_data[n];
      // $display("pdm_signal = %d \n", pdm_signal);
      // $display("pdm_signal = %d \n", pdm_clk);
      // end
  end
  initial begin

      $dumpfile("dump.vcd");
      $dumpvars();

  end

  // assign #20 pdm_signal = pdm_signal;
  // assign #333 pdm_signal = pdm_data[n];
  endmodule
