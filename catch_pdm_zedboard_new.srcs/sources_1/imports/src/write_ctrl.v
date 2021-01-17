
module write_ctrl(
           input wire pdm_clk,
           input wire rst,
           input wire [1:0]ctrl,
           input wire pdm_signal,         //輸入pdm資料
           input wire cnt_en,
           output wire w_i,
           output reg [31:0] pdm,
           output reg [15:0] didx	//memory_idx
       );

//`include "Param.v"
localparam Idle = 0;
localparam Shift = 1;
reg [5:0]counter;
// reg cnt_en;

always @(negedge pdm_clk or negedge rst) begin
    if(~rst) begin
        pdm <= 32'd0;
    end
    /*else if(counter == 6'd0  | ctrl[1])       //if counter == 32 then reset 0
    begin
        pdm <= 32'd0;
    end*/
    else if (cnt_en) begin
        pdm <= {pdm[30:0] , pdm_signal};
    end
end

//counter   改用下數 若用上數 第一次進來的32bit會少1bit
always @(posedge pdm_clk or negedge rst) begin
    if(~rst || ctrl[1]) begin
        counter <= 6'd32;
    end
    else if(counter == 6'd0 )       //if counter == 32 then reset 0     counter[4]&counter[3]&counter[2]&counter[1]&counter[0] | ctrl[1]
    begin
        counter <= 6'd31;
    end
    else if(cnt_en) begin
        counter <= counter - 1'b1;
    end
end

//didx2
always @(posedge pdm_clk or negedge rst) begin
    if(~rst || ctrl[1]) begin
        didx <= 16'd0;
    end
    // else if(ctrl[1]) begin
    //     didx <= 16'd0;
    // end
    else if(counter == 6'd0 ) //if didx<32 then didx++        counter[4]&counter[3]&counter[2]&counter[1]&counter[0]
    begin
        didx <= didx+1'b1;
    end
    // if (counter == 31)
end

//didx寫入控制
// always @(posedge pdm_clk or negedge rst) begin
//     if(~rst) begin
//         w_i <= 1'b0;
//     end
//     else if(didx <= 16'd47999) begin
//         w_i <= 1'b0;
//     end
//     else begin
//         w_i <= 1'b1;
//     end
// end

assign w_i = didx > 16'd47999 ? 1'b1 : 1'b0;

endmodule
