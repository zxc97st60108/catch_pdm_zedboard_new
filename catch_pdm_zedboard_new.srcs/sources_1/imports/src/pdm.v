
module pdm_m(
           input wire AHBclk,
           input wire PDMclk,
           input wire rst,
           input wire [1:0] ctrl,
           input wire [31:0] addr,      //outside memory addr;
           input wire pdm_signal,
           output wire [31:0] pdm_array,
           output wire bsy
       );

// wire RW;
wire [15:0]  memory_idx;		//memory addr
// wire [15:0]  memory_idx2;		//memory addr
// wire [31:0] pdm_array;
wire cnt_en;
// wire sel_clk;
wire w_i;
//TODO: control module
read_ctrl ctrl_r(
              .ahb_clk(AHBclk),
              .rst(rst),
              //   .didx(memory_idx),
              .w_i(w_i),
              .cnt_en(cnt_en),
              //   .RW(RW),
              .bsy(bsy)
          );

write_ctrl ctrl_w(
               .pdm_clk(PDMclk),
               .rst(rst),
               .w_i(w_i),
               .ctrl(ctrl),
               .pdm_signal(pdm_signal),
               .cnt_en(cnt_en),
               .pdm(pdm_array),
               .didx(memory_idx)	//memory_idx
           );

// glitch_free gf_m(
//                 .clk0(AHBclk),
//                 .clk1(PDMclk),
//                 .select(bsy),
//                 .rst_n(rst),
//                 .outclk(sel_clk)
//             );
// d_ff dff(
//          .clk(sel_clk),
//          .rst_n(rst),
//          .en(bsy),
//          .d1(memory_idx),
//          .d2(addr[17:2]),
//          .q(memory_idx2)
//      );
// dbuf buff_m(
//          .clk(sel_clk),
//          .din(pdm_array),      //if (bsy) then (douta)  else  (pdm_signal)
//          .didx((bsy) ? memory_idx : addr[17:2]), //不是15:0是因為軟體端送過來是0,4,8,12... 例:32'h8000_0104,08,0C每次加4  除4後才是index
//          .RW(bsy),
//          .di(dout)
//      );


endmodule
