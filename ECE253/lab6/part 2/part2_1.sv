
module part2(
    input logic Clock,
    input logic Reset,
    input logic Go,
    input logic [7:0] DataIn,
    output logic [7:0] DataResult,
    output logic ResultValid
);

    // lots of wires to connect our datapath and control
    logic ld_a, ld_b, ld_r;
    logic ld_c, ld_x; // TODO: loading c and x
    logic ld_alu_out;
    logic [1:0] alu_select_a, alu_select_b;  // TODO: changed to 2 bit mux select.
    logic alu_op;

    control C0(
        .clk(Clock),
        .reset(Reset),

        .go(Go),

        .ld_alu_out(ld_alu_out),
        
        .ld_a(ld_a),
        .ld_b(ld_b),
        .ld_r(ld_r),

        // TODO: added loading c and x
        .ld_c(ld_c),
        .ld_x(ld_x),
        
        // TODO: changed alu_selects to 2 bits
        .alu_select_a(alu_select_a),
        .alu_select_b(alu_select_b),
        .alu_op(alu_op),
        .result_valid(ResultValid)
    );

    datapath D0(
        .clk(Clock),
        .reset(Reset),

        .ld_alu_out(ld_alu_out),
        
        .ld_a(ld_a),
        .ld_b(ld_b),
        .ld_r(ld_r),

        // TODO: added loading c and x
        .ld_c(ld_c),
        .ld_x(ld_x),

        .alu_select_a(alu_select_a),
        .alu_select_b(alu_select_b),
        .alu_op(alu_op),

        .data_in(DataIn),
        .data_result(DataResult)
    );


 endmodule


module control(
    input logic clk,
    input logic reset,
    input logic go,

    output logic ld_a, ld_b, ld_r,
    output logic ld_c, ld_x,  // TODO: new signal addition for loading c and x
    output logic ld_alu_out,
    output logic [1:0] alu_select_a, alu_select_b,  // TODO: changed to 2 bit
    output logic alu_op,
    output logic result_valid
    );

    typedef enum logic [3:0]  { S_LOAD_A_RST    = 'd0,
                                S_LOAD_A        = 'd1,
                                S_LOAD_A_WAIT   = 'd2,
                                S_LOAD_B        = 'd3,
                                S_LOAD_B_WAIT   = 'd4,
                                // TODO: added new load state
                                S_LOAD_C        = 'd5,
                                S_LOAD_C_WAIT   = 'd6,
                                S_LOAD_X        = 'd7,
                                S_LOAD_X_WAIT   = 'd8,
                                // TODO: Added new processing cycle
                                S_CYCLE_0       = 'd9,
                                S_CYCLE_1       = 'd10,
                                S_CYCLE_2       = 'd11,
                                S_CYCLE_3       = 'd12,
                                S_CYCLE_4       = 'd13} statetype;
                                
    statetype current_state, next_state;                            

    // Next state logic aka our state table
    always_comb begin
        case (current_state)
            S_LOAD_A_RST: next_state = go ? S_LOAD_A_WAIT : S_LOAD_A_RST; // Loop in current state until value is input
            S_LOAD_A: next_state = go ? S_LOAD_A_WAIT : S_LOAD_A; // Loop in current state until value is input
            S_LOAD_A_WAIT: next_state = go ? S_LOAD_A_WAIT : S_LOAD_B; 
            S_LOAD_B: next_state = go ? S_LOAD_B_WAIT : S_LOAD_B; 
            S_LOAD_B_WAIT: next_state = go ? S_LOAD_B_WAIT : S_LOAD_C; 

            // TODO: LOAD IN C AND X
            S_LOAD_C: next_state = go ? S_LOAD_C_WAIT : S_LOAD_C; 
            S_LOAD_C_WAIT: next_state = go ? S_LOAD_C_WAIT : S_LOAD_X; 
            S_LOAD_X: next_state = go ? S_LOAD_X_WAIT : S_LOAD_X; 
            S_LOAD_X_WAIT: next_state = go ? S_LOAD_X_WAIT : S_CYCLE_0; 
            
            S_CYCLE_0: next_state = S_CYCLE_1;
            // TODO: Added new processing cycles, and return to S_LOAD_A at the end of processing cycle
            S_CYCLE_1: next_state = S_CYCLE_2;
            S_CYCLE_2: next_state = S_CYCLE_3;
            S_CYCLE_3: next_state = S_CYCLE_4;
            S_CYCLE_4: next_state = S_LOAD_A; // we will be done our operations, start over after
            default:   next_state = S_LOAD_A_RST;
        endcase
    end // state_table

    // output logic logic aka all of our datapath control signals
    always_comb begin
        // By default make all our signals 0
        ld_alu_out = 1'b0;
        ld_a = 1'b0;
        ld_b = 1'b0;
        ld_r = 1'b0;
        // TODO: make new stuff 0 by default as well
        ld_c = 1'b0;
        ld_x = 1'b0;
        // TODO: selects are also 0, but 2 bits now
        alu_select_a = 2'b0;
        alu_select_b = 2'b0;
        alu_op       = 1'b0;
        result_valid = 1'b0;

        case (current_state)
            S_LOAD_A_RST: begin
                ld_a = 1'b1;
                end
            S_LOAD_A: begin
                ld_a = 1'b1;
                result_valid = 1'b1;
                end
            S_LOAD_B: begin
                ld_b = 1'b1;
                end
            // TODO: added loading c and x instructions
            S_LOAD_C: begin
                ld_c = 1'b1;
                end
            S_LOAD_X: begin
                ld_x = 1'b1;
                end
            // TODO: modified all loading instructions. A = 0, B = 1, C = 2, X = 3.
            S_CYCLE_0: begin // Do A <- A * X
                ld_alu_out = 1'b1; 
                ld_a = 1'b1; // store result back into A
                alu_select_a = 2'b00; // Select register A
                alu_select_b = 2'b11; // Select register X
                alu_op = 1'b1; // Do multiply operation
            end
            S_CYCLE_1: begin // Do A <- A * X
                ld_alu_out = 1'b1; 
                ld_a = 1'b1; // store result back into A
                alu_select_a = 2'b00; // Select register A
                alu_select_b = 2'b11; // Select register X
                alu_op = 1'b1; // Do multiply operation
            end
            S_CYCLE_2: begin // Do B <- B * X
                ld_alu_out = 1'b1; 
                ld_b = 1'b1; // store result back into B
                alu_select_a = 2'b01; // Select register B
                alu_select_b = 2'b11; // Select register X
                alu_op = 1'b1; // Do multiply operation
            end
            S_CYCLE_3: begin // Do B <- A + B
                ld_alu_out = 1'b1; 
                ld_b = 1'b1; // store result back into B
                alu_select_a = 2'b00; // Select register A
                alu_select_b = 2'b01; // Select register B
                alu_op = 1'b0; // Do add operation
            end
            S_CYCLE_4: begin // Do R <- B + C
                ld_r = 1'b1; // store result to R
                alu_select_a = 2'b01; // Select register B
                alu_select_b = 2'b10; // Select register C
                alu_op = 1'b0; // Do add operation
            end
        // We don't need a default case since we already made sure all of our outputs were assigned a value at the start of the always block.
        endcase
    end // enable_signals

    // current_state logicisters
    always_ff@(posedge clk) begin
        if(reset)
            current_state <= S_LOAD_A_RST;
        else
            current_state <= next_state;
    end // state_FFS
endmodule

module datapath(
    input logic clk,
    input logic reset,
    input logic [7:0] data_in,
    input logic ld_alu_out,
    input logic ld_a, ld_b,
    // TODO: Add loading c and x
    input logic ld_c, ld_x,

    input logic ld_r,
    input logic alu_op,
    // TODO: changed to 2 bit select
    input logic [1:0] alu_select_a, alu_select_b,
    output logic [7:0] data_result
    );

    // input logic logicisters
    // TODO: added c and x
    logic [7:0] a, b, c, x;

    // output logic of the alu
    logic [7:0] alu_out;
    // alu input logic muxes
    logic [7:0] alu_a, alu_b;

    // registers a and b with associated logic
    always_ff @(posedge clk) begin
        if(reset) begin
            a <= 8'b0;
            b <= 8'b0;
            c <= 8'b0;
            x <= 8'b0;
        end
        else begin
            if(ld_a) a <= ld_alu_out ? alu_out : data_in; // load alu_out if load_alu_out signal is high, otherwise load from data_in
            if(ld_b) b <= ld_alu_out ? alu_out : data_in; 
            //TODO: add loading x and c
            // Note no need to ld_c and ld_x from ALU.
            if(ld_c) c <= data_in; 
            if(ld_x) x <= data_in; 
            // Note that only registers A and B have a mux to load values from data_in or from alu_out
        end
    end

    // output logic result logicister
    always@(posedge clk) begin
        if(reset) begin
            data_result <= 8'b0;
        end
        else
            if(ld_r)
                data_result <= alu_out;
    end

    // The ALU input logic multiplexers
    // TODO: modify to accomodate 2 bit select
    always_comb begin
        case (alu_select_a)
            2'd00: alu_a = a;
            2'd01: alu_a = b;
            2'd10: alu_a = c;
            2'd11: alu_a = x;
            default: alu_a = 8'b0;
        endcase

        case (alu_select_b)
            2'd00: alu_b = a;
            2'd01: alu_b = b;
            2'd10: alu_b = c;
            2'd11: alu_b = x;
            default: alu_b = 8'b0;
        endcase
    end

    // The ALU
    always_comb begin : ALU
        case (alu_op)
            0: alu_out = alu_a + alu_b; //performs addition
            1: alu_out = alu_a * alu_b; //performs multiplication
            default: alu_out = 8'b0;
        endcase
    end

endmodule


