module ram(
    input clk,rst_n,write_enabled,read_enabled, // sırasıyla saat sinyali,sıfırlama sinyali,yazma sinyali ve okuma sinyali için wire türünde değişkenler
    input [3:0] address, // bellek adresi
    input [15:0] data_in, // Yazılacak veri için giriş
    output reg [15:0] data_out // Okunacak veri için giriş
);

reg [15:0] ram [0:15]; //16 bitlik 16 satır veri

  always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            for (integer i = 0; i < 16; i=i+1) 
                ram[i] <= 16'b0; // reset sinyali geldiği zaman ram üzerindeki tüm alanlara 0 değerini atamak için
        else if (!write_enabled)
            ram[address] <= data_in;
    end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
      data_out <= 16'h0000;  
    else if (!read_enabled) 
      data_out <= ram[address];
  end

endmodule