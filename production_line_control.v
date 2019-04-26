module D_FF (
	input wire clk, 
	input wire d, 
	input wire rst_n, 
	input wire init_value,
	output reg q);  //q=o/p: d,init_val = i/p

	always @(posedge clk)  
		if (rst_n)  
			q <= d;    
		else  
			q <= init_value; 
endmodule  


module testgate(

	input wire clk,
	input wire rst_n,
	input wire data_in,
	input wire data_in2,
	output reg data_out_tg);

	//reg temp;

	always @ (posedge clk)

		begin

		if (rst_n)

			data_out_tg <= 1'b0;

		else

		begin

			if ( data_in == 1'b1 && data_in2 == 1'b0)
				data_out_tg <= 1'b1;

			else if ( data_in == 1'b0 && data_in2 == 1'b1 )
				data_out_tg <= 1'b1;

			else 
				data_out_tg <= 1'b0;

			end

		end
		
	//assign data_out_tg = temp;

endmodule

module rectifier_unit(
	input wire clk,
	input wire rst_n,
	input wire data_out_ts,
	input wire data_in2,
	output reg data_out_ru);

	//reg temp;

	always @ (posedge clk)

	begin

	if (rst_n)
		data_out_ru <= 1'b0;

	else

		begin

		if ( data_in == 1'b1 )
			data_out_ru <= data_in2;

		else if ( data_in == 1'b0 )
			data_out_ru <= ~( data_in2);

		else 
			data_out_ru <= 1'b0;

		end

	end

	//assign data_out_ru = temp;

endmodule






//////////////////////////
module final(input wire clk, 
	input wire rst_n,   
	input wire [3:0]data_in,  
	input wire [3:0]data_in2,
	input wire [3:0]initial_value,
	//input wire [3:0]data_out_fr,
	output wire [3:0] counter_random,
	output wire [3:0] data_out_final);  
	//test shop	 
	wire [3:0]output_ts;

	testgate unit1_tg (
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_in[0]),
	.data_in2(data_in2[0]),
	.data_out_tg(output_ts[0])
	);

	testgate unit2_tg (
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_in[1]),
	.data_in2(data_in2[1]),
	.data_out_tg(output_ts[1])
	);

	testgate unit3_tg (
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_in[2]),
	.data_in2(data_in2[2]),
	.data_out_tg(output_ts[2])
	);

	testgate unit4_tg (
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_in[3]),
	.data_in2(data_in2[3]),
	.data_out_tg(output_ts[3])
	);
	
	//full rectifier
	wire [3:0] output_fr;

	rectifier_unit unit1 (
	.clk(clk),
	.rst_n(rst_n),
	.data_out_ts(output_ts[0]),
	.data_in2(data_in2[0]),
	.data_out_ru(output_fr[0])
	);

	rectifier_unit unit2 (
	.clk(clk),
	.rst_n(rst_n),
	.data_out_ts(output_ts[1]),
	.data_in2(data_in2[1]),
	.data_out_ru(output_fr[1])
	);

	rectifier_unit unit3 (
	.clk(clk),
	.rst_n(rst_n),
	.data_out_ts(output_ts[2]),
	.data_in2(data_in2[2]),
	.data_out_ru(output_fr[2])
	);


	rectifier_unit unit4 (
	.clk(clk),
	.rst_n(rst_n),
	.data_out_ts(output_ts[3]),
	.data_in2(data_in2[3]),
	.data_out_ru(output_fr[3])
	);
	
	assign data_out_final = output_fr;
	
                 
	wire [3:0] counter_lfsr;  
	 
	wire d_xor;  
	xor xor_u(d_xor,counter_lfsr[1],counter_lfsr[4]);  
	D_FF u0(.clk(clk),.d(counter_lfsr[4]), .rst_n(rst_n), .init_value(initial_value[0]) ,.q(counter_lfsr[0]));  
	D_FF u1(.clk(clk),.d(counter_lfsr[0]),.rst_n(rst_n), .init_value(initial_value[1]), .q(counter_lfsr[1]));  
	D_FF u2(.clk(clk),.d(d_xor),  .rst_n(rst_n), .init_value(initial_value[2]), .q(counter_lfsr[2]));  
	D_FF u3(.clk(clk),.d(counter_lfsr[2]),.rst_n(rst_n),.init_value(initial_value[3]), .q(counter_lfsr[3]));  
	//D_FF u4(.q(counter_lfsr[4]), .d(counter_lfsr[3]), .rst_n(rst_n), .clk(clk),.init_value(initialized_value[4])); 
	assign counter_random = counter_lfsr;  
	 
	 
 
 endmodule    
//////////////////////////

