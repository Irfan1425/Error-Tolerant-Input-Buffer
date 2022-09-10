# VLSI

Design and Layout Implementation of an Error Tollerant Input Buffer [ETIB] in 65nm Technology - Cadence Virutoso.


We would like to share our experience in developing the ETIB design. 

1. FSM: The FSM model used for our design is a 3-bit counter counting from 0 to 7, We used 4 D Flip Flops for our Counter. 3 of the DFF’s are used for the counter and another D Flip Flop is used to delay the out ready by 1 clock cycle. We needed to redesign our FSM couple of times to get the desired result. We had to use k-maps to design the FSM model for our intended use. 

2. DECODER/SIPO: This logic block converts serial input into parallel output, this step is required because we use combinational logic in the next block SECDED. We were mistaken in understanding the outputs from Decoder and we named the pins in opposite order. This created a lot of problems in our final Layout designing, we had to check each block separately. We also designed a block with FSM and Decoder together to understand it more clearly. The main problem we faced was that we would not get correct outputs when out ready becomes high. So, we needed to do more debugging than needed.

3. SECDED: SECDED is the only combinational block in our design which needed very less time to design but took a lot of our time to debug when we got an error. Because it included a lot of inputs, and each input depends previously on a sequential block. Also, each sub logic blocks in SECDED were to be designed to get minimum delay. We were able to achieve the minimum delay of less than 100 PS in the SECDED block. We decided to go for minimum AEDP of each block so that the final design gets optimum AEDP.

4. DFF: One of the most important logic gate in our design is D Flip Flop, initially we used NAND gates for our previous projects. But the AEDP value was large and by designing the D FF using inverter, tristate inverter we reduced the delay a lot. This D FF was made without RESET, so by adding a and gate and giving the Reset as the input we designed a negative edge D Flip Flop with negative edge triggering. The delay for the DFF was also maintained less than 100 ps.

5. ETIB: This design included all our blocks, with every block placed in the layout to get as minimum area as possible. We used standard cell methodology to do our layout placements. To do so we created a library with all the needed logic gates with each being optimized for its best AEDP, these logic gates had same height. 

- We faced many issued in placing of our layout one of the main issues were that we could not understand the LVS errors at first. It was our first time working around LVS errors and we got pretty good number of them to solve.
- We needed to fully understand the LVS window and learn to read the summary report.
- We understood how to modify the layout to pass the errors of Incorrect NETS, Incorrect Ports, Short Circuit, and Incorrect instances.
- We learnt the technique of creating an application specific Integrated circuit design(ETIB) from the transistor level up in the hierarchical level.
- We learnt how to use different number of metal wires and use them properly to get minimum area. 
- We used placement techniques like standard cell method, as well as understood that other algorithms can also be used for such purposes.
