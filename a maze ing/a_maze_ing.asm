.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern malloc: proc
extern memset: proc

includelib canvas.lib
extern BeginDrawing: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
window_title DB "A-maze-ing",?
area_width EQU 640
area_height EQU 480
area DD ?
var DD ?
counter DD 0 ; numara evenimentele de tip timer

arg1 EQU 8
arg2 EQU 12
arg3 EQU 16
arg4 EQU 20

symbol_width EQU 10
symbol_height EQU 10
include digits.inc
include letters.inc

map1 DD 1,1,3,1,1,1,1,1,0,1,1,1
	 DD 1,4,2,1,1,1,2,2,2,2,3,1
	 DD 1,1,2,2,2,2,2,3,3,3,1,1
	 DD 3,2,2,1,3,1,2,1,1,1,1,1
	 DD 1,1,2,1,3,1,2,2,2,2,2,1
	 DD 1,2,2,2,2,2,2,3,3,3,2,0
	 DD 1,2,1,1,1,2,3,1,1,1,1,1
	 DD 1,3,1,2,2,2,2,2,2,2,0,1
	 DD 1,1,2,2,3,3,1,2,1,1,1,1
	 DD 1,1,2,3,1,1,1,2,2,2,2,1
	 DD 0,2,2,2,2,2,2,2,3,3,2,0
	 DD 1,1,3,1,1,1,3,1,1,1,1,1

victory DD 0
x dd 4
y dd 48

.code
; procedura make_text afiseaza o litera sau o cifra la coordonatele date
; arg1 - simbolul de afisat (litera sau cifra)
; arg2 - pointer la vectorul de pixeli
; arg3 - pos_x
; arg4 - pos_y

;punem matricea
make_map macro area
local eticheta_m,  eticheta_de_iesire_din_loop
local eticheta_m2,  eticheta_de_iesire_din_loop2
local eticheta_m3,  eticheta_de_iesire_din_loop3
local eticheta_m4,  eticheta_de_iesire_din_loop4
local eticheta_m5,  eticheta_de_iesire_din_loop5
local eticheta_m6,  eticheta_de_iesire_din_loop6
local eticheta_m7,  eticheta_de_iesire_din_loop7
local eticheta_m8,  eticheta_de_iesire_din_loop8
local eticheta_m9,  eticheta_de_iesire_din_loop9
local eticheta_m10,  eticheta_de_iesire_din_loop10
local eticheta_m11,  eticheta_de_iesire_din_loop11
local eticheta_m12,  eticheta_de_iesire_din_loop12
	pusha
	mov esi, 0
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, 100
	mov var, eax

eticheta_m:
	make_text_macro ebx, area, var, 100
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop
	mov var, eax
	jmp eticheta_m
	eticheta_de_iesire_din_loop:
make_text_macro ebx, area, 210, 100
	mov esi, 48
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m2:
	make_text_macro ebx, area, var, 110
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop2
	mov var, eax
	jmp eticheta_m2
	eticheta_de_iesire_din_loop2:
make_text_macro ebx, area, 210, 110
	mov esi, 96
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m3:
	make_text_macro ebx, area, var, 120
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop3
	mov var, eax
	jmp eticheta_m3
	eticheta_de_iesire_din_loop3:
make_text_macro ebx, area, 210, 120
	mov esi, 144
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m4:
	make_text_macro ebx, area, var, 130
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop4
	mov var, eax
	jmp eticheta_m4
	eticheta_de_iesire_din_loop4:
make_text_macro ebx, area, 210, 130
	mov esi, 192
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m5:
	make_text_macro ebx, area, var, 140
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop5
	mov var, eax
	jmp eticheta_m5
	eticheta_de_iesire_din_loop5:
make_text_macro ebx, area, 210, 140
	mov esi, 240
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m6:
	make_text_macro ebx, area, var, 150
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop6
	mov var, eax
	jmp eticheta_m6
	eticheta_de_iesire_din_loop6:
make_text_macro ebx, area, 210, 150
	mov esi, 288
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m7:
	make_text_macro ebx, area, var, 160
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop7
	mov var, eax
	jmp eticheta_m7
	eticheta_de_iesire_din_loop7:
make_text_macro ebx, area, 210, 160
	mov esi, 336
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m8:
	make_text_macro ebx, area, var, 170
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop8
	mov var, eax
	jmp eticheta_m8
	eticheta_de_iesire_din_loop8:
make_text_macro ebx, area, 210, 170
	mov esi, 384
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m9:
	make_text_macro ebx, area, var, 180
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop9
	mov var, eax
	jmp eticheta_m9
	eticheta_de_iesire_din_loop9:
make_text_macro ebx, area, 210, 180
	mov esi, 432
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m10:
	make_text_macro ebx, area, var, 190
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop10
	mov var, eax
	jmp eticheta_m10
	eticheta_de_iesire_din_loop10:
make_text_macro ebx, area, 210, 190
	mov esi, 480
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m11:
	make_text_macro ebx, area, var, 200
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop11
	mov var, eax
	jmp eticheta_m11
	eticheta_de_iesire_din_loop11:
make_text_macro ebx, area, 210, 200
	mov esi, 528
	mov edi, 0
	mov ebx, map1[esi][edi]
	add ebx, '0'

	mov eax, 100
	mov var, eax
eticheta_m12:
	make_text_macro ebx, area, var, 210
	add edi, 4
	mov ebx, map1[esi][edi]
	add ebx, '0'
	mov eax, var
	add eax, 10
	cmp eax,210
	je eticheta_de_iesire_din_loop12
	mov var, eax
	jmp eticheta_m12
	eticheta_de_iesire_din_loop12:
make_text_macro ebx, area, 210, 210

	popa
endm
;matricea este gata

move_down macro x, y
local there_is_no_road, ending, is_not_the_finish
	pusha
	cmp victory, 0
	jne ending
	mov ecx, x
	mov edx, y
	mov eax, y
	add eax, 48
	cmp map1[ecx][eax], 0
	jne is_not_the_finish
	mov map1[ecx][edx], 2
	add edx, 48
	mov map1[ecx][edx], 4
	inc victory
	inc victory
	inc victory
	inc victory
there_is_no_road:
	cmp map1[ecx][eax], 3
	jne ending
	mov map1[ecx][edx], 2
	mov map1[4][48], 4
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
is_not_the_finish:
	cmp map1[ecx][eax], 2
	jne there_is_no_road
	mov map1[ecx][edx], 2
	add edx, 48
	mov map1[ecx][edx], 4
	make_map area
	mov x, ecx
	mov y, edx
	jmp ending

ending:
	popa
endm

move_up macro x, y
local there_is_no_road, ending, is_not_the_finish
	pusha
	cmp victory, 0
	jne ending
	mov ecx, x
	mov edx, y
	mov eax, y
	sub eax, 48
	cmp map1[ecx][eax], 0
	jne is_not_the_finish
	mov map1[ecx][edx], 2
	sub edx, 48
	mov map1[ecx][edx], 4
	inc victory
	inc victory
	inc victory
there_is_no_road:
	cmp map1[ecx][eax], 3
	jne ending
	mov map1[ecx][edx], 2
	mov map1[4][48], 4
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
is_not_the_finish:
	cmp map1[ecx][eax], 2
	jne there_is_no_road
	mov map1[ecx][edx], 2
	sub edx, 48
	mov map1[ecx][edx], 4
	make_map area
	mov x, ecx
	mov y, edx
	jmp ending

ending:
popa
endm

move_right macro x, y
local there_is_no_road, ending, is_not_the_finish
	pusha
	cmp victory, 0
	jne ending
	mov ecx, x
	mov edx, y
	mov eax, x
	add eax, 4
	cmp map1[eax][edx], 0
	jne is_not_the_finish
	mov map1[ecx][edx], 2
	add ecx, 4
	mov map1[ecx][edx], 4
	inc victory
	inc victory
    jmp ending
there_is_no_road:
	cmp map1[eax][edx], 3
	jne ending
	mov map1[ecx][edx], 2
	mov map1[4][48], 4
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
is_not_the_finish:
	cmp map1[eax][edx], 2
	jne there_is_no_road
	mov map1[ecx][edx], 2
	add ecx, 4
	mov map1[ecx][edx], 4
	make_map area
	mov x, ecx
	mov y, edx
	jmp ending

ending:
	popa
endm

move_left macro x, y
local there_is_no_road, ending
	pusha
	cmp victory, 0
	jne ending
	mov ecx, x
	mov edx, y
	mov eax, x
	sub eax, 4
	cmp map1[eax][edx], 0
	jne is_not_the_finish
	mov map1[ecx][edx], 2
	sub ecx, 4
	mov map1[ecx][edx], 4
	inc victory
	jmp ending
there_is_no_road:
	cmp map1[eax][edx], 3
	jne ending
	mov map1[ecx][edx], 2
	mov map1[4][48], 4
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
is_not_the_finish:
	cmp map1[eax][edx], 2
	jne there_is_no_road
	mov map1[ecx][edx], 2
	sub ecx, 4
	mov map1[ecx][edx], 4
	make_map area
	mov x, ecx
	mov y, edx
	jmp ending

ending:
	popa
endm

reseting_game macro x, y
local next, next2, next3, there_is_no_reset_ending
	pusha
	mov eax, 0
	mov eax, x
	mov ecx, y
	cmp victory, 0
	je there_is_no_reset_ending
	cmp victory, 2
	jne next
	add ecx, 4
	mov map1[eax][ecx], 0
	mov map1[4][48], 4
	mov victory, 0
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
	jmp ending_reset
next:
	cmp victory, 1
	jne next2
	sub ecx, 4
	mov map1[eax][ecx], 0
	mov map1[4][48], 4
	mov victory, 0
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
	jmp ending_reset
next2:
	cmp victory, 3
	jne next3
	sub eax, 48
	mov map1[eax][ecx], 0
	mov map1[4][48], 4
	mov victory, 0
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
	jmp ending_reset
next3:
	add eax, 48
	mov map1[eax][ecx], 0
	mov map1[4][48], 4
	mov victory, 0
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
	jmp ending_reset
there_is_no_reset_ending:
	mov map1[eax][ecx], 2
	mov map1[4][48], 4
	mov eax, 4
	mov edx, 48
	mov x, eax
	mov y, edx
ending_reset:
	popa
endm

make_text proc
	push ebp
	mov ebp, esp
	pusha

	mov eax, [ebp+arg1]
	cmp eax, 'A'
	jl make_digit
	cmp eax, 'Z'
	jg make_digit
	sub eax, 'A'
	lea esi, letters
	jmp draw_text
make_digit:
	cmp eax, '0'
	jl make_space
	cmp eax, '9'
	jg make_space
	sub eax, '0'
	lea esi, digits
	jmp draw_text
make_space:
	mov eax, 26
	lea esi, letters
draw_text:
	mov ebx, symbol_width
	mul ebx
	mov ebx, symbol_height
	mul ebx
	add esi, eax;
	mov ecx, symbol_height
loop_symbol_lines:
	mov edi, [ebp+arg2]
	mov eax, [ebp+arg4]
	add eax, symbol_height
	sub eax, ecx
	mov ebx, area_width
	mul ebx
	add eax, [ebp+arg3]
	shl eax, 2
	add edi, eax
	push ecx
	mov ecx, symbol_width
loop_symbol_columns:
	cmp byte ptr [esi], 0
	je symbol_pixel_purple
	mov dword ptr [edi], 0
	jmp symbol_pixel_next
symbol_pixel_purple:
	mov dword ptr [edi], 0917592h
symbol_pixel_next:
	inc esi
	add edi, 4
	loop loop_symbol_columns
	pop ecx
	loop loop_symbol_lines
	popa
	mov esp, ebp
	pop ebp
	ret
make_text endp

make_text_macro macro symbol, AreaDrawing, x, y
	push y
	push x
	push AreaDrawing
	push symbol
	call make_text
	add esp, 16
endm

; functia de desenare - se apeleaza la fiecare click
; sau la fiecare interval de 200ms in care nu s-a dat click
; arg1 - evt (0 - initializare, 1 - click, 2 - s-a scurs intervalul fara click)
; arg2 - x
; arg3 - y
draw proc
	push ebp
	mov ebp, esp
	pusha

	mov eax, [ebp+arg1]
	cmp eax, 1
	jz event_at_click
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	push 233
	push area
	call memset
	add esp, 12
	jmp display_letters
event_at_click:
	mov eax,[ebp+arg3]
	mov ecx,[ebp+arg2]
	cmp ecx, 501
	jge verify_y
	cmp ecx, 508
	jle verify_y
	jmp is_not_up
verify_y:
	cmp eax, 409
	jg is_not_up
	cmp eax, 400
	jl is_not_up
	jmp go_up
go_up:
	move_up x, y
	jmp end_move
is_not_up:
	cmp ecx, 501
	jge verify_y2
	cmp ecx, 508
	jle verify_y2
	jmp is_not_down
verify_y2:
	cmp eax, 430
	jg is_not_down
	cmp eax, 420
	jl is_not_down
	jmp go_down
go_down:
	move_down x, y
	jmp end_move
is_not_down:
	cmp ecx, 511
	je verify_y3
	cmp ecx, 512
	je verify_y3
	cmp ecx, 513
	je verify_y3
	cmp ecx, 514
	je verify_y3
	cmp ecx, 515
	je verify_y3
	cmp ecx, 516
	je verify_y3
	cmp ecx, 517
	je verify_y3
	cmp ecx, 518
	je verify_y3
	cmp ecx, 519
	je verify_y3
	cmp ecx, 520
	je verify_y3
	jmp is_not_right
verify_y3:
	cmp eax, 419
	jg is_not_right
	cmp eax, 410
	jl is_not_right
	jmp go_right
go_right:
	move_right x, y
	jmp end_move
is_not_right:
	cmp ecx, 490
	jge verify_y4
	cmp ecx, 499
	jle verify_y4
	jmp is_not_left
verify_y4:
	cmp eax, 419
	jg is_not_left
	cmp eax, 410
	jl is_not_left
	jmp go_left
go_left:
	move_left x, y
	jmp end_move
is_not_left:
	cmp ecx, 520
	jl is_not_reset
	cmp ecx, 570
	jg is_not_reset
	cmp eax, 450
	jl is_not_reset
	cmp eax, 470
	jg is_not_reset
reseting_game x, y
is_not_reset:
end_move:

jmp ending_draw

display_letters:
	make_text_macro '9', area, 500, 400
	make_text_macro '8', area, 500, 420
	make_text_macro '6', area, 490, 410
	make_text_macro '7', area, 510, 410
	make_text_macro 'K', area, 520, 450
	make_text_macro 'L', area, 520, 460
	make_text_macro 'O', area, 530, 450
	make_text_macro 'P', area, 530, 460
	make_text_macro 'Q', area, 540, 450
	make_text_macro 'R', area, 540, 460
	make_text_macro 'O', area, 550, 450
	make_text_macro 'P', area, 550, 460
	make_text_macro 'G', area, 560, 450
	make_text_macro 'H', area, 560, 460
make_map area
	cmp victory, 0
	je mai_ai_pana_la_victorie
	make_text_macro 'A', area, 200, 400
	make_text_macro 'B', area, 200, 410
	make_text_macro 'C', area, 210, 400
	make_text_macro 'D', area, 210, 410
	make_text_macro 'E', area, 220, 400
	make_text_macro 'F', area, 220, 410
	make_text_macro 'G', area, 230, 400
	make_text_macro 'H', area, 230, 410
	make_text_macro 'I', area, 240, 400
	make_text_macro 'J', area, 240, 410
	make_text_macro 'K', area, 250, 400
	make_text_macro 'L', area, 250, 410
	make_text_macro 'M', area, 260, 400
	make_text_macro 'N', area, 260, 410
	mai_ai_pana_la_victorie:

ending_draw:
	popa
	mov esp, ebp
	pop ebp
	ret
draw endp

start:
;alocam memorie pentru zona de desenat
	mov eax, area_width
	mov ebx, area_height
	mul ebx
	shl eax, 2
	push eax
	call malloc
	add esp, 4
	mov area, eax
	;apelam functia de desenare a ferestrei
	; typedef void (*DrawFunc)(int evt, int x, int y);
	; void __cdecl BeginDrawing(const char *title, int width, int height, unsigned int *area, DrawFunc draw);
	push offset draw
	push area
	push area_height
	push area_width
	push offset window_title
	call BeginDrawing
	add esp, 20

	;terminarea programului
	push 0
	call exit
end start
