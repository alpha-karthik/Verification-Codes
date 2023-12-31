
class scoreboard;
  mailbox scb_mbx;
  
  task run();
    forever begin
      packet item, ref_item;
      scb_mbx.get(item);
      item.print("Scoreboard");
      
      ref_item = new();
      ref_item.copy(item);
      
      if(ref_item.rstn)
      	{ref_item.carry,ref_item.sum} = ref_item.a + ref_item.b;
      else
      	{ref_item.carry,ref_item.sum} = 0;
      
      if (ref_item.carry != item.carry) begin
        $display("[%0t] scoreboard error! carry mismatch ref_item = 0x%0h item = 0x%0h", $time, ref_item.carry,item.carry);
      end else begin
        $display("[%0t] scoreboard pass! carry match ref_item = 0x%0h item = 0x%0h", $time, ref_item.carry,item.carry);
      end
      if (ref_item.sum != item.sum) begin
        $display("[%0t] scoreboard error! sum mismatch ref_item = 0x%0h item = 0x%0h", $time, ref_item.sum,item.sum);
      end else begin
        $display("[%0t] scoreboard pass! sum match ref_item = 0x%0h item = 0x%0h", $time, ref_item.sum,item.sum);
      end
    end
  endtask
endclass
      
        
      