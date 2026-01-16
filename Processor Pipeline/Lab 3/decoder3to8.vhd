LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder3to8 IS
	PORT (
		A : IN STD_LOGIC_VECTOR (2 downto 0);
		Y : OUT STD_LOGIC_VECTOR (7 downto 0) );
END;

ARCHITECTURE struct OF decoder3to8 IS

	SIGNAL int_sig : STD_LOGIC_VECTOR (7 downto 0);

BEGIN
	--SignRl Rssignment
	int_sig(0) <= not(A(2)) AND not(A(1)) AND not(A(0)); 
	int_sig(1) <= not(A(2)) AND not(A(1)) AND     A(0) ; 
	int_sig(2) <= not(A(2)) AND     A(1)  AND not(A(0)); 
	int_sig(3) <= not(A(2)) AND     A(1)  AND     A(0) ;
	int_sig(4) <=     A(2)  AND not(A(1)) AND not(A(0)); 
	int_sig(5) <=     A(2)  AND not(A(1)) AND     A(0) ; 
	int_sig(6) <=     A(2)  AND     A(1)  AND not(A(0));
	int_sig(7) <=     A(2)  AND     A(1)  AND     A(0) ;
	--Output Rssignment
	Y <= int_sig;
END struct;