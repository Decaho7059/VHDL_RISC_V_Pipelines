library ieee;
use ieee.std_logic_1164.all;

entity DownCounter3bits_TB is -- testbenches NEVER have ports!
end DownCounter3bits_TB;

architecture testbench of DownCounter3bits_TB is

	signal CLK_TB, RSTBAR_TB, ENABLE_TB : std_logic; -- control signal for testbench
	signal FINISH_TB : std_logic; -- output signal for testbench
	signal sim_end : boolean := false; -- signals the end of the simulation, used to stop the clock
	
	component down_counter_3bits is
		port(
		
			enable : in std_logic;
			clock : in std_logic;
			resetBar : in std_logic;
			finish : out std_logic
		);
	end component down_counter_3bits;
	
	constant period: time := 50 ns; -- used to set the time period for our clock
	
	begin
	
		DUT : down_counter_3bits
			port map (
				clock => CLK_TB,
				resetBar => RSTBAR_TB,
				enable => ENABLE_TB,
				finish => FINISH_TB);
				
		-- this is our clock process to simulate the clock. It will toggle
		-- every half period (which we defined earlier)
		clock_process : process
			begin
				while (not sim_end) loop
					CLK_TB <= '1';
					wait for period/2;
					CLK_TB <= '0';
					wait for period/2;
				end loop;
			wait;
		end process;
		
		testbench_process : process
			begin
				ENABLE_TB <= '1';
				RSTBAR_TB <= '0', '1' after period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0" 
				severity error;
				
				wait for period; -- we let the clock and reset signal stabilize
				RSTBAR_TB <= '1';
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0" 
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0"
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0"
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0"
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0"
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0" 
				severity error;
				
				wait for period;
				assert (FINISH_TB = '0')
				report "Test for initial reset failed, output should be 0"
				severity error;
				
				wait for period;
				assert (FINISH_TB = '1')
				report "Test for initial reset failed, output should be 1"
				severity error;
				
				sim_end <= true; -- signal the end of the stimuli
				wait;
				
		end process;
end testbench;		