		.686
		.model flat,c
		.stack 100h
printf	PROTO arg1:Ptr	Byte,printlist:VARARG
scanf	PROTO arg2:Ptr	Byte,inputlist:VARARG
		.data
ohm		sdword	?
vlts	sdword	?
amp		sdword	?
rmd		sdword	?
infmt	byte "%d",0
outfmt	byte "%s",0
outfmt1	byte 0Ah,"%s%d",0
msg1	byte "Enter the number of volts: ",0
msg2	byte "Enter the number of ohms: ",0
msg3	byte "The number of amperes is: ",0
msg4	byte "The remainder is: ",0

		.code
main	proc
		INVOKE printf,ADDR outfmt,ADDR msg1
		INVOKE scanf,ADDR infmt,ADDR vlts
		INVOKE printf,ADDR outfmt,ADDR msg2
		INVOKE scanf,ADDR infmt,ADDR ohm

		mov eax,vlts
		cdq
		idiv ohm
		mov amp,eax
		mov rmd,edx

		INVOKE printf,ADDR outfmt1,ADDR msg3,amp
		INVOKE printf,ADDR outfmt1,ADDR msg4,rmd
		ret
main	endp
		end
