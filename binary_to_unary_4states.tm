// This TM computes the binary to unary conversion

states =              {q1, q2, qA, qR}
input_alphabet =      {$, 0, 1}
tape_alphabet_extra = {!, _}
start_state =         q1
accept_state =        qA
reject_state =        qR
num_tapes =           2
delta =
    // Binary to unary conversion
    q1,__ -> q2,_1,LR;
    q1,1_ -> q1,1_,RS;
    q2,0_ -> q2,1_,LS;
    q2,1_ -> q1,0_,RS;
    
    // Initialize tape #1 to LSB
    q1,$_ -> q1,$!,RS;
    q1,0! -> q1,0!,RS;
    q1,1! -> q1,1!,RS;
    q1,_! -> q2,_!,LR;
    
    // Finalize tape #2 to MSB
    q2,$_ -> q2,$_,SL;
    q2,$1 -> q2,$1,SL;
    q2,$! -> qA,$!,SR;