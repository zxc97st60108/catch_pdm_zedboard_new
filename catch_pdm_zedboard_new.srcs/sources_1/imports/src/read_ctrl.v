
module read_ctrl(
           input wire ahb_clk,
           input wire rst,
           input wire [1:0] ctrl,
           //    input wire [15:0] didx,	//memory_idx
           input wire w_i,
           //    input wire fifo_empty,
           output reg wr_en,
           output reg rd_en,
           
           output wire wr_rst_busy,
           output wire rd_rst_busy,
           output reg cnt_en,
        //    output reg RW,				//if RW = 1 then 寫入 else
           output reg bsy
       );

//`include "Param.v"
parameter Idle  = 1'b0;
parameter Shift = 1'b1;
reg CS, NS;
// localparam bound = 47999;

//current state register
always@(posedge ahb_clk) begin
    if(~rst)
        CS<=Idle;
    else
        CS<=NS;
end

//next state logic          change mode
always@(*) begin
    case(CS)
        Idle: begin
            if(ctrl[0])
                NS=Shift;
            else
                NS=Idle;
        end
        Shift: begin
            if(w_i)
                NS=Idle;
            else
                NS=Shift;
        end
        default: begin
            NS=Idle;
        end
    endcase
end


//output logic
always@(*) begin
    case(CS)
        Idle: begin
            // RW = 1'b0;
            rd_en = 1'b1;
            wr_en = 1'b0;
            cnt_en = 1'b0;
            bsy = 1'b0;
        end
        Shift://enable counter
        begin
            // RW =  1'b1 ;  //小於46875
            rd_en = 1'b0;
            wr_en = 1'b1;
            cnt_en = 1'b1;
            bsy = 1'b1;
            // counter = 6'd0;
        end
        default: begin
            // RW = 1'b0;
            rd_en = 1'b1;
            wr_en = 1'b0;
            // cnt_en = 1'b0;
            // bsy = 1'b1;
            // RW =  1'b1 ;  //小於46875
            cnt_en = 1'b0;
            bsy = 1'b0;
        end
    endcase
end

endmodule
