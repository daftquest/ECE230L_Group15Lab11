module top(
    input btnC,
    input btnU,
    output [6:0] led
);

wire [2:0] rippleConnector;
wire [2:0] rippleInputConnector;

tff rippleOne(
    .T(1),
    .rst(btnU),
    .clk(btnC),
    .Q(rippleConnector[0]),
    .NotQ()
);

tff rippleTwo(
    .T(1),
    .rst(btnU),
    .clk(~rippleConnector[0]),
    .Q(rippleConnector[1]),
    .NotQ()
);

tff rippleThree(
    .T(1),
    .rst(btn),
    .clk(~rippleConnector[1]),
    .Q(rippleConnector[2]),
    .NotQ()
);

ModCounter modInst(
    .clock(btnC),
    .enable(1),
    .rst(btnU),
    .N(led[6]),
    .NotN(),
    .Q0(led[3]),
    .Q1(led[4]),
    .Q2(led[5])
);

assign led[0] = rippleConnector[0];
assign led[1] = rippleConnector[1];
assign led[2] = rippleConnector[2];

endmodule