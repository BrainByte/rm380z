; z80dasm 1.1.6
; command line: /usr/bin/z80dasm -l -a -t -g 0x8000 -o txed40.asm txed40.com

	org	08000h

l8000h:
	jp 006e9h		;8000	c3 e9 06 	. . . 
	jp 00740h		;8003	c3 40 07 	. @ . 
	sbc a,a			;8006	9f 	. 
	dec e			;8007	1d 	. 
	sub a			;8008	97 	. 
	jr z,l8081h		;8009	28 76 	( v 
	ld bc,00240h		;800b	01 40 02 	. @ . 
	ld a,(bc)			;800e	0a 	. 
	sub l			;800f	95 	. 
	cp a			;8010	bf 	. 
	dec de			;8011	1b 	. 
	nop			;8012	00 	. 
	jr nz,l801ch		;8013	20 07 	  . 
	nop			;8015	00 	. 
	nop			;8016	00 	. 
	jr z,$+26		;8017	28 18 	( . 
	rst 38h			;8019	ff 	. 
	nop			;801a	00 	. 
	ret z			;801b	c8 	. 
l801ch:
	nop			;801c	00 	. 
	add a,b			;801d	80 	. 
	nop			;801e	00 	. 
	ld l,0eeh		;801f	2e ee 	. . 
	ld a,(bc)			;8021	0a 	. 
	pop af			;8022	f1 	. 
	nop			;8023	00 	. 
	ex af,af'			;8024	08 	. 
	sub l			;8025	95 	. 
	add hl,sp			;8026	39 	9 
	ld b,d			;8027	42 	B 
	ld b,e			;8028	43 	C 
	ld c,b			;8029	48 	H 
	jr nz,l802ch		;802a	20 00 	  . 
l802ch:
	nop			;802c	00 	. 
	jr nz,l802fh		;802d	20 00 	  . 
l802fh:
	ld bc,03d01h		;802f	01 01 3d 	. . = 
	nop			;8032	00 	. 
	nop			;8033	00 	. 
	ld b,001h		;8034	06 01 	. . 
	ld bc,00848h		;8036	01 48 08 	. H . 
	ex af,af'			;8039	08 	. 
	inc b			;803a	04 	. 
	inc c			;803b	0c 	. 
	ld bc,04200h		;803c	01 00 42 	. . B 
	ld hl,00040h		;803f	21 40 00 	! @ . 
	nop			;8042	00 	. 
	nop			;8043	00 	. 
	inc hl			;8044	23 	# 
	ld h,000h		;8045	26 00 	& . 
	ld (bc),a			;8047	02 	. 
	nop			;8048	00 	. 
	nop			;8049	00 	. 
	nop			;804a	00 	. 
	nop			;804b	00 	. 
	nop			;804c	00 	. 
	ld b,e			;804d	43 	C 
	ld b,b			;804e	40 	@ 
	inc b			;804f	04 	. 
	ld h,h			;8050	64 	d 
	ld h,h			;8051	64 	d 
	add hl,sp			;8052	39 	9 
	dec b			;8053	05 	. 
	nop			;8054	00 	. 
	dec c			;8055	0d 	. 
	nop			;8056	00 	. 
	ld (bc),a			;8057	02 	. 
	ld a,b			;8058	78 	x 
	or c			;8059	b1 	. 
	jp z,00165h		;805a	ca 65 01 	. e . 
	dec bc			;805d	0b 	. 
	ld (bc),a			;805e	02 	. 
	inc h			;805f	24 	$ 
	inc h			;8060	24 	$ 
	inc h			;8061	24 	$ 
	nop			;8062	00 	. 
	jr nz,$+34		;8063	20 20 	    
	jr nz,l8069h		;8065	20 02 	  . 
	ld b,d			;8067	42 	B 
	ld b,c			;8068	41 	A 
l8069h:
	ld c,e			;8069	4b 	K 
	nop			;806a	00 	. 
	jr nz,l808dh		;806b	20 20 	    
	jr nz,l806fh		;806d	20 00 	  . 
l806fh:
	jr nz,$+34		;806f	20 20 	    
	jr nz,l8073h		;8071	20 00 	  . 
l8073h:
	jr nz,$+34		;8073	20 20 	    
	jr nz,$+32		;8075	20 1e 	  . 
	in a,(001h)		;8077	db 01 	. . 
	add hl,de			;8079	19 	. 
	rst 10h			;807a	d7 	. 
	ld bc,0de7fh		;807b	01 7f de 	.  . 
	ld bc,00302h		;807e	01 02 03 	. . . 
l8081h:
	ld (bc),a			;8081	02 	. 
	inc b			;8082	04 	. 
	push hl			;8083	e5 	. 
	ld bc,0df05h		;8084	01 05 df 	. . . 
	ld bc,0e707h		;8087	01 07 e7 	. . . 
	ld bc,0e10ah		;808a	01 0a e1 	. . . 
l808dh:
	ld bc,0ec0bh		;808d	01 0b ec 	. . . 
	ld bc,0ea0eh		;8090	01 0e ea 	. . . 
	ld bc,0000fh		;8093	01 0f 00 	. . . 
	ld (bc),a			;8096	02 	. 
	djnz $-15		;8097	10 ef 	. . 
	ld bc,0ee11h		;8099	01 11 ee 	. . . 
	ld bc,0fd12h		;809c	01 12 fd 	. . . 
	ld bc,0f613h		;809f	01 13 f6 	. . . 
	ld bc,0fa15h		;80a2	01 15 fa 	. . . 
	ld bc,0e416h		;80a5	01 16 e4 	. . . 
	ld bc,0f817h		;80a8	01 17 f8 	. . . 
	ld bc,0f318h		;80ab	01 18 f3 	. . . 
	ld bc,0051ah		;80ae	01 1a 05 	. . . 
	ld (bc),a			;80b1	02 	. 
	nop			;80b2	00 	. 
	out (001h),a		;80b3	d3 01 	. . 
	nop			;80b5	00 	. 
	out (001h),a		;80b6	d3 01 	. . 
	nop			;80b8	00 	. 
	out (001h),a		;80b9	d3 01 	. . 
	nop			;80bb	00 	. 
	out (001h),a		;80bc	d3 01 	. . 
	nop			;80be	00 	. 
	out (001h),a		;80bf	d3 01 	. . 
	nop			;80c1	00 	. 
	out (001h),a		;80c2	d3 01 	. . 
	nop			;80c4	00 	. 
	out (001h),a		;80c5	d3 01 	. . 
	nop			;80c7	00 	. 
	out (001h),a		;80c8	d3 01 	. . 
	nop			;80ca	00 	. 
	out (001h),a		;80cb	d3 01 	. . 
	nop			;80cd	00 	. 
	out (001h),a		;80ce	d3 01 	. . 
	nop			;80d0	00 	. 
	out (001h),a		;80d1	d3 01 	. . 
	ld c,c			;80d3	49 	I 
	ld a,a			;80d4	7f 	 
	dec de			;80d5	1b 	. 
	rst 38h			;80d6	ff 	. 
	ld b,(hl)			;80d7	46 	F 
	nop			;80d8	00 	. 
	dec de			;80d9	1b 	. 
	rst 38h			;80da	ff 	. 
	ld e,(hl)			;80db	5e 	^ 
	nop			;80dc	00 	. 
	rst 38h			;80dd	ff 	. 
	dec l			;80de	2d 	- 
	ld b,h			;80df	44 	D 
	rst 38h			;80e0	ff 	. 
	ld c,c			;80e1	49 	I 
	dec c			;80e2	0d 	. 
	dec de			;80e3	1b 	. 
	dec l			;80e4	2d 	- 
	ld b,e			;80e5	43 	C 
	rst 38h			;80e6	ff 	. 
	dec l			;80e7	2d 	- 
	ld b,e			;80e8	43 	C 
	jr nc,$+78		;80e9	30 4c 	0 L 
	rst 38h			;80eb	ff 	. 
	ld c,e			;80ec	4b 	K 
	rst 38h			;80ed	ff 	. 
	dec l			;80ee	2d 	- 
	ld sp,04c35h		;80ef	31 35 4c 	1 5 L 
	rst 38h			;80f2	ff 	. 
	ld b,l			;80f3	45 	E 
	ld c,l			;80f4	4d 	M 
	rst 38h			;80f5	ff 	. 
	ld c,a			;80f6	4f 	O 
	rst 38h			;80f7	ff 	. 
	ld d,l			;80f8	55 	U 
	ld d,l			;80f9	55 	U 
	dec l			;80fa	2d 	- 
	ld d,l			;80fb	55 	U 
	rst 38h			;80fc	ff 	. 
	dec l			;80fd	2d 	- 
	ld e,c			;80fe	59 	Y 
	rst 38h			;80ff	ff 	. 
	ld c,c			;8100	49 	I 
	dec de			;8101	1b 	. 
	rst 38h			;8102	ff 	. 
	ld b,d			;8103	42 	B 
	rst 38h			;8104	ff 	. 
	ld e,d			;8105	5a 	Z 
	rst 38h			;8106	ff 	. 
	ld c,a			;8107	4f 	O 
	inc bc			;8108	03 	. 
	jp 00524h		;8109	c3 24 05 	. $ . 
	dec hl			;810c	2b 	+ 
	ld (hl),c			;810d	71 	q 
	dec hl			;810e	2b 	+ 
	pop de			;810f	d1 	. 
	pop bc			;8110	c1 	. 
	ld (hl),b			;8111	70 	p 
	dec hl			;8112	2b 	+ 
	ld (hl),c			;8113	71 	q 
	push de			;8114	d5 	. 
	push af			;8115	f5 	. 
	ld a,c			;8116	79 	y 
	call 0068fh		;8117	cd 8f 06 	. . . 
	pop af			;811a	f1 	. 
	ret			;811b	c9 	. 
	cp 020h		;811c	fe 20 	.   
	ret z			;811e	c8 	. 
	cp 009h		;811f	fe 09 	. . 
	ret z			;8121	c8 	. 
	cp 02ch		;8122	fe 2c 	. , 
	ret z			;8124	c8 	. 
	cp 00dh		;8125	fe 0d 	. . 
	ret z			;8127	c8 	. 
	cp 07fh		;8128	fe 7f 	.  
	jp z,00524h		;812a	ca 24 05 	. $ . 
	ret			;812d	c9 	. 
	ld c,00dh		;812e	0e 0d 	. . 
	call 00015h		;8130	cd 15 00 	. . . 
	ld c,00ah		;8133	0e 0a 	. . 
	call 00015h		;8135	cd 15 00 	. . . 
	ret			;8138	c9 	. 
	call 0068ch		;8139	cd 8c 06 	. . . 
	cp 00dh		;813c	fe 0d 	. . 
	jp z,0c318h		;813e	ca 18 c3 	. . . 
	adc a,b			;8141	88 	. 
	inc b			;8142	04 	. 
	jp 004a3h		;8143	c3 a3 04 	. . . 
	jp 00549h		;8146	c3 49 05 	. I . 
	jp 005ffh		;8149	c3 ff 05 	. . . 
	jp 0056ch		;814c	c3 6c 05 	. l . 
	jp 00653h		;814f	c3 53 06 	. S . 
	jp 005a5h		;8152	c3 a5 05 	. . . 
	jp 004c4h		;8155	c3 c4 04 	. . . 
	jp 004d3h		;8158	c3 d3 04 	. . . 
	jp 004fah		;815b	c3 fa 04 	. . . 
	jp 00529h		;815e	c3 29 05 	. ) . 
	jp 004bbh		;8161	c3 bb 04 	. . . 
	jp 00539h		;8164	c3 39 05 	. 9 . 
	jp 00539h		;8167	c3 39 05 	. 9 . 
	ex (sp),iy		;816a	fd e3 	. . 
	push de			;816c	d5 	. 
	exx			;816d	d9 	. 
	ex (sp),hl			;816e	e3 	. 
	exx			;816f	d9 	. 
	push ix		;8170	dd e5 	. . 
	push hl			;8172	e5 	. 
	push de			;8173	d5 	. 
	push bc			;8174	c5 	. 
	push hl			;8175	e5 	. 
	ex (sp),iy		;8176	fd e3 	. . 
	pop hl			;8178	e1 	. 
	call 00287h		;8179	cd 87 02 	. . . 
	pop bc			;817c	c1 	. 
	pop de			;817d	d1 	. 
	pop hl			;817e	e1 	. 
	pop ix		;817f	dd e1 	. . 
	exx			;8181	d9 	. 
	pop hl			;8182	e1 	. 
	exx			;8183	d9 	. 
	pop iy		;8184	fd e1 	. . 
	ret			;8186	c9 	. 
	jp (hl)			;8187	e9 	. 
	cp 024h		;8188	fe 24 	. $ 
	ret z			;818a	c8 	. 
	cp 03fh		;818b	fe 3f 	. ? 
	jr nz,l8197h		;818d	20 08 	  . 
	exx			;818f	d9 	. 
	bit 0,(hl)		;8190	cb 46 	. F 
	exx			;8192	d9 	. 
	scf			;8193	37 	7 
	ret z			;8194	c8 	. 
	or a			;8195	b7 	. 
	ret			;8196	c9 	. 
l8197h:
	cp 030h		;8197	fe 30 	. 0 
	ret c			;8199	d8 	. 
	cp 03ah		;819a	fe 3a 	. : 
	ccf			;819c	3f 	? 
	ret nc			;819d	d0 	. 
l819eh:
	cp 041h		;819e	fe 41 	. A 
	ret c			;81a0	d8 	. 
	cp 05bh		;81a1	fe 5b 	. [ 
	ccf			;81a3	3f 	? 
	ret nc			;81a4	d0 	. 
	sub 020h		;81a5	d6 20 	.   
	jr l819eh		;81a7	18 f5 	. . 
	ld b,008h		;81a9	06 08 	. . 
	jr l81afh		;81ab	18 02 	. . 
	ld b,003h		;81ad	06 03 	. . 
l81afh:
	ld c,020h		;81af	0e 20 	.   
l81b1h:
	ld a,(de)			;81b1	1a 	. 
	cp 01bh		;81b2	fe 1b 	. . 
	jr z,l81d2h		;81b4	28 1c 	( . 
	cp 02eh		;81b6	fe 2e 	. . 
	jr z,l81d2h		;81b8	28 18 	( . 
	cp 02ah		;81ba	fe 2a 	. * 
	jr z,l81c9h		;81bc	28 0b 	( . 
	call 00288h		;81be	cd 88 02 	. . . 
	ret c			;81c1	d8 	. 
	ld (hl),a			;81c2	77 	w 
	inc de			;81c3	13 	. 
	inc hl			;81c4	23 	# 
	djnz l81b1h		;81c5	10 ea 	. . 
	jr l81d6h		;81c7	18 0d 	. . 
l81c9h:
	exx			;81c9	d9 	. 
	bit 0,(hl)		;81ca	cb 46 	. F 
	exx			;81cc	d9 	. 
	scf			;81cd	37 	7 
	ret z			;81ce	c8 	. 
	inc de			;81cf	13 	. 
	ld c,03fh		;81d0	0e 3f 	. ? 
l81d2h:
	ld (hl),c			;81d2	71 	q 
	inc hl			;81d3	23 	# 
	djnz l81d2h		;81d4	10 fc 	. . 
l81d6h:
	or a			;81d6	b7 	. 
	ret			;81d7	c9 	. 
	push ix		;81d8	dd e5 	. . 
	pop hl			;81da	e1 	. 
	push hl			;81db	e5 	. 
	push af			;81dc	f5 	. 
	push iy		;81dd	fd e5 	. . 
	pop hl			;81df	e1 	. 
l81e0h:
	ld a,(hl)			;81e0	7e 	~ 
	inc hl			;81e1	23 	# 
	cp 03ah		;81e2	fe 3a 	. : 
	jr z,l81f3h		;81e4	28 0d 	( . 
	cp 01bh		;81e6	fe 1b 	. . 
	jr nz,l81e0h		;81e8	20 f6 	  . 
	pop af			;81ea	f1 	. 
	ld a,(006a3h)		;81eb	3a a3 06 	: . . 
	add a,020h		;81ee	c6 20 	.   
	pop hl			;81f0	e1 	. 
	jr l8230h		;81f1	18 3d 	. = 
l81f3h:
	push hl			;81f3	e5 	. 
	ex (sp),iy		;81f4	fd e3 	. . 
	pop hl			;81f6	e1 	. 
	ld de,003aeh		;81f7	11 ae 03 	. . . 
l81fah:
	push hl			;81fa	e5 	. 
l81fbh:
	ld a,(de)			;81fb	1a 	. 
	or a			;81fc	b7 	. 
	jr z,l8221h		;81fd	28 22 	( " 
	ex de,hl			;81ff	eb 	. 
	ld a,(de)			;8200	1a 	. 
	call 0029eh		;8201	cd 9e 02 	. . . 
	jr nc,l820ah		;8204	30 04 	0 . 
	cp 03ah		;8206	fe 3a 	. : 
	jr nz,l8221h		;8208	20 17 	  . 
l820ah:
	cp (hl)			;820a	be 	. 
	ex de,hl			;820b	eb 	. 
	inc de			;820c	13 	. 
	inc hl			;820d	23 	# 
	jr nz,l8216h		;820e	20 06 	  . 
	cp 03ah		;8210	fe 3a 	. : 
	jr z,l8228h		;8212	28 14 	( . 
	jr l81fbh		;8214	18 e5 	. . 
l8216h:
	ld a,(de)			;8216	1a 	. 
	inc de			;8217	13 	. 
	cp 03ah		;8218	fe 3a 	. : 
	jr nz,l8216h		;821a	20 fa 	  . 
	inc de			;821c	13 	. 
	inc de			;821d	13 	. 
	pop hl			;821e	e1 	. 
	jr l81fah		;821f	18 d9 	. . 
l8221h:
	pop hl			;8221	e1 	. 
	pop af			;8222	f1 	. 
	pop af			;8223	f1 	. 
	ld a,002h		;8224	3e 02 	> . 
	scf			;8226	37 	7 
	ret			;8227	c9 	. 
l8228h:
	pop hl			;8228	e1 	. 
	pop af			;8229	f1 	. 
	or a			;822a	b7 	. 
	jr z,l822eh		;822b	28 01 	( . 
	inc de			;822d	13 	. 
l822eh:
	ld a,(de)			;822e	1a 	. 
	pop hl			;822f	e1 	. 
l8230h:
	cp 020h		;8230	fe 20 	.   
	ccf			;8232	3f 	? 
	ret nc			;8233	d0 	. 
	rlca			;8234	07 	. 
	rra			;8235	1f 	. 
	jr nc,l823bh		;8236	30 03 	0 . 
	ld a,002h		;8238	3e 02 	> . 
	ret			;823a	c9 	. 
l823bh:
	push af			;823b	f5 	. 
	and 00fh		;823c	e6 0f 	. . 
	add a,041h		;823e	c6 41 	. A 
	ld (006a4h),a		;8240	32 a4 06 	2 . . 
	push iy		;8243	fd e5 	. . 
	pop de			;8245	d1 	. 
	ld (hl),000h		;8246	36 00 	6 . 
	inc hl			;8248	23 	# 
	push hl			;8249	e5 	. 
	call 002a9h		;824a	cd a9 02 	. . . 
	pop bc			;824d	c1 	. 
	jr c,l82a9h		;824e	38 59 	8 Y 
	ld a,(bc)			;8250	0a 	. 
	cp 020h		;8251	fe 20 	.   
	jr z,l82a9h		;8253	28 54 	( T 
	ld a,(de)			;8255	1a 	. 
	cp 01bh		;8256	fe 1b 	. . 
	jr z,l825fh		;8258	28 05 	( . 
	cp 02eh		;825a	fe 2e 	. . 
	jr nz,l82a9h		;825c	20 4b 	  K 
	inc de			;825e	13 	. 
l825fh:
	push hl			;825f	e5 	. 
	call 002adh		;8260	cd ad 02 	. . . 
	ld (hl),000h		;8263	36 00 	6 . 
	pop hl			;8265	e1 	. 
	jr c,l82a9h		;8266	38 41 	8 A 
	ld a,(de)			;8268	1a 	. 
	cp 01bh		;8269	fe 1b 	. . 
	jr nz,l82a9h		;826b	20 3c 	  < 
	exx			;826d	d9 	. 
	push hl			;826e	e5 	. 
	bit 2,(hl)		;826f	cb 56 	. V 
	exx			;8271	d9 	. 
	pop de			;8272	d1 	. 
	inc de			;8273	13 	. 
	jr z,l8298h		;8274	28 22 	( " 
	ld b,003h		;8276	06 03 	. . 
	push hl			;8278	e5 	. 
l8279h:
	ld a,(de)			;8279	1a 	. 
	cp (hl)			;827a	be 	. 
	jr nz,l8287h		;827b	20 0a 	  . 
	inc hl			;827d	23 	# 
	inc de			;827e	13 	. 
	djnz l8279h		;827f	10 f8 	. . 
	pop hl			;8281	e1 	. 
	pop af			;8282	f1 	. 
	ld a,006h		;8283	3e 06 	> . 
	scf			;8285	37 	7 
	ret			;8286	c9 	. 
l8287h:
	exx			;8287	d9 	. 
	bit 3,(hl)		;8288	cb 5e 	. ^ 
	exx			;828a	d9 	. 
	pop hl			;828b	e1 	. 
	jr z,l82a6h		;828c	28 18 	( . 
	inc b			;828e	04 	. 
l828fh:
	inc de			;828f	13 	. 
	djnz l828fh		;8290	10 fd 	. . 
	ld c,003h		;8292	0e 03 	. . 
	ldir		;8294	ed b0 	. . 
	jr l82a6h		;8296	18 0e 	. . 
l8298h:
	exx			;8298	d9 	. 
	bit 1,(hl)		;8299	cb 4e 	. N 
	exx			;829b	d9 	. 
	jr nz,l82a3h		;829c	20 05 	  . 
	ld a,(hl)			;829e	7e 	~ 
	cp 020h		;829f	fe 20 	.   
	jr nz,l82a6h		;82a1	20 03 	  . 
l82a3h:
	call 002adh		;82a3	cd ad 02 	. . . 
l82a6h:
	pop af			;82a6	f1 	. 
	or a			;82a7	b7 	. 
	ret			;82a8	c9 	. 
l82a9h:
	pop af			;82a9	f1 	. 
	ld a,003h		;82aa	3e 03 	> . 
	scf			;82ac	37 	7 
	ret			;82ad	c9 	. 
	ld b,e			;82ae	43 	C 
	ld c,a			;82af	4f 	O 
	ld c,(hl)			;82b0	4e 	N 
	ld a,(00201h)		;82b1	3a 01 02 	: . . 
	ld d,h			;82b4	54 	T 
	ld d,h			;82b5	54 	T 
	ld e,c			;82b6	59 	Y 
	ld a,(00201h)		;82b7	3a 01 02 	: . . 
	ld d,d			;82ba	52 	R 
	ld b,h			;82bb	44 	D 
	ld d,d			;82bc	52 	R 
	ld a,(0ff03h)		;82bd	3a 03 ff 	: . . 
	ld d,b			;82c0	50 	P 
	ld d,l			;82c1	55 	U 
	ld c,(hl)			;82c2	4e 	N 
	ld a,(004ffh)		;82c3	3a ff 04 	: . . 
	ld c,h			;82c6	4c 	L 
	ld d,e			;82c7	53 	S 
	ld d,h			;82c8	54 	T 
	ld a,(005ffh)		;82c9	3a ff 05 	: . . 
	ld c,h			;82cc	4c 	L 
	ld d,b			;82cd	50 	P 
	ld a,(005ffh)		;82ce	3a ff 05 	: . . 
	ld b,c			;82d1	41 	A 
	ld a,(02020h)		;82d2	3a 20 20 	:     
	ld b,d			;82d5	42 	B 
	ld a,(02121h)		;82d6	3a 21 21 	: ! ! 
	ld b,e			;82d9	43 	C 
	ld a,(02222h)		;82da	3a 22 22 	: " " 
	ld b,h			;82dd	44 	D 
	ld a,(02323h)		;82de	3a 23 23 	: # # 
	nop			;82e1	00 	. 
	ld a,(02424h)		;82e2	3a 24 24 	: $ $ 
	ld b,(hl)			;82e5	46 	F 
	ld a,(02525h)		;82e6	3a 25 25 	: % % 
	ld b,a			;82e9	47 	G 
	ld a,(02626h)		;82ea	3a 26 26 	: & & 
	ld c,b			;82ed	48 	H 
	ld a,(02727h)		;82ee	3a 27 27 	: ' ' 
	ld c,c			;82f1	49 	I 
	ld a,(02828h)		;82f2	3a 28 28 	: ( ( 
	ld c,d			;82f5	4a 	J 
	ld a,(02929h)		;82f6	3a 29 29 	: ) ) 
	ld c,e			;82f9	4b 	K 
	ld a,(02a2ah)		;82fa	3a 2a 2a 	: * * 
	ld c,h			;82fd	4c 	L 
	ld a,(02b2bh)		;82fe	3a 2b 2b 	: + + 
	ld c,l			;8301	4d 	M 
	ld a,(02c2ch)		;8302	3a 2c 2c 	: , , 
	ld c,(hl)			;8305	4e 	N 
	ld a,(02d2dh)		;8306	3a 2d 2d 	: - - 
	ld c,a			;8309	4f 	O 
	ld a,(02e2eh)		;830a	3a 2e 2e 	: . . 
	ld d,b			;830d	50 	P 
	ld a,(02f2fh)		;830e	3a 2f 2f 	: / / 
	nop			;8311	00 	. 
	ld de,00080h		;8312	11 80 00 	. . . 
	ld c,01ah		;8315	0e 1a 	. . 
	jp 00474h		;8317	c3 74 04 	. t . 
	ld hl,0005ch		;831a	21 5c 00 	! \ . 
	xor a			;831d	af 	. 
	push hl			;831e	e5 	. 
	call 002dbh		;831f	cd db 02 	. . . 
	pop de			;8322	d1 	. 
	ret c			;8323	d8 	. 
	cp 020h		;8324	fe 20 	.   
	jr nc,l832bh		;8326	30 03 	0 . 
	ld a,002h		;8328	3e 02 	> . 
	ret			;832a	c9 	. 
l832bh:
	push de			;832b	d5 	. 
	call 004b3h		;832c	cd b3 04 	. . . 
	pop de			;832f	d1 	. 
	ld c,011h		;8330	0e 11 	. . 
	call 00481h		;8332	cd 81 04 	. . . 
	ret nc			;8335	d0 	. 
	ld a,007h		;8336	3e 07 	> . 
	ret			;8338	c9 	. 
	ld c,00ch		;8339	0e 0c 	. . 
	call 00474h		;833b	cd 74 04 	. t . 
	ld a,l			;833e	7d 	} 
	cp 020h		;833f	fe 20 	.   
	jr c,l8351h		;8341	38 0e 	8 . 
	ld c,01fh		;8343	0e 1f 	. . 
	call 00474h		;8345	cd 74 04 	. t . 
	ld de,00005h		;8348	11 05 00 	. . . 
	add hl,de			;834b	19 	. 
	ld e,(hl)			;834c	5e 	^ 
	inc hl			;834d	23 	# 
	ld d,(hl)			;834e	56 	V 
	jr l8359h		;834f	18 08 	. . 
l8351h:
	ld hl,(00006h)		;8351	2a 06 00 	* . . 
	ld l,03eh		;8354	2e 3e 	. > 
	ld e,(hl)			;8356	5e 	^ 
	ld d,000h		;8357	16 00 	. . 
l8359h:
	inc de			;8359	13 	. 
	push de			;835a	d5 	. 
	ld c,01bh		;835b	0e 1b 	. . 
	call 00474h		;835d	cd 74 04 	. t . 
	ld h,b			;8360	60 	` 
	ld l,a			;8361	6f 	o 
	pop de			;8362	d1 	. 
l8363h:
	ld a,(hl)			;8363	7e 	~ 
	inc hl			;8364	23 	# 
	ld b,008h		;8365	06 08 	. . 
l8367h:
	rla			;8367	17 	. 
	ret nc			;8368	d0 	. 
	ld c,a			;8369	4f 	O 
	dec de			;836a	1b 	. 
	ld a,d			;836b	7a 	z 
	or e			;836c	b3 	. 
	scf			;836d	37 	7 
	ret z			;836e	c8 	. 
	ld a,c			;836f	79 	y 
	djnz l8367h		;8370	10 f5 	. . 
	jr l8363h		;8372	18 ef 	. . 
	push ix		;8374	dd e5 	. . 
	push iy		;8376	fd e5 	. . 
	call 00005h		;8378	cd 05 00 	. . . 
	pop iy		;837b	fd e1 	. . 
	pop ix		;837d	dd e1 	. . 
	or a			;837f	b7 	. 
	ret			;8380	c9 	. 
	call 00474h		;8381	cd 74 04 	. t . 
	cp 0ffh		;8384	fe ff 	. . 
	ccf			;8386	3f 	? 
	ret			;8387	c9 	. 
	call 0026ah		;8388	cd 6a 02 	. j . 
	ld c,00ch		;838b	0e 0c 	. . 
	call 00474h		;838d	cd 74 04 	. t . 
	ld a,l			;8390	7d 	} 
	cp 020h		;8391	fe 20 	.   
	jr nc,l8399h		;8393	30 04 	0 . 
	xor a			;8395	af 	. 
	ld (003e1h),a		;8396	32 e1 03 	2 . . 
l8399h:
	ld c,019h		;8399	0e 19 	. . 
	call 00474h		;839b	cd 74 04 	. t . 
	ld (006a3h),a		;839e	32 a3 06 	2 . . 
	jr l83a6h		;83a1	18 03 	. . 
	call 0026ah		;83a3	cd 6a 02 	. j . 
l83a6h:
	ld c,00dh		;83a6	0e 0d 	. . 
	call 00474h		;83a8	cd 74 04 	. t . 
	ld a,(006a3h)		;83ab	3a a3 06 	: . . 
	jr l83b3h		;83ae	18 03 	. . 
	ld a,(ix+021h)		;83b0	dd 7e 21 	. ~ ! 
l83b3h:
	and 00fh		;83b3	e6 0f 	. . 
	ld e,a			;83b5	5f 	_ 
	ld c,00eh		;83b6	0e 0e 	. . 
	jp 00474h		;83b8	c3 74 04 	. t . 
	call 0026ah		;83bb	cd 6a 02 	. j . 
	ld hl,0005ch		;83be	21 5c 00 	! \ . 
	jp 002dbh		;83c1	c3 db 02 	. . . 
	call 0026ah		;83c4	cd 6a 02 	. j . 
	call 0041ah		;83c7	cd 1a 04 	. . . 
	ret c			;83ca	d8 	. 
	ld de,0005ch		;83cb	11 5c 00 	. \ . 
	ld c,013h		;83ce	0e 13 	. . 
	jp 00474h		;83d0	c3 74 04 	. t . 
	call 0026ah		;83d3	cd 6a 02 	. j . 
	push bc			;83d6	c5 	. 
	call 0041ah		;83d7	cd 1a 04 	. . . 
	pop iy		;83da	fd e1 	. . 
	ret c			;83dc	d8 	. 
	exx			;83dd	d9 	. 
	inc hl			;83de	23 	# 
	inc hl			;83df	23 	# 
	inc hl			;83e0	23 	# 
	inc hl			;83e1	23 	# 
	exx			;83e2	d9 	. 
	ld hl,0006ch		;83e3	21 6c 00 	! l . 
	call 0041dh		;83e6	cd 1d 04 	. . . 
	jr nc,l83f6h		;83e9	30 0b 	0 . 
	cp 007h		;83eb	fe 07 	. . 
	ret c			;83ed	d8 	. 
	ld de,0005ch		;83ee	11 5c 00 	. \ . 
	ld c,017h		;83f1	0e 17 	. . 
	jp 00474h		;83f3	c3 74 04 	. t . 
l83f6h:
	scf			;83f6	37 	7 
	ld a,008h		;83f7	3e 08 	> . 
	ret			;83f9	c9 	. 
	call 0026ah		;83fa	cd 6a 02 	. j . 
l83fdh:
	call 0041ah		;83fd	cd 1a 04 	. . . 
	jr nc,l8415h		;8400	30 13 	0 . 
	cp 003h		;8402	fe 03 	. . 
	scf			;8404	37 	7 
	ret nz			;8405	c0 	. 
	ld a,(iy+000h)		;8406	fd 7e 00 	. ~ . 
	cp 01bh		;8409	fe 1b 	. . 
	ld iy,006a4h		;840b	fd 21 a4 06 	. ! . . 
	jr z,l83fdh		;840f	28 ec 	( . 
	ld a,003h		;8411	3e 03 	> . 
	scf			;8413	37 	7 
	ret			;8414	c9 	. 
l8415h:
	pop de			;8415	d1 	. 
	pop de			;8416	d1 	. 
	rrca			;8417	0f 	. 
	rrca			;8418	0f 	. 
	rrca			;8419	0f 	. 
	and 060h		;841a	e6 60 	. ` 
	ld bc,00080h		;841c	01 80 00 	. . . 
	or c			;841f	b1 	. 
	ld c,a			;8420	4f 	O 
	inc bc			;8421	03 	. 
	ld a,(006a4h)		;8422	3a a4 06 	: . . 
	or a			;8425	b7 	. 
	jp 0027dh		;8426	c3 7d 02 	. } . 
	call 0026ah		;8429	cd 6a 02 	. j . 
	ld de,0005ch		;842c	11 5c 00 	. \ . 
	ld c,012h		;842f	0e 12 	. . 
	call 00481h		;8431	cd 81 04 	. . . 
	jr nc,l8415h		;8434	30 df 	0 . 
	ld a,007h		;8436	3e 07 	> . 
	ret			;8438	c9 	. 
	ret			;8439	c9 	. 
	ld (ix+021h),a		;843a	dd 77 21 	. w ! 
	cp 020h		;843d	fe 20 	.   
	ccf			;843f	3f 	? 
	ret nc			;8440	d0 	. 
	call 004b3h		;8441	cd b3 04 	. . . 
	push ix		;8444	dd e5 	. . 
	pop de			;8446	d1 	. 
	scf			;8447	37 	7 
	ret			;8448	c9 	. 
	call 0026ah		;8449	cd 6a 02 	. j . 
	ld (ix+022h),080h		;844c	dd 36 22 80 	. 6 " . 
	xor a			;8450	af 	. 
	ld (ix+020h),a		;8451	dd 77 20 	. w   
	ld (ix+021h),0ffh		;8454	dd 36 21 ff 	. 6 ! . 
	call 002d8h		;8458	cd d8 02 	. . . 
	ret c			;845b	d8 	. 
	call 0053ah		;845c	cd 3a 05 	. : . 
	ret nc			;845f	d0 	. 
	ld c,00fh		;8460	0e 0f 	. . 
	call 00481h		;8462	cd 81 04 	. . . 
	ret nc			;8465	d0 	. 
	ld (ix+021h),a		;8466	dd 77 21 	. w ! 
	ld a,007h		;8469	3e 07 	> . 
	ret			;846b	c9 	. 
	call 0026ah		;846c	cd 6a 02 	. j . 
	xor a			;846f	af 	. 
	ld (ix+022h),a		;8470	dd 77 22 	. w " 
	ld (ix+020h),a		;8473	dd 77 20 	. w   
	dec a			;8476	3d 	= 
	ld (ix+021h),a		;8477	dd 77 21 	. w ! 
	call 002d8h		;847a	cd d8 02 	. . . 
	ret c			;847d	d8 	. 
	call 0053ah		;847e	cd 3a 05 	. : . 
	ret nc			;8481	d0 	. 
	push de			;8482	d5 	. 
	ld c,011h		;8483	0e 11 	. . 
	call 00474h		;8485	cd 74 04 	. t . 
	pop de			;8488	d1 	. 
	cp 0ffh		;8489	fe ff 	. . 
	ld a,008h		;848b	3e 08 	> . 
	jr c,l84a0h		;848d	38 11 	8 . 
	push de			;848f	d5 	. 
	call 00439h		;8490	cd 39 04 	. 9 . 
	pop de			;8493	d1 	. 
	ld a,00bh		;8494	3e 0b 	> . 
	jr c,l84a0h		;8496	38 08 	8 . 
	ld c,016h		;8498	0e 16 	. . 
	call 00481h		;849a	cd 81 04 	. . . 
	ret nc			;849d	d0 	. 
	ld a,009h		;849e	3e 09 	> . 
l84a0h:
	ld (ix+021h),0ffh		;84a0	dd 36 21 ff 	. 6 ! . 
	ret			;84a4	c9 	. 
	call 0026ah		;84a5	cd 6a 02 	. j . 
	ld a,(ix+021h)		;84a8	dd 7e 21 	. ~ ! 
	cp 0ffh		;84ab	fe ff 	. . 
	ret z			;84ad	c8 	. 
	cp 020h		;84ae	fe 20 	.   
	ccf			;84b0	3f 	? 
	jr nc,l84d2h		;84b1	30 1f 	0 . 
l84b3h:
	ld a,01ah		;84b3	3e 1a 	> . 
	call 00653h		;84b5	cd 53 06 	. S . 
	jr nc,l84bfh		;84b8	30 05 	0 . 
	cp 00bh		;84ba	fe 0b 	. . 
	scf			;84bc	37 	7 
	jr nz,l84d2h		;84bd	20 13 	  . 
l84bfh:
	ld a,(ix+022h)		;84bf	dd 7e 22 	. ~ " 
	or a			;84c2	b7 	. 
	jr nz,l84b3h		;84c3	20 ee 	  . 
	call 004b0h		;84c5	cd b0 04 	. . . 
	push ix		;84c8	dd e5 	. . 
	pop de			;84ca	d1 	. 
	ld c,010h		;84cb	0e 10 	. . 
	call 00481h		;84cd	cd 81 04 	. . . 
	ld a,00ah		;84d0	3e 0a 	> . 
l84d2h:
	ld (ix+021h),0ffh		;84d2	dd 36 21 ff 	. 6 ! . 
	ret			;84d6	c9 	. 
	cp a			;84d7	bf 	. 
	jr l84ddh		;84d8	18 03 	. . 
	ld b,a			;84da	47 	G 
	inc b			;84db	04 	. 
	cp b			;84dc	b8 	. 
l84ddh:
	push ix		;84dd	dd e5 	. . 
	pop de			;84df	d1 	. 
	ex de,hl			;84e0	eb 	. 
	ld bc,00023h		;84e1	01 23 00 	. # . 
	add hl,bc			;84e4	09 	. 
	jr z,l84ebh		;84e5	28 04 	( . 
	ld c,(ix+022h)		;84e7	dd 4e 22 	. N " 
	add hl,bc			;84ea	09 	. 
l84ebh:
	ex de,hl			;84eb	eb 	. 
	ret			;84ec	c9 	. 
	ld a,(ix+021h)		;84ed	dd 7e 21 	. ~ ! 
	or a			;84f0	b7 	. 
	scf			;84f1	37 	7 
	ret z			;84f2	c8 	. 
	inc a			;84f3	3c 	< 
	ret z			;84f4	c8 	. 
	cp 020h		;84f5	fe 20 	.   
	dec a			;84f7	3d 	= 
	ccf			;84f8	3f 	? 
	ret c			;84f9	d8 	. 
	ld c,a			;84fa	4f 	O 
	call 00474h		;84fb	cd 74 04 	. t . 
	ret			;84fe	c9 	. 
	push hl			;84ff	e5 	. 
	push de			;8500	d5 	. 
	push bc			;8501	c5 	. 
	call 005edh		;8502	cd ed 05 	. . . 
	jr nc,l854fh		;8505	30 48 	0 H 
	jr nz,l8513h		;8507	20 0a 	  . 
	ld a,(ix+021h)		;8509	dd 7e 21 	. ~ ! 
	inc a			;850c	3c 	< 
	jr z,l854fh		;850d	28 40 	( @ 
	ld a,004h		;850f	3e 04 	> . 
	jr l854fh		;8511	18 3c 	. < 
l8513h:
	ld a,(ix+022h)		;8513	dd 7e 22 	. ~ " 
	sub 080h		;8516	d6 80 	. . 
	jr nz,l8547h		;8518	20 2d 	  - 
	call 004b0h		;851a	cd b0 04 	. . . 
	call 005d7h		;851d	cd d7 05 	. . . 
	call 00415h		;8520	cd 15 04 	. . . 
	push ix		;8523	dd e5 	. . 
	pop de			;8525	d1 	. 
	ld c,014h		;8526	0e 14 	. . 
	call 00474h		;8528	cd 74 04 	. t . 
	push af			;852b	f5 	. 
	call 00412h		;852c	cd 12 04 	. . . 
	pop af			;852f	f1 	. 
	ld (ix+022h),000h		;8530	dd 36 22 00 	. 6 " . 
	jr z,l8547h		;8534	28 11 	( . 
	dec a			;8536	3d 	= 
	scf			;8537	37 	7 
	ld (ix+021h),a		;8538	dd 77 21 	. w ! 
	ld a,004h		;853b	3e 04 	> . 
	jr z,l854fh		;853d	28 10 	( . 
	ld (ix+021h),0ffh		;853f	dd 36 21 ff 	. 6 ! . 
	ld a,001h		;8543	3e 01 	> . 
	jr l854fh		;8545	18 08 	. . 
l8547h:
	call 005dah		;8547	cd da 05 	. . . 
	ld a,(de)			;854a	1a 	. 
	inc (ix+022h)		;854b	dd 34 22 	. 4 " 
	or a			;854e	b7 	. 
l854fh:
	pop bc			;854f	c1 	. 
	pop de			;8550	d1 	. 
	pop hl			;8551	e1 	. 
	ret			;8552	c9 	. 
	push hl			;8553	e5 	. 
	push de			;8554	d5 	. 
	push bc			;8555	c5 	. 
	push af			;8556	f5 	. 
	ld e,a			;8557	5f 	_ 
	call 005edh		;8558	cd ed 05 	. . . 
	jr nc,l8591h		;855b	30 34 	0 4 
	jr z,l859dh		;855d	28 3e 	( > 
	ld a,e			;855f	7b 	{ 
	call 005dah		;8560	cd da 05 	. . . 
	ld (de),a			;8563	12 	. 
	inc (ix+022h)		;8564	dd 34 22 	. 4 " 
	ld a,080h		;8567	3e 80 	> . 
	sub (ix+022h)		;8569	dd 96 22 	. . " 
	jr nz,l8591h		;856c	20 23 	  # 
	call 004b0h		;856e	cd b0 04 	. . . 
	call 005d7h		;8571	cd d7 05 	. . . 
	call 00415h		;8574	cd 15 04 	. . . 
	push ix		;8577	dd e5 	. . 
	pop de			;8579	d1 	. 
	ld c,015h		;857a	0e 15 	. . 
	call 00474h		;857c	cd 74 04 	. t . 
	ld (ix+022h),000h		;857f	dd 36 22 00 	. 6 " . 
	push af			;8583	f5 	. 
	call 00412h		;8584	cd 12 04 	. . . 
	pop af			;8587	f1 	. 
	and 003h		;8588	e6 03 	. . 
	jr nz,l8595h		;858a	20 09 	  . 
	call 00439h		;858c	cd 39 04 	. 9 . 
	jr c,l859bh		;858f	38 0a 	8 . 
l8591h:
	pop af			;8591	f1 	. 
	or a			;8592	b7 	. 
	jr l859fh		;8593	18 0a 	. . 
l8595h:
	cp 002h		;8595	fe 02 	. . 
	ld a,009h		;8597	3e 09 	> . 
	jr nz,l859dh		;8599	20 02 	  . 
l859bh:
	ld a,00bh		;859b	3e 0b 	> . 
l859dh:
	pop bc			;859d	c1 	. 
	scf			;859e	37 	7 
l859fh:
	pop bc			;859f	c1 	. 
	pop de			;85a0	d1 	. 
	pop hl			;85a1	e1 	. 
	ret			;85a2	c9 	. 
	nop			;85a3	00 	. 
	ld b,c			;85a4	41 	A 
	ld a,(01b2ah)		;85a5	3a 2a 1b 	: * . 
	ld d,h			;85a8	54 	T 
	ld e,b			;85a9	58 	X 
	ld b,l			;85aa	45 	E 
	ld b,h			;85ab	44 	D 
	jr nz,l8604h		;85ac	20 56 	  V 
	jr nz,$+54		;85ae	20 34 	  4 
	ld l,031h		;85b0	2e 31 	. 1 
	jr nz,$+71		;85b2	20 45 	  E 
	dec c			;85b4	0d 	. 
	ld b,e			;85b5	43 	C 
	ld l,a			;85b6	6f 	o 
	ld (hl),b			;85b7	70 	p 
	ld a,c			;85b8	79 	y 
	ld (hl),d			;85b9	72 	r 
	ld l,c			;85ba	69 	i 
	ld h,a			;85bb	67 	g 
	ld l,b			;85bc	68 	h 
	ld (hl),h			;85bd	74 	t 
	jr nz,l85e8h		;85be	20 28 	  ( 
	ld h,e			;85c0	63 	c 
	add hl,hl			;85c1	29 	) 
	jr nz,$+51		;85c2	20 31 	  1 
	add hl,sp			;85c4	39 	9 
	jr c,l85f7h		;85c5	38 30 	8 0 
	jr nz,l862bh		;85c7	20 62 	  b 
	ld a,c			;85c9	79 	y 
	jr nz,$+84		;85ca	20 52 	  R 
	ld h,l			;85cc	65 	e 
	ld (hl),e			;85cd	73 	s 
	ld h,l			;85ce	65 	e 
	ld h,c			;85cf	61 	a 
	ld (hl),d			;85d0	72 	r 
	ld h,e			;85d1	63 	c 
	ld l,b			;85d2	68 	h 
	jr nz,$+79		;85d3	20 4d 	  M 
	ld h,c			;85d5	61 	a 
	ld h,e			;85d6	63 	c 
	ld l,b			;85d7	68 	h 
	ld l,c			;85d8	69 	i 
	ld l,(hl)			;85d9	6e 	n 
	ld h,l			;85da	65 	e 
	ld (hl),e			;85db	73 	s 
	dec c			;85dc	0d 	. 
	ex de,hl			;85dd	eb 	. 
	ld hl,(00100h)		;85de	2a 00 01 	* . . 
	nop			;85e1	00 	. 
	ld (bc),a			;85e2	02 	. 
	ld bc,09700h		;85e3	01 00 97 	. . . 
	jr z,l8629h		;85e6	28 41 	( A 
l85e8h:
	add hl,hl			;85e8	29 	) 
	ld hl,(00108h)		;85e9	2a 08 01 	* . . 
	ld de,000aah		;85ec	11 aa 00 	. . . 
	ld (006e5h),hl		;85ef	22 e5 06 	" . . 
	add hl,de			;85f2	19 	. 
	ld (006e7h),hl		;85f3	22 e7 06 	" . . 
	add hl,de			;85f6	19 	. 
l85f7h:
	ld de,(006dfh)		;85f7	ed 5b df 06 	. [ . . 
	add hl,de			;85fb	19 	. 
	ld sp,hl			;85fc	f9 	. 
	ld (006ddh),hl		;85fd	22 dd 06 	" . . 
	ld (01cceh),hl		;8600	22 ce 1c 	" . . 
	add hl,de			;8603	19 	. 
l8604h:
	ld (01cd4h),hl		;8604	22 d4 1c 	" . . 
	ld (01d05h),hl		;8607	22 05 1d 	" . . 
	ld (01d07h),hl		;860a	22 07 1d 	" . . 
	ld de,(006e1h)		;860d	ed 5b e1 06 	. [ . . 
	add hl,de			;8611	19 	. 
	ld (01d09h),hl		;8612	22 09 1d 	" . . 
	ld (01d13h),hl		;8615	22 13 1d 	" . . 
	ld (01d15h),hl		;8618	22 15 1d 	" . . 
	ex de,hl			;861b	eb 	. 
	ld hl,(00006h)		;861c	2a 06 00 	* . . 
	dec hl			;861f	2b 	+ 
	ld (01d17h),hl		;8620	22 17 1d 	" . . 
	ld (01d19h),hl		;8623	22 19 1d 	" . . 
	or a			;8626	b7 	. 
	sbc hl,de		;8627	ed 52 	. R 
l8629h:
	jr c,l8630h		;8629	38 05 	8 . 
l862bh:
	ld a,h			;862b	7c 	| 
	cp 002h		;862c	fe 02 	. . 
	jr nc,l865eh		;862e	30 2e 	0 . 
l8630h:
	ld iy,0015eh		;8630	fd 21 5e 01 	. ! ^ . 
	ld hl,01ab2h		;8634	21 b2 1a 	! . . 
	ld bc,00012h		;8637	01 12 00 	. . . 
	call 018eeh		;863a	cd ee 18 	. . . 
	jp 00000h		;863d	c3 00 00 	. . . 
	ld sp,(006ddh)		;8640	ed 7b dd 06 	. { . . 
	ld iy,0015eh		;8644	fd 21 5e 01 	. ! ^ . 
	ld hl,01aafh		;8648	21 af 1a 	! . . 
	ld bc,00003h		;864b	01 03 00 	. . . 
	call 018eeh		;864e	cd ee 18 	. . . 
	bit 3,(iy-03ah)		;8651	fd cb c6 5e 	. . . ^ 
	call nz,0147bh		;8655	c4 7b 14 	. { . 
	call 0187fh		;8658	cd 7f 18 	.  . 
	jp 00aa1h		;865b	c3 a1 0a 	. . . 
l865eh:
	ld hl,006a8h		;865e	21 a8 06 	! . . 
	ld bc,00035h		;8661	01 35 00 	. 5 . 
	ld iy,0015eh		;8664	fd 21 5e 01 	. ! ^ . 
	call 018eeh		;8668	cd ee 18 	. . . 
	call 008f4h		;866b	cd f4 08 	. . . 
	dec a			;866e	3d 	= 
	ld (01cdch),a		;866f	32 dc 1c 	2 . . 
	ld (01cddh),a		;8672	32 dd 1c 	2 . . 
	call 008c5h		;8675	cd c5 08 	. . . 
	bit 2,(iy-03bh)		;8678	fd cb c5 56 	. . . V 
	call z,00240h		;867c	cc 40 02 	. @ . 
	res 2,(iy-03bh)		;867f	fd cb c5 96 	. . . . 
	call 0147bh		;8683	cd 7b 14 	. { . 
	bit 5,(iy-03ah)		;8686	fd cb c6 6e 	. . . n 
	jp z,00a93h		;868a	ca 93 0a 	. . . 
	ld hl,(01cd2h)		;868d	2a d2 1c 	* . . 
	jp 009edh		;8690	c3 ed 09 	. . . 
l8693h:
	call 0187fh		;8693	cd 7f 18 	.  . 
	ld sp,(006ddh)		;8696	ed 7b dd 06 	. { . . 
	call 008f4h		;869a	cd f4 08 	. . . 
	ld hl,(01cceh)		;869d	2a ce 1c 	* . . 
	ld (01cd6h),hl		;86a0	22 d6 1c 	" . . 
	bit 2,(iy-03ah)		;86a3	fd cb c6 56 	. . . V 
	jp nz,00c26h		;86a7	c2 26 0c 	. & . 
	ld a,02ah		;86aa	3e 2a 	> * 
	call 01890h		;86ac	cd 90 18 	. . . 
	call 00906h		;86af	cd 06 09 	. . . 
	jr z,l86d8h		;86b2	28 24 	( $ 
	cp 020h		;86b4	fe 20 	.   
	jr nc,l86d8h		;86b6	30 20 	0   
	cp 00dh		;86b8	fe 0d 	. . 
	jr z,l86d8h		;86ba	28 1c 	( . 
	cp 009h		;86bc	fe 09 	. . 
	jr z,l86d8h		;86be	28 18 	( . 
	cp 01bh		;86c0	fe 1b 	. . 
	jr z,l86d8h		;86c2	28 14 	( . 
	bit 3,(iy-03ah)		;86c4	fd cb c6 5e 	. . . ^ 
	jr z,l86d8h		;86c8	28 0e 	( . 
	push af			;86ca	f5 	. 
	call 0187fh		;86cb	cd 7f 18 	.  . 
	call 00a85h		;86ce	cd 85 0a 	. . . 
	pop af			;86d1	f1 	. 
	jp 00c34h		;86d2	c3 34 0c 	. 4 . 
l86d5h:
	call 00906h		;86d5	cd 06 09 	. . . 
l86d8h:
	cp 07fh		;86d8	fe 7f 	.  
	jp z,00812h		;86da	ca 12 08 	. . . 
	cp 00ah		;86dd	fe 0a 	. . 
	jr z,l86d5h		;86df	28 f4 	( . 
	call 01890h		;86e1	cd 90 18 	. . . 
	ld e,(iy-040h)		;86e4	fd 5e c0 	. ^ . 
	ld (iy-040h),a		;86e7	fd 77 c0 	. w . 
	cp 01bh		;86ea	fe 1b 	. . 
	jr nz,l86f2h		;86ec	20 04 	  . 
	cp e			;86ee	bb 	. 
	jp z,009d9h		;86ef	ca d9 09 	. . . 
l86f2h:
	cp 012h		;86f2	fe 12 	. . 
	jr z,l874dh		;86f4	28 57 	( W 
	cp 015h		;86f6	fe 15 	. . 
	jr z,l8759h		;86f8	28 5f 	( _ 
	cp 018h		;86fa	fe 18 	. . 
	jr z,l8693h		;86fc	28 95 	( . 
	ld hl,(01cd6h)		;86fe	2a d6 1c 	* . . 
	or (iy-041h)		;8701	fd b6 bf 	. . . 
	ld (hl),a			;8704	77 	w 
	inc hl			;8705	23 	# 
	ld (01cd6h),hl		;8706	22 d6 1c 	" . . 
	ex de,hl			;8709	eb 	. 
	ld hl,(01cd4h)		;870a	2a d4 1c 	* . . 
	call 01a8bh		;870d	cd 8b 1a 	. . . 
	jr nz,l86d5h		;8710	20 c3 	  . 
	ld de,(01cceh)		;8712	ed 5b ce 1c 	. [ . . 
	ld hl,(01cd6h)		;8716	2a d6 1c 	* . . 
	ld (iy-040h),a		;8719	fd 77 c0 	. w . 
	call 01a8bh		;871c	cd 8b 1a 	. . . 
	jp z,00793h		;871f	ca 93 07 	. . . 
	dec hl			;8722	2b 	+ 
	ld (01cd6h),hl		;8723	22 d6 1c 	" . . 
	ld a,(hl)			;8726	7e 	~ 
	and 07fh		;8727	e6 7f 	.  
	jr z,l8748h		;8729	28 1d 	( . 
	cp 01bh		;872b	fe 1b 	. . 
	jr z,l8748h		;872d	28 19 	( . 
	cp 00dh		;872f	fe 0d 	. . 
	jr z,l8748h		;8731	28 15 	( . 
	cp 009h		;8733	fe 09 	. . 
	jr z,l8748h		;8735	28 11 	( . 
	cp 020h		;8737	fe 20 	.   
	jr nc,l8748h		;8739	30 0d 	0 . 
	call 0087bh		;873b	cd 7b 08 	. { . 
	call 00876h		;873e	cd 76 08 	. v . 
	jr nz,l8748h		;8741	20 05 	  . 
	call 0089ah		;8743	cd 9a 08 	. . . 
	jr l86d5h		;8746	18 8d 	. . 
l8748h:
	call 0087bh		;8748	cd 7b 08 	. { . 
	jr l86d5h		;874b	18 88 	. . 
l874dh:
	call 0187fh		;874d	cd 7f 18 	.  . 
	ld hl,(01cceh)		;8750	2a ce 1c 	* . . 
	call 008afh		;8753	cd af 08 	. . . 
	jp 007d5h		;8756	c3 d5 07 	. . . 
l8759h:
	call 0187fh		;8759	cd 7f 18 	.  . 
	ld hl,(01cd6h)		;875c	2a d6 1c 	* . . 
	ld de,(01cceh)		;875f	ed 5b ce 1c 	. [ . . 
l8763h:
	call 01a8bh		;8763	cd 8b 1a 	. . . 
	jp z,00796h		;8766	ca 96 07 	. . . 
	dec hl			;8769	2b 	+ 
	ld a,(hl)			;876a	7e 	~ 
	cp 08dh		;876b	fe 8d 	. . 
	jr nz,l8763h		;876d	20 f4 	  . 
	inc hl			;876f	23 	# 
	ld (01cd6h),hl		;8770	22 d6 1c 	" . . 
	jp 007d5h		;8773	c3 d5 07 	. . . 
	xor a			;8776	af 	. 
	add a,(iy-044h)		;8777	fd 86 bc 	. . . 
	ret			;877a	c9 	. 
	call 00876h		;877b	cd 76 08 	. v . 
	jr z,l879ah		;877e	28 1a 	( . 
	ld hl,0f5bfh		;8780	21 bf f5 	! . . 
	ld b,000h		;8783	06 00 	. . 
	ld c,(iy-044h)		;8785	fd 4e bc 	. N . 
	add hl,bc			;8788	09 	. 
l8789h:
	rst 30h			;8789	f7 	. 
	inc l			;878a	2c 	, 
	ld e,a			;878b	5f 	_ 
	dec hl			;878c	2b 	+ 
	ld a,07fh		;878d	3e 7f 	>  
	rst 30h			;878f	f7 	. 
	ld bc,035fdh		;8790	01 fd 35 	. . 5 
	cp h			;8793	bc 	. 
	ld a,e			;8794	7b 	{ 
	cp 080h		;8795	fe 80 	. . 
	jr z,l8789h		;8797	28 f0 	( . 
	ret			;8799	c9 	. 
l879ah:
	call 0187fh		;879a	cd 7f 18 	.  . 
	ld hl,(01cd6h)		;879d	2a d6 1c 	* . . 
	ld de,(01cceh)		;87a0	ed 5b ce 1c 	. [ . . 
l87a4h:
	call 01a8bh		;87a4	cd 8b 1a 	. . . 
	jr z,l87afh		;87a7	28 06 	( . 
	dec hl			;87a9	2b 	+ 
	bit 7,(hl)		;87aa	cb 7e 	. ~ 
	jr z,l87a4h		;87ac	28 f6 	( . 
	inc hl			;87ae	23 	# 
l87afh:
	ex de,hl			;87af	eb 	. 
	ld hl,(01cd6h)		;87b0	2a d6 1c 	* . . 
	call 01a8bh		;87b3	cd 8b 1a 	. . . 
	ret z			;87b6	c8 	. 
	ex de,hl			;87b7	eb 	. 
	ld a,(hl)			;87b8	7e 	~ 
	and 07fh		;87b9	e6 7f 	.  
	call 01890h		;87bb	cd 90 18 	. . . 
	add a,(iy-041h)		;87be	fd 86 bf 	. . . 
	ld (hl),a			;87c1	77 	w 
	inc hl			;87c2	23 	# 
	jr l87afh		;87c3	18 ea 	. . 
	ld de,00080h		;87c5	11 80 00 	. . . 
	ld a,(de)			;87c8	1a 	. 
	inc de			;87c9	13 	. 
	cp 002h		;87ca	fe 02 	. . 
	ret c			;87cc	d8 	. 
	bit 4,(iy-03ah)		;87cd	fd cb c6 66 	. . . f 
	ret nz			;87d1	c0 	. 
	set 5,(iy-03ah)		;87d2	fd cb c6 ee 	. . . . 
	ld b,a			;87d6	47 	G 
	ld hl,(01cceh)		;87d7	2a ce 1c 	* . . 
	ld (01cd6h),hl		;87da	22 d6 1c 	" . . 
	ld (hl),045h		;87dd	36 45 	6 E 
	inc hl			;87df	23 	# 
	ld (hl),042h		;87e0	36 42 	6 B 
	inc hl			;87e2	23 	# 
l87e3h:
	ld a,(de)			;87e3	1a 	. 
	inc de			;87e4	13 	. 
	cp 020h		;87e5	fe 20 	.   
	jr z,l87ebh		;87e7	28 02 	( . 
	ld (hl),a			;87e9	77 	w 
	inc hl			;87ea	23 	# 
l87ebh:
	djnz l87e3h		;87eb	10 f6 	. . 
	ld (hl),01bh		;87ed	36 1b 	6 . 
	inc hl			;87ef	23 	# 
	ld (01cd2h),hl		;87f0	22 d2 1c 	" . . 
	ret			;87f3	c9 	. 
	xor a			;87f4	af 	. 
	ld (iy-040h),a		;87f5	fd 77 c0 	. w . 
	ld (01ce4h),a		;87f8	32 e4 1c 	2 . . 
	ld (01d0fh),a		;87fb	32 0f 1d 	2 . . 
	ld (iy-044h),a		;87fe	fd 77 bc 	. w . 
	res 6,(iy-03ah)		;8801	fd cb c6 b6 	. . . . 
	ret			;8805	c9 	. 
l8806h:
	rst 30h			;8806	f7 	. 
	rra			;8807	1f 	. 
	or a			;8808	b7 	. 
	jr z,l881ah		;8809	28 0f 	( . 
	rst 30h			;880b	f7 	. 
	ld hl,003feh		;880c	21 fe 03 	! . . 
	call z,0097dh		;880f	cc 7d 09 	. } . 
	cp 006h		;8812	fe 06 	. . 
	call z,00945h		;8814	cc 45 09 	. E . 
	jp nz,01b31h		;8817	c2 31 1b 	. 1 . 
l881ah:
	dec (iy-03eh)		;881a	fd 35 c2 	. 5 . 
	jr nz,l8806h		;881d	20 e7 	  . 
	dec (iy-03dh)		;881f	fd 35 c3 	. 5 . 
	jr nz,l8806h		;8822	20 e2 	  . 
	inc (iy-03ch)		;8824	fd 34 c4 	. 4 . 
	ld hl,(00942h)		;8827	2a 42 09 	* B . 
	bit 0,(iy-03ch)		;882a	fd cb c4 46 	. . . F 
	jr z,l883dh		;882e	28 0d 	( . 
	ld a,(iy-039h)		;8830	fd 7e c7 	. ~ . 
l8833h:
	rst 30h			;8833	f7 	. 
	dec hl			;8834	2b 	+ 
	ld a,(iy-050h)		;8835	fd 7e b0 	. ~ . 
	ld (iy-03dh),a		;8838	fd 77 c3 	. w . 
	jr l8806h		;883b	18 c9 	. . 
l883dh:
	ld a,(iy-03fh)		;883d	fd 7e c1 	. ~ . 
	jr l8833h		;8840	18 f1 	. . 
	ld b,b			;8842	40 	@ 
	ret p			;8843	f0 	. 
	nop			;8844	00 	. 
	ld hl,009adh		;8845	21 ad 09 	! . . 
	ld bc,00019h		;8848	01 19 00 	. . . 
	call 018eeh		;884b	cd ee 18 	. . . 
	call 01b64h		;884e	cd 64 1b 	. d . 
	jr nz,l8865h		;8851	20 12 	  . 
	call 0e013h		;8853	cd 13 e0 	. . . 
	bit 3,(iy-03ah)		;8856	fd cb c6 5e 	. . . ^ 
	jr z,l886ch		;885a	28 10 	( . 
	call 0147bh		;885c	cd 7b 14 	. { . 
	call 0187fh		;885f	cd 7f 18 	.  . 
	jp 00aa1h		;8862	c3 a1 0a 	. . . 
l8865h:
	bit 2,(iy-03ah)		;8865	fd cb c6 56 	. . . V 
	jp nz,00aa1h		;8869	c2 a1 0a 	. . . 
l886ch:
	ld hl,(01cd6h)		;886c	2a d6 1c 	* . . 
	ld de,(01cceh)		;886f	ed 5b ce 1c 	. [ . . 
	call 01a8bh		;8873	cd 8b 1a 	. . . 
	jp z,00793h		;8876	ca 93 07 	. . . 
	ld a,012h		;8879	3e 12 	> . 
	or a			;887b	b7 	. 
	ret			;887c	c9 	. 
	ld hl,00990h		;887d	21 90 09 	! . . 
	ld bc,0001dh		;8880	01 1d 00 	. . . 
	call 018eeh		;8883	cd ee 18 	. . . 
	call 01b64h		;8886	cd 64 1b 	. d . 
	jr nz,l8865h		;8889	20 da 	  . 
	rst 30h			;888b	f7 	. 
	ld c,0c3h		;888c	0e c3 	. . 
	nop			;888e	00 	. 
	nop			;888f	00 	. 
	dec c			;8890	0d 	. 
	ld b,e			;8891	43 	C 
	ld d,h			;8892	54 	T 
	ld d,d			;8893	52 	R 
	ld c,h			;8894	4c 	L 
	jr nz,$+69		;8895	20 43 	  C 
	jr nz,l88c6h		;8897	20 2d 	  - 
	jr nz,$+99		;8899	20 61 	  a 
	ld (hl),d			;889b	72 	r 
	ld h,l			;889c	65 	e 
	jr nz,$+123		;889d	20 79 	  y 
	ld l,a			;889f	6f 	o 
	ld (hl),l			;88a0	75 	u 
	jr nz,$+117		;88a1	20 73 	  s 
	ld (hl),l			;88a3	75 	u 
	ld (hl),d			;88a4	72 	r 
	ld h,l			;88a5	65 	e 
	jr nz,l88d0h		;88a6	20 28 	  ( 
	ld e,c			;88a8	59 	Y 
	cpl			;88a9	2f 	/ 
	ld c,(hl)			;88aa	4e 	N 
	add hl,hl			;88ab	29 	) 
	ccf			;88ac	3f 	? 
	dec c			;88ad	0d 	. 
	ld b,(hl)			;88ae	46 	F 
	ld (hl),d			;88af	72 	r 
	ld l,a			;88b0	6f 	o 
	ld l,(hl)			;88b1	6e 	n 
	ld (hl),h			;88b2	74 	t 
	jr nz,$+82		;88b3	20 50 	  P 
	ld h,c			;88b5	61 	a 
	ld l,(hl)			;88b6	6e 	n 
	ld h,l			;88b7	65 	e 
	ld l,h			;88b8	6c 	l 
	jr nz,l891eh		;88b9	20 63 	  c 
	ld l,b			;88bb	68 	h 
	ld h,l			;88bc	65 	e 
	ld h,e			;88bd	63 	c 
	ld l,e			;88be	6b 	k 
	jr nz,$+42		;88bf	20 28 	  ( 
	ld e,c			;88c1	59 	Y 
	cpl			;88c2	2f 	/ 
	ld c,(hl)			;88c3	4e 	N 
	add hl,hl			;88c4	29 	) 
	ccf			;88c5	3f 	? 
l88c6h:
	ld hl,(01cceh)		;88c6	2a ce 1c 	* . . 
l88c9h:
	ex de,hl			;88c9	eb 	. 
	ld hl,(01cd6h)		;88ca	2a d6 1c 	* . . 
	xor a			;88cd	af 	. 
	sbc hl,de		;88ce	ed 52 	. R 
l88d0h:
	ret z			;88d0	c8 	. 
	ex de,hl			;88d1	eb 	. 
	ld a,(hl)			;88d2	7e 	~ 
	and 07fh		;88d3	e6 7f 	.  
	ld (hl),a			;88d5	77 	w 
	inc hl			;88d6	23 	# 
	jr l88c9h		;88d7	18 f0 	. . 
	call 0187fh		;88d9	cd 7f 18 	.  . 
	call 009c6h		;88dc	cd c6 09 	. . . 
	ld hl,(00942h)		;88df	2a 42 09 	* B . 
	ld a,(iy-03fh)		;88e2	fd 7e c1 	. ~ . 
	rst 30h			;88e5	f7 	. 
	dec hl			;88e6	2b 	+ 
	ld hl,(01cd6h)		;88e7	2a d6 1c 	* . . 
	ld (01cd2h),hl		;88ea	22 d2 1c 	" . . 
	ex de,hl			;88ed	eb 	. 
	ld hl,(01cceh)		;88ee	2a ce 1c 	* . . 
	ld (01cd6h),hl		;88f1	22 d6 1c 	" . . 
	ex de,hl			;88f4	eb 	. 
	call 01a8bh		;88f5	cd 8b 1a 	. . . 
	ld a,c			;88f8	79 	y 
	dec a			;88f9	3d 	= 
	or b			;88fa	b0 	. 
	jr nz,l8909h		;88fb	20 0c 	  . 
	bit 3,(iy-03ah)		;88fd	fd cb c6 5e 	. . . ^ 
	jr z,l8909h		;8901	28 06 	( . 
	call 00a85h		;8903	cd 85 0a 	. . . 
	jp 00796h		;8906	c3 96 07 	. . . 
l8909h:
	ld hl,(01cd6h)		;8909	2a d6 1c 	* . . 
	ld (01cd0h),hl		;890c	22 d0 1c 	" . . 
	ld hl,01cdbh		;890f	21 db 1c 	! . . 
	ld (hl),000h		;8912	36 00 	6 . 
	call 00c85h		;8914	cd 85 0c 	. . . 
	jp z,00a93h		;8917	ca 93 0a 	. . . 
	cp 03dh		;891a	fe 3d 	. = 
	jr z,l8968h		;891c	28 4a 	( J 
l891eh:
	cp 02bh		;891e	fe 2b 	. + 
	jr z,l8927h		;8920	28 05 	( . 
	cp 02dh		;8922	fe 2d 	. - 
	jr nz,l892dh		;8924	20 07 	  . 
	ld (hl),a			;8926	77 	w 
l8927h:
	call 00c85h		;8927	cd 85 0c 	. . . 
	jp z,00d43h		;892a	ca 43 0d 	. C . 
l892dh:
	cp 02ah		;892d	fe 2a 	. * 
	jr z,l897dh		;892f	28 4c 	( L 
	ld hl,l8000h		;8931	21 00 80 	! . . 
l8934h:
	cp 030h		;8934	fe 30 	. 0 
	jr c,l8950h		;8936	38 18 	8 . 
	cp 03ah		;8938	fe 3a 	. : 
	jr nc,l8950h		;893a	30 14 	0 . 
	ld e,l			;893c	5d 	] 
	ld d,h			;893d	54 	T 
	add hl,hl			;893e	29 	) 
	add hl,hl			;893f	29 	) 
	add hl,de			;8940	19 	. 
	add hl,hl			;8941	29 	) 
	sub 030h		;8942	d6 30 	. 0 
	ld e,a			;8944	5f 	_ 
	ld d,000h		;8945	16 00 	. . 
	add hl,de			;8947	19 	. 
	call 00c85h		;8948	cd 85 0c 	. . . 
	jp z,00d43h		;894b	ca 43 0d 	. C . 
	jr l8934h		;894e	18 e4 	. . 
l8950h:
	push af			;8950	f5 	. 
	ld a,h			;8951	7c 	| 
	add a,a			;8952	87 	. 
	jr nc,l895bh		;8953	30 06 	0 . 
	rrca			;8955	0f 	. 
	ld h,a			;8956	67 	g 
	or l			;8957	b5 	. 
	jr nz,l895bh		;8958	20 01 	  . 
	inc l			;895a	2c 	, 
l895bh:
	ld (01cd9h),hl		;895b	22 d9 1c 	" . . 
	pop af			;895e	f1 	. 
l895fh:
	ld (01cd8h),a		;895f	32 d8 1c 	2 . . 
	call 00cb6h		;8962	cd b6 0c 	. . . 
	jp 00a09h		;8965	c3 09 0a 	. . . 
l8968h:
	ld (hl),a			;8968	77 	w 
	ld hl,(006e3h)		;8969	2a e3 06 	* . . 
	ld (01cd9h),hl		;896c	22 d9 1c 	" . . 
	ld hl,00000h		;896f	21 00 00 	! . . 
	ld (006e3h),hl		;8972	22 e3 06 	" . . 
l8975h:
	call 00c85h		;8975	cd 85 0c 	. . . 
	jp z,00d43h		;8978	ca 43 0d 	. C . 
	jr l895fh		;897b	18 e2 	. . 
l897dh:
	ld hl,07fffh		;897d	21 ff 7f 	! .  
	ld (01cd9h),hl		;8980	22 d9 1c 	" . . 
	jr l8975h		;8983	18 f0 	. . 
	ld hl,01ac4h		;8985	21 c4 1a 	! . . 
	ld bc,00002h		;8988	01 02 00 	. . . 
	call 018eeh		;898b	cd ee 18 	. . . 
	set 2,(iy-03ah)		;898e	fd cb c6 d6 	. . . . 
	ret			;8992	c9 	. 
	ld a,(01d0fh)		;8993	3a 0f 1d 	: . . 
	or a			;8996	b7 	. 
	jp nz,00bfbh		;8997	c2 fb 0b 	. . . 
	ld a,(01ce4h)		;899a	3a e4 1c 	: . . 
	or a			;899d	b7 	. 
	jp nz,00d4bh		;899e	c2 4b 0d 	. K . 
	bit 3,(iy-03ah)		;89a1	fd cb c6 5e 	. . . ^ 
	jp z,00796h		;89a5	ca 96 07 	. . . 
	ld hl,0f040h		;89a8	21 40 f0 	! @ . 
	ld (01cdfh),hl		;89ab	22 df 1c 	" . . 
	xor a			;89ae	af 	. 
	ld (iy-044h),a		;89af	fd 77 bc 	. w . 
	ld (iy-03dh),a		;89b2	fd 77 c3 	. w . 
	bit 1,(iy-049h)		;89b5	fd cb b7 4e 	. . . N 
	call nz,00da1h		;89b9	c4 a1 0d 	. . . 
	ld hl,(01d15h)		;89bc	2a 15 1d 	* . . 
	ld de,(01d13h)		;89bf	ed 5b 13 1d 	. [ . . 
	call 01a8bh		;89c3	cd 8b 1a 	. . . 
	jp z,00b53h		;89c6	ca 53 0b 	. S . 
	bit 0,(iy-049h)		;89c9	fd cb b7 46 	. . . F 
	jr z,l8a47h		;89cd	28 78 	( x 
	ld (iy-03eh),000h		;89cf	fd 36 c2 00 	. 6 . . 
	ld de,00000h		;89d3	11 00 00 	. . . 
	call 01a31h		;89d6	cd 31 1a 	. 1 . 
	call 01a8bh		;89d9	cd 8b 1a 	. . . 
	jr nz,l89eeh		;89dc	20 10 	  . 
	inc (iy-03eh)		;89de	fd 34 c2 	. 4 . 
	jr l8a1fh		;89e1	18 3c 	. < 
l89e3h:
	ld de,00001h		;89e3	11 01 00 	. . . 
	call 01a31h		;89e6	cd 31 1a 	. 1 . 
	call 01a8bh		;89e9	cd 8b 1a 	. . . 
	jr z,l8a28h		;89ec	28 3a 	( : 
l89eeh:
	push de			;89ee	d5 	. 
	ld h,000h		;89ef	26 00 	& . 
l89f1h:
	ld a,(de)			;89f1	1a 	. 
	inc de			;89f2	13 	. 
	inc h			;89f3	24 	$ 
	cp 00dh		;89f4	fe 0d 	. . 
	jr z,l8a14h		;89f6	28 1c 	( . 
	cp 009h		;89f8	fe 09 	. . 
	jr nz,l8a05h		;89fa	20 09 	  . 
l89fch:
	ld a,h			;89fc	7c 	| 
	and (iy-04ah)		;89fd	fd a6 b6 	. . . 
	jr z,l8a05h		;8a00	28 03 	( . 
	inc h			;8a02	24 	$ 
	jr l89fch		;8a03	18 f7 	. . 
l8a05h:
	ld a,h			;8a05	7c 	| 
	cp 028h		;8a06	fe 28 	. ( 
	jr c,l8a0fh		;8a08	38 05 	8 . 
	inc (iy-03eh)		;8a0a	fd 34 c2 	. 4 . 
	ld h,001h		;8a0d	26 01 	& . 
l8a0fh:
	dec bc			;8a0f	0b 	. 
	ld a,b			;8a10	78 	x 
	or c			;8a11	b1 	. 
	jr nz,l89f1h		;8a12	20 dd 	  . 
l8a14h:
	inc (iy-03eh)		;8a14	fd 34 c2 	. 4 . 
	ld a,(iy-03eh)		;8a17	fd 7e c2 	. ~ . 
	cp 007h		;8a1a	fe 07 	. . 
	pop de			;8a1c	d1 	. 
	jr nc,l8a28h		;8a1d	30 09 	0 . 
l8a1fh:
	ld hl,(01d13h)		;8a1f	2a 13 1d 	* . . 
	ex de,hl			;8a22	eb 	. 
	call 01a8bh		;8a23	cd 8b 1a 	. . . 
	jr nz,l89e3h		;8a26	20 bb 	  . 
l8a28h:
	ld a,(iy-03eh)		;8a28	fd 7e c2 	. ~ . 
	cp 00fh		;8a2b	fe 0f 	. . 
	jr c,l8a42h		;8a2d	38 13 	8 . 
	res 0,(iy-049h)		;8a2f	fd cb b7 86 	. . . . 
	ld hl,00bech		;8a33	21 ec 0b 	! . . 
	ld bc,0000fh		;8a36	01 0f 00 	. . . 
	call 018eeh		;8a39	cd ee 18 	. . . 
	call 0187fh		;8a3c	cd 7f 18 	.  . 
	jp 00aa1h		;8a3f	c3 a1 0a 	. . . 
l8a42h:
	ld hl,(01d15h)		;8a42	2a 15 1d 	* . . 
	jr l8a4dh		;8a45	18 06 	. . 
l8a47h:
	ld de,00007h		;8a47	11 07 00 	. . . 
	call 01a31h		;8a4a	cd 31 1a 	. 1 . 
l8a4dh:
	call 01a8bh		;8a4d	cd 8b 1a 	. . . 
	call 01911h		;8a50	cd 11 19 	. . . 
	xor a			;8a53	af 	. 
	ld b,a			;8a54	47 	G 
	ld a,c			;8a55	79 	y 
	ld (iy-042h),a		;8a56	fd 77 be 	. w . 
	sub (iy-048h)		;8a59	fd 96 b8 	. . . 
	cp 028h		;8a5c	fe 28 	. ( 
	ld hl,(006ddh)		;8a5e	2a dd 06 	* . . 
	jr c,l8a7ch		;8a61	38 19 	8 . 
	ld de,00008h		;8a63	11 08 00 	. . . 
l8a66h:
	add hl,de			;8a66	19 	. 
	sub e			;8a67	93 	. 
	cp 028h		;8a68	fe 28 	. ( 
	jr nc,l8a66h		;8a6a	30 fa 	0 . 
	ld de,(006ddh)		;8a6c	ed 5b dd 06 	. [ . . 
	ld c,a			;8a70	4f 	O 
	ld (iy-044h),a		;8a71	fd 77 bc 	. w . 
	ldir		;8a74	ed b0 	. . 
	ld hl,(006ddh)		;8a76	2a dd 06 	* . . 
	ld c,a			;8a79	4f 	O 
	ld (hl),00dh		;8a7a	36 0d 	6 . 
l8a7ch:
	ld (iy-03dh),000h		;8a7c	fd 36 c3 00 	. 6 . . 
	add hl,bc			;8a80	09 	. 
	ld (01ce2h),hl		;8a81	22 e2 1c 	" . . 
	ld a,(iy-050h)		;8a84	fd 7e b0 	. ~ . 
	or a			;8a87	b7 	. 
	jr nz,l8a91h		;8a88	20 07 	  . 
	inc (iy-044h)		;8a8a	fd 34 bc 	. 4 . 
	ld a,(iy-04fh)		;8a8d	fd 7e b1 	. ~ . 
	ld (hl),a			;8a90	77 	w 
l8a91h:
	ld hl,(01cdfh)		;8a91	2a df 1c 	* . . 
	ld a,c			;8a94	79 	y 
	sub (iy-048h)		;8a95	fd 96 b8 	. . . 
	ld c,a			;8a98	4f 	O 
	add hl,bc			;8a99	09 	. 
	ld (00942h),hl		;8a9a	22 42 09 	" B . 
	ld hl,(01d19h)		;8a9d	2a 19 1d 	* . . 
	ld de,(01d17h)		;8aa0	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;8aa4	cd 8b 1a 	. . . 
	jr z,l8abch		;8aa7	28 13 	( . 
	ld a,(de)			;8aa9	1a 	. 
	cp 00dh		;8aaa	fe 0d 	. . 
	jr nz,l8ab7h		;8aac	20 09 	  . 
	push hl			;8aae	e5 	. 
	ld hl,(01ce2h)		;8aaf	2a e2 1c 	* . . 
	ld a,(iy-04eh)		;8ab2	fd 7e b2 	. ~ . 
	ld (hl),a			;8ab5	77 	w 
	pop hl			;8ab6	e1 	. 
l8ab7h:
	call 01911h		;8ab7	cd 11 19 	. . . 
	jr nz,l8ac4h		;8aba	20 08 	  . 
l8abch:
	ld de,00bebh		;8abc	11 eb 0b 	. . . 
	ld bc,00001h		;8abf	01 01 00 	. . . 
	jr l8ab7h		;8ac2	18 f3 	. . 
l8ac4h:
	ld hl,(00942h)		;8ac4	2a 42 09 	* B . 
	rst 30h			;8ac7	f7 	. 
	inc l			;8ac8	2c 	, 
	ld (iy-03fh),a		;8ac9	fd 77 c1 	. w . 
	cp (iy-04eh)		;8acc	fd be b2 	. . . 
	jr z,l8addh		;8acf	28 0c 	( . 
	cp 080h		;8ad1	fe 80 	. . 
	jr nz,l8adah		;8ad3	20 05 	  . 
	ld a,(iy-04eh)		;8ad5	fd 7e b2 	. ~ . 
	jr l8addh		;8ad8	18 03 	. . 
l8adah:
	ld a,(iy-04fh)		;8ada	fd 7e b1 	. ~ . 
l8addh:
	ld (iy-039h),a		;8add	fd 77 c7 	. w . 
	ld (iy-03dh),001h		;8ae0	fd 36 c3 01 	. 6 . . 
	xor a			;8ae4	af 	. 
	ld (iy-03ch),a		;8ae5	fd 77 c4 	. w . 
	jp 00796h		;8ae8	c3 96 07 	. . . 
	dec c			;8aeb	0d 	. 
	ccf			;8aec	3f 	? 
	ld b,h			;8aed	44 	D 
	ld l,c			;8aee	69 	i 
	ld (hl),e			;8aef	73 	s 
	ld (hl),b			;8af0	70 	p 
	ld l,h			;8af1	6c 	l 
	ld h,c			;8af2	61 	a 
	ld a,c			;8af3	79 	y 
	jr nz,$+103		;8af4	20 65 	  e 
	ld (hl),d			;8af6	72 	r 
	ld (hl),d			;8af7	72 	r 
	ld l,a			;8af8	6f 	o 
	ld (hl),d			;8af9	72 	r 
	ccf			;8afa	3f 	? 
	ld a,(01ce4h)		;8afb	3a e4 1c 	: . . 
	ld c,a			;8afe	4f 	O 
	ld a,(01d10h)		;8aff	3a 10 1d 	: . . 
	cp c			;8b02	b9 	. 
	jp nz,00d4bh		;8b03	c2 4b 0d 	. K . 
	ld hl,(01d11h)		;8b06	2a 11 1d 	* . . 
	dec hl			;8b09	2b 	+ 
	ld (01d11h),hl		;8b0a	22 11 1d 	" . . 
	ld a,h			;8b0d	7c 	| 
	or l			;8b0e	b5 	. 
	ld hl,(01d05h)		;8b0f	2a 05 1d 	* . . 
	jr nz,l8b20h		;8b12	20 0c 	  . 
	ld (01d0fh),a		;8b14	32 0f 1d 	2 . . 
	ld hl,(01d0dh)		;8b17	2a 0d 1d 	* . . 
	ld (01cd2h),hl		;8b1a	22 d2 1c 	" . . 
	ld hl,(01d0bh)		;8b1d	2a 0b 1d 	* . . 
l8b20h:
	ld (01cd6h),hl		;8b20	22 d6 1c 	" . . 
	jp 00a09h		;8b23	c3 09 0a 	. . . 
	call 00906h		;8b26	cd 06 09 	. . . 
	cp 01bh		;8b29	fe 1b 	. . 
	jr nz,l8b34h		;8b2b	20 07 	  . 
	res 2,(iy-03ah)		;8b2d	fd cb c6 96 	. . . . 
	jp 00796h		;8b31	c3 96 07 	. . . 
l8b34h:
	ld b,a			;8b34	47 	G 
	cp 020h		;8b35	fe 20 	.   
	jr nz,l8b44h		;8b37	20 0b 	  . 
	ld a,(iy-042h)		;8b39	fd 7e be 	. ~ . 
	cp (iy-043h)		;8b3c	fd be bd 	. . . 
	ld a,00dh		;8b3f	3e 0d 	> . 
	jr nc,l8b34h		;8b41	30 f1 	0 . 
	ld a,b			;8b43	78 	x 
l8b44h:
	ld (001d4h),a		;8b44	32 d4 01 	2 . . 
	cp 019h		;8b47	fe 19 	. . 
	jr nz,l8b52h		;8b49	20 07 	  . 
	call 00906h		;8b4b	cd 06 09 	. . . 
	ld (001d8h),a		;8b4e	32 d8 01 	2 . . 
	ld a,b			;8b51	78 	x 
l8b52h:
	cp 01eh		;8b52	fe 1e 	. . 
	jr nz,l8b5dh		;8b54	20 07 	  . 
	call 00906h		;8b56	cd 06 09 	. . . 
	ld (001dch),a		;8b59	32 dc 01 	2 . . 
	ld a,b			;8b5c	78 	x 
l8b5dh:
	ld hl,00176h		;8b5d	21 76 01 	! v . 
l8b60h:
	ld a,(hl)			;8b60	7e 	~ 
	inc hl			;8b61	23 	# 
	or a			;8b62	b7 	. 
	jr z,l8b6ch		;8b63	28 07 	( . 
	cp b			;8b65	b8 	. 
	jr z,l8b6ch		;8b66	28 04 	( . 
	inc hl			;8b68	23 	# 
	inc hl			;8b69	23 	# 
	jr l8b60h		;8b6a	18 f4 	. . 
l8b6ch:
	ld e,(hl)			;8b6c	5e 	^ 
	inc hl			;8b6d	23 	# 
	ld d,(hl)			;8b6e	56 	V 
	ld hl,(01cceh)		;8b6f	2a ce 1c 	* . . 
	ld (01cd6h),hl		;8b72	22 d6 1c 	" . . 
l8b75h:
	ld a,(de)			;8b75	1a 	. 
	cp 0ffh		;8b76	fe ff 	. . 
	jr z,l8b7fh		;8b78	28 05 	( . 
	ld (hl),a			;8b7a	77 	w 
	inc hl			;8b7b	23 	# 
	inc de			;8b7c	13 	. 
	jr l8b75h		;8b7d	18 f6 	. . 
l8b7fh:
	ld (hl),01bh		;8b7f	36 1b 	6 . 
	inc hl			;8b81	23 	# 
	jp 009eah		;8b82	c3 ea 09 	. . . 
l8b85h:
	push hl			;8b85	e5 	. 
	ld hl,(01cd6h)		;8b86	2a d6 1c 	* . . 
	ex de,hl			;8b89	eb 	. 
	ld hl,(01cd2h)		;8b8a	2a d2 1c 	* . . 
	call 01a8bh		;8b8d	cd 8b 1a 	. . . 
	ex de,hl			;8b90	eb 	. 
	ld a,(hl)			;8b91	7e 	~ 
	inc hl			;8b92	23 	# 
	ld (01cd6h),hl		;8b93	22 d6 1c 	" . . 
	pop hl			;8b96	e1 	. 
	ret z			;8b97	c8 	. 
	call 01b50h		;8b98	cd 50 1b 	. P . 
	or a			;8b9b	b7 	. 
	jr z,l8b85h		;8b9c	28 e7 	( . 
	cp 00dh		;8b9e	fe 0d 	. . 
	jr z,l8b85h		;8ba0	28 e3 	( . 
	cp 01bh		;8ba2	fe 1b 	. . 
	jr z,l8b85h		;8ba4	28 df 	( . 
	cp 020h		;8ba6	fe 20 	.   
	jr z,l8b85h		;8ba8	28 db 	( . 
	cp 061h		;8baa	fe 61 	. a 
	jr c,l8bb4h		;8bac	38 06 	8 . 
	cp 07bh		;8bae	fe 7b 	. { 
	jr nc,l8bb4h		;8bb0	30 02 	0 . 
	sub 020h		;8bb2	d6 20 	.   
l8bb4h:
	or a			;8bb4	b7 	. 
	ret			;8bb5	c9 	. 
	cp 009h		;8bb6	fe 09 	. . 
	jp z,013dch		;8bb8	ca dc 13 	. . . 
	cp 03ch		;8bbb	fe 3c 	. < 
	jp z,00de5h		;8bbd	ca e5 0d 	. . . 
	cp 03eh		;8bc0	fe 3e 	. > 
	jp z,00e10h		;8bc2	ca 10 0e 	. . . 
	cp 042h		;8bc5	fe 42 	. B 
	jp z,01424h		;8bc7	ca 24 14 	. $ . 
	cp 043h		;8bca	fe 43 	. C 
	jp z,00e39h		;8bcc	ca 39 0e 	. 9 . 
	cp 044h		;8bcf	fe 44 	. D 
	jp z,00e39h		;8bd1	ca 39 0e 	. 9 . 
	cp 045h		;8bd4	fe 45 	. E 
	jp z,01439h		;8bd6	ca 39 14 	. 9 . 
	cp 046h		;8bd9	fe 46 	. F 
	jp z,01309h		;8bdb	ca 09 13 	. . . 
	cp 047h		;8bde	fe 47 	. G 
	jp z,017d3h		;8be0	ca d3 17 	. . . 
	cp 049h		;8be3	fe 49 	. I 
	jp z,013e3h		;8be5	ca e3 13 	. . . 
	cp 04bh		;8be8	fe 4b 	. K 
	jp z,01360h		;8bea	ca 60 13 	. ` . 
	cp 04ch		;8bed	fe 4c 	. L 
	jp z,01360h		;8bef	ca 60 13 	. ` . 
	cp 04dh		;8bf2	fe 4d 	. M 
	jp z,016cah		;8bf4	ca ca 16 	. . . 
	cp 04eh		;8bf7	fe 4e 	. N 
	jp z,017aah		;8bf9	ca aa 17 	. . . 
	cp 050h		;8bfc	fe 50 	. P 
	jp z,01360h		;8bfe	ca 60 13 	. ` . 
	cp 052h		;8c01	fe 52 	. R 
	jp z,016fch		;8c03	ca fc 16 	. . . 
	cp 053h		;8c06	fe 53 	. S 
	jp z,01360h		;8c08	ca 60 13 	. ` . 
	cp 054h		;8c0b	fe 54 	. T 
	jp z,01360h		;8c0d	ca 60 13 	. ` . 
	cp 057h		;8c10	fe 57 	. W 
	jp z,01360h		;8c12	ca 60 13 	. ` . 
	cp 058h		;8c15	fe 58 	. X 
	jp z,01837h		;8c17	ca 37 18 	. 7 . 
	cp 05ah		;8c1a	fe 5a 	. Z 
	jp z,01412h		;8c1c	ca 12 14 	. . . 
	cp 04fh		;8c1f	fe 4f 	. O 
	jp z,00e9fh		;8c21	ca 9f 0e 	. . . 
	cp 055h		;8c24	fe 55 	. U 
	jp z,00efch		;8c26	ca fc 0e 	. . . 
	cp 059h		;8c29	fe 59 	. Y 
	jp z,00f02h		;8c2b	ca 02 0f 	. . . 
	cp 051h		;8c2e	fe 51 	. Q 
	jp z,00fb1h		;8c30	ca b1 0f 	. . . 
	cp 05eh		;8c33	fe 5e 	. ^ 
	jp z,00ed8h		;8c35	ca d8 0e 	. . . 
	jp 00d43h		;8c38	c3 43 0d 	. C . 
	ld hl,01ac6h		;8c3b	21 c6 1a 	! . . 
	ld bc,0000dh		;8c3e	01 0d 00 	. . . 
	jr l8c79h		;8c41	18 36 	. 6 
	ld hl,01ad3h		;8c43	21 d3 1a 	! . . 
	ld bc,0000ch		;8c46	01 0c 00 	. . . 
	jr l8c79h		;8c49	18 2e 	. . 
	ld hl,01aefh		;8c4b	21 ef 1a 	! . . 
	ld bc,00010h		;8c4e	01 10 00 	. . . 
	jr l8c79h		;8c51	18 26 	. & 
	ld hl,01adfh		;8c53	21 df 1a 	! . . 
	ld bc,00010h		;8c56	01 10 00 	. . . 
	jr l8c79h		;8c59	18 1e 	. . 
	ld hl,01affh		;8c5b	21 ff 1a 	! . . 
	ld bc,00008h		;8c5e	01 08 00 	. . . 
	jr l8c79h		;8c61	18 16 	. . 
	ld hl,01b07h		;8c63	21 07 1b 	! . . 
	ld bc,0000ch		;8c66	01 0c 00 	. . . 
	jr l8c79h		;8c69	18 0e 	. . 
	ld hl,01b13h		;8c6b	21 13 1b 	! . . 
	ld bc,00008h		;8c6e	01 08 00 	. . . 
	jr l8c79h		;8c71	18 06 	. . 
	ld hl,01b1bh		;8c73	21 1b 1b 	! . . 
	ld bc,0000bh		;8c76	01 0b 00 	. . . 
l8c79h:
	call 018eeh		;8c79	cd ee 18 	. . . 
	ld hl,01b2fh		;8c7c	21 2f 1b 	! / . 
	ld bc,00002h		;8c7f	01 02 00 	. . . 
	ld a,(01d0fh)		;8c82	3a 0f 1d 	: . . 
	or a			;8c85	b7 	. 
	jr z,l8c8eh		;8c86	28 06 	( . 
	ld hl,01b26h		;8c88	21 26 1b 	! & . 
	ld bc,0000bh		;8c8b	01 0b 00 	. . . 
l8c8eh:
	call 018eeh		;8c8e	cd ee 18 	. . . 
	ld hl,(01cd0h)		;8c91	2a d0 1c 	* . . 
	ex de,hl			;8c94	eb 	. 
	ld hl,(01cd2h)		;8c95	2a d2 1c 	* . . 
	call 018e9h		;8c98	cd e9 18 	. . . 
	call 0187fh		;8c9b	cd 7f 18 	.  . 
	jp 00aa1h		;8c9e	c3 a1 0a 	. . . 
	ld hl,(01d15h)		;8ca1	2a 15 1d 	* . . 
	ld de,(01d13h)		;8ca4	ed 5b 13 1d 	. [ . . 
	call 01a8bh		;8ca8	cd 8b 1a 	. . . 
	jr z,l8cd2h		;8cab	28 25 	( % 
	ld de,00000h		;8cad	11 00 00 	. . . 
	call 01a31h		;8cb0	cd 31 1a 	. 1 . 
	call 01a8bh		;8cb3	cd 8b 1a 	. . . 
	jr z,l8cd2h		;8cb6	28 1a 	( . 
	ld b,c			;8cb8	41 	A 
	ld c,000h		;8cb9	0e 00 	. . 
l8cbbh:
	ld a,(de)			;8cbb	1a 	. 
	inc de			;8cbc	13 	. 
	inc c			;8cbd	0c 	. 
	cp 009h		;8cbe	fe 09 	. . 
	jr nz,l8ccbh		;8cc0	20 09 	  . 
l8cc2h:
	ld a,c			;8cc2	79 	y 
	and (iy-04ah)		;8cc3	fd a6 b6 	. . . 
	jr z,l8cd0h		;8cc6	28 08 	( . 
	inc c			;8cc8	0c 	. 
	jr l8cc2h		;8cc9	18 f7 	. . 
l8ccbh:
	cp 020h		;8ccb	fe 20 	.   
	jr nc,l8cd0h		;8ccd	30 01 	0 . 
	inc c			;8ccf	0c 	. 
l8cd0h:
	djnz l8cbbh		;8cd0	10 e9 	. . 
l8cd2h:
	ld a,c			;8cd2	79 	y 
	sub (iy-046h)		;8cd3	fd 96 ba 	. . . 
	jr nc,l8cd9h		;8cd6	30 01 	0 . 
	xor a			;8cd8	af 	. 
l8cd9h:
	and (iy-045h)		;8cd9	fd a6 bb 	. . . 
	ld (iy-048h),a		;8cdc	fd 77 b8 	. w . 
	add a,028h		;8cdf	c6 28 	. ( 
	ld (iy-047h),a		;8ce1	fd 77 b9 	. w . 
	ret			;8ce4	c9 	. 
	call 01a62h		;8ce5	cd 62 1a 	. b . 
	ld a,(01ce4h)		;8ce8	3a e4 1c 	: . . 
	cp 008h		;8ceb	fe 08 	. . 
	jp nc,00d4bh		;8ced	d2 4b 0d 	. K . 
	ld l,a			;8cf0	6f 	o 
	ld h,000h		;8cf1	26 00 	& . 
	inc a			;8cf3	3c 	< 
	ld (01ce4h),a		;8cf4	32 e4 1c 	2 . . 
	add hl,hl			;8cf7	29 	) 
	add hl,hl			;8cf8	29 	) 
	ld de,01ce5h		;8cf9	11 e5 1c 	. . . 
	add hl,de			;8cfc	19 	. 
	ex de,hl			;8cfd	eb 	. 
	ld hl,(01cd9h)		;8cfe	2a d9 1c 	* . . 
	ex de,hl			;8d01	eb 	. 
	inc d			;8d02	14 	. 
	ld (hl),e			;8d03	73 	s 
	inc hl			;8d04	23 	# 
	ld (hl),d			;8d05	72 	r 
	ex de,hl			;8d06	eb 	. 
	ld hl,(01cd6h)		;8d07	2a d6 1c 	* . . 
	ex de,hl			;8d0a	eb 	. 
	inc hl			;8d0b	23 	# 
	ld (hl),e			;8d0c	73 	s 
	inc hl			;8d0d	23 	# 
	ld (hl),d			;8d0e	72 	r 
	ret			;8d0f	c9 	. 
	call 01a72h		;8d10	cd 72 1a 	. r . 
	ld a,(01ce4h)		;8d13	3a e4 1c 	: . . 
	or a			;8d16	b7 	. 
	jp z,00d4bh		;8d17	ca 4b 0d 	. K . 
	ld l,a			;8d1a	6f 	o 
	dec l			;8d1b	2d 	- 
	ld h,000h		;8d1c	26 00 	& . 
	add hl,hl			;8d1e	29 	) 
	add hl,hl			;8d1f	29 	) 
	ld de,01ce5h		;8d20	11 e5 1c 	. . . 
	add hl,de			;8d23	19 	. 
	dec (hl)			;8d24	35 	5 
	inc hl			;8d25	23 	# 
	jr nz,l8d30h		;8d26	20 08 	  . 
sub_8d28h:
	dec (hl)			;8d28	35 	5 
	jr nz,l8d30h		;8d29	20 05 	  . 
	dec a			;8d2b	3d 	= 
	ld (01ce4h),a		;8d2c	32 e4 1c 	2 . . 
	ret			;8d2f	c9 	. 
l8d30h:
	inc hl			;8d30	23 	# 
	ld e,(hl)			;8d31	5e 	^ 
	inc hl			;8d32	23 	# 
	ld d,(hl)			;8d33	56 	V 
	ex de,hl			;8d34	eb 	. 
	ld (01cd6h),hl		;8d35	22 d6 1c 	" . . 
	ret			;8d38	c9 	. 
	ld hl,(01cd9h)		;8d39	2a d9 1c 	* . . 
	ld a,h			;8d3c	7c 	| 
	or l			;8d3d	b5 	. 
	ret z			;8d3e	c8 	. 
	ld a,(01cdbh)		;8d3f	3a db 1c 	: . . 
	or a			;8d42	b7 	. 
	jr nz,l8d71h		;8d43	20 2c 	  , 
	ld hl,(01d17h)		;8d45	2a 17 1d 	* . . 
	ex de,hl			;8d48	eb 	. 
	push de			;8d49	d5 	. 
	ld hl,(01cd9h)		;8d4a	2a d9 1c 	* . . 
	add hl,de			;8d4d	19 	. 
	ex de,hl			;8d4e	eb 	. 
	ld hl,(01d19h)		;8d4f	2a 19 1d 	* . . 
	jr c,l8d5bh		;8d52	38 07 	8 . 
	ld a,l			;8d54	7d 	} 
	sub e			;8d55	93 	. 
	ld a,h			;8d56	7c 	| 
	sbc a,d			;8d57	9a 	. 
	jr c,l8d5bh		;8d58	38 01 	8 . 
	ex de,hl			;8d5a	eb 	. 
l8d5bh:
	pop de			;8d5b	d1 	. 
	ld a,(01cd8h)		;8d5c	3a d8 1c 	: . . 
	cp 043h		;8d5f	fe 43 	. C 
	jp z,01419h		;8d61	ca 19 14 	. . . 
	cp 044h		;8d64	fe 44 	. D 
	jp z,01420h		;8d66	ca 20 14 	.   . 
	cp 058h		;8d69	fe 58 	. X 
	jp z,01420h		;8d6b	ca 20 14 	.   . 
	jp 00d53h		;8d6e	c3 53 0d 	. S . 
l8d71h:
	ld hl,(01cd9h)		;8d71	2a d9 1c 	* . . 
	ex de,hl			;8d74	eb 	. 
	ld hl,(01d15h)		;8d75	2a 15 1d 	* . . 
	push hl			;8d78	e5 	. 
	or a			;8d79	b7 	. 
	sbc hl,de		;8d7a	ed 52 	. R 
	ex de,hl			;8d7c	eb 	. 
	ld hl,(01d13h)		;8d7d	2a 13 1d 	* . . 
	jr c,l8d88h		;8d80	38 06 	8 . 
	ld a,l			;8d82	7d 	} 
	sub e			;8d83	93 	. 
	ld a,h			;8d84	7c 	| 
	sbc a,d			;8d85	9a 	. 
	jr c,l8d89h		;8d86	38 01 	8 . 
l8d88h:
	ex de,hl			;8d88	eb 	. 
l8d89h:
	pop hl			;8d89	e1 	. 
	ld a,(01cd8h)		;8d8a	3a d8 1c 	: . . 
	cp 043h		;8d8d	fe 43 	. C 
	jp z,0142bh		;8d8f	ca 2b 14 	. + . 
	cp 044h		;8d92	fe 44 	. D 
	jp z,01432h		;8d94	ca 32 14 	. 2 . 
	cp 058h		;8d97	fe 58 	. X 
	jp z,01432h		;8d99	ca 32 14 	. 2 . 
	jp 00d53h		;8d9c	c3 53 0d 	. S . 
	call 01a72h		;8d9f	cd 72 1a 	. r . 
	ld de,(01d17h)		;8da2	ed 5b 17 1d 	. [ . . 
	ld hl,(01d19h)		;8da6	2a 19 1d 	* . . 
	call 01a8bh		;8da9	cd 8b 1a 	. . . 
	ret z			;8dac	c8 	. 
	ld a,(de)			;8dad	1a 	. 
	call 01b50h		;8dae	cd 50 1b 	. P . 
	inc de			;8db1	13 	. 
	ld (01d17h),de		;8db2	ed 53 17 1d 	. S . . 
	cp 061h		;8db6	fe 61 	. a 
	jr c,l8dc2h		;8db8	38 08 	8 . 
	cp 07bh		;8dba	fe 7b 	. { 
	jr nc,l8dcch		;8dbc	30 0e 	0 . 
	sub 020h		;8dbe	d6 20 	.   
	jr l8dcch		;8dc0	18 0a 	. . 
l8dc2h:
	cp 041h		;8dc2	fe 41 	. A 
	jr c,l8dcch		;8dc4	38 06 	8 . 
	cp 05bh		;8dc6	fe 5b 	. [ 
	jr nc,l8dcch		;8dc8	30 02 	0 . 
	add a,020h		;8dca	c6 20 	.   
l8dcch:
	ld hl,(01d15h)		;8dcc	2a 15 1d 	* . . 
	call 01b31h		;8dcf	cd 31 1b 	. 1 . 
	ld (hl),a			;8dd2	77 	w 
	inc hl			;8dd3	23 	# 
	ld (01d15h),hl		;8dd4	22 15 1d 	" . . 
	ret			;8dd7	c9 	. 
	call 01a72h		;8dd8	cd 72 1a 	. r . 
	ld hl,(01d17h)		;8ddb	2a 17 1d 	* . . 
	ld de,(01d15h)		;8dde	ed 5b 15 1d 	. [ . . 
	call 01a8bh		;8de2	cd 8b 1a 	. . . 
	jp c,00d5bh		;8de5	da 5b 0d 	. [ . 
	ld hl,(01cd6h)		;8de8	2a d6 1c 	* . . 
	ld a,(hl)			;8deb	7e 	~ 
	inc hl			;8dec	23 	# 
	ld (01cd6h),hl		;8ded	22 d6 1c 	" . . 
	call 01b50h		;8df0	cd 50 1b 	. P . 
	and 01fh		;8df3	e6 1f 	. . 
	ld (de),a			;8df5	12 	. 
	inc de			;8df6	13 	. 
	ld (01d15h),de		;8df7	ed 53 15 1d 	. S . . 
	ret			;8dfb	c9 	. 
	ld (iy-03ch),000h		;8dfc	fd 36 c4 00 	. 6 . . 
	jr l8e06h		;8e00	18 04 	. . 
	ld (iy-03ch),0ffh		;8e02	fd 36 c4 ff 	. 6 . . 
l8e06h:
	ld hl,(01cd9h)		;8e06	2a d9 1c 	* . . 
	dec hl			;8e09	2b 	+ 
	ld a,h			;8e0a	7c 	| 
	or l			;8e0b	b5 	. 
	jp nz,00d3bh		;8e0c	c2 3b 0d 	. ; . 
	ld a,(01cdbh)		;8e0f	3a db 1c 	: . . 
	or a			;8e12	b7 	. 
	jr nz,l8e38h		;8e13	20 23 	  # 
	ld de,(01d17h)		;8e15	ed 5b 17 1d 	. [ . . 
	ld hl,(01d19h)		;8e19	2a 19 1d 	* . . 
	call 01a8bh		;8e1c	cd 8b 1a 	. . . 
	ret z			;8e1f	c8 	. 
	ex de,hl			;8e20	eb 	. 
	ld de,00001h		;8e21	11 01 00 	. . . 
	inc bc			;8e24	03 	. 
	call 00f65h		;8e25	cd 65 0f 	. e . 
	jr nz,l8e5dh		;8e28	20 33 	  3 
	ld de,(01d17h)		;8e2a	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;8e2e	cd 8b 1a 	. . . 
	ld (01d17h),hl		;8e31	22 17 1d 	" . . 
	call 01aa3h		;8e34	cd a3 1a 	. . . 
	ret			;8e37	c9 	. 
l8e38h:
	ld de,(01d13h)		;8e38	ed 5b 13 1d 	. [ . . 
	ld hl,(01d15h)		;8e3c	2a 15 1d 	* . . 
	call 01a8bh		;8e3f	cd 8b 1a 	. . . 
	ret z			;8e42	c8 	. 
	ld de,0ffffh		;8e43	11 ff ff 	. . . 
	dec hl			;8e46	2b 	+ 
	inc bc			;8e47	03 	. 
	call 00f65h		;8e48	cd 65 0f 	. e . 
	inc hl			;8e4b	23 	# 
	jr nz,l8e61h		;8e4c	20 13 	  . 
	ex de,hl			;8e4e	eb 	. 
	ld hl,(01d15h)		;8e4f	2a 15 1d 	* . . 
	ld (01d15h),de		;8e52	ed 53 15 1d 	. S . . 
	call 01a8bh		;8e56	cd 8b 1a 	. . . 
	call 01a93h		;8e59	cd 93 1a 	. . . 
	ret			;8e5c	c9 	. 
l8e5dh:
	ld (01d17h),hl		;8e5d	22 17 1d 	" . . 
	ret			;8e60	c9 	. 
l8e61h:
	ld (01d15h),hl		;8e61	22 15 1d 	" . . 
	ret			;8e64	c9 	. 
l8e65h:
	call 00f91h		;8e65	cd 91 0f 	. . . 
	jr c,l8e8ch		;8e68	38 22 	8 " 
	call 00f9ch		;8e6a	cd 9c 0f 	. . . 
	jr c,l8e65h		;8e6d	38 f6 	8 . 
l8e6fh:
	call 00f91h		;8e6f	cd 91 0f 	. . . 
	jr c,l8e8ch		;8e72	38 18 	8 . 
	call 00f9ch		;8e74	cd 9c 0f 	. . . 
	jr nc,l8e6fh		;8e77	30 f6 	0 . 
	bit 1,(iy-03ah)		;8e79	fd cb c6 4e 	. . . N 
	jr nz,l8e89h		;8e7d	20 0a 	  . 
l8e7fh:
	call 00f91h		;8e7f	cd 91 0f 	. . . 
	jr c,l8e8ch		;8e82	38 08 	8 . 
	call 00f9ch		;8e84	cd 9c 0f 	. . . 
	jr c,l8e7fh		;8e87	38 f6 	8 . 
l8e89h:
	or a			;8e89	b7 	. 
	sbc hl,de		;8e8a	ed 52 	. R 
l8e8ch:
	ld a,(iy-03ch)		;8e8c	fd 7e c4 	. ~ . 
	or a			;8e8f	b7 	. 
	ret			;8e90	c9 	. 
	dec bc			;8e91	0b 	. 
	ld a,b			;8e92	78 	x 
	or c			;8e93	b1 	. 
	jr z,l8e9ah		;8e94	28 04 	( . 
	ld a,(hl)			;8e96	7e 	~ 
	add hl,de			;8e97	19 	. 
	or a			;8e98	b7 	. 
	ret			;8e99	c9 	. 
l8e9ah:
	scf			;8e9a	37 	7 
	ret			;8e9b	c9 	. 
	ret z			;8e9c	c8 	. 
	sub 030h		;8e9d	d6 30 	. 0 
	ret c			;8e9f	d8 	. 
	sub 00ah		;8ea0	d6 0a 	. . 
	jr c,l8eafh		;8ea2	38 0b 	8 . 
	sub 007h		;8ea4	d6 07 	. . 
l8ea6h:
	ret c			;8ea6	d8 	. 
	sub 01ah		;8ea7	d6 1a 	. . 
	jr c,l8eafh		;8ea9	38 04 	8 . 
	sub 006h		;8eab	d6 06 	. . 
	jr l8ea6h		;8ead	18 f7 	. . 
l8eafh:
	or a			;8eaf	b7 	. 
	ret			;8eb0	c9 	. 
	call 00c85h		;8eb1	cd 85 0c 	. . . 
	jp z,00d43h		;8eb4	ca 43 0d 	. C . 
	cp 044h		;8eb7	fe 44 	. D 
	jr z,l8f29h		;8eb9	28 6e 	( n 
	cp 04dh		;8ebb	fe 4d 	. M 
	jp z,010dah		;8ebd	ca da 10 	. . . 
	cp 043h		;8ec0	fe 43 	. C 
	jp z,0107fh		;8ec2	ca 7f 10 	.  . 
	cp 04bh		;8ec5	fe 4b 	. K 
	jp z,011e6h		;8ec7	ca e6 11 	. . . 
	cp 055h		;8eca	fe 55 	. U 
	jp z,012d8h		;8ecc	ca d8 12 	. . . 
	cp 053h		;8ecf	fe 53 	. S 
	jr z,l8f0dh		;8ed1	28 3a 	( : 
	cp 04ch		;8ed3	fe 4c 	. L 
	jp z,01279h		;8ed5	ca 79 12 	. y . 
	cp 045h		;8ed8	fe 45 	. E 
	jp z,01251h		;8eda	ca 51 12 	. Q . 
	cp 052h		;8edd	fe 52 	. R 
	jp z,01261h		;8edf	ca 61 12 	. a . 
	cp 058h		;8ee2	fe 58 	. X 
	jp z,01008h		;8ee4	ca 08 10 	. . . 
	cp 046h		;8ee7	fe 46 	. F 
	jp z,014cfh		;8ee9	ca cf 14 	. . . 
	cp 050h		;8eec	fe 50 	. P 
	jp z,01e2fh		;8eee	ca 2f 1e 	. / . 
	cp 02ah		;8ef1	fe 2a 	. * 
	jp z,02850h		;8ef3	ca 50 28 	. P ( 
	cp 057h		;8ef6	fe 57 	. W 
	jp z,01e33h		;8ef8	ca 33 1e 	. 3 . 
	cp 054h		;8efb	fe 54 	. T 
	jp z,01e3dh		;8efd	ca 3d 1e 	. = . 
	cp 056h		;8f00	fe 56 	. V 
	jp z,01e28h		;8f02	ca 28 1e 	. ( . 
	jp 00d43h		;8f05	c3 43 0d 	. C . 
	set 4,(iy-03ah)		;8f08	fd cb c6 e6 	. . . . 
	ret			;8f0c	c9 	. 
l8f0dh:
	ld hl,(01cd9h)		;8f0d	2a d9 1c 	* . . 
	ld a,h			;8f10	7c 	| 
	or a			;8f11	b7 	. 
	jr nz,l8f25h		;8f12	20 11 	  . 
	ld a,l			;8f14	7d 	} 
	cp 014h		;8f15	fe 14 	. . 
	jr c,l8f21h		;8f17	38 08 	8 . 
	cp 0c8h		;8f19	fe c8 	. . 
	jr nc,l8f25h		;8f1b	30 08 	0 . 
l8f1dh:
	ld (iy-043h),a		;8f1d	fd 77 bd 	. w . 
	ret			;8f20	c9 	. 
l8f21h:
	ld a,014h		;8f21	3e 14 	> . 
	jr l8f1dh		;8f23	18 f8 	. . 
l8f25h:
	ld a,0c8h		;8f25	3e c8 	> . 
	jr l8f1dh		;8f27	18 f4 	. . 
l8f29h:
	ld hl,(01cd9h)		;8f29	2a d9 1c 	* . . 
	ld a,h			;8f2c	7c 	| 
	or l			;8f2d	b5 	. 
	jr z,l8f3ah		;8f2e	28 0a 	( . 
	ld a,(01cdbh)		;8f30	3a db 1c 	: . . 
	or a			;8f33	b7 	. 
	jr nz,l8f3dh		;8f34	20 07 	  . 
	call 01041h		;8f36	cd 41 10 	. A . 
	ret			;8f39	c9 	. 
l8f3ah:
	call 01041h		;8f3a	cd 41 10 	. A . 
l8f3dh:
	call 01060h		;8f3d	cd 60 10 	. ` . 
	ret			;8f40	c9 	. 
	ld hl,(01d19h)		;8f41	2a 19 1d 	* . . 
	ld de,(01d17h)		;8f44	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;8f48	cd 8b 1a 	. . . 
	ret z			;8f4b	c8 	. 
	ld d,h			;8f4c	54 	T 
	ld e,l			;8f4d	5d 	] 
l8f4eh:
	dec hl			;8f4e	2b 	+ 
	ld a,(hl)			;8f4f	7e 	~ 
	cp 080h		;8f50	fe 80 	. . 
	jr z,l8f56h		;8f52	28 02 	( . 
	dec de			;8f54	1b 	. 
	ld (de),a			;8f55	12 	. 
l8f56h:
	dec bc			;8f56	0b 	. 
	ld a,b			;8f57	78 	x 
	or c			;8f58	b1 	. 
	jr nz,l8f4eh		;8f59	20 f3 	  . 
	ld (01d17h),de		;8f5b	ed 53 17 1d 	. S . . 
	ret			;8f5f	c9 	. 
	ld hl,(01d15h)		;8f60	2a 15 1d 	* . . 
	ld de,(01d13h)		;8f63	ed 5b 13 1d 	. [ . . 
	call 01a8bh		;8f67	cd 8b 1a 	. . . 
	ret z			;8f6a	c8 	. 
	ld h,d			;8f6b	62 	b 
	ld l,e			;8f6c	6b 	k 
l8f6dh:
	ld a,(hl)			;8f6d	7e 	~ 
	cp 080h		;8f6e	fe 80 	. . 
	jr z,l8f74h		;8f70	28 02 	( . 
	ld (de),a			;8f72	12 	. 
	inc de			;8f73	13 	. 
l8f74h:
	inc hl			;8f74	23 	# 
	dec bc			;8f75	0b 	. 
	ld a,b			;8f76	78 	x 
	or c			;8f77	b1 	. 
	jr nz,l8f6dh		;8f78	20 f3 	  . 
	ld (01d15h),de		;8f7a	ed 53 15 1d 	. S . . 
	ret			;8f7e	c9 	. 
	call 01a72h		;8f7f	cd 72 1a 	. r . 
	ld hl,(01d15h)		;8f82	2a 15 1d 	* . . 
	ld de,(01d13h)		;8f85	ed 5b 13 1d 	. [ . . 
	call 0118ah		;8f89	cd 8a 11 	. . . 
	jr c,l8fc9h		;8f8c	38 3b 	8 ; 
	jr z,l8fbbh		;8f8e	28 2b 	( + 
l8f90h:
	ld hl,(01d17h)		;8f90	2a 17 1d 	* . . 
	ld de,(01d15h)		;8f93	ed 5b 15 1d 	. [ . . 
	call 01a8bh		;8f97	cd 8b 1a 	. . . 
	jp z,00d5bh		;8f9a	ca 5b 0d 	. [ . 
	ld hl,(01d1bh)		;8f9d	2a 1b 1d 	* . . 
	sbc hl,bc		;8fa0	ed 42 	. B 
	jp nc,00d5bh		;8fa2	d2 5b 0d 	. [ . 
	ld hl,(01d1fh)		;8fa5	2a 1f 1d 	* . . 
	inc hl			;8fa8	23 	# 
	ld bc,(01d1bh)		;8fa9	ed 4b 1b 1d 	. K . . 
	ld a,b			;8fad	78 	x 
	or c			;8fae	b1 	. 
	ret z			;8faf	c8 	. 
	ld de,(01d15h)		;8fb0	ed 5b 15 1d 	. [ . . 
	ldir		;8fb4	ed b0 	. . 
	ld (01d15h),de		;8fb6	ed 53 15 1d 	. S . . 
	ret			;8fba	c9 	. 
l8fbbh:
	ld hl,(01d19h)		;8fbb	2a 19 1d 	* . . 
	ld de,(01d17h)		;8fbe	ed 5b 17 1d 	. [ . . 
	call 0118ah		;8fc2	cd 8a 11 	. . . 
	jr c,l8fc9h		;8fc5	38 02 	8 . 
	jr nz,l8f90h		;8fc7	20 c7 	  . 
l8fc9h:
	ld hl,010d2h		;8fc9	21 d2 10 	! . . 
	ld bc,00008h		;8fcc	01 08 00 	. . . 
	jp 00d79h		;8fcf	c3 79 0d 	. y . 
	ccf			;8fd2	3f 	? 
	ld c,l			;8fd3	4d 	M 
	ld h,c			;8fd4	61 	a 
	ld (hl),d			;8fd5	72 	r 
	ld l,e			;8fd6	6b 	k 
	ld h,l			;8fd7	65 	e 
	ld (hl),d			;8fd8	72 	r 
	ld (hl),e			;8fd9	73 	s 
	call 01a72h		;8fda	cd 72 1a 	. r . 
	ld hl,(01d15h)		;8fdd	2a 15 1d 	* . . 
	ld de,(01d13h)		;8fe0	ed 5b 13 1d 	. [ . . 
	call 0118ah		;8fe4	cd 8a 11 	. . . 
	jr c,l8fc9h		;8fe7	38 e0 	8 . 
	jr z,l9026h		;8fe9	28 3b 	( ; 
l8febh:
	call 011b9h		;8feb	cd b9 11 	. . . 
	jr z,l900dh		;8fee	28 1d 	( . 
	ldir		;8ff0	ed b0 	. . 
	ex de,hl			;8ff2	eb 	. 
	ld hl,(01d15h)		;8ff3	2a 15 1d 	* . . 
	call 01a8bh		;8ff6	cd 8b 1a 	. . . 
	ld hl,(01d1fh)		;8ff9	2a 1f 1d 	* . . 
	inc hl			;8ffc	23 	# 
	ex de,hl			;8ffd	eb 	. 
	jr z,l9002h		;8ffe	28 02 	( . 
	ldir		;9000	ed b0 	. . 
l9002h:
	ld bc,(01d1dh)		;9002	ed 4b 1d 1d 	. K . . 
	ld hl,01d23h		;9006	21 23 1d 	! # . 
	ldir		;9009	ed b0 	. . 
	jr l8febh		;900b	18 de 	. . 
l900dh:
	ld de,(01d1fh)		;900d	ed 5b 1f 1d 	. [ . . 
	ld hl,(01d15h)		;9011	2a 15 1d 	* . . 
	dec hl			;9014	2b 	+ 
	dec hl			;9015	2b 	+ 
	call 01a8bh		;9016	cd 8b 1a 	. . . 
	ld h,d			;9019	62 	b 
	ld l,e			;901a	6b 	k 
	inc hl			;901b	23 	# 
	inc hl			;901c	23 	# 
	jr z,l9021h		;901d	28 02 	( . 
	ldir		;901f	ed b0 	. . 
l9021h:
	ld (01d15h),de		;9021	ed 53 15 1d 	. S . . 
	ret			;9025	c9 	. 
l9026h:
	ld hl,(01d19h)		;9026	2a 19 1d 	* . . 
	ld de,(01d17h)		;9029	ed 5b 17 1d 	. [ . . 
	call 0118ah		;902d	cd 8a 11 	. . . 
	jr c,l8fc9h		;9030	38 97 	8 . 
	jr z,l8fc9h		;9032	28 95 	( . 
l9034h:
	call 011b9h		;9034	cd b9 11 	. . . 
	jr z,l906bh		;9037	28 32 	( 2 
	ldir		;9039	ed b0 	. . 
	push hl			;903b	e5 	. 
	ld hl,(01d1fh)		;903c	2a 1f 1d 	* . . 
	inc hl			;903f	23 	# 
	ld de,(01d17h)		;9040	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;9044	cd 8b 1a 	. . . 
	pop hl			;9047	e1 	. 
	dec hl			;9048	2b 	+ 
	ld de,(01d1fh)		;9049	ed 5b 1f 1d 	. [ . . 
	ld (01d1fh),hl		;904d	22 1f 1d 	" . . 
	ex de,hl			;9050	eb 	. 
	lddr		;9051	ed b8 	. . 
	inc de			;9053	13 	. 
	ld (01d17h),de		;9054	ed 53 17 1d 	. S . . 
	ld de,(01d15h)		;9058	ed 5b 15 1d 	. [ . . 
	ld hl,01d23h		;905c	21 23 1d 	! # . 
	ld bc,(01d1dh)		;905f	ed 4b 1d 1d 	. K . . 
	ldir		;9063	ed b0 	. . 
	ld (01d15h),de		;9065	ed 53 15 1d 	. S . . 
	jr l9034h		;9069	18 c9 	. . 
l906bh:
	ld hl,(01d1fh)		;906b	2a 1f 1d 	* . . 
	ld de,(01d17h)		;906e	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;9072	cd 8b 1a 	. . . 
	jr z,l9087h		;9075	28 10 	( . 
	ld hl,(01d1fh)		;9077	2a 1f 1d 	* . . 
	dec hl			;907a	2b 	+ 
	ld de,(01d21h)		;907b	ed 5b 21 1d 	. [ ! . 
	lddr		;907f	ed b8 	. . 
l9081h:
	inc de			;9081	13 	. 
	ld (01d17h),de		;9082	ed 53 17 1d 	. S . . 
	ret			;9086	c9 	. 
l9087h:
	inc de			;9087	13 	. 
	jr l9081h		;9088	18 f7 	. . 
	call 01a8bh		;908a	cd 8b 1a 	. . . 
	ret z			;908d	c8 	. 
	ex de,hl			;908e	eb 	. 
l908fh:
	ld a,(hl)			;908f	7e 	~ 
	dec bc			;9090	0b 	. 
	cp 080h		;9091	fe 80 	. . 
	jr z,l909bh		;9093	28 06 	( . 
	inc hl			;9095	23 	# 
	ld a,b			;9096	78 	x 
	or c			;9097	b1 	. 
	jr nz,l908fh		;9098	20 f5 	  . 
	ret			;909a	c9 	. 
l909bh:
	ld (01d1fh),hl		;909b	22 1f 1d 	" . . 
	ld d,h			;909e	54 	T 
	ld e,l			;909f	5d 	] 
l90a0h:
	inc hl			;90a0	23 	# 
	ld a,b			;90a1	78 	x 
	or c			;90a2	b1 	. 
	jr nz,l90a7h		;90a3	20 02 	  . 
	scf			;90a5	37 	7 
	ret			;90a6	c9 	. 
l90a7h:
	ld a,(hl)			;90a7	7e 	~ 
	cp 080h		;90a8	fe 80 	. . 
	dec bc			;90aa	0b 	. 
	jr nz,l90a0h		;90ab	20 f3 	  . 
	ld (01d21h),hl		;90ad	22 21 1d 	" ! . 
	call 01a8bh		;90b0	cd 8b 1a 	. . . 
	dec bc			;90b3	0b 	. 
	ld (01d1bh),bc		;90b4	ed 43 1b 1d 	. C . . 
	ret			;90b8	c9 	. 
	ld hl,(01d1bh)		;90b9	2a 1b 1d 	* . . 
	ld bc,00032h		;90bc	01 32 00 	. 2 . 
	ld a,h			;90bf	7c 	| 
	or l			;90c0	b5 	. 
	ret z			;90c1	c8 	. 
	sbc hl,bc		;90c2	ed 42 	. B 
	jr c,l90d6h		;90c4	38 10 	8 . 
	ld (01d1dh),bc		;90c6	ed 43 1d 1d 	. C . . 
	ld (01d1bh),hl		;90ca	22 1b 1d 	" . . 
l90cdh:
	ld de,01d23h		;90cd	11 23 1d 	. # . 
	ld hl,(01d1fh)		;90d0	2a 1f 1d 	* . . 
	inc hl			;90d3	23 	# 
	or a			;90d4	b7 	. 
	ret			;90d5	c9 	. 
l90d6h:
	ld bc,(01d1bh)		;90d6	ed 4b 1b 1d 	. K . . 
	ld (01d1dh),bc		;90da	ed 43 1d 1d 	. C . . 
	ld hl,00000h		;90de	21 00 00 	! . . 
	ld (01d1bh),hl		;90e1	22 1b 1d 	" . . 
	jr l90cdh		;90e4	18 e7 	. . 
	call 01a72h		;90e6	cd 72 1a 	. r . 
	ld hl,(01d15h)		;90e9	2a 15 1d 	* . . 
	ld de,(01d13h)		;90ec	ed 5b 13 1d 	. [ . . 
	call 0118ah		;90f0	cd 8a 11 	. . . 
	jr c,l910ch		;90f3	38 17 	8 . 
	jr z,l912bh		;90f5	28 34 	( 4 
	inc hl			;90f7	23 	# 
	ex de,hl			;90f8	eb 	. 
	ld hl,(01d15h)		;90f9	2a 15 1d 	* . . 
	call 01a8bh		;90fc	cd 8b 1a 	. . . 
	ld hl,(01d1fh)		;90ff	2a 1f 1d 	* . . 
	ex de,hl			;9102	eb 	. 
	jr z,l9107h		;9103	28 02 	( . 
	ldir		;9105	ed b0 	. . 
l9107h:
	ld (01d15h),de		;9107	ed 53 15 1d 	. S . . 
	ret			;910b	c9 	. 
l910ch:
	ld (01cd9h),de		;910c	ed 53 d9 1c 	. S . . 
	ld hl,(01d19h)		;9110	2a 19 1d 	* . . 
	ld de,(01d17h)		;9113	ed 5b 17 1d 	. [ . . 
	call 0118ah		;9117	cd 8a 11 	. . . 
	jr c,l911fh		;911a	38 03 	8 . 
	jp z,010c9h		;911c	ca c9 10 	. . . 
l911fh:
	inc de			;911f	13 	. 
	ld (01d17h),de		;9120	ed 53 17 1d 	. S . . 
	ld hl,(01cd9h)		;9124	2a d9 1c 	* . . 
	ld (01d15h),hl		;9127	22 15 1d 	" . . 
	ret			;912a	c9 	. 
l912bh:
	ld hl,(01d19h)		;912b	2a 19 1d 	* . . 
	ld de,(01d17h)		;912e	ed 5b 17 1d 	. [ . . 
	call 0118ah		;9132	cd 8a 11 	. . . 
	jp c,010c9h		;9135	da c9 10 	. . . 
	jp z,010c9h		;9138	ca c9 10 	. . . 
	ld hl,(01d17h)		;913b	2a 17 1d 	* . . 
	ex de,hl			;913e	eb 	. 
	call 01a8bh		;913f	cd 8b 1a 	. . . 
	dec hl			;9142	2b 	+ 
	ld de,(01d21h)		;9143	ed 5b 21 1d 	. [ ! . 
	jr z,l914bh		;9147	28 02 	( . 
	lddr		;9149	ed b8 	. . 
l914bh:
	inc de			;914b	13 	. 
	ld (01d17h),de		;914c	ed 53 17 1d 	. S . . 
	ret			;9150	c9 	. 
	ld hl,01d69h		;9151	21 69 1d 	! i . 
	call 012e9h		;9154	cd e9 12 	. . . 
	ld de,00172h		;9157	11 72 01 	. r . 
	call 00255h		;915a	cd 55 02 	. U . 
	jp c,01bb6h		;915d	da b6 1b 	. . . 
	ret			;9160	c9 	. 
	ld hl,01d69h		;9161	21 69 1d 	! i . 
	call 012e9h		;9164	cd e9 12 	. . . 
	push hl			;9167	e5 	. 
	ld hl,01d7dh		;9168	21 7d 1d 	! } . 
	call 012e9h		;916b	cd e9 12 	. . . 
	pop bc			;916e	c1 	. 
	ld de,0016ah		;916f	11 6a 01 	. j . 
	call 00258h		;9172	cd 58 02 	. X . 
	jp c,01bb6h		;9175	da b6 1b 	. . . 
	ret			;9178	c9 	. 
	ld hl,00000h		;9179	21 00 00 	! . . 
	ld (01cd9h),hl		;917c	22 d9 1c 	" . . 
	call 01474h		;917f	cd 74 14 	. t . 
	ld hl,01d69h		;9182	21 69 1d 	! i . 
	call 012e9h		;9185	cd e9 12 	. . . 
	ld de,012d4h		;9188	11 d4 12 	. . . 
	call 0025bh		;918b	cd 5b 02 	. [ . 
	jp c,012bbh		;918e	da bb 12 	. . . 
l9191h:
	push hl			;9191	e5 	. 
	push de			;9192	d5 	. 
	call 01890h		;9193	cd 90 18 	. . . 
	ld a,03ah		;9196	3e 3a 	> : 
	call 01890h		;9198	cd 90 18 	. . . 
	ld h,b			;919b	60 	` 
	ld l,c			;919c	69 	i 
	ld bc,00008h		;919d	01 08 00 	. . . 
	call 018eeh		;91a0	cd ee 18 	. . . 
	ld a,020h		;91a3	3e 20 	>   
	call 01890h		;91a5	cd 90 18 	. . . 
	ld bc,00003h		;91a8	01 03 00 	. . . 
	call 018eeh		;91ab	cd ee 18 	. . . 
	ld a,00dh		;91ae	3e 0d 	> . 
	call 01890h		;91b0	cd 90 18 	. . . 
	pop de			;91b3	d1 	. 
	pop hl			;91b4	e1 	. 
	call 0025eh		;91b5	cd 5e 02 	. ^ . 
	jr nc,l9191h		;91b8	30 d7 	0 . 
	ret			;91ba	c9 	. 
	cp 007h		;91bb	fe 07 	. . 
	jp nz,01bb6h		;91bd	c2 b6 1b 	. . . 
	ld hl,012cah		;91c0	21 ca 12 	! . . 
	ld bc,0000ah		;91c3	01 0a 00 	. . . 
	call 018eeh		;91c6	cd ee 18 	. . . 
	ret			;91c9	c9 	. 
	ld c,(hl)			;91ca	4e 	N 
	ld l,a			;91cb	6f 	o 
	ld (hl),h			;91cc	74 	t 
	jr nz,$+72		;91cd	20 46 	  F 
	ld l,a			;91cf	6f 	o 
	ld (hl),l			;91d0	75 	u 
	ld l,(hl)			;91d1	6e 	n 
	ld h,h			;91d2	64 	d 
	dec c			;91d3	0d 	. 
	ld bc,03f3fh		;91d4	01 3f 3f 	. ? ? 
	ccf			;91d7	3f 	? 
	ld hl,(01cd9h)		;91d8	2a d9 1c 	* . . 
	ld a,h			;91db	7c 	| 
	or l			;91dc	b5 	. 
	jr z,l91e4h		;91dd	28 05 	( . 
	res 1,(iy-03ah)		;91df	fd cb c6 8e 	. . . . 
	ret			;91e3	c9 	. 
l91e4h:
	set 1,(iy-03ah)		;91e4	fd cb c6 ce 	. . . . 
	ret			;91e8	c9 	. 
	ld de,(01cd6h)		;91e9	ed 5b d6 1c 	. [ . . 
	push hl			;91ed	e5 	. 
l91eeh:
	ld a,(de)			;91ee	1a 	. 
	call 01b50h		;91ef	cd 50 1b 	. P . 
	inc de			;91f2	13 	. 
	cp 020h		;91f3	fe 20 	.   
	jr z,l91eeh		;91f5	28 f7 	( . 
	cp 03dh		;91f7	fe 3d 	. = 
	jr nz,l91fdh		;91f9	20 02 	  . 
	ld a,01bh		;91fb	3e 1b 	> . 
l91fdh:
	ld (hl),a			;91fd	77 	w 
	inc hl			;91fe	23 	# 
	cp 01bh		;91ff	fe 1b 	. . 
	jr nz,l91eeh		;9201	20 eb 	  . 
	ld (01cd6h),de		;9203	ed 53 d6 1c 	. S . . 
	pop hl			;9207	e1 	. 
	ret			;9208	c9 	. 
	call 01a62h		;9209	cd 62 1a 	. b . 
	call 01a4eh		;920c	cd 4e 1a 	. N . 
	ld (01cd6h),hl		;920f	22 d6 1c 	" . . 
	dec hl			;9212	2b 	+ 
	call 01a8bh		;9213	cd 8b 1a 	. . . 
	jr nz,l921ch		;9216	20 04 	  . 
	ld de,01437h		;9218	11 37 14 	. 7 . 
	inc bc			;921b	03 	. 
l921ch:
	ld (006e3h),bc		;921c	ed 43 e3 06 	. C . . 
	push de			;9220	d5 	. 
	ld hl,(01d17h)		;9221	2a 17 1d 	* . . 
	ex de,hl			;9224	eb 	. 
	ld hl,(01d19h)		;9225	2a 19 1d 	* . . 
	call 01a8bh		;9228	cd 8b 1a 	. . . 
	ex de,hl			;922b	eb 	. 
	pop de			;922c	d1 	. 
l922dh:
	push hl			;922d	e5 	. 
	push de			;922e	d5 	. 
	push bc			;922f	c5 	. 
l9230h:
	ld a,(de)			;9230	1a 	. 
	cp 01bh		;9231	fe 1b 	. . 
	jr z,l9243h		;9233	28 0e 	( . 
	ld a,b			;9235	78 	x 
	or c			;9236	b1 	. 
	jp z,00d73h		;9237	ca 73 0d 	. s . 
	ld a,(de)			;923a	1a 	. 
	cp (hl)			;923b	be 	. 
	inc hl			;923c	23 	# 
	inc de			;923d	13 	. 
	dec bc			;923e	0b 	. 
	jr z,l9230h		;923f	28 ef 	( . 
	jr l924fh		;9241	18 0c 	. . 
l9243h:
	ex de,hl			;9243	eb 	. 
	ld hl,(01cd9h)		;9244	2a d9 1c 	* . . 
	dec hl			;9247	2b 	+ 
	ld (01cd9h),hl		;9248	22 d9 1c 	" . . 
	ld a,h			;924b	7c 	| 
	or l			;924c	b5 	. 
	jr z,l9256h		;924d	28 07 	( . 
l924fh:
	pop bc			;924f	c1 	. 
	pop de			;9250	d1 	. 
	pop hl			;9251	e1 	. 
	inc hl			;9252	23 	# 
	dec bc			;9253	0b 	. 
	jr l922dh		;9254	18 d7 	. . 
l9256h:
	pop bc			;9256	c1 	. 
	pop bc			;9257	c1 	. 
	pop bc			;9258	c1 	. 
	ld hl,(01d17h)		;9259	2a 17 1d 	* . . 
	ex de,hl			;925c	eb 	. 
	jp 01419h		;925d	c3 19 14 	. . . 
	ld hl,(01cd9h)		;9260	2a d9 1c 	* . . 
	ld a,h			;9263	7c 	| 
	or l			;9264	b5 	. 
	jr z,l92a4h		;9265	28 3d 	( = 
	ld a,(01cdbh)		;9267	3a db 1c 	: . . 
	or a			;926a	b7 	. 
	jr nz,l92a4h		;926b	20 37 	  7 
	ld hl,(01d17h)		;926d	2a 17 1d 	* . . 
	ex de,hl			;9270	eb 	. 
	ld hl,(01d19h)		;9271	2a 19 1d 	* . . 
	call 01a8bh		;9274	cd 8b 1a 	. . . 
	jr z,l9280h		;9277	28 07 	( . 
	ld hl,(01cd9h)		;9279	2a d9 1c 	* . . 
	ex de,hl			;927c	eb 	. 
	call 01a22h		;927d	cd 22 1a 	. " . 
l9280h:
	ld a,(01cd8h)		;9280	3a d8 1c 	: . . 
	cp 04bh		;9283	fe 4b 	. K 
	jp z,01420h		;9285	ca 20 14 	.   . 
	cp 04ch		;9288	fe 4c 	. L 
	jp z,01419h		;928a	ca 19 14 	. . . 
	cp 053h		;928d	fe 53 	. S 
	jp z,017cdh		;928f	ca cd 17 	. . . 
	cp 054h		;9292	fe 54 	. T 
	jp z,017e3h		;9294	ca e3 17 	. . . 
	cp 050h		;9297	fe 50 	. P 
	jp z,017e7h		;9299	ca e7 17 	. . . 
	cp 057h		;929c	fe 57 	. W 
	jp z,017fah		;929e	ca fa 17 	. . . 
	jp 00d53h		;92a1	c3 53 0d 	. S . 
l92a4h:
	ld hl,(01d13h)		;92a4	2a 13 1d 	* . . 
	ex de,hl			;92a7	eb 	. 
	ld hl,(01d15h)		;92a8	2a 15 1d 	* . . 
	call 01a8bh		;92ab	cd 8b 1a 	. . . 
	jr z,l92b8h		;92ae	28 08 	( . 
	ex de,hl			;92b0	eb 	. 
	ld hl,(01cd9h)		;92b1	2a d9 1c 	* . . 
	ex de,hl			;92b4	eb 	. 
	call 01a31h		;92b5	cd 31 1a 	. 1 . 
l92b8h:
	ld a,(01cd8h)		;92b8	3a d8 1c 	: . . 
	cp 04bh		;92bb	fe 4b 	. K 
	jp z,01432h		;92bd	ca 32 14 	. 2 . 
	cp 04ch		;92c0	fe 4c 	. L 
	jp z,0142bh		;92c2	ca 2b 14 	. + . 
	cp 053h		;92c5	fe 53 	. S 
	jp z,017cdh		;92c7	ca cd 17 	. . . 
	cp 054h		;92ca	fe 54 	. T 
	jp z,017e3h		;92cc	ca e3 17 	. . . 
	cp 050h		;92cf	fe 50 	. P 
	jp z,017e7h		;92d1	ca e7 17 	. . . 
	cp 057h		;92d4	fe 57 	. W 
	jp z,0180ah		;92d6	ca 0a 18 	. . . 
	jp 00d53h		;92d9	c3 53 0d 	. S . 
	ld hl,(01cd6h)		;92dc	2a d6 1c 	* . . 
	dec hl			;92df	2b 	+ 
	ld (01cd6h),hl		;92e0	22 d6 1c 	" . . 
	call 01a72h		;92e3	cd 72 1a 	. r . 
	call 01a4eh		;92e6	cd 4e 1a 	. N . 
	ld (01cd6h),hl		;92e9	22 d6 1c 	" . . 
	dec hl			;92ec	2b 	+ 
	call 01a8bh		;92ed	cd 8b 1a 	. . . 
	jr nz,l92f6h		;92f0	20 04 	  . 
	inc bc			;92f2	03 	. 
	ld de,01437h		;92f3	11 37 14 	. 7 . 
l92f6h:
	push de			;92f6	d5 	. 
	ld hl,(01d15h)		;92f7	2a 15 1d 	* . . 
	ex de,hl			;92fa	eb 	. 
	ld hl,(01d17h)		;92fb	2a 17 1d 	* . . 
	or a			;92fe	b7 	. 
	sbc hl,de		;92ff	ed 52 	. R 
	pop de			;9301	d1 	. 
	jp c,00d53h		;9302	da 53 0d 	. S . 
	inc bc			;9305	03 	. 
	ld a,l			;9306	7d 	} 
	sub c			;9307	91 	. 
	ld a,h			;9308	7c 	| 
	sbc a,b			;9309	98 	. 
	jp c,00d5bh		;930a	da 5b 0d 	. [ . 
	dec bc			;930d	0b 	. 
	call 01aa3h		;930e	cd a3 1a 	. . . 
	ret			;9311	c9 	. 
	ld hl,(01d17h)		;9312	2a 17 1d 	* . . 
	ex de,hl			;9315	eb 	. 
	ld hl,(01d19h)		;9316	2a 19 1d 	* . . 
	call 01a8bh		;9319	cd 8b 1a 	. . . 
	ret z			;931c	c8 	. 
	call 01aa3h		;931d	cd a3 1a 	. . . 
	ld (01d17h),hl		;9320	22 17 1d 	" . . 
	ret			;9323	c9 	. 
	ld hl,(01d13h)		;9324	2a 13 1d 	* . . 
	ex de,hl			;9327	eb 	. 
	ld hl,(01d15h)		;9328	2a 15 1d 	* . . 
	call 01a8bh		;932b	cd 8b 1a 	. . . 
	ret z			;932e	c8 	. 
	call 01a93h		;932f	cd 93 1a 	. . . 
	ex de,hl			;9332	eb 	. 
	ld (01d15h),hl		;9333	22 15 1d 	" . . 
	ret			;9336	c9 	. 
	add a,b			;9337	80 	. 
	dec de			;9338	1b 	. 
	call 00c85h		;9339	cd 85 0c 	. . . 
	jp z,00d43h		;933c	ca 43 0d 	. C . 
	cp 049h		;933f	fe 49 	. I 
	jp z,0153bh		;9341	ca 3b 15 	. ; . 
	cp 04dh		;9344	fe 4d 	. M 
	jp z,01508h		;9346	ca 08 15 	. . . 
	cp 044h		;9349	fe 44 	. D 
	jp z,01474h		;934b	ca 74 14 	. t . 
	cp 058h		;934e	fe 58 	. X 
	jp z,0154eh		;9350	ca 4e 15 	. N . 
	cp 057h		;9353	fe 57 	. W 
	jp z,01697h		;9355	ca 97 16 	. . . 
	cp 052h		;9358	fe 52 	. R 
	jp z,01675h		;935a	ca 75 16 	. u . 
	cp 046h		;935d	fe 46 	. F 
	jp z,016bah		;935f	ca ba 16 	. . . 
	cp 054h		;9362	fe 54 	. T 
	jp z,014a2h		;9364	ca a2 14 	. . . 
	cp 04ch		;9367	fe 4c 	. L 
	jp z,014d6h		;9369	ca d6 14 	. . . 
	cp 042h		;936c	fe 42 	. B 
	jp z,015f6h		;936e	ca f6 15 	. . . 
	jp 00d43h		;9371	c3 43 0d 	. C . 
	ld hl,(01cd9h)		;9374	2a d9 1c 	* . . 
	ld a,h			;9377	7c 	| 
	or l			;9378	b5 	. 
	jr z,l9391h		;9379	28 16 	( . 
	rst 30h			;937b	f7 	. 
	dec c			;937c	0d 	. 
	ld b,028h		;937d	06 28 	. ( 
	ld hl,0f4c0h		;937f	21 c0 f4 	! . . 
	call 01b73h		;9382	cd 73 1b 	. s . 
l9385h:
	ld (hl),08ch		;9385	36 8c 	6 . 
	inc hl			;9387	23 	# 
	djnz l9385h		;9388	10 fb 	. . 
	rst 30h			;938a	f7 	. 
	inc c			;938b	0c 	. 
	set 3,(iy-03ah)		;938c	fd cb c6 de 	. . . . 
	ret			;9390	c9 	. 
l9391h:
	rst 30h			;9391	f7 	. 
	ld c,021h		;9392	0e 21 	. ! 
	ld b,h			;9394	44 	D 
	add hl,bc			;9395	09 	. 
	ld (00942h),hl		;9396	22 42 09 	" B . 
	res 3,(iy-03ah)		;9399	fd cb c6 9e 	. . . . 
	res 2,(iy-03ah)		;939d	fd cb c6 96 	. . . . 
	ret			;93a1	c9 	. 
	xor a			;93a2	af 	. 
	ld c,a			;93a3	4f 	O 
	ld b,a			;93a4	47 	G 
	add a,h			;93a5	84 	. 
	jr nz,l93cch		;93a6	20 24 	  $ 
	add a,l			;93a8	85 	. 
	jr z,l93b7h		;93a9	28 0c 	( . 
	inc b			;93ab	04 	. 
	rr a		;93ac	cb 1f 	. . 
l93aeh:
	jr z,l93b7h		;93ae	28 07 	( . 
	scf			;93b0	37 	7 
	rl c		;93b1	cb 11 	. . 
	rr a		;93b3	cb 1f 	. . 
	jr l93aeh		;93b5	18 f7 	. . 
l93b7h:
	ld a,c			;93b7	79 	y 
	and 007h		;93b8	e6 07 	. . 
	ld (iy-04ah),a		;93ba	fd 77 b6 	. w . 
	jr z,l93c5h		;93bd	28 06 	( . 
l93bfh:
	ld a,020h		;93bf	3e 20 	>   
l93c1h:
	ld (iy-04bh),a		;93c1	fd 77 b5 	. w . 
	ret			;93c4	c9 	. 
l93c5h:
	add a,b			;93c5	80 	. 
	jr nz,l93bfh		;93c6	20 f7 	  . 
	ld a,002h		;93c8	3e 02 	> . 
	jr l93c1h		;93ca	18 f5 	. . 
l93cch:
	dec c			;93cc	0d 	. 
	jr l93b7h		;93cd	18 e8 	. . 
	ld hl,(01cd9h)		;93cf	2a d9 1c 	* . . 
	ld (iy-050h),l		;93d2	fd 75 b0 	. u . 
	ret			;93d5	c9 	. 
	ld hl,(01cd9h)		;93d6	2a d9 1c 	* . . 
	ld a,h			;93d9	7c 	| 
	or l			;93da	b5 	. 
	jr z,l93e6h		;93db	28 09 	( . 
	ld a,(01cdbh)		;93dd	3a db 1c 	: . . 
	or a			;93e0	b7 	. 
	ld a,001h		;93e1	3e 01 	> . 
	jr z,l93e6h		;93e3	28 01 	( . 
	inc a			;93e5	3c 	< 
l93e6h:
	ld (iy-049h),a		;93e6	fd 77 b7 	. w . 
	xor a			;93e9	af 	. 
	ld (iy-048h),a		;93ea	fd 77 b8 	. w . 
	ld (iy-047h),028h		;93ed	fd 36 b9 28 	. 6 . ( 
l93f1h:
	scf			;93f1	37 	7 
	rl a		;93f2	cb 17 	. . 
	srl l		;93f4	cb 3d 	. = 
	jr nz,l93f1h		;93f6	20 f9 	  . 
	srl a		;93f8	cb 3f 	. ? 
	and 00fh		;93fa	e6 0f 	. . 
	cpl			;93fc	2f 	/ 
	ld (iy-045h),a		;93fd	fd 77 bb 	. w . 
	sra a		;9400	cb 2f 	. / 
	add a,019h		;9402	c6 19 	. . 
	ld (iy-046h),a		;9404	fd 77 ba 	. w . 
	ret			;9407	c9 	. 
	call 01a62h		;9408	cd 62 1a 	. b . 
	call 01a83h		;940b	cd 83 1a 	. . . 
	ld a,0ffh		;940e	3e ff 	> . 
	ld (01d0fh),a		;9410	32 0f 1d 	2 . . 
	ld hl,(01cd6h)		;9413	2a d6 1c 	* . . 
	ld (01d0bh),hl		;9416	22 0b 1d 	" . . 
	ld hl,(01cd2h)		;9419	2a d2 1c 	* . . 
	ld (01d0dh),hl		;941c	22 0d 1d 	" . . 
	ld a,(01ce4h)		;941f	3a e4 1c 	: . . 
	ld (01d10h),a		;9422	32 10 1d 	2 . . 
	ld hl,(01d05h)		;9425	2a 05 1d 	* . . 
	ld (01cd6h),hl		;9428	22 d6 1c 	" . . 
	ld hl,(01d07h)		;942b	2a 07 1d 	* . . 
	ld (hl),01bh		;942e	36 1b 	6 . 
	inc hl			;9430	23 	# 
	ld (01cd2h),hl		;9431	22 d2 1c 	" . . 
	ld hl,(01cd9h)		;9434	2a d9 1c 	* . . 
	ld (01d11h),hl		;9437	22 11 1d 	" . . 
	ret			;943a	c9 	. 
	call 01b76h		;943b	cd 76 1b 	. v . 
	res 5,(iy-03ah)		;943e	fd cb c6 ae 	. . . . 
	xor a			;9442	af 	. 
	ld (iy-03bh),a		;9443	fd 77 c5 	. w . 
	dec a			;9446	3d 	= 
	ld (01cddh),a		;9447	32 dd 1c 	2 . . 
	ld (01cdch),a		;944a	32 dc 1c 	2 . . 
	ret			;944d	c9 	. 
	call 01a72h		;944e	cd 72 1a 	. r . 
	set 6,(iy-03ah)		;9451	fd cb c6 f6 	. . . . 
l9455h:
	call 01424h		;9455	cd 24 14 	. $ . 
	ld de,(01d17h)		;9458	ed 5b 17 1d 	. [ . . 
	ld hl,(01d19h)		;945c	2a 19 1d 	* . . 
	call 01a8bh		;945f	cd 8b 1a 	. . . 
	jr z,l9479h		;9462	28 15 	( . 
	ld a,(01cddh)		;9464	3a dd 1c 	: . . 
	or a			;9467	b7 	. 
	jp m,00d6bh		;9468	fa 6b 0d 	. k . 
	ld hl,07fffh		;946b	21 ff 7f 	! .  
	ld (01cd9h),hl		;946e	22 d9 1c 	" . . 
	ld a,057h		;9471	3e 57 	> W 
	ld (01cd8h),a		;9473	32 d8 1c 	2 . . 
	call 00cb6h		;9476	cd b6 0c 	. . . 
l9479h:
	ld a,(01cdch)		;9479	3a dc 1c 	: . . 
	dec a			;947c	3d 	= 
	jp m,01590h		;947d	fa 90 15 	. . . 
	ld hl,00001h		;9480	21 01 00 	! . . 
	ld (01cd9h),hl		;9483	22 d9 1c 	" . . 
	ld a,052h		;9486	3e 52 	> R 
	ld (01cd8h),a		;9488	32 d8 1c 	2 . . 
	call 00cb6h		;948b	cd b6 0c 	. . . 
	jr l9455h		;948e	18 c5 	. . 
	ld a,(01cddh)		;9490	3a dd 1c 	: . . 
	or a			;9493	b7 	. 
	call p,015a8h		;9494	f4 a8 15 	. . . 
	bit 4,(iy-03ah)		;9497	fd cb c6 66 	. . . f 
	jp z,0098bh		;949b	ca 8b 09 	. . . 
	call 00243h		;949e	cd 43 02 	. C . 
	set 2,(iy-03bh)		;94a1	fd cb c5 d6 	. . . . 
	jp 006e9h		;94a5	c3 e9 06 	. . . 
	bit 1,(iy-03bh)		;94a8	fd cb c5 4e 	. . . N 
	ld a,00eh		;94ac	3e 0e 	> . 
	jp nz,01bb6h		;94ae	c2 b6 1b 	. . . 
	ld ix,(006e7h)		;94b1	dd 2a e7 06 	. * . . 
	call 00252h		;94b5	cd 52 02 	. R . 
	call c,01bbch		;94b8	dc bc 1b 	. . . 
	call 015bfh		;94bb	cd bf 15 	. . . 
	ret			;94be	c9 	. 
	bit 0,(iy-03bh)		;94bf	fd cb c5 46 	. . . F 
	ret z			;94c3	c8 	. 
	res 0,(iy-03bh)		;94c4	fd cb c5 86 	. . . . 
	res 5,(iy-03ah)		;94c8	fd cb c6 ae 	. . . . 
	ld hl,01d55h		;94cc	21 55 1d 	! U . 
	ld de,00166h		;94cf	11 66 01 	. f . 
	call 00255h		;94d2	cd 55 02 	. U . 
	ld b,h			;94d5	44 	D 
	ld c,l			;94d6	4d 	M 
	ld de,00162h		;94d7	11 62 01 	. b . 
	call 00258h		;94da	cd 58 02 	. X . 
	ld de,0015eh		;94dd	11 5e 01 	. ^ . 
	call 00258h		;94e0	cd 58 02 	. X . 
	ret			;94e3	c9 	. 
	inc b			;94e4	04 	. 
	inc h			;94e5	24 	$ 
	inc h			;94e6	24 	$ 
	inc h			;94e7	24 	$ 
	inc b			;94e8	04 	. 
	ld b,d			;94e9	42 	B 
	ld b,c			;94ea	41 	A 
	ld c,e			;94eb	4b 	K 
	ld a,(iy-03bh)		;94ec	fd 7e c5 	. ~ . 
	or a			;94ef	b7 	. 
	ret z			;94f0	c8 	. 
	ld a,00ch		;94f1	3e 0c 	> . 
	jp 01bb6h		;94f3	c3 b6 1b 	. . . 
	call 015ech		;94f6	cd ec 15 	. . . 
	ld a,(01cddh)		;94f9	3a dd 1c 	: . . 
	or a			;94fc	b7 	. 
	jp m,01605h		;94fd	fa 05 16 	. . . 
	ld a,00dh		;9500	3e 0d 	> . 
	jp 01bb6h		;9502	c3 b6 1b 	. . . 
	call 01a72h		;9505	cd 72 1a 	. r . 
	ld hl,01d55h		;9508	21 55 1d 	! U . 
	call 012e9h		;950b	cd e9 12 	. . . 
	ld de,015e4h		;950e	11 e4 15 	. . . 
	call 00261h		;9511	cd 61 02 	. a . 
	jp c,01bb6h		;9514	da b6 1b 	. . . 
	ld de,015e8h		;9517	11 e8 15 	. . . 
	call 00261h		;951a	cd 61 02 	. a . 
	jp c,01bb6h		;951d	da b6 1b 	. . . 
	ld de,00162h		;9520	11 62 01 	. b . 
	ld ix,(006e5h)		;9523	dd 2a e5 06 	. * . . 
	call 00246h		;9527	cd 46 02 	. F . 
	jr nc,l9542h		;952a	30 16 	0 . 
	bit 5,(iy-03ah)		;952c	fd cb c6 6e 	. . . n 
	jp z,01bb6h		;9530	ca b6 1b 	. . . 
	push hl			;9533	e5 	. 
	ld hl,0166ch		;9534	21 6c 16 	! l . 
	ld bc,00009h		;9537	01 09 00 	. . . 
	call 018eeh		;953a	cd ee 18 	. . . 
	pop hl			;953d	e1 	. 
	ld a,001h		;953e	3e 01 	> . 
	jr l9547h		;9540	18 05 	. . 
l9542h:
	ld a,001h		;9542	3e 01 	> . 
	ld (01cdch),a		;9544	32 dc 1c 	2 . . 
l9547h:
	ld de,0015eh		;9547	11 5e 01 	. ^ . 
	call 00255h		;954a	cd 55 02 	. U . 
	ld ix,(006e7h)		;954d	dd 2a e7 06 	. * . . 
	call 0024ch		;9551	cd 4c 02 	. L . 
	jp c,01bb6h		;9554	da b6 1b 	. . . 
	set 0,(iy-03bh)		;9557	fd cb c5 c6 	. . . . 
	ld a,001h		;955b	3e 01 	> . 
	ld (01cddh),a		;955d	32 dd 1c 	2 . . 
	ld a,(01cdch)		;9560	3a dc 1c 	: . . 
	or a			;9563	b7 	. 
	ret m			;9564	f8 	. 
	set 1,(iy-03bh)		;9565	fd cb c5 ce 	. . . . 
	jp 016fch		;9569	c3 fc 16 	. . . 
	ld c,(hl)			;956c	4e 	N 
	ld h,l			;956d	65 	e 
	ld (hl),a			;956e	77 	w 
	jr nz,l95d7h		;956f	20 66 	  f 
	ld l,c			;9571	69 	i 
	ld l,h			;9572	6c 	l 
	ld h,l			;9573	65 	e 
	dec c			;9574	0d 	. 
	bit 1,(iy-03bh)		;9575	fd cb c5 4e 	. . . N 
	ld a,00eh		;9579	3e 0e 	> . 
	jp nz,01bb6h		;957b	c2 b6 1b 	. . . 
	ld hl,01d69h		;957e	21 69 1d 	! i . 
	call 012e9h		;9581	cd e9 12 	. . . 
	ld de,0016ah		;9584	11 6a 01 	. j . 
	ld ix,(006e5h)		;9587	dd 2a e5 06 	. * . . 
	call 00246h		;958b	cd 46 02 	. F . 
	jp c,01bb6h		;958e	da b6 1b 	. . . 
	ld a,001h		;9591	3e 01 	> . 
	ld (01cdch),a		;9593	32 dc 1c 	2 . . 
	ret			;9596	c9 	. 
	call 015ech		;9597	cd ec 15 	. . . 
	ld a,(01cddh)		;959a	3a dd 1c 	: . . 
	or a			;959d	b7 	. 
	call p,016bah		;959e	f4 ba 16 	. . . 
	ld hl,01d69h		;95a1	21 69 1d 	! i . 
	call 012e9h		;95a4	cd e9 12 	. . . 
	ld de,0016ah		;95a7	11 6a 01 	. j . 
	ld ix,(006e7h)		;95aa	dd 2a e7 06 	. * . . 
	call 0024ch		;95ae	cd 4c 02 	. L . 
	jp c,01bb6h		;95b1	da b6 1b 	. . . 
	ld a,001h		;95b4	3e 01 	> . 
	ld (01cddh),a		;95b6	32 dd 1c 	2 . . 
	ret			;95b9	c9 	. 
	ld a,(01cddh)		;95ba	3a dd 1c 	: . . 
	or a			;95bd	b7 	. 
	jp m,00d6bh		;95be	fa 6b 0d 	. k . 
	call 015a8h		;95c1	cd a8 15 	. . . 
	ld a,0ffh		;95c4	3e ff 	> . 
	ld (01cddh),a		;95c6	32 dd 1c 	2 . . 
	ret			;95c9	c9 	. 
	call 01a72h		;95ca	cd 72 1a 	. r . 
	call 01a83h		;95cd	cd 83 1a 	. . . 
	ld hl,(01cd6h)		;95d0	2a d6 1c 	* . . 
	ex de,hl			;95d3	eb 	. 
	ld hl,(01cd2h)		;95d4	2a d2 1c 	* . . 
l95d7h:
	ld (01cd6h),hl		;95d7	22 d6 1c 	" . . 
	call 01a8bh		;95da	cd 8b 1a 	. . . 
	ld hl,(01d05h)		;95dd	2a 05 1d 	* . . 
	jr z,l95f8h		;95e0	28 16 	( . 
	push de			;95e2	d5 	. 
	ex de,hl			;95e3	eb 	. 
	ld hl,(01d09h)		;95e4	2a 09 1d 	* . . 
	or a			;95e7	b7 	. 
	sbc hl,de		;95e8	ed 52 	. R 
	jp z,00d5bh		;95ea	ca 5b 0d 	. [ . 
	ld a,l			;95ed	7d 	} 
	sub c			;95ee	91 	. 
	ld a,h			;95ef	7c 	| 
	sbc a,b			;95f0	98 	. 
	jp c,00d5bh		;95f1	da 5b 0d 	. [ . 
	pop hl			;95f4	e1 	. 
	ldir		;95f5	ed b0 	. . 
	ex de,hl			;95f7	eb 	. 
l95f8h:
	ld (01d07h),hl		;95f8	22 07 1d 	" . . 
	ret			;95fb	c9 	. 
	call 01a72h		;95fc	cd 72 1a 	. r . 
	ld a,(01cdch)		;95ff	3a dc 1c 	: . . 
	or a			;9602	b7 	. 
	jp m,00d6bh		;9603	fa 6b 0d 	. k . 
	jp z,00d63h		;9606	ca 63 0d 	. c . 
	ld de,(01d15h)		;9609	ed 5b 15 1d 	. [ . . 
	ld hl,(01d17h)		;960d	2a 17 1d 	* . . 
	call 01a8bh		;9610	cd 8b 1a 	. . . 
	push de			;9613	d5 	. 
	push bc			;9614	c5 	. 
	pop hl			;9615	e1 	. 
	push bc			;9616	c5 	. 
	srl b		;9617	cb 38 	. 8 
	rr c		;9619	cb 19 	. . 
	srl b		;961b	cb 38 	. 8 
	rr c		;961d	cb 19 	. . 
	or a			;961f	b7 	. 
	sbc hl,bc		;9620	ed 42 	. B 
	push hl			;9622	e5 	. 
	ld bc,0001eh		;9623	01 1e 00 	. . . 
	sbc hl,bc		;9626	ed 42 	. B 
	jp c,00d5bh		;9628	da 5b 0d 	. [ . 
	call 01412h		;962b	cd 12 14 	. . . 
	ld hl,(01d15h)		;962e	2a 15 1d 	* . . 
	pop bc			;9631	c1 	. 
	pop de			;9632	d1 	. 
	dec de			;9633	1b 	. 
	ld a,001h		;9634	3e 01 	> . 
	or a			;9636	b7 	. 
	ex af,af'			;9637	08 	. 
l9638h:
	call 01b7ah		;9638	cd 7a 1b 	. z . 
	jr nc,l9642h		;963b	30 05 	0 . 
	call 017a0h		;963d	cd a0 17 	. . . 
	ld a,01ah		;9640	3e 1a 	> . 
l9642h:
	cp 01ah		;9642	fe 1a 	. . 
	jr z,l9667h		;9644	28 21 	( ! 
	ld (hl),a			;9646	77 	w 
	inc hl			;9647	23 	# 
	ld (01d15h),hl		;9648	22 15 1d 	" . . 
	dec bc			;964b	0b 	. 
	dec de			;964c	1b 	. 
	cp 00ch		;964d	fe 0c 	. . 
	jr z,l966fh		;964f	28 1e 	( . 
	ex af,af'			;9651	08 	. 
	jr z,l965ch		;9652	28 08 	( . 
	ex af,af'			;9654	08 	. 
	ld a,b			;9655	78 	x 
	or c			;9656	b1 	. 
	jr nz,l9638h		;9657	20 df 	  . 
	ex af,af'			;9659	08 	. 
	jr l9638h		;965a	18 dc 	. . 
l965ch:
	ex af,af'			;965c	08 	. 
	cp 00dh		;965d	fe 0d 	. . 
	jr z,l966fh		;965f	28 0e 	( . 
	ld a,d			;9661	7a 	z 
	or e			;9662	b3 	. 
	jr z,l966fh		;9663	28 0a 	( . 
	jr l9638h		;9665	18 d1 	. . 
l9667h:
	xor a			;9667	af 	. 
	ld (01cdch),a		;9668	32 dc 1c 	2 . . 
	res 1,(iy-03bh)		;966b	fd cb c5 8e 	. . . . 
l966fh:
	pop de			;966f	d1 	. 
	call 0142bh		;9670	cd 2b 14 	. + . 
	ld a,(01cdch)		;9673	3a dc 1c 	: . . 
	or a			;9676	b7 	. 
	ret z			;9677	c8 	. 
	ld a,(01d0fh)		;9678	3a 0f 1d 	: . . 
	ld b,a			;967b	47 	G 
	ld a,(01ce4h)		;967c	3a e4 1c 	: . . 
	or b			;967f	b0 	. 
	ret nz			;9680	c0 	. 
	bit 6,(iy-03ah)		;9681	fd cb c6 76 	. . . v 
	ret nz			;9685	c0 	. 
	ld hl,01793h		;9686	21 93 17 	! . . 
	ld bc,0000dh		;9689	01 0d 00 	. . . 
	call 018eeh		;968c	cd ee 18 	. . . 
	call 0187fh		;968f	cd 7f 18 	.  . 
	ret			;9692	c9 	. 
	ld c,l			;9693	4d 	M 
	ld l,a			;9694	6f 	o 
	ld (hl),d			;9695	72 	r 
	ld h,l			;9696	65 	e 
	jr nz,$+113		;9697	20 6f 	  o 
	ld l,(hl)			;9699	6e 	n 
	jr nz,$+75		;969a	20 49 	  I 
	ld l,(hl)			;969c	6e 	n 
	ld (hl),b			;969d	70 	p 
	ld (hl),l			;969e	75 	u 
	ld (hl),h			;969f	74 	t 
	push hl			;96a0	e5 	. 
	push de			;96a1	d5 	. 
	push bc			;96a2	c5 	. 
	call 01bbch		;96a3	cd bc 1b 	. . . 
	pop bc			;96a6	c1 	. 
	pop de			;96a7	d1 	. 
	pop hl			;96a8	e1 	. 
	ret			;96a9	c9 	. 
	call 01a72h		;96aa	cd 72 1a 	. r . 
	call 01424h		;96ad	cd 24 14 	. $ . 
	ld hl,07fffh		;96b0	21 ff 7f 	! .  
	ld (01cd9h),hl		;96b3	22 d9 1c 	" . . 
	ld a,057h		;96b6	3e 57 	> W 
	ld (01cd8h),a		;96b8	32 d8 1c 	2 . . 
	call 00cb6h		;96bb	cd b6 0c 	. . . 
	ld hl,00001h		;96be	21 01 00 	! . . 
	ld (01cd9h),hl		;96c1	22 d9 1c 	" . . 
	ld a,052h		;96c4	3e 52 	> R 
	ld (01cd8h),a		;96c6	32 d8 1c 	2 . . 
	call 00cb6h		;96c9	cd b6 0c 	. . . 
	ret			;96cc	c9 	. 
	call 01a83h		;96cd	cd 83 1a 	. . . 
	jp 016dah		;96d0	c3 da 16 	. . . 
	call 01a72h		;96d3	cd 72 1a 	. r . 
	call 01a83h		;96d6	cd 83 1a 	. . . 
	ld hl,(01d05h)		;96d9	2a 05 1d 	* . . 
	ex de,hl			;96dc	eb 	. 
	ld hl,(01d07h)		;96dd	2a 07 1d 	* . . 
	jp 013edh		;96e0	c3 ed 13 	. . . 
	call 018e9h		;96e3	cd e9 18 	. . . 
	ret			;96e6	c9 	. 
	call 01a8bh		;96e7	cd 8b 1a 	. . . 
	ret z			;96ea	c8 	. 
	ex de,hl			;96eb	eb 	. 
l96ech:
	ld a,(hl)			;96ec	7e 	~ 
	call 0183dh		;96ed	cd 3d 18 	. = . 
	call 01900h		;96f0	cd 00 19 	. . . 
	inc hl			;96f3	23 	# 
	dec bc			;96f4	0b 	. 
	ld a,b			;96f5	78 	x 
	or c			;96f6	b1 	. 
	jr nz,l96ech		;96f7	20 f3 	  . 
	ret			;96f9	c9 	. 
	ld a,(01cddh)		;96fa	3a dd 1c 	: . . 
	or a			;96fd	b7 	. 
	jp m,00d6bh		;96fe	fa 6b 0d 	. k . 
	push hl			;9701	e5 	. 
	call 0181ah		;9702	cd 1a 18 	. . . 
	pop hl			;9705	e1 	. 
	ld (01d17h),hl		;9706	22 17 1d 	" . . 
	ret			;9709	c9 	. 
	ld a,(01cddh)		;970a	3a dd 1c 	: . . 
	or a			;970d	b7 	. 
	jp m,00d6bh		;970e	fa 6b 0d 	. k . 
	push de			;9711	d5 	. 
	call 0181ah		;9712	cd 1a 18 	. . . 
	pop hl			;9715	e1 	. 
	ld (01d15h),hl		;9716	22 15 1d 	" . . 
	ret			;9719	c9 	. 
	call 01a8bh		;971a	cd 8b 1a 	. . . 
	ret z			;971d	c8 	. 
	ex de,hl			;971e	eb 	. 
l971fh:
	ld a,(hl)			;971f	7e 	~ 
	push af			;9720	f5 	. 
	inc hl			;9721	23 	# 
	dec bc			;9722	0b 	. 
	cp 080h		;9723	fe 80 	. . 
	call nz,01b9bh		;9725	c4 9b 1b 	. . . 
	pop af			;9728	f1 	. 
	cp 00dh		;9729	fe 0d 	. . 
	jr nz,l9732h		;972b	20 05 	  . 
	ld a,00ah		;972d	3e 0a 	> . 
	call 01b9bh		;972f	cd 9b 1b 	. . . 
l9732h:
	ld a,b			;9732	78 	x 
	or c			;9733	b1 	. 
	jr nz,l971fh		;9734	20 e9 	  . 
	ret			;9736	c9 	. 
	call 00e39h		;9737	cd 39 0e 	. 9 . 
	jp 013e6h		;973a	c3 e6 13 	. . . 
	call 01b50h		;973d	cd 50 1b 	. P . 
	cp 080h		;9740	fe 80 	. . 
	ret z			;9742	c8 	. 
	cp 009h		;9743	fe 09 	. . 
	jr z,l9771h		;9745	28 2a 	( * 
	cp 00dh		;9747	fe 0d 	. . 
	jr z,l975bh		;9749	28 10 	( . 
	cp 01bh		;974b	fe 1b 	. . 
	jr nz,l9751h		;974d	20 02 	  . 
	ld a,024h		;974f	3e 24 	> $ 
l9751h:
	cp 020h		;9751	fe 20 	.   
	jr c,l9766h		;9753	38 11 	8 . 
l9755h:
	rst 30h			;9755	f7 	. 
	dec b			;9756	05 	. 
	inc (iy-04ch)		;9757	fd 34 b4 	. 4 . 
	ret			;975a	c9 	. 
l975bh:
	rst 30h			;975b	f7 	. 
	dec b			;975c	05 	. 
	ld a,00ah		;975d	3e 0a 	> . 
	rst 30h			;975f	f7 	. 
	dec b			;9760	05 	. 
	ld (iy-04ch),000h		;9761	fd 36 b4 00 	. 6 . . 
	ret			;9765	c9 	. 
l9766h:
	push af			;9766	f5 	. 
	ld a,05eh		;9767	3e 5e 	> ^ 
	call 01855h		;9769	cd 55 18 	. U . 
	pop af			;976c	f1 	. 
	or 040h		;976d	f6 40 	. @ 
	jr l9755h		;976f	18 e4 	. . 
l9771h:
	ld a,020h		;9771	3e 20 	>   
	call 01855h		;9773	cd 55 18 	. U . 
	ld a,(iy-04ch)		;9776	fd 7e b4 	. ~ . 
	and (iy-04ah)		;9779	fd a6 b6 	. . . 
	jr nz,l9771h		;977c	20 f3 	  . 
	ret			;977e	c9 	. 
	push hl			;977f	e5 	. 
	push bc			;9780	c5 	. 
	ld a,00dh		;9781	3e 0d 	> . 
	call 01890h		;9783	cd 90 18 	. . . 
	bit 2,(iy-03ah)		;9786	fd cb c6 56 	. . . V 
	call nz,00a85h		;978a	c4 85 0a 	. . . 
	pop bc			;978d	c1 	. 
	pop hl			;978e	e1 	. 
	ret			;978f	c9 	. 
	push af			;9790	f5 	. 
	ld e,(iy-044h)		;9791	fd 5e bc 	. ^ . 
	ld (iy-041h),000h		;9794	fd 36 bf 00 	. 6 . . 
	cp 00dh		;9798	fe 0d 	. . 
	jr z,l97c2h		;979a	28 26 	( & 
	cp 009h		;979c	fe 09 	. . 
	jr z,l97dah		;979e	28 3a 	( : 
	cp 01bh		;97a0	fe 1b 	. . 
	jr z,l97d6h		;97a2	28 32 	( 2 
	cp 080h		;97a4	fe 80 	. . 
	jr z,$+33		;97a6	28 1f 	( . 
	call 01b50h		;97a8	cd 50 1b 	. P . 
	cp 020h		;97ab	fe 20 	.   
	jr c,l97cbh		;97ad	38 1c 	8 . 
l97afh:
	rst 30h			;97af	f7 	. 
	ld bc,07b1ch		;97b0	01 1c 7b 	. . { 
	cp 028h		;97b3	fe 28 	. ( 
	jr c,l97bdh		;97b5	38 06 	8 . 
	sub 028h		;97b7	d6 28 	. ( 
	set 7,(iy-041h)		;97b9	fd cb bf fe 	. . . . 
l97bdh:
	ld (iy-044h),a		;97bd	fd 77 bc 	. w . 
	pop af			;97c0	f1 	. 
	ret			;97c1	c9 	. 
l97c2h:
	rst 30h			;97c2	f7 	. 
	ld bc,018afh		;97c3	01 af 18 	. . . 
	jp p,07c3eh		;97c6	f2 3e 7c 	. > | 
	jr l97afh		;97c9	18 e4 	. . 
l97cbh:
	ld a,05eh		;97cb	3e 5e 	> ^ 
	rst 30h			;97cd	f7 	. 
	ld bc,0f11ch		;97ce	01 1c f1 	. . . 
	push af			;97d1	f5 	. 
	or 040h		;97d2	f6 40 	. @ 
	jr l97afh		;97d4	18 d9 	. . 
l97d6h:
	ld a,024h		;97d6	3e 24 	> $ 
	jr l97afh		;97d8	18 d5 	. . 
l97dah:
	ld a,020h		;97da	3e 20 	>   
l97dch:
	rst 30h			;97dc	f7 	. 
	ld bc,0fd1ch		;97dd	01 1c fd 	. . . 
	ld a,(hl)			;97e0	7e 	~ 
	or (hl)			;97e1	b6 	. 
	and e			;97e2	a3 	. 
	jr z,$-49		;97e3	28 cd 	( . 
	ld a,080h		;97e5	3e 80 	> . 
	jr l97dch		;97e7	18 f3 	. . 
	call 01a8bh		;97e9	cd 8b 1a 	. . . 
	ret z			;97ec	c8 	. 
	ex de,hl			;97ed	eb 	. 
	push af			;97ee	f5 	. 
	push de			;97ef	d5 	. 
l97f0h:
	ld a,(hl)			;97f0	7e 	~ 
	call 01890h		;97f1	cd 90 18 	. . . 
	call 01900h		;97f4	cd 00 19 	. . . 
	inc hl			;97f7	23 	# 
	dec bc			;97f8	0b 	. 
	ld a,b			;97f9	78 	x 
	or c			;97fa	b1 	. 
	jr nz,l97f0h		;97fb	20 f3 	  . 
	pop de			;97fd	d1 	. 
	pop af			;97fe	f1 	. 
	ret			;97ff	c9 	. 
	rst 30h			;9800	f7 	. 
	ld e,0c8h		;9801	1e c8 	. . 
	rst 30h			;9803	f7 	. 
	dec e			;9804	1d 	. 
	cp 00dh		;9805	fe 0d 	. . 
	ret z			;9807	c8 	. 
	cp 020h		;9808	fe 20 	.   
	ret nc			;980a	d0 	. 
	call 0187fh		;980b	cd 7f 18 	.  . 
	jp 00aa1h		;980e	c3 a1 0a 	. . . 
	exx			;9811	d9 	. 
	ld c,(iy-044h)		;9812	fd 4e bc 	. N . 
	ld b,000h		;9815	06 00 	. . 
	ld hl,(006ddh)		;9817	2a dd 06 	* . . 
	add hl,bc			;981a	09 	. 
	call 0199bh		;981b	cd 9b 19 	. . . 
	exx			;981e	d9 	. 
l981fh:
	ld a,(de)			;981f	1a 	. 
	inc de			;9820	13 	. 
	dec bc			;9821	0b 	. 
	exx			;9822	d9 	. 
	cp 080h		;9823	fe 80 	. . 
	jr nz,l9829h		;9825	20 02 	  . 
	ld a,07ch		;9827	3e 7c 	> | 
l9829h:
	cp 020h		;9829	fe 20 	.   
	jr c,l983ah		;982b	38 0d 	8 . 
l982dh:
	call 01994h		;982d	cd 94 19 	. . . 
l9830h:
	exx			;9830	d9 	. 
	ld a,b			;9831	78 	x 
	or c			;9832	b1 	. 
	jr nz,l981fh		;9833	20 ea 	  . 
	exx			;9835	d9 	. 
	ld (iy-044h),c		;9836	fd 71 bc 	. q . 
	ret			;9839	c9 	. 
l983ah:
	cp 009h		;983a	fe 09 	. . 
	jr z,l985dh		;983c	28 1f 	( . 
	or a			;983e	b7 	. 
	jr z,l982dh		;983f	28 ec 	( . 
	cp 01bh		;9841	fe 1b 	. . 
	jr z,l9859h		;9843	28 14 	( . 
	cp 00dh		;9845	fe 0d 	. . 
	jr z,l986ah		;9847	28 21 	( ! 
	push af			;9849	f5 	. 
	ld a,05eh		;984a	3e 5e 	> ^ 
	call 01994h		;984c	cd 94 19 	. . . 
	pop af			;984f	f1 	. 
	or 040h		;9850	f6 40 	. @ 
	cp 04fh		;9852	fe 4f 	. O 
	jr nz,l982dh		;9854	20 d7 	  . 
	xor a			;9856	af 	. 
	jr l982dh		;9857	18 d4 	. . 
l9859h:
	ld a,024h		;9859	3e 24 	> $ 
	jr l982dh		;985b	18 d0 	. . 
l985dh:
	ld a,(iy-04bh)		;985d	fd 7e b5 	. ~ . 
	call 01994h		;9860	cd 94 19 	. . . 
	and (iy-04ah)		;9863	fd a6 b6 	. . . 
	jr z,l9830h		;9866	28 c8 	( . 
	jr l985dh		;9868	18 f3 	. . 
l986ah:
	bit 0,(iy-049h)		;986a	fd cb b7 46 	. . . F 
	jr nz,l9888h		;986e	20 18 	  . 
l9870h:
	ld a,080h		;9870	3e 80 	> . 
	ld (hl),a			;9872	77 	w 
	inc hl			;9873	23 	# 
	inc c			;9874	0c 	. 
	ld a,c			;9875	79 	y 
	cp (iy-047h)		;9876	fd be b9 	. . . 
	jr c,l9870h		;9879	38 f5 	8 . 
	call 019c2h		;987b	cd c2 19 	. . . 
	ret nc			;987e	d0 	. 
	exx			;987f	d9 	. 
l9880h:
	ld hl,(006ddh)		;9880	2a dd 06 	* . . 
	ld bc,00000h		;9883	01 00 00 	. . . 
	jr l9830h		;9886	18 a8 	. . 
l9888h:
	bit 7,(iy-03dh)		;9888	fd cb c3 7e 	. . . ~ 
	jr z,l9870h		;988c	28 e2 	( . 
	res 7,(iy-03dh)		;988e	fd cb c3 be 	. . . . 
	jr l9880h		;9892	18 ec 	. . 
	ld (hl),a			;9894	77 	w 
	res 7,(iy-03dh)		;9895	fd cb c3 be 	. . . . 
	inc hl			;9899	23 	# 
	inc c			;989a	0c 	. 
	ld a,c			;989b	79 	y 
	cp 028h		;989c	fe 28 	. ( 
	ret c			;989e	d8 	. 
	bit 0,(iy-049h)		;989f	fd cb b7 46 	. . . F 
	jr nz,l98abh		;98a3	20 06 	  . 
	cp 0f8h		;98a5	fe f8 	. . 
	ret nz			;98a7	c0 	. 
	dec c			;98a8	0d 	. 
	dec hl			;98a9	2b 	+ 
	ret			;98aa	c9 	. 
l98abh:
	call 019c2h		;98ab	cd c2 19 	. . . 
	exx			;98ae	d9 	. 
	jr nc,l98c0h		;98af	30 0f 	0 . 
	ld hl,(006ddh)		;98b1	2a dd 06 	* . . 
	ld (hl),00dh		;98b4	36 0d 	6 . 
	xor a			;98b6	af 	. 
	ld b,a			;98b7	47 	G 
	ld c,001h		;98b8	0e 01 	. . 
	inc hl			;98ba	23 	# 
	set 7,(iy-03dh)		;98bb	fd cb c3 fe 	. . . . 
	ret			;98bf	c9 	. 
l98c0h:
	pop de			;98c0	d1 	. 
	ret			;98c1	c9 	. 
	exx			;98c2	d9 	. 
	push de			;98c3	d5 	. 
	push bc			;98c4	c5 	. 
	ld hl,0fbfeh		;98c5	21 fe fb 	! . . 
	exx			;98c8	d9 	. 
	ld de,(01cdfh)		;98c9	ed 5b df 1c 	. [ . . 
	ld hl,(006ddh)		;98cd	2a dd 06 	* . . 
	ld b,000h		;98d0	06 00 	. . 
	ld c,(iy-048h)		;98d2	fd 4e b8 	. N . 
	add hl,bc			;98d5	09 	. 
	ld c,028h		;98d6	0e 28 	. ( 
l98d8h:
	exx			;98d8	d9 	. 
	bit 6,(hl)		;98d9	cb 76 	. v 
	jr nz,l9910h		;98db	20 33 	  3 
	exx			;98dd	d9 	. 
	push bc			;98de	c5 	. 
	ld b,(hl)			;98df	46 	F 
	push hl			;98e0	e5 	. 
	ld hl,0fbfch		;98e1	21 fc fb 	! . . 
	ld a,(0ff03h)		;98e4	3a 03 ff 	: . . 
	ld c,a			;98e7	4f 	O 
	ld a,b			;98e8	78 	x 
	ld b,c			;98e9	41 	A 
	set 2,b		;98ea	cb d0 	. . 
	exx			;98ec	d9 	. 
l98edh:
	bit 7,(hl)		;98ed	cb 7e 	. ~ 
	jr nz,l98edh		;98ef	20 fc 	  . 
l98f1h:
	bit 7,(hl)		;98f1	cb 7e 	. ~ 
	jr z,l98f1h		;98f3	28 fc 	( . 
	exx			;98f5	d9 	. 
	ld (hl),b			;98f6	70 	p 
	ld (de),a			;98f7	12 	. 
	ld (hl),c			;98f8	71 	q 
	pop hl			;98f9	e1 	. 
	pop bc			;98fa	c1 	. 
	inc hl			;98fb	23 	# 
	inc de			;98fc	13 	. 
	dec c			;98fd	0d 	. 
	jr nz,l98d8h		;98fe	20 d8 	  . 
l9900h:
	ld hl,00018h		;9900	21 18 00 	! . . 
	add hl,de			;9903	19 	. 
	ld (01cdfh),hl		;9904	22 df 1c 	" . . 
	ld de,0f460h		;9907	11 60 f4 	. ` . 
	sbc hl,de		;990a	ed 52 	. R 
	exx			;990c	d9 	. 
	pop bc			;990d	c1 	. 
	pop de			;990e	d1 	. 
	ret			;990f	c9 	. 
l9910h:
	dec hl			;9910	2b 	+ 
	dec hl			;9911	2b 	+ 
	ld a,(0ff03h)		;9912	3a 03 ff 	: . . 
	set 2,a		;9915	cb d7 	. . 
	ld (hl),a			;9917	77 	w 
	exx			;9918	d9 	. 
	ldir		;9919	ed b0 	. . 
	exx			;991b	d9 	. 
	res 2,a		;991c	cb 97 	. . 
	ld (hl),a			;991e	77 	w 
	exx			;991f	d9 	. 
	jr l9900h		;9920	18 de 	. . 
	push hl			;9922	e5 	. 
l9923h:
	ld a,00dh		;9923	3e 0d 	> . 
	cpir		;9925	ed b1 	. . 
	jp po,01a2fh		;9927	e2 2f 1a 	. / . 
	dec de			;992a	1b 	. 
	ld a,d			;992b	7a 	z 
	or e			;992c	b3 	. 
	jr nz,l9923h		;992d	20 f4 	  . 
	pop de			;992f	d1 	. 
	ret			;9930	c9 	. 
	inc de			;9931	13 	. 
	push hl			;9932	e5 	. 
	dec hl			;9933	2b 	+ 
l9934h:
	ld a,00dh		;9934	3e 0d 	> . 
	cpdr		;9936	ed b9 	. . 
	jp po,01a45h		;9938	e2 45 1a 	. E . 
	dec de			;993b	1b 	. 
	ld a,d			;993c	7a 	z 
	or e			;993d	b3 	. 
	jr nz,l9934h		;993e	20 f4 	  . 
l9940h:
	inc hl			;9940	23 	# 
l9941h:
	inc hl			;9941	23 	# 
	ex de,hl			;9942	eb 	. 
	pop hl			;9943	e1 	. 
	ret			;9944	c9 	. 
	jr nz,l9941h		;9945	20 fa 	  . 
	dec de			;9947	1b 	. 
	ld a,d			;9948	7a 	z 
	or e			;9949	b3 	. 
	jr z,l9940h		;994a	28 f4 	( . 
	jr l9941h		;994c	18 f3 	. . 
	ld hl,(01cd6h)		;994e	2a d6 1c 	* . . 
	ex de,hl			;9951	eb 	. 
	ld hl,(01cd2h)		;9952	2a d2 1c 	* . . 
	call 01a8bh		;9955	cd 8b 1a 	. . . 
	jp z,00d53h		;9958	ca 53 0d 	. S . 
	ld h,d			;995b	62 	b 
	ld l,e			;995c	6b 	k 
	ld a,01bh		;995d	3e 1b 	> . 
	cpir		;995f	ed b1 	. . 
	ret			;9961	c9 	. 
	ld hl,(01cd9h)		;9962	2a d9 1c 	* . . 
	ld a,h			;9965	7c 	| 
	or l			;9966	b5 	. 
	jp z,00d3bh		;9967	ca 3b 0d 	. ; . 
	ld a,(01cdbh)		;996a	3a db 1c 	: . . 
	or a			;996d	b7 	. 
	jp nz,00d3bh		;996e	c2 3b 0d 	. ; . 
	ret			;9971	c9 	. 
	ld hl,(01cd9h)		;9972	2a d9 1c 	* . . 
	dec hl			;9975	2b 	+ 
	ld a,h			;9976	7c 	| 
	or l			;9977	b5 	. 
	jp nz,00d3bh		;9978	c2 3b 0d 	. ; . 
	ld a,(01cdbh)		;997b	3a db 1c 	: . . 
	or a			;997e	b7 	. 
	jp nz,00d3bh		;997f	c2 3b 0d 	. ; . 
	ret			;9982	c9 	. 
	ld a,(01d0fh)		;9983	3a 0f 1d 	: . . 
	or a			;9986	b7 	. 
	jp nz,00d43h		;9987	c2 43 0d 	. C . 
	ret			;998a	c9 	. 
	ld a,l			;998b	7d 	} 
	sub e			;998c	93 	. 
	ld c,a			;998d	4f 	O 
	ld a,h			;998e	7c 	| 
	sbc a,d			;998f	9a 	. 
	ld b,a			;9990	47 	G 
	or c			;9991	b1 	. 
	ret			;9992	c9 	. 
	ex de,hl			;9993	eb 	. 
	ld hl,(01d17h)		;9994	2a 17 1d 	* . . 
	ex de,hl			;9997	eb 	. 
	dec de			;9998	1b 	. 
	dec hl			;9999	2b 	+ 
	lddr		;999a	ed b8 	. . 
	inc hl			;999c	23 	# 
	inc de			;999d	13 	. 
	ex de,hl			;999e	eb 	. 
	ld (01d17h),hl		;999f	22 17 1d 	" . . 
	ret			;99a2	c9 	. 
	ld hl,(01d15h)		;99a3	2a 15 1d 	* . . 
	ex de,hl			;99a6	eb 	. 
	ldir		;99a7	ed b0 	. . 
	ex de,hl			;99a9	eb 	. 
	ld (01d15h),hl		;99aa	22 15 1d 	" . . 
	ex de,hl			;99ad	eb 	. 
	ret			;99ae	c9 	. 
	ld c,a			;99af	4f 	O 
	ld c,e			;99b0	4b 	K 
	dec c			;99b1	0d 	. 
	ld c,(hl)			;99b2	4e 	N 
	ld l,a			;99b3	6f 	o 
	ld (hl),h			;99b4	74 	t 
	jr nz,l9a1ch		;99b5	20 65 	  e 
	ld l,(hl)			;99b7	6e 	n 
	ld l,a			;99b8	6f 	o 
	ld (hl),l			;99b9	75 	u 
	ld h,a			;99ba	67 	g 
	ld l,b			;99bb	68 	h 
	jr nz,l9a2bh		;99bc	20 6d 	  m 
	ld h,l			;99be	65 	e 
	ld l,l			;99bf	6d 	m 
	ld l,a			;99c0	6f 	o 
	ld (hl),d			;99c1	72 	r 
	ld a,c			;99c2	79 	y 
	dec c			;99c3	0d 	. 
	ld hl,03f0dh		;99c4	21 0d 3f 	! . ? 
	ld b,d			;99c7	42 	B 
	ld h,c			;99c8	61 	a 
	ld h,h			;99c9	64 	d 
	jr nz,l9a2dh		;99ca	20 61 	  a 
	ld (hl),d			;99cc	72 	r 
	ld h,a			;99cd	67 	g 
	ld (hl),l			;99ce	75 	u 
	ld l,l			;99cf	6d 	m 
	ld h,l			;99d0	65 	e 
	ld l,(hl)			;99d1	6e 	n 
	ld (hl),h			;99d2	74 	t 
	ccf			;99d3	3f 	? 
	ld b,d			;99d4	42 	B 
	ld h,c			;99d5	61 	a 
	ld h,h			;99d6	64 	d 
	jr nz,l9a3ch		;99d7	20 63 	  c 
	ld l,a			;99d9	6f 	o 
	ld l,l			;99da	6d 	m 
	ld l,l			;99db	6d 	m 
	ld h,c			;99dc	61 	a 
	ld l,(hl)			;99dd	6e 	n 
	ld h,h			;99de	64 	d 
	ccf			;99df	3f 	? 
	ld b,l			;99e0	45 	E 
	ld (hl),d			;99e1	72 	r 
	ld (hl),d			;99e2	72 	r 
	ld l,a			;99e3	6f 	o 
	ld (hl),d			;99e4	72 	r 
	jr nz,l9a50h		;99e5	20 69 	  i 
	ld l,(hl)			;99e7	6e 	n 
	jr nz,l9a2fh		;99e8	20 45 	  E 
	ld h,h			;99ea	64 	d 
	ld l,c			;99eb	69 	i 
	ld (hl),h			;99ec	74 	t 
	ld l,a			;99ed	6f 	o 
	ld (hl),d			;99ee	72 	r 
	ccf			;99ef	3f 	? 
	ld c,c			;99f0	49 	I 
	ld (hl),h			;99f1	74 	t 
	ld h,l			;99f2	65 	e 
	ld (hl),d			;99f3	72 	r 
	ld h,c			;99f4	61 	a 
	ld (hl),h			;99f5	74 	t 
	ld l,c			;99f6	69 	i 
	ld l,a			;99f7	6f 	o 
	ld l,(hl)			;99f8	6e 	n 
	jr nz,l9a61h		;99f9	20 66 	  f 
	ld h,c			;99fb	61 	a 
	ld (hl),l			;99fc	75 	u 
	ld l,h			;99fd	6c 	l 
	ld (hl),h			;99fe	74 	t 
	ccf			;99ff	3f 	? 
	ld c,(hl)			;9a00	4e 	N 
	ld l,a			;9a01	6f 	o 
	jr nz,l9a76h		;9a02	20 72 	  r 
	ld l,a			;9a04	6f 	o 
	ld l,a			;9a05	6f 	o 
	ld l,l			;9a06	6d 	m 
	ccf			;9a07	3f 	? 
	ld b,l			;9a08	45 	E 
	ld l,(hl)			;9a09	6e 	n 
	ld h,h			;9a0a	64 	d 
	jr nz,$+113		;9a0b	20 6f 	  o 
	ld h,(hl)			;9a0d	66 	f 
	jr nz,l9a76h		;9a0e	20 66 	  f 
	ld l,c			;9a10	69 	i 
	ld l,h			;9a11	6c 	l 
	ld h,l			;9a12	65 	e 
	ccf			;9a13	3f 	? 
	ld c,(hl)			;9a14	4e 	N 
	ld l,a			;9a15	6f 	o 
	jr nz,l9a7eh		;9a16	20 66 	  f 
	ld l,c			;9a18	69 	i 
	ld l,h			;9a19	6c 	l 
	ld h,l			;9a1a	65 	e 
	ccf			;9a1b	3f 	? 
l9a1ch:
	ld b,e			;9a1c	43 	C 
	ld h,c			;9a1d	61 	a 
	ld l,(hl)			;9a1e	6e 	n 
	daa			;9a1f	27 	' 
	ld (hl),h			;9a20	74 	t 
	jr nz,l9a89h		;9a21	20 66 	  f 
	ld l,c			;9a23	69 	i 
	ld l,(hl)			;9a24	6e 	n 
	ld h,h			;9a25	64 	d 
	jr nz,$+107		;9a26	20 69 	  i 
	ld l,(hl)			;9a28	6e 	n 
	jr nz,$+111		;9a29	20 6d 	  m 
l9a2bh:
	ld h,c			;9a2b	61 	a 
	ld h,e			;9a2c	63 	c 
l9a2dh:
	ld (hl),d			;9a2d	72 	r 
	ld l,a			;9a2e	6f 	o 
l9a2fh:
	ccf			;9a2f	3f 	? 
l9a30h:
	jr nz,l9a30h		;9a30	20 fe 	  . 
	ld c,a			;9a32	4f 	O 
	jr nz,l9a36h		;9a33	20 01 	  . 
	xor a			;9a35	af 	. 
l9a36h:
	cp 01fh		;9a36	fe 1f 	. . 
	jr nz,l9a3ch		;9a38	20 02 	  . 
	ld a,07fh		;9a3a	3e 7f 	>  
l9a3ch:
	cp 05fh		;9a3c	fe 5f 	. _ 
	jr nz,l9a41h		;9a3e	20 01 	  . 
	inc a			;9a40	3c 	< 
l9a41h:
	cp (iy-04dh)		;9a41	fd be b3 	. . . 
	jr nz,l9a48h		;9a44	20 02 	  . 
	ld a,01bh		;9a46	3e 1b 	> . 
l9a48h:
	cp 023h		;9a48	fe 23 	. # 
	jr nz,l9a4eh		;9a4a	20 02 	  . 
	ld a,05fh		;9a4c	3e 5f 	> _ 
l9a4eh:
	or a			;9a4e	b7 	. 
	ret			;9a4f	c9 	. 
l9a50h:
	or a			;9a50	b7 	. 
	jr nz,l9a57h		;9a51	20 04 	  . 
	ld a,04fh		;9a53	3e 4f 	> O 
	jr l9a5dh		;9a55	18 06 	. . 
l9a57h:
	cp 05fh		;9a57	fe 5f 	. _ 
	jr nz,l9a5dh		;9a59	20 02 	  . 
	ld a,023h		;9a5b	3e 23 	> # 
l9a5dh:
	cp 060h		;9a5d	fe 60 	. ` 
	jr nz,l9a62h		;9a5f	20 01 	  . 
l9a61h:
	dec a			;9a61	3d 	= 
l9a62h:
	or a			;9a62	b7 	. 
	ret			;9a63	c9 	. 
	rst 30h			;9a64	f7 	. 
	ld hl,001f7h		;9a65	21 f7 01 	! . . 
	push af			;9a68	f5 	. 
	call 0187fh		;9a69	cd 7f 18 	.  . 
	pop af			;9a6c	f1 	. 
	cp 059h		;9a6d	fe 59 	. Y 
	ret z			;9a6f	c8 	. 
	cp 079h		;9a70	fe 79 	. y 
	ret			;9a72	c9 	. 
	rst 30h			;9a73	f7 	. 
	dec bc			;9a74	0b 	. 
	ret			;9a75	c9 	. 
l9a76h:
	call 00243h		;9a76	cd 43 02 	. C . 
	ret			;9a79	c9 	. 
l9a7ah:
	ld ix,(006e5h)		;9a7a	dd 2a e5 06 	. * . . 
l9a7eh:
	call 00249h		;9a7e	cd 49 02 	. I . 
	ret c			;9a81	d8 	. 
	or a			;9a82	b7 	. 
	jr z,l9a7ah		;9a83	28 f5 	( . 
	cp 00ah		;9a85	fe 0a 	. . 
	jr z,l9a7ah		;9a87	28 f1 	( . 
l9a89h:
	cp 04fh		;9a89	fe 4f 	. O 
	jr nz,l9a8eh		;9a8b	20 01 	  . 
	xor a			;9a8d	af 	. 
l9a8eh:
	cp 05fh		;9a8e	fe 5f 	. _ 
	jr nz,l9a93h		;9a90	20 01 	  . 
	inc a			;9a92	3c 	< 
l9a93h:
	cp 023h		;9a93	fe 23 	. # 
	jr nz,l9a99h		;9a95	20 02 	  . 
	ld a,05fh		;9a97	3e 5f 	> _ 
l9a99h:
	or a			;9a99	b7 	. 
	ret			;9a9a	c9 	. 
	call 01b50h		;9a9b	cd 50 1b 	. P . 
	ld ix,(006e7h)		;9a9e	dd 2a e7 06 	. * . . 
	cp 01ah		;9aa2	fe 1a 	. . 
	ret z			;9aa4	c8 	. 
	call 0024fh		;9aa5	cd 4f 02 	. O . 
	ret nc			;9aa8	d0 	. 
	res 0,(iy-03bh)		;9aa9	fd cb c5 86 	. . . . 
	call 01bbch		;9aad	cd bc 1b 	. . . 
	call 015a8h		;9ab0	cd a8 15 	. . . 
	jp 00aa1h		;9ab3	c3 a1 0a 	. . . 
	call 01bbch		;9ab6	cd bc 1b 	. . . 
	jp 00aa1h		;9ab9	c3 a1 0a 	. . . 
	ld hl,01be2h		;9abc	21 e2 1b 	! . . 
	scf			;9abf	37 	7 
	adc a,a			;9ac0	8f 	. 
	ld b,a			;9ac1	47 	G 
l9ac2h:
	inc hl			;9ac2	23 	# 
	djnz l9ac2h		;9ac3	10 fd 	. . 
	ld c,(hl)			;9ac5	4e 	N 
	inc hl			;9ac6	23 	# 
	ld b,(hl)			;9ac7	46 	F 
	inc hl			;9ac8	23 	# 
	ld e,(hl)			;9ac9	5e 	^ 
	inc hl			;9aca	23 	# 
	ld d,(hl)			;9acb	56 	V 
	ex de,hl			;9acc	eb 	. 
	sbc hl,bc		;9acd	ed 42 	. B 
	push bc			;9acf	c5 	. 
	push hl			;9ad0	e5 	. 
	pop bc			;9ad1	c1 	. 
	pop hl			;9ad2	e1 	. 
	call 018eeh		;9ad3	cd ee 18 	. . . 
	ld hl,01b2fh		;9ad6	21 2f 1b 	! / . 
	ld bc,00002h		;9ad9	01 02 00 	. . . 
	call 018eeh		;9adc	cd ee 18 	. . . 
	call 0187fh		;9adf	cd 7f 18 	.  . 
	ret			;9ae2	c9 	. 
	inc bc			;9ae3	03 	. 
	inc e			;9ae4	1c 	. 
	ld de,01c1ch		;9ae5	11 1c 1c 	. . . 
	inc e			;9ae8	1c 	. 
	inc h			;9ae9	24 	$ 
	inc e			;9aea	1c 	. 
	ld (03e1ch),a		;9aeb	32 1c 3e 	2 . > 
	inc e			;9aee	1c 	. 
	ld c,d			;9aef	4a 	J 
	inc e			;9af0	1c 	. 
	ld e,h			;9af1	5c 	\ 
	inc e			;9af2	1c 	. 
	ld l,e			;9af3	6b 	k 
	inc e			;9af4	1c 	. 
	ld (hl),a			;9af5	77 	w 
	inc e			;9af6	1c 	. 
	add a,b			;9af7	80 	. 
	inc e			;9af8	1c 	. 
	adc a,l			;9af9	8d 	. 
	inc e			;9afa	1c 	. 
	sub a			;9afb	97 	. 
	inc e			;9afc	1c 	. 
	xor e			;9afd	ab 	. 
	inc e			;9afe	1c 	. 
	cp h			;9aff	bc 	. 
	inc e			;9b00	1c 	. 
	adc a,01ch		;9b01	ce 1c 	. . 
	ccf			;9b03	3f 	? 
	ld b,(hl)			;9b04	46 	F 
	ld l,c			;9b05	69 	i 
	ld l,h			;9b06	6c 	l 
	ld h,l			;9b07	65 	e 
	jr nz,l9b78h		;9b08	20 6e 	  n 
	ld l,a			;9b0a	6f 	o 
	ld (hl),h			;9b0b	74 	t 
	jr nz,l9b7dh		;9b0c	20 6f 	  o 
	ld (hl),b			;9b0e	70 	p 
	ld h,l			;9b0f	65 	e 
	ld l,(hl)			;9b10	6e 	n 
	ccf			;9b11	3f 	? 
	ld d,d			;9b12	52 	R 
	ld h,l			;9b13	65 	e 
	ld h,c			;9b14	61 	a 
	ld h,h			;9b15	64 	d 
	jr nz,l9b7dh		;9b16	20 65 	  e 
	ld (hl),d			;9b18	72 	r 
	ld (hl),d			;9b19	72 	r 
	ld l,a			;9b1a	6f 	o 
	ld (hl),d			;9b1b	72 	r 
	ccf			;9b1c	3f 	? 
	ld b,d			;9b1d	42 	B 
	ld h,c			;9b1e	61 	a 
	ld h,h			;9b1f	64 	d 
	jr nz,l9b86h		;9b20	20 64 	  d 
	ld h,l			;9b22	65 	e 
	halt			;9b23	76 	v 
	ccf			;9b24	3f 	? 
	ld b,d			;9b25	42 	B 
	ld h,c			;9b26	61 	a 
	ld h,h			;9b27	64 	d 
	jr nz,l9b90h		;9b28	20 66 	  f 
	ld l,c			;9b2a	69 	i 
	ld l,h			;9b2b	6c 	l 
	ld h,l			;9b2c	65 	e 
	jr nz,l9ba2h		;9b2d	20 73 	  s 
	ld (hl),b			;9b2f	70 	p 
	ld h,l			;9b30	65 	e 
	ld h,e			;9b31	63 	c 
	ccf			;9b32	3f 	? 
	ld b,l			;9b33	45 	E 
	ld l,(hl)			;9b34	6e 	n 
	ld h,h			;9b35	64 	d 
	jr nz,l9ba7h		;9b36	20 6f 	  o 
	ld h,(hl)			;9b38	66 	f 
	jr nz,l9ba1h		;9b39	20 66 	  f 
	ld l,c			;9b3b	69 	i 
	ld l,h			;9b3c	6c 	l 
	ld h,l			;9b3d	65 	e 
	ccf			;9b3e	3f 	? 
	ld d,a			;9b3f	57 	W 
	ld (hl),d			;9b40	72 	r 
	ld l,c			;9b41	69 	i 
	ld (hl),h			;9b42	74 	t 
	ld h,l			;9b43	65 	e 
	jr nz,l9babh		;9b44	20 65 	  e 
	ld (hl),d			;9b46	72 	r 
	ld (hl),d			;9b47	72 	r 
	ld l,a			;9b48	6f 	o 
	ld (hl),d			;9b49	72 	r 
	ccf			;9b4a	3f 	? 
	ld c,c			;9b4b	49 	I 
	ld l,h			;9b4c	6c 	l 
	ld l,h			;9b4d	6c 	l 
	ld h,l			;9b4e	65 	e 
	ld h,a			;9b4f	67 	g 
	ld h,c			;9b50	61 	a 
	ld l,h			;9b51	6c 	l 
	jr nz,l9bb9h		;9b52	20 65 	  e 
	ld a,b			;9b54	78 	x 
	ld (hl),h			;9b55	74 	t 
	ld h,l			;9b56	65 	e 
	ld l,(hl)			;9b57	6e 	n 
	ld (hl),e			;9b58	73 	s 
	ld l,c			;9b59	69 	i 
	ld l,a			;9b5a	6f 	o 
	ld l,(hl)			;9b5b	6e 	n 
	ccf			;9b5c	3f 	? 
	ld b,(hl)			;9b5d	46 	F 
	ld l,c			;9b5e	69 	i 
	ld l,h			;9b5f	6c 	l 
	ld h,l			;9b60	65 	e 
	jr nz,$+112		;9b61	20 6e 	  n 
	ld l,a			;9b63	6f 	o 
	ld (hl),h			;9b64	74 	t 
	jr nz,l9bcdh		;9b65	20 66 	  f 
	ld l,a			;9b67	6f 	o 
	ld (hl),l			;9b68	75 	u 
	ld l,(hl)			;9b69	6e 	n 
	ld h,h			;9b6a	64 	d 
	ccf			;9b6b	3f 	? 
	ld b,(hl)			;9b6c	46 	F 
	ld l,c			;9b6d	69 	i 
	ld l,h			;9b6e	6c 	l 
	ld h,l			;9b6f	65 	e 
	jr nz,l9bd7h		;9b70	20 65 	  e 
	ld a,b			;9b72	78 	x 
	ld l,c			;9b73	69 	i 
	ld (hl),e			;9b74	73 	s 
	ld (hl),h			;9b75	74 	t 
	ld (hl),e			;9b76	73 	s 
	ccf			;9b77	3f 	? 
l9b78h:
	ld b,h			;9b78	44 	D 
	ld l,c			;9b79	69 	i 
	ld (hl),d			;9b7a	72 	r 
	jr nz,l9be3h		;9b7b	20 66 	  f 
l9b7dh:
	ld (hl),l			;9b7d	75 	u 
	ld l,h			;9b7e	6c 	l 
	ld l,h			;9b7f	6c 	l 
	ccf			;9b80	3f 	? 
	ld b,e			;9b81	43 	C 
	ld h,c			;9b82	61 	a 
	ld l,(hl)			;9b83	6e 	n 
	ld l,(hl)			;9b84	6e 	n 
	ld l,a			;9b85	6f 	o 
l9b86h:
	ld (hl),h			;9b86	74 	t 
	jr nz,l9bech		;9b87	20 63 	  c 
	ld l,h			;9b89	6c 	l 
	ld l,a			;9b8a	6f 	o 
	ld (hl),e			;9b8b	73 	s 
	ld h,l			;9b8c	65 	e 
	ccf			;9b8d	3f 	? 
	ld b,h			;9b8e	44 	D 
	ld l,c			;9b8f	69 	i 
l9b90h:
	ld (hl),e			;9b90	73 	s 
	ld h,e			;9b91	63 	c 
	jr nz,l9bfah		;9b92	20 66 	  f 
	ld (hl),l			;9b94	75 	u 
	ld l,h			;9b95	6c 	l 
	ld l,h			;9b96	6c 	l 
	ccf			;9b97	3f 	? 
	ld (04245h),hl		;9b98	22 45 42 	" E B 
	ld (06120h),hl		;9b9b	22 20 61 	"   a 
	ld l,h			;9b9e	6c 	l 
	ld (hl),d			;9b9f	72 	r 
	ld h,l			;9ba0	65 	e 
l9ba1h:
	ld h,c			;9ba1	61 	a 
l9ba2h:
	ld h,h			;9ba2	64 	d 
	ld a,c			;9ba3	79 	y 
	jr nz,l9c07h		;9ba4	20 61 	  a 
	ld h,e			;9ba6	63 	c 
l9ba7h:
	ld (hl),h			;9ba7	74 	t 
	ld l,c			;9ba8	69 	i 
	halt			;9ba9	76 	v 
	ld h,l			;9baa	65 	e 
l9babh:
	ccf			;9bab	3f 	? 
	ld c,a			;9bac	4f 	O 
	ld (hl),l			;9bad	75 	u 
	ld (hl),h			;9bae	74 	t 
	ld (hl),b			;9baf	70 	p 
	ld (hl),l			;9bb0	75 	u 
	ld (hl),h			;9bb1	74 	t 
	jr nz,l9c1ah		;9bb2	20 66 	  f 
	ld l,c			;9bb4	69 	i 
	ld l,h			;9bb5	6c 	l 
	ld h,l			;9bb6	65 	e 
	jr nz,l9c28h		;9bb7	20 6f 	  o 
l9bb9h:
	ld (hl),b			;9bb9	70 	p 
	ld h,l			;9bba	65 	e 
	ld l,(hl)			;9bbb	6e 	n 
	ccf			;9bbc	3f 	? 
	ld (04245h),hl		;9bbd	22 45 42 	" E B 
	ld (02d20h),hl		;9bc0	22 20 2d 	"   - 
	jr nz,l9c32h		;9bc3	20 6d 	  m 
	ld l,a			;9bc5	6f 	o 
	ld (hl),d			;9bc6	72 	r 
	ld h,l			;9bc7	65 	e 
	jr nz,l9c33h		;9bc8	20 69 	  i 
	ld l,(hl)			;9bca	6e 	n 
	ld (hl),b			;9bcb	70 	p 
	ld (hl),l			;9bcc	75 	u 
l9bcdh:
	ld (hl),h			;9bcd	74 	t 
	ex de,hl			;9bce	eb 	. 
	ld hl,(02aebh)		;9bcf	2a eb 2a 	* . * 
	xor 02ah		;9bd2	ee 2a 	. * 
	ex de,hl			;9bd4	eb 	. 
	dec hl			;9bd5	2b 	+ 
	ex de,hl			;9bd6	eb 	. 
l9bd7h:
	ld hl,(00151h)		;9bd7	2a 51 01 	* Q . 
	nop			;9bda	00 	. 
	nop			;9bdb	00 	. 
	rst 38h			;9bdc	ff 	. 
	rst 38h			;9bdd	ff 	. 
	jp (hl)			;9bde	e9 	. 
	add a,b			;9bdf	80 	. 
	call p,0ebcdh		;9be0	f4 cd eb 	. . . 
l9be3h:
	ld hl,(0cb00h)		;9be3	2a 00 cb 	* . . 
	ld b,b			;9be6	40 	@ 
	jr z,l9bf1h		;9be7	28 08 	( . 
	call 0122fh		;9be9	cd 2f 12 	. / . 
l9bech:
	defb 0ddh,080h,002h	;illegal sequence		;9bec	dd 80 02 	. . . 
	jr l9c4bh		;9bef	18 5a 	. Z 
l9bf1h:
	ld d,e			;9bf1	53 	S 
	ld c,l			;9bf2	4d 	M 
	cp 001h		;9bf3	fe 01 	. . 
	jp nz,0125eh		;9bf5	c2 5e 12 	. ^ . 
	exx			;9bf8	d9 	. 
	ld a,d			;9bf9	7a 	z 
l9bfah:
	cp 08eh		;9bfa	fe 8e 	. . 
	jr z,l9c02h		;9bfc	28 04 	( . 
	cp 08fh		;9bfe	fe 8f 	. . 
	nop			;9c00	00 	. 
	ld d,b			;9c01	50 	P 
l9c02h:
	ld c,a			;9c02	4f 	O 
	ld d,l			;9c03	55 	U 
	ld c,(hl)			;9c04	4e 	N 
	ex de,hl			;9c05	eb 	. 
	dec hl			;9c06	2b 	+ 
l9c07h:
	ex de,hl			;9c07	eb 	. 
	dec hl			;9c08	2b 	+ 
	ex de,hl			;9c09	eb 	. 
	dec l			;9c0a	2d 	- 
	inc h			;9c0b	24 	$ 
	nop			;9c0c	00 	. 
	nop			;9c0d	00 	. 
	nop			;9c0e	00 	. 
	nop			;9c0f	00 	. 
	nop			;9c10	00 	. 
	nop			;9c11	00 	. 
	nop			;9c12	00 	. 
	ex de,hl			;9c13	eb 	. 
	dec l			;9c14	2d 	- 
	ex de,hl			;9c15	eb 	. 
	dec l			;9c16	2d 	- 
	sub 06ch		;9c17	d6 6c 	. l 
	dec b			;9c19	05 	. 
l9c1ah:
	ld l,l			;9c1a	6d 	m 
	nop			;9c1b	00 	. 
	nop			;9c1c	00 	. 
	nop			;9c1d	00 	. 
	nop			;9c1e	00 	. 
	nop			;9c1f	00 	. 
	nop			;9c20	00 	. 
	ld d,b			;9c21	50 	P 
	ld b,e			;9c22	43 	C 
	ld b,e			;9c23	43 	C 
	jr nz,l9c46h		;9c24	20 20 	    
	jr nz,l9c48h		;9c26	20 20 	    
l9c28h:
	jr nz,l9c6dh		;9c28	20 43 	  C 
	ld c,a			;9c2a	4f 	O 
	ld c,l			;9c2b	4d 	M 
	nop			;9c2c	00 	. 
	nop			;9c2d	00 	. 
	nop			;9c2e	00 	. 
	jr c,l9c74h		;9c2f	38 43 	8 C 
	ld b,h			;9c31	44 	D 
l9c32h:
	ld b,l			;9c32	45 	E 
l9c33h:
	ld b,(hl)			;9c33	46 	F 
	ld b,a			;9c34	47 	G 
	ld c,b			;9c35	48 	H 
	ld c,c			;9c36	49 	I 
	nop			;9c37	00 	. 
	nop			;9c38	00 	. 
	nop			;9c39	00 	. 
	nop			;9c3a	00 	. 
	nop			;9c3b	00 	. 
	nop			;9c3c	00 	. 
	nop			;9c3d	00 	. 
	nop			;9c3e	00 	. 
	nop			;9c3f	00 	. 
	push hl			;9c40	e5 	. 
	push hl			;9c41	e5 	. 
	push hl			;9c42	e5 	. 
	push hl			;9c43	e5 	. 
	push hl			;9c44	e5 	. 
	push hl			;9c45	e5 	. 
l9c46h:
	push hl			;9c46	e5 	. 
	push hl			;9c47	e5 	. 
l9c48h:
	push hl			;9c48	e5 	. 
	push hl			;9c49	e5 	. 
	push hl			;9c4a	e5 	. 
l9c4bh:
	push hl			;9c4b	e5 	. 
	push hl			;9c4c	e5 	. 
	push hl			;9c4d	e5 	. 
	push hl			;9c4e	e5 	. 
	push hl			;9c4f	e5 	. 
	push hl			;9c50	e5 	. 
	push hl			;9c51	e5 	. 
	push hl			;9c52	e5 	. 
	push hl			;9c53	e5 	. 
	push hl			;9c54	e5 	. 
	push hl			;9c55	e5 	. 
	push hl			;9c56	e5 	. 
	push hl			;9c57	e5 	. 
	push hl			;9c58	e5 	. 
	push hl			;9c59	e5 	. 
	push hl			;9c5a	e5 	. 
	push hl			;9c5b	e5 	. 
	push hl			;9c5c	e5 	. 
	push hl			;9c5d	e5 	. 
	push hl			;9c5e	e5 	. 
	push hl			;9c5f	e5 	. 
	push hl			;9c60	e5 	. 
	push hl			;9c61	e5 	. 
	push hl			;9c62	e5 	. 
	push hl			;9c63	e5 	. 
	push hl			;9c64	e5 	. 
	push hl			;9c65	e5 	. 
	push hl			;9c66	e5 	. 
	push hl			;9c67	e5 	. 
	push hl			;9c68	e5 	. 
	push hl			;9c69	e5 	. 
	push hl			;9c6a	e5 	. 
	push hl			;9c6b	e5 	. 
	push hl			;9c6c	e5 	. 
l9c6dh:
	push hl			;9c6d	e5 	. 
	push hl			;9c6e	e5 	. 
	push hl			;9c6f	e5 	. 
	push hl			;9c70	e5 	. 
	push hl			;9c71	e5 	. 
	push hl			;9c72	e5 	. 
	push hl			;9c73	e5 	. 
l9c74h:
	push hl			;9c74	e5 	. 
	push hl			;9c75	e5 	. 
	push hl			;9c76	e5 	. 
	push hl			;9c77	e5 	. 
	push hl			;9c78	e5 	. 
	push hl			;9c79	e5 	. 
	push hl			;9c7a	e5 	. 
	push hl			;9c7b	e5 	. 
	push hl			;9c7c	e5 	. 
	push hl			;9c7d	e5 	. 
	push hl			;9c7e	e5 	. 
	push hl			;9c7f	e5 	. 
	jr z,l9c8dh		;9c80	28 0b 	( . 
	cp 012h		;9c82	fe 12 	. . 
	jr z,l9c8ah		;9c84	28 04 	( . 
	cp 013h		;9c86	fe 13 	. . 
	jr nz,l9c94h		;9c88	20 0a 	  . 
l9c8ah:
	call 0120ch		;9c8a	cd 0c 12 	. . . 
l9c8dh:
	ld a,0f9h		;9c8d	3e f9 	> . 
	call 005abh		;9c8f	cd ab 05 	. . . 
	ld l,l			;9c92	6d 	m 
	dec b			;9c93	05 	. 
l9c94h:
	ld l,l			;9c94	6d 	m 
	ex de,hl			;9c95	eb 	. 
	dec hl			;9c96	2b 	+ 
	dec b			;9c97	05 	. 
	ld l,l			;9c98	6d 	m 
	jp (hl)			;9c99	e9 	. 
	ld hl,(02d4fh)		;9c9a	2a 4f 2d 	* O - 
	ex de,hl			;9c9d	eb 	. 
	inc l			;9c9e	2c 	, 
	dec a			;9c9f	3d 	= 
	nop			;9ca0	00 	. 
	nop			;9ca1	00 	. 
	ld b,001h		;9ca2	06 01 	. . 
	ld bc,00848h		;9ca4	01 48 08 	. H . 
	ex af,af'			;9ca7	08 	. 
	inc b			;9ca8	04 	. 
	inc c			;9ca9	0c 	. 
	ld bc,00000h		;9caa	01 00 00 	. . . 
	nop			;9cad	00 	. 
	nop			;9cae	00 	. 
	nop			;9caf	00 	. 
	nop			;9cb0	00 	. 
	nop			;9cb1	00 	. 
	inc hl			;9cb2	23 	# 
	nop			;9cb3	00 	. 
	nop			;9cb4	00 	. 
	nop			;9cb5	00 	. 
	nop			;9cb6	00 	. 
	nop			;9cb7	00 	. 
	nop			;9cb8	00 	. 
	nop			;9cb9	00 	. 
	nop			;9cba	00 	. 
	ret nc			;9cbb	d0 	. 
	dec e			;9cbc	1d 	. 
	ret c			;9cbd	d8 	. 
	dec e			;9cbe	1d 	. 
	rst 18h			;9cbf	df 	. 
	dec e			;9cc0	1d 	. 
	jp (hl)			;9cc1	e9 	. 
	dec e			;9cc2	1d 	. 
	jp p,0fa1dh		;9cc3	f2 1d fa 	. . . 
	dec e			;9cc6	1d 	. 
	nop			;9cc7	00 	. 
	ld e,006h		;9cc8	1e 06 	. . 
	ld e,00ch		;9cca	1e 0c 	. . 
	ld e,012h		;9ccc	1e 12 	. . 
	ld e,020h		;9cce	1e 20 	.   
	ld e,a			;9cd0	5f 	_ 
	ex af,af'			;9cd1	08 	. 
	nop			;9cd2	00 	. 
	nop			;9cd3	00 	. 
	nop			;9cd4	00 	. 
	nop			;9cd5	00 	. 
	nop			;9cd6	00 	. 
	nop			;9cd7	00 	. 
	nop			;9cd8	00 	. 
	nop			;9cd9	00 	. 
	nop			;9cda	00 	. 
	nop			;9cdb	00 	. 
	nop			;9cdc	00 	. 
	nop			;9cdd	00 	. 
	nop			;9cde	00 	. 
	ex af,af'			;9cdf	08 	. 
	nop			;9ce0	00 	. 
	nop			;9ce1	00 	. 
	nop			;9ce2	00 	. 
	nop			;9ce3	00 	. 
	nop			;9ce4	00 	. 
	nop			;9ce5	00 	. 
	nop			;9ce6	00 	. 
	nop			;9ce7	00 	. 
	nop			;9ce8	00 	. 
	nop			;9ce9	00 	. 
	nop			;9cea	00 	. 
	nop			;9ceb	00 	. 
	nop			;9cec	00 	. 
	nop			;9ced	00 	. 
	nop			;9cee	00 	. 
	nop			;9cef	00 	. 
	nop			;9cf0	00 	. 
	nop			;9cf1	00 	. 
	nop			;9cf2	00 	. 
	nop			;9cf3	00 	. 
	nop			;9cf4	00 	. 
	nop			;9cf5	00 	. 
	nop			;9cf6	00 	. 
	nop			;9cf7	00 	. 
	nop			;9cf8	00 	. 
	nop			;9cf9	00 	. 
	dec de			;9cfa	1b 	. 
	nop			;9cfb	00 	. 
	nop			;9cfc	00 	. 
	nop			;9cfd	00 	. 
	nop			;9cfe	00 	. 
	nop			;9cff	00 	. 
	dec de			;9d00	1b 	. 
	ld b,h			;9d01	44 	D 
	nop			;9d02	00 	. 
	nop			;9d03	00 	. 
	nop			;9d04	00 	. 
	nop			;9d05	00 	. 
	dec de			;9d06	1b 	. 
	ld d,l			;9d07	55 	U 
	nop			;9d08	00 	. 
	nop			;9d09	00 	. 
	nop			;9d0a	00 	. 
	nop			;9d0b	00 	. 
	ex af,af'			;9d0c	08 	. 
	nop			;9d0d	00 	. 
	nop			;9d0e	00 	. 
	nop			;9d0f	00 	. 
	nop			;9d10	00 	. 
	nop			;9d11	00 	. 
	dec de			;9d12	1b 	. 
	ld c,(hl)			;9d13	4e 	N 
	nop			;9d14	00 	. 
	nop			;9d15	00 	. 
	nop			;9d16	00 	. 
	nop			;9d17	00 	. 
	inc a			;9d18	3c 	< 
	inc a			;9d19	3c 	< 
	add a,b			;9d1a	80 	. 
	dec c			;9d1b	0d 	. 
	ld sp,00000h		;9d1c	31 00 00 	1 . . 
	nop			;9d1f	00 	. 
	nop			;9d20	00 	. 
	nop			;9d21	00 	. 
	call pe,01e2ch		;9d22	ec 2c 1e 	. , . 
	ld e,0b3h		;9d25	1e b3 	. . 
	dec l			;9d27	2d 	- 
	call 01491h		;9d28	cd 91 14 	. . . 
	ld a,083h		;9d2b	3e 83 	> . 
	jr l9d3fh		;9d2d	18 10 	. . 
	ld a,081h		;9d2f	3e 81 	> . 
	jr l9d3fh		;9d31	18 0c 	. . 
	ld a,(01cddh)		;9d33	3a dd 1c 	: . . 
	or a			;9d36	b7 	. 
	jp m,00d6bh		;9d37	fa 6b 0d 	. k . 
	xor a			;9d3a	af 	. 
	jr l9d3fh		;9d3b	18 02 	. . 
	ld a,001h		;9d3d	3e 01 	> . 
l9d3fh:
	ld (iy-02fh),a		;9d3f	fd 77 d1 	. w . 
	call 01a72h		;9d42	cd 72 1a 	. r . 
	call 01a83h		;9d45	cd 83 1a 	. . . 
	call 01424h		;9d48	cd 24 14 	. $ . 
	ld hl,(01d19h)		;9d4b	2a 19 1d 	* . . 
	ld de,(01d17h)		;9d4e	ed 5b 17 1d 	. [ . . 
	call 01a8bh		;9d52	cd 8b 1a 	. . . 
	ret z			;9d55	c8 	. 
	ld (iy-040h),00dh		;9d56	fd 36 c0 0d 	. 6 . . 
	ld (01d91h),hl		;9d5a	22 91 1d 	" . . 
	ld (01d93h),de		;9d5d	ed 53 93 1d 	. S . . 
	ld (01d99h),sp		;9d61	ed 73 99 1d 	. s . . 
	ld hl,(01d05h)		;9d65	2a 05 1d 	* . . 
	ld (01d07h),hl		;9d68	22 07 1d 	" . . 
	bit 0,(iy-03ah)		;9d6b	fd cb c6 46 	. . . F 
	jr nz,l9da8h		;9d6f	20 37 	  7 
	call 021b4h		;9d71	cd b4 21 	. . ! 
	ld hl,01d9fh		;9d74	21 9f 1d 	! . . 
	ld de,00131h		;9d77	11 31 01 	. 1 . 
	ld bc,0001ch		;9d7a	01 1c 00 	. . . 
	ldir		;9d7d	ed b0 	. . 
	call 027beh		;9d7f	cd be 27 	. . ' 
	ld a,(iy-02ch)		;9d82	fd 7e d4 	. ~ . 
	ld (iy-030h),a		;9d85	fd 77 d0 	. w . 
	ld hl,(01d05h)		;9d88	2a 05 1d 	* . . 
	ld (01d95h),hl		;9d8b	22 95 1d 	" . . 
	inc h			;9d8e	24 	$ 
	ld (01d9dh),hl		;9d8f	22 9d 1d 	" . . 
	ld (hl),00dh		;9d92	36 0d 	6 . 
	ld de,00064h		;9d94	11 64 00 	. d . 
	add hl,de			;9d97	19 	. 
	ld (01d9bh),hl		;9d98	22 9b 1d 	" . . 
	ex de,hl			;9d9b	eb 	. 
	add hl,de			;9d9c	19 	. 
	ld (01e26h),hl		;9d9d	22 26 1e 	" & . 
	ld hl,01e18h		;9da0	21 18 1e 	! . . 
	ld bc,00004h		;9da3	01 04 00 	. . . 
	ldir		;9da6	ed b0 	. . 
l9da8h:
	bit 0,(iy-02bh)		;9da8	fd cb d5 46 	. . . F 
	jp nz,02170h		;9dac	c2 70 21 	. p ! 
l9dafh:
	ld a,(iy-027h)		;9daf	fd 7e d9 	. ~ . 
	sub (iy-025h)		;9db2	fd 96 db 	. . . 
	ld (iy-010h),a		;9db5	fd 77 f0 	. w . 
	ld a,(iy-01bh)		;9db8	fd 7e e5 	. ~ . 
	or a			;9dbb	b7 	. 
	jr nz,l9dc3h		;9dbc	20 05 	  . 
	ld a,(iy-025h)		;9dbe	fd 7e db 	. ~ . 
	srl a		;9dc1	cb 3f 	. ? 
l9dc3h:
	add a,(iy-010h)		;9dc3	fd 86 f0 	. . . 
	dec a			;9dc6	3d 	= 
	ld (iy-011h),a		;9dc7	fd 77 ef 	. w . 
	ld a,(iy-026h)		;9dca	fd 7e da 	. ~ . 
	sub (iy-024h)		;9dcd	fd 96 dc 	. . . 
	jp m,021ceh		;9dd0	fa ce 21 	. . ! 
	ld (iy-00fh),a		;9dd3	fd 77 f1 	. w . 
	jp 021ceh		;9dd6	c3 ce 21 	. . ! 
	ld a,(iy-026h)		;9dd9	fd 7e da 	. ~ . 
	call 02546h		;9ddc	cd 46 25 	. F % 
	ld (iy-026h),a		;9ddf	fd 77 da 	. w . 
	jr l9dafh		;9de2	18 cb 	. . 
	ld a,(iy-024h)		;9de4	fd 7e dc 	. ~ . 
	call 02546h		;9de7	cd 46 25 	. F % 
	ld (iy-024h),a		;9dea	fd 77 dc 	. w . 
	jr l9dafh		;9ded	18 c0 	. . 
	ld a,(iy-025h)		;9def	fd 7e db 	. ~ . 
	call 02546h		;9df2	cd 46 25 	. F % 
	ld (iy-025h),a		;9df5	fd 77 db 	. w . 
	jr l9dafh		;9df8	18 b5 	. . 
	ld a,(iy-027h)		;9dfa	fd 7e d9 	. ~ . 
	call 02546h		;9dfd	cd 46 25 	. F % 
	ld (iy-027h),a		;9e00	fd 77 d9 	. w . 
	jr l9dafh		;9e03	18 aa 	. . 
	ld a,(iy-01bh)		;9e05	fd 7e e5 	. ~ . 
	call 02546h		;9e08	cd 46 25 	. F % 
	ld (iy-01bh),a		;9e0b	fd 77 e5 	. w . 
	jr l9dafh		;9e0e	18 9f 	. . 
	call 0248bh		;9e10	cd 8b 24 	. . $ 
	ld a,(iy-023h)		;9e13	fd 7e dd 	. ~ . 
	call 022f7h		;9e16	cd f7 22 	. . " 
	jp m,021cbh		;9e19	fa cb 21 	. . ! 
	ld (iy-023h),a		;9e1c	fd 77 dd 	. w . 
	jp 021cbh		;9e1f	c3 cb 21 	. . ! 
l9e22h:
	ld hl,(01d91h)		;9e22	2a 91 1d 	* . . 
	ld de,(01d93h)		;9e25	ed 5b 93 1d 	. [ . . 
	call 01a8bh		;9e29	cd 8b 1a 	. . . 
	jr z,l9e97h		;9e2c	28 69 	( i 
	ld a,(de)			;9e2e	1a 	. 
	inc de			;9e2f	13 	. 
	ld (01d93h),de		;9e30	ed 53 93 1d 	. S . . 
	call 01b50h		;9e34	cd 50 1b 	. P . 
	cp 080h		;9e37	fe 80 	. . 
	jr nz,l9e40h		;9e39	20 05 	  . 
	inc (iy-01dh)		;9e3b	fd 34 e3 	. 4 . 
	jr l9e22h		;9e3e	18 e2 	. . 
l9e40h:
	cp 020h		;9e40	fe 20 	.   
	jr nc,l9e4ch		;9e42	30 08 	0 . 
	cp 00dh		;9e44	fe 0d 	. . 
	jr z,l9e4ch		;9e46	28 04 	( . 
	cp 009h		;9e48	fe 09 	. . 
	jr nz,l9e22h		;9e4a	20 d6 	  . 
l9e4ch:
	ld b,(iy-040h)		;9e4c	fd 46 c0 	. F . 
	ld (iy-040h),a		;9e4f	fd 77 c0 	. w . 
	ret			;9e52	c9 	. 
	call 01f22h		;9e53	cd 22 1f 	. " . 
	cp (iy-01eh)		;9e56	fd be e2 	. . . 
	jr nz,l9e5dh		;9e59	20 02 	  . 
	ld a,0ffh		;9e5b	3e ff 	> . 
l9e5dh:
	cp (iy-019h)		;9e5d	fd be e7 	. . . 
	jr nz,l9e64h		;9e60	20 02 	  . 
	ld a,0feh		;9e62	3e fe 	> . 
l9e64h:
	cp (iy-016h)		;9e64	fd be ea 	. . . 
	jr nz,l9e6bh		;9e67	20 02 	  . 
	ld a,0fdh		;9e69	3e fd 	> . 
l9e6bh:
	cp (iy-015h)		;9e6b	fd be eb 	. . . 
	jr nz,l9e72h		;9e6e	20 02 	  . 
	ld a,0fch		;9e70	3e fc 	> . 
l9e72h:
	cp (iy-014h)		;9e72	fd be ec 	. . . 
	jr nz,l9e79h		;9e75	20 02 	  . 
	ld a,0fbh		;9e77	3e fb 	> . 
l9e79h:
	cp (iy-013h)		;9e79	fd be ed 	. . . 
	jr nz,l9e80h		;9e7c	20 02 	  . 
	ld a,0fah		;9e7e	3e fa 	> . 
l9e80h:
	cp (iy-012h)		;9e80	fd be ee 	. . . 
	jr nz,l9e87h		;9e83	20 02 	  . 
	ld a,0f9h		;9e85	3e f9 	> . 
l9e87h:
	ld c,a			;9e87	4f 	O 
	ld a,b			;9e88	78 	x 
	cp 00dh		;9e89	fe 0d 	. . 
	ld a,c			;9e8b	79 	y 
	ret			;9e8c	c9 	. 
	call 0248bh		;9e8d	cd 8b 24 	. . $ 
	set 0,(iy-03ah)		;9e90	fd cb c6 c6 	. . . . 
	jp 01e71h		;9e94	c3 71 1e 	. q . 
l9e97h:
	bit 0,(iy-03ah)		;9e97	fd cb c6 46 	. . . F 
	jr nz,l9eabh		;9e9b	20 0e 	  . 
	res 0,(iy-03ah)		;9e9d	fd cb c6 86 	. . . . 
	call 0248bh		;9ea1	cd 8b 24 	. . $ 
	ld a,(iy-020h)		;9ea4	fd 7e e0 	. ~ . 
	or a			;9ea7	b7 	. 
	call nz,0237ah		;9ea8	c4 7a 23 	. z # 
l9eabh:
	ld sp,(01d99h)		;9eab	ed 7b 99 1d 	. { . . 
	ret			;9eaf	c9 	. 
	call 01f53h		;9eb0	cd 53 1f 	. S . 
	ret nz			;9eb3	c0 	. 
	cp 02eh		;9eb4	fe 2e 	. . 
	jr z,l9ed0h		;9eb6	28 18 	( . 
	bit 0,(iy-02bh)		;9eb8	fd cb d5 46 	. . . F 
	ret nz			;9ebc	c0 	. 
	ld (iy-032h),000h		;9ebd	fd 36 ce 00 	. 6 . . 
	ld (iy-033h),000h		;9ec1	fd 36 cd 00 	. 6 . . 
	cp 00dh		;9ec5	fe 0d 	. . 
	jp z,02510h		;9ec7	ca 10 25 	. . % 
	cp 009h		;9eca	fe 09 	. . 
	jp z,0252ch		;9ecc	ca 2c 25 	. , % 
	ret			;9ecf	c9 	. 
l9ed0h:
	res 5,(iy-02bh)		;9ed0	fd cb d5 ae 	. . . . 
	call 01f22h		;9ed4	cd 22 1f 	. " . 
	call 02073h		;9ed7	cd 73 20 	. s   
	ld (iy-037h),a		;9eda	fd 77 c9 	. w . 
	call 01f22h		;9edd	cd 22 1f 	. " . 
	call 02073h		;9ee0	cd 73 20 	. s   
	ld (iy-036h),a		;9ee3	fd 77 ca 	. w . 
	ld hl,02081h		;9ee6	21 81 20 	! .   
l9ee9h:
	ld a,(hl)			;9ee9	7e 	~ 
	inc hl			;9eea	23 	# 
	or a			;9eeb	b7 	. 
	jr z,l9efeh		;9eec	28 10 	( . 
	cp (iy-037h)		;9eee	fd be c9 	. . . 
	jr nz,l9ef9h		;9ef1	20 06 	  . 
	ld a,(hl)			;9ef3	7e 	~ 
	cp (iy-036h)		;9ef4	fd be ca 	. . . 
	jr z,l9efeh		;9ef7	28 05 	( . 
l9ef9h:
	inc hl			;9ef9	23 	# 
	inc hl			;9efa	23 	# 
	inc hl			;9efb	23 	# 
	jr l9ee9h		;9efc	18 eb 	. . 
l9efeh:
	inc hl			;9efe	23 	# 
	ld e,(hl)			;9eff	5e 	^ 
	inc hl			;9f00	23 	# 
	ld d,(hl)			;9f01	56 	V 
	push de			;9f02	d5 	. 
	ld de,02127h		;9f03	11 27 21 	. ' ! 
	sbc hl,de		;9f06	ed 52 	. R 
	jr c,l9f17h		;9f08	38 0d 	8 . 
	ld a,l			;9f0a	7d 	} 
	cp 018h		;9f0b	fe 18 	. . 
	jr c,l9f6bh		;9f0d	38 5c 	8 \ 
	call 01f22h		;9f0f	cd 22 1f 	. " . 
	ld (025b5h),a		;9f12	32 b5 25 	2 . % 
	jr l9f62h		;9f15	18 4b 	. K 
l9f17h:
	xor a			;9f17	af 	. 
	ld (iy-033h),a		;9f18	fd 77 cd 	. w . 
	sbc hl,hl		;9f1b	ed 62 	. b 
	ld (0012ch),hl		;9f1d	22 2c 01 	" , . 
l9f20h:
	call 01f22h		;9f20	cd 22 1f 	. " . 
	cp 00dh		;9f23	fe 0d 	. . 
	jr z,l9f6bh		;9f25	28 44 	( D 
	cp 021h		;9f27	fe 21 	. ! 
	jr c,l9f20h		;9f29	38 f5 	8 . 
	cp 02bh		;9f2b	fe 2b 	. + 
	jr nz,l9f35h		;9f2d	20 06 	  . 
	set 0,(iy-033h)		;9f2f	fd cb cd c6 	. . . . 
	jr l9f5bh		;9f33	18 26 	. & 
l9f35h:
	cp 02dh		;9f35	fe 2d 	. - 
	jr nz,l9f3fh		;9f37	20 06 	  . 
	set 1,(iy-033h)		;9f39	fd cb cd ce 	. . . . 
	jr l9f5bh		;9f3d	18 1c 	. . 
l9f3fh:
	sub 030h		;9f3f	d6 30 	. 0 
	jr c,l9f60h		;9f41	38 1d 	8 . 
	cp 00ah		;9f43	fe 0a 	. . 
	jr nc,l9f60h		;9f45	30 19 	0 . 
	ld c,a			;9f47	4f 	O 
	xor a			;9f48	af 	. 
	ld b,a			;9f49	47 	G 
	ld hl,(0012ch)		;9f4a	2a 2c 01 	* , . 
	add hl,hl			;9f4d	29 	) 
	ld d,h			;9f4e	54 	T 
	ld e,l			;9f4f	5d 	] 
	add hl,hl			;9f50	29 	) 
	add hl,hl			;9f51	29 	) 
	add hl,de			;9f52	19 	. 
	add hl,bc			;9f53	09 	. 
	ld (0012ch),hl		;9f54	22 2c 01 	" , . 
	set 2,(iy-033h)		;9f57	fd cb cd d6 	. . . . 
l9f5bh:
	call 01f22h		;9f5b	cd 22 1f 	. " . 
	jr l9f3fh		;9f5e	18 df 	. . 
l9f60h:
	add a,030h		;9f60	c6 30 	. 0 
l9f62h:
	cp 00dh		;9f62	fe 0d 	. . 
	jr z,l9f6bh		;9f64	28 05 	( . 
	call 01f22h		;9f66	cd 22 1f 	. " . 
	jr l9f62h		;9f69	18 f7 	. . 
l9f6bh:
	ld hl,00000h		;9f6b	21 00 00 	! . . 
	ld (00146h),hl		;9f6e	22 46 01 	" F . 
	pop hl			;9f71	e1 	. 
	jp (hl)			;9f72	e9 	. 
	cp 00dh		;9f73	fe 0d 	. . 
	jr z,l9f7dh		;9f75	28 06 	( . 
	cp 061h		;9f77	fe 61 	. a 
	ret c			;9f79	d8 	. 
	sub 020h		;9f7a	d6 20 	.   
	ret			;9f7c	c9 	. 
l9f7dh:
	pop af			;9f7d	f1 	. 
	jp 0255fh		;9f7e	c3 5f 25 	. _ % 
	ld c,h			;9f81	4c 	L 
	ld c,c			;9f82	49 	I 
	ld l,c			;9f83	69 	i 
	ld hl,05242h		;9f84	21 42 52 	! B R 
	ld a,(bc)			;9f87	0a 	. 
	dec h			;9f88	25 	% 
	ld d,e			;9f89	53 	S 
	ld d,h			;9f8a	54 	T 
	adc a,021h		;9f8b	ce 21 	. ! 
	ld d,e			;9f8d	53 	S 
	ld d,b			;9f8e	50 	P 
	djnz l9fb6h		;9f8f	10 25 	. % 
	ld d,b			;9f91	50 	P 
	ld d,b			;9f92	50 	P 
	inc l			;9f93	2c 	, 
	dec h			;9f94	25 	% 
	ld c,h			;9f95	4c 	L 
	ld c,h			;9f96	4c 	L 
	ret z			;9f97	c8 	. 
	inc h			;9f98	24 	$ 
	ld c,c			;9f99	49 	I 
	ld c,(hl)			;9f9a	4e 	N 
	pop hl			;9f9b	e1 	. 
	inc h			;9f9c	24 	$ 
	ld d,h			;9f9d	54 	T 
	ld c,c			;9f9e	49 	I 
	ld d,c			;9f9f	51 	Q 
	dec h			;9fa0	25 	% 
	ld c,h			;9fa1	4c 	L 
	ld d,e			;9fa2	53 	S 
	or e			;9fa3	b3 	. 
	inc h			;9fa4	24 	$ 
	ld d,c			;9fa5	51 	Q 
	ld c,c			;9fa6	49 	I 
	inc b			;9fa7	04 	. 
	dec h			;9fa8	25 	% 
	ld b,e			;9fa9	43 	C 
	ld c,c			;9faa	49 	I 
	inc b			;9fab	04 	. 
	dec h			;9fac	25 	% 
	ld d,e			;9fad	53 	S 
	ld d,e			;9fae	53 	S 
	or 024h		;9faf	f6 24 	. $ 
	ld b,h			;9fb1	44 	D 
	ld d,e			;9fb2	53 	S 
	defb 0fdh,024h	;inc iyh		;9fb3	fd 24 	. $ 
	ld c,(hl)			;9fb5	4e 	N 
l9fb6h:
	ld b,c			;9fb6	41 	A 
	ld a,b			;9fb7	78 	x 
	dec h			;9fb8	25 	% 
	ld d,d			;9fb9	52 	R 
	ld d,d			;9fba	52 	R 
	ld a,b			;9fbb	78 	x 
	dec h			;9fbc	25 	% 
	ld b,c			;9fbd	41 	A 
	ld b,h			;9fbe	44 	D 
	add a,d			;9fbf	82 	. 
	dec h			;9fc0	25 	% 
	ld b,(hl)			;9fc1	46 	F 
	ld c,d			;9fc2	4a 	J 
	add a,d			;9fc3	82 	. 
	dec h			;9fc4	25 	% 
	ld c,c			;9fc5	49 	I 
	ld b,a			;9fc6	47 	G 
	adc a,h			;9fc7	8c 	. 
	dec h			;9fc8	25 	% 
	ld c,l			;9fc9	4d 	M 
	ld d,h			;9fca	54 	T 
	exx			;9fcb	d9 	. 
	ld e,054h		;9fcc	1e 54 	. T 
	ld d,e			;9fce	53 	S 
	exx			;9fcf	d9 	. 
	ld e,048h		;9fd0	1e 48 	. H 
	ld c,l			;9fd2	4d 	M 
	call po,0481eh		;9fd3	e4 1e 48 	. . H 
	ld d,e			;9fd6	53 	S 
	call po,04d1eh		;9fd7	e4 1e 4d 	. . M 
	ld b,d			;9fda	42 	B 
	rst 28h			;9fdb	ef 	. 
	ld e,042h		;9fdc	1e 42 	. B 
	ld d,e			;9fde	53 	S 
	rst 28h			;9fdf	ef 	. 
	ld e,050h		;9fe0	1e 50 	. P 
	ld c,h			;9fe2	4c 	L 
	jp m,0501eh		;9fe3	fa 1e 50 	. . P 
	ld c,a			;9fe6	4f 	O 
	djnz $+33		;9fe7	10 1f 	. . 
	ld c,h			;9fe9	4c 	L 
	ld c,l			;9fea	4d 	M 
	djnz $+33		;9feb	10 1f 	. . 
	ld b,e			;9fed	43 	C 
	ld d,b			;9fee	50 	P 
	sub c			;9fef	91 	. 
	dec h			;9ff0	25 	% 
	ld b,d			;9ff1	42 	B 
	ld d,b			;9ff2	50 	P 
	ld hl,(04326h)		;9ff3	2a 26 43 	* & C 
	ld b,l			;9ff6	45 	E 
	ld h,b			;9ff7	60 	` 
	ld h,052h		;9ff8	26 52 	& R 
	ld c,h			;9ffa	4c 	L 
	ld e,h			;9ffb	5c 	\ 
	ld h,049h		;9ffc	26 49 	& I 
	ld b,(hl)			;9ffe	46 	F 
	ld e,h			;9fff	5c 	\ 
	ld h,04fh		;a000	26 4f 	& O 
	ld d,b			;a002	50 	P 
	rst 18h			;a003	df 	. 
	dec h			;a004	25 	% 
	ld d,b			;a005	50 	P 
	ld b,c			;a006	41 	A 
	ld de,05026h		;a007	11 26 50 	. & P 
	ld c,(hl)			;a00a	4e 	N 
	and 025h		;a00b	e6 25 	. % 
	ld b,d			;a00d	42 	B 
	ld b,l			;a00e	45 	E 
	adc a,l			;a00f	8d 	. 
	rra			;a010	1f 	. 
	ld b,l			;a011	45 	E 
	ld c,(hl)			;a012	4e 	N 
	sbc a,l			;a013	9d 	. 
	rra			;a014	1f 	. 
	ld b,(hl)			;a015	46 	F 
	ld c,l			;a016	4d 	M 
	dec b			;a017	05 	. 
	rra			;a018	1f 	. 
	ld b,(hl)			;a019	46 	F 
	ld d,e			;a01a	53 	S 
	dec b			;a01b	05 	. 
	rra			;a01c	1f 	. 
	ld d,c			;a01d	51 	Q 
	ld e,c			;a01e	59 	Y 
	ld b,d			;a01f	42 	B 
	jr z,la073h		;a020	28 51 	( Q 
	ld c,(hl)			;a022	4e 	N 
	ld c,c			;a023	49 	I 
	jr z,$+74		;a024	28 48 	( H 
	ld b,l			;a026	45 	E 
	xor h			;a027	ac 	. 
	ld h,044h		;a028	26 44 	& D 
	ld c,b			;a02a	48 	H 
	push de			;a02b	d5 	. 
	ld h,04dh		;a02c	26 4d 	& M 
	ld c,b			;a02e	48 	H 
	push de			;a02f	d5 	. 
	ld h,044h		;a030	26 44 	& D 
	ld b,(hl)			;a032	46 	F 
	ret nc			;a033	d0 	. 
	ld h,04dh		;a034	26 4d 	& M 
	ld b,(hl)			;a036	46 	F 
	ret nc			;a037	d0 	. 
	ld h,046h		;a038	26 46 	& F 
	ld c,a			;a03a	4f 	O 
	ret nc			;a03b	d0 	. 
	ld h,050h		;a03c	26 50 	& P 
	ld b,e			;a03e	43 	C 
	and h			;a03f	a4 	. 
	dec h			;a040	25 	% 
	ld b,e			;a041	43 	C 
	ld b,e			;a042	43 	C 
	call po,05527h		;a043	e4 27 55 	. ' U 
	ld b,e			;a046	43 	C 
	jp m,04e27h		;a047	fa 27 4e 	. ' N 
	ld b,e			;a04a	43 	C 
	jr nc,la075h		;a04b	30 28 	0 ( 
	ld b,d			;a04d	42 	B 
	ld b,e			;a04e	43 	C 
	add hl,sp			;a04f	39 	9 
	jr z,$+71		;a050	28 45 	( E 
	ld sp,02803h		;a052	31 03 28 	1 . ( 
	ld b,l			;a055	45 	E 
	ld (0280ch),a		;a056	32 0c 28 	2 . ( 
	ld b,l			;a059	45 	E 
	inc sp			;a05a	33 	3 
	dec d			;a05b	15 	. 
	jr z,$+71		;a05c	28 45 	( E 
	inc (hl)			;a05e	34 	4 
	ld e,028h		;a05f	1e 28 	. ( 
	ld b,l			;a061	45 	E 
	dec (hl)			;a062	35 	5 
	daa			;a063	27 	' 
	jr z,la066h		;a064	28 00 	( . 
la066h:
	nop			;a066	00 	. 
	ld e,a			;a067	5f 	_ 
	dec h			;a068	25 	% 
	call 0248bh		;a069	cd 8b 24 	. . $ 
	set 0,(iy-02bh)		;a06c	fd cb d5 c6 	. . . . 
la070h:
	call 01fb0h		;a070	cd b0 1f 	. . . 
la073h:
	cp 00dh		;a073	fe 0d 	. . 
la075h:
	jr z,la08fh		;a075	28 18 	( . 
	push af			;a077	f5 	. 
	call 022dbh		;a078	cd db 22 	. . " 
	pop af			;a07b	f1 	. 
la07ch:
	cp 009h		;a07c	fe 09 	. . 
	jr nz,la08fh		;a07e	20 0f 	  . 
la080h:
	ld a,020h		;a080	3e 20 	>   
	call 0231dh		;a082	cd 1d 23 	. . # 
	ld a,(iy-04ah)		;a085	fd 7e b6 	. ~ . 
	and (iy-00bh)		;a088	fd a6 f5 	. . . 
	jr nz,la080h		;a08b	20 f3 	  . 
	jr la096h		;a08d	18 07 	. . 
la08fh:
	call 0231dh		;a08f	cd 1d 23 	. . # 
	cp 00dh		;a092	fe 0d 	. . 
	jr z,la070h		;a094	28 da 	( . 
la096h:
	call 01fb0h		;a096	cd b0 1f 	. . . 
	jr la07ch		;a099	18 e1 	. . 
	call 01fb0h		;a09b	cd b0 1f 	. . . 
	cp 009h		;a09e	fe 09 	. . 
	jr nz,la0a4h		;a0a0	20 02 	  . 
la0a2h:
	ld a,020h		;a0a2	3e 20 	>   
la0a4h:
	cp 00dh		;a0a4	fe 0d 	. . 
	jr z,la0a2h		;a0a6	28 fa 	( . 
	ret			;a0a8	c9 	. 
	ld hl,(01d95h)		;a0a9	2a 95 1d 	* . . 
	ld (hl),a			;a0ac	77 	w 
	inc hl			;a0ad	23 	# 
	ld (hl),000h		;a0ae	36 00 	6 . 
	ld (01d95h),hl		;a0b0	22 95 1d 	" . . 
	ret			;a0b3	c9 	. 
	ld a,(iy-02dh)		;a0b4	fd 7e d3 	. ~ . 
	sub (iy-030h)		;a0b7	fd 96 d0 	. . . 
	inc a			;a0ba	3c 	< 
	ld (iy-00ch),a		;a0bb	fd 77 f4 	. w . 
	ld hl,(01d05h)		;a0be	2a 05 1d 	* . . 
	ld (01d95h),hl		;a0c1	22 95 1d 	" . . 
	ld (hl),000h		;a0c4	36 00 	6 . 
	ld (iy-02eh),000h		;a0c6	fd 36 d2 00 	. 6 . . 
	ret			;a0ca	c9 	. 
	call 021b4h		;a0cb	cd b4 21 	. . ! 
la0ceh:
	bit 0,(iy-02bh)		;a0ce	fd cb d5 46 	. . . F 
	call nz,021b4h		;a0d2	c4 b4 21 	. . ! 
	res 0,(iy-02bh)		;a0d5	fd cb d5 86 	. . . . 
	ld hl,(01d93h)		;a0d9	2a 93 1d 	* . . 
	ld (01d97h),hl		;a0dc	22 97 1d 	" . . 
	ld sp,(01d99h)		;a0df	ed 7b 99 1d 	. { . . 
la0e3h:
	call 0219bh		;a0e3	cd 9b 21 	. . ! 
	or a			;a0e6	b7 	. 
	jp p,021efh		;a0e7	f2 ef 21 	. . ! 
	call 021a9h		;a0ea	cd a9 21 	. . ! 
	jr la0e3h		;a0ed	18 f4 	. . 
	cp 020h		;a0ef	fe 20 	.   
	jr nz,la0f8h		;a0f1	20 05 	  . 
	jr la0ceh		;a0f3	18 d9 	. . 
la0f5h:
	call 0219bh		;a0f5	cd 9b 21 	. . ! 
la0f8h:
	call 021a9h		;a0f8	cd a9 21 	. . ! 
	cp 020h		;a0fb	fe 20 	.   
	jr z,la10dh		;a0fd	28 0e 	( . 
	or a			;a0ff	b7 	. 
	jp m,021f5h		;a100	fa f5 21 	. . ! 
	ld (iy-00eh),a		;a103	fd 77 f2 	. w . 
	dec (iy-00ch)		;a106	fd 35 f4 	. 5 . 
	jr z,la12bh		;a109	28 20 	(   
	jr la0f5h		;a10b	18 e8 	. . 
la10dh:
	inc (iy-02eh)		;a10d	fd 34 d2 	. 4 . 
	ld a,(iy-00eh)		;a110	fd 7e f2 	. ~ . 
	ld (iy-00dh),a		;a113	fd 77 f3 	. w . 
	ld a,(iy-00ch)		;a116	fd 7e f4 	. ~ . 
	dec a			;a119	3d 	= 
	ld (iy-038h),a		;a11a	fd 77 c8 	. w . 
	call 022cdh		;a11d	cd cd 22 	. . " 
	ld hl,(01d93h)		;a120	2a 93 1d 	* . . 
	ld (01d97h),hl		;a123	22 97 1d 	" . . 
	dec (iy-00ch)		;a126	fd 35 f4 	. 5 . 
	jr nz,la0e3h		;a129	20 b8 	  . 
la12bh:
	ld a,(iy-02eh)		;a12b	fd 7e d2 	. ~ . 
	or a			;a12e	b7 	. 
	jp z,022beh		;a12f	ca be 22 	. . " 
	dec a			;a132	3d 	= 
	ld e,a			;a133	5f 	_ 
	jr z,la16bh		;a134	28 35 	( 5 
	xor a			;a136	af 	. 
	ld (iy-034h),a		;a137	fd 77 cc 	. w . 
	bit 1,(iy-02bh)		;a13a	fd cb d5 4e 	. . . N 
	jr nz,la168h		;a13e	20 28 	  ( 
	ld a,(iy-00dh)		;a140	fd 7e f3 	. ~ . 
	cp (iy-01fh)		;a143	fd be e1 	. . . 
	jr nz,la14bh		;a146	20 03 	  . 
	inc (iy-038h)		;a148	fd 34 c8 	. 4 . 
la14bh:
	ld a,(iy-038h)		;a14b	fd 7e c8 	. ~ . 
la14eh:
	sub e			;a14e	93 	. 
	jr c,la156h		;a14f	38 05 	8 . 
	inc (iy-034h)		;a151	fd 34 cc 	. 4 . 
	jr la14eh		;a154	18 f8 	. . 
la156h:
	add a,e			;a156	83 	. 
	bit 7,(iy-028h)		;a157	fd cb d8 7e 	. . . ~ 
	jr z,la165h		;a15b	28 08 	( . 
	or a			;a15d	b7 	. 
	jr z,la168h		;a15e	28 08 	( . 
	inc (iy-034h)		;a160	fd 34 cc 	. 4 . 
	jr la168h		;a163	18 03 	. . 
la165h:
	sub e			;a165	93 	. 
	neg		;a166	ed 44 	. D 
la168h:
	ld (iy-035h),a		;a168	fd 77 cb 	. w . 
la16bh:
	call 022dbh		;a16b	cd db 22 	. . " 
	ld hl,(01d05h)		;a16e	2a 05 1d 	* . . 
	ld (01d95h),hl		;a171	22 95 1d 	" . . 
la174h:
	ld a,(hl)			;a174	7e 	~ 
	inc hl			;a175	23 	# 
	or a			;a176	b7 	. 
	jr z,la1a2h		;a177	28 29 	( ) 
	cp 020h		;a179	fe 20 	.   
	jr z,la182h		;a17b	28 05 	( . 
	call 0231dh		;a17d	cd 1d 23 	. . # 
	jr la174h		;a180	18 f2 	. . 
la182h:
	dec (iy-02eh)		;a182	fd 35 d2 	. 5 . 
	jr z,la1a2h		;a185	28 1b 	( . 
	ld b,(iy-034h)		;a187	fd 46 cc 	. F . 
	inc b			;a18a	04 	. 
la18bh:
	ld a,020h		;a18b	3e 20 	>   
	call 0231dh		;a18d	cd 1d 23 	. . # 
	djnz la18bh		;a190	10 f9 	. . 
	dec (iy-035h)		;a192	fd 35 cb 	. 5 . 
	jr nz,la174h		;a195	20 dd 	  . 
	ld a,(iy-034h)		;a197	fd 7e cc 	. ~ . 
	add a,(iy-028h)		;a19a	fd 86 d8 	. . . 
	ld (iy-034h),a		;a19d	fd 77 cc 	. w . 
	jr la174h		;a1a0	18 d2 	. . 
la1a2h:
	ld a,00dh		;a1a2	3e 0d 	> . 
	call 0231dh		;a1a4	cd 1d 23 	. . # 
	ld a,(iy-028h)		;a1a7	fd 7e d8 	. ~ . 
	neg		;a1aa	ed 44 	. D 
	ld (iy-028h),a		;a1ac	fd 77 d8 	. w . 
	call 022d4h		;a1af	cd d4 22 	. . " 
	ld hl,(01d97h)		;a1b2	2a 97 1d 	* . . 
	ld (01d93h),hl		;a1b5	22 93 1d 	" . . 
	call 021b4h		;a1b8	cd b4 21 	. . ! 
	jp 021dfh		;a1bb	c3 df 21 	. . ! 
	ld hl,(01d93h)		;a1be	2a 93 1d 	* . . 
	dec hl			;a1c1	2b 	+ 
	ld (01d97h),hl		;a1c2	22 97 1d 	" . . 
	ld hl,(01d95h)		;a1c5	2a 95 1d 	* . . 
	dec hl			;a1c8	2b 	+ 
	ld (hl),000h		;a1c9	36 00 	6 . 
	jr la16bh		;a1cb	18 9e 	. . 
	ld a,(iy-01dh)		;a1cd	fd 7e e3 	. ~ . 
	ld (iy-00ah),a		;a1d0	fd 77 f6 	. w . 
	ret			;a1d3	c9 	. 
	ld a,(iy-00ah)		;a1d4	fd 7e f6 	. ~ . 
	ld (iy-01dh),a		;a1d7	fd 77 e3 	. w . 
	ret			;a1da	c9 	. 
	ld a,(iy-023h)		;a1db	fd 7e dd 	. ~ . 
	add a,(iy-030h)		;a1de	fd 86 d0 	. . . 
	or a			;a1e1	b7 	. 
	jr z,la1ech		;a1e2	28 08 	( . 
	ld b,a			;a1e4	47 	G 
la1e5h:
	ld a,020h		;a1e5	3e 20 	>   
	call 0231dh		;a1e7	cd 1d 23 	. . # 
	djnz la1e5h		;a1ea	10 f9 	. . 
la1ech:
	ld (iy-00bh),000h		;a1ec	fd 36 f5 00 	. 6 . . 
	ld a,(iy-02ch)		;a1f0	fd 7e d4 	. ~ . 
	ld (iy-030h),a		;a1f3	fd 77 d0 	. w . 
	ret			;a1f6	c9 	. 
	ld b,a			;a1f7	47 	G 
	bit 1,(iy-033h)		;a1f8	fd cb cd 4e 	. . . N 
	jr nz,la209h		;a1fc	20 0b 	  . 
	bit 0,(iy-033h)		;a1fe	fd cb cd 46 	. . . F 
	jr z,la210h		;a202	28 0c 	( . 
	ld a,(iy-032h)		;a204	fd 7e ce 	. ~ . 
	add a,b			;a207	80 	. 
	ret			;a208	c9 	. 
la209h:
	ld a,b			;a209	78 	x 
	sub (iy-032h)		;a20a	fd 96 ce 	. . . 
	ret p			;a20d	f0 	. 
la20eh:
	xor a			;a20e	af 	. 
	ret			;a20f	c9 	. 
la210h:
	ld a,(iy-032h)		;a210	fd 7e ce 	. ~ . 
	or a			;a213	b7 	. 
	ret nz			;a214	c0 	. 
	bit 2,(iy-033h)		;a215	fd cb cd 56 	. . . V 
	jr nz,la20eh		;a219	20 f3 	  . 
	add a,b			;a21b	80 	. 
	ret			;a21c	c9 	. 
	push de			;a21d	d5 	. 
	push hl			;a21e	e5 	. 
	push bc			;a21f	c5 	. 
	push af			;a220	f5 	. 
	ld a,(iy-020h)		;a221	fd 7e e0 	. ~ . 
	or a			;a224	b7 	. 
	call z,025b6h		;a225	cc b6 25 	. . % 
	pop af			;a228	f1 	. 
	push af			;a229	f5 	. 
	cp 00dh		;a22a	fe 0d 	. . 
	jr z,la23ah		;a22c	28 0c 	( . 
	call 023b2h		;a22e	cd b2 23 	. . # 
	bit 7,a		;a231	cb 7f 	.  
	jr nz,la24ch		;a233	20 17 	  . 
	inc (iy-00bh)		;a235	fd 34 f5 	. 4 . 
	jr la24ch		;a238	18 12 	. . 
la23ah:
	ld b,(iy-029h)		;a23a	fd 46 d7 	. F . 
la23dh:
	ld a,00dh		;a23d	3e 0d 	> . 
	call 023b2h		;a23f	cd b2 23 	. . # 
	ld a,(iy-020h)		;a242	fd 7e e0 	. ~ . 
	sub (iy-010h)		;a245	fd 96 f0 	. . . 
	jr nc,la251h		;a248	30 07 	0 . 
	djnz la23dh		;a24a	10 f1 	. . 
la24ch:
	pop af			;a24c	f1 	. 
	pop bc			;a24d	c1 	. 
la24eh:
	pop hl			;a24e	e1 	. 
	pop de			;a24f	d1 	. 
	ret			;a250	c9 	. 
la251h:
	call 0235ah		;a251	cd 5a 23 	. Z # 
	pop af			;a254	f1 	. 
	pop bc			;a255	c1 	. 
	ld b,001h		;a256	06 01 	. . 
	jr la24eh		;a258	18 f4 	. . 
	call 0237ah		;a25a	cd 7a 23 	. z # 
	bit 7,(iy-02fh)		;a25d	fd cb d1 7e 	. . . ~ 
	ret z			;a261	c8 	. 
	bit 0,(iy-01ch)		;a262	fd cb e4 46 	. . . F 
	ret nz			;a266	c0 	. 
la267h:
	rst 30h			;a267	f7 	. 
	ld hl,00dfeh		;a268	21 fe 0d 	! . . 
	jr nz,la267h		;a26b	20 fa 	  . 
	ret			;a26d	c9 	. 
la26eh:
	ld a,(iy-020h)		;a26e	fd 7e e0 	. ~ . 
	sub c			;a271	91 	. 
	ret p			;a272	f0 	. 
	ld a,00dh		;a273	3e 0d 	> . 
	call 023b2h		;a275	cd b2 23 	. . # 
	jr la26eh		;a278	18 f4 	. . 
	ld a,(iy-020h)		;a27a	fd 7e e0 	. ~ . 
	or a			;a27d	b7 	. 
	call z,025b6h		;a27e	cc b6 25 	. . % 
	ld c,(iy-011h)		;a281	fd 4e ef 	. N . 
	call 0236eh		;a284	cd 6e 23 	. n # 
	bit 7,(iy-02bh)		;a287	fd cb d5 7e 	. . . ~ 
	jr nz,la293h		;a28b	20 06 	  . 
	ld hl,(01d9bh)		;a28d	2a 9b 1d 	* . . 
	call 026dah		;a290	cd da 26 	. . & 
la293h:
	ld hl,(0013ch)		;a293	2a 3c 01 	* < . 
	inc hl			;a296	23 	# 
	ld (0013ch),hl		;a297	22 3c 01 	" < . 
	call 027beh		;a29a	cd be 27 	. . ' 
	ld c,(iy-027h)		;a29d	fd 4e d9 	. N . 
	call 0236eh		;a2a0	cd 6e 23 	. n # 
	ld (iy-020h),000h		;a2a3	fd 36 e0 00 	. 6 . . 
	ld hl,(01dc3h)		;a2a7	2a c3 1d 	* . . 
	call 0247eh		;a2aa	cd 7e 24 	. ~ $ 
	ret			;a2ad	c9 	. 
	push af			;a2ae	f5 	. 
	jp 0244fh		;a2af	c3 4f 24 	. O $ 
	bit 7,a		;a2b2	cb 7f 	.  
	jr z,la2f7h		;a2b4	28 41 	( A 
	cp 0ffh		;a2b6	fe ff 	. . 
	jr nz,la2bdh		;a2b8	20 03 	  . 
	inc (iy-018h)		;a2ba	fd 34 e8 	. 4 . 
la2bdh:
	cp 0feh		;a2bd	fe fe 	. . 
	jr nz,la2c4h		;a2bf	20 03 	  . 
	inc (iy-017h)		;a2c1	fd 34 e9 	. 4 . 
la2c4h:
	bit 6,(iy-02bh)		;a2c4	fd cb d5 76 	. . . v 
	ret nz			;a2c8	c0 	. 
	cp 0fdh		;a2c9	fe fd 	. . 
	jr nz,la2d4h		;a2cb	20 07 	  . 
	ld hl,(01dc5h)		;a2cd	2a c5 1d 	* . . 
la2d0h:
	call 0247eh		;a2d0	cd 7e 24 	. ~ $ 
	ret			;a2d3	c9 	. 
la2d4h:
	cp 0fch		;a2d4	fe fc 	. . 
	jr nz,la2ddh		;a2d6	20 05 	  . 
	ld hl,(01dc7h)		;a2d8	2a c7 1d 	* . . 
	jr la2d0h		;a2db	18 f3 	. . 
la2ddh:
	cp 0fbh		;a2dd	fe fb 	. . 
	jr nz,la2e6h		;a2df	20 05 	  . 
	ld hl,(01dc9h)		;a2e1	2a c9 1d 	* . . 
	jr la2d0h		;a2e4	18 ea 	. . 
la2e6h:
	cp 0fah		;a2e6	fe fa 	. . 
	jr nz,la2efh		;a2e8	20 05 	  . 
	ld hl,(01dcbh)		;a2ea	2a cb 1d 	* . . 
	jr la2d0h		;a2ed	18 e1 	. . 
la2efh:
	cp 0f9h		;a2ef	fe f9 	. . 
	ret nz			;a2f1	c0 	. 
	ld hl,(01dcdh)		;a2f2	2a cd 1d 	* . . 
	jr la2d0h		;a2f5	18 d9 	. . 
la2f7h:
	cp 021h		;a2f7	fe 21 	. ! 
	jr c,la337h		;a2f9	38 3c 	8 < 
	bit 6,(iy-02bh)		;a2fb	fd cb d5 76 	. . . v 
	jr nz,la337h		;a2ff	20 36 	  6 
	bit 1,(iy-02fh)		;a301	fd cb d1 4e 	. . . N 
	jr nz,la337h		;a305	20 30 	  0 
	bit 0,(iy-018h)		;a307	fd cb e8 46 	. . . F 
	jr z,la313h		;a30b	28 06 	( . 
	ld hl,(01dbbh)		;a30d	2a bb 1d 	* . . 
	call 0247eh		;a310	cd 7e 24 	. ~ $ 
la313h:
	bit 0,(iy-017h)		;a313	fd cb e9 46 	. . . F 
	jr z,la337h		;a317	28 1e 	( . 
	cp (iy-01fh)		;a319	fd be e1 	. . . 
	jr z,la337h		;a31c	28 19 	( . 
	ld hl,(01dbdh)		;a31e	2a bd 1d 	* . . 
	call 0247eh		;a321	cd 7e 24 	. ~ $ 
	call 02437h		;a324	cd 37 24 	. 7 $ 
	ld hl,(01dbfh)		;a327	2a bf 1d 	* . . 
	call 0247eh		;a32a	cd 7e 24 	. ~ $ 
	call 02437h		;a32d	cd 37 24 	. 7 $ 
	ld hl,(01dc1h)		;a330	2a c1 1d 	* . . 
	call 0247eh		;a333	cd 7e 24 	. ~ $ 
	ret			;a336	c9 	. 
la337h:
	push af			;a337	f5 	. 
	cp 00dh		;a338	fe 0d 	. . 
	jr nz,la348h		;a33a	20 0c 	  . 
	ld a,(iy-020h)		;a33c	fd 7e e0 	. ~ . 
	or a			;a33f	b7 	. 
	ld a,(01dcfh)		;a340	3a cf 1d 	: . . 
	call z,02437h		;a343	cc 37 24 	. 7 $ 
	pop af			;a346	f1 	. 
	push af			;a347	f5 	. 
la348h:
	cp (iy-01fh)		;a348	fd be e1 	. . . 
	jr nz,la34fh		;a34b	20 02 	  . 
	ld a,020h		;a34d	3e 20 	>   
la34fh:
	bit 0,(iy-01ch)		;a34f	fd cb e4 46 	. . . F 
	jr nz,la368h		;a353	20 13 	  . 
	bit 0,(iy-02fh)		;a355	fd cb d1 46 	. . . F 
	jr z,la375h		;a359	28 1a 	( . 
	bit 1,(iy-02fh)		;a35b	fd cb d1 4e 	. . . N 
	jr nz,la37ah		;a35f	20 19 	  . 
	rst 30h			;a361	f7 	. 
	dec b			;a362	05 	. 
	push af			;a363	f5 	. 
	call 01900h		;a364	cd 00 19 	. . . 
	pop af			;a367	f1 	. 
la368h:
	cp 00dh		;a368	fe 0d 	. . 
	jr nz,la373h		;a36a	20 07 	  . 
	inc (iy-020h)		;a36c	fd 34 e0 	. 4 . 
	ld a,00ah		;a36f	3e 0a 	> . 
	jr la34fh		;a371	18 dc 	. . 
la373h:
	pop af			;a373	f1 	. 
	ret			;a374	c9 	. 
la375h:
	call 01b9eh		;a375	cd 9e 1b 	. . . 
	jr la368h		;a378	18 ee 	. . 
la37ah:
	rst 30h			;a37a	f7 	. 
	ld bc,0e518h		;a37b	01 18 e5 	. . . 
	push af			;a37e	f5 	. 
la37fh:
	ld a,(hl)			;a37f	7e 	~ 
	inc hl			;a380	23 	# 
	or a			;a381	b7 	. 
	jr z,la389h		;a382	28 05 	( . 
	call 023aeh		;a384	cd ae 23 	. . # 
	jr la37fh		;a387	18 f6 	. . 
la389h:
	pop af			;a389	f1 	. 
	ret			;a38a	c9 	. 
	res 0,(iy-02bh)		;a38b	fd cb d5 86 	. . . . 
	ld hl,(01d95h)		;a38f	2a 95 1d 	* . . 
	ld de,(01d05h)		;a392	ed 5b 05 1d 	. [ . . 
	xor a			;a396	af 	. 
	sbc hl,de		;a397	ed 52 	. R 
	ret z			;a399	c8 	. 
	ex de,hl			;a39a	eb 	. 
	ld (01d95h),hl		;a39b	22 95 1d 	" . . 
	call 022dbh		;a39e	cd db 22 	. . " 
la3a1h:
	ld a,(hl)			;a3a1	7e 	~ 
	or a			;a3a2	b7 	. 
	jr z,la3adh		;a3a3	28 08 	( . 
	call 0231dh		;a3a5	cd 1d 23 	. . # 
	xor a			;a3a8	af 	. 
	ld (hl),a			;a3a9	77 	w 
	inc hl			;a3aa	23 	# 
	jr la3a1h		;a3ab	18 f4 	. . 
la3adh:
	ld a,00dh		;a3ad	3e 0d 	> . 
	call 0231dh		;a3af	cd 1d 23 	. . # 
	ret			;a3b2	c9 	. 
	call 0248bh		;a3b3	cd 8b 24 	. . $ 
	ld a,(iy-029h)		;a3b6	fd 7e d7 	. ~ . 
	call 022f7h		;a3b9	cd f7 22 	. . " 
	jp z,021cbh		;a3bc	ca cb 21 	. . ! 
	jp m,021cbh		;a3bf	fa cb 21 	. . ! 
la3c2h:
	ld (iy-029h),a		;a3c2	fd 77 d7 	. w . 
	jp 021cbh		;a3c5	c3 cb 21 	. . ! 
	ld a,(iy-02dh)		;a3c8	fd 7e d3 	. ~ . 
	call 022f7h		;a3cb	cd f7 22 	. . " 
	cp (iy-02ch)		;a3ce	fd be d4 	. . . 
	jp m,021ceh		;a3d1	fa ce 21 	. . ! 
	ld (iy-02dh),a		;a3d4	fd 77 d3 	. w . 
	ld a,(iy-02eh)		;a3d7	fd 7e d2 	. ~ . 
	or a			;a3da	b7 	. 
	jp z,021cbh		;a3db	ca cb 21 	. . ! 
	jp 021ceh		;a3de	c3 ce 21 	. . ! 
	call 0248bh		;a3e1	cd 8b 24 	. . $ 
	ld a,(iy-02ch)		;a3e4	fd 7e d4 	. ~ . 
	call 022f7h		;a3e7	cd f7 22 	. . " 
	jp m,021cbh		;a3ea	fa cb 21 	. . ! 
la3edh:
	ld (iy-02ch),a		;a3ed	fd 77 d4 	. w . 
	ld (iy-030h),a		;a3f0	fd 77 d0 	. w . 
	jp 021cbh		;a3f3	c3 cb 21 	. . ! 
	call 0248bh		;a3f6	cd 8b 24 	. . $ 
	ld a,001h		;a3f9	3e 01 	> . 
	jr la3c2h		;a3fb	18 c5 	. . 
	call 0248bh		;a3fd	cd 8b 24 	. . $ 
	ld a,002h		;a400	3e 02 	> . 
	jr la3c2h		;a402	18 be 	. . 
	call 0248bh		;a404	cd 8b 24 	. . $ 
	xor a			;a407	af 	. 
	jr la3edh		;a408	18 e3 	. . 
	call 0248bh		;a40a	cd 8b 24 	. . $ 
	jp 021cbh		;a40d	c3 cb 21 	. . ! 
	call 0248bh		;a410	cd 8b 24 	. . $ 
	ld a,(iy-032h)		;a413	fd 7e ce 	. ~ . 
	or a			;a416	b7 	. 
	jr nz,la41ah		;a417	20 01 	  . 
	inc a			;a419	3c 	< 
la41ah:
	ld b,a			;a41a	47 	G 
la41bh:
	ld a,(iy-020h)		;a41b	fd 7e e0 	. ~ . 
	or a			;a41e	b7 	. 
	jp z,021cbh		;a41f	ca cb 21 	. . ! 
	ld a,00dh		;a422	3e 0d 	> . 
	call 0231dh		;a424	cd 1d 23 	. . # 
	djnz la41bh		;a427	10 f2 	. . 
	jp 021cbh		;a429	c3 cb 21 	. . ! 
	call 0248bh		;a42c	cd 8b 24 	. . $ 
	ld a,00dh		;a42f	3e 0d 	> . 
	call 0231dh		;a431	cd 1d 23 	. . # 
	ld a,(iy-02ah)		;a434	fd 7e d6 	. ~ . 
	call 02546h		;a437	cd 46 25 	. F % 
	ld (iy-02ah),a		;a43a	fd 77 d6 	. w . 
	add a,(iy-02ch)		;a43d	fd 86 d4 	. . . 
la440h:
	ld (iy-030h),a		;a440	fd 77 d0 	. w . 
	jp 021cbh		;a443	c3 cb 21 	. . ! 
	call 022f7h		;a446	cd f7 22 	. . " 
	or a			;a449	b7 	. 
	jp z,021cbh		;a44a	ca cb 21 	. . ! 
	jp m,021cbh		;a44d	fa cb 21 	. . ! 
	ret			;a450	c9 	. 
	call 0248bh		;a451	cd 8b 24 	. . $ 
	ld a,(iy-02ch)		;a454	fd 7e d4 	. ~ . 
	call 022f7h		;a457	cd f7 22 	. . " 
	jp m,021cbh		;a45a	fa cb 21 	. . ! 
	jr la440h		;a45d	18 e1 	. . 
	ld hl,0256bh		;a45f	21 6b 25 	! k % 
	ld bc,0000dh		;a462	01 0d 00 	. . . 
	call 018eeh		;a465	cd ee 18 	. . . 
	jp 021cbh		;a468	c3 cb 21 	. . ! 
	ld b,(hl)			;a46b	46 	F 
	ld l,a			;a46c	6f 	o 
	ld (hl),d			;a46d	72 	r 
	ld l,l			;a46e	6d 	m 
	ld h,c			;a46f	61 	a 
	ld (hl),h			;a470	74 	t 
	jr nz,$+103		;a471	20 65 	  e 
	ld (hl),d			;a473	72 	r 
	ld (hl),d			;a474	72 	r 
	ld l,a			;a475	6f 	o 
	ld (hl),d			;a476	72 	r 
	dec c			;a477	0d 	. 
	call 0248bh		;a478	cd 8b 24 	. . $ 
	set 1,(iy-02bh)		;a47b	fd cb d5 ce 	. . . . 
	jp 021cbh		;a47f	c3 cb 21 	. . ! 
	call 0248bh		;a482	cd 8b 24 	. . $ 
	res 1,(iy-02bh)		;a485	fd cb d5 8e 	. . . . 
	jp 021cbh		;a489	c3 cb 21 	. . ! 
la48ch:
	call 01fb0h		;a48c	cd b0 1f 	. . . 
	jr la48ch		;a48f	18 fb 	. . 
	call 0248bh		;a491	cd 8b 24 	. . $ 
	xor a			;a494	af 	. 
	call 02546h		;a495	cd 46 25 	. F % 
	sub (iy-010h)		;a498	fd 96 f0 	. . . 
	add a,(iy-020h)		;a49b	fd 86 e0 	. . . 
	call p,0235ah		;a49e	f4 5a 23 	. Z # 
	jp 021cbh		;a4a1	c3 cb 21 	. . ! 
	call 0248bh		;a4a4	cd 8b 24 	. . $ 
	ld a,(025b5h)		;a4a7	3a b5 25 	: . % 
	cp 021h		;a4aa	fe 21 	. ! 
	jr nc,la4afh		;a4ac	30 01 	0 . 
	xor a			;a4ae	af 	. 
la4afh:
	ld (iy-01fh),a		;a4af	fd 77 e1 	. w . 
	jp 021cbh		;a4b2	c3 cb 21 	. . ! 
	ld h,0fdh		;a4b5	26 fd 	& . 
	ld a,(hl)			;a4b7	7e 	~ 
	ex (sp),hl			;a4b8	e3 	. 
	and 001h		;a4b9	e6 01 	. . 
	ld (iy-01ch),a		;a4bb	fd 77 e4 	. w . 
	ld c,(iy-00fh)		;a4be	fd 4e f1 	. N . 
	call 0236eh		;a4c1	cd 6e 23 	. n # 
	ld hl,(01d9dh)		;a4c4	2a 9d 1d 	* . . 
	call 026dah		;a4c7	cd da 26 	. . & 
	ld c,(iy-026h)		;a4ca	fd 4e da 	. N . 
	call 0236eh		;a4cd	cd 6e 23 	. n # 
	ret			;a4d0	c9 	. 
	ld a,(iy-023h)		;a4d1	fd 7e dd 	. ~ . 
	or a			;a4d4	b7 	. 
	ret z			;a4d5	c8 	. 
	ld b,a			;a4d6	47 	G 
la4d7h:
	ld a,020h		;a4d7	3e 20 	>   
	call 023b2h		;a4d9	cd b2 23 	. . # 
	djnz la4d7h		;a4dc	10 f9 	. . 
	ret			;a4de	c9 	. 
	set 7,(iy-02bh)		;a4df	fd cb d5 fe 	. . . . 
	jp 021ceh		;a4e3	c3 ce 21 	. . ! 
	res 7,(iy-02bh)		;a4e6	fd cb d5 be 	. . . . 
	ld hl,(0013ch)		;a4ea	2a 3c 01 	* < . 
	ld de,(0012ch)		;a4ed	ed 5b 2c 01 	. [ , . 
	ld a,(iy-033h)		;a4f1	fd 7e cd 	. ~ . 
	or a			;a4f4	b7 	. 
	jr z,la506h		;a4f5	28 0f 	( . 
	bit 1,a		;a4f7	cb 4f 	. O 
	jr nz,la502h		;a4f9	20 07 	  . 
	bit 0,a		;a4fb	cb 47 	. G 
	jr z,la507h		;a4fd	28 08 	( . 
	add hl,de			;a4ff	19 	. 
	jr la508h		;a500	18 06 	. . 
la502h:
	sbc hl,de		;a502	ed 52 	. R 
	jr la508h		;a504	18 02 	. . 
la506h:
	inc de			;a506	13 	. 
la507h:
	ex de,hl			;a507	eb 	. 
la508h:
	ld (0013ch),hl		;a508	22 3c 01 	" < . 
	call 027beh		;a50b	cd be 27 	. . ' 
	jp 021ceh		;a50e	c3 ce 21 	. . ! 
	call 0248bh		;a511	cd 8b 24 	. . $ 
	ld a,000h		;a514	3e 00 	> . 
	call 022f7h		;a516	cd f7 22 	. . " 
	jr nz,la51ch		;a519	20 01 	  . 
	inc a			;a51b	3c 	< 
la51ch:
	jp m,021cbh		;a51c	fa cb 21 	. . ! 
la51fh:
	push af			;a51f	f5 	. 
	call 0235ah		;a520	cd 5a 23 	. Z # 
	pop af			;a523	f1 	. 
	dec a			;a524	3d 	= 
	jr nz,la51fh		;a525	20 f8 	  . 
	jp 021cbh		;a527	c3 cb 21 	. . ! 
	call 0248bh		;a52a	cd 8b 24 	. . $ 
	call 0235ah		;a52d	cd 5a 23 	. Z # 
	ld hl,(0013ch)		;a530	2a 3c 01 	* < . 
	dec hl			;a533	2b 	+ 
	ld de,(0012ch)		;a534	ed 5b 2c 01 	. [ , . 
	ld a,(iy-033h)		;a538	fd 7e cd 	. ~ . 
	or a			;a53b	b7 	. 
	jp z,021cbh		;a53c	ca cb 21 	. . ! 
	bit 1,a		;a53f	cb 4f 	. O 
	jr nz,la54ah		;a541	20 07 	  . 
	bit 0,a		;a543	cb 47 	. G 
	jr z,la54eh		;a545	28 07 	( . 
	add hl,de			;a547	19 	. 
	jr la54fh		;a548	18 05 	. . 
la54ah:
	sbc hl,de		;a54a	ed 52 	. R 
	jr la54fh		;a54c	18 01 	. . 
la54eh:
	ex de,hl			;a54e	eb 	. 
la54fh:
	ld (0013ch),hl		;a54f	22 3c 01 	" < . 
	res 7,(iy-02bh)		;a552	fd cb d5 be 	. . . . 
	call 027beh		;a556	cd be 27 	. . ' 
	jp 021cbh		;a559	c3 cb 21 	. . ! 
	set 5,(iy-02bh)		;a55c	fd cb d5 ee 	. . . . 
	call 0248bh		;a560	cd 8b 24 	. . $ 
	ld a,001h		;a563	3e 01 	> . 
	call 02546h		;a565	cd 46 25 	. F % 
la568h:
	push af			;a568	f5 	. 
	call 02673h		;a569	cd 73 26 	. s & 
	pop af			;a56c	f1 	. 
	dec a			;a56d	3d 	= 
	jr nz,la568h		;a56e	20 f8 	  . 
	jp 021cbh		;a570	c3 cb 21 	. . ! 
la573h:
	call 0219bh		;a573	cd 9b 21 	. . ! 
	push af			;a576	f5 	. 
	ld a,(iy-040h)		;a577	fd 7e c0 	. ~ . 
	cp 00dh		;a57a	fe 0d 	. . 
	jr z,la584h		;a57c	28 06 	( . 
	pop af			;a57e	f1 	. 
	call 021a9h		;a57f	cd a9 21 	. . ! 
	jr la573h		;a582	18 ef 	. . 
la584h:
	pop af			;a584	f1 	. 
	ld b,000h		;a585	06 00 	. . 
	ld hl,(01d05h)		;a587	2a 05 1d 	* . . 
la58ah:
	ld a,(hl)			;a58a	7e 	~ 
	inc hl			;a58b	23 	# 
	or a			;a58c	b7 	. 
	jr z,la595h		;a58d	28 06 	( . 
	jp m,0268ah		;a58f	fa 8a 26 	. . & 
	inc b			;a592	04 	. 
	jr la58ah		;a593	18 f5 	. . 
la595h:
	ld a,(iy-02dh)		;a595	fd 7e d3 	. ~ . 
	sub b			;a598	90 	. 
	jp p,0269dh		;a599	f2 9d 26 	. . & 
	xor a			;a59c	af 	. 
	bit 5,(iy-02bh)		;a59d	fd cb d5 6e 	. . . n 
	jr nz,la5a5h		;a5a1	20 02 	  . 
	srl a		;a5a3	cb 3f 	. ? 
la5a5h:
	ld (iy-030h),a		;a5a5	fd 77 d0 	. w . 
	call 0248fh		;a5a8	cd 8f 24 	. . $ 
	ret			;a5ab	c9 	. 
	ld hl,(01d9dh)		;a5ac	2a 9d 1d 	* . . 
	ld (hl),00ah		;a5af	36 0a 	6 . 
	inc hl			;a5b1	23 	# 
	push hl			;a5b2	e5 	. 
	call 01f53h		;a5b3	cd 53 1f 	. S . 
	pop hl			;a5b6	e1 	. 
	cp 020h		;a5b7	fe 20 	.   
	jr nz,la5c0h		;a5b9	20 05 	  . 
la5bbh:
	push hl			;a5bb	e5 	. 
	call 01f53h		;a5bc	cd 53 1f 	. S . 
	pop hl			;a5bf	e1 	. 
la5c0h:
	cp (iy-01ah)		;a5c0	fd be e6 	. . . 
	jr nz,la5c7h		;a5c3	20 02 	  . 
	ld a,080h		;a5c5	3e 80 	> . 
la5c7h:
	ld (hl),a			;a5c7	77 	w 
	cp 00dh		;a5c8	fe 0d 	. . 
	jp z,021ceh		;a5ca	ca ce 21 	. . ! 
	inc hl			;a5cd	23 	# 
	jr la5bbh		;a5ce	18 eb 	. . 
	ld hl,(01d9bh)		;a5d0	2a 9b 1d 	* . . 
	jr la5bbh		;a5d3	18 e6 	. . 
	ld hl,(01d9dh)		;a5d5	2a 9d 1d 	* . . 
	jr la5bbh		;a5d8	18 e1 	. . 
	ld (01e22h),hl		;a5da	22 22 1e 	" " . 
	call 02763h		;a5dd	cd 63 27 	. c ' 
	ld hl,00000h		;a5e0	21 00 00 	! . . 
	ld (00146h),hl		;a5e3	22 46 01 	" F . 
la5e6h:
	call 02773h		;a5e6	cd 73 27 	. s ' 
	cp 00dh		;a5e9	fe 0d 	. . 
	ret z			;a5eb	c8 	. 
	cp 00ah		;a5ec	fe 0a 	. . 
	jr z,la5f4h		;a5ee	28 04 	( . 
	cp 021h		;a5f0	fe 21 	. ! 
	jr c,la5e6h		;a5f2	38 f2 	8 . 
la5f4h:
	ld (iy-037h),a		;a5f4	fd 77 c9 	. w . 
	call 025d1h		;a5f7	cd d1 25 	. . % 
	ld b,000h		;a5fa	06 00 	. . 
	call 02735h		;a5fc	cd 35 27 	. 5 ' 
	ld a,000h		;a5ff	3e 00 	> . 
	call nz,02716h		;a601	c4 16 27 	. . ' 
	call 02735h		;a604	cd 35 27 	. 5 ' 
	srl a		;a607	cb 3f 	. ? 
	call nz,02716h		;a609	c4 16 27 	. . ' 
	call 02735h		;a60c	cd 35 27 	. 5 ' 
	call nz,02716h		;a60f	c4 16 27 	. . ' 
	call 0276ah		;a612	cd 6a 27 	. j ' 
	ret			;a615	c9 	. 
	ld c,a			;a616	4f 	O 
la617h:
	ld a,b			;a617	78 	x 
	cp c			;a618	b9 	. 
	jr nc,la623h		;a619	30 08 	0 . 
	ld a,020h		;a61b	3e 20 	>   
	call 023b2h		;a61d	cd b2 23 	. . # 
	inc b			;a620	04 	. 
	jr la617h		;a621	18 f4 	. . 
la623h:
	ld de,(01e26h)		;a623	ed 5b 26 1e 	. [ & . 
la627h:
	ld a,(de)			;a627	1a 	. 
	inc de			;a628	13 	. 
	or a			;a629	b7 	. 
	ret z			;a62a	c8 	. 
	call 023b2h		;a62b	cd b2 23 	. . # 
	or a			;a62e	b7 	. 
	jp m,02727h		;a62f	fa 27 27 	. ' ' 
	inc b			;a632	04 	. 
	jr la627h		;a633	18 f2 	. . 
	ld c,000h		;a635	0e 00 	. . 
	ld hl,(01e26h)		;a637	2a 26 1e 	* & . 
	ld a,(iy-009h)		;a63a	fd 7e f7 	. ~ . 
	cp 00dh		;a63d	fe 0d 	. . 
	jr z,la656h		;a63f	28 15 	( . 
la641h:
	call 02773h		;a641	cd 73 27 	. s ' 
	cp 00dh		;a644	fe 0d 	. . 
	jr z,la656h		;a646	28 0e 	( . 
	cp (iy-037h)		;a648	fd be c9 	. . . 
	jr z,la656h		;a64b	28 09 	( . 
	ld (hl),a			;a64d	77 	w 
	inc hl			;a64e	23 	# 
	or a			;a64f	b7 	. 
	jp m,02741h		;a650	fa 41 27 	. A ' 
	inc c			;a653	0c 	. 
	jr la641h		;a654	18 eb 	. . 
la656h:
	ld (hl),000h		;a656	36 00 	6 . 
	ld a,c			;a658	79 	y 
	or a			;a659	b7 	. 
	ret z			;a65a	c8 	. 
	ld a,(iy-02dh)		;a65b	fd 7e d3 	. ~ . 
	sub c			;a65e	91 	. 
	ret p			;a65f	f0 	. 
	xor a			;a660	af 	. 
	ld c,a			;a661	4f 	O 
	ret			;a662	c9 	. 
	ld hl,(00146h)		;a663	2a 46 01 	* F . 
	ld (02771h),hl		;a666	22 71 27 	" q ' 
	ret			;a669	c9 	. 
	ld hl,(02771h)		;a66a	2a 71 27 	* q ' 
	ld (00146h),hl		;a66d	22 46 01 	" F . 
	ret			;a670	c9 	. 
	nop			;a671	00 	. 
	nop			;a672	00 	. 
	push hl			;a673	e5 	. 
	bit 7,(iy-018h)		;a674	fd cb e8 7e 	. . . ~ 
	jr z,la68ch		;a678	28 12 	( . 
	ld hl,(01e24h)		;a67a	2a 24 1e 	* $ . 
la67dh:
	ld a,(hl)			;a67d	7e 	~ 
	inc hl			;a67e	23 	# 
	ld (01e24h),hl		;a67f	22 24 1e 	" $ . 
	or a			;a682	b7 	. 
	ld (iy-009h),a		;a683	fd 77 f7 	. w . 
	jr nz,la6a4h		;a686	20 1c 	  . 
	res 7,(iy-018h)		;a688	fd cb e8 be 	. . . . 
la68ch:
	ld hl,(01e22h)		;a68c	2a 22 1e 	* " . 
	ld a,(hl)			;a68f	7e 	~ 
	inc hl			;a690	23 	# 
	ld (01e22h),hl		;a691	22 22 1e 	" " . 
	cp 080h		;a694	fe 80 	. . 
	ld (iy-009h),a		;a696	fd 77 f7 	. w . 
	jr nz,la6a4h		;a699	20 09 	  . 
	set 7,(iy-018h)		;a69b	fd cb e8 fe 	. . . . 
	ld hl,01e1ch		;a69f	21 1c 1e 	! . . 
	jr la67dh		;a6a2	18 d9 	. . 
la6a4h:
	pop hl			;a6a4	e1 	. 
	ret			;a6a5	c9 	. 
	ld hl,00000h		;a6a6	21 00 00 	! . . 
	ld a,011h		;a6a9	3e 11 	> . 
	or a			;a6ab	b7 	. 
la6ach:
	rl l		;a6ac	cb 15 	. . 
	rl h		;a6ae	cb 14 	. . 
	sbc hl,bc		;a6b0	ed 42 	. B 
	jr nc,la6b5h		;a6b2	30 01 	0 . 
	add hl,bc			;a6b4	09 	. 
la6b5h:
	ccf			;a6b5	3f 	? 
	rl e		;a6b6	cb 13 	. . 
	rl d		;a6b8	cb 12 	. . 
	dec a			;a6ba	3d 	= 
	jr nz,la6ach		;a6bb	20 ef 	  . 
	ret			;a6bd	c9 	. 
	ld hl,(0013ch)		;a6be	2a 3c 01 	* < . 
	ld de,0ffffh		;a6c1	11 ff ff 	. . . 
	push de			;a6c4	d5 	. 
	ld bc,0000ah		;a6c5	01 0a 00 	. . . 
	ld d,h			;a6c8	54 	T 
	ld e,l			;a6c9	5d 	] 
la6cah:
	call 027a6h		;a6ca	cd a6 27 	. . ' 
	push hl			;a6cd	e5 	. 
	ld a,d			;a6ce	7a 	z 
	or a			;a6cf	b7 	. 
	jr nz,la6cah		;a6d0	20 f8 	  . 
	add a,e			;a6d2	83 	. 
	jr nz,la6cah		;a6d3	20 f5 	  . 
	ld hl,01e1ch		;a6d5	21 1c 1e 	! . . 
la6d8h:
	pop de			;a6d8	d1 	. 
	xor a			;a6d9	af 	. 
	add a,e			;a6da	83 	. 
	ret m			;a6db	f8 	. 
	add a,030h		;a6dc	c6 30 	. 0 
	ld (hl),a			;a6de	77 	w 
	inc hl			;a6df	23 	# 
	ld (hl),000h		;a6e0	36 00 	6 . 
	jr la6d8h		;a6e2	18 f4 	. . 
	call 0248bh		;a6e4	cd 8b 24 	. . $ 
	ld a,(025b5h)		;a6e7	3a b5 25 	: . % 
	and 01fh		;a6ea	e6 1f 	. . 
	call 023b2h		;a6ec	cd b2 23 	. . # 
	jp 021cbh		;a6ef	c3 cb 21 	. . ! 
	ld a,(025b5h)		;a6f2	3a b5 25 	: . % 
	cp 021h		;a6f5	fe 21 	. ! 
	ret nc			;a6f7	d0 	. 
	xor a			;a6f8	af 	. 
	ret			;a6f9	c9 	. 
	call 027f2h		;a6fa	cd f2 27 	. . ' 
	ld (iy-01eh),a		;a6fd	fd 77 e2 	. w . 
	jp 021ceh		;a700	c3 ce 21 	. . ! 
	call 027f2h		;a703	cd f2 27 	. . ' 
	ld (iy-016h),a		;a706	fd 77 ea 	. w . 
	jp 021ceh		;a709	c3 ce 21 	. . ! 
	call 027f2h		;a70c	cd f2 27 	. . ' 
	ld (iy-015h),a		;a70f	fd 77 eb 	. w . 
	jp 021ceh		;a712	c3 ce 21 	. . ! 
	call 027f2h		;a715	cd f2 27 	. . ' 
	ld (iy-014h),a		;a718	fd 77 ec 	. w . 
	jp 021ceh		;a71b	c3 ce 21 	. . ! 
	call 027f2h		;a71e	cd f2 27 	. . ' 
	ld (iy-013h),a		;a721	fd 77 ed 	. w . 
	jp 021ceh		;a724	c3 ce 21 	. . ! 
	call 027f2h		;a727	cd f2 27 	. . ' 
	ld (iy-012h),a		;a72a	fd 77 ee 	. w . 
	jp 021ceh		;a72d	c3 ce 21 	. . ! 
	call 027f2h		;a730	cd f2 27 	. . ' 
	ld (iy-01ah),a		;a733	fd 77 e6 	. w . 
	jp 021ceh		;a736	c3 ce 21 	. . ! 
	call 027f2h		;a739	cd f2 27 	. . ' 
	ld (iy-019h),a		;a73c	fd 77 e7 	. w . 
	jp 021ceh		;a73f	c3 ce 21 	. . ! 
	res 6,(iy-02bh)		;a742	fd cb d5 b6 	. . . . 
	jp 021ceh		;a746	c3 ce 21 	. . ! 
	set 6,(iy-02bh)		;a749	fd cb d5 f6 	. . . . 
	jp 021ceh		;a74d	c3 ce 21 	. . ! 
	ld hl,0287dh		;a750	21 7d 28 	! } ( 
	ld bc,0001ah		;a753	01 1a 00 	. . . 
	call 018eeh		;a756	cd ee 18 	. . . 
	call 01b64h		;a759	cd 64 1b 	. d . 
	ret nz			;a75c	c0 	. 
	call 01491h		;a75d	cd 91 14 	. . . 
	set 7,(iy-03ah)		;a760	fd cb c6 fe 	. . . . 
	ld hl,(00106h)		;a764	2a 06 01 	* . . 
	ld (00108h),hl		;a767	22 08 01 	" . . 
	ld hl,00080h		;a76a	21 80 00 	! . . 
	ld (hl),000h		;a76d	36 00 	6 . 
	ld hl,01005h		;a76f	21 05 10 	! . . 
	ld de,00fech		;a772	11 ec 0f 	. . . 
	ld bc,00003h		;a775	01 03 00 	. . . 
	ldir		;a778	ed b0 	. . 
	jp 006e9h		;a77a	c3 e9 06 	. . . 
	ld c,h			;a77d	4c 	L 
	ld l,a			;a77e	6f 	o 
	ld (hl),e			;a77f	73 	s 
	ld h,l			;a780	65 	e 
	jr nz,la7d7h		;a781	20 54 	  T 
	ld h,l			;a783	65 	e 
	ld a,b			;a784	78 	x 
	ld (hl),h			;a785	74 	t 
	jr nz,la7ceh		;a786	20 46 	  F 
	ld l,a			;a788	6f 	o 
la789h:
	ld (hl),d			;a789	72 	r 
	ld l,l			;a78a	6d 	m 
	ld h,c			;a78b	61 	a 
	ld (hl),h			;a78c	74 	t 
	ld (hl),h			;a78d	74 	t 
	ld h,l			;a78e	65 	e 
	ld (hl),d			;a78f	72 	r 
	jr nz,la7bah		;a790	20 28 	  ( 
	ld e,c			;a792	59 	Y 
	cpl			;a793	2f 	/ 
	ld c,(hl)			;a794	4e 	N 
	add hl,hl			;a795	29 	) 
	ccf			;a796	3f 	? 
	ld d,l			;a797	55 	U 
	add hl,bc			;a798	09 	. 
	inc h			;a799	24 	$ 
	dec c			;a79a	0d 	. 
	ld a,(bc)			;a79b	0a 	. 
	dec c			;a79c	0d 	. 
la79dh:
	ld a,(bc)			;a79d	0a 	. 
	add hl,bc			;a79e	09 	. 
	ld b,l			;a79f	45 	E 
	ld c,(hl)			;a7a0	4e 	N 
	ld b,h			;a7a1	44 	D 
	dec c			;a7a2	0d 	. 
	ld a,(bc)			;a7a3	0a 	. 
	ld a,(de)			;a7a4	1a 	. 
	ld a,(de)			;a7a5	1a 	. 
	ld a,(de)			;a7a6	1a 	. 
	or d			;a7a7	b2 	. 
	jr z,la789h		;a7a8	28 df 	( . 
	jr z,la7d5h		;a7aa	28 29 	( ) 
	nop			;a7ac	00 	. 
	ld d,(hl)			;a7ad	56 	V 
	ld b,l			;a7ae	45 	E 
	ld d,d			;a7af	52 	R 
	ld d,e			;a7b0	53 	S 
	nop			;a7b1	00 	. 
	cp h			;a7b2	bc 	. 
	jr z,la7beh		;a7b3	28 09 	( . 
	add hl,hl			;a7b5	29 	) 
	ld b,e			;a7b6	43 	C 
	nop			;a7b7	00 	. 
	ld d,d			;a7b8	52 	R 
	ld b,l			;a7b9	45 	E 
la7bah:
	ld d,(hl)			;a7ba	56 	V 
	nop			;a7bb	00 	. 
	ld d,029h		;a7bc	16 29 	. ) 
la7beh:
	rst 0			;a7be	c7 	. 
	jr z,$+1		;a7bf	28 ff 	( . 
	rst 38h			;a7c1	ff 	. 
	ld b,e			;a7c2	43 	C 
	ld sp,03030h		;a7c3	31 30 30 	1 0 0 
	nop			;a7c6	00 	. 
	jp (hl)			;a7c7	e9 	. 
la7c8h:
	jr z,la79dh		;a7c8	28 d3 	( . 
	jr z,la7c8h		;a7ca	28 fc 	( . 
	ei			;a7cc	fb 	. 
	ld d,b			;a7cd	50 	P 
la7ceh:
	ld c,a			;a7ce	4f 	O 
	ld d,d			;a7cf	52 	R 
	ld d,h			;a7d0	54 	T 
	jr nc,la7d3h		;a7d1	30 00 	0 . 
la7d3h:
	nop			;a7d3	00 	. 
	nop			;a7d4	00 	. 
la7d5h:
	inc l			;a7d5	2c 	, 
	add hl,hl			;a7d6	29 	) 
la7d7h:
	cp 0fbh		;a7d7	fe fb 	. . 
	ld d,b			;a7d9	50 	P 
	ld c,a			;a7da	4f 	O 
	ld d,d			;a7db	52 	R 
	ld d,h			;a7dc	54 	T 
	ld sp,03000h		;a7dd	31 00 30 	1 . 0 
	inc l			;a7e0	2c 	, 
	jr c,la80ch		;a7e1	38 29 	8 ) 
	nop			;a7e3	00 	. 
	ret p			;a7e4	f0 	. 
	ld d,(hl)			;a7e5	56 	V 
	ld d,h			;a7e6	54 	T 
	ld b,d			;a7e7	42 	B 
	nop			;a7e8	00 	. 
	call p,sub_8d28h		;a7e9	f4 28 8d 	. ( . 
	add hl,hl			;a7ec	29 	) 
	inc bc			;a7ed	03 	. 
	rst 38h			;a7ee	ff 	. 
	ld c,l			;a7ef	4d 	M 
	ld b,c			;a7f0	41 	A 
	ld d,e			;a7f1	53 	S 
	ld c,e			;a7f2	4b 	K 
	nop			;a7f3	00 	. 
	cp 028h		;a7f4	fe 28 	. ( 
	ld (hl),h			;a7f6	74 	t 
	add hl,hl			;a7f7	29 	) 
	inc de			;a7f8	13 	. 
	ret po			;a7f9	e0 	. 
	ld b,(hl)			;a7fa	46 	F 
	ld d,b			;a7fb	50 	P 
	ld c,l			;a7fc	4d 	M 
	nop			;a7fd	00 	. 
	sbc a,c			;a7fe	99 	. 
	add hl,hl			;a7ff	29 	) 
	rst 38h			;a800	ff 	. 
	jp 000f7h		;a801	c3 f7 00 	. . . 
	rst 38h			;a804	ff 	. 
	nop			;a805	00 	. 
	rst 38h			;a806	ff 	. 
	nop			;a807	00 	. 
	rst 38h			;a808	ff 	. 
	nop			;a809	00 	. 
	rst 38h			;a80a	ff 	. 
	nop			;a80b	00 	. 
la80ch:
	rst 38h			;a80c	ff 	. 
	nop			;a80d	00 	. 
	rst 38h			;a80e	ff 	. 
	nop			;a80f	00 	. 
	rst 38h			;a810	ff 	. 
	nop			;a811	00 	. 
	rst 38h			;a812	ff 	. 
	nop			;a813	00 	. 
	rst 38h			;a814	ff 	. 
	nop			;a815	00 	. 
	rst 38h			;a816	ff 	. 
	nop			;a817	00 	. 
	rst 38h			;a818	ff 	. 
	nop			;a819	00 	. 
	rst 38h			;a81a	ff 	. 
	nop			;a81b	00 	. 
	rst 38h			;a81c	ff 	. 
	nop			;a81d	00 	. 
	rst 38h			;a81e	ff 	. 
	nop			;a81f	00 	. 
	rst 38h			;a820	ff 	. 
	nop			;a821	00 	. 
	rst 38h			;a822	ff 	. 
	nop			;a823	00 	. 
	rst 38h			;a824	ff 	. 
	nop			;a825	00 	. 
	rst 38h			;a826	ff 	. 
	nop			;a827	00 	. 
	rst 38h			;a828	ff 	. 
	nop			;a829	00 	. 
	rst 38h			;a82a	ff 	. 
	nop			;a82b	00 	. 
	rst 38h			;a82c	ff 	. 
	nop			;a82d	00 	. 
	rst 38h			;a82e	ff 	. 
	nop			;a82f	00 	. 
	rst 38h			;a830	ff 	. 
	nop			;a831	00 	. 
	rst 38h			;a832	ff 	. 
	nop			;a833	00 	. 
	rst 38h			;a834	ff 	. 
	nop			;a835	00 	. 
	rst 38h			;a836	ff 	. 
	nop			;a837	00 	. 
	rst 38h			;a838	ff 	. 
	nop			;a839	00 	. 
	rst 38h			;a83a	ff 	. 
	nop			;a83b	00 	. 
	rst 38h			;a83c	ff 	. 
	nop			;a83d	00 	. 
	rst 38h			;a83e	ff 	. 
	nop			;a83f	00 	. 
	rst 38h			;a840	ff 	. 
	nop			;a841	00 	. 
	rst 38h			;a842	ff 	. 
	nop			;a843	00 	. 
	rst 38h			;a844	ff 	. 
	nop			;a845	00 	. 
	rst 38h			;a846	ff 	. 
	nop			;a847	00 	. 
	rst 38h			;a848	ff 	. 
	nop			;a849	00 	. 
	rst 38h			;a84a	ff 	. 
	nop			;a84b	00 	. 
	rst 38h			;a84c	ff 	. 
	nop			;a84d	00 	. 
	rst 38h			;a84e	ff 	. 
	nop			;a84f	00 	. 
	rst 38h			;a850	ff 	. 
	nop			;a851	00 	. 
	rst 38h			;a852	ff 	. 
	nop			;a853	00 	. 
	rst 38h			;a854	ff 	. 
	nop			;a855	00 	. 
	rst 38h			;a856	ff 	. 
	nop			;a857	00 	. 
	rst 38h			;a858	ff 	. 
	nop			;a859	00 	. 
	rst 38h			;a85a	ff 	. 
	nop			;a85b	00 	. 
	rst 38h			;a85c	ff 	. 
	nop			;a85d	00 	. 
	rst 38h			;a85e	ff 	. 
	nop			;a85f	00 	. 
	rst 38h			;a860	ff 	. 
	nop			;a861	00 	. 
	rst 38h			;a862	ff 	. 
	nop			;a863	00 	. 
	rst 38h			;a864	ff 	. 
	nop			;a865	00 	. 
	rst 38h			;a866	ff 	. 
	nop			;a867	00 	. 
	rst 38h			;a868	ff 	. 
	nop			;a869	00 	. 
	rst 38h			;a86a	ff 	. 
	nop			;a86b	00 	. 
	rst 38h			;a86c	ff 	. 
	nop			;a86d	00 	. 
	rst 38h			;a86e	ff 	. 
	nop			;a86f	00 	. 
	rst 38h			;a870	ff 	. 
	nop			;a871	00 	. 
	rst 38h			;a872	ff 	. 
	nop			;a873	00 	. 
	rst 38h			;a874	ff 	. 
	nop			;a875	00 	. 
	rst 38h			;a876	ff 	. 
	nop			;a877	00 	. 
	rst 38h			;a878	ff 	. 
	nop			;a879	00 	. 
	rst 38h			;a87a	ff 	. 
	nop			;a87b	00 	. 
	rst 38h			;a87c	ff 	. 
	nop			;a87d	00 	. 
	rst 38h			;a87e	ff 	. 
	nop			;a87f	00 	. 
	rst 38h			;a880	ff 	. 
	add a,a			;a881	87 	. 
	rst 38h			;a882	ff 	. 
	nop			;a883	00 	. 
	rst 38h			;a884	ff 	. 
	nop			;a885	00 	. 
	rst 38h			;a886	ff 	. 
	nop			;a887	00 	. 
	rst 38h			;a888	ff 	. 
	nop			;a889	00 	. 
	rst 38h			;a88a	ff 	. 
	nop			;a88b	00 	. 
	rst 38h			;a88c	ff 	. 
	nop			;a88d	00 	. 
	rst 38h			;a88e	ff 	. 
	nop			;a88f	00 	. 
	rst 38h			;a890	ff 	. 
	nop			;a891	00 	. 
	rst 38h			;a892	ff 	. 
	nop			;a893	00 	. 
	rst 38h			;a894	ff 	. 
	nop			;a895	00 	. 
	rst 38h			;a896	ff 	. 
	nop			;a897	00 	. 
	rst 38h			;a898	ff 	. 
	nop			;a899	00 	. 
	rst 38h			;a89a	ff 	. 
	nop			;a89b	00 	. 
	rst 38h			;a89c	ff 	. 
	nop			;a89d	00 	. 
	rst 38h			;a89e	ff 	. 
	nop			;a89f	00 	. 
	rst 38h			;a8a0	ff 	. 
	nop			;a8a1	00 	. 
	rst 38h			;a8a2	ff 	. 
	nop			;a8a3	00 	. 
	rst 38h			;a8a4	ff 	. 
	nop			;a8a5	00 	. 
	rst 38h			;a8a6	ff 	. 
	nop			;a8a7	00 	. 
	rst 38h			;a8a8	ff 	. 
	nop			;a8a9	00 	. 
	rst 38h			;a8aa	ff 	. 
	nop			;a8ab	00 	. 
	rst 38h			;a8ac	ff 	. 
	nop			;a8ad	00 	. 
	rst 38h			;a8ae	ff 	. 
	nop			;a8af	00 	. 
	rst 38h			;a8b0	ff 	. 
	nop			;a8b1	00 	. 
	rst 38h			;a8b2	ff 	. 
	nop			;a8b3	00 	. 
	rst 38h			;a8b4	ff 	. 
	nop			;a8b5	00 	. 
	rst 38h			;a8b6	ff 	. 
	nop			;a8b7	00 	. 
	rst 38h			;a8b8	ff 	. 
	nop			;a8b9	00 	. 
	rst 38h			;a8ba	ff 	. 
	nop			;a8bb	00 	. 
	rst 38h			;a8bc	ff 	. 
	nop			;a8bd	00 	. 
	rst 38h			;a8be	ff 	. 
	nop			;a8bf	00 	. 
	rst 38h			;a8c0	ff 	. 
	nop			;a8c1	00 	. 
	rst 38h			;a8c2	ff 	. 
	nop			;a8c3	00 	. 
	rst 38h			;a8c4	ff 	. 
	nop			;a8c5	00 	. 
	rst 38h			;a8c6	ff 	. 
	nop			;a8c7	00 	. 
	rst 38h			;a8c8	ff 	. 
	nop			;a8c9	00 	. 
	rst 38h			;a8ca	ff 	. 
	nop			;a8cb	00 	. 
	rst 38h			;a8cc	ff 	. 
	nop			;a8cd	00 	. 
	rst 38h			;a8ce	ff 	. 
	nop			;a8cf	00 	. 
	rst 38h			;a8d0	ff 	. 
	nop			;a8d1	00 	. 
	rst 38h			;a8d2	ff 	. 
	nop			;a8d3	00 	. 
	rst 38h			;a8d4	ff 	. 
	nop			;a8d5	00 	. 
	rst 38h			;a8d6	ff 	. 
	nop			;a8d7	00 	. 
	rst 38h			;a8d8	ff 	. 
	nop			;a8d9	00 	. 
	rst 38h			;a8da	ff 	. 
	nop			;a8db	00 	. 
	rst 38h			;a8dc	ff 	. 
	nop			;a8dd	00 	. 
	rst 38h			;a8de	ff 	. 
	nop			;a8df	00 	. 
	rst 38h			;a8e0	ff 	. 
	nop			;a8e1	00 	. 
	rst 38h			;a8e2	ff 	. 
	nop			;a8e3	00 	. 
	rst 38h			;a8e4	ff 	. 
	nop			;a8e5	00 	. 
	rst 38h			;a8e6	ff 	. 
	nop			;a8e7	00 	. 
	rst 38h			;a8e8	ff 	. 
	nop			;a8e9	00 	. 
	rst 38h			;a8ea	ff 	. 
	nop			;a8eb	00 	. 
	rst 38h			;a8ec	ff 	. 
	nop			;a8ed	00 	. 
	rst 38h			;a8ee	ff 	. 
	nop			;a8ef	00 	. 
	rst 38h			;a8f0	ff 	. 
	nop			;a8f1	00 	. 
	rst 38h			;a8f2	ff 	. 
	nop			;a8f3	00 	. 
	rst 38h			;a8f4	ff 	. 
	nop			;a8f5	00 	. 
	rst 38h			;a8f6	ff 	. 
	nop			;a8f7	00 	. 
	rst 38h			;a8f8	ff 	. 
	nop			;a8f9	00 	. 
	rst 38h			;a8fa	ff 	. 
	nop			;a8fb	00 	. 
	rst 38h			;a8fc	ff 	. 
	nop			;a8fd	00 	. 
	rst 38h			;a8fe	ff 	. 
	nop			;a8ff	00 	. 
