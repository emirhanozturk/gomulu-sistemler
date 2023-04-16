module traffic_light(
     input clk,
     output reg [2:0] lights // 011 kırmızı,101 mavi, 110 yeşil
);

reg [2:0] counter;

always @(posedge clk) begin
    if (counter == 3'b011) // 10 saniye boyunca kırmızı
        counter <= 0;
    else if (counter == 3'b101) // 2 saniye boyunca mavi
        counter <= counter + 1;
    else if (counter == 3'b010) // 5 saniye boyunca yeşil
        counter <= counter + 1;
    else
        counter <= counter + 1;
end

always @(posedge clk) begin
    if (counter == 3'b011) begin
        lights <= 3'b011; // Kırmızı ışık
    end
    else if (counter == 3'b101) begin
        lights <= 3'b101; // mavi ışık
    end
    else if (counter == 3'b010) begin
        lights <= 3'b110; // Yeşil  ışık
    end
    else begin
        lights <= 3'b111; // Tüm ışıkları kapat
    end
end

endmodule
