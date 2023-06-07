

module simple_bram (clk, reset, bram_we1, bram_we2, bram_addr1, bram_addr2, bram_data1, bram_data2, bram_out1, bram_out2);


input clk, reset;
input  bram_we1, bram_we2;
input [4:0] bram_addr1, bram_addr2;
input [9:0] bram_data1, bram_data2;
output [9:0] bram_out1, bram_out2;


// you can route only a portion of bits
defparam bram_simple.ADDR_WIDTH = 5;
defparam bram_simple.DATA_WIDTH = 10;


dual_port_ram bram_simple(.addr1(bram_addr1), .we1(bram_we1), .data1(bram_data1), .out1(bram_out1), .clk(clk),
                          .addr2(bram_addr2), .we2(bram_we2), .data2(bram_data2), .out2(bram_out2));


// 33864 nm^2


endmodule