`include "lib/defines.vh"


module hi_lo_reg(
    input wire clk,
 
    input wire [`StallBus-1:0] stall,

    input wire hi_we,
    input wire lo_we,

    input wire [31:0] hi_wdata,
    input wire [31:0] lo_wdata,

    output wire [31:0] hi_rdata,
    output wire [31:0] lo_rdata
);

    reg [31:0] reg_hi;
    reg [31:0] reg_lo;



    always @ (posedge clk) begin
        if (hi_we & lo_we) begin
            reg_hi <= hi_wdata;
            reg_lo <= lo_wdata;
        end
        if (~hi_we & lo_we) begin
            reg_lo <= lo_wdata;
        end
        if (hi_we & ~lo_we) begin
            reg_hi <= hi_wdata;
        end
    end

    assign hi_rdata = reg_hi;
    assign lo_rdata = reg_lo;





endmodule