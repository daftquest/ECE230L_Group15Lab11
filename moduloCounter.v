module moduloCounter(
    input clk,
    input rst,
    output Qzero,
    output Qone,
    output Qtwo,
    output Q,
    output NotQ
);

wire [2:0] bitZeroWires;
wire [2:0] bitOneWires;
wire [2:0] bitTwoWires;

dff dffInstOne(
    .D(bitZeroWires[0]),
    .clk(clk),
    .rst(rst_c),
    .Q(bitZeroWires[1]),
    .NotQ()
);

fullAdder fAOne(
    .A(bitZeroWires[1]),
    .B(),
    .Cin(1'b0),
    .S(bitZeroWires[0]),
    .Cout(bitZeroWires[2])
);

dff dffInstTwo(
    .D(bitOneWires[0]),
    .clk(clk),
    .rst(rst_c),
    .Q(bitOneWires[1]),
    .NotQ()
);

fullAdder fATwo(
    .A(bitOneWires[1]),
    .B(1'b0),
    .Cin(bitZeroWires[2]),
    .S(bitOneWires[0]),
    .Cout(bitOneWires[2])
);

dff dffInstThree(
    .D(bitTwoWires[0]),
    .clk(clk),
    .rst(rst_c),
    .Q(bitTwoWires[1]),
    .NotQ()
);

fullAdder fAThree(
    .A(bitTwoWires[1]),
    .B(1'b0),
    .Cin(bitOneWires[2]),
    .S(bitTwoWires[0]),
    .Cout(bitTwoWires[2])
);

assign moduloAND = bitZeroWires[1] & ~bitOneWires[1] & bitTwoWires[1];

always @(rst) begin
    rst_c <= 1'b1;
end

dff dffFinalInst(
    .D(),
    .clk(clk),
    .rst(rst_c),
    .Q(),
    .NotQ()
);

endmodule