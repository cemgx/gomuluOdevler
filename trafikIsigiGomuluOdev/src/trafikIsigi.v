module trafik_isigi_gomulu_odev_1(
    input sys_clk, // clk input
    input sys_rst_n, // reset input
    output reg [2:0] led // 110 yesil, 101 kirmizi, 011 mavi
);

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter <= 32'd0;
    else if (counter < 32'd1600_0000) // 0.5s bekleyis
        counter <= counter + 1;
    else    
        counter <= 32'd0;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led <= 3'b101;
    else if (counter == 32'd32000_0000 && led == 3'b101)
        led <= 3'b011;
    else if (counter == 32'd6400_0000 && led == 3'b011)
        led <= 3'b110;
    else if (counter == 32'16000_0000 && led == 3'b110)
        led <= 3'b101;
    else 
        led <= led;
end
endmodule