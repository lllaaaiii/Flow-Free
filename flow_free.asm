INCLUDE Irvine32.inc
main   EQU start@0

.data
String1     BYTE "**LEVEL1**",0
String2     BYTE "~~GAME RULE~~",0
String3     BYTE "1.�ϥ���L�W�U���k�䱱��",0
String4     BYTE "2.�N�Ϯ׬ۦP������I�۱��A���P�Ϯת��s�u�������P���|�A�B�Ҧ��s�u�����G���e����l",0
String5     BYTE "3.���ť�����w�n��ܪ��Ϯװ��s�u�A�A���@��������w",0
String6     BYTE "4. backspace -> ���s�}�l    esc -> ��������",0
String7     BYTE "Win!!",0
String8     BYTE "**** LEVEL2 ****",0
String9     BYTE "****** LEVEL3 ******",0
bricks1     BYTE "����������",0 
bricks2     BYTE "����������",0 
bricks3     BYTE "����������",0
bricks4     BYTE "����������",0
bricks5     BYTE "����������",0
Map2_Line1  BYTE "����������������", 0	;����������������
Map2_Line2  BYTE "����������������", 0	;����������������
Map2_Line3  BYTE "����������������", 0	;����������������
Map2_Line4  BYTE "����������������", 0	;����������������
Map2_Line5  BYTE "����������������", 0	;����������������
Map2_Line6  BYTE "����������������", 0	;����������������
Map2_Line7  BYTE "����������������", 0	;����������������
Map2_Line8  BYTE "����������������", 0	;����������������
Map3_Line1   BYTE "��������������������", 0	;��������������������
Map3_Line2   BYTE "��������������������", 0	;��������������������
Map3_Line3   BYTE "��������������������", 0	;��������������������
Map3_Line4   BYTE "��������������������", 0	;��������������������
Map3_Line5   BYTE "��������������������", 0	;��������������������
Map3_Line6   BYTE "��������������������", 0	;��������������������
Map3_Line7   BYTE "��������������������", 0	;��������������������
Map3_Line8   BYTE "��������������������", 0	;��������������������
Map3_Line9   BYTE "��������������������", 0	;��������������������
Map3_Line10  BYTE "��������������������", 0	;��������������������
Pic_Square  	BYTE "��",0
Pic_Circle	BYTE "��",0
Pic_Star	BYTE "��",0
Pic_Diamond	BYTE "��",0
Pic_Triangle    BYTE "��",0
Pic_Space  	BYTE "��",0
Str_Up	    BYTE "UP   !",0
Str_Down    BYTE "Down !",0
Str_Right   BYTE "Right!",0
Str_Left    BYTE "Left !",0
Str_Enter   BYTE "Select!",0
Str_null    BYTE "       ",0
outputHandle 	DWORD 0
cellsWritten 	DWORD ?
xyPosition 	COORD <5,4>
attributes0 	WORD 7 DUP(0Bh)
attributes1 	WORD 2 DUP(0Ch)
consoleInfo	CONSOLE_SCREEN_BUFFER_INFO<>
Str_Enter_Pos 	COORD <5,2>
IsSelect    		BYTE 0
IsSelect_Square		BYTE 0
IsSelect_Circle		BYTE 0
IsSelect_Star		BYTE 0
IsSelect_Diamond	BYTE 0
IsSelect_Triangle	BYTE 0
count1			BYTE 0  ;Square
count2			BYTE 0  ;Circle
count3			BYTE 0  ;Star
count4			BYTE 0  ;Diamond
count5			BYTE 0  ;Triangle
oldPos_X 	BYTE 0
oldPos_Y 	BYTE 0
NowPos_X 	BYTE 0
NowPos_Y 	BYTE 0
Square_Path_X	 	BYTE 50 DUP(?)
Square_Path_Y	 	BYTE 50 DUP(?)
Circle_Path_X	 	BYTE 50 DUP(?)
Circle_Path_Y	 	BYTE 50 DUP(?)
Star_Path_X	 	BYTE 50 DUP(?)
Star_Path_Y	 	BYTE 50 DUP(?)
Diamond_Path_X	 	BYTE 50 DUP(?)
Diamond_Path_Y	 	BYTE 50 DUP(?)
Triangle_Path_X	 	BYTE 50 DUP(?)
Triangle_Path_Y	 	BYTE 50 DUP(?)
EndGame		BYTE 0
is_up		BYTE 0
is_down		BYTE 0
is_right	BYTE 0
is_left		BYTE 0
is_repeat	BYTE 0
Map_1		BYTE 0
Map_2		BYTE 0
Map_3		BYTE 0

.code
main PROC
    	call Clrscr 		;�M���ù�
   	mov dl, 14            	; "x" 
    	mov dh, 2            	; "y" 
    	call Gotoxy            	; The cursor is located there. ;���s�w���Цb�D������������m dh = row , dl = col 
    	mov eax, yellow+(black*16)   
    	call SetTextColor        	; color set. 
    	mov edx, OFFSET String1       
    	call WriteString        	; printed on the screen. 

	mov dl, 36            	
    	mov dh, 2            	 
    	call Gotoxy            	 
    	mov eax, lightgreen+(black*16)    
    	call SetTextColor        	
    	mov edx, OFFSET String2        ; printed 
    	call WriteString        	
	mov dl, 36            	
    	mov dh, 4            	
    	call Gotoxy 
	mov eax, white+(black*16)    
    	call SetTextColor           	
    	mov edx, OFFSET String3        ; printed 
    	call WriteString 
	mov dl, 36            	
    	mov dh, 6            	
    	call Gotoxy           	
    	mov edx, OFFSET String4        ; printed 
    	call WriteString        
	mov dl, 36            	
    	mov dh, 8            	
    	call Gotoxy            	
    	mov edx, OFFSET String5        ; printed 
    	call WriteString
	mov dl, 36            	
    	mov dh, 10            	
    	call Gotoxy            	
    	mov edx, OFFSET String6        ; printed 
    	call WriteString
Map:
	mov Map_1, 1
    	mov dl, 14           
    	mov dh, 4            
    	call Gotoxy        
    	mov eax, blue+(white*16)    
    	call SetTextColor       
    	mov edx, OFFSET bricks1 
    	call WriteString
    	mov dl, 14           
    	mov dh, 5           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET bricks2 
    	call WriteString
    	mov dl, 14          
    	mov dh, 6           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET bricks3 
    	call WriteString
    	mov dl, 14            
    	mov dh, 7           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET bricks4 
    	call WriteString
    	mov dl, 14            
    	mov dh, 8           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET bricks5 
    	call WriteString
	; Initial the Position of Cursor 
	mov dl, 14
	mov dh, 4
	call Gotoxy 

	call  LookForKey

	mov eax, white
	call SetTextColor
	call Crlf
	call WaitMsg
	exit
main ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LookForKey PROC
	mov  eax,50          	; sleep, to allow OS to time slice
    	call Delay           	; (otherwise, some key presses are lost)

    	call ReadKey         	; look for keyboard input
    	jz   LookForKey      	; no key pressed yet
	.IF ax == 3920h 	; Space
		call Select
	; Keys arrows(up48h,down50h,right4Dh,left4Bh).
	.ELSEIF ax == 4800h || ax == 5000h || ax == 4D00h || ax == 4B00h
		call Move
	.ENDIF

	.IF ax == 011Bh 	;ESC
		exit
	.ENDIF
	.IF EndGame == 5		;�����s��
		mov eax, black
		call SetTextColor
		call Clrscr
		.IF Map_1 == 1
			mov Map_1, 0
			mov Map_2, 1
			;initial
			mov  IsSelect, 0
			mov  IsSelect_Square, 0
			mov  IsSelect_Circle, 0
			mov  IsSelect_Star, 0
			mov  IsSelect_Diamond, 0
			mov  IsSelect_Triangle, 0
			mov  count1, 0
			mov  count2, 0
			mov  count3, 0
			mov  count4, 0
			mov  count5, 0
			mov  EndGame, 0
			call Map2
		.ENDIF
		.IF Map_2 == 1
			mov Map_2, 0
			mov Map_3, 1
			;initial
			mov  IsSelect, 0
			mov  IsSelect_Square, 0
			mov  IsSelect_Circle, 0
			mov  IsSelect_Star, 0
			mov  IsSelect_Diamond, 0
			mov  IsSelect_Triangle, 0
			mov  count1, 0
			mov  count2, 0
			mov  count3, 0
			mov  count4, 0
			mov  count5, 0
			mov  EndGame, 0
			call Map3
		.ENDIF
		.IF Map_3 == 1
			mov dl, 16           
    			mov dh, 6            
    			call Gotoxy        
    			mov eax, yellow
    			call SetTextColor       
    			mov edx, OFFSET String7
    			call WriteString

			mov eax, white
			call SetTextColor
			call Crlf
			call WaitMsg
			exit
		.ENDIF
		ret
	.ENDIF
	.IF ax == 0E08h		;backspace	;��s�a��
		mov eax, black
		call SetTextColor
		;initial
		mov  IsSelect, 0
		mov  IsSelect_Square, 0
		mov  IsSelect_Circle, 0
		mov  IsSelect_Star, 0
		mov  IsSelect_Diamond, 0
		mov  IsSelect_Triangle, 0
		mov  count1, 0
		mov  count2, 0
		mov  count3, 0
		mov  count4, 0
		mov  count5, 0
		mov  EndGame, 0
		.IF Map_1 == 1
			call main
		.ENDIF
		.IF Map_2 == 1
			call Map2
		.ENDIF
		.IF Map_3 == 1
			call Map3
		.ENDIF
		
	.ENDIF
	jmp  LookForKey
	ret
LookForKey ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Select PROC USES eax edx ecx
;Ū�����Ц�m�A�Y��(14,4).(16,8).(16,7).(18,4).(18,5).(18,8).
;(20,7).(20,8).(22,4).(22,5)�h�~�򰵡A�_�h�^�h�P�_Key
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE 	; Get the console ouput handle
    	mov outputHandle, eax 			; save console handle
	INVOKE GetConsoleScreenBufferInfo,
			outputHandle, ADDR consoleInfo
	mov cx, consoleInfo.dwCursorPosition.Y
	mov dh, cl
	mov cx, consoleInfo.dwCursorPosition.X
	mov dl, cl
	mov NowPos_X, dl
	mov NowPos_Y, dh
	;�P�_�����m�O�_�����Ħ�m
	
	.IF Map_1 == 1
		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8)
			jmp Square
		.ELSEIF (dl == 16 && dh == 7) || (dl == 18 && dh == 4)
			jmp Circle
		.ELSEIF (dl == 18 && dh == 5) || (dl == 18 && dh == 8)
			jmp Star
		.ELSEIF (dl == 20 && dh == 7) || (dl == 22 && dh == 4)
			jmp Diamond
		.ELSEIF (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
			jmp Triangle
	
		.ELSE
			jmp _End
		.ENDIF
	.ENDIF
	.IF Map_2 == 1
		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9)
			jmp Square
		.ELSEIF (dl == 22 && dh == 8) || (dl == 28 && dh == 8)
			jmp Circle
		.ELSEIF (dl == 16 && dh == 5) || (dl == 20 && dh == 10)
			jmp Star
		.ELSEIF (dl == 18 && dh == 6) || (dl == 24 && dh == 9)
			jmp Diamond
		.ELSEIF (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
			jmp Triangle
	
		.ELSE
			jmp _End
		.ENDIF
	.ENDIF
	.IF Map_3 == 1
		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10)
			jmp Square
		.ELSEIF (dl == 16 && dh == 9) || (dl == 26 && dh == 4)
			jmp Circle
		.ELSEIF (dl == 18 && dh == 9) || (dl == 24 && dh == 4)
			jmp Star
		.ELSEIF (dl == 22 && dh == 9) || (dl == 30 && dh == 4)
			jmp Diamond
		.ELSEIF (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
			jmp Triangle
	
		.ELSE
			jmp _End
		.ENDIF
	.ENDIF
	
On_:
;�b�ϮפW��� 
	;Print the string "Select!"
	INVOKE WriteConsoleOutputAttribute,
      		outputHandle,
      		ADDR attributes0,
      		SIZEOF Str_Enter,
      		Str_Enter_Pos,
      		ADDR cellsWritten
	INVOKE WriteConsoleOutputCharacter,
       		outputHandle,
       		ADDR Str_Enter,   
       		SIZEOF Str_Enter,
       		Str_Enter_Pos,
       		ADDR cellsWritten
	jmp UpdateCursor
Square:
	.IF IsSelect_Square == 0 && count1 == 0
		mov eax, lightMagenta+(white*16)    
    		call SetTextColor
		push dx
		mov oldPos_X, dl
		mov oldPos_Y, dh
		mov edx, OFFSET Pic_Square
    		call WriteString

		;save path
		pop dx
		movzx esi, count1
		mov  Square_Path_X[esi], dl
		mov  Square_Path_Y[esi], dh
		inc  count1

		mov IsSelect_Square,1
		mov IsSelect, 1
		jmp On_
	.ELSEIF IsSelect_Square == 0 && count1 != 0	;����w�g�s���@���u�����I -> ���������u
		mov eax, blue+(white*16)
    		call SetTextColor
		mov ecx, 2	;�Y & ��
		mov esi, 0
		L1_line0:
			mov  dl, Square_Path_X[esi]
			mov  dh, Square_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Square
			call WriteString
			movzx  esi, count1
			sub  esi,1	;��
			loop L1_line0
		movzx ecx, count1
		sub  ecx, 2	;���F �Y & ��
		mov esi, 1
		L1_line1:
			mov  dl, Square_Path_X[esi]
			mov  dh, Square_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Space
			call WriteString
			inc  esi
			loop L1_line1
		mov  count1, 0
		dec  EndGame
	.ELSE
		jmp Cancel
	.ENDIF
	jmp UpdateCursor
Circle:
	.IF IsSelect_Circle == 0 && count2 == 0
		mov eax, red+(white*16)    
    		call SetTextColor
		push dx
		mov oldPos_X, dl
		mov oldPos_Y, dh
		mov edx, OFFSET Pic_Circle
    		call WriteString

		;save path
		pop dx
		movzx esi, count2
		mov  Circle_Path_X[esi], dl
		mov  Circle_Path_Y[esi], dh
		inc  count2

		mov IsSelect_Circle,1
		mov IsSelect, 1
		jmp On_
	.ELSEIF IsSelect_Circle == 0 && count2 != 0	;����w�g�s���@���u�����I -> ���������u
		mov eax, blue+(white*16)
    		call SetTextColor
		mov ecx, 2	;�Y & ��
		mov esi, 0
		L2_line0:
			mov  dl, Circle_Path_X[esi]
			mov  dh, Circle_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Circle
			call WriteString
			movzx  esi, count2
			sub  esi,1	;��
			loop L2_line0
		movzx ecx, count2
		sub  ecx, 2	;���F �Y & ��
		mov esi, 1
		L2_line1:
			mov  dl, Circle_Path_X[esi]
			mov  dh, Circle_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Space
			call WriteString
			inc  esi
			loop L2_line1
		mov  count2, 0
		dec  EndGame
	.ELSE
		jmp Cancel
	.ENDIF
	
	jmp UpdateCursor
Star:      
    	.IF IsSelect_Star == 0 && count3 == 0
		mov eax, yellow+(white*16)    
    		call SetTextColor
		push dx
		mov oldPos_X, dl
		mov oldPos_Y, dh
		mov edx, OFFSET Pic_Star
    		call WriteString

		; Save Path
		pop dx
		movzx esi, count3
		mov  Star_Path_X[esi], dl
		mov  Star_Path_Y[esi], dh
		inc  count3

		mov IsSelect_Star,1
		mov IsSelect, 1
		jmp On_
	.ELSEIF IsSelect_Star == 0 && count3 != 0	;����w�g�s���@���u�����I -> ���������u
		mov eax, blue+(white*16)
    		call SetTextColor
		mov ecx, 2	;�Y & ��
		mov esi, 0
		L3_line0:
			mov  dl, Star_Path_X[esi]
			mov  dh, Star_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Star
			call WriteString
			movzx  esi, count3
			sub  esi,1	;��
			loop L3_line0
		movzx ecx, count3
		sub  ecx, 2	;���F �Y & ��
		mov esi, 1
		L3_line1:
			mov  dl, Star_Path_X[esi]
			mov  dh, Star_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Space
			call WriteString
			inc  esi
			loop L3_line1
		mov  count3, 0
		dec  EndGame
	.ELSE
		jmp Cancel
	.ENDIF
	jmp UpdateCursor
Diamond:       
    	.IF IsSelect_Diamond == 0 && count4 == 0
		mov eax, lightgreen+(white*16)    
    		call SetTextColor
		push dx
		mov oldPos_X, dl
		mov oldPos_Y, dh
		mov edx, OFFSET Pic_Diamond
    		call WriteString

		; Save Path
		pop dx
		movzx esi, count4
		mov  Diamond_Path_X[esi], dl
		mov  Diamond_Path_Y[esi], dh
		inc  count4

		mov IsSelect_Diamond,1
		mov IsSelect, 1
		jmp On_
	.ELSEIF IsSelect_Diamond == 0 && count4 != 0	;����w�g�s���@���u�����I -> ���������u
		mov eax, blue+(white*16)
    		call SetTextColor
		mov ecx, 2	;�Y & ��
		mov esi, 0
		L4_line0:
			mov  dl, Diamond_Path_X[esi]
			mov  dh, Diamond_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Diamond
			call WriteString
			movzx  esi, count4
			sub  esi,1	;��
			loop L4_line0
		movzx ecx, count4
		sub  ecx, 2	;���F �Y & ��
		mov esi, 1
		L4_line1:
			mov  dl, Diamond_Path_X[esi]
			mov  dh, Diamond_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Space
			call WriteString
			inc  esi
			loop L4_line1
		mov  count4, 0
		dec  EndGame
	.ELSE
		jmp Cancel
	.ENDIF
	jmp UpdateCursor
Triangle:       
    	.IF IsSelect_Triangle == 0 && count5 == 0
		mov eax, cyan+(white*16)    
    		call SetTextColor
		push dx
		mov oldPos_X, dl
		mov oldPos_Y, dh
		mov edx, OFFSET Pic_Triangle
    		call WriteString

		; Save Path5
		pop dx
		movzx esi, count5
		mov  Triangle_Path_X[esi], dl
		mov  Triangle_Path_Y[esi], dh
		inc  count5

		mov IsSelect_Triangle,1
		mov IsSelect, 1
		jmp On_
	.ELSEIF IsSelect_Triangle == 0 && count5 != 0	;����w�g�s���@���u�����I -> ���������u
		mov eax, blue+(white*16)
    		call SetTextColor
		mov ecx, 2	;�Y & ��
		mov esi, 0
		L5_line0:
			mov  dl, Triangle_Path_X[esi]
			mov  dh, Triangle_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Triangle
			call WriteString
			movzx  esi, count5
			sub  esi,1	;��
			loop L5_line0
		movzx ecx, count5
		sub  ecx, 2	;���F �Y & ��
		mov esi, 1
		L5_line1:
			mov  dl, Triangle_Path_X[esi]
			mov  dh, Triangle_Path_Y[esi]
			call Gotoxy
			mov  edx, OFFSET Pic_Space
			call WriteString
			inc  esi
			loop L5_line1
		mov  count5, 0
		dec  EndGame
	.ELSE
		jmp Cancel
	.ENDIF
	jmp UpdateCursor
Cancel:
;����ĤG�����ܨ���
	INVOKE WriteConsoleOutputCharacter,
       		outputHandle,
       		ADDR Str_null,   
       		SIZEOF Str_Enter,
       		Str_Enter_Pos,
       		ADDR cellsWritten
	mov dl, NowPos_X
	mov dh, NowPos_Y
	;�P�_�O�_�^���
	.IF oldPos_X == dl && oldPos_Y == dh
		mov eax, blue+(white*16)
    		call SetTextColor
		.IF IsSelect_Square == 1
			mov edx, OFFSET Pic_Square
			call WriteString
			mov IsSelect_Square, 0
			mov IsSelect, 0
			mov count1, 0
		.ELSEIF IsSelect_Circle == 1   
    			mov edx, OFFSET Pic_Circle
			call WriteString
			mov IsSelect_Circle, 0
			mov IsSelect, 0
			mov count2, 0
		.ELSEIF IsSelect_Star == 1    
    			mov edx, OFFSET Pic_Star
			call WriteString
			mov IsSelect_Star, 0
			mov IsSelect, 0
			mov count3, 0
		.ELSEIF IsSelect_Diamond == 1   
    			mov edx, OFFSET Pic_Diamond
			call WriteString
			mov IsSelect_Diamond, 0
			mov IsSelect, 0
			mov count4, 0
		.ELSEIF IsSelect_Triangle == 1 
    			mov edx, OFFSET Pic_Triangle
			call WriteString
			mov IsSelect_Triangle, 0
			mov IsSelect, 0
			mov count5, 0
		.ENDIF
	.ELSE 
		jmp _End
	.ENDIF
	
UpdateCursor:
;�A���s�]�w���(�]�L���Ϯ״�ж]���F)
	mov dh, NowPos_Y
	mov dl, NowPos_X
	call Gotoxy
_End:
	ret
Select ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Move PROC
	push eax
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE 	; Get the console ouput handle
    	mov outputHandle, eax 			; save console handle 
	INVOKE  WriteConsoleOutputAttribute,
      			outputHandle,
      			ADDR attributes0,
      			SIZEOF Str_Right,
      			xyPosition,
      			ADDR cellsWritten
	INVOKE WriteConsoleOutputCharacter,
       		outputHandle,
       		ADDR Str_null,   
       		SIZEOF Str_Right,
       		xyPosition,
       		ADDR cellsWritten
	INVOKE GetConsoleScreenBufferInfo,
			outputHandle, ADDR consoleInfo
	mov cx, consoleInfo.dwCursorPosition.Y
	mov dh, cl
	mov cx, consoleInfo.dwCursorPosition.X
	mov dl, cl
	call Gotoxy 

	pop eax
	cmp ah, 48H            ; Control of the motion if it is upwards. 
    	je Up 
    	cmp ah, 50H            ; Control of the motion if it is downwards. 
    	je Down 
    	cmp ah, 4DH            ; Control of the motion if it is rightwards. 
    	je Right 
    	cmp ah, 4BH            ; Control of the motion if it is leftwards. 
    	je Left 
	jmp Finish

Up:     
	cmp dh, 4   ;upper bound -> dh = 4
	jle Finish
	dec dh
	.IF Map_1 == 1
	    .IF IsSelect_Square == 1
	    	.IF (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
			inc dh
			jmp Finish
	    	.ENDIF
	    .ELSEIF IsSelect_Circle == 1
	    	.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
			inc dh
			jmp Finish
	    	.ENDIF
	    .ELSEIF IsSelect_Star == 1
	    	.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
			inc dh
			jmp Finish
	    	.ENDIF
	    .ELSEIF IsSelect_Diamond == 1
	    	.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
			inc dh
			jmp Finish
	    	.ENDIF	
	    .ELSEIF IsSelect_Triangle == 1
	    	.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4)
			inc dh
			jmp Finish
	    	.ENDIF
	    .ENDIF
	.ENDIF
	.IF Map_2 == 1
	    	.IF IsSelect_Square == 1
	    		.IF (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				inc dh
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF
	.IF Map_3 == 1
	    	.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				inc dh
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4)
				inc dh
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF

	dec consoleInfo.dwCursorPosition.Y
	
	.IF (IsSelect == 1)
		call CheckRepeatPath
		.IF is_repeat == 1
			mov is_repeat, 0
			jmp Finish
		.ENDIF
	.ENDIF

	mov is_up, 1
	.IF (IsSelect == 1) && (IsSelect_Square == 1)
		; Save Path
		movzx esi, count1
		mov  Square_Path_X[esi], dl
		mov  Square_Path_Y[esi], dh
		inc  count1
	.ELSEIF (IsSelect == 1) && (IsSelect_Circle == 1)
		; Save Path
		movzx esi, count2
		mov  Circle_Path_X[esi], dl
		mov  Circle_Path_Y[esi], dh
		inc  count2
	.ELSEIF (IsSelect == 1) && (IsSelect_Star == 1)
		; Save Path
		movzx esi, count3
		mov  Star_Path_X[esi], dl
		mov  Star_Path_Y[esi], dh
		inc  count3
	.ELSEIF (IsSelect == 1) && (IsSelect_Diamond == 1)
		; Save Path
		movzx esi, count4
		mov  Diamond_Path_X[esi], dl
		mov  Diamond_Path_Y[esi], dh
		inc  count4
	.ELSEIF (IsSelect == 1) && (IsSelect_Triangle == 1)
		; Save Path5
		movzx esi, count5
		mov  Triangle_Path_X[esi], dl
		mov  Triangle_Path_Y[esi], dh
		inc  count5
	.ENDIF
	call Output_Pos
	call Gotoxy
	push dx
    	INVOKE WriteConsoleOutputCharacter,
       			outputHandle,
       			ADDR Str_Up,   
       			SIZEOF Str_Up,
       			xyPosition,
       			ADDR cellsWritten
	pop dx
	call DrawPattern
	call BackPath
	mov is_up, 0
	jmp Finish
Down:    	
	.IF Map_1 == 1
		cmp dh, 8   ;down bound -> dh = 8
		jge Finish
		inc dh
		.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				dec dh
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				dec dh
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Star == 1
			.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				dec dh
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				dec dh
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4)
				dec dh
				jmp Finish
	    		.ENDIF
		.ENDIF
	.ENDIF
	.IF Map_2 == 1
		cmp dh, 11   ;down bound -> dh = 11
		jge Finish
		inc dh
		.IF IsSelect_Square == 1
	    		.IF (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				dec dh
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF
	.IF Map_3 == 1
		cmp dh, 13   ;down bound -> dh = 13
		jge Finish
		inc dh
	    	.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				dec dh
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4)
				dec dh
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF

	inc consoleInfo.dwCursorPosition.Y
	.IF (IsSelect == 1)
		call CheckRepeatPath
		.IF is_repeat == 1
			mov is_repeat, 0
			jmp Finish
		.ENDIF
	.ENDIF
	
	mov is_down, 1 

	.IF (IsSelect == 1) && (IsSelect_Square == 1)
		; Save Path
		movzx esi, count1
		mov  Square_Path_X[esi], dl
		mov  Square_Path_Y[esi], dh
		inc  count1
		
	.ELSEIF (IsSelect == 1) && (IsSelect_Circle == 1)
		; Save Path
		movzx esi, count2
		mov  Circle_Path_X[esi], dl
		mov  Circle_Path_Y[esi], dh
		inc  count2
	.ELSEIF (IsSelect == 1) && (IsSelect_Star == 1)
		; Save Path
		movzx esi, count3
		mov  Star_Path_X[esi], dl
		mov  Star_Path_Y[esi], dh
		inc  count3
	.ELSEIF (IsSelect == 1) && (IsSelect_Diamond == 1)
		; Save Path
		movzx esi, count4
		mov  Diamond_Path_X[esi], dl
		mov  Diamond_Path_Y[esi], dh
		inc  count4
	.ELSEIF (IsSelect == 1) && (IsSelect_Triangle == 1)
		; Save Path5
		movzx esi, count5
		mov  Triangle_Path_X[esi], dl
		mov  Triangle_Path_Y[esi], dh
		inc  count5
	.ENDIF
	call Output_Pos
	call Gotoxy
	push dx
    	INVOKE WriteConsoleOutputCharacter,
       			outputHandle,
       			ADDR Str_Down,   
       			SIZEOF Str_Down,
       			xyPosition,
       			ADDR cellsWritten
	pop dx
	call DrawPattern
	call BackPath
	mov is_down, 0
	jmp Finish
Right:      
	.IF Map_1 == 1
		cmp dl, 22   ;down bound -> dl = 22
		jge Finish
		add dl, 2
		.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				sub dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				sub dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Star == 1
			.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				sub dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				sub dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4)
				sub dl, 2
				jmp Finish
	    		.ENDIF
		.ENDIF
	.ENDIF
	.IF Map_2 == 1
		cmp dl, 28   ;down bound -> dl = 28
		jge Finish
		add dl, 2
		.IF IsSelect_Square == 1
	    		.IF (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				sub dl, 2
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF

	.IF Map_3 == 1
		cmp dl, 32   ;down bound -> dl = 32
		jge Finish
		add dl, 2
	    	.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				sub dl, 2
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4)
				sub dl, 2
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF

	add consoleInfo.dwCursorPosition.X, 2
	.IF (IsSelect == 1)
		call CheckRepeatPath
		.IF is_repeat == 1
			mov is_repeat, 0
			jmp Finish
		.ENDIF
	.ENDIF
	mov is_right, 1
	
	.IF (IsSelect == 1) && (IsSelect_Square == 1)
		; Save Path
		movzx esi, count1
		mov  Square_Path_X[esi], dl
		mov  Square_Path_Y[esi], dh
		inc  count1
	.ELSEIF (IsSelect == 1) && (IsSelect_Circle == 1)
		; Save Path
		movzx esi, count2
		mov  Circle_Path_X[esi], dl
		mov  Circle_Path_Y[esi], dh
		inc  count2
	.ELSEIF (IsSelect == 1) && (IsSelect_Star == 1)
		; Save Path
		movzx esi, count3
		mov  Star_Path_X[esi], dl
		mov  Star_Path_Y[esi], dh
		inc  count3
	.ELSEIF (IsSelect == 1) && (IsSelect_Diamond == 1)
		; Save Path
		movzx esi, count4
		mov  Diamond_Path_X[esi], dl
		mov  Diamond_Path_Y[esi], dh
		inc  count4
	.ELSEIF (IsSelect == 1) && (IsSelect_Triangle == 1)
		; Save Path5
		movzx esi, count5
		mov  Triangle_Path_X[esi], dl
		mov  Triangle_Path_Y[esi], dh
		inc  count5
	.ENDIF
	call Output_Pos 
	call Gotoxy
	push dx
	INVOKE WriteConsoleOutputCharacter,
       			outputHandle,
       			ADDR Str_Right,  
       			SIZEOF Str_Right,
       			xyPosition,
       			ADDR cellsWritten
	pop dx
	call DrawPattern
	call BackPath
	mov is_right, 0
	jmp Finish
Left:   
	cmp dl, 14   ;down bound -> dl = 14
	jle Finish
	sub dl, 2
	.IF Map_1 == 1
		.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				add dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				add dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Star == 1
			.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				add dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 8) || (dl == 22 && dh == 5)
				add dl, 2
				jmp Finish
	    		.ENDIF
		.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 16 && dh == 8) || (dl == 16 && dh == 7) || (dl == 18 && dh == 4) || (dl == 18 && dh == 5) || (dl == 18 && dh == 8) || (dl == 20 && dh == 7) || (dl == 22 && dh == 4)
				add dl, 2
				jmp Finish
	    		.ENDIF
		.ENDIF
	.ENDIF
	.IF Map_2 == 1
		.IF IsSelect_Square == 1
	    		.IF (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 16 && dh == 10) || (dl == 26 && dh == 10)
				add dl, 2
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 7) || (dl == 18 && dh == 9) || (dl == 22 && dh == 8) || (dl == 28 && dh == 8) || (dl == 16 && dh == 5) || (dl == 20 && dh == 10) || (dl == 18 && dh == 6) || (dl == 24 && dh == 9)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF
	.IF Map_3 == 1
	    	.IF IsSelect_Square == 1
	    		.IF (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Circle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Star == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ELSEIF IsSelect_Diamond == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 18 && dh == 5) || (dl == 28 && dh == 11)
				add dl, 2
				jmp Finish
	    		.ENDIF	
	    	.ELSEIF IsSelect_Triangle == 1
	    		.IF (dl == 14 && dh == 4) || (dl == 20 && dh == 10) || (dl == 16 && dh == 9) || (dl == 26 && dh == 4) || (dl == 18 && dh == 9) || (dl == 24 && dh == 4) || (dl == 22 && dh == 9) || (dl == 30 && dh == 4)
				add dl, 2
				jmp Finish
	    		.ENDIF
	    	.ENDIF
	.ENDIF

	sub consoleInfo.dwCursorPosition.X, 2
	.IF (IsSelect == 1)
		call CheckRepeatPath
		.IF is_repeat == 1
			mov is_repeat, 0
			jmp Finish
		.ENDIF
	.ENDIF
	mov is_left, 1
	
	.IF (IsSelect == 1) && (IsSelect_Square == 1)
		; Save Path
		movzx esi, count1
		mov  Square_Path_X[esi], dl
		mov  Square_Path_Y[esi], dh
		inc  count1
	.ELSEIF (IsSelect == 1) && (IsSelect_Circle == 1)
		; Save Path
		movzx esi, count2
		mov  Circle_Path_X[esi], dl
		mov  Circle_Path_Y[esi], dh
		inc  count2
	.ELSEIF (IsSelect == 1) && (IsSelect_Star == 1)
		; Save Path
		movzx esi, count3
		mov  Star_Path_X[esi], dl
		mov  Star_Path_Y[esi], dh
		inc  count3
	.ELSEIF (IsSelect == 1) && (IsSelect_Diamond == 1)
		; Save Path
		movzx esi, count4
		mov  Diamond_Path_X[esi], dl
		mov  Diamond_Path_Y[esi], dh
		inc  count4
	.ELSEIF (IsSelect == 1) && (IsSelect_Triangle == 1)
		; Save Path5
		movzx esi, count5
		mov  Triangle_Path_X[esi], dl
		mov  Triangle_Path_Y[esi], dh
		inc  count5
	.ENDIF
	call Output_Pos
	call Gotoxy  
	push dx
	INVOKE WriteConsoleOutputCharacter,
       			outputHandle,
       			ADDR Str_Left,  
       			SIZEOF Str_Left,
       			xyPosition,
       			ADDR cellsWritten
	pop dx
	call DrawPattern
	call BackPath
	mov is_left, 0
Finish: 
    	ret 
Move ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DrawPattern PROC USES eax edx
	.IF Map_1 == 1
	    .IF IsSelect_Square == 1
	    	.IF !(dl == 16 && dh == 7) && !(dl == 18 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 18 && dh == 8) && !(dl == 20 && dh == 7) && !(dl == 22 && dh == 4) && !(dl == 20 && dh == 8) && !(dl == 22 && dh == 5)
			jmp DrawSquare
	    	.ENDIF
	    .ELSEIF IsSelect_Circle == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 16 && dh == 8) && !(dl == 18 && dh == 5) && !(dl == 18 && dh == 8) && !(dl == 20 && dh == 7) && !(dl == 22 && dh == 4) && !(dl == 20 && dh == 8) && !(dl == 22 && dh == 5)
			jmp DrawCircle
	    	.ENDIF	
	    .ELSEIF IsSelect_Star == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 16 && dh == 8) && !(dl == 16 && dh == 7) && !(dl == 18 && dh == 4) && !(dl == 20 && dh == 7) && !(dl == 22 && dh == 4) && !(dl == 20 && dh == 8) && !(dl == 22 && dh == 5)
			jmp DrawStar
	    	.ENDIF	
	    .ELSEIF IsSelect_Diamond == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 16 && dh == 8) && !(dl == 16 && dh == 7) && !(dl == 18 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 18 && dh == 8) && !(dl == 20 && dh == 8) && !(dl == 22 && dh == 5)
			jmp DrawDiamond
	   	 .ENDIF	
	    .ELSEIF IsSelect_Triangle == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 16 && dh == 8) && !(dl == 16 && dh == 7) && !(dl == 18 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 18 && dh == 8) && !(dl == 20 && dh == 7) && !(dl == 22 && dh == 4)
			jmp DrawTriangle
	    	.ENDIF
	    .ELSE 
		ret
	    .ENDIF
	.ENDIF

	.IF Map_2 == 1
	    .IF IsSelect_Square == 1
	    	.IF !(dl == 22 && dh == 8) && !(dl == 28 && dh == 8) && !(dl == 16 && dh == 5) && !(dl == 20 && dh == 10) && !(dl == 18 && dh == 6) && !(dl == 24 && dh == 9) && !(dl == 16 && dh == 10) && !(dl == 26 && dh == 10)
			jmp DrawSquare
	    	.ENDIF
	    .ELSEIF IsSelect_Circle == 1
	    	.IF !(dl == 14 && dh == 7) && !(dl == 18 && dh == 9) && !(dl == 16 && dh == 5) && !(dl == 20 && dh == 10) && !(dl == 18 && dh == 6) && !(dl == 24 && dh == 9) && !(dl == 16 && dh == 10) && !(dl == 26 && dh == 10)
			jmp DrawCircle
	    	.ENDIF	
	    .ELSEIF IsSelect_Star == 1
	    	.IF !(dl == 14 && dh == 7) && !(dl == 18 && dh == 9) && !(dl == 22 && dh == 8) && !(dl == 28 && dh == 8) && !(dl == 18 && dh == 6) && !(dl == 24 && dh == 9) && !(dl == 16 && dh == 10) && !(dl == 26 && dh == 10)
			jmp DrawStar
	    	.ENDIF	
	    .ELSEIF IsSelect_Diamond == 1
	    	.IF !(dl == 14 && dh == 7) && !(dl == 18 && dh == 9) && !(dl == 22 && dh == 8) && !(dl == 28 && dh == 8) && !(dl == 16 && dh == 5) && !(dl == 20 && dh == 10) && !(dl == 16 && dh == 10) && !(dl == 26 && dh == 10)
			jmp DrawDiamond
	   	 .ENDIF	
	    .ELSEIF IsSelect_Triangle == 1
	    	.IF !(dl == 14 && dh == 7) && !(dl == 18 && dh == 9) && !(dl == 22 && dh == 8) && !(dl == 28 && dh == 8) && !(dl == 16 && dh == 5) && !(dl == 20 && dh == 10) && !(dl == 18 && dh == 6) && !(dl == 24 && dh == 9)
			jmp DrawTriangle
	    	.ENDIF
	    .ELSE 
		ret
	    .ENDIF
	.ENDIF

	.IF Map_3 == 1
	    .IF IsSelect_Square == 1
	    	.IF !(dl == 16 && dh == 9) && !(dl == 26 && dh == 4) && !(dl == 18 && dh == 9) && !(dl == 24 && dh == 4) && !(dl == 22 && dh == 9) && !(dl == 30 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 28 && dh == 11)
			jmp DrawSquare
	    	.ENDIF
	    .ELSEIF IsSelect_Circle == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 20 && dh == 10) && !(dl == 18 && dh == 9) && !(dl == 24 && dh == 4) && !(dl == 22 && dh == 9) && !(dl == 30 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 28 && dh == 11)
			jmp DrawCircle
	    	.ENDIF	
	    .ELSEIF IsSelect_Star == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 20 && dh == 10) && !(dl == 16 && dh == 9) && !(dl == 26 && dh == 4) && !(dl == 22 && dh == 9) && !(dl == 30 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 28 && dh == 11)
			jmp DrawStar
	    	.ENDIF	
	    .ELSEIF IsSelect_Diamond == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 20 && dh == 10) && !(dl == 16 && dh == 9) && !(dl == 26 && dh == 4) && !(dl == 18 && dh == 9) && !(dl == 24 && dh == 4) && !(dl == 18 && dh == 5) && !(dl == 28 && dh == 11)
			jmp DrawDiamond
	   	 .ENDIF	
	    .ELSEIF IsSelect_Triangle == 1
	    	.IF !(dl == 14 && dh == 4) && !(dl == 20 && dh == 10) && !(dl == 16 && dh == 9) && !(dl == 26 && dh == 4) && !(dl == 18 && dh == 9) && !(dl == 24 && dh == 4) && !(dl == 22 && dh == 9) && !(dl == 30 && dh == 4)
			jmp DrawTriangle
	    	.ENDIF
	    .ELSE 
		ret
	    .ENDIF
	.ENDIF

DrawSquare:
	mov eax, lightMagenta+(white*16)    
    	call SetTextColor
	.IF Map_1 == 1
    		.IF ((dl == 14 && dh == 4) || (dl == 16 && dh == 8)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Square, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
		mov edx, OFFSET Pic_Square
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_2 == 1
    		.IF ((dl == 14 && dh == 7) || (dl == 18 && dh == 9)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Square, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
		mov edx, OFFSET Pic_Square
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_3 == 1
    		.IF ((dl == 14 && dh == 4) || (dl == 20 && dh == 10)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Square, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
		mov edx, OFFSET Pic_Square
    		call WriteString
		jmp UpdateCursor
	.ENDIF
DrawCircle:
	mov eax, red+(white*16)    
    	call SetTextColor
	.IF Map_1 == 1
    		.IF ((dl == 16 && dh == 7) || (dl == 18 && dh == 4)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Circle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Circle
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_2 == 1
    		.IF ((dl == 22 && dh == 8) || (dl == 28 && dh == 8)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Circle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Circle
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_3 == 1
    		.IF ((dl == 16 && dh == 9) || (dl == 26 && dh == 4)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Circle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Circle
    		call WriteString
		jmp UpdateCursor
	.ENDIF
DrawStar:
	mov eax, yellow+(white*16)    
    	call SetTextColor
	.IF Map_1 == 1
    		.IF ((dl == 18 && dh == 5) || (dl == 18 && dh == 8)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Star, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Star
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_2 == 1
    		.IF ((dl == 16 && dh == 5) || (dl == 20 && dh == 10)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Star, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Star
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_3 == 1
    		.IF ((dl == 18 && dh == 9) || (dl == 24 && dh == 4)) && !(dl == oldPos_X && dh == oldPos_Y)
	    		mov IsSelect_Star, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Star
    		call WriteString
		jmp UpdateCursor
	.ENDIF
DrawDiamond:
	mov eax, lightgreen+(white*16)    
    	call SetTextColor
	.IF Map_1 == 1
    		.IF ((dl == 20 && dh == 7) || (dl == 22 && dh == 4)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Diamond, 0
	    		mov IsSelect, 0
	   	 	inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Diamond
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_2 == 1
    		.IF ((dl == 18 && dh == 6) || (dl == 24 && dh == 9)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Diamond, 0
	    		mov IsSelect, 0
	   	 	inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Diamond
    		call WriteString
		jmp UpdateCursor
	.ENDIF
	.IF Map_3 == 1
    		.IF ((dl == 22 && dh == 9) || (dl == 30 && dh == 4)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Diamond, 0
	    		mov IsSelect, 0
	   	 	inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Diamond
    		call WriteString
		jmp UpdateCursor
	.ENDIF
DrawTriangle:
	mov eax, cyan+(white*16)    
    	call SetTextColor
	.IF Map_1 == 1
    		.IF ((dl == 20 && dh == 8) || (dl == 22 && dh == 5)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Triangle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Triangle
    		call WriteString
	.ENDIF
	.IF Map_2 == 1
    		.IF ((dl == 16 && dh == 10) || (dl == 26 && dh == 10)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Triangle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Triangle
    		call WriteString
	.ENDIF
	.IF Map_3 == 1
    		.IF ((dl == 18 && dh == 5) || (dl == 28 && dh == 11)) && !(dl == oldPos_X && dh == oldPos_Y)
	   		 mov IsSelect_Triangle, 0
	    		mov IsSelect, 0
	    		inc EndGame
	    		INVOKE WriteConsoleOutputCharacter,
       				outputHandle,
       				ADDR Str_null,   
       				SIZEOF Str_Enter,
       				Str_Enter_Pos,
       				ADDR cellsWritten
		.ENDIF
    		mov edx, OFFSET Pic_Triangle
    		call WriteString
	.ENDIF
UpdateCursor:
	mov cx, consoleInfo.dwCursorPosition.Y
	mov dh, cl
	mov cx, consoleInfo.dwCursorPosition.X
	mov dl, cl
	call Gotoxy	
	ret
DrawPattern ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
BackPath PROC USES eax edx
;�P�_���|�O�_���ƨ��L�A�Y���L�h���h�W����
	mov eax, blue+(white*16)
    	call SetTextColor

.IF (IsSelect == 1) && (IsSelect_Square == 1)
	movzx ecx, count1
	dec ecx
	mov esi, 0
SquareP:
	.IF esi == ecx
		ret
	.ENDIF
	.IF dl ==  Square_Path_X[esi] && dh == Square_Path_Y[esi]
		.IF oldPos_X == dl && oldPos_Y == dh	;���^�Y����m�A�Ҧ����|����
			push dx
			movzx ecx, count1
			sub  ecx, 2	;�Y����
			mov esi, 1
			L_1:
				mov  dl, Square_Path_X[esi]
				mov  dh, Square_Path_Y[esi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  esi
				loop L_1
			pop  dx
			call Gotoxy
			mov  count1, 1
			ret
		.ENDIF
		
		;���O�Y����m
		.IF is_up == 1		;�n������m
			inc  dh
		.ELSEIF is_down == 1
			dec  dh
		.ELSEIF is_right == 1
			sub  dl, 2
		.ELSEIF is_left == 1
			add  dl, 2
		.ENDIF

		.IF oldPos_X == dl && oldPos_Y == dh
			ret
		.ELSE
			movzx ecx, count1
			sub  ecx, 2
			sub  ecx, esi
			mov  edi, esi
			inc  edi
			L_11:
				mov  dl, Square_Path_X[edi]
				mov  dh, Square_Path_Y[edi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  edi
				loop L_11

			mov  dl, Square_Path_X[esi]
			mov  dh, Square_Path_Y[esi]
			call Gotoxy
			mov  ebx, esi
			mov  count1, bl
			add  count1, 1
		.ENDIF
		ret
		
	.ELSE
		inc  esi
		jmp SquareP
	.ENDIF
.ELSEIF (IsSelect == 1) && (IsSelect_Circle == 1)
	movzx ecx, count2
	dec ecx
	mov esi, 0
CircleP:
	.IF esi == ecx
		ret
	.ENDIF
	.IF dl ==  Circle_Path_X[esi] && dh == Circle_Path_Y[esi]
		.IF oldPos_X == dl && oldPos_Y == dh
			push dx
			movzx ecx, count2
			sub  ecx, 2	;�Y���}��X�ϧ�
			mov esi, 1
			L_2:
				mov  dl, Circle_Path_X[esi]
				mov  dh, Circle_Path_Y[esi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  esi
				loop L_2
			pop  dx
			call Gotoxy
			mov  count2, 1
			ret
		.ENDIF
		.IF is_up == 1
			inc  dh
		.ELSEIF is_down == 1
			dec  dh
		.ELSEIF is_right == 1
			sub  dl, 2
		.ELSEIF is_left == 1
			add  dl, 2
		.ENDIF

		.IF oldPos_X == dl && oldPos_Y == dh
			ret
		.ELSE
			movzx ecx, count2
			sub  ecx, 2
			sub  ecx, esi
			mov  edi, esi
			inc  edi
			L_22:
				mov  dl, Circle_Path_X[edi]
				mov  dh, Circle_Path_Y[edi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  edi
				loop L_22

			mov  dl, Circle_Path_X[esi]
			mov  dh, Circle_Path_Y[esi]
			call Gotoxy
			mov  ebx, esi
			mov  count2, bl
			add  count2, 1
		.ENDIF
		ret
		
	.ELSE
		inc  esi
		jmp CircleP
	.ENDIF
.ELSEIF (IsSelect == 1) && (IsSelect_Star == 1)
	movzx ecx, count3
	dec ecx
	mov esi, 0
StarP:	
	.IF esi == ecx
		ret
	.ENDIF
	.IF dl ==  Star_Path_X[esi] && dh == Star_Path_Y[esi]
		.IF oldPos_X == dl && oldPos_Y == dh
			push dx
			movzx ecx, count3
			sub  ecx, 2	;�Y���}��X�ϧ�
			mov esi, 1
			L_3:
				mov  dl, Star_Path_X[esi]
				mov  dh, Star_Path_Y[esi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  esi
				loop L_3
			pop  dx
			call Gotoxy
			mov  count3, 1
			ret
		.ENDIF
		.IF is_up == 1
			inc  dh
		.ELSEIF is_down == 1
			dec  dh
		.ELSEIF is_right == 1
			sub  dl, 2
		.ELSEIF is_left == 1
			add  dl, 2
		.ENDIF

		.IF oldPos_X == dl && oldPos_Y == dh
			ret
		.ELSE
			movzx ecx, count3
			sub  ecx, 2
			sub  ecx, esi
			mov  edi, esi
			inc  edi
			L_33:
				mov  dl, Star_Path_X[edi]
				mov  dh, Star_Path_Y[edi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  edi
				loop L_33

			mov  dl, Star_Path_X[esi]
			mov  dh, Star_Path_Y[esi]
			call Gotoxy
			mov  ebx, esi
			mov  count3, bl
			add  count3, 1
		.ENDIF
		ret
		
	.ELSE
		inc  esi
		jmp StarP
	.ENDIF
.ELSEIF (IsSelect == 1) && (IsSelect_Diamond == 1)
	movzx ecx, count4
	dec ecx
	mov esi, 0
DiamondP:
	.IF esi == ecx
		ret
	.ENDIF
	.IF dl ==  Diamond_Path_X[esi] && dh == Diamond_Path_Y[esi]
		.IF oldPos_X == dl && oldPos_Y == dh
			push dx
			movzx ecx, count4
			sub  ecx, 2	;�Y���}��X�ϧ�
			mov esi, 1
			L_4:
				mov  dl, Diamond_Path_X[esi]
				mov  dh, Diamond_Path_Y[esi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  esi
				loop L_4
			pop  dx
			call Gotoxy
			mov  count4, 1
			ret
		.ENDIF
		.IF is_up == 1
			inc  dh
		.ELSEIF is_down == 1
			dec  dh
		.ELSEIF is_right == 1
			sub  dl, 2
		.ELSEIF is_left == 1
			add  dl, 2
		.ENDIF

		.IF oldPos_X == dl && oldPos_Y == dh
			ret
		.ELSE
			movzx ecx, count4
			sub  ecx, 2
			sub  ecx, esi
			mov  edi, esi
			inc  edi
			L_44:
				mov  dl, Diamond_Path_X[edi]
				mov  dh, Diamond_Path_Y[edi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  edi
				loop L_44

			mov  dl, Diamond_Path_X[esi]
			mov  dh, Diamond_Path_Y[esi]
			call Gotoxy
			mov  ebx, esi
			mov  count4, bl
			add  count4, 1
		.ENDIF
		ret
		
	.ELSE
		inc  esi
		jmp DiamondP
	.ENDIF	
.ELSEIF (IsSelect == 1) && (IsSelect_Triangle == 1)
	movzx ecx, count5
	dec ecx
	mov esi, 0
TriangleP:
	.IF esi == ecx
		ret
	.ENDIF
	;���^�Y����m�A�Ҧ����|����
	.IF dl ==  Triangle_Path_X[esi] && dh == Triangle_Path_Y[esi]
		.IF oldPos_X == dl && oldPos_Y == dh
			push dx
			movzx ecx, count5
			sub  ecx, 2	;�Y����
			mov esi, 1
			L_5:
				mov  dl, Triangle_Path_X[esi]
				mov  dh, Triangle_Path_Y[esi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  esi
				loop L_5
			pop  dx
			call Gotoxy
			mov  count5, 1
			ret
		.ENDIF
		.IF is_up == 1
			inc  dh
		.ELSEIF is_down == 1
			dec  dh
		.ELSEIF is_right == 1
			sub  dl, 2
		.ELSEIF is_left == 1
			add  dl, 2
		.ENDIF

		.IF oldPos_X == dl && oldPos_Y == dh
			ret
		.ELSE
			movzx ecx, count5
			sub  ecx, 2
			sub  ecx, esi
			mov  edi, esi
			inc  edi
			L_55:
				mov  dl, Triangle_Path_X[edi]
				mov  dh, Triangle_Path_Y[edi]
				call Gotoxy
				mov  edx, OFFSET Pic_Space
				call WriteString
				inc  edi
				loop L_55

			mov  dl, Triangle_Path_X[esi]
			mov  dh, Triangle_Path_Y[esi]
			call Gotoxy
			mov  ebx, esi
			mov  count5, bl
			add  count5, 1
		.ENDIF
		ret
		
	.ELSE
		inc  esi
		jmp TriangleP
	.ENDIF
.ENDIF	 
Fnsh:
	ret
BackPath ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CheckRepeatPath PROC USES eax edx
.IF count1 != 0 && (IsSelect_Square != 1)
	movzx  ecx, count1
	mov  esi, 0
CheckSquare:
	.IF dl ==  Square_Path_X[esi] && dh == Square_Path_Y[esi]
		mov  is_repeat, 1
	.ELSE
		inc  esi
	.ENDIF
	loop CheckSquare
.ENDIF

.IF count2 != 0 && (IsSelect_Circle != 1)
	movzx  ecx, count2
	mov  esi, 0
CheckCircle:
	.IF dl ==  Circle_Path_X[esi] && dh == Circle_Path_Y[esi]
		mov is_repeat, 1
	.ELSE
		inc  esi
	.ENDIF
	loop CheckCircle
.ENDIF

.IF count3 != 0 && (IsSelect_Star != 1)
	movzx  ecx, count3
	mov  esi, 0
CheckStar:
	.IF dl ==  Star_Path_X[esi] && dh == Star_Path_Y[esi]
		mov is_repeat, 1
	.ELSE
		inc  esi
	.ENDIF
	loop CheckStar
.ENDIF

.IF count4 != 0 && (IsSelect_Diamond != 1)
	movzx  ecx, count4
	mov  esi, 0
CheckDiamond:
	.IF dl ==  Diamond_Path_X[esi] && dh == Diamond_Path_Y[esi]
		mov is_repeat, 1
	.ELSE
		inc  esi
	.ENDIF
	loop CheckDiamond
.ENDIF

.IF count5 != 0 && (IsSelect_Triangle != 1)
	movzx  ecx, count5
	mov  esi, 0
CheckTriangle:
	.IF dl ==  Triangle_Path_X[esi] && dh == Triangle_Path_Y[esi]
		mov is_repeat, 1
	.ELSE
		inc  esi
	.ENDIF
	loop CheckTriangle
.ENDIF
	ret
CheckRepeatPath ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Output the position now.
Output_Pos PROC USES eax edx
	mov eax, white   
    	call SetTextColor
	mov ax, dx
	mov dl, 14
    	mov dh, 16
    	call  Gotoxy
	call  WriteHex
	ret
Output_Pos ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Map2 PROC
	mov dl, 14            	; "x" 
    	mov dh, 2            	; "y" 
    	call Gotoxy            	; The cursor is located there. ;���s�w���Цb�D������������m dh = row , dl = col 
    	mov eax, yellow+(black*16)   
    	call SetTextColor        	; color set. 
    	mov edx, OFFSET String8       
    	call WriteString

	mov dl, 14           
    	mov dh, 4            
    	call Gotoxy        
    	mov eax, blue+(white*16)    
    	call SetTextColor       
    	mov edx, OFFSET Map2_Line1 
    	call WriteString
    	mov dl, 14           
    	mov dh, 5           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line2 
    	call WriteString
    	mov dl, 14          
    	mov dh, 6           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line3 
    	call WriteString
    	mov dl, 14            
    	mov dh, 7           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line4 
    	call WriteString
    	mov dl, 14            
    	mov dh, 8           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line5 
    	call WriteString
	mov dl, 14            
    	mov dh, 9           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line6 
    	call WriteString
	mov dl, 14            
    	mov dh, 10           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line7 
    	call WriteString
	mov dl, 14            
    	mov dh, 11           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map2_Line8 
    	call WriteString

	; Initial the Position of Cursor 
	mov dl, 14
	mov dh, 4
	call Gotoxy 

	call  LookForKey
	ret
Map2 ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Map3 PROC
	mov dl, 14            	; "x" 
    	mov dh, 2            	; "y" 
    	call Gotoxy            	; The cursor is located there. ;���s�w���Цb�D������������m dh = row , dl = col 
    	mov eax, yellow+(black*16)   
    	call SetTextColor        	; color set. 
    	mov edx, OFFSET String9       
    	call WriteString

	mov dl, 14           
    	mov dh, 4            
    	call Gotoxy        
    	mov eax, blue+(white*16)    
    	call SetTextColor       
    	mov edx, OFFSET Map3_Line1 
    	call WriteString
    	mov dl, 14           
    	mov dh, 5           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line2 
    	call WriteString
    	mov dl, 14          
    	mov dh, 6           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line3 
    	call WriteString
    	mov dl, 14            
    	mov dh, 7           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line4 
    	call WriteString
    	mov dl, 14            
    	mov dh, 8           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line5 
    	call WriteString
	mov dl, 14            
    	mov dh, 9           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line6 
    	call WriteString
	mov dl, 14            
    	mov dh, 10           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line7 
    	call WriteString
	mov dl, 14            
    	mov dh, 11           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line8 
    	call WriteString
	mov dl, 14            
    	mov dh, 12           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line9 
    	call WriteString
	mov dl, 14            
    	mov dh, 13           
    	call Gotoxy            ; printed 
    	mov edx, OFFSET Map3_Line10 
    	call WriteString

	; Initial the Position of Cursor 
	mov dl, 14
	mov dh, 4
	call Gotoxy 

	call  LookForKey
	ret
Map3 ENDP

END main