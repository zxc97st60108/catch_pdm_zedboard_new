
module read_ctrl(
           input wire ahb_clk,
           input wire rst,
           //    input wire [15:0] didx,	//memory_idx
           input wire w_i,
           output reg cnt_en,
           //    output reg RW				//if RW = 1 then 寫入 else
           output reg bsy
       );

//`include "Param.v"
localparam Idle = 0;
localparam Shift = 1;
reg CS, NS;
// localparam bound = 47999;

//current state register
always@(posedge ahb_clk or negedge rst) begin
    if(~rst)
        CS<=Shift;
    else
        CS<=NS;
end

//next state logic          change mode
always@(*) begin
    case(CS)
        Idle: begin
            if(w_i)
                NS=Idle;
            else
                NS=Shift;
        end
        Shift: begin
            if(~w_i)
                NS=Shift;
            else
                NS=Idle;
        end
        default: begin
            NS=Shift;
        end
    endcase
end


//output logic
always@(*) begin
    case(CS)
        Idle: begin
            // RW = 1'b0;
            cnt_en = 1'b0;
            bsy = 1'b0;
        end
        Shift://enable counter
        begin
            // RW =  1'b1 ;  //小於46875
            cnt_en = 1'b1;
            bsy = 1'b1;
            // counter = 6'd0;
        end
        default: begin
            // RW = 1'b0;
            // cnt_en = 1'b0;
            // bsy = 1'b1;
            // RW =  1'b1 ;  //小於46875
            cnt_en = 1'b1;
            bsy = 1'b1;
        end
    endcase
end

endmodule
