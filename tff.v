module tff(
    input T,
    input clk,
    input rst,
    output reg Q,
    output NotQ
);

initial Q = 1'b0;

assign NotQ = ~Q;



always @(posedge clk or posedge rst) begin
    if (rst)
		Q <= 1'b0;
    else if 
		(T) Q <= ~Q;
end

endmodule