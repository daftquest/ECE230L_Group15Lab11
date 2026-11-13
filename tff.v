module tff(
    input T,
    input clk,
    input rst,
    output reg Q,
    output NotQ
);

initial Q = 1'b0;

assign NotQ = ~Q;

always @(posedge clk) begin
	if (rst) begin
		Q <= 1'b0;
	end
	else if (T) begin
		Q <= ~Q;
	end
end


endmodule