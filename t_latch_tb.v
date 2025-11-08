
module t_latch_tb;
reg T,En;
wire Q, Qbar;
t_latch uut(.T(T),.En(En),.Q(Q),.Qbar(Qbar));
initial begin
        // Initialize signals
        T = 0; En = 0;
        #10;

        // Case 1: Enable = 0 → Latch holds
        T = 1; En = 0;
        #10;
        T = 0; En = 0;
        #10;

        // Case 2: Enable = 1, T = 1 → Toggle
        En = 1; T = 1;
        #10;
        
        // Case 3: T = 0 → Hold
        T = 0;
        #10;

        // Case 4: Toggle again
        T = 1;
        #10;
        T = 0;
        #10;

        // Case 5: Disable latch (hold state)
        En = 0;
        T = 1;
        #10;

        $stop; // End simulation
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | En=%b | T=%b | Q=%b | Qbar=%b", $time, En, T, Q, Qbar);
    end

endmodule
