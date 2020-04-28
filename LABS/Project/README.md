# ALU (Arithmetic Logic unit) 

## Popis ALU 
Aritmeticko logická jednotka je kombinační digitální elektrický obvod, který provádí bitové operace. Alu je základním stavebním kamenem různých počítačových obvodů. 4-bitová aritmetická jednotka má dva vstupy (A a B) a jeden výstup (Y) a může provádět 16 různých operací.  Logické operace jsou např.: NOT, AND, OR, XOR, clear operation, apod.

![ALU_block](https://github.com/jurekmartin3/Digital-Electronics-1/blob/master/LABS/Project/Pictures/ALU_block.png)

## Základní části projektu 
Testbench.vhd

alu.vhd

clock_enable.vhd

hex_to_7seg.vhd

## Schémata

![Blokové schéma](https://github.com/jurekmartin3/Digital-Electronics-1/blob/master/LABS/Project/Pictures/ALU.png)

Blokové schéma

![ALU_74 181](https://github.com/jurekmartin3/Digital-Electronics-1/blob/master/LABS/Project/Pictures/1.png)

Aritmeticko-logická jednotka realizovaná integrovaným obvodem 74181


## Tabulka operací
<table>
<tr><td><b>Řídící signál</b></td><td><b>Funkce</b></td><td><b>Popis</b></td></tr>
<tr><td> 0000 </td><td> Y = A + B </td><td> Součet </td></tr>
<tr><td> 0001 </td><td> Y = A - B </td><td> Rozdíl </td></tr>
<tr><td> 0010 </td><td> Y = A + 1 </td><td> Inkrementace </td></tr>
<tr><td> 0011 </td><td> Y = A * B </td><td> Součin </td></tr>
<tr><td> 0100 </td><td> Y = SLL </td><td> Logický posun vlevo </td></tr>
<tr><td> 0101 </td><td> Y = SRL </td><td> Logický posun vpravo </td></tr>
<tr><td> 0110 </td><td> Y = ROL </td><td> Rotace doleva </td></tr>
<tr><td> 0111 </td><td> Y = ROR </td><td> Rotace doprava </td></tr>
<tr><td> 1000 </td><td> Y = AND </td><td> A AND B </td></tr>
<tr><td> 1001 </td><td> Y = OR </td><td> A OR B </td></tr>
<tr><td> 1010 </td><td> Y = XOR </td><td> A XOR B </td></tr>
<tr><td> 1011 </td><td> Y = NOR </td><td> A NOR B </td></tr>
<tr><td> 1100 </td><td> Y = NAND </td><td> A NAND B </td></tr>
<tr><td> 1101 </td><td> Y = XNOR </td><td> A XNOR B </td></tr>
<tr><td> 1110 </td><td> Y = GR  </td><td> Větší než </td></tr>
<tr><td> 1111 </td><td> Y = EQ </td><td> Rovná se </td></tr>
</table>

## Schéma

![ALU_schematic](https://github.com/jurekmartin3/Digital-Electronics-1/blob/master/LABS/Project/Pictures/alu-schematic.png)

## Zdroje:

<p> http://noel.feld.cvut.cz/vyu/scs/2001/DSP56002/pages/ALU.htm
<p> https://cs.qwe.wiki/wiki/Arithmetic_logic_unit
<p> http://www.et-pocitacovesystemy.wz.cz/cislicova_technika/komb_log_obvody/aritm_log_jednotka/alu.html
<p> https://reference.digilentinc.com/reference/programmable-logic/coolrunner-ii/reference-manual
