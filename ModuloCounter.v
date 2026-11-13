module ModN(
	input clock, enable, rst
	output, N, NotN 
);


dff D0(
	.D(enable),
	.clk(clock),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ0),
	.NotQ(OutNQ0)
);

dff D1(
	.D(enable),
	.clk(OutQ0),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ1),
	.NotQ(OutQN1)
);

dff D2(
	.D(enable),
	.clk(OutQ1),
	.rst((OutQ0 & ~OutQ1 & OutQ2) | rst),
	.Q(OutQ2)
	.NotQ(OutNQ2)
);

assign N = (OutQ0 & ~OutQ1 & OutQ2);
assign NotN = ~N;

endmodule