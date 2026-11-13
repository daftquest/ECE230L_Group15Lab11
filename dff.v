module dff(
    input D, clk,
    input rst,
    output reg Q,
    output NotQ
);

initial begin
    Q <= 1'b0;
end

always @(posedge clk or posedge rst) begin
    if (rst) 
		Q <= 1'b0;
    else
		Q <= D;
end

assign NotQ = ~Q;

endmodule