module ModCounter(
	input clock, enable, rst,
	output N, NotN,
	output Q0, Q1, Q2
);

wire OutQ0, OutQ1, OutQ2;
wire atV = OutQ0 & ~OutQ1 & OutQ2;
wire reset = atV & enable;

dff D0(
	.D(~reset & (enable ^ OutQ0)),
	.clk(clock),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ0),
	.NotQ(OutNQ0)
);

dff D1(
	.D(~reset & (OutQ1 ^ (enable & OutQ0))),
	.clk(clock),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ1),
	.NotQ(OutQN1)
);

dff D2(
	.D(~reset & (OutQ2 ^ (enable & OutQ0 & OutQ1))),
	.clk(clock),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ2),
	.NotQ(OutNQ2)
);

dff DN(
	.D( N ^ reset), 
	.clk(clock),
	.rst(rst),
	.Q(N),
	.NotQ(NotN)
);

assign Q0 = OutQ0;
assign Q1 = OutQ1;
assign Q2 = OutQ2;


endmodule