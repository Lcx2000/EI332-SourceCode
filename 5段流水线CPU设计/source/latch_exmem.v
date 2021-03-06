module latch_exmem (clrn,clk,enable,
                    in_wmem,in_wreg,in_m2reg,in_jal,
                    in_wn,in_alures,in_ret,in_p4,in_data,
                    out_wmem,out_wreg,out_m2reg,out_jal,
                    out_wn,out_alures,out_ret,out_p4,out_data                  
                    );

input           enable,clk,clrn;
input           in_wmem,in_wreg,in_m2reg,in_jal;
input   [4:0]   in_wn,in_ret;
input   [31:0]  in_alures,in_p4,in_data;

output           out_wmem,out_wreg,out_m2reg,out_jal;      
output   [4:0]   out_wn,out_ret;                  
output   [31:0]  out_alures,out_p4,out_data; 

reg              out_wmem,out_wreg,out_m2reg,out_jal;
reg      [4:0]   out_wn,out_ret;             
reg      [31:0]  out_alures,out_p4,out_data;          
always @(posedge clk or negedge clrn)         
    begin           
        if (clrn == 0)               
            begin                 // reset                 
                out_wmem<=0;
                out_wreg<=0;
                out_m2reg<=0;
                out_wn<=0;
                out_alures<=0;
                out_ret<=0;
                out_p4<=0;
                out_data<=0;
                out_jal <= 0;
        end else  begin                 
            if (enable == 1)
            begin                    
                out_wmem <= in_wmem;
                out_wreg <= in_wreg;
                out_m2reg <= in_m2reg;
                out_wn   <= in_wn;
                out_alures <= in_alures;
                out_ret <= in_ret;
                out_p4 <= in_p4;
                out_data<=in_data;
                out_jal <= in_jal;
            end
            else
            begin 
                out_wmem = 0;
                out_wreg = 0;
            end  
        end        
    end

endmodule
