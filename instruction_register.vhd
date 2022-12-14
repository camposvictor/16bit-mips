LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY instruction_register IS
    PORT (
        clk_in : IN STD_LOGIC;
        enable_in : IN STD_LOGIC;
        instruction_in : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        op_code_out : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
        instruction_op_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        alu_op_out : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        imm_data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- 16 or 8
        j_imm_data_out : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
        sel_rF_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        sel_rF2_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        sel_rD_out : OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END instruction_register;

ARCHITECTURE Behavioral OF instruction_register IS
    SIGNAL reg_instruction : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
BEGIN
    PROCESS (clk_in)
    BEGIN
        IF clk_in'event AND clk_in = '0' THEN
            IF enable_in = '1' THEN
                reg_instruction <= instruction_in;
            END IF;
        END IF;
    END PROCESS;

    op_code_out <= reg_instruction(15 DOWNTO 10);
    alu_op_out <= reg_instruction(15 DOWNTO 14);
    instruction_op_out <= reg_instruction(13 DOWNTO 10);
    sel_rD_out <= reg_instruction(9 DOWNTO 8);
    sel_rF_out <= reg_instruction(7 DOWNTO 4);
    sel_rF2_out <= reg_instruction(3 DOWNTO 0);
    imm_data_out <= reg_instruction(7 DOWNTO 0);
    j_imm_data_out <= reg_instruction(9 DOWNTO 0);

END Behavioral;