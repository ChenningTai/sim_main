module test_HW1();
reg A;//input用reg
reg B;
reg C;
reg D;
reg [1:0] Sel;
wire MuxOut; //output用wire
/*1111 0101 0011 1000 1010 0100 0111 1101 1011*/
// reg rin[3:0];
// reg [5:0] mem [];
HW1 uut (
    .MuxOut(MuxOut),//括號內的是真實名稱
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .Sel(Sel)
    );
initial begin
    // $sdf_annotate("HW1.sdf",my_alu);
    // $fsdbDumpfile("HW1.fsdb"); 
    // $fsdbDumpvars; 
    $dumpfile("HW1.vcd");
    $dumpvars;
    // cinfile = $fopen("data_in.txt", "r");
    // while(!$feof(cinfile)) begin
    //     cnt = $fscanf(cinfile, "%d %d %d %d", rin[0], rin[1], rin[2], rin[3]);
    //     $display("%d %d %d %d", rin[0], rin[1], rin[2], rin[3]);
    //     #5 A=rin[0];B=rin[1];C=rin[2];D=rin[3];
    // end
    A = 0;
    B = 0;
    C = 0;
    D = 0;
    Sel = 2'b11;
    #5 A=1;B=1;C=1;D=1;Sel=2'b00;
    #5 A=1;B=0;C=0;D=0;Sel=2'b01;
    #5 A=1;B=1;C=1;D=1;Sel=2'b00;
    #5 A=0;B=1;C=0;D=1;Sel=2'b10;
    #5 A=0;B=0;C=1;D=1;Sel=2'b10;
    #5 A=1;B=0;C=0;D=0;Sel=2'b01;
    #5 A=1;B=0;C=1;D=0;Sel=2'b11;
    #5 A=0;B=1;C=0;D=0;Sel=2'b11;
    #5 A=0;B=1;C=1;D=1;Sel=2'b00;
    #5 A=1;B=1;C=0;D=1;Sel=2'b01;
    #5 A=1;B=0;C=1;D=1;Sel=2'b11;
    #5 A=1;B=1;C=1;D=1;Sel=2'b00;
end
endmodule
// integer i;
// AA = 