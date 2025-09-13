module fullAdderUnit (
	input A,
	input B,
	input Cin,
	output Sum,
	output Cout
	);
	
	wire AxorB, AB, AxBCin;
	
	xor (AxorB, A, B); //A ^ B
	xor (Sum, AxorB, Cin); //(A ^ B) ^ Cin
	
	and (AB, A, B);	// A & B
	and (AxBCin, Cin, AxorB); // (A ^ B) & Cin
	
	or (Cout, AB, AxBCin);	// (A & B) | ((A ^ B) & Cin)
	
endmodule

module fourBitAdder ( 
	input [3:0] A,
	input [3:0] B,
   output [3:0] S,
   output Cout );
	
	wire C1, C2, C3;
	
	fullAdderUnit FA0 (.A(A[0]), .B(B[0]), .Cin(1'b0), .Sum(S[0]), .Cout(C1));
	fullAdderUnit FA1 (.A(A[1]), .B(B[1]), .Cin(C1), .Sum(S[1]), .Cout(C2));
	fullAdderUnit FA2 (.A(A[2]), .B(B[2]), .Cin(C2),   .Sum(S[2]), .Cout(C3));
   fullAdderUnit FA3 (.A(A[3]), .B(B[3]), .Cin(C3),   .Sum(S[3]), .Cout(Cout));

endmodule

