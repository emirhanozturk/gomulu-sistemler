module FireAlarmSystem(
  input wire uartRX,       
  output wire fireAlarm
);
  
  reg fireDetected;  
  
  always @ (posedge uartRX) begin
    if (uartRX >= 20) begin 
      fireDetected <= 1'b1;
    end
    else begin 
      fireDetected <= 1'b0;
    end
  end
  
  assign fireAlarm = fireDetected;
  
endmodule
