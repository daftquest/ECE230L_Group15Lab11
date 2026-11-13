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
    .Q(t0),
    .NotQ(rippleConnector[0])
);

tff rippleTwo(
    .T(1),
    .rst(btnU),
    .clk(~rippleConnector[0]),
    .Q(t1),
    .NotQ(rippleConnector[1])
);

tff rippleThree(
    .T(1),
    .rst(btnU),
    .clk(~rippleConnector[1]),
    .Q(t2),
    .NotQ(rippleConnector[2])
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

assign led[0] = t0;
assign led[1] = t1;
assign led[2] = t2;

endmodule