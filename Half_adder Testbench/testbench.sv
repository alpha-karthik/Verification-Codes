`include "interface.sv"

module tb;
  bit tb_clk;
  
  clk_if m_clk_vif ();
  adder_if m_adder_vif();
  my_adder DUT (m_adder_vif);
  
  initial begin
    test t0;
    
    t0 = new;
    t0.e0.m_adder_vif = m_adder_vif;
    t0.e0.m_clk_vif = m_clk_vif;
    t0.run();
    
    #50 $finish;
  end
endmodule