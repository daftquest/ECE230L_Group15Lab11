module dff(
    input D, clk,
    input rst,
    output reg Q,
    output NotQ
);

initial begin
    Q <= 0;
end

always @(posedge clk)
    Q <= rst ? 1'b0 : D;

assign NotQ = ~Q;
endmodule