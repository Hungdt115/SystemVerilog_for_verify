module example2_2;

  bit b;          // 2-state, single-bit                
  bit [31:0] b32; // 2-state, 32-bit unsigned integer   
  int i;          // 2-state, 32-bit signed integer     
  byte b8;        // 2-state, 8-bit signed integer      
  shortint s;     // 2-state, 16-bit signed integer     
  longint l;      // 2-state, 64-bit signed integer     

  initial begin
    // Gán giá trị mẫu
    b   = 1;
    b32 = 32'hDEADBEEF;
    i   = -10;
    b8  = -8;
    s   = -100;
    l   = 64'd123456789;

    // In ra màn hình
    $display("b   = %0b", b);
    $display("b32 = 0x%08h (%0d)", b32, b32);
    $display("i   = %0d", i);
    $display("b8  = %0d", b8);
    $display("s   = %0d", s);
    $display("l   = %0d", l);

    $finish;
  end  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end
 
endmodule
