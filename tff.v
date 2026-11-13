module tff(
    input T,
    input clk,
    input rst,
    output reg Q,
    output NotQ
);

assign NotQ = ~Q;

always @(posedge clk) begin
    Q <= rst ? 1'b0 : 1'b1;
    Q <= T ? ~Q : Q;
end

endmodule