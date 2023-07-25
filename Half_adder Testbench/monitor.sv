
class monitor;
  virtual adder_if m_adder_vif;
  virtual clk_if m_clk_vif;
  
  mailbox scb_mbx; // mailbox connected to scoreboard;
  
  task run();
    $display("T=%0t [MONITOR] starting ...",$time);
    forever begin
      packet m_pkt = new();
      @(posedge m_clk_vif.tb_clk);
      #1;
      m_pkt.a = m_adder_vif.a;
      m_pkt.b = m_adder_vif.b;
      m_pkt.rstn = m_adder_vif.rstn;
      m_pkt.sum = m_adder_vif.sum;
      m_pkt.carry = m_adder_vif.carry;
      m_pkt.print("Monitor");
      scb_mbx.put(m_pkt);
    end
  endtask
endclass