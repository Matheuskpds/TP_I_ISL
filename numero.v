module numero(a, b, c, d, out_v, out_w, out_x, out_y, out_z, reset, ready); //declaração do módulo
	
	//out_v: A'B'D' + B'C'
	//out_w: A'B' +  B'D
	//out_x: A'B' + A'C'D'
	//out_y: B'C + A'C'D + BC'
	//out_z: B'C + CD' + BC'
	
	
	
	input wire reset, ready;
	//Entrada de 4 bits (a, b, c, d)
	input wire a, b, c, d;
	//wires do circuito: v
	output reg out_v, out_w, out_x, out_y, out_z; //saida
	
	
	
	always @ (a, b, c, d) begin
	    if(reset) begin
	        out_v = 0;
	        out_w = 0;
	        out_x = 0;
	        out_y = 0;
	        out_z = 0;
	   end
	   else if (ready) begin
	        //equação booleana
	        out_v = (~a & ~b & ~d) | (~b & ~c);
	        out_w = (~a & ~b) | (~b & d);
	        out_x = (~a & ~b) | (~a & ~c & ~d);
	        out_y = (~b & c) | (~a & ~c & d) | (b & ~c);
	        out_z = (~b & c) | (c & ~d) | (b & ~c);
	   end
	
	
	end
endmodule
