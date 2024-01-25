
module counter(
        input clk, reset,
        input [7:0]load_value,
        input preset,
        output [7:0] count
);
    reg [7:0] counter_up;
    reg [30:0] clk_counter;
    /*always@(posedge clk)
    begin
        if(clk_counter == 100000000) 
            clk_counter <=0;
         else
            clk_counter <= clk_counter +1'b1;
     end*/
    always@(posedge clk)
        begin
            if(reset)
                counter_up <= 8'b0;            //when reset is set high counter value is set to zero
            else if(preset)
                counter_up <= load_value;        //preset value loads the set value and the counter resumes counting from that number
            else 
                counter_up <= counter_up +1;    //incremental of value every positive edge of cycle
        end
        assign count = counter_up;        //output count receives reg value of counter_up
endmodule
