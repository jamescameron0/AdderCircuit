module adderTb;
    reg [3:0] A, B;
    wire [3:0] S;
    wire Cout;

    fourBitAdder uut (
        .A(A),
        .B(B),
        .S(S),
        .Cout(Cout)
    );

    initial begin
    

		  A = 4'b1111; B = 4'b0001;
        #50;

        //A = 4'b1010; B = 4'b0101;
        //#50;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b => S=%b Cout=%b", $time, A, B, S, Cout);
    end
endmodule
