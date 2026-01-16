--------------------------------------------------------------------------------
-- Title         : Clock Divider Circuit
-- Project       : VHDL Example Programs
-------------------------------------------------------------------------------
-- File          : clk_div.vhd
-- Author        : Rami Abielmona  <rabielmo@site.uottawa.ca>
-- Created       : 2004/10/07
-- Last modified : 2007/09/26
-------------------------------------------------------------------------------
-- Description : This file creates a clock divider circuit using a behavioral approach.
--		 		 The code is extracted from "Rapid Prototyping Of Digital Systems" 
--				 by James Hamblen et Michael Furman.
-------------------------------------------------------------------------------
-- Modification history :
-- 2004.10.07 	R. Abielmona		Creation
-- 2007.09.26 	R. Abielmona		Modified copyright notice
-------------------------------------------------------------------------------
-- This file is copyright material of Rami Abielmona, Ph.D., P.Eng., Chief Research
-- Scientist at Larus Technologies.  Permission to make digital or hard copies of part
-- or all of this work for personal or classroom use is granted without fee
-- provided that copies are not made or distributed for profit or commercial
-- advantage and that copies bear this notice and the full citation of this work.
-- Prior permission is required to copy, republish, redistribute or post this work.
-- This notice is adapted from the ACM copyright notice.
--------------------------------------------------------------------------------
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY clk_div IS

	PORT
	(
		clkIn				: IN	STD_LOGIC;
		clkOut				: OUT	STD_LOGIC
		-- clock_100KHz				: OUT	STD_LOGIC;
		-- clock_10KHz				: OUT	STD_LOGIC;
		-- clock_1KHz				: OUT	STD_LOGIC;
		-- clock_100Hz				: OUT	STD_LOGIC;
		-- clock_10Hz				: OUT	STD_LOGIC;
		-- clock_1Hz				: OUT	STD_LOGIC
	);
	
END clk_div;

ARCHITECTURE a OF clk_div IS

	-- SIGNAL	count_1Mhz: STD_LOGIC_VECTOR(4 DOWNTO 0); 
	-- SIGNAL	count_100Khz, count_10Khz, count_1Khz : STD_LOGIC_VECTOR(2 DOWNTO 0);
	-- SIGNAL	count_100hz, count_10hz, count_1hz : STD_LOGIC_VECTOR(2 DOWNTO 0);
	-- SIGNAL  clock_1Mhz_int, clock_100Khz_int, clock_10Khz_int, clock_1Khz_int: STD_LOGIC; 
	-- SIGNAL	clock_100hz_int, clock_10Hz_int, clock_1Hz_int : STD_LOGIC;
	
	signal countClkOut : STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	signal ClkOutSig : STD_LOGIC;
	
BEGIN
	PROCESS 
	BEGIN
--Divide by 25
		WAIT UNTIL clkIn'EVENT and clkIn = '1';
			IF countClkOut < 10 THEN                       --24
				countClkOut <= countClkOut + 1;
			ELSE
				countClkOut <= "00000";
			END IF;
			IF countClkOut < 5 THEN                       --12
				clkOutSig <= '0';
			ELSE
				clkOutSig <= '1';
			END IF;	


			clkOut <= clkOutSig;
	END PROCESS;	



END a;

