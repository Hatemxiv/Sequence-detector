
module fsm_det (
    reset,clock,serial_in,start,
    seq_out);

    input reset;
    input clock,start;
    input serial_in;
    tri0 reset;
    tri0 serial_in;
    output seq_out;
    reg seq_out;
    reg [4:0] fstate;
    reg [4:0] reg_fstate;
    parameter s0=0,s1=1,s2=2,s3=3,s4=4;

    always @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or reset or serial_in)
    begin
        if (reset) begin
            reg_fstate <= s0;
            seq_out <= 1'b0;
        end
        else if(start) begin
            seq_out <= 1'b0;
            case (fstate)
                s0: begin
                    if ((serial_in == 1'b1))
                        reg_fstate <= s1;
                    else if ((serial_in == 1'b0))
                        reg_fstate <= s0;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s0;

                    seq_out <= 1'b0;
                end
                s1: begin
                    if ((serial_in == 1'b0))
                        reg_fstate <= s2;
                    else if ((serial_in == 1'b1))
                        reg_fstate <= s1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s1;

                    seq_out <= 1'b0;
                end
                s2: begin
                    if ((serial_in == 1'b0))
                        reg_fstate <= s0;
                    else if ((serial_in == 1'b1))
                        reg_fstate <= s3;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s2;

                    seq_out <= 1'b0;
                end
                s3: begin
                    if ((serial_in == 1'b1))
                        reg_fstate <= s4;
                    else if ((serial_in == 1'b0))
                        reg_fstate <= s2;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s3;

                    seq_out <= 1'b0;
                end
                s4: begin
                    if ((serial_in == 1'b0))
                        reg_fstate <= s0;
                    else if ((serial_in == 1'b1))
                        reg_fstate <= s1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s4;

                    seq_out <= 1'b1;
                end
                default: begin
                    seq_out <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
        end
    end
endmodule // SM1
