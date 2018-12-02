.text
.global _start
_start:
        LDR		r0, DataNum /*number of elements*/
		LDR		r2, =myarr /*base adress of our array*/
		mov		r1, #0 /*with r1 we reach our array's components*/
bubble:
		LDR		r3, [r2, r1, LSL #2] /*r3 is our first number that compared*/
		add		r1,r1,#1 /*we add 1 for reach next component*/
		LDR		r4, [r2, r1, LSL #2] /*r4 is our second number that compared*/
        add		r5,r5,#1 /*r5 is our counter for inner j loop*/
		cmp		r3,r4 /*compare r3 and r4*/
		bgt		swap /*if r3 is bigger than r4, go to swap function*/
		cmp		r5,#8 /*compare r5 and 8*/
		bgt		tekrar /*if our inner counter is bigger than 8, go to tekrar function*/
		b		bubble /*go to the beginning of bubble function*/
swap:
		mov		r6,r3 /*r6 is our temp here, temp=r3*/
		mov		r3,r4 /*r3=r4*/
		mov		r4,r6 /*r4=temp*/
		sub		r1,r1,#1 /*we set r1 value as zero again*/
		str		r3,[r2, r1, LSL #2] /*we reach our array and change our component*/
		add		r1,r1,#1 /*we add 1 to r1 to reach next component*/
		str		r4,[r2, r1, LSL #2] /*and we change other component*/
		cmp		r5,#8 /*inner counter, maybe unneccesary*/
		bgt		tekrar /*if our inner counter is bigger than 8, go to tekrar function*/
		b		bubble /*go to the beginning of bubble function*/
tekrar:
		mov		r5, #0 /*we set inner counter value as zero again*/
		mov		r1, #0 /*we set r1 value as zero again*/
		add		r10,r10,#1 /*r10 is our outer counter for i*/
		cmp		r10,#8 /*compare r10 and 9*/
		bgt		STOP /*if our outer counter is bigger than 8 go to STOP function, this means size-1*/
		b		bubble /*if not go to the beginning*/
        
STOP: B STOP 
DataNum: .word 10 
myarr: .word 0x7FFFFFF1, 0x7FFFFFFF, 0x00000000, 0x80000000, 0x80000001, 0xA1234332, 0x20141020, 0x6FFFFFFF, 0xA1234320, 0x20141F20
.end
	
	