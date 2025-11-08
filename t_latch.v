//gate level modelling 
module t_latch(                                   
                                                 
   input T, En,                                  
   output Q, Qbar                                
);                                                
   wire S, R;                                    
   wire TQbar, TQ;                               
   wire Qa, Qb;                                  
                                                 
   and (TQbar, T, Qbar);  // S = T & ~Q          
   and (TQ, T, Q);        // R = T & Q           
                                                 
   and (S, En, TQbar);                           
   and (R, En, TQ);                              
                                                 
   nand (Qa, S, Qb);                             
   nand (Qb, R, Qa);                             
   assign Q = Qa;                                
   assign Qbar = Qb;                             
                                                 
   endmodule 

//behavioural modelling

module t_latch (
    input T, 
    input En, 
    output reg Q
);
    always @ (T or En) begin
        if (En) begin
            if (T)
                Q = ~Q;   // Toggle
            else
                Q = Q;    // Hold
        end
    end
endmodule
