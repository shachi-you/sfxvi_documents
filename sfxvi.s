;=============================================
;  Filename sfxvi.x
;  Time Stamp Fri Dec 19 12:00:00 1997
;
;  Base address 000000
;  Exec address 01d366
;  Text size    01fbf4 byte(s)
;  Data size    00066a byte(s)
;  Bss  size    055690 byte(s)
;  4948 Labels
;  Code Generate date Tue Aug 19 22:15:23 2025
;  Commandline C:/GCC/dis.x sfxvi.x sfxvi.s --sp --exclude-fefunc-mac
;          DIS version 3.13
;=============================================

	.include	C:\GCC\include/doscall.mac
	.include	C:\GCC\include/iocscall.mac

	.cpu	68000

	.text

L000000:
	movem.l	d3/a3-a6,-(sp)
	move.l	($0018,sp),d3
	movea.l	($001c,sp),a4
	
	L007a58();

	L008030(WORK_1P_0000, WORK_2P_0000);
	L008030(WORK_3P_0000, WORK_4P_0000);

	L008070(WORK_1P_0000, WORK_2P_0000);
	L008070(WORK_3P_0000, WORK_4P_0000);

	L0028b4();

	moveq.l	#$01,d1
	cmp.l	d3,d1
	bge	L000076
	L00361c();
	move.l	($0004,a4),-(sp)
	jsr	(L00361c)
	addq.w	#4,sp
L000076:
	moveq.l	#$02,d1
	cmp.l	d3,d1
	bge	L000088
	move.l	($0008,a4),-(sp)
	jsr	(L00361c)
	addq.w	#4,sp
L000088:
	XCLIB_iocs_b_super(0);

	move.l	d0,(L020aa8)
	jsr	(L00942a)
	lea.l	(SFSYSINFO_0014_xxxx),a5
	lea.l	(SFSYSINFO_0070_XXXX),a6
L0000ac:
	SR_タイマーD割込み解除();
	SR_MESS_SP表示_固定位置(0);
	L017c60(1);

	cmpi.w	#$ffff,(a5)
	bne	L00019a

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);

	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);

	L0081e2(WORK_1P_0000, WORK_2P_0000);
	L0081e2(WORK_3P_0000, WORK_4P_0000);

	moveq.l	#$01,d3
L000124:
	movea.w	d3,a0
	move.l	a0,-(sp)
	jsr	(L008f7e)
	addq.w	#4,sp
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L000124
	jsr	(L009a68)
	jsr	(L009ada)
	tst.w	d0
	bne	L0002a2
	tst.w	(SFSYSINFO_0048_場面_デモ)
	beq	L000192
	
	L009bf2();
	L014804(10);
	
	L0138ac(WORK_1P_0000, 0, 1);
	L0138ac(WORK_2P_0000, 0, 1);
L000192:
	move.w	#$ffff,(a5)
	bra	L0000ac
L00019a:
	tst.w	(a5)
	bne	L0001cc

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(0, 0);

	bra	L0002a2
L0001cc:
	cmpi.w	#$0001,(a5)
	bne	L000226

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);

	SR_ラスター割込み設定解除();
	L017c60(1);

	tst.w	($000a,a5)
	beq	L0002a2
	tst.w	($003a,a5)
	beq	L0002a2
	move.w	#$0003,(a5)
	bra	L0000ac
L000226:
	cmpi.w	#$0003,(a5)
	bne	L0002a2
	
	L014804(10);
	L0138ac(WORK_1P_0000, 0, 1);
	L0138ac(WORK_2P_0000, 0, 1);
	L00b60a();

	move.w	#$ffff,(a5)

	L014804(10);
	L0138ac(WORK_1P_0000, 0, 1);
	L0138ac(WORK_2P_0000, 0, 1);
L0002a2:
	clr.w	(a6)

	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);
	L005e18(WORK_1P_0000, WORK_2P_0000, 0);

	cmpi.w	#$ffff,(a5)
	beq	L0002e4
	tst.w	(a5)
	beq	L0002e4
	cmpi.w	#$0001,(a5)
	beq	L0002e4
	cmpi.w	#$0003,(a5)
	bne	L0002a2
L0002e4:
	SR_ラスター割込み設定解除();

	tst.w	(SFSYSINFO_0066_xxxx)
	beq	L0000ac

	L014804(10);
	L0138ac(WORK_1P_0000, 0, 1);
	L0138ac(WORK_2P_0000, 0, 1);

	bra	L0000ac
L000332:
	movem.l	(sp)+,d3/a3-a6
	rts

L000338:
	.dc.b	'SYSTEM CONFIGURATION',$00,$00
L00034e:
	.dc.b	'CPU LEVEL    EASY  ',$00
L000362:
	.dc.b	'CPU LEVEL    NORMAL',$00
L000376:
	.dc.b	'CPU LEVEL    HARD  ',$00
L00038a:
	.dc.b	'SCREEN         KHZ',$00,$00
L00039e:
	.dc.b	'SPEED        NORMAL ',$00,$00
L0003b4:
	.dc.b	'SPEED        TURBO  ',$00,$00
L0003ca:
	.dc.b	'SUPER COMBO  INFINITE',$00
L0003e0:
	.dc.b	'SUPER COMBO  FINITE  ',$00
L0003f6:
	.dc.b	'SHOOT COUNT  FINITE  ',$00
L00040c:
	.dc.b	'SHOOT COUNT  INFINITE',$00
L000422:
	.dc.b	'FAINTING     ON ',$00,$00
L000434:
	.dc.b	'FAINTING     OFF',$00,$00
L000446:
	.dc.b	'STAGE LOOP   ON ',$00,$00
L000458:
	.dc.b	'STAGE LOOP   OFF',$00,$00
L00046a:
	.dc.b	'TRANSFORM    ON ',$00,$00
L00047c:
	.dc.b	'TRANSFORM    OFF',$00,$00
L00048e:
	.dc.b	'DAMAGE       NORMAL',$00
L0004a2:
	.dc.b	'DAMAGE       HALF  ',$00
L0004b6:
	.dc.b	'DAMAGE       DOUBLE',$00
L0004ca:
	.dc.b	'DAMAGE       NO    ',$00
L0004de:
	.dc.b	'TIME LIMIT   OFF',$00,$00
L0004f0:
	.dc.b	'TIME LIMIT   ON ',$00,$00
L000502:
	.dc.b	'TIME PASS    ON ',$00,$00
L000514:
	.dc.b	'TIME PASS    OFF',$00,$00
L000526:
	.dc.b	'DRUM SOUND   ON ',$00,$00
L000538:
	.dc.b	'DRUM SOUND   OFF',$00,$00
L00054a:
	.dc.b	'MIDI SOUND   OFF',$00,$00
L00055c:
	.dc.b	'MIDI SOUND   ON ',$00,$00
L00056e:
	.dc.b	'RETURN',$00,$00
L000576:
	.dc.b	'SAVE',$00,$00
L00057c:
	movem.l	d3-d7/a3-a5,-(sp)
	moveq.l	#$00,d5
	
	
	L01ca52(1);
	SYSCALL_01e4_Scr設定_表示面(1);
	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(0, 0);
	SR_BG文字列表示(5, 4, "SYSTEM CONFIGURATION", 0x0d00);

	moveq.l	#$00,d7
	moveq.l	#$00,d6
L0005e4:
	moveq.l	#$09,d3
	
	if (SFSYSINFO_0008_Cpu思考レベル == 0) {
		SR_BG文字列表示(6, 9, "CPU LEVEL EASY", 0x0c00);
	} else if (SFSYSINFO_0008_Cpu思考レベル == 1) {
		SR_BG文字列表示(6, d3, "CPU LEVEL NORMAL", 0x0c00);
	} else if (SFSYSINFO_0008_Cpu思考レベル == 2) {
		SR_BG文字列表示(6, d3, "CPU LEVEL    HARD", 0x0c00);
	}

	addq.w	#1,d3

	SR_BG文字列表示(6, d3, "SCREEN         KHZ", 0x0c00);

	if (SFSYSINFO_002e_スクリーン周波数 == 1) {
		SR_BG数字表示(19, d3, 31, 0x0c00);
	} else {
		SR_BG数字表示(19, d3, 15, 0x0c00);
	}

	addq.w	#1,d3
	
	if (SFSYSINFO_000c_ゲームスピード == 0) {
		SR_BG文字列表示(6, d3, "SPEED        NORMAL", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "SPEED        TURBO", 0x0c00);
		SR_BG数字表示(25, d3, SFSYSINFO_000c_ゲームスピード, 0x0c00);
	}

	addq.w	#1,d3
	
	if (SFSYSINFO_003e_スーパーコンボ無限) {
		SR_BG文字列表示(6, d3, "SUPER COMBO  INFINITE", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "SUPER COMBO  FINITE", 0x0c00);
	}

	addq.w	#1,d3
	
	if (SFSYSINFO_0032_飛び道具無限) {
		SR_BG文字列表示(6, d3, "SHOOT COUNT  FINITE", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "SHOOT COUNT  INFINITE", 0x0c00);
	}

	addq.w	#1,d3
	
	if (SFSYSINFO_0034_気絶有効) {
		SR_BG文字列表示(6, d3, "FAINTING     ON", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "FAINTING     OFF", 0x0c00);
	}
	
	addq.w	#1,d3

	if (SFSYSINFO_0036_ステージループ有効) {
		SR_BG文字列表示(6, d3, "STAGE LOOP   ON", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "STAGE LOOP   OFF", 0x0c00);
	}

	addq.w	#1,d3
	
	if (SFSYSINFO_0040_変身有効) {
		SR_BG文字列表示(6, d3, "TRANSFORM    ON", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "TRANSFORM    OFF", 0x0c00);
	}

	addq.w	#1,d3

	switch (SFSYSINFO_0038_1Pダメージ倍率) {
		case 0:
			SR_BG文字列表示(6, d3, "DAMAGE       NORMAL", 0x0c00);
			break;
		case 1:
			SR_BG文字列表示(6, d3, "DAMAGE       HALF", 0x0c00);
			break;
		case 2:
			SR_BG文字列表示(6, d3, "DAMAGE       DOUBLE", 0x0c00);
			break;
		case 3:
			SR_BG文字列表示(6, d3, "DAMAGE       NO", 0x0c00);
			break;
	}
	SR_BG数字表示(13, d3, 1, 0x0c00);

	addq.w	#1,d3

	switch (SFSYSINFO_0042_2Pダメージ倍率) {
		case 0:
			SR_BG文字列表示(6, d3, "DAMAGE       NORMAL", 0x0c00);
			break;
		case 1:
			SR_BG文字列表示(6, d3, "DAMAGE       HALF", 0x0c00);
			break;
		case 2:
			SR_BG文字列表示(6, d3, "DAMAGE       DOUBLE", 0x0c00);
			break;
		case 3:
			SR_BG文字列表示(6, d3, "DAMAGE       NO", 0x0c00);
			break;
	}
	SR_BG数字表示(13, d3, 2, 0x0c00);

	addq.w	#1,d3

	if (SFSYSINFO_000a_タイムリミット有効 == 1) {
		SR_BG文字列表示(6, d3, "TIME LIMIT   OFF", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "TIME LIMIT   ON", 0x0c00);
	}

	addq.w	#1,d3

	if (SFSYSINFO_0046_時間経過有効 == 1) {
		SR_BG文字列表示(6, d3, "TIME PASS    ON", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "TIME PASS    OFF", 0x0c00);
	}

	addq.w	#1,d3

	if (SFSYSINFO_0002_PCMドラム有効 == 1) {
		SR_BG文字列表示(6, d3, "DRUM SOUND   ON", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "DRUM SOUND   OFF", 0x0c00);
	}

	addq.w	#1,d3

	if (SFSYSINFO_003c_MIDIサウンド有効 == 0) {
		SR_BG文字列表示(6, d3, "MIDI SOUND   OFF", 0x0c00);
	} else {
		SR_BG文字列表示(6, d3, "MIDI SOUND   ON", 0x0c00);
	}

	addq.w	#1,d3

	SR_BG文字列表示(6, d3, "RETURN", 0x0f00);

	addq.w	#2,d3

	SR_BG文字列表示(6, d3, "SAVE", 0x0f00);

	lea.l	(WORK_1P_0acc_スティック直接状態),a4		;WORK_1P_0acc_スティック直接状態
	lea.l	(SR_STC_TRG_直接状態更新),a3
L000a7c:
	SR_VDISP回数指定待機(1);

	SR_STC_TRG_直接状態更新(WORK_1P_0000);
	SR_STC_TRG_直接状態更新(WORK_2P_0000);

	tst.l	(a4)
	bne	L000a7c
	tst.l	(WORK_2P_0acc_スティック直接状態)
	bne	L000a7c

	SR_BGページ1_書き込み(5, d5+9, 0x0f06);

	lea.l	(WORK_1P_0acc_スティック直接状態),a5
	lea.l	(WORK_2P_0acc_スティック直接状態),a4
	lea.l	(SR_STC_TRG_直接状態更新),a3
L000ad2:
	SR_STC_TRG_直接状態更新(WORK_1P_0000);
	SR_STC_TRG_直接状態更新(WORK_2P_0000);

	move.l	(a5),d3
	move.l	(a4),d4
	moveq.l	#$02,d2
	cmp.l	d3,d2
	beq	L000af4
	cmp.l	d4,d2
	bne	L000b34
L000af4:
	SR_BGページ1_書き込み(5, d5+9, 0x0000);
	if (++d5 > 10) d5 = 0;
	SR_BGページ1_書き込み(5, d5+9, 0x0f06);

	pea.l	($0008)
	bra	L000b96
L000b34:
	moveq.l	#$08,d2
	cmp.l	d3,d2
	beq	L000b3e
	cmp.l	d4,d2
	bne	L000b7a
L000b3e:
	pea.l	($0000)
	movea.w	d5,a0
	pea.l	($0009,a0)
	pea.l	($0005)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#1,d5
	bpl	L000b5c
	moveq.l	#$0e,d5
L000b5c:
	pea.l	($0f06)
	movea.w	d5,a0
	pea.l	($0009,a0)
	pea.l	($0005)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	pea.l	($0008)
	bra	L000b96
L000b7a:
	cmp.l	d6,d3
	bne	L000b84
	moveq.l	#$00,d2
	move.l	d2,(a5)
	bra	L000b86
L000b84:
	move.l	d3,(a5)
L000b86:
	cmp.l	d7,d4
	bne	L000b90
	moveq.l	#$00,d2
	move.l	d2,(a4)
	bra	L000b92
L000b90:
	move.l	d4,(a4)
L000b92:
	pea.l	($0001)
L000b96:
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	move.l	d3,d6
	move.l	d4,d7
	moveq.l	#$06,d2
	cmp.l	(a5),d2
	beq	L000bc8
	cmp.l	(a4),d2
	beq	L000bc8
	moveq.l	#$04,d2
	cmp.l	(a5),d2
	beq	L000be0
	cmp.l	(a4),d2
	beq	L000be0
	moveq.l	#$01,d2
	cmp.l	(WORK_1P_0ad0_xxxx),d2
	beq	L000bc8
	cmp.l	(WORK_2P_0ad0_xxxx),d2
	bne	L000bcc
L000bc8:
	moveq.l	#$01,d1
	bra	L000be2
L000bcc:
	moveq.l	#$02,d2
	cmp.l	(WORK_1P_0ad0_xxxx),d2
	beq	L000be0
	cmp.l	(WORK_2P_0ad0_xxxx),d2
	bne	L000ad2
L000be0:
	moveq.l	#$ff,d1
L000be2:
	move.w	d5,d0
	ext.l	d0
	moveq.l	#$10,d2
	cmp.l	d2,d0
	bhi	L0005e4
	add.l	d0,d0
	move.w	(L000bf8,pc,d0.l),d2
	jmp	(L000bf8,pc,d2.w)

L000bf8:
	.dc.w	L000c1a-L000bf8
	.dc.w	L000c50-L000bf8
	.dc.w	L000cb6-L000bf8
	.dc.w	L000cec-L000bf8
	.dc.w	L000cf8-L000bf8
	.dc.w	L000d04-L000bf8
	.dc.w	L000d10-L000bf8
	.dc.w	L000d1c-L000bf8
	.dc.w	L000d28-L000bf8
	.dc.w	L000d52-L000bf8
	.dc.w	L000d88-L000bf8
	.dc.w	L000d94-L000bf8
	.dc.w	L000da0-L000bf8
	.dc.w	L000dba-L000bf8
	.dc.w	L000dd0-L000bf8
	.dc.w	L0005e4-L000bf8
	.dc.w	L000dc6-L000bf8
L000c1a:
	cmp.w	#$0001,d1
	bne	L000c28
	addq.w	#1,(SFSYSINFO_0008_Cpu思考レベル)
	bra	L000c2e
L000c28:
	subq.w	#1,(SFSYSINFO_0008_Cpu思考レベル)
L000c2e:
	lea.l	(SFSYSINFO_0008_Cpu思考レベル),a0
	cmpi.w	#$0002,(a0)
	ble	L000c3c
	clr.w	(a0)
L000c3c:
	lea.l	(SFSYSINFO_0008_Cpu思考レベル),a0
	tst.w	(a0)
	bge	L0005e4
	move.w	#$0002,(a0)
	bra	L0005e4
L000c50:
	SFSYSINFO_002e_スクリーン周波数 ^= 1;
	SR_スクリーン周波数変更(SFSYSINFO_002e_スクリーン周波数 ? 0 : 1);
	XCLIB_iocs_home(1, 0, 256);
	XCLIB_iocs_home(2, 0, 2560);
	L01d7e0(1, 0, 0);

	bra	L0005e4
L000cb6:
	cmp.w	#$0001,d1
	bne	L000cc4
	addq.w	#1,(SFSYSINFO_000c_ゲームスピード)
	bra	L000cca
L000cc4:
	subq.w	#1,(SFSYSINFO_000c_ゲームスピード)
L000cca:
	lea.l	(SFSYSINFO_000c_ゲームスピード),a0
	cmpi.w	#$0004,(a0)
	ble	L000cd8
	clr.w	(a0)
L000cd8:
	lea.l	(SFSYSINFO_000c_ゲームスピード),a0
	tst.w	(a0)
	bge	L0005e4
	move.w	#$0004,(a0)
	bra	L0005e4
L000cec:
	eori.w	#$0001,(SFSYSINFO_003e_スーパーコンボ無限)
	bra	L0005e4
L000cf8:
	eori.w	#$0001,(SFSYSINFO_0032_飛び道具無限)
	bra	L0005e4
L000d04:
	eori.w	#$0001,(SFSYSINFO_0034_気絶有効)
	bra	L0005e4
L000d10:
	eori.w	#$0001,(SFSYSINFO_0036_ステージループ有効)
	bra	L0005e4
L000d1c:
	eori.w	#$0001,(SFSYSINFO_0040_変身有効)
	bra	L0005e4
L000d28:
	cmp.w	#$0001,d1
	bne	L000d36
	addq.w	#1,(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L000d3c
L000d36:
	subq.w	#1,(SFSYSINFO_0038_1Pダメージ倍率)
L000d3c:
	lea.l	(SFSYSINFO_0038_1Pダメージ倍率),a0
	cmpi.w	#$0003,(a0)
	ble	L000d4a
	clr.w	(a0)
L000d4a:
	lea.l	(SFSYSINFO_0038_1Pダメージ倍率),a0
	bra	L000d7a
L000d52:
	cmp.w	#$0001,d1
	bne	L000d60
	addq.w	#1,(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L000d66
L000d60:
	subq.w	#1,(SFSYSINFO_0042_2Pダメージ倍率)
L000d66:
	lea.l	(SFSYSINFO_0042_2Pダメージ倍率),a0
	cmpi.w	#$0003,(a0)
	ble	L000d74
	clr.w	(a0)
L000d74:
	lea.l	(SFSYSINFO_0042_2Pダメージ倍率),a0
L000d7a:
	tst.w	(a0)
	bge	L0005e4
	move.w	#$0003,(a0)
	bra	L0005e4
L000d88:
	eori.w	#$0001,(SFSYSINFO_000a_タイムリミット有効)
	bra	L0005e4
L000d94:
	eori.w	#$0001,(SFSYSINFO_0046_時間経過有効)
	bra	L0005e4
L000da0:
	lea.l	(SFSYSINFO_0002_PCMドラム有効),a0
	eori.w	#$0001,(a0)
	movea.w	(a0),a1
	move.l	a1,-(sp)
	jsr	(L017c60)
	addq.w	#4,sp
	bra	L0005e4
L000dba:
	eori.w	#$0001,(SFSYSINFO_003c_MIDIサウンド有効)
	bra	L0005e4
L000dc6:
	jsr	(L0033c2)
	bra	L0005e4
L000dd0:
	pea.l	($0000)
	jsr	(L01ca52)
	addq.w	#4,sp
	movem.l	(sp)+,d3-d7/a3-a5
	rts

L000de2:
	.dc.b	'STAGE ',$00,$00
L000dea:
	.dc.b	'BATTLE',$00,$00
L000df2:
	.dc.b	'SPEED ',$00,$00
L000dfa:
	.dc.b	'NORMAL',$00,$00
L000e02:
	.dc.b	'TURBO %d',$00,$00
SR_ラウンドコールBG文字列表示(p1, p2)
{
	a3 = L009138(SFSYSINFO_0016_ステージ番号);

	SR_BG文字列描画(9, 13, "STAGE ", 0x0d00);

	if (a3) {
		SR_BG文字列描画(17, 13, a3 + 0x30, 0x0c00);
	}

	SR_BG文字列描画(9, 15, "BATTLE", 0x0d00);

	if (++現在の試合数1桁目 > 9) {
		現在の試合数1桁目 = 0;
		if (++現在の試合数2桁目 > 9) {
			現在の試合数1桁目 = 9;
			現在の試合数2桁目 = 9;
		}
	}

	SR_BG文字列描画(9, 17, "SPEED ", 0x0d00);
	SR_BG数字表示(17, 15, 現在の試合数2桁目, 0x0c00);
	SR_BG数字表示(18, 15, 現在の試合数1桁目, 0x0c00);

	if (SFSYSINFO_000c_ゲームスピード == 0) {
		SR_BG文字列描画(17, 17, "NORMAL", 0x0c00);
		return;
	}

	XCLIB_sprintf(a6_mi64, "TURBO %d", SFSYSINFO_000c_ゲームスピード);
	SR_BG文字列描画(17, 17, a6_mi64, 0x0c00);
}

SR_ゲージ・タイム・インジケータ・勝ち数表示:
	movem.l	d3-d4/a3,-(sp)
	move.l	($0010,sp),d3
	move.l	($0014,sp),d4
	pea.l	($0000)
	move.l	d3,-(sp)
	lea.l	(SYSCALL_0020_ゲージ減少_サブ),a3
	jsr	(a3)						;SYSCALL_0020_ゲージ減少_サブ(p1, 0);
	addq.w	#8,sp
	pea.l	($0000)
	move.l	d4,-(sp)
	jsr	(a3)						;SYSCALL_0020_ゲージ減少_サブ(p2, 0);
	addq.w	#8,sp
	jsr	(SR_各種ゲージ・インジケータ表示)
	jsr	(SR_ラウンドタイマーカウントダウン＆表示)
	tst.w	(SFSYSINFO_000a_タイムリミット有効)
	beq	L000fa4
	jsr	(SR_ラウンドタイマー制限なし表示)
L000fa4:
	move.l	d3,-(sp)
	lea.l	(SR_BG勝ち数表示),a3
	jsr	(a3)						;SR_BG勝ち数表示(p1);
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)						;SR_BG勝ち数表示(p2);
	addq.w	#4,sp
	movem.l	(sp)+,d3-d4/a3
	rts

L000fbc:
	dc.b	'ROUND', 0
L000fc2:
	movem.l	a3-a6,-(sp)
	movea.l	($0014,sp),a5
	movea.l	($0018,sp),a4

	SFSYSINFO_007c_xxxx = 0;

	SR_MESS_SP_PCGパターン定義(0, 0, 8);	//READY
	SYSCALL_0044_キャラクタ向かい合わせ設定(p1, p2);
	SYSCALL_0044_キャラクタ向かい合わせ設定(p2, p1);

	if (p1->090c_OPT_登場) {
		SYSCALL_0000_セル設定_表示(p1, CELL_透明);
		SR_キャラ動作関数実行(p1, OPT_登場);
		p1->0024_xxxx = -1;
	}

	if (p2->090c_OPT_登場) {
		SYSCALL_0000_セル設定_表示(p2, CELL_透明);
		SR_キャラ動作関数実行(p2, OPT_登場);
		p2->0024_xxxx = -1;
	}

	SR_ラウンド開始前スクロール演出(0);
	SR_ステージパレット反映();

	p1->1758_xxxx = DRCT_右;
	p1->09e8_動作方向 = DRCT_右;
	p1->01b8_相対方向 = DRCT_右;

	p2->1758_xxxx = DRCT_左;
	p2->09e8_動作方向 = DRCT_左;
	p2->01b8_相対方向 = DRCT_左;

	SYSCALL_01c8_状態設定_表示方向(p1, DRCT_右);
	SYSCALL_01c8_状態設定_表示方向(p2, DRCT_左);

	L007342(p1, p2, 100, 0);

	while (SR_ラウンド開始前スクロール演出(1) == 0) {
		L00120e();
	}

	SFSYSINFO_007c_xxxx = 1;
	
	L0012c2(4);

	SR_BG文字列表示(13, 12, "ROUND", 0x0b00);
	SYSCALL_0024_音声再生(3, PCM_ラウンド);

	L0012c2(12);
	L0012da();

	SR_ラウンドタイマーBG数字表示(15, 14, SFSYSINFO_001a_ラウンド番号, 0x0c00);
	SYSCALL_0024_音声再生(3, PCM_1 + SFSYSINFO_001a_ラウンド番号);

	L0012c2(20);
	L0012da();
	SR_MESS_SP表示_固定位置(0x0f00);
	SYSCALL_0024_音声再生(3, PCM_READY);
	L0012c2(16);
	L0012da();
	L0012c2(12);
	SR_MESS_SP表示_固定位置(0);

	SR_BG文字列消去(12, 12, 8);
	SR_BG文字列消去(12, 13, 8);
	SR_BG文字列消去(12, 14, 8);
	SR_BG文字列消去(12, 15, 8);

	SYSCALL_0024_音声再生(3, PCM_GO);

	movem.l	(sp)+,a3-a6
	rts

L00120e()
{
	SR_STC_TRG_直接状態更新(WORK_1P_0000);
	SR_STC_TRG_直接状態更新(WORK_2P_0000);
	SYSCALL_0110_Cmd実行_動作(WORK_1P_0000, ACT_アイドル, 1);
	SYSCALL_0110_Cmd実行_動作(WORK_2P_0000, ACT_アイドル, 1);
	SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000);
	SR_キャラ動作関数実行(WORK_1P_0000, SUB_直立);
	SR_キャラ動作関数実行(WORK_2P_0000, SUB_直立);
	L003f12(WORK_1P_0000, WORK_2P_0000);
	SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
	SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);
}

L0012c2(cycle)
{
	while (cycle--) {
		L0012f4();
	}
}

L0012da()
{
	do {
		L0012f4();
	} while(SR_PCM8ファンクションコール_データ長問い合わせ(3) == 0);
}

L0012f4()
{
	L00120e();
	L0041fa();
}

L001302:
	.dc.b	'Draw',$0a,$00
L001308(p1, p2)
{
	if (L001646(WORK_1P_0000, WORK_2P_0000)) {
		return 0;
	}

	if (p1->002c_勝ち数 <= 1) {
		for (i = 0; i < 64; i++) {
			L004c7c(1);
			L01ad20();
			SR_STC_TRG_直接状態更新(p2);
			SR_STC_TRG_直接状態更新(p1);
			if (p1->0ad0_xxxx) break;
		}
		return 1;
	}

	L0015ee(0x0030);
	SYSCALL_0200_Bgm制御_フェードアウト();
	L0015c2(3);
	L0015c2(p1->000a_プレイヤー番号);
	if (L0690b4 == 0 && p1->002e_残り体力 < 0 || p2->002e_残り体力 < 0) {
		SR_勝敗ログ文字列生成(WORK_1P_0000, WORK_2P_0000, a6_0080);
		SFSYSINFO_0014_xxxx = 1;
		if (SFSYSINFO_0066_xxxx == 0 && p1->0a86_CPU制御状態 == 0 && L0b1f2() != 0) {
			while (SYSCALL_0204_Bgm取得_状態()) {
				L004c7c(1);
				L00ad20();
			}
			L0015ee(0x0030);
			SR_画面フェードアウト();
			L005bb0(2, a6_0080);
			SFSYSINFO_0014_xxxx = 3;
		}
		L00b1d0();
	} else {
		--SFSYSINFO_001a_ラウンド番号;
		L0015ee(0x0028);
		SR_MESS_SP表示_固定位置(0);
		L0015ee(0x0080);
		XCLIB_strcpy(a6_0080, "Draw\n");
	}

	L004c7c(0x0020);

	if (p2->0a86_CPU制御状態 == 0 && L002002(WORK_2P_0000, WORK_1P_0000)) {
			L014804(10);

			L0138ac(WORK_1P_0000, 0, 1);
			L0138ac(WORK_2P_0000, 0, 1);

			SFSYSINFO_0472_xxxx = 1;
			SFSYSINFO_0014_xxxx = 0;
		} else {
			SFSYSINFO_0472_xxxx = 0;
			SFSYSINFO_0014_xxxx = -1;
		}

		L005bb0(2, a6_0080);
		return 1;
	}

L0014f4:
	.dc.b	'%S Win -> %S(%d%), %S(%d%)',$0a,$00,$00,$00
SR_勝敗ログ文字列生成(p1, p2, buff)
{
	if (p1->000c_セレクト番号 != p2->000c_セレクト番号) {
		SR_キャラ試合数カウントアップ(p1->000c_セレクト番号);
		SR_キャラ試合数カウントアップ(p2->000c_セレクト番号);
		SR_キャラ勝利数カウントアップ(p1->000c_セレクト番号);
	}

	XCLIB_sprintf(buff, "%S Win -> %S(%d%), %S(%d%)\n",
		p1->000e_キャラの名前,
		SR_REG_キャラクタディレクトリ名取得(WORK_1P_000c_セレクト番号), SR_キャラ勝率計算(WORK_1P_000c_セレクト番号),
		SR_REG_キャラクタディレクトリ名取得(WORK_2P_000c_セレクト番号), SR_キャラ勝率計算(WORK_2P_000c_セレクト番号)
	);
}

L0015c2(a3)
{
	while (SR_PCM8ファンクションコール_データ長問い合わせ(a3)) {
		L04c7c(1);
		L01ad20();
	}
}

L0015ee(ループ回数)
{
	for (d3 = 0; d3 <= ループ回数; d3++) {
		SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000);

		SYSCALL_0000_セル設定_表示(WORK_1P_0000, WORK_1P_09ea_セル番号);
		SYSCALL_0000_セル設定_表示(WORK_2P_0000, WORK_2P_09ea_セル番号);

		L0041fa();
}

L001646(p1, p2)
{
	SFSYSINFO_0070_XXXX = 0;
	if (L01fbf4 == 0) {
		if (p2->09e2_動作ID != ACT_待機) {
			return 0;
		}
		L01fbf4 = 1;
	}
	p1->0aca_xxxx = 0;
	p1->01c8_xxxx = 0;
	if (p1->09e2_動作ID != ACT_アイドル) {
		return 0;
	}
	
	L01fbf4 = 0;
	
	XCLIB_sp_off(15, 17);
	XCLIB_sp_off(23, 25);
	XCLIB_sp_off(10, 13);
	XCLIB_sp_off(18, 21);

	p2->0a4c_xxxx = 0;
	p1->0a4c_xxxx = 0;
	p2->0a56_xxxx = 0;
	p1->0a56_xxxx = 0;
	p1->1730_コンボ前体力 = p1->002e_残り体力;
	p2->1730_コンボ前体力 = p2->002e_残り体力;
	SR_1P2P体力ゲージ描画();

	if (L0690b4 || p1->002e_残り体力 < 0 && p2->002e_残り体力 < 0) {
		SR_MESS_SP表示_固定位置(0);

		SR_BG文字列消去(12, 12, 8);
		SR_BG文字列消去(12, 13, 8);
		SR_BG文字列消去(12, 14, 8);
		SR_BG文字列消去(12, 15, 8);

		SR_コンボ数表示クリア(a4);
		SR_コンボ数表示クリア(a5);

		L00449c();

		L001806(p1, p2);

		return 2;
	}

	SR_MESS_SP表示_固定位置(0);

	SR_BG文字列消去(12, 12, 8);
	SR_BG文字列消去(12, 13, 8);
	SR_BG文字列消去(12, 14, 8);
	SR_BG文字列消去(12, 15, 8);

	SR_コンボ数表示クリア(p1);
	SR_コンボ数表示クリア(p2);

	L00449c();

	L00195a(p1, p2);

	return 1;
}

L001806(p1, p2)
{
	SFSYSINFO_007c_xxxx = 0;
	p1->0a42_攻撃過程値 = 0;
	p2->0a42_攻撃過程値 = 0;

	for (d3 = 0; d3 <= 39; d3++) {
		L003f12(WORK_1P_0000, WORK_2P_0000);
		SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000)

		SR_キャラ動作関数実行(p1, SUB_直立);
		SR_キャラ動作関数実行(p2, SUB_直立);

		L015c8c(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
		SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);

		L0041fa();
	}

	p1->0a42_攻撃過程値 = 0;
	p2->0a42_攻撃過程値 = 0;

	do {
		L003f12(WORK_1P_0000, WORK_2P_0000);
		SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(p1, SUB_判定負け);
		SR_キャラ動作関数実行(p2, SUB_判定負け);

		L015c8c(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
		SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);

		L0041fa();
	} while (p1->09ee_カウンタ現在値 > 0 || p2->09ee_カウンタ現在値 > 0);

	L0015c2(3);

	L0015c2(p1->000a_プレイヤー番号);
	L0015c2(p2->000a_プレイヤー番号);

	SFSYSINFO_007c_xxxx = 1;
}

L00195a(p1, p2)
{
	SFSYSINFO_007c_xxxx = 0;
	
	if (L0690b8 == 0) goto L001b72;

	p2->0a42_攻撃過程値 = 0;

L001986:
	do {
		L003f12(WORK_1P_0000, WORK_2P_0000);

		WORK_1P_1324_思考完了 = 0;
		WORK_2P_1324_思考完了 = 0;
		WORK_1P_1740_防御キャンセル可能フラグ = 0;
		WORK_2P_1740_防御キャンセル可能フラグ = 0;

		SR_ヒット情報クリア(WORK_1P_0000);
		SR_ヒット情報クリア(WORK_2P_0000);

		SFSYSINFO_007a_セル前面表示フラグ = 0;
		WORK_2P_0f22_キャラ振動フラグ = 0;
		WORK_1P_0f22_キャラ振動フラグクリア = 0;

		SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(p1, SUB_直立);
		SR_キャラ動作関数実行(p2, SUB_判定負け);

		SR_ステージX座標更新(p1, p2);

		SR_STC_TRG_直接状態更新(WORK_1P_0000);
		SR_STC_TRG_直接状態更新(WORK_2P_0000);

		L015c8c(WORK_1P_0000, WORK_2P_0000);

		if (WORK_1P_1756_セル非表示フラグ == 0)
			SYSCALL_0000_セル設定_表示(WORK_1P_0000, WORK_1P_09ea_セル番号);

		if (WORK_2P_1756_セル非表示フラグ == 0)
			SYSCALL_0000_セル設定_表示(WORK_2P_0000, WORK_2P_09ea_セル番号);


		WORK_2P_1756_セル非表示フラグ = 0
		WORK_1P_1756_セル非表示フラグ = 0;

		L00cb2a(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
		SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);

		if (WORK_1P_0ac2_気集中 == 0)
			L00c0be(WORK_1P_0000, WORK_2P_0000);
		if (WORK_2P_0ac2_気集中 == 0)
			L00c0be(WORK_2P_0000, WORK_1P_0000);

		if (WORK_1P_0ac2_気集中 == 0)
			SR_残像座標更新(WORK_1P_0000);
		if (WORK_2P_0ac2_気集中 == 0)
			SR_残像座標更新(WORK_2P_0000);

		if (WORK_1P_0008_Y座標 > BASE_LINE-1) {
			WORK_1P_174c_xxxx = 0;
			if (WORK_1P_0f12_シューティングモード == 0)
				WORK_1P_0008_Y座標 = BASE_LINE;
		} else {
			WORK_1P_1754_xxxx = 1;
		}

		if (WORK_2P_0008_Y座標 > BASE_LINE-1) {
			WORK_2P_174c_xxxx = 0;
			if (WORK_2P_0f12_シューティングモード == 0)
				WORK_2P_0008_Y座標 = BASE_LINE;
		} else {
			WORK_2P_1754_xxxx = 1;
		}

		L0041fa();
	} while (p2->09ee_カウンタ現在値 > 0);

L001b72:
	if (SFSYSINFO_0048_場面_デモ || SFSYSINFO_0036_ステージループ有効 == 0)
		p2->002c_勝ち数++;

	SR_BG勝ち数表示(p1);
	p1->0a42_攻撃過程値 = 0;

	for (d3 = 0; d3 <= 39; d3++) {
		L003f12(WORK_1P_0000, WORK_2P_0000);

		WORK_1P_1324_思考完了 = 0;
		WORK_2P_1324_思考完了 = 0;
		WORK_1P_1740_防御キャンセル可能フラグ = 0;
		WORK_2P_1740_防御キャンセル可能フラグ = 0;

		SR_ヒット情報クリア(WORK_1P_0000);
		SR_ヒット情報クリア(WORK_2P_0000);

		SFSYSINFO_007a_セル前面表示フラグ = 0;
		WORK_2P_0f22_キャラ振動フラグ = 0;
		WORK_1P_0f22_キャラ振動フラグ = 0;

		SR_SHOT実行_CMD状態変化・表示(WORK_1P_0000, WORK_2P_0000);
		SR_キャラ動作関数実行(p1, SUB_直立);
		SR_ステージX座標更新(p1, p2);

		SR_STC_TRG_直接状態更新(WORK_1P_0000);
		SR_STC_TRG_直接状態更新(WORK_2P_0000);

		L015c8c(WORK_1P_0000, WORK_2P_0000);

		if (WORK_1P_1756_セル非表示フラグ == 0)
			SYSCALL_0000_セル設定_表示(WORK_1P_0000, WORK_1P_09ea_セル番号);
		if (WORK_2P_1756_セル非表示フラグ == 0)
			SYSCALL_0000_セル設定_表示(WORK_2P_0000, WORK_2P_09ea_セル番号);

		WORK_2P_1756_セル非表示フラグ = 0;
		WORK_1P_1756_セル非表示フラグ = 0;

		L00cb2a(WORK_1P_0000, WORK_2P_0000);

		SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
		SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);

		if (WORK_1P_0ac2_気集中 == 0)
			L00c0be(WORK_1P_0000, WORK_2P_0000);
		if (WORK_2P_0ac2_気集中 == 0)
			L00c0be(WORK_2P_0000, WORK_1P_0000);

		if (WORK_1P_0ac2_気集中 == 0)
			SR_残像座標更新(WORK_1P_0000);
		if (WORK_2P_0ac2_気集中 == 0)
			SR_残像座標更新(WORK_2P_0000);

		if (WORK_1P_0008_Y座標 > BASE_LINE-1) {
			WORK_1P_174c_xxxx = 0;
			if (WORK_1P_0f12_シューティングモード == 0)
				WORK_1P_0008_Y座標 = BASE_LINE;
		} else {
			WORK_1P_1754_xxxx = 1;
		}

		if (WORK_2P_0008_Y座標 > BASE_LINE-1) {
			WORK_2P_174c_xxxx = 0;
			if (WORK_2P_0f12_シューティングモード == 0)
				WORK_2P_0008_Y座標 = BASE_LINE;
		} else {
			WORK_2P_1754_xxxx = 1;
		}

		L0041fa();
	}

	p1->0a42_攻撃過程値 = 0;
	
	L007342(p1, p2, 101, 0);
	
	L0015c2(3);
	L0015c2(p1->000a_プレイヤー番号);

	SFSYSINFO_007c_xxxx = 1;
}

SR_ステージX座標更新:
	movem.l	d3/a3-a6,-(sp)
	movea.l	($0018,sp),a5
	movea.l	($001c,sp),a6
	cmpi.w	#$006b,($0006,a5)		;p1X座標が107より大きい？
	bgt	L001e02						;大きいとき分岐
	moveq.l	#$02,d3					;Xスクロール量=2
	cmpi.w	#$00af,(L06f430)		;175以下？
	ble	L001e7e						;175以下の時、0を返して終了
	movea.w	(L06f430),a0
	lea.l	(-$00b0,a0),a0			;176を引く
	moveq.l	#$07,d1
	cmp.l	a0,d1
	bge	L001dfe						;7以上の時分岐
	movea.w	#$006c,a0				;108
	suba.w	($0006,a5),a0			;108-p1X座標
	cmp.l	a0,d1
	blt	L001e34						;7より小さいとき分岐
L001dfe:
	moveq.l	#$01,d3
	bra	L001e34
L001e02:
	cmpi.w	#$007c,($0006,a5)
	ble	L001e7e						;p1X座標が124以下の時、0を返して終了
	moveq.l	#$fe,d3
	cmpi.w	#$0150,(L06f430)
	bgt	L001e7e						;ステージX座標？が336より大きいとき、0を返して終了
	movea.w	#$0150,a0
	suba.w	(L06f430),a0
	moveq.l	#$07,d1
	cmp.l	a0,d1
	bge	L001e32
	movea.w	($0006,a5),a0
	lea.l	(-$0084,a0),a0
	cmp.l	a0,d1
	blt	L001e34
L001e32:
	moveq.l	#$ff,d3
L001e34:
	sub.w	d3,(L06f430)
	pea.l	($0000)
	pea.l	($0000)
	movea.w	d3,a3
	move.l	a3,-(sp)
	pea.l	($0009)				;SHOT_CMD_背景スクロール
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	lea.l	(SR_SHOT実行),a4
	jsr	(a4)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	move.l	a3,-(sp)
	pea.l	($0009)				;SHOT_CMD_背景スクロール
	move.l	a5,-(sp)
	move.l	a6,-(sp)
	jsr	(a4)
	lea.l	($0018,sp),sp
	add.w	d3,($0006,a5)
	add.w	d3,($0006,a6)
	moveq.l	#$01,d0
	bra	L001e80
L001e7e:
	moveq.l	#$00,d0
L001e80:
	movem.l	(sp)+,d3/a3-a6
	rts

L001e86:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	clr.w	($0aca,a3)
	clr.w	($01c8,a3)
	pea.l	($0100)			;IVC_ゾンビ
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	cmpi.w	#$0065,($09e2,a3)
	beq	L001eae
	moveq.l	#$00,d0
	bra	L001eb0
L001eae:
	moveq.l	#$01,d0
L001eb0:
	movea.l	(sp)+,a3
	rts

L001eb4(p1, p2)
{
	if (*--L0690b6 > 0) {
		if (p1->09e2_動作ID != ACT_アイドル || p2->09e2_動作ID != ACT_アイドル) return;
	}

	*L0690b8 = 1;

	p2->0a42_攻撃過程値 = 0;
	p1->0a42_攻撃過程値 = 0;

	L0012c2(48);

	if (p2->002e_残り体力 < p1->002e_残り体力) {
		SYSCALL_0110_Cmd実行_動作(p1, ACT_アイドル, 0);
		SYSCALL_0110_Cmd実行_動作(p2, ACT_待機, 0);

		p1->01cc_敗北状態 = 0;
		p2->01cc_敗北状態 = 1;
		*L0690b4 = 0;
		bra	L001fb8
	} else if (p2->002e_残り体力 > p1->002e_残り体力) {
		*L0690b4 = 0;

		SYSCALL_0110_Cmd実行_動作(p1, ACT_待機, 0);
		SYSCALL_0110_Cmd実行_動作(p2, ACT_アイドル, 0);

		p1->01cc_敗北状態 = 1;
		p2->01cc_敗北状態 = 0;
		*L0690b4 = 0;
	} else {
		SYSCALL_0110_Cmd実行_動作(p1, ACT_アイドル, 0);
		SYSCALL_0110_Cmd実行_動作(p2, ACT_待機, 0);

		p1->01cc_敗北状態 = 0;
		p2->01cc_敗北状態 = 1;
	}

	SYSCALL_00c0_状態設定_永続無敵(p1, IVC_ゾンビ);
	SYSCALL_00c0_状態設定_永続無敵(p2, IVC_ゾンビ);

	p2->09e4_複合動作ID = ACT_アイドル;
	p1->09e4_複合動作ID = ACT_アイドル;
	p2->01c8_xxxx = 0;
	p1->01c8_xxxx = 0;
	*L0690ba = 64;
}

L001ff4:
	.dc.b	'CONTINUE    ',$00,$00
L002002:
	movem.l	d3-d6/a3-a6,-(sp)
	movea.l	($0024,sp),a6
	move.l	($0028,sp),d6
	moveq.l	#$0a,d5
	tst.w	(SFSYSINFO_0066_xxxx)
	bne	L00219e

	L0015ee(104);

	SYSCALL_01e4_Scr設定_表示面(0);

	L01bb5e(128, 128);
	SR_グラフィックパレット反映(128);

	L01bb5e(0, 128);
	SR_グラフィックパレット反映(0);

	SYSCALL_01e4_Scr設定_表示面(3);

L002070:
	while (SR_PCM8ファンクションコール_データ長問い合わせ(3));

	p2->0006_X座標 = 2000;
	SYSCALL_0000_セル設定_表示(p2, CELL_透明);

	L00449c();
	L00449c();

	L01bb5e(128, 128);
	SR_グラフィックパレット反映(128);

	L01bb5e(0, 128);
	SR_グラフィックパレット反映(0);

	XCLIB_sp_off(122, 127);

	SR_BG文字列消去(10, 10, 12);
	SR_BG文字列消去(10, 11, 12);

	SR_MESS_SP表示_固定位置(0);

	SR_BG文字列消去(12, 12, 8);
	SR_BG文字列消去(12, 13, 8);

	SR_BG文字列消去(12, 14, 8);
	SR_BG文字列消去(12, 15, 8);

	if (p1->000a_プレイヤー番号 == 1)
		SR_BG文字列表示(2, 2, "CONTINUE    ", 0x0f00);
	else
		SR_BG文字列表示(19, 2, "CONTINUE    ", 0x0f00);

	bra	L0021dc
L00219e:
	L004c7c(64);

	SR_BG文字列表示(2, 2, "CONTINUE    ", 0x0f00);
	SR_BG文字列表示(19, 2, "CONTINUE    ", 0x0f00);
L0021dc:

	SYSCALL_01f8_Bgm制御_停止();

	L017c60(1);

	moveq.l	#$01,d4
L0021f4:
	pea.l	($0001)
	jsr	(L004c7c)
	addq.w	#4,sp
	subq.w	#1,d4
	bne	L0022c2
	moveq.l	#$38,d4
	subq.w	#1,d5
	moveq.l	#$04,d3
	movea.w	d5,a3
L00220e:
	movea.w	d3,a0
	pea.l	(-$0001,a0)
	move.l	a3,-(sp)
	jsr	(L0023b6)
	addq.w	#8,sp
	pea.l	($0003)
	jsr	(L004c7c)
	addq.w	#4,sp
	subq.w	#1,d3
	tst.w	d3
	bgt	L00220e
	move.w	d5,d0
	ext.l	d0
	moveq.l	#$09,d1
	cmp.l	d1,d0
	bhi	L0022c2
	add.l	d0,d0
	move.w	(L002246,pc,d0.l),d1
	jmp	(L002246,pc,d1.w)

L002246:
	.dc.w	L002290-L002246
	.dc.w	L00228a-L002246
	.dc.w	L002284-L002246
	.dc.w	L00227e-L002246
	.dc.w	L002278-L002246
	.dc.w	L002272-L002246
	.dc.w	L00226c-L002246
	.dc.w	L002266-L002246
	.dc.w	L002260-L002246
	.dc.w	L00225a-L002246
L00225a:
	pea.l	($00d1)
	bra	L0022b6
L002260:
	pea.l	($00d0)
	bra	L0022b6
L002266:
	pea.l	($00cf)
	bra	L0022b6
L00226c:
	pea.l	($00ce)
	bra	L0022b6
L002272:
	pea.l	($00cd)
	bra	L0022b6
L002278:
	pea.l	($00cc)
	bra	L0022b6
L00227e:
	pea.l	($00cb)
	bra	L0022b6
L002284:
	pea.l	($00ca)
	bra	L0022b6
L00228a:
	pea.l	($00c9)
	bra	L0022b6
L002290:
	tst.w	(SFSYSINFO_0066_xxxx)
	bne	L0022b2
	pea.l	($00e6)
	move.l	a6,-(sp)
	jsr	(L017d74)
	addq.w	#8,sp
	move.l	a6,-(sp)
	jsr	(L019eea)
	addq.w	#4,sp
	bra	L0022c2
L0022b2:
	pea.l	($00f8)
L0022b6:
	pea.l	($0003)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
L0022c2:
	d0 = XCLIB_iocs_joyget(p1->000a_プレイヤー番号);

	moveq.l	#$01,d1
	cmp.l	d0,d1
	beq	L002304
	moveq.l	#$02,d1
	cmp.l	d0,d1
	bne	L0022de
	moveq.l	#$02,d4
L0022de:
	tst.w	(SFSYSINFO_0066_xxxx)
	beq	L00230c

	d0 = XCLIB_iocs_joyget(p2->000a_プレイヤー番号);

	moveq.l	#$01,d1
	cmp.l	d0,d1
	beq	L002304
	moveq.l	#$02,d1
	cmp.l	d0,d1
	beq	L00230a
	bra	L00230c
L002304:
	moveq.l	#$01,d0
	bra	L0023b0
L00230a:
	moveq.l	#$02,d4
L00230c:
	tst.w	d5
	bgt	L0021f4

	L004c7c(64);

L00231e:
	while (SR_PCM8ファンクションコール_データ長問い合わせ(p1->000a_プレイヤー番号));

	tst.w	(SFSYSINFO_0066_xxxx)
	bne	L00237c

	jsr	(SR_BG文字消去_9_23行)

	SR_MESS_SP_PCGパターン定義(24, 0, 8);	//GAME OVER
	SR_MESS_SP表示_固定位置(0x0d00);

	SYSCALL_0024_音声再生(3, PCM_GAMEOVER);

	L004c7c(32);

L00237c:
	while (SR_PCM8ファンクションコール_データ長問い合わせ(3));

	L004c7c(80);

	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
	L0025c0();

	moveq.l	#$00,d0
L0023b0:
	movem.l	(sp)+,d3-d6/a3-a6
	rts

L0023b6:
	movem.l	d3-d5/a3,-(sp)
	move.w	($001a,sp),d1
	move.w	($0016,sp),d0
	ext.l	d0
	moveq.l	#$09,d2
	cmp.l	d2,d0
	bhi	L002436
	add.l	d0,d0
	move.w	(L0023d4,pc,d0.l),d2
	jmp	(L0023d4,pc,d2.w)

L0023d4:
	.dc.w	L002430-L0023d4
	.dc.w	L002428-L0023d4
	.dc.w	L002420-L0023d4
	.dc.w	L002418-L0023d4
	.dc.w	L002410-L0023d4
	.dc.w	L002408-L0023d4
	.dc.w	L002400-L0023d4
	.dc.w	L0023f8-L0023d4
	.dc.w	L0023f0-L0023d4
	.dc.w	L0023e8-L0023d4
L0023e8:
	lea.l	(L01fbf6),a3
	bra	L002436
L0023f0:
	lea.l	(L01fc3e),a3
	bra	L002436
L0023f8:
	lea.l	(L01fc86),a3
	bra	L002436
L002400:
	lea.l	(L01fcce),a3
	bra	L002436
L002408:
	lea.l	(L01fd16),a3
	bra	L002436
L002410:
	lea.l	(L01fd5e),a3
	bra	L002436
L002418:
	lea.l	(L01fda6),a3
	bra	L002436
L002420:
	lea.l	(L01fdee),a3
	bra	L002436
L002428:
	lea.l	(L01fe36),a3
	bra	L002436
L002430:
	lea.l	(L01fe7e),a3
L002436:
	tst.w	d1
	bne	L00247a
	moveq.l	#$00,d4
L00243c:
	moveq.l	#$00,d3
	movea.w	d4,a0
	moveq.l	#$0a,d5
	add.l	a0,d5
L002444:
	tst.b	(a3)
	beq	L00244e
	pea.l	($0f07)
	bra	L002452
L00244e:
	pea.l	($0000)
L002452:
	move.l	d5,-(sp)
	movea.w	d3,a0
	pea.l	($000d,a0)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,a3
	addq.w	#1,d3
	cmp.w	#$0005,d3
	ble	L002444
	addq.w	#1,d4
	cmp.w	#$000b,d4
	ble	L00243c
	bra	L0025b0
L00247a:
	cmp.w	#$0001,d1
	bne	L002522
	moveq.l	#$00,d4
L002484:
	tst.b	(a3)
	beq	L00248e
	pea.l	($0f07)
	bra	L002492
L00248e:
	pea.l	($0000)
L002492:
	movea.w	d4,a0
	pea.l	($000d,a0)
	pea.l	($000e)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#2,a3
	tst.b	(a3)
	beq	L0024b2
	pea.l	($0f07)
	bra	L0024b6
L0024b2:
	pea.l	($0000)
L0024b6:
	movea.w	d4,a0
	pea.l	($000d,a0)
	pea.l	($000f)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,a3
	tst.b	(a3)
	beq	L0024d6
	pea.l	($0f07)
	bra	L0024da
L0024d6:
	pea.l	($0000)
L0024da:
	movea.w	d4,a0
	pea.l	($000d,a0)
	pea.l	($0010)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#2,a3
	tst.b	(a3)
	beq	L0024fa
	pea.l	($0f07)
	bra	L0024fe
L0024fa:
	pea.l	($0000)
L0024fe:
	movea.w	d4,a0
	pea.l	($000d,a0)
	pea.l	($0011)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,a3
	addq.w	#1,d4
	cmp.w	#$0005,d4
	ble	L002484
	bra	L0025b0
L002522:
	cmp.w	#$0002,d1
	bne	L002580
	addq.w	#6,a3
	moveq.l	#$00,d4
L00252c:
	addq.w	#1,a3
	tst.b	(a3)
	beq	L002538
	pea.l	($0f07)
	bra	L00253c
L002538:
	pea.l	($0000)
L00253c:
	movea.w	d4,a0
	pea.l	($000f,a0)
	pea.l	($000f)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#3,a3
	tst.b	(a3)
	beq	L00255c
	pea.l	($0f07)
	bra	L002560
L00255c:
	pea.l	($0000)
L002560:
	movea.w	d4,a0
	pea.l	($000f,a0)
	pea.l	($0010)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#2,a3
	addq.w	#1,d4
	cmp.w	#$0003,d4
	ble	L00252c
	bra	L0025b0
L002580:
	moveq.l	#$00,d4
L002582:
	moveq.l	#$00,d3
	movea.w	d4,a0
	moveq.l	#$0a,d5
	add.l	a0,d5
L00258a:
	pea.l	($0000)
	move.l	d5,-(sp)
	movea.w	d3,a0
	pea.l	($000d,a0)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,d3
	cmp.w	#$0005,d3
	ble	L00258a
	addq.w	#1,d4
	cmp.w	#$000b,d4
	ble	L002582
L0025b0:
	movem.l	(sp)+,d3-d5/a3
	rts

L0025b6:
	.dc.b	'STAGE.CNF',$00
L0025c0:
	link	a6,#-$0100
	movem.l	d3-d4/a3,-(sp)
	moveq.l	#$01,d3
	move.l	a6,d4
	add.l	#$ffffff00,d4
L0025d2:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(L009138)
	addq.w	#4,sp
	movea.l	d0,a0
	cmpa.w	#$0000,a0
	beq	L002620
	move.w	#$ffff,($0050,a0)
	move.w	#$ffff,($0052,a0)
	move.l	a3,-(sp)
	jsr	(L008aea)
	addq.w	#4,sp
	tst.w	d0
	beq	L002620
	move.l	d4,-(sp)
	pea.l	(L0025b6)
	move.l	a3,-(sp)
	jsr	(SR_ステージデータファイルパス構築)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(L002668)
	addq.w	#8,sp
L002620:
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L0025d2
	movem.l	(-$010c,a6),d3-d4/a3
	unlk	a6
	rts

L002632:
	.dc.b	'r',$00
L002634:
	.dc.b	'%s がありません',$00
L002644:
	.dc.b	'(LOAD_STAGE_CNF)',$00,$00
L002656:
	.dc.b	'RASTER',$00,$00
L00265e:
	addq.w	#8,d1
	subq.w	#1,(a3)
	subq.w	#7,a1
	link	a4,#$0000
L002668:
	link	a6,#-$0180
	movem.l	d3-d4/a3-a5,-(sp)
	move.l	($0008,a6),d3
	movea.w	($000e,a6),a1
	move.l	a1,-(sp)
	jsr	(L009138)
	addq.w	#4,sp
	movea.l	d0,a5
	cmpa.w	#$0000,a5
	beq	L002838
	pea.l	(L002632)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L0026cc
	move.l	d3,-(sp)
	pea.l	(L002634)
	move.l	a6,d3
	add.l	#$fffffe80,d3
	move.l	d3,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($000c,sp),sp
	pea.l	(L002644)
	move.l	d3,-(sp)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L0026cc:
	move.l	d4,-(sp)
	pea.l	($0020)
	moveq.l	#$30,d3
	add.l	a5,d3
	move.l	d3,-(sp)
	lea.l	(XCLIB_fgets),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	clr.b	($2f,a5,d0.l)
	move.l	d4,-(sp)
	pea.l	($0020)
	moveq.l	#$80,d3
	add.l	a6,d3
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	lea.l	(L01daac),a4
	jsr	(a4)
	addq.w	#4,sp
	move.w	d0,($0050,a5)
	move.l	d4,-(sp)
	pea.l	($0020)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	move.w	d0,($0052,a5)
	move.l	d4,-(sp)
	pea.l	($0020)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	move.w	d0,($0054,a5)
	move.l	d4,-(sp)
	pea.l	($0020)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	move.w	d0,($0056,a5)
	move.l	d4,-(sp)
	pea.l	($0020)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	move.w	d0,($0058,a5)
	move.w	#$0001,($005a,a5)
	move.w	#$0240,($005c,a5)
L002780:
	lea.l	(-$0080,a6),a3
	clr.b	(a3)
	move.l	d4,-(sp)
	pea.l	($0080)
	move.l	a3,-(sp)
	jsr	(XCLIB_fgets)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	tst.l	d0
	beq	L002830
	cmpi.b	#$3d,(a3)
	beq	L0027b6
L0027ae:
	addq.w	#1,a3
	cmpi.b	#$3d,(a3)
	bne	L0027ae
L0027b6:
	clr.b	(a3)+
	movea.l	a3,a0
	cmpi.b	#$09,(a0)
	beq	L0027ce
L0027c0:
	cmpi.b	#$0a,(a0)
	beq	L0027ce
	addq.w	#1,a0
	cmpi.b	#$09,(a0)
	bne	L0027c0
L0027ce:
	clr.b	(a0)
	pea.l	(L002656)
	pea.l	(-$0080,a6)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002806
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L0027f6
	cmp.b	#$31,d0
	beq	L0027fc
	bra	L002780
L0027f6:
	clr.w	($005a,a5)
	bra	L002780
L0027fc:
	move.w	#$0001,($005a,a5)
	bra	L002780
L002806:
	pea.l	(L00265e)
	pea.l	(-$0080,a6)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002780
	move.l	a3,-(sp)
	jsr	(L01daac)
	addq.w	#4,sp
	move.w	d0,($005c,a5)
	bra	L002780
L002830:
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
L002838:
	movem.l	(-$0194,a6),d3-d4/a3-a5
	unlk	a6
	rts

L002842:
	.dc.b	'SFXVI.INI',$00
L00284c:
	.dc.b	'Error:SFXVI.INI がありません',$0a,$00
L00286a:
	.dc.b	'CHAR_PATH',$00
L002874:
	.dc.b	'STAGE_PATH',$00,$00
L002880:
	.dc.b	'LOG_PATH',$00,$00
L00288a:
	.dc.b	'PCM_COUNT',$00
L002894:
	.dc.b	'SC_BOOT',$00
L00289c:
	.dc.b	'SC_OPEN',$00
L0028a4:
	.dc.b	'SC_SELECT',$00
L0028ae:
	subq.w	#1,d3
	subq.w	#7,(a6)
	subq.b	#1,d0
L0028b4:
	link	a6,#-$0100
	movem.l	d3-d4/a3,-(sp)
	pea.l	(L002632)			;'r'
	pea.l	(L002842)			;'SFXVI.INI'
	jsr	(XCLIB_fopen)				;XCLIB_fopen("SFXVI.INI", "r");
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L0028ee
	pea.l	(L00284c)
	jsr	(XCLIB_iocs_b_print)	;XCLIB_iocs_b_print("Error:SFXVI.INI がありません");
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(XCLIB_dos_exit2)		;XCLIB_dos_exit2(1);
	addq.w	#4,sp
L0028ee:
	move.l	a6,d3
	add.l	#$ffffff00,d3
L0028f6:
	lea.l	(-$0100,a6),a3
	clr.b	(a3)
	move.l	d4,-(sp)
	pea.l	($00ff)
	move.l	a3,-(sp)
	jsr	(XCLIB_fgets)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	tst.l	d0
	beq	L002aa4
	cmpi.b	#$23,(a3)
	beq	L0028f6
	cmpi.b	#$3d,(a3)
	beq	L002932
L00292a:
	addq.w	#1,a3
	cmpi.b	#$3d,(a3)
	bne	L00292a
L002932:
	clr.b	(a3)+
	movea.l	a3,a0
	cmpi.b	#$09,(a0)
	beq	L00294a
L00293c:
	cmpi.b	#$0a,(a0)
	beq	L00294a
	addq.w	#1,a0
	cmpi.b	#$09,(a0)
	bne	L00293c
L00294a:
	clr.b	(a0)
	pea.l	(L00286a)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L00296c
	move.l	a3,-(sp)
	pea.l	(SFSYSINFO_0488_キャラクタディレクトリパス)
	bra	L002a98
L00296c:
	pea.l	(L002874)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L00298c
	move.l	a3,-(sp)
	pea.l	(SFSYSINFO_0588_ステージディレクトリパス)
	bra	L002a98
L00298c:
	pea.l	(L002880)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L0029ac
	move.l	a3,-(sp)
	pea.l	(SFSYSINFO_0688_xxxディレクトリパス)
	bra	L002a98
L0029ac:
	pea.l	(L00288a)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L0029de
	cmpi.b	#$38,(a3)
	bne	L0029d2
	move.w	#$0008,(SFSYSINFO_0004_PCMチャンネル数)
	bra	L0028f6
L0029d2:
	move.w	#$0010,(SFSYSINFO_0004_PCMチャンネル数)
	bra	L0028f6
L0029de:
	pea.l	(L002894)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002a0e
	cmpi.b	#$31,(a3)
	bne	L002a00
	move.w	#$0001,(L068e90)
L002a00:
	pea.l	($0002,a3)
	pea.l	(L068ea0)
	bra	L002a98
L002a0e:
	pea.l	(L00289c)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002a3c
	cmpi.b	#$31,(a3)
	bne	L002a30
	move.w	#$0001,(L068e92)
L002a30:
	pea.l	($0002,a3)
	pea.l	(L068f20)
	bra	L002a98
L002a3c:
	pea.l	(L0028a4)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002a6a
	cmpi.b	#$31,(a3)
	bne	L002a5e
	move.w	#$0001,(L068e94)
L002a5e:
	pea.l	($0002,a3)
	pea.l	(L068fa0)
	bra	L002a98
L002a6a:
	pea.l	(L0028ae)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L0028f6
	cmpi.b	#$31,(a3)
	bne	L002a8e
	move.w	#$0001,(L068e96)
L002a8e:
	pea.l	($0002,a3)
	pea.l	(L069020)
L002a98:
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	bra	L0028f6
L002aa4:
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	movem.l	(-$010c,a6),d3-d4/a3
	unlk	a6
	rts

L002ab6:
	move.l	d3,-(sp)
	move.w	($000a,sp),d3
	movea.l	($000c,sp),a1
	moveq.l	#$00,d2
	move.w	d3,d0
	ext.l	d0
	move.l	d0,d1
	asl.l	#7,d1
	add.l	#L068ea0,d1
	lea.l	(L068e90),a0
	add.l	d0,d0
	cmpi.w	#$0001,(a0,d0.l)
	bne	L002b00
	cmp.w	#$0001,d3
	beq	L002aec
	cmp.w	#$0003,d3
	bne	L002b00
L002aec:
	move.w	d3,d0
	ext.l	d0
	lea.l	(L068e98),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d2
	addq.w	#1,(a0,d0.l)
L002b00:
	movea.l	d1,a0
	tst.w	d2
	ble	L002b3c
	move.w	d3,d0
	ext.l	d0
	move.l	d0,d3
	asl.l	#7,d3
	lea.l	(L068e98),a2
	add.l	d0,d0
L002b16:
	cmpi.b	#$2c,(a0)
	beq	L002b30
	tst.b	(a0)
	bne	L002b36
	move.l	d3,d1
	add.l	#L068ea0,d1
	move.w	#$0001,(a2,d0.l)
	bra	L002b3c
L002b30:
	move.l	a0,d1
	addq.l	#1,d1
	subq.w	#1,d2
L002b36:
	addq.w	#1,a0
	tst.w	d2
	bgt	L002b16
L002b3c:
	movea.l	d1,a0
	cmpi.b	#$2c,(a0)
	beq	L002b50
L002b44:
	tst.b	(a0)
	beq	L002b50
	move.b	(a0)+,(a1)+
	cmpi.b	#$2c,(a0)
	bne	L002b44
L002b50:
	clr.b	(a1)
	move.l	(sp)+,d3
	rts

L002b56:
	.dc.b	'SFXVI.CNF',$00
L002b60:
	.dc.b	'(LOAD_SFXVI_CNF)',$00,$00
L002b72:
	.dc.b	'SFXVI.CNF がありません',$00,$00
L002b8a:
	.dc.b	'LEVEL',$00
L002b90:
	.dc.b	'SCREEN',$00,$00
L002b98:
	.dc.b	'SPEED',$00
L002b9e:
	.dc.b	'SUPER',$00
L002ba4:
	.dc.b	'SHOOT',$00
L002baa:
	.dc.b	'FAINTING',$00,$00
L002bb4:
	.dc.b	'LOOP',$00,$00
L002bba:
	.dc.b	'TRANSFORM',$00
L002bc4:
	.dc.b	'DAMAGE1',$00
L002bcc:
	.dc.b	'DAMAGE2',$00
L002bd4:
	.dc.b	'LIMIT',$00
L002bda:
	.dc.b	'PASS',$00,$00
L002be0:
	.dc.b	'DRUM',$00,$00
L002be6:
	.dc.b	'MIDI',$00,$00
L002bec:
	.dc.b	'DEMO',$00,$00
L002bf2:
	link	a6,#-$0080
	movem.l	d3-d4/a3,-(sp)
	pea.l	(L002632)
	pea.l	(L002b56)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L002c26
	pea.l	(L002b60)
	pea.l	(L002b72)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L002c26:
	moveq.l	#$80,d3
	add.l	a6,d3
L002c2a:
	lea.l	(-$0080,a6),a3
	clr.b	(a3)
	move.l	d4,-(sp)
	pea.l	($0080)
	move.l	a3,-(sp)
	jsr	(XCLIB_fgets)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	tst.l	d0
	beq	L003098
	cmpi.b	#$3d,(a3)
	beq	L002c60
L002c58:
	addq.w	#1,a3
	cmpi.b	#$3d,(a3)
	bne	L002c58
L002c60:
	clr.b	(a3)+
	pea.l	(L002b8a)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002cae
	move.b	(a3),d0
	cmp.b	#$31,d0
	beq	L002c98
	bgt	L002c88
	cmp.b	#$30,d0
	beq	L002c90
	bra	L002c2a
L002c88:
	cmp.b	#$32,d0
	beq	L002ca2
	bra	L002c2a
L002c90:
	clr.w	(SFSYSINFO_0008_Cpu思考レベル)
	bra	L002c2a
L002c98:
	move.w	#$0001,(SFSYSINFO_0008_Cpu思考レベル)
	bra	L002c2a
L002ca2:
	move.w	#$0002,(SFSYSINFO_0008_Cpu思考レベル)
	bra	L002c2a
L002cae:
	pea.l	(L002b90)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002cfe
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002cd2
	cmp.b	#$31,d0
	beq	L002ce0
	bra	L002cf0
L002cd2:
	clr.w	(SFSYSINFO_002e_スクリーン周波数)
	clr.w	(画面周波数)
	bra	L002cf0
L002ce0:
	move.w	#$0001,(SFSYSINFO_002e_スクリーン周波数)
	move.w	#$0001,(画面周波数)
L002cf0:
	move.w	(SFSYSINFO_002e_スクリーン周波数),(画面周波数)
	bra	L002c2a
L002cfe:
	pea.l	(L002b98)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002d72
	move.b	(a3),d0
	ext.w	d0
	movea.w	d0,a0
	moveq.l	#$d0,d0
	add.l	a0,d0
	moveq.l	#$04,d1
	cmp.l	d1,d0
	bhi	L002c2a
	add.l	d0,d0
	move.w	(L002d2e,pc,d0.l),d1
	jmp	(L002d2e,pc,d1.w)

L002d2e:
	.dc.w	L002d38-L002d2e
	.dc.w	L002d42-L002d2e
	.dc.w	L002d4e-L002d2e
	.dc.w	L002d5a-L002d2e
	.dc.w	L002d66-L002d2e
L002d38:
	clr.w	(SFSYSINFO_000c_ゲームスピード)
	bra	L002c2a
L002d42:
	move.w	#$0001,(SFSYSINFO_000c_ゲームスピード)
	bra	L002c2a
L002d4e:
	move.w	#$0002,(SFSYSINFO_000c_ゲームスピード)
	bra	L002c2a
L002d5a:
	move.w	#$0003,(SFSYSINFO_000c_ゲームスピード)
	bra	L002c2a
L002d66:
	move.w	#$0004,(SFSYSINFO_000c_ゲームスピード)
	bra	L002c2a
L002d72:
	pea.l	(L002b9e)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002dae
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002d98
	cmp.b	#$31,d0
	beq	L002da2
	bra	L002c2a
L002d98:
	clr.w	(SFSYSINFO_003e_スーパーコンボ無限)
	bra	L002c2a
L002da2:
	move.w	#$0001,(SFSYSINFO_003e_スーパーコンボ無限)
	bra	L002c2a
L002dae:
	pea.l	(L002ba4)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002dea
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002dd4
	cmp.b	#$31,d0
	beq	L002de0
	bra	L002c2a
L002dd4:
	move.w	#$0001,(SFSYSINFO_0032_飛び道具無限)
	bra	L002c2a
L002de0:
	clr.w	(SFSYSINFO_0032_飛び道具無限)
	bra	L002c2a
L002dea:
	pea.l	(L002baa)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002e26
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002e10
	cmp.b	#$31,d0
	beq	L002e1c
	bra	L002c2a
L002e10:
	move.w	#$0001,(SFSYSINFO_0034_気絶有効)
	bra	L002c2a
L002e1c:
	clr.w	(SFSYSINFO_0034_気絶有効)
	bra	L002c2a
L002e26:
	pea.l	(L002bb4)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002e62
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002e4c
	cmp.b	#$31,d0
	beq	L002e56
	bra	L002c2a
L002e4c:
	clr.w	(SFSYSINFO_0036_ステージループ有効)
	bra	L002c2a
L002e56:
	move.w	#$0001,(SFSYSINFO_0036_ステージループ有効)
	bra	L002c2a
L002e62:
	pea.l	(L002bba)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002e9e
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002e88
	cmp.b	#$31,d0
	beq	L002e94
	bra	L002c2a
L002e88:
	move.w	#$0001,(SFSYSINFO_0040_変身有効)
	bra	L002c2a
L002e94:
	clr.w	(SFSYSINFO_0040_変身有効)
	bra	L002c2a
L002e9e:
	pea.l	(L002bc4)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002f04
	move.b	(a3),d0
	ext.w	d0
	movea.w	d0,a0
	moveq.l	#$d0,d0
	add.l	a0,d0
	moveq.l	#$03,d1
	cmp.l	d1,d0
	bhi	L002c2a
	add.l	d0,d0
	move.w	(L002ece,pc,d0.l),d1
	jmp	(L002ece,pc,d1.w)

L002ece:
	.dc.w	L002ed6-L002ece
	.dc.w	L002ee0-L002ece
	.dc.w	L002eec-L002ece
	.dc.w	L002ef8-L002ece
L002ed6:
	clr.w	(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L002c2a
L002ee0:
	move.w	#$0001,(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L002c2a
L002eec:
	move.w	#$0002,(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L002c2a
L002ef8:
	move.w	#$0003,(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L002c2a
L002f04:
	pea.l	(L002bcc)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002f6a
	move.b	(a3),d0
	ext.w	d0
	movea.w	d0,a0
	moveq.l	#$d0,d0
	add.l	a0,d0
	moveq.l	#$03,d1
	cmp.l	d1,d0
	bhi	L002c2a
	add.l	d0,d0
	move.w	(L002f34,pc,d0.l),d1
	jmp	(L002f34,pc,d1.w)

L002f34:
	.dc.w	L002f3c-L002f34
	.dc.w	L002f46-L002f34
	.dc.w	L002f52-L002f34
	.dc.w	L002f5e-L002f34
L002f3c:
	clr.w	(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L002c2a
L002f46:
	move.w	#$0001,(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L002c2a
L002f52:
	move.w	#$0002,(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L002c2a
L002f5e:
	move.w	#$0003,(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L002c2a
L002f6a:
	pea.l	(L002bd4)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002fa6
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002f90
	cmp.b	#$31,d0
	beq	L002f9a
	bra	L002c2a
L002f90:
	clr.w	(SFSYSINFO_000a_タイムリミット有効)
	bra	L002c2a
L002f9a:
	move.w	#$0001,(SFSYSINFO_000a_タイムリミット有効)
	bra	L002c2a
L002fa6:
	pea.l	(L002bda)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002fe2
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L002fcc
	cmp.b	#$31,d0
	beq	L002fd8
	bra	L002c2a
L002fcc:
	move.w	#$0001,(SFSYSINFO_0046_時間経過有効)
	bra	L002c2a
L002fd8:
	clr.w	(SFSYSINFO_0046_時間経過有効)
	bra	L002c2a
L002fe2:
	pea.l	(L002be0)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L00301e
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L003008
	cmp.b	#$31,d0
	beq	L003014
	bra	L002c2a
L003008:
	move.w	#$0001,(SFSYSINFO_0002_PCMドラム有効)
	bra	L002c2a
L003014:
	clr.w	(SFSYSINFO_0002_PCMドラム有効)
	bra	L002c2a
L00301e:
	pea.l	(L002be6)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L00305a
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L003044
	cmp.b	#$31,d0
	beq	L003050
	bra	L002c2a
L003044:
	move.w	#$0001,(SFSYSINFO_003c_MIDIサウンド有効)
	bra	L002c2a
L003050:
	clr.w	(SFSYSINFO_003c_MIDIサウンド有効)
	bra	L002c2a
L00305a:
	pea.l	(L002bec)
	move.l	d3,-(sp)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L002c2a
	move.b	(a3),d0
	cmp.b	#$30,d0
	beq	L003082
	cmp.b	#$31,d0
	beq	L00308c
	bra	L002c2a
L003082:
	clr.w	(SFSYSINFO_0020_xxxx)
	bra	L002c2a
L00308c:
	move.w	#$0001,(SFSYSINFO_0020_xxxx)
	bra	L002c2a
L003098:
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	movem.l	(-$008c,a6),d3-d4/a3
	unlk	a6
	rts

L0030aa:
	.dc.b	$77,$00
L0030ac:
	.dc.b	'(SAVE_SFXVI_CNF)',$00,$00
L0030be:
	.dc.b	'SFXVI.CNF が作成できません',$00,$00
L0030da:
	.dc.b	'LEVEL=%d',$09,$09,'ＣＰＵの難易度（0:容易,1:普通,2:難関）',$0a
	.dc.b	$00,$00,$00
L00310e:
	.dc.b	'SCREEN=%d',$09,'ＣＲＴ水平周波数（0:１５ＫＨｚ,1:３１ＫＨｚ'
	.dc.b	'）',$0a,$00,$00
L003148:
	.dc.b	'SPEED=%d',$09,$09,'動作速度（0:普通,1:微高速,2:高速,3:超高速'
	.dc.b	',4:最高速）',$0a,$00,$00,$00
L00318a:
	.dc.b	'SUPER=%d',$09,$09,'超技の回数制限（0:有り,1:無し）',$0a,$00
	.dc.b	$00
L0031b6:
	.dc.b	'SHOOT=%d',$09,$09,'飛び道具の回数制限（0:有り,1:無し）',$0a
	.dc.b	$00,$00
L0031e6:
	.dc.b	'FAINTING=%d',$09,'気絶（0:有り,1:無し）',$0a,$00,$00
L00320a:
	.dc.b	'LOOP=%d',$09,$09,'ステージの繰り返し（0:しない,1:する）',$0a
	.dc.b	$00,$00,$00
L00323c:
	.dc.b	'TRANSFORM=%d',$09,'変身（0:有り,1:無し）',$0a,$00,$00,$00
L003262:
	.dc.b	'DAMAGE1=%d',$09,'１Ｐのダメージ度（0:普通,1:半分,2:２倍,3:無'
	.dc.b	'し）',$0a,$00,$00,$00
L0032a0:
	.dc.b	'DAMAGE2=%d',$09,'２Ｐのダメージ度（0:普通,1:半分,2:２倍,3:無'
	.dc.b	'し）',$0a,$00,$00,$00
L0032de:
	.dc.b	'LIMIT=%d',$09,$09,'時間の制限（0:有り,1:無し）',$0a,$00,$00
L003306:
	.dc.b	'PASS=%d',$09,$09,'風景の変化（0:有り,1:無し）',$0a,$00,$00,$00
L00332e:
	.dc.b	'DRUM=%d',$09,$09,'内蔵ドラム音（0:有り,1:無し）',$0a,$00,$00
	.dc.b	$00
L003358:
	.dc.b	'MIDI=%d',$09,$09,'ＭＩＤＩへの出力（0:有り,1:無し）',$0a,$00
	.dc.b	$00,$00
L003386:
	.dc.b	'DEMO=%d',$09,$09,'タイトル画面でデモを自動選択（0:しない,1:'
	.dc.b	'する）',$0a,$00,$00,$00
L0033c2:
	link	a6,#-$0080
	movem.l	d3-d4/a3-a5,-(sp)
	pea.l	(L0030aa)
	pea.l	(L002b56)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L0033f6
	pea.l	(L0030ac)
	pea.l	(L0030be)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L0033f6:
	lea.l	(SFSYSINFO_0008_Cpu思考レベル),a3
	movea.w	(a3),a0
	move.l	a0,-(sp)
	pea.l	(L0030da)
	moveq.l	#$80,d3
	add.l	a6,d3
	move.l	d3,-(sp)
	lea.l	(XCLIB_sprintf),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	lea.l	(L01dc12),a5
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0026,a3),a0
	move.l	a0,-(sp)
	pea.l	(L00310e)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0004,a3),a0
	move.l	a0,-(sp)
	pea.l	(L003148)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0036,a3),a0
	move.l	a0,-(sp)
	pea.l	(L00318a)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	($002a,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L0031b6)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	($002c,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L0031e6)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($002e,a3),a0
	move.l	a0,-(sp)
	pea.l	(L00320a)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	($0038,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L00323c)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0030,a3),a0
	move.l	a0,-(sp)
	pea.l	(L003262)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($003a,a3),a0
	move.l	a0,-(sp)
	pea.l	(L0032a0)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0002,a3),a0
	move.l	a0,-(sp)
	pea.l	(L0032de)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	($003e,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L003306)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	(-$0006,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L00332e)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.w	($0034,a3),d0
	eori.w	#$0001,d0
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L003358)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($0018,a3),a0
	move.l	a0,-(sp)
	pea.l	(L003386)
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	pea.l	($0018)
	jsr	(SR_VDISP回数指定待機)
	movem.l	(-$0094,a6),d3-d4/a3-a5
	unlk	a6
	rts

L0035f0:
	.dc.b	$2d,$66,$00,$00
L0035f4:
	.dc.b	$2d,$46,$00,$00
L0035f8:
	.dc.b	'B:/CHAR/',$00,$00
L003602:
	.dc.b	'B:/STAGE/',$00
L00360c:
	.dc.b	$2d,$6d,$00,$00
L003610:
	.dc.b	$2d,$4d,$00,$00
L003614:
	.dc.b	$2d,$6c,$00,$00
L003618:
	move.l	a4,($0000.w,a6)
L00361c:
	movem.l	a3-a4,-(sp)
	movea.l	($000c,sp),a3
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L0035f0)
	lea.l	(L01dc3c),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	beq	L003656
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L0035f4)
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L003680
L003656:
	pea.l	(L0035f8)
	pea.l	(SFSYSINFO_0488_キャラクタディレクトリパス)
	lea.l	(XCLIB_strcpy),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L003602)
	pea.l	(SFSYSINFO_0588_ステージディレクトリパス)
	jsr	(a3)
	addq.w	#8,sp
	bra	L00370c
L003680:
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L00360c)
	lea.l	(L01dc3c),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	beq	L0036b2
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L003610)
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L0036ca
L0036b2:
	pea.l	($0002,a3)
	jsr	(L01daac)
	addq.w	#4,sp
	moveq.l	#$0a,d1
	asl.l	d1,d0
	move.l	d0,(L0690a0)
	bra	L00370c
L0036ca:
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L003614)
	lea.l	(L01dc3c),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	beq	L0036fc
	pea.l	($0002)
	move.l	a3,-(sp)
	pea.l	(L003618)
	jsr	(a4)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L00370c
L0036fc:
	move.b	($0002,a3),d0
	ext.w	d0
	add.w	#$ffd0,d0
	move.w	d0,(L0690a4)
L00370c:
	movem.l	(sp)+,a3-a4
	rts

L003712:
	.dc.b	$0a,$00
L003714:
	.dc.b	'┏━━━  デモンストレーションの結果  ━━━┓',$0a,$00
L003744:
	.dc.b	'┠─── 名前 ───┬──── 勝率 ────┨',$0a,$00
L003774:
	.dc.b	'┠─────────┼───────────┨',$0a,$00
L0037a4:
	.dc.b	'%3d %% [%3d/%3d]',$00,$00
L0037b6:
	.dc.b	'  0 %% [%3d/%3d]',$00,$00
L0037c8:
	.dc.b	'--- % [---/---]',$00
L0037d8:
	.dc.b	'┃  %2D. %-8S    │   %s    ┃',$0a,$00,$00,$00
L0037fa:
	.dc.b	'┗━━━━━━━━━┷━━━━━━━━━━━┛',$0a,$00
L00382a:
	.dc.b	'-----------------------------------------------------------'
	.dc.b	'-',$0a,$00
L003868:
	.dc.b	'Log off ->  DATE %d/%d/%d  TIME %d:%d:%d',$0a,$00,$00,$00
L003894:
	link	a6,#-$00e0
	movem.l	d3-d5/a3-a4,-(sp)
	jsr	(SYSCALL_0200_Bgm制御_フェードアウト)
	pea.l	($0001)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	jsr	(SR_ラスター割込み設定解除)
	jsr	(SR_タイマーD割込み解除)
	pea.l	($0064)
	pea.l	(WORK_3P_0000)
	lea.l	(L014860),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($000a)
	lea.l	(L014804),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($000b)
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0001)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	jsr	(L01bd26)
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	pea.l	($0001)
	pea.l	($001f)
	pea.l	($0000)
	jsr	(L01dc64)
	lea.l	($000c,sp),sp
	pea.l	($0001)
	pea.l	($0001)
	pea.l	($0000)
	pea.l	($0002)
	jsr	(L01dd0c)
	lea.l	($0010,sp),sp
	jsr	(XCLIB_iocs_os_curon)
	jsr	(XCLIB_iocs_b_curon)
	pea.l	($0000)
	jsr	(L01ddfe)
	addq.w	#4,sp
	jsr	(SR_画面フェードイン)
	tst.w	(SFSYSINFO_0048_場面_デモ)
	bne	L0039a2
	moveq.l	#$01,d3
L003984:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(L00903a)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(L009078)
	addq.w	#4,sp
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L003984
L0039a2:
	pea.l	(L003712)
	pea.l	($0001)
	lea.l	(L005bb0),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L003714)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L003744)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L003774)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	moveq.l	#$01,d3
	moveq.l	#$e0,d4
	add.l	a6,d4
	moveq.l	#$a0,d5
	add.l	a6,d5
L0039ea:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(L008aea)
	addq.w	#4,sp
	tst.w	d0
	beq	L003ac6
	move.l	a3,-(sp)
	lea.l	(SR_キャラ勝利数カウント取得),a4
	jsr	(a4)
	addq.w	#4,sp
	tst.w	d0
	ble	L003a46
	move.l	a3,-(sp)
	jsr	(SR_キャラ試合数カウント取得)
	addq.w	#4,sp
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_キャラ勝率計算)
	addq.w	#4,sp
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L0037a4)
	move.l	d4,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($0014,sp),sp
	bra	L003a94
L003a46:
	movea.w	d3,a3
	move.l	a3,-(sp)
	lea.l	(SR_キャラ試合数カウント取得),a4
	jsr	(a4)
	addq.w	#4,sp
	tst.w	d0
	ble	L003a84
	move.l	a3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_キャラ勝利数カウント取得)
	addq.w	#4,sp
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(L0037b6)
	move.l	d4,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($0010,sp),sp
	bra	L003a94
L003a84:
	pea.l	(L0037c8)
	move.l	d4,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
L003a94:
	move.l	d4,-(sp)
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	pea.l	(L0037d8)
	move.l	d5,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($0014,sp),sp
	move.l	d5,-(sp)
	pea.l	($0001)
	jsr	(L005bb0)
	addq.w	#8,sp
L003ac6:
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L0039ea
	pea.l	(L0037fa)
	pea.l	($0001)
	lea.l	(L005bb0),a3
	jsr	(a3)
	addq.w	#8,sp
	jsr	(XCLIB_dos_getdate)
	move.l	d0,d3
	jsr	(XCLIB_dos_gettime)
	move.l	d0,d4
	pea.l	(L00382a)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	moveq.l	#$1f,d1
	and.l	d4,d1
	move.l	d1,-(sp)
	move.l	d4,d0
	and.l	#$000007e0,d0
	asr.l	#5,d0
	move.l	d0,-(sp)
	and.l	#$0000f800,d4
	moveq.l	#$0b,d1
	asr.l	d1,d4
	move.l	d4,-(sp)
	moveq.l	#$1f,d1
	and.l	d3,d1
	move.l	d1,-(sp)
	move.l	d3,d0
	and.l	#$000001e0,d0
	asr.l	#5,d0
	move.l	d0,-(sp)
	and.l	#$0000fe00,d3
	moveq.l	#$09,d1
	asr.l	d1,d3
	movea.l	d3,a0
	pea.l	($07bc,a0)
	pea.l	(L003868)
	move.l	a6,d3
	add.l	#$ffffff20,d3
	move.l	d3,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($0020,sp),sp
	move.l	d3,-(sp)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L00382a)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0000)
	jsr	(L019930)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(XCLIB_dos_exit2)
	movem.l	(-$00f4,a6),d3-d5/a3-a4
	unlk	a6
	rts

L003b94:
	.dc.b	'Error：',$00
L003b9c:
	.dc.b	$81,$5e,$00,$00
L003ba0:
	.dc.b	'エラー',$00,$00
L003ba8:
	.dc.b	'- Hit ESC key -',$00
SYSCALL_0264_システム異常終了:
	movem.l	d3-d4/a3-a5,-(sp)
	move.l	($0018,sp),d3
	move.l	($001c,sp),d4
	pea.l	(L003b94)
	pea.l	($0001)
	lea.l	(L005bb0),a3
	jsr	(a3)
	addq.w	#8,sp
	move.l	d3,-(sp)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L003b9c)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	move.l	d4,-(sp)
	pea.l	($0001)
	jsr	(a3)
	addq.w	#8,sp
	jsr	(SYSCALL_0200_Bgm制御_フェードアウト)
	jsr	(SR_ラスター割込み設定解除)
	jsr	(SR_画面フェードイン)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	lea.l	(SYSCALL_0228_Scr設定_余白),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0001)
	pea.l	($0001)
	lea.l	(SYSCALL_01e8_Scr設定_ＢＧマスク),a4
	jsr	(a4)
	addq.w	#8,sp
	pea.l	($007f)
	pea.l	($0000)
	jsr	(XCLIB_sp_off)
	addq.w	#8,sp
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	lea.l	(SYSCALL_02a8_Scr設定_ＢＧ表示),a5
	jsr	(a5)
	addq.w	#4,sp
	pea.l	($0404)
	jsr	(SYSCALL_01dc_Scr設定_画面モード)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(a4)
	addq.w	#8,sp
	pea.l	($0001)
	jsr	(a5)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0001)
	lea.l	(XCLIB_iocs_home),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0002)
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($01ff)
	pea.l	($01ff)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(XCLIB_iocs_window)
	lea.l	($0010,sp),sp
	movea.l	#$00c00000,a0
	move.w	#$01ff,d1
L003ce8:
	moveq.l	#$1f,d0
L003cea:
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	move.l	#$60066006,(a0)+
	subq.w	#1,d0
	bpl	L003cea
	subq.w	#1,d1
	bpl	L003ce8
	pea.l	($0001)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	pea.l	($0000)
	move.l	#$0000ffff,-(sp)
	pea.l	($0002)
	pea.l	($0002)
	pea.l	($0002)
	pea.l	(L003ba0)
	pea.l	($0064)
	pea.l	($00c8)
	lea.l	(SYSCALL_028c_Scr描画_文字列),a3
	jsr	(a3)
	lea.l	($0020,sp),sp
	pea.l	($0000)
	move.l	#$0000ffff,-(sp)
	pea.l	($0002)
	pea.l	($0001)
	pea.l	($0001)
	move.l	d3,-(sp)
	pea.l	($00fa)
	pea.l	($0032)
	jsr	(a3)
	lea.l	($0020,sp),sp
	pea.l	($0000)
	move.l	#$0000ffff,-(sp)
	pea.l	($0002)
	pea.l	($0001)
	pea.l	($0001)
	move.l	d4,-(sp)
	pea.l	($012c)
	pea.l	($0032)
	jsr	(a3)
	lea.l	($0020,sp),sp
	pea.l	($0000)
	move.l	#$0000ffff,-(sp)
	pea.l	($0001)
	pea.l	($0001)
	pea.l	($0001)
	pea.l	(L003ba8)
	pea.l	($01cc)
	pea.l	($00c8)
	jsr	(a3)
	lea.l	($0020,sp),sp
	pea.l	($0030)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
	move.w	#$07d0,d3
	bra	L003e2c
L003e1c:
	tst.w	d3
	ble	L003e3e
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
L003e2c:
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	moveq.l	#$1b,d2
	cmp.l	d0,d2
	bne	L003e1c
L003e3e:
	pea.l	($0064)
	pea.l	(WORK_3P_0000)
	lea.l	(L014860),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($000a)
	lea.l	(L014804),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($000b)
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0001)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	jsr	(SR_タイマーD割込み解除)
	jsr	(L01bd26)
	pea.l	($0001)
	pea.l	($001f)
	pea.l	($0000)
	jsr	(L01dc64)
	lea.l	($000c,sp),sp
	pea.l	($0001)
	pea.l	($0001)
	pea.l	($0000)
	pea.l	($0002)
	jsr	(L01dd0c)
	lea.l	($0010,sp),sp
	jsr	(XCLIB_iocs_os_curon)
	jsr	(XCLIB_iocs_b_curon)
	pea.l	($0000)
	jsr	(L01ddfe)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(L019930)
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(XCLIB_dos_exit2)
	addq.w	#4,sp
	movem.l	(sp)+,d3-d4/a3-a5
	rts

L003f12(p1, p2)
{
	SR_キャラ動作関数実行(p1, OPT_サイクル);
	SR_キャラ動作関数実行(p2, OPT_サイクル);

	if (p1->0ac2_気集中) SR_気集中マーク表示処理呼び出し(p1);
	if (p2->0ac2_気集中) SR_気集中マーク表示処理呼び出し(p2);

	if (SFSYSINFO_0070_XXXX) {
		SR_キャラ動作関数実行(p1, VCT_ゲージ調整処理);
		SR_キャラ動作関数実行(p2, VCT_ゲージ調整処理);
	}

	if (p1->0a76_砂煙表示カウンタ > 0) SR_キャラクター砂煙表示(p1);
	if (p2->0a76_砂煙表示カウンタ > 0) SR_キャラクター砂煙表示(p2);

	SR_1P2P体力ゲージ描画();

	L06f432 = p1->09c8_VCT_サブゲージ表示処理;
	if (L06f432) VCT_サブゲージ表示処理(p1, p2, 0);

	L06f432 = p2->09c8_VCT_サブゲージ表示処理;
	if (L06f432) VCT_サブゲージ表示処理(p2, p1, 0);

	if (p1->0aa8_残像フラグ) SR_キャラクタ身体・残像・影表示(p1, 1);
	if (p2->0aa8_残像フラグ) SR_キャラクタ身体・残像・影表示(p2, 1);

	if (SFSYSINFO_0078_ヒットストップ == 0) {
		p2->0a88_残像フラグ = 0;
		p1->0a88_残像フラグ = 0;
	}

	SR_コンボ数表示(p1);
	SR_コンボ数表示(p2);
}

L00402c(p1, p2)
{
	SR_キャラ動作関数実行(p1, OPT_サイクル);
	SR_キャラ動作関数実行(p2, OPT_サイクル);

	if (p1->0ac2_気集中 > 0) SR_気集中マーク表示処理呼び出し(p1);
	if (p2->0ac2_気集中 > 0) SR_気集中マーク表示処理呼び出し(p2);

	if (p1->0a76_砂煙表示カウンタ > 0) SR_キャラクター砂煙表示(p1);
	if (p2->0a76_砂煙表示カウンタ > 0) SR_キャラクター砂煙表示(p2);

	if (p1->0aa8_残像) SR_キャラクタ身体・残像・影表示(p1);
	if (p2->0aa8_残像) SR_キャラクタ身体・残像・影表示(p2);

	if (SFSYSINFO_0078_ヒットストップ == 0) {
		p1->0aa8_残像 = 0;
		p2->0aa8_残像 = 0;
	}
}

L0040d0:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a3			;a3=キャラハンドラ
	movea.l	($0014,sp),a4			;a4=p2キャラX座標
	tst.w	($09ec,a3)				;p1->09ec_xxxx
	beq	L0041ac
	move.w	($09e0,a3),d3			;d3 = p1->09e0_予約動作ID
	clr.w	($09ec,a3)

	SR_キャラ各種カウンタクリア(p1);
	SR_キャラキャンセル可能フラグクリア(p1)

	move.w	#$0064,($09e4,a3)		;複合動作をACT_アイドルに変更
	tst.w	($0a94,a3)				;リバーサル許可フラグが無効？
	beq	L004126
	cmp.w	#$0027,d3				;攻撃動作中ではない？
	bgt	L004122
	tst.w	($01c0,a3)				;p1->01c0_無敵状態
	beq	L004122

	SR_リバーサル表示(p1);

L004122:
	clr.w	($0a94,a3)				;リバーサル許可フラグをクリア
L004126:
	cmp.w	#$0064,d3				;ACT_アイドルではない？
	bne	L00416e

	SYSCALL_00c0_状態設定_永続無敵(p1, IVC_通常);

	tst.w	($01bc,a3)				;p1->01bc_しゃがみ状態
	beq	L004146
	move.w	#$0002,($09e6,a3)		;動作過程値を2に設定
L004146:
	SYSCALL_0044_キャラクタ向かい合わせ設定(p1, p2);

	cmpi.w	#$0090,($09e2,a3)		;ACT_起き上がりではない？
	bne	L0041ac

	SYSCALL_00c0_状態設定_永続無敵(p1, IVC_無敵);

	clr.w	($172e,a3)				;p1->172e_無敵持続カウンタ
	bra	L0041ac
L00416e:
	cmp.w	#$0090,d3				;ACT_起き上がりではない？
	bne	L004184

	SYSCALL_00c0_状態設定_永続無敵(p1, IVC_無敵);

	bra	L0041ac
L004184:
	cmp.w	#$0045,d3				;ACT_地上防御？
	beq	L0041ac
	cmp.w	#$0003,d3				;ACT_座り攻撃A？
	beq	L0041ac
	cmp.w	#$0004,d3				;ACT_座り攻撃B？
	beq	L0041ac
	cmp.w	#$002a,d3				;ACT_下衝撃１？
	beq	L0041ac
	cmp.w	#$003e,d3				;ACT_下衝撃２？
	beq	L0041ac
	cmp.w	#$0040,d3				;ACT_下衝撃３？
	beq	L0041ac
	clr.w	($01bc,a3)				;しゃがみ状態をクリア
L0041ac:
	tst.w	($173e,a3)				;先頭サイクル判定動作IDが0以上か？
	bge	L0041ba
	move.w	($09e2,a3),($173e,a3)	;先頭サイクル判定動作IDに現在の動作IDを設定
	bra	L0041d6
L0041ba:
	move.w	#$03e8,($173e,a3)		;先頭サイクル判定動作IDに1000を設定
	move.w	($09e0,a3),d1
	cmp.w	($09e2,a3),d1			;動作予約IDと現在の動作IDは同じか？
	beq	L0041d6
	move.w	($09e0,a3),d0
	move.w	d0,($09e2,a3)			;現在の動作IDを動作予約IDの値に変更
	move.w	d0,($173e,a3)			;先頭サイクル判定動作IDも変更
L0041d6:
	L00bedc(p1, p2);

	cmpi.w	#$0027,($09e2,a3)
	ble	L0041f4						;現在の動作IDが攻撃動作か？
	tst.w	($0f0c,a3)
	bne	L0041f4						;SHOT攻撃中か？
	clr.w	($01be,a4)				;相手の防御許可をクリア
L0041f4:
	movem.l	(sp)+,d3/a3-a4
	rts

L0041fa()
{
	if (SFSYSINFO_001e_デバッグモード有効フラグ) {
		if (SFSYSINFO_0484_デバッグ_パラメータ表示)
			SR_デバッグパラメータ表示();

		if (SFSYSINFO_004a_デバッグ_矩形表示有効) {
			SR_デバッグ_矩形表示(WORK_1P_0000);
			SR_デバッグ_矩形表示(WORK_2P_0000);
		}

		if (SFSYSINFO_004c_デバッグ_スローモーション有効) {
			SR_VDISP回数指定待機(4);
		}
	}

	L017f8c(WORK_1P_0000, WORK_2P_0000);

	SR_キャラクタ身体・残像・影表示(WORK_1P_0000, 0);
	SR_キャラクタ身体・残像・影表示(WORK_2P_0000, 0);

	if (SFSYSINFO_000c_ゲームスピード)
		SR_タイマーD割込み処理終了待ち();
	else
		SR_最終ラスター割込み終了待ち();

	a2 = (224 - (WORK_1P_0008_Y座標 + WORK_2P_0008_Y座標)) / 16;
	SR_SET_STAGE_XY(
		L06f430 / 2,
		L06f42e - a2,
		64 + L06f430 / 4,
		L06f42e - a2,
		0,
		a2
	);

	if (WORK_1P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_1P_0000);

	if (WORK_2P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_2P_0000);

	SR_スプライトスクロールレジスタ一括更新();
	L01ad20();
}

L004324(d3, d4)
{
	L017f8c(WORK_1P_0000, WORK_2P_0000);

	SR_キャラクタ身体・残像・影表示(WORK_1P_0000, 0);
	SR_キャラクタ身体・残像・影表示(WORK_2P_0000, 0);

	if (SFSYSINFO_000c_ゲームスピード)
		SR_タイマーD割込み処理終了待ち();
	else
		SR_最終ラスター割込み終了待ち();

	SR_SET_STAGE_XY(d3 / 2, d4, 64 + d3 / 4, d4, 0, 0);

	if (WORK_1P_0a70_ヒット・ガードマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_1P_0000);
	if (WORK_2P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_2P_0000);

	SR_スプライトスクロールレジスタ一括更新();
	L01ad20();
}

L0043f0()
{
	L017f8c(WORK_1P_0000, WORK_2P_0000);

	SR_キャラクタ身体・残像・影表示(WORK_1P_0000, 0);
	SR_キャラクタ身体・残像・影表示(WORK_2P_0000, 0);

	if (SFSYSINFO_000c_ゲームスピード)
		SR_タイマーD割込み処理終了待ち();
	else
		SR_最終ラスター割込み終了待ち();

	SR_SET_STAGE_XY(0, L06f42e, 0, L06f42e, 0, 0);

	if (p1->0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_1P_0000);
	if (WORK_2P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_2P_0000);

	SR_スプライトスクロールレジスタ一括更新();
}

L00449c()
{
	L017f8c(WORK_1P_0000, WORK_2P_0000);

	SR_キャラクタ身体・残像・影表示(WORK_1P_0000, 0);
	SR_キャラクタ身体・残像・影表示(WORK_2P_0000, 0);

	a2 = (224 - (WORK_1P_0008_Y座標 + WORK_2P_0008_Y座標)) / 16;
	SR_SET_STAGE_XY(
		L06f430 / 2,
		L06f42e - a2,
		64 + L06f430 / 4,
		L06f42e - a2,
		0,
		a2
	);

	if (WORK_1P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_1P_0000);
	if (WORK_2P_0a70_ヒットマークアニメーションカウンタ)
		SR_ヒット・防御マーク表示処理(WORK_2P_0000);

	SR_スプライトスクロールレジスタ一括更新();
	L01ad20();
}

SR_タイマーD割込み設定:
	movem.l	d0-d7/a0-a5,-(sp)
	ori.w	#$0700,sr
	moveq.l	#$6b,d0
	move.w	#$0730,d1		;50μ秒 * 48 = 2.4m秒
	lea.l	(SR_タイマーD割込み処理),a1	;処理アドレス
	trap	#15				;iocscall_TIMERDST
	andi.w	#$f8ff,sr
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SR_タイマーD割込み解除:
	movem.l	d0-d7/a0-a5,-(sp)
	ori.w	#$0700,sr
	moveq.l	#$6b,d0
	suba.l	a1,a1
	trap	#15
	andi.w	#$f8ff,sr
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SR_タイマーD割込み処理終了待ち()
{
	while (L01fedc);
	L01fedc = 1;
}

SR_タイマーD割込み処理:
	movem.l	d0-d7/a0-a5,-(sp)
	
	if (--L01feda == 0) {
		L01feda = *(タイマーD割込みウェイトテーブル + SFSYSINFO_000c_ゲームスピード * 2);
		L01fedc = 0;
	}
}

L0045e4:
	rts

L0045e6:
	subq.w	#1,(L0690ba)
	rts

SR_ラウンドタイマーカウントダウン＆表示()
{
	if (SFSYSINFO_000a_タイムリミット有効 == 1) {
		*L0690ba = 64;
		if (*--L01fee0) return;

		SR_キャラ動作関数実行(WORK_1P_0000, OPT_タイマ);
		SR_キャラ動作関数実行(WORK_2P_0000, OPT_タイマ);

		SR_ラウンドタイマー制限なし表示();
		
		*L01fee0 = 64;
		return;
	}

	if (*L0690b4) return;
	if (*L0690ba > 1) return;
	
	*L0690ba = 64;

	SR_キャラ動作関数実行(WORK_1P_0000, OPT_タイマ);
	SR_キャラ動作関数実行(WORK_2P_0000, OPT_タイマ);

	if (*--ラウンドタイマー一の位 < 0) {
		*ラウンドタイマー一の位 = 9;
		if (*--ラウンドタイマー十の位 < 0) {
			*ラウンドタイマー十の位 = 9;
		}
	}

	if (*ラウンドタイマー十の位 <= 0) {
		d3 = 0x0f00;
		if (*ラウンドタイマー一の位-1 <= 8) {
			SYSCALL_0024_音声再生(3, [PCM_1～9][*ラウンドタイマー一の位-1]);
			d3 = 0x0f00;
		}
	}

	SR_ラウンドタイマーBG数字表示(15, 4, *ラウンドタイマー十の位, d3);
	SR_ラウンドタイマーBG数字表示(16, 4, *ラウンドタイマー一の位, d3);

	if (*ラウンドタイマー十の位 + ラウンドタイマー一の位 == 0) {
		*L0690b4 = 1;
		*L0690b6 = 480;

		WORK_1P_0aca_xxxx = 0;
		WORK_2P_0aca_xxxx = 0;
		WORK_1P_01c8_xxxx = 0;
		WORK_2P_01c8_xxxx = 0;
		WORK_1P_01be_防御許可 = 0;
		WORK_2P_01be_防御許可 = 0;
		SFSYSINFO_0078_ヒットストップ = 0;

		SYSCALL_0024_音声再生(3, PCM_TIMEOVER)

		SR_MESS_SP_PCGパターン定義(16, 0, 8);	//TIME OVER
		SR_MESS_SP表示_固定位置(0x0d00);
	}
}

SR_各種ゲージ・インジケータ表示()
{	if (WORK_1P_09c4_VCT_超技ゲージ表示処理)
		VCT_超技ゲージ表示処理(WORK_1P_0000, WORK_2P_0000, 0);
	if (WORK_2P_09c4_VCT_超技ゲージ表示処理)
		VCT_超技ゲージ表示処理(WORK_2P_0000, WORK_1P_0000, 0);

	if (WORK_1P_09c8_VCT_サブゲージ表示処理)
		VCT_サブゲージ表示処理(WORK_1P_0000, WORK_2P_0000, 1);
	if (WORK_2P_09c8_VCT_サブゲージ表示処理)
		VCT_サブゲージ表示処理(WORK_2P_0000, WORK_1P_0000, 1);

	if (SYSCALL_0148_場面取得_エンディング)
		return;

	SR_1P体力ゲージ描画(88, 88);
	SR_2P体力ゲージ描画(88, 88);

	SR_MAXCOMBO表示(WORK_1P_0000);
	SR_MAXCOMBO表示(WORK_2P_0000);

	SYSCALL_024c_Sel表示_ＢＧネーム(WORK_1P_0000, 4, 5, WORK_1P_176c_xxxx, WORK_1P_176a_xxxx);
	SYSCALL_024c_Sel表示_ＢＧネーム(WORK_2P_0000, 20, 5, WORK_2P_176c_xxxx, WORK_2P_176a_xxxx);

	SR_BGページ1_書き込み(15, 3, 0xc03);
	SR_BGページ1_書き込み(16, 3, 0xc05);
	SR_BGページ1_書き込み(1, 5, 0x9e0);
	SR_BGページ1_書き込み(1, 6, 0x9e1);
	SR_BGページ1_書き込み(2, 5, 0x9e2);
	SR_BGページ1_書き込み(2, 6, 0x9e3);
	SR_BGページ1_書き込み(3, 5, 0x9e4);
	SR_BGページ1_書き込み(3, 6, 0x9e5);
	SR_BGページ1_書き込み(1, 7, 0x9e8);
	SR_BGページ1_書き込み(1, 8, 0x9e9);
	SR_BGページ1_書き込み(2, 7, 0x9ea);
	SR_BGページ1_書き込み(2, 8, 0x9eb);
	SR_BGページ1_書き込み(3, 7, 0x9ec);
	SR_BGページ1_書き込み(3, 6, 0x9e5);
	SR_BGページ1_書き込み(30, 5, 0x4ef0);
	SR_BGページ1_書き込み(30, 6, 0x4ef1);
	SR_BGページ1_書き込み(29, 5, 0x4ef2);
	SR_BGページ1_書き込み(29, 6, 0x4ef3);
	SR_BGページ1_書き込み(28, 5, 0x4ef4);
	SR_BGページ1_書き込み(28, 6, 0x4ef5);
	SR_BGページ1_書き込み(30, 7, 0x4ef8);
	SR_BGページ1_書き込み(30, 8, 0x4ef9);
	SR_BGページ1_書き込み(29, 7, 0x4efa);
	SR_BGページ1_書き込み(29, 8, 0x4efb);
	SR_BGページ1_書き込み(28, 7, 0x4efc);
	SR_BGページ1_書き込み(28, 8, 0x4efd);
}

SR_BG勝ち数表示:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3				;p1
	cmpi.w	#$0001,($002c,a3)			;勝ち数
	ble	L004b08
	cmpi.w	#$0001,($000a,a3)			;プレイヤー番号
	bne	L004b02
	pea.l	($0f04)
	pea.l	($0005)
	pea.l	($000c)
	bra	L004b2a
L004b02:
	pea.l	($4f04)
	bra	L004b22
L004b08:
	cmpi.w	#$0001,($000a,a3)			;プレイヤー番号
	bne	L004b1e
	pea.l	($0f02)
	pea.l	($0005)
	pea.l	($000c)
	bra	L004b2a
L004b1e:
	pea.l	($4f02)
L004b22:
	pea.l	($0005)
	pea.l	($0013)
L004b2a:
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	tst.w	($002c,a3)
	ble	L004b56
	cmpi.w	#$0001,($000a,a3)
	bne	L004b50
	pea.l	($0f04)
	pea.l	($0005)
	pea.l	($000d)
	bra	L004b78
L004b50:
	pea.l	($4f04)
	bra	L004b70
L004b56:
	cmpi.w	#$0001,($000a,a3)
	bne	L004b6c
	pea.l	($0f02)
	pea.l	($0005)
	pea.l	($000d)
	bra	L004b78
L004b6c:
	pea.l	($4f02)
L004b70:
	pea.l	($0005)
	pea.l	($0012)
L004b78:
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	movea.l	(sp)+,a3
	rts

SR_ラウンドタイマー制限なし表示:
	move.l	a3,-(sp)
	pea.l	($0f1f)
	pea.l	($0004)
	pea.l	($000f)
	lea.l	(SR_BGページ1_書き込み),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($4f1f)
	pea.l	($0004)
	pea.l	($0010)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	#$00008f1f,-(sp)
	pea.l	($0005)
	pea.l	($000f)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	#$0000cf1f,-(sp)
	pea.l	($0005)
	pea.l	($0010)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.l	(sp)+,a3
	rts

L004bde:
	move.w	($0006,sp),(L01fede)
L004be6:
	tst.w	(L01fede)
	bgt	L004be6
	rts

L004bf0:
	movem.l	d0-d7/a0-a5,-(sp)
	subq.w	#1,(L01fede)
	movem.l	(sp)+,d0-d7/a0-a5
	rte

L004c00:
	rts

L004c02:
	movem.l	d0-d7/a0-a5,-(sp)
	ori.w	#$0700,sr
	moveq.l	#$6c,d0
	moveq.l	#$01,d1
	lea.l	(L004bf0),a1
	trap	#15
	andi.w	#$f8ff,sr
	movem.l	(sp)+,d0-d7/a0-a5
	rts

L004c20:
	movem.l	d0-d7/a0-a5,-(sp)
	ori.w	#$0700,sr
	moveq.l	#$6c,d0
	suba.l	a1,a1
	trap	#15
	andi.w	#$f8ff,sr
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SR_VDISP帰線期間待ち:
	btst.b	#$04,(MFP_GPIPレジスタ)
	bne	SR_VDISP帰線期間待ち
	rts

SR_VDISP表示期間待ち:
	btst.b	#$04,(MFP_GPIPレジスタ)
	beq	SR_VDISP表示期間待ち
	rts

SR_VDISP回数指定待機:
	move.w	($0006,sp),d0
	ble	L004c7a					;引数が0以下の時、引数の値を返して即終了
L004c56:
	btst.b	#$04,(MFP_GPIPレジスタ)
	beq	L004c56					;VDISP帰線期間中ループ
L004c60:
	btst.b	#$04,(MFP_GPIPレジスタ)
	bne	L004c60					;VDISP表示期間中ループ
L004c6a:
	btst.b	#$04,(MFP_GPIPレジスタ)
	beq	L004c6a					;VDISP帰線期間中ループ
	subq.w	#1,d0
	tst.w	d0					;引数の値をデクリメントして0以下になったら終了
	bgt	L004c56
L004c7a:
	rts

L004c7c:
	move.l	d3,-(sp)
	move.w	($000a,sp),d3
	ble	L004c90
L004c84:
	jsr	(SR_最終ラスター割込み終了待ち)
	subq.w	#1,d3
	tst.w	d3
	bgt	L004c84
L004c90:
	move.l	(sp)+,d3
	rts

L004c94:
	move.l	d3,-(sp)
	move.w	($000a,sp),d3
	ble	L004cae
L004c9c:
	pea.l	($0001)
	jsr	(L004cb2)
	addq.w	#4,sp
	subq.w	#1,d3
	tst.w	d3
	bgt	L004c9c
L004cae:
	move.l	(sp)+,d3
	rts

L004cb2()
{
	if (SFSYSINFO_000c_ゲームスピード)
		SR_タイマーD割込み処理終了待ち();
	else
		SR_最終ラスター割込み終了待ち();

	L003f12(WORK_1P_0000, WORK_2P_0000);

	SR_キャラ動作関数実行(WORK_1P_0000, OPT_サイクル２);
	SR_キャラ動作関数実行(WORK_2P_0000, OPT_サイクル２);
}

SR_画面フェードイン()
{
	jsr	(XCLIB_iocs_contrast(15)
	SYSCALL_01e4_Scr設定_表示面(3);
	SR_VDISP回数指定待機(24)
}

SR_コントラスト15設定()
{
	XCLIB_iocs_contrast(15);
	SYSCALL_01e4_Scr設定_表示面(3);
}

SR_画面フェードアウト()
{
	XCLIB_iocs_contrast(0);
	SR_VDISP回数指定待機(56)
	jsr	(SYSCALL_01e4_Scr設定_表示面(0);
}


SR_コントラスト0設定()
{:
	XCLIB_iocs_contrast(0);
}

L004d78:
	.dc.b	'PAUSE',$00
L004d7e:
	.dc.b	'1?LEFT >>>> HELP FOR 1P',$00
L004d96:
	.dc.b	'2?RIGHT >>> HELP FOR 2P',$00
L004dae:
	.dc.b	'UP?DOWN >>> CONFIGURATION',$00
L004dc8:
	.dc.b	'ESC?TRIG >> RETURN',$00,$00
L004ddc:
	.dc.b	'Q >>>>>>>>> TITLE',$00
L004dee:
	.dc.b	'X >>>>>>>>> EXIT',$00,$00
L004e00:
	.dc.b	'DEBUG MODE ON ',$00,$00
L004e10:
	.dc.b	'DEBUG MODE OFF',$00,$00
L004e20:
	.dc.b	'RECT DISP ON  ',$00,$00
L004e30:
	.dc.b	'RECT DISP OFF ',$00,$00
L004e40:
	.dc.b	'SLOW MODE ON  ',$00,$00
L004e50:
	.dc.b	'SLOW MODE OFF ',$00,$00
L004e60:
	.dc.b	'WATCH MODE ON  ',$00
L004e70:
	.dc.b	'WATCH MODE OFF ',$00
L004e80:
	.dc.b	'ENDING ON     ',$00,$00
L004e90:
	.dc.b	'ENDING OFF    ',$00,$00
L004ea0:
	.dc.b	'TRAINING ON   ',$00,$00
L004eb0:
	.dc.b	'TRAINING OFF  ',$00,$00
L004ec0:
	.dc.b	'PARAM DISP ON ',$00,$00
L004ed0:
	.dc.b	'PARAM DISP OFF',$00,$00
L004ee0:
	.dc.b	'    KILL CHAR 1 OR 2    ',$00,$00
L004efa:
	.dc.b	'      KILLING CHAR 1    ',$00,$00
L004f14:
	.dc.b	'      KILLING CHAR 2    ',$00,$00
L004f2e:
	link	a6,#-$0800
	movem.l	d3-d5/a3-a5,-(sp)
	cmpi.w	#$001b,(L06f42c)
	bne	L00564c
	moveq.l	#$00,d4
	tst.w	(WORK_1P_01cc_敗北状態)
	bne	L00564c
	tst.w	(WORK_2P_01cc_敗北状態)
	bne	L00564c
	lea.l	(SFSYSINFO_001e_デバッグモード有効フラグ),a0
	tst.w	(a0)
	beq	L004f8e
	tst.w	($002c,a0)
	beq	L004f8e
	lea.l	(L01fefa),a3				;1p
	moveq.l	#$00,d5
	move.l	d5,(a3)+
	pea.l	(WORK_1P_0000)
	lea.l	(SR_デバッグ_矩形表示),a4
	jsr	(a4)							;SR_デバッグ_矩形表示(WORK_1P_0000);
	addq.w	#4,sp
	move.l	d5,(a3)
	pea.l	(WORK_2P_0000)
	jsr	(a4)							;SR_デバッグ_矩形表示(WORK_1P_0000);
	addq.w	#4,sp
L004f8e:
	clr.w	(WORK_1P_1754_xxxx)
	clr.w	(WORK_2P_1754_xxxx)
	jsr	(L00449c)
	moveq.l	#$1f,d2
L004fa2:
	move.w	d2,d0
	ext.l	d0
	asl.l	#7,d0
	movea.l	#$00ebe000,a0
	adda.l	d0,a0
	moveq.l	#$1f,d1
	move.w	d2,d0
	ext.l	d0
	asl.l	#6,d0
	add.l	a6,d0
	movea.l	d0,a1
	lea.l	(-$0800,a1),a1
L004fc0:
	moveq.l	#$1f,d0
	movea.l	d0,a2
	suba.w	d1,a2
	move.l	a2,d0
	add.l	d0,d0
	move.w	(a0)+,(a1,d0.l)
	subq.w	#1,d1
	bpl	L004fc0
	subq.w	#1,d2
	bpl	L004fa2
	lea.l	(SFSYSINFO_001e_デバッグモード有効フラグ),a0
	tst.w	(a0)
	beq	L004fee
	tst.w	($0466,a0)
	beq	L004fee
	jsr	(SR_デバッグパラメータ表示)
	bra	L004ff4
L004fee:
	jsr	(SR_BG文字消去_9_23行)
L004ff4:
	pea.l	($0d00)
	pea.l	(L004d78)
	pea.l	($0009)
	pea.l	($000d)
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
	tst.w	(SFSYSINFO_001e_デバッグモード有効フラグ)
	beq	L005022
	tst.w	(SFSYSINFO_0484_デバッグ_パラメータ表示)
	bne	L0050b8
L005022:
	pea.l	($0f00)
	pea.l	(L004d7e)
	pea.l	($000d)
	pea.l	($0004)
	lea.l	(SR_BG文字列描画),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L004d96)
	pea.l	($000f)
	pea.l	($0004)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L004dae)
	pea.l	($0011)
	pea.l	($0004)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L004dc8)
	pea.l	($0013)
	pea.l	($0004)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L004ddc)
	pea.l	($0015)
	pea.l	($0004)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L004dee)
	pea.l	($0017)
	pea.l	($0004)
	jsr	(a3)
	lea.l	($0010,sp),sp
L0050b8:
	pea.l	($0018)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
L0050d0:
	lea.l	(WORK_1P_0ad0_xxxx),a0
	lea.l	($0004,a0),a5
	clr.w	(a5)
	moveq.l	#$00,d5
	move.l	d5,(a0)
	lea.l	(WORK_2P_0ad0_xxxx),a0
	lea.l	($0004,a0),a4
	move.w	d5,(a4)
	move.l	d5,(a0)
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	move.l	d0,d3
	pea.l	(WORK_1P_0000)
	lea.l	(SR_STC_TRG_直接状態更新),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	moveq.l	#$1b,d5
	cmp.l	d3,d5
	beq	L005130
	tst.w	(a5)
	bne	L005130
	tst.w	(a4)
	beq	L005136
L005130:
	moveq.l	#$01,d4
	bra	L0055a8
L005136:
	moveq.l	#$31,d5
	cmp.l	d3,d5
	bne	L005146
	pea.l	(WORK_1P_0000)
	bra	L0055a0
L005146:
	moveq.l	#$32,d5
	cmp.l	d3,d5
	beq	L00559a
	moveq.l	#$64,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$44,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$72,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$52,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$73,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$53,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$77,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$57,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$65,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$45,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$70,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$50,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$74,d5
	cmp.l	d3,d5
	beq	L0051a4
	moveq.l	#$54,d5
	cmp.l	d3,d5
	bne	L0053b2
L0051a4:
	jsr	(SR_BG文字消去_9_23行)
	moveq.l	#$bc,d0
	add.l	d3,d0
	moveq.l	#$33,d5
	cmp.l	d5,d0
	bhi	L0053a4
	add.l	d0,d0
	move.w	(L0051c0,pc,d0.l),d5
	jmp	(L0051c0,pc,d5.w)

L0051c0:
	.dc.w	L005228-L0051c0
	.dc.w	L00531a-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L00536a-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L005256-L0051c0
	.dc.w	L005282-L0051c0
	.dc.w	L005342-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0052ae-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L005228-L0051c0
	.dc.w	L00531a-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L00536a-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L005256-L0051c0
	.dc.w	L005282-L0051c0
	.dc.w	L005342-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0053a4-L0051c0
	.dc.w	L0052ae-L0051c0
L005228:
	move.w	(SFSYSINFO_001e_デバッグモード有効フラグ),d0
	eori.w	#$0001,d0
	move.w	d0,(SFSYSINFO_001e_デバッグモード有効フラグ)
	beq	L005248
	pea.l	($0d00)
	pea.l	(L004e00)
	bra	L005392
L005248:
	pea.l	($0d00)
	pea.l	(L004e10)
	bra	L005392
L005256:
	lea.l	(SFSYSINFO_004a_デバッグ_矩形表示有効),a0
	move.w	(a0),d0
	eori.w	#$0001,d0
	move.w	d0,(a0)
	beq	L005274
	pea.l	($0d00)
	pea.l	(L004e20)
	bra	L005392
L005274:
	pea.l	($0d00)
	pea.l	(L004e30)
	bra	L005392
L005282:
	lea.l	(SFSYSINFO_004c_デバッグ_スローモーション有効),a0
	move.w	(a0),d0
	eori.w	#$0001,d0
	move.w	d0,(a0)
	beq	L0052a0
	pea.l	($0d00)
	pea.l	(L004e40)
	bra	L005392
L0052a0:
	pea.l	($0d00)
	pea.l	(L004e50)
	bra	L005392
L0052ae:
	lea.l	(SFSYSINFO_006e_xxxx),a0
	move.w	(a0),d0
	eori.w	#$0001,d0
	move.w	d0,(a0)
	beq	L0052ee
	pea.l	($0d00)
	pea.l	(L004e60)
	pea.l	($000e)
	pea.l	($0009)
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
	move.w	#$0001,(L033c7a)
	move.w	#$0001,(WORK_1P_0a86_CPU制御状態)
	bra	L0053a4
L0052ee:
	pea.l	($0d00)
	pea.l	(L004e70)
	pea.l	($000e)
	pea.l	($0009)
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
	clr.w	(L033c7a)
	clr.w	(WORK_1P_0a86_CPU制御状態)
	bra	L0053a4
L00531a:
	lea.l	(SFSYSINFO_004e_xxxx),a0
	move.w	(a0),d0
	eori.w	#$0001,d0
	move.w	d0,(a0)
	beq	L005336
	pea.l	($0d00)
	pea.l	(L004e80)
	bra	L005392
L005336:
	pea.l	($0d00)
	pea.l	(L004e90)
	bra	L005392
L005342:
	lea.l	(SFSYSINFO_0482_デバッグ_トレーニングモード),a0
	move.w	(a0),d0
	eori.w	#$0001,d0
	move.w	d0,(a0)
	beq	L00535e
	pea.l	($0d00)
	pea.l	(L004ea0)
	bra	L005392
L00535e:
	pea.l	($0d00)
	pea.l	(L004eb0)
	bra	L005392
L00536a:
	move.w	(SFSYSINFO_0484_デバッグ_パラメータ表示),d0
	eori.w	#$0001,d0
	move.w	d0,(SFSYSINFO_0484_デバッグ_パラメータ表示)
	beq	L005388
	pea.l	($0d00)
	pea.l	(L004ec0)
	bra	L005392
L005388:
	pea.l	($0d00)
	pea.l	(L004ed0)
L005392:
	pea.l	($000e)
	pea.l	($0009)
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
L0053a4:
	pea.l	($000c)
	jsr	(SR_VDISP回数指定待機)
	bra	L0055a6
L0053b2:
	moveq.l	#$6b,d5
	cmp.l	d3,d5
	beq	L0053c0
	moveq.l	#$4b,d5
	cmp.l	d3,d5
	bne	L005476
L0053c0:
	jsr	(SR_BG文字消去_9_23行)
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
	pea.l	($0d00)
	pea.l	(L004ee0)
	pea.l	($000e)
	pea.l	($0005)
	jsr	(SR_BG文字列描画)
	lea.l	($0010,sp),sp
L0053ee:
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	move.l	d0,d3
	moveq.l	#$31,d5
	cmp.l	d3,d5
	bne	L00542a
	pea.l	($0d00)
	pea.l	(L004efa)
	pea.l	($000e)
	pea.l	($0005)
	jsr	(SR_BG文字列描画)
	lea.l	($0010,sp),sp
	pea.l	(-$2710)
	pea.l	(WORK_1P_0000)
	bra	L005456
L00542a:
	moveq.l	#$32,d5
	cmp.l	d3,d5
	bne	L005462
	pea.l	($0d00)
	pea.l	(L004f14)
	pea.l	($000e)
	pea.l	($0005)
	jsr	(SR_BG文字列描画)
	lea.l	($0010,sp),sp
	pea.l	(-$2710)
	pea.l	(WORK_2P_0000)
L005456:
	jsr	(SYSCALL_0054_ゲージ増減_体力)
	addq.w	#8,sp
	moveq.l	#$01,d4
	bra	L005468
L005462:
	moveq.l	#$1b,d5
	cmp.l	d3,d5
	bne	L0053ee
L005468:
	pea.l	($000c)
	jsr	(SR_VDISP回数指定待機)
	bra	L0055a6
L005476:
	moveq.l	#$63,d5
	cmp.l	d3,d5
	beq	L005484
	moveq.l	#$43,d5
	cmp.l	d3,d5
	bne	L005506
L005484:
	jsr	(SR_BG文字消去_9_23行)
	pea.l	($000c)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
	lea.l	(SR_STC_TRG_直接状態更新),a3
L0054a8:
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	move.l	d0,d3
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	tst.w	(WORK_1P_0ad4_トリガー直接状態１)
	bne	L0054f8
	tst.w	(L033cc8)
	bne	L0054f8
	moveq.l	#$63,d5
	cmp.l	d3,d5
	beq	L0054f8
	moveq.l	#$43,d5
	cmp.l	d3,d5
	beq	L0054f8
	moveq.l	#$1b,d5
	cmp.l	d3,d5
	bne	L0054a8
L0054f8:
	pea.l	($000c)
	jsr	(SR_VDISP回数指定待機)
	bra	L0055a6
L005506:
	moveq.l	#$71,d5
	cmp.l	d3,d5
	beq	L005512
	moveq.l	#$51,d5
	cmp.l	d3,d5
	bne	L005518
L005512:
	moveq.l	#$01,d0
	bra	L00564e
L005518:
	moveq.l	#$78,d5
	cmp.l	d3,d5
	beq	L005524
	moveq.l	#$58,d5
	cmp.l	d3,d5
	bne	L00552a
L005524:
	jsr	(L003894)
L00552a:
	move.l	(WORK_1P_0acc_スティック直接状態),d0
	move.l	(WORK_2P_0acc_スティック直接状態),d1
	moveq.l	#$02,d5
	cmp.l	d0,d5
	beq	L00554e
	moveq.l	#$08,d5
	cmp.l	d0,d5
	beq	L00554e
	moveq.l	#$02,d5
	cmp.l	d1,d5
	beq	L00554e
	moveq.l	#$08,d5
	cmp.l	d1,d5
	bne	L00557c
L00554e:
	jsr	(SR_タイマーD割込み解除)
	jsr	(L00057c)
	jsr	(SR_ステージパレット反映)
	pea.l	($0003)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	tst.w	(SFSYSINFO_000c_ゲームスピード)
	beq	L0055a8
	jsr	(SR_タイマーD割込み設定)
	bra	L0055a8
L00557c:
	moveq.l	#$04,d5
	cmp.l	d0,d5
	beq	L005586
	cmp.l	d1,d5
	bne	L00558e
L005586:
	pea.l	(WORK_1P_0000)
	bra	L0055a0
L00558e:
	moveq.l	#$06,d5
	cmp.l	d0,d5
	beq	L00559a
	cmp.l	d1,d5
	bne	L0050d0
L00559a:
	pea.l	(WORK_2P_0000)
L0055a0:
	jsr	(L005662)
L0055a6:
	addq.w	#4,sp
L0055a8:
	moveq.l	#$1f,d2
L0055aa:
	move.w	d2,d0
	ext.l	d0
	asl.l	#7,d0
	movea.l	#$00ebe000,a0
	adda.l	d0,a0
	moveq.l	#$1f,d1
	move.w	d2,d0
	ext.l	d0
	asl.l	#6,d0
	add.l	a6,d0
	movea.l	d0,a1
	lea.l	(-$0800,a1),a1
L0055c8:
	moveq.l	#$1f,d0
	movea.l	d0,a2
	suba.w	d1,a2
	move.l	a2,d0
	add.l	d0,d0
	move.w	(a1,d0.l),(a0)+
	subq.w	#1,d1
	bpl	L0055c8
	subq.w	#1,d2
	bpl	L0055aa
	tst.w	d4
	beq	L004ff4
	lea.l	(WORK_1P_0ad4_トリガー直接状態１),a4
	lea.l	(SR_STC_TRG_直接状態更新),a3
L0055f0:
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	tst.w	(a4)
	bne	L0055f0
	tst.w	(L033cc8)
	bne	L0055f0
	lea.l	(WORK_1P_0ad0_xxxx),a0
	clr.w	($0004,a0)
	moveq.l	#$00,d5
	move.l	d5,(a0)
	lea.l	(WORK_2P_0ad0_xxxx),a0
	move.w	d5,($0004,a0)
	move.l	d5,(a0)
	move.w	d5,(L06f42c)
	jsr	(SR_BG文字消去_9_23行)
	pea.l	($000c)
	jsr	(SR_VDISP回数指定待機)
L00564c:
	moveq.l	#$00,d0
L00564e:
	movem.l	(-$0818,a6),d3-d5/a3-a5
	unlk	a6
	rts

L005658:
	.dc.b	'HELP.PIC',$00,$00
L005662:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a3
	pea.l	($0001)
	jsr	(L01ca52)
	addq.w	#4,sp
	movea.l	#$00c00000,a0
	moveq.l	#$1f,d1
L00567e:
	moveq.l	#$1f,d0
L005680:
	moveq.l	#$00,d2
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	subq.w	#1,d0
	bpl	L005680
	subq.w	#1,d1
	bpl	L00567e
	pea.l	(L005658)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0001)
	pea.l	(-$0001)
	jsr	(SYSCALL_01ec_Scr描画_ＰＩＣファイル)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0002)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	movea.w	($176a,a3),a1
	move.l	a1,-(sp)
	movea.w	($176c,a3),a1
	move.l	a1,-(sp)
	pea.l	($0002)
	pea.l	($000e)
	move.l	a3,-(sp)
	jsr	(SYSCALL_024c_Sel表示_ＢＧネーム)
	lea.l	($0014,sp),sp
	move.l	($0970,a3),(L06f432)		;VCT_ヘルプ表示処理
	beq	L005738
	pea.l	($0010)
	pea.l	($0038)
	pea.l	($0018)
	move.l	($132a,a3),-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0014,sp),sp
L005738:
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
	lea.l	(WORK_1P_0ad0_xxxx),a5
	lea.l	(WORK_2P_0ad0_xxxx),a4
	bra	L0057b0
L005752:
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	lea.l	(SR_STC_TRG_直接状態更新),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	tst.l	(a5)
	bne	L005780
	tst.l	(a4)
	beq	L0057b0
L005780:
	lea.l	(SR_STC_TRG_直接状態更新),a3
L005786:
	pea.l	($0001)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	tst.l	(a5)
	bne	L005786
	tst.l	(a4)
	bne	L005786
	bra	L0057c2
L0057b0:
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	moveq.l	#$1b,d2
	cmp.l	d0,d2
	bne	L005752
L0057c2:
	pea.l	($0004)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(L01ca52)
	addq.w	#4,sp
	movem.l	(sp)+,a3-a5
	rts

L0057ec:
	.dc.b	'ABC$',$00,$00
L0057f2:
	.dc.b	'XYZ$',$00,$00
L0057f8:
	.dc.b	'PK$',$00
L0057fc:
	.dc.b	'小P$',$00,$00
L005802:
	.dc.b	'中P$',$00,$00
L005808:
	.dc.b	'大P$',$00,$00
L00580e:
	.dc.b	'小K$',$00,$00
L005814:
	.dc.b	'中K$',$00,$00
L00581a:
	.dc.b	'大K$',$00,$00
SR_ヘルプ文字列描画:
	link	a6,#-$0100
	movem.l	d3-d6/a3-a4,-(sp)
	move.w	($000a,a6),d3
	move.w	($000e,a6),d5
	movea.l	($0010,a6),a3
	moveq.l	#$07,d6
	lea.l	(-$0100,a6),a4
	tst.b	(a3)
	beq	L005b2e
	move.l	a6,d4
	add.l	#$ffffff00,d4
L005848:
	cmpi.b	#$7f,(a3)
	bls	L005854
	cmpi.b	#$9f,(a3)
	bls	L00585a
L005854:
	cmpi.b	#$df,(a3)
	bls	L005860
L00585a:
	move.b	(a3)+,(a4)+
	bra	L005ac2
L005860:
	cmpi.b	#$25,(a3)
	bne	L0058c4
	addq.w	#1,a3
	cmpi.b	#$30,(a3)
	bls	L00587e
	cmpi.b	#$39,(a3)
	bhi	L00587e
	clr.w	d0
	move.b	(a3),d0
	add.w	#$ffcf,d0
	bra	L0058bc
L00587e:
	cmpi.b	#$40,(a3)
	bls	L005894
	cmpi.b	#$44,(a3)
	bhi	L005894
	clr.w	d0
	move.b	(a3),d0
	add.w	#$ffc8,d0
	bra	L0058bc
L005894:
	cmpi.b	#$2a,(a3)
	bne	L00589e
	moveq.l	#$0d,d0
	bra	L0058bc
L00589e:
	cmpi.b	#$3d,(a3)
	bne	L0058a8
	moveq.l	#$0e,d0
	bra	L0058bc
L0058a8:
	cmpi.b	#$52,(a3)
	bne	L0058b2
	moveq.l	#$0f,d0
	bra	L0058bc
L0058b2:
	cmpi.b	#$53,(a3)
	bne	L005ac2
	moveq.l	#$10,d0
L0058bc:
	ext.l	d0
	move.l	d0,-(sp)
	bra	L005a86
L0058c4:
	cmpi.b	#$24,(a3)
	bne	L005aa2
	moveq.l	#$0c,d1
	addq.w	#1,a3
	cmpi.b	#$24,(a3)
	bne	L005a0c
	addq.w	#1,a3
	pea.l	($0004)
	pea.l	(L0057ec)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L0058fc
	moveq.l	#$6f,d1
	addq.w	#3,a3
	bra	L005a82
L0058fc:
	pea.l	($0004)
	pea.l	(L0057f2)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L00591e
	moveq.l	#$70,d1
	addq.w	#3,a3
	bra	L005a82
L00591e:
	pea.l	($0003)
	pea.l	(L0057f8)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L005940
	moveq.l	#$71,d1
	addq.w	#2,a3
	bra	L005a82
L005940:
	pea.l	($0004)
	pea.l	(L0057fc)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L005962
	moveq.l	#$72,d1
	addq.w	#3,a3
	bra	L005a82
L005962:
	pea.l	($0004)
	pea.l	(L005802)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L005984
	moveq.l	#$73,d1
	addq.w	#3,a3
	bra	L005a82
L005984:
	pea.l	($0004)
	pea.l	(L005808)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L0059a6
	moveq.l	#$74,d1
	addq.w	#3,a3
	bra	L005a82
L0059a6:
	pea.l	($0004)
	pea.l	(L00580e)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L0059c8
	moveq.l	#$75,d1
	addq.w	#3,a3
	bra	L005a82
L0059c8:
	pea.l	($0004)
	pea.l	(L005814)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L0059ea
	moveq.l	#$76,d1
	addq.w	#3,a3
	bra	L005a82
L0059ea:
	pea.l	($0004)
	pea.l	(L00581a)
	move.l	a3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L005ac2
	moveq.l	#$77,d1
	addq.w	#3,a3
	bra	L005a82
L005a0c:
	moveq.l	#$00,d0
	move.b	(a3),d0
	moveq.l	#$bf,d2
	add.l	d2,d0
	moveq.l	#$19,d2
	cmp.l	d2,d0
	bhi	L005a82
	add.l	d0,d0
	move.w	(L005a24,pc,d0.l),d2
	jmp	(L005a24,pc,d2.w)

L005a24:
	.dc.w	L005a58-L005a24
	.dc.w	L005a5c-L005a24
	.dc.w	L005a60-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a78-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a74-L005a24
	.dc.w	L005a7c-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a70-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a80-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a82-L005a24
	.dc.w	L005a64-L005a24
	.dc.w	L005a68-L005a24
	.dc.w	L005a6c-L005a24
L005a58:
	moveq.l	#$64,d1
	bra	L005a82
L005a5c:
	moveq.l	#$65,d1
	bra	L005a82
L005a60:
	moveq.l	#$66,d1
	bra	L005a82
L005a64:
	moveq.l	#$67,d1
	bra	L005a82
L005a68:
	moveq.l	#$68,d1
	bra	L005a82
L005a6c:
	moveq.l	#$69,d1
	bra	L005a82
L005a70:
	moveq.l	#$6a,d1
	bra	L005a82
L005a74:
	moveq.l	#$6b,d1
	bra	L005a82
L005a78:
	moveq.l	#$6c,d1
	bra	L005a82
L005a7c:
	moveq.l	#$6d,d1
	bra	L005a82
L005a80:
	moveq.l	#$6e,d1
L005a82:
	ext.l	d1
	move.l	d1,-(sp)
L005a86:
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	jsr	(L005b38)
	lea.l	($000c,sp),sp
	addq.w	#1,a3
	add.w	#$0010,d3
	bra	L005b28
L005aa2:
	cmpi.b	#$23,(a3)
	bne	L005ac2
	addq.w	#1,a3
	cmpi.b	#$30,(a3)
	bls	L005ac2
	cmpi.b	#$37,(a3)
	bhi	L005ac2
	clr.w	d0
	move.b	(a3)+,d0
	move.w	d0,d6
	add.w	#$ffd0,d6
	bra	L005b28
L005ac2:
	move.b	(a3)+,(a4)+
	clr.b	(a4)
	cmpi.b	#$25,(a3)
	beq	L005ae2
	cmpi.b	#$24,(a3)
	beq	L005ae2
	cmpi.b	#$23,(a3)
	beq	L005ae2
	tst.b	(a3)
	beq	L005ae2
	cmpi.b	#$0a,(a3)
	bne	L005b28
L005ae2:
	pea.l	($0000)
	move.w	d6,d0
	ext.l	d0
	lea.l	(L01fee2),a0
	add.l	d0,d0
	movea.w	(a0,d0.l),a1
	move.l	a1,-(sp)
	pea.l	($0001)
	pea.l	($0001)
	pea.l	($0001)
	move.l	d4,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	jsr	(XCLIB_iocs_symbol)
	lea.l	($0020,sp),sp
	move.l	d4,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	lsl.w	#3,d0
	add.w	d0,d3
	movea.l	d4,a4
L005b28:
	tst.b	(a3)
	bne	L005848
L005b2e:
	movem.l	(-$0118,a6),d3-d6/a3-a4
	unlk	a6
	rts

L005b38:
	move.l	d3,-(sp)
	move.w	($0012,sp),d2
	move.w	($000a,sp),d0
	ext.l	d0
	add.l	d0,d0
	move.w	($000e,sp),d1
	ext.l	d1
	moveq.l	#$0a,d3
	asl.l	d3,d1
	add.l	#$00c00000,d1
	movea.l	d0,a1
	adda.l	d1,a1
	cmp.w	#$0063,d2
	bgt	L005b70
	move.w	d2,d0
	ext.l	d0
	asl.l	#5,d0
	movea.l	d0,a0
	adda.l	#$00c00000,a0
	bra	L005b82
L005b70:
	movea.w	d2,a0
	lea.l	(-$0064,a0),a0
	move.l	a0,d3
	asl.l	#5,d3
	movea.l	d3,a0
	adda.l	#$00c04000,a0
L005b82:
	moveq.l	#$0f,d0
L005b84:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	lea.l	($03e0,a1),a1
	lea.l	($03e0,a0),a0
	subq.w	#1,d0
	bpl	L005b84
	move.l	(sp)+,d3
	rts

L005ba4:
	.dc.b	'SFXVI.LOG',$00
L005bae:
	.dc.b	'a', $00
L005bb0:
	link	a6, -#$0100
L005bb4:
	move.l	d3,-(sp)
	move.w	($000a,a6),d0
	tst.w	(L0690a4)
	beq	L005c32
	cmpi.w	#$0001,(L0690a4)
	bne	L005bd2
	cmp.w	#$0001,d0
	bgt	L005c32
L005bd2:
	cmpi.w	#$0002,(L0690a4)
	bne	L005be2
	cmp.w	#$0002,d0
	bgt	L005c32
L005be2:
	pea.l	(SFSYSINFO_0688_xxxディレクトリパス)
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L005ba4)
	move.l	d3,-(sp)
	jsr	(XCLIB_strcat)
	addq.w	#8,sp
	pea.l	(L005bae)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d3
	move.l	d3,-(sp)
	move.l	($000c,a6),-(sp)
	jsr	(L01dc12)
	addq.w	#8,sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
L005c32:
	move.l	(-$0104,a6),d3
	unlk	a6
	rts

SYSCALL_0194_残り時間:
	move.w	(ラウンドタイマー十の位),d0
	asl.w	#3,d0
	add.w	(ラウンドタイマー十の位),d0
	add.w	(ラウンドタイマー十の位),d0
	add.w	(ラウンドタイマー一の位),d0
	ext.l	d0
	rts

SYSCALL_0150_Cnf取得_システム:
	movea.l	($0004,sp),a1
	moveq.l	#$ff,d0
	movea.w	($000a,sp),a0
	move.l	a0,d1
	subq.l	#1,d1
	moveq.l	#$0d,d2
	cmp.l	d2,d1
	bhi	L005d30
	move.l	d1,d0
	add.l	d0,d0
	move.w	(L005c7a,pc,d0.l),d2
	jmp	(L005c7a,pc,d2.w)

L005c7a:
	.dc.w	L005c96-L005c7a
	.dc.w	L005ca0-L005c7a
	.dc.w	L005caa-L005c7a
	.dc.w	L005cb2-L005c7a
	.dc.w	L005cba-L005c7a
	.dc.w	L005cc6-L005c7a
	.dc.w	L005cd2-L005c7a
	.dc.w	L005cda-L005c7a
	.dc.w	L005ce6-L005c7a
	.dc.w	L005cfe-L005c7a
	.dc.w	L005d06-L005c7a
	.dc.w	L005d12-L005c7a
	.dc.w	L005d1e-L005c7a
	.dc.w	L005d2a-L005c7a
L005c96:
	move.w	(SFSYSINFO_0008_Cpu思考レベル),d0
	bra	L005d30
L005ca0:
	move.w	(SFSYSINFO_002e_スクリーン周波数),d0
	bra	L005d30
L005caa:
	move.w	(SFSYSINFO_000c_ゲームスピード),d0
	bra	L005d30
L005cb2:
	move.w	(SFSYSINFO_003e_スーパーコンボ無限),d0
	bra	L005d30
L005cba:
	move.w	(SFSYSINFO_0032_飛び道具無限),d0
	eori.w	#$0001,d0
	bra	L005d30
L005cc6:
	move.w	(SFSYSINFO_0034_気絶有効),d0
	eori.w	#$0001,d0
	bra	L005d30
L005cd2:
	move.w	(SFSYSINFO_0036_ステージループ有効),d0
	bra	L005d30
L005cda:
	move.w	(SFSYSINFO_0040_変身有効),d0
	eori.w	#$0001,d0
	bra	L005d30
L005ce6:
	cmpi.w	#$0001,($000a,a1)
	bne	L005cf6
	move.w	(SFSYSINFO_0038_1Pダメージ倍率),d0
	bra	L005d30
L005cf6:
	move.w	(SFSYSINFO_0042_2Pダメージ倍率),d0
	bra	L005d30
L005cfe:
	move.w	(SFSYSINFO_000a_タイムリミット有効),d0
	bra	L005d30
L005d06:
	move.w	(SFSYSINFO_0046_時間経過有効),d0
	eori.w	#$0001,d0
	bra	L005d30
L005d12:
	move.w	(SFSYSINFO_0002_PCMドラム有効),d0
	eori.w	#$0001,d0
	bra	L005d30
L005d1e:
	move.w	(SFSYSINFO_003c_MIDIサウンド有効),d0
	eori.w	#$0001,d0
	bra	L005d30
L005d2a:
	move.w	(SFSYSINFO_0020_xxxx),d0
L005d30:
	ext.l	d0
	rts

SYSCALL_0254_Cnf設定_システム:
	movea.l	($0004,sp),a1
	move.w	($000e,sp),d1
	movea.w	($000a,sp),a0
	move.l	a0,d0
	subq.l	#1,d0
	moveq.l	#$0d,d2
	cmp.l	d2,d0
	bhi	L005e10
	add.l	d0,d0
	move.w	(L005d56,pc,d0.l),d2
	jmp	(L005d56,pc,d2.w)

L005d56:
	.dc.w	L005d72-L005d56
	.dc.w	L005d7c-L005d56
	.dc.w	L005d86-L005d56
	.dc.w	L005d90-L005d56
	.dc.w	L005d98-L005d56
	.dc.w	L005da4-L005d56
	.dc.w	L005db0-L005d56
	.dc.w	L005db8-L005d56
	.dc.w	L005dc4-L005d56
	.dc.w	L005ddc-L005d56
	.dc.w	L005de4-L005d56
	.dc.w	L005df0-L005d56
	.dc.w	L005dfc-L005d56
	.dc.w	L005e08-L005d56
L005d72:
	move.w	d1,(SFSYSINFO_0008_Cpu思考レベル)
	bra	L005e14
L005d7c:
	move.w	d1,(SFSYSINFO_002e_スクリーン周波数)
	bra	L005e14
L005d86:
	move.w	d1,(SFSYSINFO_000c_ゲームスピード)
	bra	L005e14
L005d90:
	move.w	d1,(SFSYSINFO_003e_スーパーコンボ無限)
	bra	L005e14
L005d98:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_0032_飛び道具無限)
	bra	L005e14
L005da4:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_0034_気絶有効)
	bra	L005e14
L005db0:
	move.w	d1,(SFSYSINFO_0036_ステージループ有効)
	bra	L005e14
L005db8:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_0040_変身有効)
	bra	L005e14
L005dc4:
	cmpi.w	#$0001,($000a,a1)
	bne	L005dd4
	move.w	d1,(SFSYSINFO_0038_1Pダメージ倍率)
	bra	L005e14
L005dd4:
	move.w	d1,(SFSYSINFO_0042_2Pダメージ倍率)
	bra	L005e14
L005ddc:
	move.w	d1,(SFSYSINFO_000a_タイムリミット有効)
	bra	L005e14
L005de4:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_0046_時間経過有効)
	bra	L005e14
L005df0:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_0002_PCMドラム有効)
	bra	L005e14
L005dfc:
	eori.w	#$0001,d1
	move.w	d1,(SFSYSINFO_003c_MIDIサウンド有効)
	bra	L005e14
L005e08:
	move.w	d1,(SFSYSINFO_0020_xxxx)
	bra	L005e14
L005e10:
	moveq.l	#$01,d0
	bra	L005e16
L005e14:
	moveq.l	#$00,d0
L005e16:
	rts

L005e18(d3, d4, a3)
{
	L005e88(d3, d4, a3);
	L0064a6(d3, d4, a3);
	L006586(d3, d4, a3);
	L0067d6(d3, d4, a3);
	return L006b78(d3, d4, a3);
}

L005e80:
	.dc.b	'ENDING',$00,$00
L005e88:
	movem.l	d3-d4/a3-a6,-(sp)
	movea.l	($001c,sp),a6
	move.l	($0020,sp),d4
	move.w	($0026,sp),d3
	lea.l	(SFSYSINFO_0070_XXXX),a0
	clr.w	(a0)
	tst.w	d3
	bne	L005eae
	cmpi.w	#$0002,(-$005c,a0)
	beq	L006466
L005eae:
	L014ea8();
	SYSCALL_024c_Sel表示_ＢＧネーム(a6, 0, 0, 0, 0);

	SYSCALL_024c_Sel表示_ＢＧネーム(d4, 0, 0, 0, 0);

	tst.w	d3
	bne	L0061be
	lea.l	(SFSYSINFO_0014_xxxx),a0
	cmpi.w	#$ffff,(a0)
	beq	L005f02
	tst.w	(a0)
	bne	L005fbc
L005f02:
	clr.w	($001a,a6)
	movea.l	d4,a1
	clr.w	($001a,a1)
	clr.w	($002a,a6)
	clr.w	($002a,a1)
	lea.l	(SFSYSINFO_0014_xxxx),a0
	cmpi.w	#$ffff,(a0)
	bne	L005f74
	move.w	#$0100,($0468,a0)

	SYSCALL_0230_Sel設定_キャラクタ番号(a6, 1);
	SYSCALL_0230_Sel設定_キャラクタ番号(d4, 1);

	SYSCALL_0250_Sel設定_ストーリー番号(a6, 1);
	SYSCALL_0250_Sel設定_ストーリー番号(d4, 1);

	SYSCALL_0238_Sel設定_ステージ番号(1);
	SYSCALL_023c_Sel設定_全体ストーリー番号(1);

	bra	L005f84
L005f74:
	lea.l	(SFSYSINFO_0472_xxxx),a0
	tst.w	(a0)
	beq	L005f84
	move.w	#$0800,($000a,a0)
L005f84:
	tst.w	($0a86,a6)
	bne	L005f92
	ori.w	#$0001,(SFSYSINFO_047c_セレクタ動作モード)
L005f92:
	movea.l	d4,a1
	tst.w	($0a86,a1)
	bne	L005fa2
	ori.w	#$0002,(SFSYSINFO_047c_セレクタ動作モード)
L005fa2:
	lea.l	(SFSYSINFO_0066_xxxx),a0
	tst.w	(a0)
	bne	L005fb4
	ori.w	#$0008,($0416,a0)
	bra	L005fbc
L005fb4:
	ori.w	#$0004,(SFSYSINFO_047c_セレクタ動作モード)
L005fbc:
	lea.l	(SFSYSINFO_047c_セレクタ動作モード),a0
	btst.b	#$00,(a0)
	bne	L005fce
	btst.b	#$03,(a0)
	beq	L005fe8
L005fce:
	L005e18(WORK_3P_0000, WORK_4P_0000, 5);

L005fe8:
	tst.w	($0a86,a6)
	beq	L006034
	lea.l	(SFSYSINFO_047a_現在ステージ番号),a3
	movea.w	(a3),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_0230_Sel設定_キャラクタ番号)
	addq.w	#8,sp
	movea.w	(-$0416,a3),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_0250_Sel設定_ストーリー番号)
	addq.w	#8,sp
	jsr	(乱数発生)
	cmp.l	#$00003e80,d0
	ble	L006026
	pea.l	($0001)
	bra	L00602a
L006026:
	pea.l	($0002)
L00602a:
	move.l	a6,-(sp)
	jsr	(SYSCALL_0234_Sel設定_同キャラ識別番号)
	addq.w	#8,sp
L006034:
	movea.l	d4,a1
	tst.w	($0a86,a1)
	beq	L006082
	lea.l	(SFSYSINFO_047a_現在ステージ番号),a3
	movea.w	(a3),a1
	move.l	a1,-(sp)
	move.l	d4,-(sp)
	jsr	(SYSCALL_0230_Sel設定_キャラクタ番号)
	addq.w	#8,sp
	movea.w	(-$0416,a3),a1
	move.l	a1,-(sp)
	move.l	d4,-(sp)
	jsr	(SYSCALL_0250_Sel設定_ストーリー番号)
	addq.w	#8,sp
	jsr	(乱数発生)
	cmp.l	#$00003e80,d0
	ble	L006074
	pea.l	($0001)
	bra	L006078
L006074:
	pea.l	($0002)
L006078:
	move.l	d4,-(sp)
	jsr	(SYSCALL_0234_Sel設定_同キャラ識別番号)
	addq.w	#8,sp
L006082:
	move.l	a6,-(sp)
	lea.l	(L00b168),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	movea.l	d4,a1
	move.w	($000c,a1),d1
	cmp.w	($000c,a6),d1
	bne	L0060ea
	move.w	($001a,a1),d1
	cmp.w	($001a,a6),d1
	bne	L0060ea
	tst.w	($002a,a6)
	beq	L0060c2
	move.w	($001a,a1),d0
	subq.w	#1,d0
	eori.w	#$0001,d0
	addq.w	#1,d0
	move.w	d0,($001a,a1)
	bra	L0060ea
L0060c2:
	movea.l	d4,a1
	tst.w	($002a,a1)
	beq	L0060dc
	move.w	($001a,a6),d0
	subq.w	#1,d0
	eori.w	#$0001,d0
	addq.w	#1,d0
	move.w	d0,($001a,a6)
	bra	L0060ea
L0060dc:
	move.w	#$0001,($001a,a6)
	movea.l	d4,a1
	move.w	#$0002,($001a,a1)
L0060ea:
	jsr	(L00b192)
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	lea.l	(L008bf8),a3
	jsr	(a3)
	addq.w	#8,sp
	movea.l	d4,a1
	movea.w	($000c,a1),a1
	move.l	a1,-(sp)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	lea.l	(SR_REG_キャラクタディレクトリ名取得),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d0,-(sp)
	pea.l	($000e,a6)
	lea.l	(XCLIB_strcpy),a4
	jsr	(a4)
	addq.w	#8,sp
	movea.l	d4,a1
	movea.w	($000c,a1),a1
	move.l	a1,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	move.l	d0,-(sp)
	movea.l	d4,a1
	pea.l	($000e,a1)
	jsr	(a4)
	addq.w	#8,sp
	lea.l	(SFSYSINFO_047c_セレクタ動作モード),a0
	btst.b	#$00,(a0)
	bne	L00615a
	btst.b	#$03,(a0)
	beq	L006172
L00615a:
	pea.l	($0000)
	pea.l	($0005)
	pea.l	(WORK_3P_0000)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
L006172:
	lea.l	(SFSYSINFO_0066_xxxx),a0
	tst.w	(a0)
	bne	L0061b4
	move.w	#$0200,($0416,a0)

	L005e18(WORK_3P_0000, WORK_4P_0000, 5);

	pea.l	($0000)
	pea.l	($0005)
	pea.l	(WORK_3P_0000)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
L0061b4:
	clr.w	(SFSYSINFO_0472_xxxx)
	bra	L006466
L0061be:
	cmp.w	#$0001,d3
	bne	L0062b8
	lea.l	(SFSYSINFO_047c_セレクタ動作モード),a3
	move.w	#$0400,(a3)
	ori.w	#$0001,(a3)
	ori.w	#$0002,(a3)
	ori.w	#$0004,(a3)
	ori.w	#$0008,(a3)

	L005e18(WORK_3P_0000, WORK_4P_0000, 5);

	move.l	a6,-(sp)
	lea.l	(L00b168),a5
	jsr	(a5)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a5)
	addq.w	#4,sp
	jsr	(L00b192)
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	lea.l	(L008bf8),a5
	jsr	(a5)
	addq.w	#8,sp
	movea.l	d4,a1
	movea.w	($000c,a1),a1
	move.l	a1,-(sp)
	move.l	d4,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	lea.l	(SR_REG_キャラクタディレクトリ名取得),a5
	jsr	(a5)
	addq.w	#4,sp
	move.l	d0,-(sp)
	pea.l	($000e,a6)
	lea.l	(XCLIB_strcpy),a6
	jsr	(a6)
	addq.w	#8,sp
	movea.l	d4,a1
	movea.w	($000c,a1),a1
	move.l	a1,-(sp)
	jsr	(a5)
	addq.w	#4,sp
	move.l	d0,-(sp)
	movea.l	d4,a1
	pea.l	($000e,a1)
	jsr	(a6)
	addq.w	#8,sp
	pea.l	($0000)
	pea.l	($0005)
	pea.l	(WORK_3P_0000)
	lea.l	(L0138ac),a5
	jsr	(a5)
	lea.l	($000c,sp),sp
	move.w	#$0200,(a3)

	L005e18(WORK_3P_0000, WORK_4P_0000, 5);

	pea.l	($0000)
	pea.l	($0005)
	pea.l	(WORK_3P_0000)
	jsr	(a5)
	lea.l	($000c,sp),sp
	bra	L006466
L0062b8:
	cmp.w	#$0009,d3
	beq	L0062d8
	cmp.w	#$0003,d3
	beq	L0062d8
	cmp.w	#$0004,d3
	beq	L0062d8
	cmp.w	#$0005,d3
	beq	L0062d8
	cmp.w	#$0006,d3
	bne	L00636a
L0062d8:
	pea.l	($0001)
	move.l	a6,-(sp)
	lea.l	(SYSCALL_0230_Sel設定_キャラクタ番号),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	a6,-(sp)
	lea.l	(SYSCALL_0250_Sel設定_ストーリー番号),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	a6,-(sp)
	lea.l	(SYSCALL_0234_Sel設定_同キャラ識別番号),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.l	a6,-(sp)
	lea.l	(L00b168),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	cmp.w	#$0005,d3
	beq	L006466
	cmp.w	#$0006,d3
	beq	L006466
	pea.l	($0001)
	jsr	(SYSCALL_0238_Sel設定_ステージ番号)
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(SYSCALL_023c_Sel設定_全体ストーリー番号)
	addq.w	#4,sp
	jsr	(L00b192)
	bra	L006466
L00636a:
	cmp.w	#$0002,d3
	bne	L006466
	movea.w	($176a,a6),a4
	movea.w	($176c,a6),a3
	move.w	($001a,a6),d3
	move.w	a3,(SFSYSINFO_0064_全体ストーリー番号)
	clr.w	($0a86,a6)
	movea.l	d4,a1
	clr.w	($0a86,a1)
	clr.w	($001a,a6)
	clr.w	($001a,a1)
	clr.w	($002a,a6)
	clr.w	($002a,a1)
	movea.w	a4,a4
	move.l	a4,-(sp)
	move.l	a6,-(sp)
	lea.l	(SYSCALL_0230_Sel設定_キャラクタ番号),a5
	jsr	(a5)
	addq.w	#8,sp
	movea.w	a3,a3
	move.l	a3,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_0250_Sel設定_ストーリー番号)
	addq.w	#8,sp
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_0234_Sel設定_同キャラ識別番号)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a5)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(SYSCALL_0250_Sel設定_ストーリー番号)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(SYSCALL_0234_Sel設定_同キャラ識別番号)
	addq.w	#8,sp
	move.l	a4,-(sp)
	jsr	(SYSCALL_0238_Sel設定_ステージ番号)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(SYSCALL_023c_Sel設定_全体ストーリー番号)
	addq.w	#4,sp
	move.l	a6,-(sp)
	lea.l	(L00b168),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	jsr	(L00b192)
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	lea.l	(L008bf8),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(-$0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	movea.w	($000c,a6),a1
	move.l	a1,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)
	addq.w	#4,sp
	move.l	d0,-(sp)
	pea.l	($000e,a6)
	lea.l	(XCLIB_strcpy),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L005e80)
	movea.l	d4,a1
	pea.l	($000e,a1)
	jsr	(a3)
	addq.w	#8,sp
L006466:
	movem.l	(sp)+,d3-d4/a3-a6
	rts

L00646c:
	.dc.b	'DEMO',$00,$00
L006472:
	.dc.b	'V.S.',$00,$00
L006478:
	.dc.b	'STORY',$00
L00647e:
	.dc.b	'CPU',$00
L006482:
	.dc.b	'MAN',$00
L006486:
	.dc.b	'%S : %-8S(%S) vs %-8S(%S) -> ',$00,$00,$00
L0064a6:
	link	a6,#-$0080
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0008,a6),a4
	movea.l	($000c,a6),a3
	move.w	($0012,a6),d3
	bne	L0064c8
	cmpi.w	#$0002,(SFSYSINFO_0014_xxxx)
	beq	L00657c
L0064c8:
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(L008284)
	addq.w	#8,sp
	tst.w	d3
	beq	L0064e0
	cmp.w	#$0001,d3
	bne	L00657c
L0064e0:
	cmp.w	#$0001,d3
	bne	L0064ee
	move.l	#L00646c,d3
	bra	L006504
L0064ee:
	tst.w	(SFSYSINFO_0066_xxxx)
	beq	L0064fe
	move.l	#L006472,d3
	bra	L006504
L0064fe:
	move.l	#L006478,d3
L006504:
	tst.w	($0a86,a3)
	beq	L006512
	move.l	#L00647e,d0
	bra	L006518
L006512:
	move.l	#L006482,d0
L006518:
	move.l	d0,-(sp)
	movea.w	($000c,a3),a0
	move.l	a0,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)
	addq.w	#4,sp
	move.l	d0,-(sp)
	tst.w	($0a86,a4)
	beq	L006538
	move.l	#L00647e,d0
	bra	L00653e
L006538:
	move.l	#L006482,d0
L00653e:
	move.l	d0,-(sp)
	movea.w	($000c,a4),a0
	move.l	a0,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	d3,-(sp)
	pea.l	(L006486)
	moveq.l	#$80,d3
	add.l	a6,d3
	move.l	d3,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($001c,sp),sp
	move.l	d3,-(sp)
	pea.l	($0002)
	jsr	(L005bb0)
	addq.w	#8,sp
	jsr	(L00b558)
L00657c:
	movem.l	(-$008c,a6),d3/a3-a4
	unlk	a6
	rts

L006586:
	movem.l	d3-d4/a3-a5,-(sp)
	movea.l	($0018,sp),a5
	move.l	($001c,sp),d4
	move.w	($0022,sp),d3
	bne	L0065a4
	cmpi.w	#$0002,(SFSYSINFO_0014_xxxx)
	beq	L0067d0
L0065a4:
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	jsr	(L0082c8)
	addq.w	#8,sp
	move.l	a5,-(sp)
	lea.l	(L019cba),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	jsr	(SR_システムPCG2_SP読み込み・登録)
	tst.w	d3
	beq	L0065da
	cmp.w	#$0002,d3
	beq	L0065da
	cmp.w	#$0001,d3
	bne	L0066be
L0065da:
	jsr	(L01a0ee)
	cmp.w	#$0002,d3
	bne	L006646
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	cmpi.w	#$0001,(SFSYSINFO_0474_場面_エンディング)
	bne	L006646
	movea.w	($176a,a5),a1
	move.l	a1,-(sp)
	movea.w	($176c,a5),a1
	move.l	a1,-(sp)
	pea.l	($0008)
	pea.l	($000c)
	move.l	a5,-(sp)
	jsr	(SYSCALL_024c_Sel表示_ＢＧネーム)
	lea.l	($0014,sp),sp
L006646:
	movea.w	d3,a3
	move.l	a3,-(sp)
	move.l	a5,-(sp)
	lea.l	(L013816),a4
	jsr	(a4)
	addq.w	#8,sp
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(a4)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	a5,-(sp)
	lea.l	(SYSCALL_0190_Pal設定_PCG色),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.l	a5,-(sp)
	lea.l	(L019fec),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	cmp.w	#$0002,d3
	beq	L0066a8
	pea.l	($0000)
	pea.l	($0006)
	pea.l	(WORK_3P_0000)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
L0066a8:
	jsr	(L0137f0)
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(L01305c)
	addq.w	#4,sp
	bra	L0067d0
L0066be:
	cmp.w	#$0009,d3
	beq	L0066d8
	cmp.w	#$0003,d3
	beq	L0066d8
	cmp.w	#$0005,d3
	beq	L0066d8
	cmp.w	#$0006,d3
	bne	L0067ac
L0066d8:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	jsr	(L013816)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	a5,-(sp)
	lea.l	(SYSCALL_0190_Pal設定_PCG色),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.l	a5,-(sp)
	lea.l	(L019fec),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	move.l	a5,-(sp)
	jsr	(SR_PCG_SP_読み込み・登録)
	addq.w	#4,sp
	move.l	a5,-(sp)
	jsr	(SR_キャラクター身体パレット設定)
	addq.w	#4,sp
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	jsr	(L014ec6)
	addq.w	#8,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	lea.l	(MMP_SYS_0255_xxxx),a0
	move.l	(a0),(L06f432)
	beq	L006774
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	movea.l	(a0),a0
	jsr	(a0)
	addq.w	#8,sp
L006774:
	jsr	(L007a22)
	lea.l	(MMP_SYS_0253_xxxx),a0
	move.l	(a0),(L06f432)
	beq	L006792
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	movea.l	(a0),a0
	jsr	(a0)
	addq.w	#8,sp
L006792:
	move.l	a5,-(sp)
	lea.l	(SR_燃焼状態セル生成),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	jsr	(L01c4e6)
	bra	L0067d0
L0067ac:
	cmp.w	#$0004,d3
	bne	L0067d0
	jsr	(L007a22)
	lea.l	(MMP_SYS_0160_OPEN_タイトル画面),a0
	move.l	(a0),(L06f432)
	beq	L0067d0
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	movea.l	(a0),a0
	jsr	(a0)
	addq.w	#8,sp
L0067d0:
	movem.l	(sp)+,d3-d4/a3-a5
	rts

L0067d6:
	movem.l	d3/a3-a6,-(sp)
	movea.l	($0018,sp),a5				;arg1
	movea.l	($001c,sp),a6				;arg2
	move.w	($0022,sp),d3				;arg3

	L0082ec(p1, p2);
	L06f42a = 0;

	L015b7a(p1, p2);
	L015b7a(p2, p1);

	SR_キャラクター身体パレット設定(p1);
	SR_キャラクター身体パレット設定(p2);

	L013026();

	moveq.l	#$00,d1

	p2->0acc_スティック直接状態 = 0;
	p1->0acc_スティック直接状態 = 0;
	p2->0a42_攻撃過程値 = 0;
	p1->0a42_攻撃過程値 = 0;

	tst.w	d3
	beq	L00684a
	cmp.w	#$0001,d3
	beq	L00684a
	cmp.w	#$0002,d3
	bne	L006b08
L00684a:
	move.w	#$0002,(SFSYSINFO_0014_xxxx)
	cmp.w	#$0002,d3
	beq	L006898
	
	if (p1->0a86_CPU制御状態) {
		if (p1->1244_CPU_アイドル歩行)
			p1->1244_CPU_アイドル歩行(p1, p2);
		p1->0acc_スティック直接状態 = p1->0a8e_xxxx;
	}

L006878:
	if (p2->0a86_CPU制御状態) {
		if (p2->1244_CPU_アイドル歩行)
			p2->1244_CPU_アイドル歩行(p2, p1);
		p2->0acc_スティック直接状態 = p2->0a8e_xxxx;
	}

L006898:
	SYSCALL_01e4_Scr設定_表示面(0);

	tst.w	d3
	bne	L0068fc
	lea.l	(SFSYSINFO_001a_ラウンド番号),a0
	addq.w	#1,(a0)
	cmpi.w	#$0009,(a0)
	ble	L0068ba
	move.w	#$0009,(a0)
L0068ba:
	cmpi.w	#$0001,(SFSYSINFO_001a_ラウンド番号)
	ble	L0068e6

	L013384();
	SYSCALL_01e8_Scr設定_ＢＧマスク(0, 0);
	SR_ゲージ・タイム・インジケータ・勝ち数表示(p1, p2);

L0068e6:
	lea.l	(SFSYSINFO_0036_ステージループ有効),a0
	tst.w	(a0)
	beq	L006996
	move.w	#$0001,(-$001c,a0)			;SFSYSINFO_0x1a
	bra	L006996
L0068fc:
	cmp.w	#$0001,d3
	bne	L006946

	if (乱数発生() <= 0x3e7f) {
		p1->002c_勝ち数 = 1;
	}
L006916:
	if (乱数発生() <= 0x3e7f) {
		p2->002c_勝ち数 = 1;
	}
L00692a:
	SFSYSINFO_001a_ラウンド番号 = p1->002c_勝ち数 + p2->002c_勝ち数 + 1;
	SR_ゲージ・タイム・インジケータ・勝ち数表示(p1, p2);

	bra	L006994
L006946:
	cmp.w	#$0002,d3
	bne	L006996
	cmpi.w	#$0001,(SFSYSINFO_0474_場面_エンディング)
	bne	L006996

	SYSCALL_0044_キャラクタ向かい合わせ設定(p1, p2);

	SYSCALL_0110_Cmd実行_動作(p2, ACT_ターゲット0, 1);

	p1->09fe_連続技同期値 = 0;
	SYSCALL_0000_セル設定_表示(p1, CELL_透明);

	SR_キャラ動作関数実行(p1, SUB_連続技);

L006994:
	addq.w	#8,sp
L006996:
	p1->1758_xxxx = DRCT_右;
	p1->09e8_動作方向 = DRCT_右;
	p1->01b8_相対方向 = DRCT_右;

	p2->1758_xxxx = DRCT_左;
	p2->09e8_動作方向 = DRCT_左;
	p2->01b8_相対方向 = DRCT_左;

	SYSCALL_01c8_状態設定_表示方向(p1, DRCT_右);
	SYSCALL_01c8_状態設定_表示方向(p2, DRCT_左);

	d0 = L009138(SFSYSINFO_0016_ステージ番号);

	movea.l	d0,a0
	move.w	($005c,a0),d0
	move.w	d0,($003c,a3)				SFSYSINFO_0x0056
	move.w	d0,($003a,a3)				SFSYSINFO_0x0054
	cmpi.w	#$0002,($045e,a3)			SFSYSINFO_0x0478
	bne	L006a02
	pea.l	($0000)
	bra	L006a08
L006a02:
	movea.w	($005a,a0),a1
	move.l	a1,-(sp)
L006a08:
	jsr	(L01360e)
	addq.w	#4,sp
	tst.w	(SFSYSINFO_000c_ゲームスピード)
	beq	L006a1e
	jsr	(SR_タイマーD割込み設定)
L006a1e:
	jsr	(SR_ラスター割込み設定開始)
	tst.w	d3
	beq	L006a2e
	cmp.w	#$0001,d3
	bne	L006a58
L006a2e:
	lea.l	(SFSYSINFO_001e_デバッグモード有効フラグ),a0
	tst.w	(a0)
	beq	L006a4a
	tst.w	($0050,a0)				;SFSYSINFO_006e_デバッグCPU制御
	beq	L006a4a
	move.w	#$0001,($0a86,a6)		;p2->0a86_CPU制御状態
	move.w	#$0001,($0a86,a5)		;p1->0a86_CPU制御状態
L006a4a:
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	jsr	(L000fc2)					;L000fc2(a5, a6);
	bra	L006ae0
L006a58:
	cmp.w	#$0002,d3
	bne	L006ae2
	cmpi.w	#$0001,(SFSYSINFO_0474_場面_エンディング)
	bne	L006a92
	move.w	#$0001,($01ba,a5)			;p1->01ba_ジャンプ方向 = DRCT_前;
	clr.w	($0ac2,a6)					;p2->0ac2_気集中
	clr.w	($0ac2,a5)					;p1->0ac2_気集中
	jsr	(SR_ステージパレット反映)						;SR_ステージパレット反映();
	pea.l	($000a)				;CELL_直立0
	move.l	a6,-(sp)
	jsr	(SYSCALL_0000_セル設定_表示)	;SYSCALL_0000_セル設定_表示(p2, CELL_直立0);
	addq.w	#8,sp
	jsr	(L0041fa)					;L0041fa();
L006a92:
	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);
	SYSCALL_0228_Scr設定_余白(0, 0, 2, 4);
	SYSCALL_01e8_Scr設定_ＢＧマスク(0, 0);
L006ae0:
	addq.w	#8,sp
L006ae2:
	cmpi.w	#$0002,(SFSYSINFO_0474_場面_エンディング)
	beq	L006af2
	pea.l	($0003)
	bra	L006af6
L006af2:
	pea.l	($0001)
L006af6:
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	move.w	#$0001,(SFSYSINFO_0070_XXXX)
	bra	L006b40
L006b08:
	cmp.w	#$0009,d3
	beq	L006b26
	cmp.w	#$0003,d3
	beq	L006b26
	cmp.w	#$0004,d3
	beq	L006b26
	cmp.w	#$0005,d3
	beq	L006b26
	cmp.w	#$0006,d3
	bne	L006b40
L006b26:
	pea.l	($0064)			;CELL_透明
	move.l	a5,-(sp)
	lea.l	(SYSCALL_0000_セル設定_表示),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0064)
	move.l	a6,-(sp)
	jsr	(a3)
	addq.w	#8,sp
L006b40:
	moveq.l	#$ff,d1
	move.l	d1,($0024,a6)
	move.l	d1,($0024,a5)
	movem.l	(sp)+,d3/a3-a6
	rts

L006b50:
	.dc.b	'Cancel',$0a,$00
L006b58:
	.dc.b	'PUSH TO START',$00
L006b66:
	.dc.b	'Time Over',$0a,$00,$00
L006b72:
	.dc.b	'Draw',$0a,$00
L006b78:
	link	a6,#-$0102
	movem.l	d3-d4/a3-a5,-(sp)
	movea.l	($0008,a6),a4		;p1
	movea.l	($000c,a6),a5		;p2
	move.w	($0012,a6),d0
	bne	L006c68
L006b90:
	L009c70();
	tst.w	($01cc,a4)	;p1->01cc_敗北状態
	beq	L006bb2
	d0 = L001e86(p1, p2);
	tst.w	d0
	beq	L006bf2
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	bra	L006bcc
L006bb2:
	tst.w	($01cc,a5)	;p1->01cc_敗北状態
	beq	L006bde
	d0 = L001e86(p2, p2);
	tst.w	d0
	beq	L006bf2
	move.l	a5,-(sp)
	move.l	a4,-(sp)
L006bcc:
	jsr	(L001308)
	addq.w	#8,sp
	tst.w	d0
	beq	L006bf2
L006bd8:
	moveq.l	#$01,d0
	bra	L007006			;return 1;
L006bde:
	tst.w	(L0690b4)
	beq	L006bf2
	L001eb4(p1, p2);
L006bf2:
	L0045e6();
	tst.w	($01cc,a4)		;p1->01cc_敗北状態
	bne	L006c22
	tst.w	($01cc,a5)		;p2->01cc_敗北状態
	bne	L006c22
	SR_状態設定_相対方向(p1, p2);
	SR_状態設定_相対方向(p2, p1);
	SR_ラウンドタイマーカウントダウン＆表示();
	bra	L006c50
L006c22:
	tst.w	($002e,a4)		;p1->002e_残り体力
	bge	L006c2e
	tst.w	($002c,a5)		;p2->002c_勝ち数
	bgt	L006c3a
L006c2e:
	tst.w	($002e,a5)		;p2->002e_残り体力
	bge	L006c50
	tst.w	($002c,a4)		;p1->002c_勝ち数
	ble	L006c50
L006c3a:
	tst.w	(SFSYSINFO_000c_ゲームスピード)
	beq	L006c4a
	SR_タイマーD割込み処理終了待ち();
	bra	L006c50
L006c4a:
	jsr	(SR_最終ラスター割込み終了待ち)
L006c50:
	d0 = L004f2e();
	tst.w	d0
	beq	L006b90
	move.w	#$ffff,(SFSYSINFO_0014_xxxx)
	bra	L006e7c
L006c68:
	cmp.w	#$0001,d0
	bne	L006e90
	moveq.l	#$80,d4
	add.l	a6,d4
	move.l	a6,d3
	add.l	#$ffffff00,d3
L006c7c:
	cmpi.w	#$003c,(L01fef2)
	bne	L006ca4

	SR_BG文字列表示(10, 23, "PUSH TO START", 0x0b00);

	bra	L006cc4
L006ca4:
	cmpi.w	#$001e,(L01fef2)
	bne	L006cc4
	SR_BG文字列消去(10, 23, 13);

L006cc4:
	subq.w	#1,(L01fef2)
	tst.w	(L01fef2)
	bgt	L006cda
	move.w	#$003c,(L01fef2)
L006cda:
	L009c70();
	tst.l	($0ad0,a4)	;p1->0ad0_xxxx
	bne	L006e66
	tst.l	($0ad0,a5)	;p2->0ad0_xxxx
	bne	L006e66
	tst.w	($01cc,a4)	;p1->01cc_敗北状態
	beq	L006d6e
	d0 = L00a4b8(p1, p2);
	tst.w	d0
	beq	L006dfc
	d0 = L00a468(p2, p1);
	tst.w	d0
	beq	L006dfc
	SYSCALL_0200_Bgm制御_フェードアウト();
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
	tst.w	(L0690b4)
	beq	L006d42
	pea.l	(L006b66)
	bra	L006e82
L006d42:
	tst.w	($002e,a4)
	bge	L006d58
	tst.w	($002e,a5)
	bge	L006d58
	pea.l	(L006b72)
	bra	L006e82
L006d58:
	SR_勝敗ログ文字列生成(p2, p1, d4);
	move.l	d4,-(sp)
	bra	L006e82
L006d6e:
	tst.w	($01cc,a5)	;p2->01cc_敗北状態
	beq	L006de8
	L00a4b8(p2, p1);
	tst.w	d0
	beq	L006dfc
	L00a468(p1, p2);
	tst.w	d0
	beq	L006dfc
	SYSCALL_0200_Bgm制御_フェードアウト();
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
	tst.w	(L0690b4)
	beq	L006dbc
	pea.l	(L006b66)
	bra	L006e82
L006dbc:
	tst.w	($002e,a4)
	bge	L006dd2
	tst.w	($002e,a5)
	bge	L006dd2
	pea.l	(L006b72)
	bra	L006e82
L006dd2:
	SR_勝敗ログ文字列生成(p1, p2, d3);
	move.l	d3,-(sp)
	bra	L006e82
L006de8:
	tst.w	(L0690b4)
	beq	L006dfc
	L001eb4(p1, p2);
L006dfc:
	L0045e6();
	tst.w	($01cc,a4)	;p1->01cc_敗北状態
	bne	L006e2c
	tst.w	($01cc,a5)	;p2->01cc_敗北状態
	bne	L006e2c
	SR_状態設定_相対方向(p1, p2);
	SR_状態設定_相対方向(p2, p1);
	SR_ラウンドタイマーカウントダウン＆表示();
	bra	L006e5a
L006e2c:
	tst.w	($002e,a4)	;p1->002e_残り体力
	bge	L006e38
	tst.w	($002c,a5)	;p2->002c_勝ち数
	bgt	L006e44
L006e38:
	tst.w	($002e,a5)	;p2->002e_残り体力
	bge	L006e5a
	tst.w	($002c,a4)	;p1->002c_勝ち数
	ble	L006e5a
L006e44:
	if (SFSYSINFO_000c_ゲームスピード)
		SR_タイマーD割込み処理終了待ち();
	else
		SR_最終ラスター割込み終了待ち();
L006e5a:
	d0 = L004f2e();
	tst.w	d0
	beq	L006c7c
L006e66:
	SYSCALL_0200_Bgm制御_フェードアウト();
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
L006e7c:
	pea.l	(L006b50)
L006e82:
	pea.l	($0002)
	jsr	(L005bb0)
	bra	L007004
L006e90:
	cmp.w	#$0002,d0
	bne	L006fa4
	moveq.l	#$00,d3
	cmpi.w	#$0002,(SFSYSINFO_0474_場面_エンディング)
	beq	L006bd8
L006ea6:
	cmpi.w	#$0001,($09fe,a4)	p1->09fe_連続技同期値
	bgt	L006ee0
	move.w	#$0001,($09e8,a4)	p1->09e8_xxxx
	move.w	#$0001,($01b8,a4)	p1->01b8_相対方向 = DRCT_右
	move.w	#$ffff,($09e8,a5)	p2->09e8_xxxx
	move.w	#$ffff,($01b8,a5)	p2->01b8_相対方向 = DRCT_左
	SYSCALL_01c8_状態設定_表示方向(p1, DRCT_右);
	SYSCALL_01c8_状態設定_表示方向(p2, DRCT_左);

L006ee0:
	L00ba06();
	tst.l	($0ad0,a4)	p1->0ad0_xxxx
	bne	L006f04
	tst.l	($0ad0,a5)	p2->0ad0_xxxx
	bne	L006f04
	d0 = XCLIB_dos_inpout(0x00ff);
	moveq.l	#$1b,d1
	cmp.l	d0,d1
	bne	L006f12
L006f04:
	pea.l	($0000)
	jsr	(XCLIB_dos_kflush(0)
	bra	L006bd8		;return 1;
L006f12:
	cmpi.w	#$0001,($09fe,a4)	;p1->09fe_連続技同期値
	bgt	L006f4c
	move.w	#$0001,($09e8,a4)	;p1->09e8_動作方向 = DRCT_右
	move.w	#$0001,($01b8,a4)	;p1->01b8_相対方向 = DRCT_右
	move.w	#$ffff,($09e8,a5)	;p2->0938_動作方向 = DRCT_左
	move.w	#$ffff,($01b8,a5)	;p2->01b8_相対方向 = DRCT_左
	SYSCALL_01c8_状態設定_表示方向(p1, DRCT_右);
	SYSCALL_01c8_状態設定_表示方向(p2, DRCT_左);
L006f4c:
	cmpi.w	#$0064,($09e2,a4)	;p1->09e2_動作ID == ACT_アイドル
	bne	L006f5e
	addq.w	#1,d3
	cmp.w	#$0040,d3
	bgt	L006bd8
L006f5e:
	cmpi.w	#$0100,($09fe,a4)	;p1->09fe_連続技同期値
	bne	L006ea6
	SYSCALL_0110_Cmd実行_動作(p1, ACT_アイドル, 1);
	moveq.l	#$1f,d3
L006f7e:
	SR_SHOT実行_CMD状態変化・表示(p1, p2);
	SR_キャラ動作関数実行(p1, SUB_直立);
	L0041fa();
	subq.w	#1,d3
	bpl	L006f7e
	bra	L007004
L006fa4:
	cmp.w	#$0009,d0
	beq	L006fbc
	cmp.w	#$0003,d0
	beq	L006fbc
	cmp.w	#$0005,d0
	beq	L006fbc
	cmp.w	#$0006,d0
	bne	L006fce
L006fbc:
	d0 = L007010(p1, p2, 0x00fc);	0x00fc=VCT_悲鳴処理？
	bra	L007006		;return d0;
L006fce:
	cmp.w	#$0004,d0
	bne	L007004
	clr.w	(-$0102,a6)
	bne	L006ffc
	move.l	a6,d3
	add.l	#$fffffefe,d3
L006fe2:
	move.l	d3,-(sp)
	pea.l	($00a1)
	jsr	(L00705e)
	addq.w	#8,sp
	jsr	(乱数発生)
	tst.w	(-$0102,a6)
	beq	L006fe2
L006ffc:
	move.w	(-$0102,a6),d0
	ext.l	d0
	bra	L007006
L007004:
	moveq.l	#$00,d0
L007006:
	movem.l	(-$0116,a6),d3-d4/a3-a5
	unlk	a6
	rts

L007010:
	link	a6,#-$0002
	movem.l	d3/a3,-(sp)
	move.w	($0012,a6),d0
	clr.w	(-$0002,a6)
	movea.l	($000c,a6),a0
	clr.w	($0a42,a0)
	movea.l	($0008,a6),a0
	clr.w	($0a42,a0)
	tst.w	(-$0002,a6)
	bne	L00704e
	move.l	a6,d3
	subq.l	#2,d3
	movea.w	d0,a3
L00703c:
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L00705e)
	addq.w	#8,sp
	tst.w	(-$0002,a6)
	beq	L00703c
L00704e:
	move.w	(-$0002,a6),d0
	ext.l	d0
	movem.l	(-$000a,a6),d3/a3
	unlk	a6
	rts

L00705e(d0, a6)
{
	L06f432 = *(MMP_SYS_ジャンプテーブル + d0 * 4);
	if (L06f432) {
		*a6 = 1;
		return;
	}

	WORK_4P_1324_思考完了フラグ = 0;
	WORK_3P_1324_思考完了フラグ = 0;
	WORK_4P_1740_防御キャンセル可能フラグ = 0;
	WORK_3P_1740_防御キャンセル可能フラグ = 0;

	SR_ヒット情報クリア(WORK_3P_0000);
	SR_ヒット情報クリア(WORK_4P_0000);

	SFSYSINFO_007a_セル前面表示フラグ = 0;
	WORK_4P_0f22_キャラ振動フラグ = 0;
	WORK_3P_0f22_キャラ振動フラグ = 0;

	SR_SHOT実行_CMD状態変化・表示(WORK_3P_0000, WORK_4P_0000);

	*L06f432(WORK_3P_0000, WORK_4P_0000, a6);

	SR_STC_TRG_直接状態更新(WORK_3P_0000);
	SR_STC_TRG_直接状態更新(WORK_4P_0000);

	L015c8c(WORK_3P_0000, WORK_4P_0000);

	if (WORK_3P_0ac2_気集中 == 0 && WORK_4P_0ac2_気集中 == 0) {
		if (WORK_3P_0A90_燃焼状態 > 0)
			L019f60(WORK_3P_0000);
		if (WORK_4P_0a90_燃焼状態 > 0)
			L019f60(WORK_4P_0000);

		if (WORK_3P_172e_無敵持続カウンタ > 0) {
			if (--WORK_3P_172e_無敵持続カウンタ == 0)
				WORK_3P_01c0_無敵状態 = 0;
		}
		if (WORK_4P_172e_無敵持続カウンタ > 0) {
			if (--WORK_4P_172e_無敵持続カウンタ == 0)
				WORK_4P_01c0_無敵状態 = 0;
		}
	}

	if (WORK_3P_1756_セル非表示フラグ == 0)
		SYSCALL_0000_セル設定_表示(WORK_3P_0000, WORK_3P_09ea_表示セルID);
	if (WORK_4P_1756_セル非表示フラグ == 0)
		SYSCALL_0000_セル設定_表示(WORK_4P_0000, WORK_4P_09ea_表示セルID);

	WORK_4P_1756_セル非表示フラグ = 0;
	WORK_3P_1756_セル非表示フラグ = 0;

	L00cb2a(WORK_3P_0000, WORK_4P_0000);

	if (WORK_3P_0ac2_気集中 == 0)
		L00c0be(WORK_3P_0000, WORK_4P_0000);
	if (WORK_4P_0ac2_気集中 == 0)
		L00c0be(WORK_4P_0000, WORK_3P_0000);

	if (WORK_3P_0ac2_気集中 == 0)
		SR_残像座標更新(WORK_3P_0000);
	if (WORK_4P_0ac2_気集中 == 0)
		SR_残像座標更新(WORK_4P_0000);

	if (WORK_3P_0008_Y座標 > BASE_LINE-1) {
		WORK_3P_1754_xxxx = 0;
		if (WORK_3P_0f1a_シューティングモード == 0)
			WORK_3P_0008_Y座標 = BASE_LINE;
	} else {
		WORK_3P_1754_xxxx = 1;
	}
	if (WORK_4P_0008_Y座標 > BASE_LINE-1) {
		WORK_4P_1754_xxxx = 0;
		if (WORK_4P_0f1a_シューティングモード == 0)
			WORK_4P_0008_Y座標 = BASE_LINE;
	} else {
		WORK_4P_1754_xxxx = 1;
	}

	if (SFSYSINFO_001e_デバッグモード有効フラグ) {
		if (SFSYSINFO_0484_デバッグ_パラメータ表示)
			SR_デバッグパラメータ表示();
		if (SFSYSINFO_004c_デバッグ_スローモーション有効)
			SR_VDISP回数指定待機(4);
	}

	L017f8c(WORK_3P_0000, WORK_4P_0000);

	SR_キャラクタ身体・残像・影表示(WORK_3P_0000, -1);
	SR_キャラクタ身体・残像・影表示(WORK_4P_0000, -1);

	SR_最終ラスター割込み終了待ち();

	SR_SET_STAGE_XY(0, 32, 0, 32, 0, 32);
	SR_スプライトスクロールレジスタ一括更新();
	
	L0040d0(WORK_3P_0000, WORK_4P_0000);
	L0040d0(WORK_4P_0000, WORK_3P_0000);
}

L007342:
	movem.l	d3-d4/a3-a5,-(sp)
	movea.l	($0018,sp),a4	;p1
	movea.l	($001c,sp),a5	;p2
	move.w	($0022,sp),d0	;arg3

	if (d0 == 100) {
		d4 = 0;
		d3 = 0;
		while (d3 == 0 || d4 == 0) {
			L003f12(p1, p2);

			p2->1324_思考完了フラグ = 0;
			p1->1324_思考完了フラグ = 0;
			p2->1740_防御キャンセル可能フラグ = 0;
			p1->1740_防御キャンセル可能フラグ = 0;
			SR_ヒット情報クリア(p1);
			SR_ヒット情報クリア(p2);

			SFSYSINFO_007a_セル前面表示フラグ = 0;
			p2->0f22_キャラ振動フラグ = 0;
			p1->0f22_キャラ振動フラグ = 0;
			SR_SHOT実行_CMD状態変化・表示(p1, p2);

			if (d4 == 0 && p1->090c_OPT_登場) {
				SR_キャラ動作関数実行(p1, OPT_登場);
				if (p1->09ee_カウンタ現在値 <= 0)
					d4 = 1;
			} else {
				p1->01b8_相対方向 = DRCT_前;
				SYSCALL_01c8_状態設定_表示方向(p1, 1);

				SR_キャラ動作関数実行(p1, SUB_直立);

				p1->01b8_相対方向 = DRCT_前;
				SYSCALL_01c8_状態設定_表示方向(p1, 1);
				
				d4 = 1;
			}

			if (d3 == 0 && p2->090c_OPT_登場) {
				SR_キャラ動作関数実行(p2, OPT_登場);
				if (p2->09ee_カウンタ現在値 <= 0)
					d3 = 1;
			} else {
				p2->01b8_相対方向 = DRCT_後;
				SYSCALL_01c8_状態設定_表示方向(p2, DRCT_後);

				SR_キャラ動作関数実行(p2, SUB_直立);

				p2->01b8_相対方向 = DRCT_後;
				SYSCALL_01c8_状態設定_表示方向(p2, DRCT_後);
			}

			SR_STC_TRG_直接状態更新(p1);
			SR_STC_TRG_直接状態更新(p2);

			L015c8c(p1, p2);

			if (p1->0ac2_気集中 == 0 && p2->0ac2_気集中 == 0) {
				if (p1->0a90_燃焼状態 > 0)
					L019f60(p1);
				if (p2->0a90_燃焼状態 > 0)
					L019f60(p2);

				if (p1->172e_無敵持続カウンタ > 0 && --p1->172e_無敵持続カウンタ <= 0)
					p1->172e_無敵持続カウンタ = 0;
				if (p2->172e_無敵持続カウンタ > 0 && --p2->172e_無敵持続カウンタ <= 0)
					p2->172e_無敵持続カウンタ = 0;
			}

			if (p1->1756セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p1, p1->09ea_表示セルID);
			if (p2->1756セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p2, p2->09ea_表示セルID);

			p2->1756_セル非表示フラグ = 0;
			p1->1756_セル非表示フラグ = 0;
			L00cb2a(p1, p2);
			SR_キャラ動作関数実行(p1, OPT_サイクル２);
			SR_キャラ動作関数実行(p2, OPT_サイクル２);

			if (p1->0ac2_気集中 == 0)
				L00c0be(p1, p2);
			if (p2->0ac2_気集中 == 0)
				L00c0be(p2, p1);

			if (p1->0ac2_気集中 == 0)
				SR_残像座標更新(p1);
			if (p2->0ac2_気集中 == 0)
				SR_残像座標更新(p2);

			if (p1->0008_Y座標 > BASE_LINE-1) {
				p1->1754_xxxx = 0;
				if (p1->0f1a_シューティングモード == 0)
					p1->0008_Y座標 = BASE_LINE;
			} else {
				p1->1754_xxxx = 1;
			}

			if (p2->0008_Y座標 > BASE_LINE-1) {
				p2->1754_xxxx = 0;
				if (p2->0f1a_シューティングモード == 0)
					p2->0008_Y座標 = BASE_LINE;
			} else {
				p2->1754_xxxx = 1;
			}

			SR_ラウンド開始前スクロール演出(1);
			SYSCALL_01e4_Scr設定_表示面(3);
		}
		return 1;
	}

	if (d0 == 101) {
		d3 = 0;
		{
			L003f12(p1, p2);

			p2->1324_思考完了フラグ = 0;
			p1->1324_思考完了フラグ = 0;
			p2->1740_防御キャンセル可能フラグ = 0;
			p1->1740_防御キャンセル可能フラグ = 0;

			SR_ヒット情報クリア(p1);
			SR_ヒット情報クリア(p2);

			SFSYSINFO_007a_セル前面表示フラグ = 0;

			p2->0f22_キャラ振動フラグ = 0;
			p1->0f22_キャラ振動フラグ = 0;

			SR_SHOT実行_CMD状態変化・表示(p1, p2);

			SR_キャラ動作関数実行(p1, SUB_勝利);

			d0 = 0;
			if (d3 == 0)
				SR_ステージX座標更新(p1, p2);

			if (d0 == 0) d3 = 1;

			SR_STC_TRG_直接状態更新(p1);
			SR_STC_TRG_直接状態更新(p2);

			L015c8c(p1, p2);

			if (p1->0ac2_気集中 == 0 && p2->0ac2_気集中 == 0) {
				if (p1->0a90_燃焼状態 > 0)
					L019f60(p1);
				if (p2->0a90_燃焼状態 > 0)
					L019f60(p2);

				if (p1->172e_無敵持続カウンタ > 0 && --p1->172e_無敵持続カウンタ <= 0)
					p1->172e_無敵持続カウンタ = 0;
				if (p2->172e_無敵持続カウンタ > 0 && --p2->172e_無敵持続カウンタ <= 0)
					p2->172e_無敵持続カウンタ = 0;
			}

			if (p1->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p1, p1->09ea_表示セルID);
			if (p2->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p2, p2->09ea_表示セルID);

			p1->1756_セル非表示フラグ = 0;
			p2->1756_セル非表示フラグ = 0;

			L00cb2a(p1, p2);

			SR_キャラ動作関数実行(p1, OPT_サイクル２);
			SR_キャラ動作関数実行(p2, OPT_サイクル２);

			if (p1->0ac2_燃焼状態 == 0)
				L00c0be(p1, p2);
			if (p2->0ac2_燃焼状態 == 0)
				L00c0be(p2, p1);

			if (p1->0ac2_燃焼状態 == 0)
				SR_残像座標更新(p1);
			if (p2->0ac2_燃焼状態 == 0)
				SR_残像座標更新(p2);

			if (p1->0008_Y座標 > BASE_LINE-1) {
				p1->1754_xxxx = 0;
				if (!p1->0f1a_シューティングモード)
					p1->0008_Y座標 = BASE_LINE;
			} else {
				p1->1754_xxxx = 1;
			}

			if (p2->0008_Y座標 > BASE_LINE-1) {
				p2->1754_xxxx = 0;
				if (!p2->0f1a_シューティングモード)
					p2->0008_Y座標 = BASE_LINE;
			} else {
				p2->1754_xxxx = 1;
			}

			L0041fa();
			L0040d0(p1, p2);
			L0040d0(p2, p1);

			if (p1->09ee_カウンタ現在値 <= 0 && d3 != 0)
				return 1;
		}
	}
	if (d0 == 102) {
		for (d3 = 0; d3 < 63; d3++) {
			L00402c(p1, p2);

			SR_ヒット情報クリア(p1);
			SR_ヒット情報クリア(p2);

			SFSYSINFO_007a_セル前面表示フラグ = 0;
			p2->0f22_キャラ振動フラグ = 0;
			p1->0f22_キャラ振動フラグ = 0;

			SR_SHOT実行_CMD状態変化・表示(p1, p2);

			SR_キャラ動作関数実行(p1, SUB_直立);

			SR_STC_TRG_直接状態更新
			SR_STC_TRG_直接状態更新

			L015c8c(p1, p2);

			if (p1->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p1, p1->09ea_表示セルID);
			if (p2->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p2, p2->09ea_表示セルID);

			p2->1756_セル非表示フラグ = 0;
			p1->1756_セル非表示フラグ = 0;

			L00cb2a(p1, p2);

			SR_キャラ動作関数実行(p1, OPT_サイクル２);

			if (p1->0ac2_気集中 == 0)
				jsr	(SR_残像座標更新(p1);

			if (p1->0008_Y座標 > BASE_LINE-1) {
				p1->1754_xxxx = 0;
				if (p1->0f1a_シューティングモード == 0) {
					p1->0008_Y座標 = BASE_LINE;
				}
			} else {
				p1->1754_xxxx = 1;
			}

			L0043f0();
		}

		p1->0a42_攻撃過程値 = 0;

		do {
			L00402c(p1, p2);

			SR_ヒット情報クリア(p1);
			SR_ヒット情報クリア(p2);

			SFSYSINFO_007a_セル前面表示フラグ = 0;
			p2->0f22_キャラ振動フラグ = 0;
			p1->0f22_キャラ振動フラグ = 0;

			SR_SHOT実行_CMD状態変化・表示(p1, p2);

			jsr	(SR_キャラ動作関数実行(p1, SUB_勝利);

			SR_STC_TRG_直接状態更新(p1);
			SR_STC_TRG_直接状態更新(p2);

			L015c8c(p1, p2);

			if (p1->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p1, p1->09ea_表示セルID);
			if (p2->1756_セル非表示フラグ == 0)
				SYSCALL_0000_セル設定_表示(p2, p2->09ea_表示セルID);

			p2->1756_セル非表示フラグ = 0;
			p1->1756_セル非表示フラグ = 0;

			L00cb2a(p1, p2);

			SR_キャラ動作関数実行(p1, OPT_サイクル２);

			if (p1->0ac2_気集中 == 0)
				(SR_残像座標更新(p1);

			if (p1->0008_Y座標 > BASE_LINE-1) {
				p1->1754_xxxx = 0;
				if (p1->0f1a_シューティングモード == 0)
					p1->0008_Y座標 = BASE_LINE;
			} else {
				p1->1754_xxxx = 1;
			}

			L0043f0();
		} while (p1->09ee_カウンタ現在値 > 0);

		for (d3 = 0; d3 < 1600; d3++) {
			L011116(p1, p2);

			SR_VDISP回数指定待機(1);

			if (p1->0ad0_xxxx || p2->0ad0_xxxx) break;
		}
		return 1;

	}

	return 1;
}

L0079de:
	movem.l	d0-d7/a0-a5,-(sp)
	movea.l	(L020acc),a0
	jsr	(a0)
	tst.w	(ラスター割込み処理実行中フラグ)
	bne	L007a1a
	tst.l	(L06f426)
	beq	L007a06
	pea.l	($0000)
	jsr	(L01c8b6)
	addq.w	#4,sp
L007a06:
	tst.l	(L06f422)
	beq	L007a1a
	pea.l	($0001)
	jsr	(L01c8b6)
	addq.w	#4,sp
L007a1a:
	movem.l	(sp)+,d0-d7/a0-a5
	rte

L007a20:
	rts

L007a22:
	lea.l	(MMP_SYS_0250_xxxx),a0
	move.l	(a0),(L020acc)
	beq	L007a56
	tst.w	(ラスター割込み設定状態)
	bne	L007a56
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	move.w	#$0080,d1
	lea.l	(L0079de),a1
	trap	#15
	andi.w	#$f8ff,sr
	move.w	#$0001,(ラスター割込み設定状態)
L007a56:
	rts
; SFXVIシステムコールジャンプテーブル初期化
L007a58:
	lea.l	(SFSYSINFO_002c_システムバージョン),a0
	move.w	#$01a4,(a0)			;420
	move.l	#SFSYSINFO_0488_キャラクタディレクトリパス,($002c,a0)
	move.l	#SFSYSINFO_0588_ステージディレクトリパス,($0030,a0)
	move.l	#SFSYSINFO_0688_xxxディレクトリパス,($0034,a0)
	move.l	#L021258,(L022bbe)
	move.l	#L021358,(L03495a)
	move.l	#L044f90,(L0467f6)
	move.l	#L044f90,(L058592)
	lea.l	(SYSCALL_ジャンプテーブル),a0
	move.l	#SYSCALL_0000_セル設定_表示,(a0)
	move.l	#SYSCALL_0004_Spr設定_表示,($0004,a0)
	move.l	#SYSCALL_0008_CPU関数実行,($0008,a0)
	move.l	#SYSCALL_000c_同期開始_気集中,($000c,a0)
	move.l	#SYSCALL_0010_同期完了_攻撃,($0010,a0)
	move.l	#SYSCALL_0014_同期完了_複合攻撃,($0014,a0)
	move.l	#SYSCALL_0018_座標設定_Ｘ移動,($0018,a0)
	move.l	#SYSCALL_001c_座標設定_Ｘ移動２,($001c,a0)
	move.l	#SYSCALL_0020_ゲージ減少_サブ,($0020,a0)
	move.l	#SYSCALL_0024_音声再生,($0024,a0)
	move.l	#SYSCALL_0028_XXXX,($0028,a0)
	move.l	#SYSCALL_002c_XXXX,($002c,a0)
	move.l	#SYSCALL_0030_コンボ設定_決定,($0030,a0)
	move.l	#SYSCALL_0034_同期開始_先制攻撃判定,($0034,a0)
	move.l	#SYSCALL_0038_状態設定_残り体力,($0038,a0)
	move.l	#SYSCALL_003c_XXXX,($003c,a0)
	move.l	#SYSCALL_0040_XXXX,($0040,a0)
	move.l	#SYSCALL_0044_キャラクタ向かい合わせ設定,($0044,a0)
	move.l	#SYSCALL_0048_ゲージ増加_サブ,($0048,a0)
	move.l	#SYSCALL_004c_乱数発生,($004c,a0)
	move.l	#SYSCALL_0050_演出表示_テキスト,($0050,a0)
	move.l	#SYSCALL_0054_ゲージ増減_体力,($0054,a0)
	move.l	#SYSCALL_0058_ゲージ増減_超技,($0058,a0)
	move.l	#SYSCALL_005c_XXXX,($005c,a0)
	move.l	#SYSCALL_0060_演出表示_ヒットマーク,($0060,a0)
	move.l	#SYSCALL_0064_演出表示_メッセージ,($0064,a0)
	move.l	#SYSCALL_0068_音声再生_標準,($0068,a0)
	move.l	#SYSCALL_006c_音声再生_ユーザ,($006c,a0)
	move.l	#SYSCALL_0070_XXXX,($0070,a0)
	move.l	#SYSCALL_0074_演出表示_砂煙,($0074,a0)
	move.l	#SYSCALL_02c4_気集中カウンタ_デクリメント,($0078,a0)
	move.l	#SYSCALL_007c_Cmd実行_防御,($007c,a0)
	move.l	#SYSCALL_0080_Cmd実行_ジャンプ,($0080,a0)
	move.l	#SYSCALL_0084_ゲージ表示_非標準,($0084,a0)
	move.l	#SYSCALL_0088_デフォルト身体影処理,($0088,a0)
	move.l	#SYSCALL_008c_XXXX,($008c,a0)
	move.l	#SYSCALL_0090_XXXX,($0090,a0)
	move.l	#SYSCALL_0094_CMD実行_地上基本技,($0094,a0)
	move.l	#SYSCALL_0098_CMD実行_空中基本技,($0098,a0)
	move.l	#SYSCALL_009c_CMD実行_地上必殺技,($009c,a0)
	move.l	#SYSCALL_00a0_CMD実行_空中必殺技,($00a0,a0)
	move.l	#SYSCALL_00a4_Shot登録_モジュール,($00a4,a0)
	move.l	#SYSCALL_00a8_Shot送信_コマンド,($00a8,a0)
	move.l	#SYSCALL_00ac_Shot設定_モジュール状態,($00ac,a0)
	move.l	#SYSCALL_00b0_座標設定_Ｙ移動,($00b0,a0)
	move.l	#SYSCALL_00b4_座標設定ＸＹ,($00b4,a0)
	move.l	#SYSCALL_00b8_座標設定ＸＹ_シューティングモード,($00b8,a0)
	move.l	#SYSCALL_00bc_座標設定_Ｙ移動_シューティングモード,($00bc,a0)
	move.l	#SYSCALL_00c0_状態設定_永続無敵,($00c0,a0)
	move.l	#SYSCALL_00c4_Cmd実行_歩行,($00c4,a0)
	move.l	#SYSCALL_00c8_Cmd実行_しゃがみ,($00c8,a0)
	move.l	#SYSCALL_00cc_演出設定_地面振動,($00cc,a0)
	move.l	#SYSCALL_00d0_Shot演出_ヒット音,($00d0,a0)
	move.l	#SYSCALL_00d4_Shot演出_ヒットマーク,($00d4,a0)
	move.l	#SYSCALL_00d8_同期完了_一般動作,($00d8,a0)
	move.l	#SYSCALL_00dc_ファイル読み込み,($00dc,a0)
	move.l	#SYSCALL_00e0_Pcg取得_コード,($00e0,a0)
	move.l	#SYSCALL_CMD実行_地上投げ,($00e4,a0)
	move.l	#SYSCALL_00e8_CMD実行_空中投げ,($00e8,a0)
	move.l	#SYSCALL_00ec_CMD条件_地上基本技,($00ec,a0)			; Cmd条件_地上基本技
	move.l	#SYSCALL_CMD条件_空中基本技,($00f0,a0)
	move.l	#SYSCALL_00f4_CMD条件_地上必殺技,($00f4,a0)
	move.l	#SYSCALL_00f8_Cmd条件_空中必殺技,($00f8,a0)
	move.l	#SYSCALL_00fc_CMD条件_地上投げ,($00fc,a0)
	move.l	#SYSCALL_0100_Cmd条件_空中投げ,($0100,a0)
	move.l	#SYSCALL_0104_CMD実行_受け身,($0104,a0)
	move.l	#SYSCALL_0108_状態取得_攻撃くらい,($0108,a0)
	move.l	#SYSCALL_010c_同期取得_防御,($010c,a0)
	move.l	#SYSCALL_0110_Cmd実行_動作,($0110,a0)
	move.l	#SYSCALL_0114_同期進行_防御,($0114,a0)
	move.l	#SYSCALL_0118_同期完了_防御,($0118,a0)
	move.l	#SYSCALL_011c_座標設定_間合調節,($011c,a0)
	move.l	#SYSCALL_0120_同期進行_ジャンプ着地,($0120,a0)
	move.l	#SYSCALL_0124_同期完了_ジャンプ,($0124,a0)
	move.l	#SYSCALL_0128_状態取得_しゃがみ,($0128,a0)
	move.l	#SYSCALL_012c_状態設定_しゃがみ,($012c,a0)
	move.l	#SYSCALL_0130_Cmd実行_CPU動作,($0130,a0)
	move.l	#SYSCALL_0134_演出設定_遅延ループ,($0134,a0)
	move.l	#SYSCALL_0038_座標取得_相手距離,($0138,a0)
	move.l	#SYSCALL_013c_攻撃設定_SHOT反射,($013c,a0)
	move.l	#SYSCALL_0140_XXXX,($0140,a0)
	move.l	#SYSCALL_0144_MMP登録_動作関数,($0144,a0)
	move.l	#SYSCALL_0148_場面取得_エンディング,($0148,a0)
	move.l	#SYSCALL_014c_セル登録_情報,($014c,a0)
	move.l	#SYSCALL_0150_Cnf取得_システム,($0150,a0)
	move.l	#SYSCALL_0154_同期開始_地上投げ,($0154,a0)
	move.l	#SYSCALL_0158_同期開始_地上投げられ,($0158,a0)
	move.l	#SYSCALL_015c_Pal設定_身体燃焼色,($015c,a0)
	move.l	#SYSCALL_0160_３２バイト転送,($0160,a0)
	move.l	#SYSCALL_0164_XXXX,($0164,a0)
	move.l	#SYSCALL_0168_Cmd実行_CPU動作2,($0168,a0)
	move.l	#SYSCALL_016c_Pal設定_表示データ,($016c,a0)
	move.l	#SYSCALL_0170_Pal取得_内部データ,($0170,a0)
	move.l	#SYSCALL_0174_同期完了_連続技,($0174,a0)
	move.l	#SYSCALL_0178_カウンタ設定_初期値,($0178,a0)
	move.l	#SYSCALL_017c_Spr取得_番号,($017c,a0)
	move.l	#SYSCALL_0180_Cmd実行_気絶,($0180,a0)
	move.l	#SYSCALL_0184_状態設定_起き上がり必殺技許可,($0184,a0)
	move.l	#SYSCALL_0188_同期完了_起き上がり,($0188,a0)
	move.l	#SYSCALL_018c_状態設定_セル前面表示,($018c,a0)
	move.l	#SYSCALL_0190_Pal設定_PCG色,($0190,a0)
	move.l	#SYSCALL_0194_残り時間,($0194,a0)
	move.l	#SYSCALL_0198_ヒット登録_情報,($0198,a0)
	move.l	#SYSCALL_019c_攻撃設定_ヒット情報,($019c,a0)
	move.l	#SYSCALL_01a0_攻撃設定_空中ヒット情報,($01a0,a0)
	move.l	#SYSCALL_01a4_ヒット取得_情報,($01a4,a0)
	move.l	#SYSCALL_01a8_セル取得_情報,($01a8,a0)
	move.l	#SYSCALL_01b0_Cnf登録_キャラクタ・ステージ・システム,($01b0,a0)
	move.l	#SYSCALL_01b4_Cnf取得_文字列,($01b4,a0)
	move.l	#SYSCALL_01b8_Cnf取得_整数,($01b8,a0)
	move.l	#SYSCALL_01bc_Cnf取得_存在,($01bc,a0)
	move.l	#SYSCALL_01c0_音声取得_残り時間,($01c0,a0)
	move.l	#SYSCALL_01c4_音声停止,($01c4,a0)
	move.l	#SYSCALL_01c8_状態設定_表示方向,($01c8,a0)
	move.l	#SYSCALL_01cc_Pcg転送_セル画像,($01cc,a0)
	move.l	#SYSCALL_01d0_Shot設定_セル座標,($01d0,a0)
	move.l	#SYSCALL_01d4_Shot設定_セル矩形,($01d4,a0)
	move.l	#SYSCALL_01d8_Shot設定_表示セル,($01d8,a0)
	move.l	#SYSCALL_01dc_Scr設定_画面モード,($01dc,a0)
	move.l	#SYSCALL_01e0_Scr設定_表示位置,($01e0,a0)
	move.l	#SYSCALL_01e4_Scr設定_表示面,($01e4,a0)
	move.l	#SYSCALL_01e8_Scr設定_ＢＧマスク,($01e8,a0)
	move.l	#SYSCALL_01ec_Scr描画_ＰＩＣファイル,($01ec,a0)
	move.l	#SYSCALL_01f0_Scr描画_矩形クリア,($01f0,a0)
	move.l	#SYSCALL_01f4_Scr描画_矩形クリア２,($01f4,a0)
	move.l	#SYSCALL_01f8_Bgm制御_停止,($01f8,a0)
	move.l	#SYSCALL_01fc_Bgm制御_再生,($01fc,a0)
	move.l	#SYSCALL_0200_Bgm制御_フェードアウト,($0200,a0)
	move.l	#SYSCALL_0204_Bgm取得_状態,($0204,a0)
	move.l	#SYSCALL_0208_Bgm展開_ＺＭＤファイル,($0208,a0)
	move.l	#SYSCALL_020c_Bgm展開_ＺＰＤファイル,($020c,a0)
	move.l	#SYSCALL_0210_Scr描画_ＧＲＰデータ,($0210,a0)
	move.l	#SYSCALL_0214_Scr設定_ＧＲＰパレット,($0214,a0)
	move.l	#SYSCALL_0218_Scr描画_ＧＲＰファイル,($0218,a0)
	move.l	#SYSCALL_021c_Pal変換_ＲＧＢ増減,($021c,a0)
	move.l	#SYSCALL_0220_Dataコピー_メモリブロック,($0220,a0)
	move.l	#SYSCALL_0224_Dataクリア_メモリブロック,($0224,a0)
	move.l	#SYSCALL_0228_Scr設定_余白,($0228,a0)
	move.l	#SYSCALL_022c_キャラハンドラ,($022c,a0)
	move.l	#SYSCALL_0230_Sel設定_キャラクタ番号,($0230,a0)
	move.l	#SYSCALL_0234_Sel設定_同キャラ識別番号,($0234,a0)
	move.l	#SYSCALL_0238_Sel設定_ステージ番号,($0238,a0)
	move.l	#SYSCALL_023c_Sel設定_全体ストーリー番号,($023c,a0)
	move.l	#SYSCALL_0240_Reg取得_登録状態,($0240,a0)
	move.l	#SYSCALL_0244_Sel取得_アイコン,($0244,a0)
	move.l	#SYSCALL_0248_Reg取得_ストーリー名,($0248,a0)
	move.l	#SYSCALL_024c_Sel表示_ＢＧネーム,($024c,a0)
	move.l	#SYSCALL_0250_Sel設定_ストーリー番号,($0250,a0)
	move.l	#SYSCALL_0254_Cnf設定_システム,($0254,a0)
	move.l	#SYSCALL_0258_Reg取得_ステージ情報,($0258,a0)
	move.l	#SYSCALL_025c_Data確保_メモリブロック,($025c,a0)
	move.l	#SYSCALL_0260_Data解放_メモリブロック,($0260,a0)
	move.l	#SYSCALL_0264_システム異常終了,($0264,a0)
	move.l	#SYSCALL_0268_Data取得_ファイルサイズ,($0268,a0)
	move.l	#SYSCALL_026c_Bgm確保_ＺＭＤメモリ,($026c,a0)
	move.l	#SYSCALL_0270_Stg取得_ハンドラ,($0270,a0)
	move.l	#SYSCALL_0274_Scr取得_スクリーン情報,($0274,a0)
	move.l	#SYSCALL_0278_Pcg取得_定義領域,($0278,a0)
	move.l	#SYSCALL_027c_Pal取得_表示データ,($027c,a0)
	move.l	#SYSCALL_0280_Spr設定_消去,($0280,a0)
	move.l	#SYSCALL_0284_状態取得_攻撃動作,($0284,a0)
	move.l	#SYSCALL_0288_Bgm制御_再生２,($0288,a0)
	move.l	#SYSCALL_028c_Scr描画_文字列,($028c,a0)
	move.l	#SYSCALL_0290_Scr描画_ヘルプ文字列,($0290,a0)
	move.l	#SYSCALL_0294_Sfxvi_fopen,($0294,a0)
	move.l	#SYSCALL_0298_Sfxvi_fgets,($0298,a0)
	move.l	#SYSCALL_029c_Sfxvi_fclose,($029c,a0)
	move.l	#SYSCALL_02a0_Sfxvi_strlen,($02a0,a0)
	move.l	#SYSCALL_02a4_Sfxvi_atoi,($02a4,a0)
	move.l	#SYSCALL_02a8_Scr設定_ＢＧ表示,($02a8,a0)
	move.l	#SYSCALL_02ac_Pcg設定_標準データ,($02ac,a0)
	move.l	#SYSCALL_02b0_Pcg設定_身体データ,($02b0,a0)
	move.l	#SYSCALL_02b4_Reg取得_PATH_キャラクタ,($02b4,a0)
	move.l	#SYSCALL_02b8_Reg取得_PATH_ステージ,($02b8,a0)
	move.l	#SYSCALL_02bc_Sfxvi_strcpy,($02bc,a0)
	move.l	#SYSCALL_02c0_Sfxvi_strcat,($02c0,a0)
	move.l	#SYSCALL_02c4_Sel更新_PATH_キャラクタ,($02c4,a0)
	rts

L008030:
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	move.w	#$0001,($000a,a0)
	move.w	#$0002,($000a,a1)
	move.l	a1,($132a,a0)
	move.l	a0,($132a,a1)
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	jsr	(L008070)
	addq.w	#8,sp
	rts

L00805a:
	.dc.b	'CHAR/',$00
L008060:
	.dc.b	'STAGE/',$00,$00
L008068:
	.dc.b	'./', 0, 0
L00806c:
	.dc.b	'STD', 0
L008070:
	movem.l	d3/a3-a6,-(sp)
	movea.l	($0018,sp),a6
	movea.l	($001c,sp),a5

	XCLIB_strcpy(SFSYSINFO_0488_キャラクタディレクトリパス, "CHAR/");
	XCLIB_strcpy(SFSYSINFO_0588_ステージディレクトリパス, "STAGE/");
	XCLIB_strcpy(SFSYSINFO_0688_xxxディレクトリパス, "./");
	SFSYSINFO_0004_PCMチャンネル数 = 16;

	moveq.l	#$00,d3
	lea.l	(L068e90),a4
	lea.l	(L068e98),a3
L0080c8:
	move.w	d3,d0
	ext.l	d0
	move.l	d0,d1
	add.l	d1,d1
	clr.w	(a4,d1.l)
	clr.w	(a3,d1.l)
	pea.l	(L00806c)	;"STD"
	asl.l	#7,d0
	add.l	#L068ea0,d0
	move.l	d0,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	addq.w	#1,d3
	cmp.w	#$0003,d3
	ble	L0080c8
	lea.l	(SFSYSINFO_007e_xxxx),a0
	moveq.l	#$00,d2
	move.l	d2,($0010,a0)
	move.l	d2,($000c,a0)
	move.l	d2,($0008,a0)
	move.l	d2,($0004,a0)
	move.l	d2,(a0)
	move.w	#$0001,(-$0076,a0)
	move.w	#$0001,(-$0050,a0)
	move.w	d2,(-$0072,a0)
	move.w	d2,(-$0040,a0)
	move.w	#$0001,(-$004c,a0)
	move.w	#$0001,(-$004a,a0)
	move.w	d2,(-$0046,a0)
	move.w	d2,(-$003c,a0)
	move.w	#$0001,(-$003e,a0)
	move.w	d2,(-$0048,a0)
	move.w	d2,(-$0074,a0)
	move.w	#$0001,(-$0038,a0)
	move.w	#$0001,(-$007c,a0)
	move.w	d2,(-$0042,a0)
	move.w	d2,(-$005e,a0)
	move.w	d2,(-$0060,a0)
	move.w	d2,(-$0010,a0)
	move.w	d2,($0404,a0)
	move.w	d2,($0406,a0)
	move.w	d2,(-$0034,a0)
	move.w	d2,(-$0032,a0)
	move.w	d2,(-$0030,a0)
	move.w	#$ffff,(-$006a,a0)
	move.w	d2,(-$006e,a0)
	move.w	d2,(-$006c,a0)
	move.w	d2,(-$0070,a0)
	move.w	d2,(-$003a,a0)
	move.w	d2,(-$004e,a0)
	move.w	d2,(-$005c,a0)
	move.w	d2,(-$0078,a0)
	move.w	d2,(-$0062,a0)

	p2->0004_xxxx = 0;
	p1->0004_xxxx = 0;
	p2->174a_xxxx = 0;
	p1->174a_xxxx = 0;
	p2->174e_xxxx = 0;
	p1->174e_xxxx = 0;

	move.l	d2,(L0690a0)
	move.w	d2,(L0690a4)
	move.l	d2,(L0690a6)
	move.w	#$ffff,(L0690aa)

	L0081e2(p1, p2);

	movem.l	(sp)+,d3/a3-a6
	rts

L0081e2:
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	lea.l	(SFSYSINFO_0028_xxxx),a2
	clr.w	(a2)
	clr.w	($0002,a2)
	move.w	#$0001,(-$0012,a2)
	move.w	#$0001,($003c,a2)
	clr.w	($003e,a2)
	clr.w	(-$001a,a2)
	lea.l	(SFSYSINFO_0000_xxxx),a2
	clr.w	(a2)
	clr.w	($0474,a2)
	clr.w	($0472,a2)
	clr.w	($0f1a,a1)
	clr.w	($0f1a,a0)
	move.w	#$0001,($0a86,a1)
	move.w	#$0001,($0a86,a0)
	move.w	#$0001,($000c,a0)
	move.w	#$0001,($000c,a1)
	move.w	#$0001,($176a,a0)
	move.w	#$0001,($176a,a1)
	move.w	#$0001,($176c,a0)
	move.w	#$0001,($176c,a1)
	clr.w	($001a,a1)
	clr.w	($001a,a0)
	clr.w	($002a,a1)
	clr.w	($002a,a0)
	clr.b	($000e,a1)
	clr.b	($000e,a0)
	clr.w	(現在の試合数1桁目)
	clr.w	(現在の試合数2桁目)
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	jsr	(L008284)
	addq.w	#8,sp
	rts

L008284:
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	clr.w	(SFSYSINFO_001a_ラウンド番号)
	clr.w	($002c,a1)
	clr.w	($002c,a0)
	clr.w	($0a9c,a1)
	clr.w	($0a9c,a0)
	clr.w	($0a9e,a1)
	clr.w	($0a9e,a0)
	clr.w	($0aa0,a1)
	clr.w	($0aa0,a0)
	clr.w	($0aa2,a1)
	clr.w	($0aa2,a0)
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	jsr	(L0082c8)
	addq.w	#8,sp
	rts

L0082c8:
	move.l	($0004,sp),d0
	move.l	($0008,sp),d1
	move.w	#$0001,(L0690b0)
	clr.w	(L0690b2)
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	jsr	(L0082ec)
	addq.w	#8,sp
	rts

L0082ec:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a5
	movea.l	($0014,sp),a4
	lea.l	(SFSYSINFO_0078_ヒットストップ),a0
	clr.w	(a0)
	clr.w	(-$003e,a0)
	move.w	#$0001,($0004,a0)
	move.l	a5,-(sp)
	lea.l	(SR_キャラ各種カウンタクリア),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	a4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0001)
	move.l	a5,-(sp)
	lea.l	(SYSCALL_01c8_状態設定_表示方向),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(-$0001)
	move.l	a4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.w	#$0001,($1758,a5)
	move.w	#$0001,($09e8,a5)
	move.w	#$0001,($01b8,a5)
	move.w	#$ffff,($1758,a4)
	move.w	#$ffff,($09e8,a4)
	move.w	#$ffff,($01b8,a4)
	move.w	#$0065,($09e2,a4)
	move.w	#$0065,($09e2,a5)
	move.w	#$0064,($09e4,a4)
	move.w	#$0064,($09e4,a5)
	clr.w	($01bc,a4)
	clr.w	($01bc,a5)
	clr.w	($0a90,a4)
	clr.w	($0a90,a5)
	clr.w	($01c0,a4)
	clr.w	($01c0,a5)
	clr.w	($172e,a4)		;無敵持続カウンタ
	clr.w	($172e,a5)		;無敵持続カウンタ
	clr.w	($0f22,a4)
	clr.w	($0f22,a5)
	clr.w	($01b4,a4)
	clr.w	($01b4,a5)
	clr.w	($01be,a4)
	clr.w	($01be,a5)
	clr.w	($0ce4,a4)
	clr.w	($0ce4,a5)
	move.w	#$0058,($002e,a4)
	move.w	#$0058,($002e,a5)
	clr.w	($0f0c,a4)
	clr.w	($0f0c,a5)
	clr.w	($09ec,a4)
	clr.w	($09ec,a5)
	move.w	#$0064,($09e0,a4)
	move.w	#$0064,($09e0,a5)
	move.w	#$0001,($01c8,a4)
	move.w	#$0001,($01c8,a5)
	clr.w	($0032,a4)
	clr.w	($0032,a5)
	clr.w	($01cc,a4)
	clr.w	($01cc,a5)
	clr.w	($09fa,a4)
	clr.w	($09fa,a5)
	clr.w	($001c,a4)
	clr.w	($001c,a5)
	clr.w	($0a42,a4)
	clr.w	($0a42,a5)
	clr.w	($0f1c,a4)
	clr.w	($0f1c,a5)
	clr.w	($01c6,a4)
	clr.w	($01c6,a5)
	clr.w	($09f0,a4)
	clr.w	($09f0,a5)
	clr.w	($09fc,a4)
	clr.w	($09fc,a5)
	clr.w	($0a3c,a4)
	clr.w	($0a3c,a5)
	moveq.l	#$00,d2
	move.l	d2,($0a3e,a4)
	move.l	d2,($0a3e,a5)
	move.l	d2,($0f02,a4)
	move.l	d2,($0f02,a5)
	move.w	d2,($01c2,a4)
	move.w	d2,($01c2,a5)
	move.w	d2,($0a92,a4)
	move.w	d2,($0a92,a5)
	move.w	d2,($1744,a4)
	move.w	d2,($1744,a5)
	move.l	d2,($1326,a4)
	move.l	d2,($1326,a5)
	move.w	d2,($0aa6,a4)
	move.w	d2,($0aa6,a5)
	move.w	d2,($0a96,a4)
	move.w	d2,($0a96,a5)
	move.w	d2,($0a9a,a4)
	move.w	d2,($0a9a,a5)
	move.w	d2,($0a94,a4)
	move.w	d2,($0a94,a5)
	move.w	d2,($1756,a4)
	move.w	d2,($1756,a5)
	move.w	d2,($1754,a4)
	move.w	d2,($1754,a5)
	moveq.l	#$ff,d2
	move.l	d2,($0024,a4)
	move.l	d2,($0024,a5)
	moveq.l	#$00,d2
	move.l	d2,($0020,a4)
	move.l	d2,($0020,a5)
	move.w	d2,($0a00,a4)		;DSP横方向スプライト数
	move.w	d2,($0a00,a5)
	move.w	d2,($0a02,a4)		;DSP縦方向スプライト数
	move.w	d2,($0a02,a5)
	move.w	d2,($0a04,a4)
	move.w	d2,($0a04,a5)
	move.w	d2,($0a06,a4)
	move.w	d2,($0a06,a5)
	move.w	d2,($0a08,a4)		;DSP水平反転フラグ
	move.w	d2,($0a08,a5)
	move.w	d2,($0a0a,a4)		;DSP垂直反転フラグ
	move.w	d2,($0a0a,a5)
	move.w	#$0001,($0aca,a4)
	move.w	#$0001,($0aca,a5)
	move.l	d2,($0acc,a4)
	move.l	d2,($0acc,a5)
	move.l	d2,($0ad0,a4)
	move.l	d2,($0ad0,a5)
	move.w	d2,($0ad4,a4)
	move.w	d2,($0ad4,a5)
	move.w	#$00ff,d1
L008504:
	move.w	d1,d0
	ext.l	d0
	add.l	d0,d0
	lea.l	(a5,d0.l),a0
	lea.l	(a4,d0.l),a1
	clr.w	($0ad6,a1)
	clr.w	($0ad6,a0)
	clr.w	($0cec,a1)
	clr.w	($0cec,a0)
	subq.w	#1,d1
	bpl	L008504
	move.w	#$ffff,($0cd4,a5)
	move.w	#$ffff,($0ad6,a5)
	move.w	#$ffff,($0cd4,a4)
	move.w	#$ffff,($0ad6,a4)
	move.w	#$ffff,($0eea,a5)
	move.w	#$ffff,($0cec,a5)
	move.w	#$ffff,($0eea,a4)
	move.w	#$ffff,($0cec,a4)
	move.l	a5,d2
	add.l	#$00000cd2,d2
	move.l	d2,($0cd6,a5)
	move.l	a4,d2
	add.l	#$00000cd2,d2
	move.l	d2,($0cd6,a4)
	move.l	a5,d2
	add.l	#$00000ee8,d2
	move.l	d2,($0eec,a5)
	move.l	a4,d2
	add.l	#$00000ee8,d2
	move.l	d2,($0eec,a4)
	clr.w	($1740,a4)
	clr.w	($1740,a5)
	clr.w	($1752,a4)
	clr.w	($1752,a5)
	clr.w	($0ce2,a4)
	clr.w	($0ce2,a5)
	move.w	#$000f,($1736,a4)
	move.w	#$000f,($1736,a5)
	move.w	#$0034,($1738,a4)
	move.w	#$0034,($1738,a5)
	move.w	#$0010,($173a,a4)
	move.w	#$0010,($173a,a5)
	move.w	#$0043,($173c,a4)
	move.w	#$0043,($173c,a5)
	move.w	#$0058,($1730,a4)
	move.w	#$0058,($1730,a5)
	move.w	#$0058,($0030,a4)
	move.w	#$0058,($0030,a5)
	move.w	#$0003,($0aa4,a4)
	move.w	#$0003,($0aa4,a5)
	move.w	#$001a,($001e,a5)
	move.w	#$005a,($001e,a4)
	clr.w	($0a4c,a4)
	clr.w	($0a4c,a5)
	clr.w	($0a4e,a4)
	clr.w	($0a4e,a5)
	clr.w	($0a56,a4)
	clr.w	($0a56,a5)
	clr.w	($09f8,a4)
	clr.w	($09f8,a5)
	clr.w	($0a5c,a4)
	clr.w	($0a5c,a5)
	clr.w	($0a5a,a4)
	clr.w	($0a5a,a5)
	moveq.l	#$00,d2
	move.l	d2,($0f0e,a4)
	move.l	d2,($0f0e,a5)
	move.w	#$0034,($0006,a5)
	move.w	#$0034,($0efe,a5)
	move.w	#$0034,($0efa,a5)
	move.w	#$0034,($0ef6,a5)
	move.w	#$0034,($0ef2,a5)
	move.w	#$0034,($0abe,a5)
	move.w	#$0034,($0aba,a5)
	move.w	#$0034,($0ab6,a5)
	move.w	#$0034,($0ab2,a5)
	move.w	#$0034,($0aae,a5)
	move.w	#$0034,($0aaa,a5)
	move.w	#$0070,($0008,a5)
	move.w	#$0070,($0f00,a5)
	move.w	#$0070,($0efc,a5)
	move.w	#$0070,($0ef8,a5)
	move.w	#$0070,($0ef4,a5)
	move.w	#$0070,($0ac0,a5)
	move.w	#$0070,($0abc,a5)
	move.w	#$0070,($0ab8,a5)
	move.w	#$0070,($0ab4,a5)
	move.w	#$0070,($0ab0,a5)
	move.w	#$0070,($0aac,a5)
	move.w	#$009b,($0006,a4)
	move.w	#$009b,($0efe,a4)
	move.w	#$009b,($0efa,a4)
	move.w	#$009b,($0ef6,a4)
	move.w	#$009b,($0ef2,a4)
	move.w	#$009b,($0abe,a4)
	move.w	#$009b,($0aba,a4)
	move.w	#$009b,($0ab6,a4)
	move.w	#$009b,($0ab2,a4)
	move.w	#$009b,($0aae,a4)
	move.w	#$009b,($0aaa,a4)
	move.w	#$0070,($0008,a4)
	move.w	#$0070,($0f00,a4)
	move.w	#$0070,($0efc,a4)
	move.w	#$0070,($0ef8,a4)
	move.w	#$0070,($0ef4,a4)
	move.w	#$0070,($0ac0,a4)
	move.w	#$0070,($0abc,a4)
	move.w	#$0070,($0ab8,a4)
	move.w	#$0070,($0ab4,a4)
	move.w	#$0070,($0ab0,a4)
	move.w	#$0070,($0aac,a4)
	move.w	d2,($0aa8,a4)
	move.w	d2,($0aa8,a5)
	move.w	d2,($0a76,a4)	;砂煙表示カウンタ
	move.w	d2,($0a76,a5)
	move.w	d2,($0a6c,a4)
	move.w	d2,($0a6c,a5)
	move.w	d2,($0a70,a4)
	move.w	d2,($0a70,a5)
	move.w	d2,(L0690b4)
	move.w	d2,(L0690b6)
	move.w	d2,(L0690b8)
	move.w	d2,(L0690ba)
	move.w	d2,(ラウンドタイマー一の位)
	move.w	#$000a,(ラウンドタイマー十の位)
	movem.l	(sp)+,a3-a5
	rts

SR_キャラ各種カウンタクリア:
	movea.l	($0004,sp),a0
	clr.w	($09e6,a0)				;動作過程値をクリア
	clr.w	($09ee,a0)				;カウンタをクリア
	clr.w	($0a44,a0)				;最多ヒット数をクリア
	clr.w	($0a42,a0)				;攻撃過程値をクリア
	clr.w	($0ac2,a0)				;気集中値をクリア
	clr.w	($05de,a0)				;超技モードフラグクリア
	clr.w	($0a48,a0)
	rts

L0087ae:
	.dc.b	'(ALLOC_DATA_LIST)',$00
L0087c0:
	.dc.b	'メモリが不足しています',$00,$00
SR_ステージリスト格納メモリ確保()
{
	ステージリスト格納メモリポインタ = SYSCALL_025c_Data確保_メモリブロック(SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 * 662);
	if (ステージリスト格納メモリポインタ == 0) {
		SYSCALL_0264_システム異常終了("メモリが不足しています", "(ALLOC_DATA_LIST)");
	}
	return ステージリスト格納メモリポインタ;
}

SR_REG_キャラクタディレクトリ名設定(セレクト番号, buff)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	XCLIB_strcpy(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 24, buff);
	XCLIB_strtoupper(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 24);
}

SR_REG_ステージディレクトリ名設定(セレクト番号, buff)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	XCLIB_strcpy(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 592, buff);
	XCLIB_strtoupper(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 592);
}

L0088de:
	.dc.b	$00,$00
SR_REG_キャラクタディレクトリ名取得(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return "\0";
	}
	if (L008aea(セレクト番号) == 0) {
		return "\0";
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 24;
}

SR_REG_ステージディレクトリ名取得(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return "\n";
	}
	if (L008b2e(セレクト番号) == 0) {
		return "\n";
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 592;
}

L00899c(セレクト番号, buff)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	XCLIB_strcpy(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662, buff);
}


SR_REG_個別ディレクトリ名設定(セレクト番号, buff)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	XCLIB_strcpy(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 568, buff);
}

L008a30(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return "\0";
	}

	if (L008aea(セレクト番号) == 0) {
		return "\0";
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662;
}

SR_REG_個別ディレクトリ名取得(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return "\0";
	}

	if (L008b2e(セレクト番号) == 0) {
		return "\0";
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 568;
}

L008aea(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 0;
	}
	return *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 24) ? 1 : 0;
}

L008b2e(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 0;
	}
	return *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 592) ? 1 : 0;
}

L008b72(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	
	*(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 24) = 0;
}

L008bae(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	
	*(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 592) = 0;
}

L008bea:
	.dc.b	'SYSTEM/ENDING',$00
L008bf8:
	movem.l	d3/a3-a5,-(sp)
	movea.l	($0014,sp),a5
	move.w	($001a,sp),d3
	bge	L008c18
	pea.l	(L008bea)
	move.l	($1766,a5),-(sp)
	jsr	(XCLIB_strcpy)
	bra	L008c6c
L008c18:
	pea.l	(SFSYSINFO_0488_キャラクタディレクトリパス)
	move.l	($1766,a5),-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	movea.w	d3,a3
	move.l	a3,-(sp)
	lea.l	(L008a30),a4
	jsr	(a4)
	addq.w	#4,sp
	movea.l	d0,a0
	cmpi.b	#$7e,(a0)
	bne	L008c54
	move.l	a3,-(sp)
	jsr	(a4)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	($1766,a5),-(sp)
	jsr	(XCLIB_strcat)
	addq.w	#8,sp
L008c54:
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	($1766,a5),-(sp)
	jsr	(XCLIB_strcat)
L008c6c:
	addq.w	#8,sp
	movem.l	(sp)+,d3/a3-a5
	rts

L008c74:
	.dc.b	$2f,$00
L008c76:
	.dc.b	'SYSTEM/',$00
L008c7e:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a0
	move.l	($0014,sp),d4
	move.l	($0018,sp),d3
	cmpa.w	#$0000,a0
	ble	L008cbe
	move.l	($1766,a0),-(sp)
	move.l	d3,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L008c74)
	move.l	d3,-(sp)
	lea.l	(XCLIB_strcat),a3
	jsr	(a3)
	addq.w	#8,sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	bra	L008cfa
L008cbe:
	moveq.l	#$ff,d1
	cmp.l	a0,d1
	bne	L008ce2
	pea.l	(L008c76)
	move.l	d3,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(XCLIB_strcat)
	addq.w	#8,sp
	bra	L008cfa
L008ce2:
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	jsr	(L00b1c6)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_ステージデータファイルパス構築)
	lea.l	($000c,sp),sp
L008cfa:
	movem.l	(sp)+,d3-d4/a3
	rts

SR_ステージデータファイルパス構築(セレクト番号, ファイル名, 書き出しバッファ)
{
	XCLIB_strcpy(書き出しバッファ, SFSYSINFO_0588_ステージディレクトリパス);

	a0 = SR_REG_個別ディレクトリ名取得(セレクト番号);
	if (*a0 == '~') {
		XCLIB_strcat(書き出しバッファ, SR_REG_個別ディレクトリ名取得(セレクト番号));
	}

	d0 = SR_REG_ステージディレクトリ名取得(d4);
	XCLIB_strcat(書き出しバッファ, SR_REG_ステージディレクトリ名取得(セレクト番号));
	XCLIB_strcat(書き出しバッファ, "/");

	XCLIB_strcat(書き出しバッファ, ファイル名);
}

SR_キャラ勝率計算(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 0;
	}
	試合数カウント = *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662) + 48;
	勝利数カウント = *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662) + 50;
	if (試合数カウント == 0) {
		return 0;
	}
	
	return XCLIB_32bit符号付整数除算(勝利数カウント * 100, 試合数);
}

SR_キャラ試合数カウント取得(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 999;
	}
	試合数カウント = *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 48);
	if (試合数カウント > 999) {
		return 999;
	}
	return 試合数カウント;
}

SR_キャラ勝利数カウント取得(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 999;
	}
	勝利数カウント = *(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 50);
	if (勝利数カウント > 999) {
		return 999;
	}
	return 勝利数カウント;
}

SR_キャラ試合数カウントアップ(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	ptr試合数カウント = *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 48;
	if (*ptr試合数カウント <= 32766)
		*ptr試合数カウント++;
	}
}

SR_キャラ勝利数カウントアップ(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	ptr勝利数カウント = *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 50;
	if (*ptr勝利数カウント <= 32766)
		*ptr勝利数カウント++;
	}
}

SR_キャラ試合数カウントクリア(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	*(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 48) = 0;
}

SR_キャラ勝利数カウントクリア(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return;
	}
	*(*ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 50) = 0;
}

L008f7e:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	movea.l	d0,a2
	adda.l	(ステージリスト格納メモリポインタ),a2
	lea.l	(-$0296,a2),a2
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	blt	L008fbc
	clr.w	($0034,a2)
	clr.w	($0036,a2)
L008fbc:
	rts

L008fbe:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	movea.l	d0,a2
	adda.l	(ステージリスト格納メモリポインタ),a2
	lea.l	(-$0296,a2),a2
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	blt	L008ffa
	move.w	($0030,a2),($0034,a2)
L008ffa:
	rts

L008ffc:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	movea.l	d0,a2
	adda.l	(ステージリスト格納メモリポインタ),a2
	lea.l	(-$0296,a2),a2
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	blt	L009038
	move.w	($0032,a2),($0036,a2)
L009038:
	rts

L00903a:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	movea.l	d0,a2
	adda.l	(ステージリスト格納メモリポインタ),a2
	lea.l	(-$0296,a2),a2
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	blt	L009076
	move.w	($0034,a2),($0030,a2)
L009076:
	rts

L009078:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	movea.l	d0,a2
	adda.l	(ステージリスト格納メモリポインタ),a2
	lea.l	(-$0296,a2),a2
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	blt	L0090b4
	move.w	($0036,a2),($0032,a2)
L0090b4:
	rts

L0090b6:
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 0;
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 56;
}

L0090f8:
	movea.w	($0006,sp),a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	asl.l	#2,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	move.l	d0,d1
	add.l	(ステージリスト格納メモリポインタ),d1
	add.l	#$fffffd6a,d1
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.w	(a1),d0
	muls.w	($0002,a1),d0
	cmp.l	a0,d0
	bge	L009134
	moveq.l	#$00,d0
	bra	L009136
L009134:
	move.l	d1,d0
L009136:
	rts

L009138(セレクト番号)
{
	if (SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 < セレクト番号) {
		return 0;
	}
	return *ステージリスト格納メモリポインタ + (セレクト番号-1) * 662 + 568;
}

L00917e:
	movem.l	a3-a5,-(sp)
	movea.w	($0012,sp),a1

	d0 = L009138(a1);

	movea.l	d0,a5
	cmpa.w	#$0000,a5
	beq	L0091e4
	pea.l	($0018,a5)
	lea.l	(L0690dc),a3
	move.l	a3,-(sp)
	lea.l	(XCLIB_strcpy),a4
	jsr	(a4)			;XCLIB_strcpy(L0690dc, d0+24);	//ステージ名
	addq.w	#8,sp
	pea.l	($0030,a5)
	pea.l	($0018,a3)
	jsr	(a4)
	addq.w	#8,sp
	lea.l	($0038,a3),a0
	move.w	($0050,a5),(a0)
	move.w	($0052,a5),(a0)
	move.w	($0054,a5),($003c,a3)
	move.w	($0056,a5),($003e,a3)
	move.w	($0058,a5),($0040,a3)
	move.w	($005a,a5),($0042,a3)
	move.w	($005c,a5),($0044,a3)
L0091e4:
	movem.l	(sp)+,a3-a5
	rts

SYSCALL_0240_Reg取得_登録状態:
	movem.l	d3/a3,-(sp)
	move.w	($0012,sp),d3
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a3
	movea.w	(a3),a0
	movea.w	($000e,sp),a1
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	add.w	d3,d0
	cmp.w	(a3),d3
	bgt	L009234
	movea.w	d0,a3
	move.l	a3,-(sp)
	jsr	(L008aea)
	addq.w	#4,sp
	tst.w	d0
	beq	L009234
	move.l	a3,-(sp)
	jsr	(L008b2e)
	addq.w	#4,sp
	tst.w	d0
	beq	L009234
	moveq.l	#$01,d0
	bra	L009236
L009234:
	moveq.l	#$00,d0
L009236:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_0248_Reg取得_ストーリー名:
	move.l	d3,-(sp)
	move.w	($000a,sp),d0
	pea.l	($0001)
	move.w	d0,d3
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(SYSCALL_0240_Reg取得_登録状態)
	addq.w	#8,sp
	tst.w	d0
	beq	L009268
	move.l	d3,d0
	add.l	d0,d0
	add.l	d3,d0
	asl.l	#3,d0
	add.l	#L06910a,d0
	bra	L00926e
L009268:
	move.l	#L0088de,d0
L00926e:
	move.l	(sp)+,d3
	rts

SYSCALL_0258_Reg取得_ステージ情報(num_story, num_data):
	movem.l	d3/a3,-(sp)
	move.w	($0012,sp),d3			;d3=num_data
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a3
	movea.w	(a3),a0
	movea.w	($000e,sp),a1			;a1=num_story
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)				;SR_32bit演算(SFSYSINFO_047e_ストーリー内最大ステージ数, num_story-1);
	addq.w	#8,sp
	add.w	d3,d0
	cmp.w	(a3),d3
	bgt	L0092c4
	movea.w	d0,a3
	move.l	a3,-(sp)
	jsr	(L008aea)
	addq.w	#4,sp
	tst.w	d0
	beq	L0092c4
	move.l	a3,-(sp)
	jsr	(L008b2e)
	addq.w	#4,sp
	tst.w	d0
	beq	L0092c4
	move.l	a3,-(sp)
	jsr	(L009138)
	addq.w	#4,sp
	bra	L0092c6
L0092c4:
	moveq.l	#$00,d0
L0092c6:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_02b4_Reg取得_PATH_キャラクタ:
	movem.l	d3-d5/a3-a4,-(sp)
	move.w	($001e,sp),d3
	move.l	($0020,sp),d5
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a3
	movea.w	(a3),a0
	movea.w	($001a,sp),a1
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)					;SR_32bit乗算(SFSYSINFO_047e_ストーリー内最大ステージ数, num_story-1);
	addq.w	#8,sp
	move.w	d0,d4
	add.w	d3,d4
	cmp.w	(a3),d3
	ble	L0092fe
	moveq.l	#$00,d0
	bra	L009350
L0092fe:
	pea.l	(SFSYSINFO_0488_キャラクタディレクトリパス)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcpy)					;XCLIB_strcpy(d5, SFSYSINFO_0488_キャラクタディレクトリパス);
	addq.w	#8,sp
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(L008a30),a4
	jsr	(a4)							;L008a30(d4);
	addq.w	#4,sp
	movea.l	d0,a0
	cmpi.b	#$7e,(a0)
	bne	L009336
	move.l	a3,-(sp)
	jsr	(a4)							;L008a30(a3)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcat)					;XCLIB_strcat(d5, d0)
	addq.w	#8,sp
L009336:
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(SR_REG_キャラクタディレクトリ名取得)						;SR_REG_キャラクタディレクトリ名取得(d4)
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcat)					;XCLIB_strcat(d5, d0);
	addq.w	#8,sp
	moveq.l	#$01,d0
L009350:
	movem.l	(sp)+,d3-d5/a3-a4
	rts

SYSCALL_02b8_Reg取得_PATH_ステージ(num_story, num_data, buff)
{
	d4 = SR_32bit乗算(SFSYSINFO_047e_ストーリー内最大ステージ数, num_story-1) + num_data;
	if (num_data <= SFSYSINFO_047e_ストーリー内最大ステージ数) return 0;

	XCLIB_strcpy(buff, SFSYSINFO_0588_ステージディレクトリパス);
	a0 = SR_REG_個別ディレクトリ名取得(d4);
	if (*a0 == '~') {
		XCLIB_strcat(buff, SR_REG_個別ディレクトリ名取得(d4));
	}
	XCLIB_strcat(buff, SR_REG_ステージディレクトリ名取得(d4));
	return 1;

	movem.l	d3-d5/a3-a4,-(sp)
	move.w	($001e,sp),d3		;num_data
	move.l	($0020,sp),d5		;buff
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a3
	movea.w	(a3),a0
	movea.w	($001a,sp),a1		;num_story
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)			;SR_32bit乗算(SFSYSINFO_047e_ストーリー内最大ステージ数, num_story-1)
	addq.w	#8,sp
	move.w	d0,d4
	add.w	d3,d4				;d4 = d0 + num_data
	cmp.w	(a3),d3
	ble	@f
	moveq.l	#$00,d0				;return 0;
	bra	L0093da
@@:	pea.l	(SFSYSINFO_0588_ステージディレクトリパス)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcpy)			;XCLIB_strcpy(buff, SFSYSINFO_0588_ステージディレクトリパス);
	addq.w	#8,sp
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_REG_個別ディレクトリ名取得),a4
	jsr	(a4)					;SR_REG_個別ディレクトリ名取得(d4)
	addq.w	#4,sp
	movea.l	d0,a0
	cmpi.b	#$7e,(a0)			;'~'と比較
	bne	@f
	move.l	a3,-(sp)
	jsr	(a4)					;SR_REG_個別ディレクトリ名取得(d4);
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcat)			;XCLIB_strcat(buff, d0);
	addq.w	#8,sp
@@:	ext.l	d4
	move.l	d4,-(sp)
	jsr	(SR_REG_ステージディレクトリ名取得)				;SR_REG_ステージディレクトリ名取得()
	addq.w	#4,sp
	move.l	d0,-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_strcat)			;XCLIB_strcat(buff, d0);
	addq.w	#8,sp
	moveq.l	#$01,d0				;return 1
L0093da:
	movem.l	(sp)+,d3-d5/a3-a4
	rts

L0093e0:
	.dc.b	'SFXVI  VERSION 4>2',$00,$00
L0093f4:
	.dc.b	'   PRESENTED BY   ',$00,$00
L009408:
	.dc.b	' T>SOENO  1997>12 ',$00,$00
L00941c:
	.dc.b	$00,$00
L00941e:
	.dc.b	'SC/SELECT/',$00,$00
L00942a:
	move.l	a3,-(sp)
	pea.l	($0001)
	jsr	(L019930)
	addq.w	#4,sp
	jsr	(L01bc9c)
	jsr	(L01bd26)
	pea.l	($0001)
	pea.l	($0001)
	pea.l	($0003)
	pea.l	($0000)
	jsr	(L01dd0c)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(L01dc64)
	lea.l	($000c,sp),sp
	jsr	(iocscall_os_curof)
	jsr	(iocscall_b_curoff)
	pea.l	($0004)
	lea.l	(L01ddfe),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0002)
	jsr	(a3)
	addq.w	#4,sp
	jsr	(L002bf2)
	jsr	(iocscall_sp_init)
	pea.l	($0000)
	lea.l	(SYSCALL_02a8_Scr設定_ＢＧ表示),a3
	jsr	(a3)
	addq.w	#4,sp
	jsr	(L01bd3a)
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	pea.l	($0001)
	jsr	(L01c4d6)
	addq.w	#4,sp
	jsr	(L01c4e6)
	jsr	(SR_システムPCG_PAL読み込み・登録)
	jsr	(L014a0a)
	pea.l	($0f00)
	pea.l	(L0093e0)
	pea.l	($000d)
	pea.l	($0007)
	lea.l	(SR_BG文字列描画),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L0093f4)
	pea.l	($000f)
	pea.l	($0007)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L009408)
	pea.l	($0011)
	pea.l	($0007)
	jsr	(a3)
	lea.l	($0010,sp),sp
	jsr	(SR_システムMESS_SP読み込み・登録)
	jsr	(L018fc0)
	pea.l	($0030)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	pea.l	($0001)
	jsr	(L017c60)
	addq.w	#4,sp
	pea.l	(L00941c)
	pea.l	(-$0001)
	jsr	(SYSCALL_020c_Bgm展開_ＺＰＤファイル)
	addq.w	#8,sp
	pea.l	($0005)
	pea.l	(WORK_3P_0000)
	jsr	(L013816)
	addq.w	#8,sp
	lea.l	(L0467f6),a3
	move.l	#L044f90,(a3)
	move.l	#L044f90,(L058592)
	pea.l	(L00941e)
	pea.l	(L044f90)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L044f9a)
	pea.l	($0002)
	jsr	(L002ab6)
	addq.w	#8,sp
	move.l	(SFSYSINFO_0086_xxxx),-(sp)
	jsr	(doscall_mfree)
	addq.w	#4,sp
	clr.w	(-$1762,a3)
	jsr	(SR_ステージリスト格納メモリ確保)

	L005e18(WORK_3P_0000, WORK_4P_0000, 9);

	SR_起動時ストーリー選択シーン();
	L0097ca();
	L0138ac(WORK_3P_0000, 9, 0);

	moveq.l	#$00,d0
	movea.l	(sp)+,a3
	rts

L009646:
	.dc.b	'-----------------------------------------------------------'
	.dc.b	'-',$0a,$00
L009684:
	.dc.b	'Log on ->  DATE %d/%d/%d  TIME %d:%d:%d',$0a,$00,$00
L0096ae:
	.dc.b	'LOADING DEFAULT CHAR..',$00,$00
L0096c6:
	.dc.b	'Loading Default Character ...',$00
L0096e4:
	.dc.b	'OK',$0a,$00
L0096e8:
	.dc.b	'LOADING DEFAULT STAGE..',$00
L009700:
	.dc.b	'Loading Default Stage ...',$00
L00971a:
	.dc.b	'LOADING SYSTEM RESOURCE..',$00
L009734:
	.dc.b	'Loading System Resource ...',$00
L009750:
	.dc.b	'IMPORTING CHAR AND STAGE..',$0a,$00
L00976c:
	.dc.b	'Inporting Character and Stage Data ...',$0a,$00
L009794:
	.dc.b	'STARTING SFXVI SERVICE..',$00,$00
L0097ae:
	.dc.b	'Starting SFXVI Service ...',$0a,$00
L0097ca()
{
	d3 = XCLIB_dos_getdate();
	d4 = XCLIB_dos_gettime();

	L005bb0(1, "-----------------------------------------------------------^\n");

	XCLIB_sprintf(a6_mi0080, "Log on ->  DATE %d/%d/%d  TIME %d:%d:%d\n", Y, M, D, H, i, s);

	L005bb0(1, a6_mi0080);
	L005bb0(1, "-----------------------------------------------------------^\n");

	L0099b6(2, "Loading Default Character ...". "LOADING DEFAULT CHAR..");

	L013bf0(WORK_1P_0000, 1);
	SR_LOAD_CHR_ACTION_X(WORK_1P_0000, 1);
	L01242(WORK_1P_0000);

	L013bf0(WORK_2P_0000, 1);
	SR_LOAD_CHR_ACTION_X(WORK_2P_0000, 1);
	L012042(WORK_2P_0000);
	L0099b6(2, "OK\n", "OK\n");

	L0099b6(2, "Loading Default Stage ...", "LOADING DEFAULT STAGE..");

	L013c78(11);
	L013e4e(11);

	L0120d4();
	L012fe0();
	L0099b6(2, "OK\n", "OK\n");

	L0099b6(2, "Loading System Resource ...", "LOADING SYSTEM RESOURCE..");

	SR_システムVOICE_SMP読み込み・登録();
	L0099b6(2, "OK\n", "OK\n");

	L0099b6(2, "Inporting Character and Stage Data ...\n", "IMPORTING CHAR AND STAGE..");

	L0025c0();
	L00aeda();
	L0099b6(2, "Starting SFXVI Service ...\n", "STARTING SFXVI SERVICE..");
}

L0099b6(arg1, arg2, arg3)
{
	L005bb0(arg1, arg2);
	L0099de(arg3);
}

L0099de(arg1)
{
	L06f432 = MMP_SYS_0151_BOOT_標準出力;
	if (L06f432 == 0) return;

	*MMP_SYS_0151_BOOT_標準出力(WORK_3P_0000, WORK_4P_0000, arg1);
}

L009a08:
	move.w	($0006,sp),d0
	lea.l	(MMP_SYS_0152_BOOT_画面クリア),a0
	move.l	(a0),(L06f432)
	beq	L009a32
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	(WORK_4P_0000)
	pea.l	(WORK_3P_0000)
	movea.l	(a0),a0
	jsr	(a0)
	lea.l	($000c,sp),sp
L009a32:
	rts

SR_BG_LOCATE(x, y)
{
	if (MMP_SYS_0153_BOOT_カーソル移動) {
		*MMP_SYS_0153_BOOT_カーソル移動(WORK_3P_0000, WORK_4P_0000, x, y);
	}
}

L009a68()
{
	L01c4d6(1);
	L01c4e6();
	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
	SR_グラフィックパレット_黒化();
	L017c60(1);
	SYSCALL_01f8_Bgm制御_停止();
	return L005e18(WORK_3P_0000, WORK_4P_0000, 3);
}

L009ada:
	movem.l	d3/a3-a6,-(sp)
	lea.l	(WORK_1P_0a86_CPU制御状態),a3
	lea.l	(L033c7a),a5
	lea.l	(SFSYSINFO_0066_xxxx),a4
	lea.l	(-$001e,a4),a6
L009af4:
	L005e18(WORK_3P_0000, WORK_4P_0000, 4);

	move.w	d0,d3
	cmp.w	#$0001,d3
	bne	L009b20
	clr.w	(a3)
	move.w	#$0001,(a5)
	clr.w	(a4)
	bra	L009b9c
L009b20:
	cmp.w	#$0002,d3
	bne	L009b30
	move.w	#$0001,(a3)
	clr.w	(a5)
	clr.w	(a4)
	bra	L009b9c
L009b30:
	cmp.w	#$0003,d3
	bne	L009b40
	clr.w	(a3)
	clr.w	(a5)
	move.w	#$0001,(a4)
	bra	L009b9c
L009b40:
	cmp.w	#$0004,d3
	bne	L009b60
	jsr	(L00057c)
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	clr.w	(SFSYSINFO_0048_場面_デモ)
	bra	L009b9c
L009b60:
	cmp.w	#$0005,d3
	beq	L009b8e
	pea.l	($0000)
	pea.l	($0003)
	pea.l	(WORK_3P_0000)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	jsr	(L003894)
	bra	L009af4
L009b8e:
	move.w	#$0001,(a3)
	move.w	#$0001,(a5)
	clr.w	(a4)
	move.w	#$0001,(a6)
L009b9c:
	pea.l	($0000)
	pea.l	($0003)
	pea.l	(WORK_3P_0000)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	cmp.w	#$0003,d3
	bgt	L009bea
	moveq.l	#$01,d3
L009bc2:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(SR_キャラ試合数カウントクリア)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(SR_キャラ勝利数カウントクリア)
	addq.w	#4,sp
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L009bc2
	clr.w	(SFSYSINFO_0020_xxxx)
	moveq.l	#$01,d0
	bra	L009bec
L009bea:
	moveq.l	#$00,d0
L009bec:
	movem.l	(sp)+,d3/a3-a6
	rts

L009bf2:
	movem.l	d3-d4/a3,-(sp)
	move.w	#$0001,(SFSYSINFO_0048_場面_デモ)
	moveq.l	#$01,d3
L009c00:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(L00903a)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(L009078)
	addq.w	#4,sp
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L009c00

	L005e18(WORK_1P_0000, WORK_2P_0000, 1);

	move.w	d0,d4
	jsr	(SR_ラスター割込み設定解除)
	moveq.l	#$01,d3
L009c42:
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(L008fbe)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(L008ffc)
	addq.w	#4,sp
	addq.w	#1,d3
	cmp.w	#$00c8,d3
	ble	L009c42
	clr.w	(SFSYSINFO_0048_場面_デモ)
	move.w	d4,d0
	ext.l	d0
	movem.l	(sp)+,d3-d4/a3
	rts

L009c70:
	movem.l	a3-a4,-(sp)
	move.w	(処理順制御フラグ),d0
	eori.w	#$0001,d0
	move.w	d0,(処理順制御フラグ)
	bne	@f
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	bra	@@f
@@:	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
@@:	jsr	(L003f12)
	addq.w	#8,sp
	lea.l	(WORK_1P_1324_思考完了),a0
	lea.l	(WORK_2P_1324_思考完了),a1
	clr.w	(a1)
	clr.w	(a0)
	clr.w	($041c,a1)				;p2 防御キャンセル
	clr.w	($041c,a0)				;p1 防御キャンセル
	tst.w	(-$115e,a0)				;p1 0x01c8
	bgt	@f
	tst.w	(-$115e,a1)				;p2 0x01c8
	ble	@@f
@@:	move.w	#$0001,(SFSYSINFO_0078_ヒットストップ)
	subq.w	#1,(WORK_1P_01c6_硬直時間)
	subq.w	#1,(WORK_2P_01c6_硬直時間)
@@:	lea.l	(SFSYSINFO_0078_ヒットストップ),a4
	tst.w	(a4)
	bne	L00a052
	pea.l	(WORK_1P_0000)
	lea.l	(SR_ヒット情報クリア),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	clr.w	($0002,a4)
	clr.w	(WORK_2P_キャラ振動フラグ)
	clr.w	(WORK_1P_0f22_振動)
	tst.w	(処理順制御フラグ)
	bne	L009d7a
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	lea.l	(L00d2dc),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L010e5e)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	bra	L009dd4
L009d7a:
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	lea.l	(L00d2dc),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(L010e5e)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
L009dd4:
	jsr	(L015c8c)
	addq.w	#8,sp
	lea.l	(WORK_1P_0ac2_気集中),a0
	tst.w	(a0)
	bne	L009e40
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L009e40
	tst.w	(-$0032,a0)
	ble	L009e02
	pea.l	(WORK_1P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L009e02:
	tst.w	(L033c84)
	ble	L009e18
	pea.l	(WORK_2P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L009e18:
	lea.l	(L022b86),a0
	tst.w	(a0)
	ble	L009e2c
	subq.w	#1,(a0)
	tst.w	(a0)
	bgt	L009e2c
	clr.w	(-$156e,a0)
L009e2c:
	lea.l	(L034922),a0
	tst.w	(a0)
	ble	L009e40
	subq.w	#1,(a0)
	tst.w	(a0)
	bgt	L009e40
	clr.w	(-$156e,a0)
L009e40:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L009e5e
	movea.w	(-$0d6c,a0),a2					;表示セルID
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L009e5e:
	lea.l	(WORK_2P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L009e7c
	movea.w	(-$0d6c,a0),a2					;表示セル
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L009e7c:
	clr.w	(WORK_2P_1756_セル非表示フラグ)
	clr.w	(WORK_1P_1756_セル非表示フラグ)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00cb2a)
	addq.w	#8,sp
	tst.w	(処理順制御フラグ)
	bne	L009ec4
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cf)
	pea.l	(WORK_2P_0000)
	bra	L009ee2
L009ec4:
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_2P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cf)
	pea.l	(WORK_1P_0000)
L009ee2:
	jsr	(a3)
	addq.w	#8,sp
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L009f02
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00c0be)
	addq.w	#8,sp
L009f02:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L009f1e
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(L00c0be)
	addq.w	#8,sp
L009f1e:
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L009f34
	pea.l	(WORK_1P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L009f34:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L009f4a
	pea.l	(WORK_2P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L009f4a:
	lea.l	(WORK_1P_0008_Y座標),a0
	cmpi.w	#$006f,(a0)
	ble	L009f66
	clr.w	($174c,a0)
	tst.w	($0f12,a0)
	bne	L009f6e
	move.w	#$0070,(a0)
	bra	L009f6e
L009f66:
	move.w	#$0001,(WORK_1P_1754_xxxx)
L009f6e:
	lea.l	(WORK_2P_0008_Y座標),a0
	cmpi.w	#$006f,(a0)
	ble	L009f8a
	clr.w	($174c,a0)
	tst.w	($0f12,a0)
	bne	L009f92
	move.w	#$0070,(a0)
	bra	L009f92
L009f8a:
	move.w	#$0001,(WORK_2P_1754_xxxx)
L009f92:
	jsr	(L0041fa)
	tst.w	(処理順制御フラグ)
	bne	L009fe0
	lea.l	(WORK_1P_0a3c_攻撃判定有無),a0
	tst.w	(a0)
	ble	L009fc4
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00e688)						;攻撃ヒットチェック？
	lea.l	($000c,sp),sp
L009fc4:
	lea.l	(L033c30),a0
	tst.w	(a0)
	ble	L00a028
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	bra	L00a01e
L009fe0:
	lea.l	(L033c30),a0
	tst.w	(a0)
	ble	L00a004
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(L00e688)						;攻撃ヒットチェック？
	lea.l	($000c,sp),sp
L00a004:
	lea.l	(WORK_1P_0a3c_攻撃判定有無),a0
	tst.w	(a0)
	ble	L00a028
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
L00a01e:
	jsr	(L00e688)
	lea.l	($000c,sp),sp
L00a028:
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	lea.l	(L0040d0),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	bra	L00a3e6
L00a052:
	tst.w	(WORK_1P_01cc_敗北状態)
	bne	L00a064
	tst.w	(WORK_2P_01cc_敗北状態)
	beq	L00a20a
L00a064:
	lea.l	(SFSYSINFO_0078_ヒットストップ),a0
	cmpi.w	#$0001,(a0)
	bgt	L00a0c2
	clr.w	(a0)
	move.w	#$ffff,(-$003e,a0)
	jsr	(SR_ステージパレット反映)
	tst.w	(WORK_1P_001c_xxxx)
	beq	L00a098
	pea.l	($00fc)				;fc=VCT_悲鳴処理
	pea.l	(WORK_1P_0000)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00a098:
	tst.w	(L033210)
	beq	L00a0b2
	pea.l	($00fc)				;fc=VCT_悲鳴処理
	pea.l	(WORK_2P_0000)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00a0b2:
	clr.w	(L033210)
	clr.w	(WORK_1P_001c_xxxx)
	bra	L00a20a
L00a0c2:
	lea.l	(SFSYSINFO_003a_xxxx),a0
	tst.w	(a0)
	blt	L00a20a
	move.w	#$0001,(a0)
	tst.w	(WORK_1P_002e_残り体力)
	bge	L00a0e2
	tst.w	(L0337d2)
	bne	L00a0f2
L00a0e2:
	tst.w	(L033222)
	bge	L00a14e
	tst.w	(L021a36)
	beq	L00a14e
L00a0f2:
	tst.w	(SFSYSINFO_000c_ゲームスピード)
	beq	L00a102
	jsr	(SR_タイマーD割込み処理終了待ち)
	bra	L00a108
L00a102:
	jsr	(SR_最終ラスター割込み終了待ち)
L00a108:
	pea.l	($0002)
	pea.l	($001e)
	pea.l	($001f)
	pea.l	($001b)
	pea.l	($0080)
	pea.l	($0000)
	lea.l	(L01b8d2),a3
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	lea.l	(SR_グラフィックパレット反映),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0002)
	pea.l	($001e)
	pea.l	($001f)
	pea.l	($001b)
	bra	L00a1f4
L00a14e:
	tst.w	(WORK_1P_002e_残り体力)
	bge	L00a15e
	tst.w	(L033220)
	bgt	L00a16e
L00a15e:
	tst.w	(L033222)
	bge	L00a1b2
	tst.w	(L021484)
	ble	L00a1b2
L00a16e:
	pea.l	($0002)
	pea.l	($001f)
	pea.l	($001e)
	pea.l	($001c)
	pea.l	($0080)
	pea.l	($0000)
	lea.l	(L01b8d2),a3
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	lea.l	(SR_グラフィックパレット反映),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0002)
	pea.l	($001f)
	pea.l	($001e)
	pea.l	($001c)
	bra	L00a1f4
L00a1b2:
	pea.l	($0002)
	pea.l	($001a)
	pea.l	($001e)
	pea.l	($001f)
	pea.l	($0080)
	pea.l	($0000)
	lea.l	(L01b8d2),a3
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	lea.l	(SR_グラフィックパレット反映),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0002)
	pea.l	($001a)
	pea.l	($001e)
	pea.l	($001f)
L00a1f4:
	pea.l	($0080)
	pea.l	($0080)
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0080)
	jsr	(a4)
	addq.w	#4,sp							;敗北時処理ここまで
L00a20a:
	tst.w	(処理順制御フラグ)
	bne	L00a25e
	pea.l	(WORK_2P_0000)					;▼1p優先処理ここから
	pea.l	(WORK_1P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	movea.w	(WORK_1P_09ea_セル番号),a2
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	lea.l	(SYSCALL_0000_セル設定_表示),a3
	jsr	(a3)
	addq.w	#8,sp
	movea.w	(WORK_2P_09ea_セル番号),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	bra	L00a2a8								;▲1p優先処理ここまで
L00a25e:
	pea.l	(WORK_1P_0000)					;▼2p優先処理ここから
	pea.l	(WORK_2P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	movea.w	(WORK_2P_09ea_セル番号),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	lea.l	(SYSCALL_0000_セル設定_表示),a3
	jsr	(a3)
	addq.w	#8,sp
	movea.w	(WORK_1P_09ea_セル番号),a2
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)					;▲2p優先処理ここまで
L00a2a8:
	jsr	(L010e5e)
	addq.w	#8,sp
	lea.l	(WORK_1P_0ac2_気集中),a0
	tst.w	(a0)
	bne	L00a30e
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00a30e
	tst.w	(-$0032,a0)						;1p燃焼状態
	ble	L00a2d6
	pea.l	(WORK_1P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L00a2d6:
	tst.w	(L033c84)
	ble	L00a2ec
	pea.l	(WORK_2P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L00a2ec:
	pea.l	($00cd)				;cd=OPT_衝撃硬直
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cd)				;cd=OPT_衝撃硬直
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
L00a30e:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00a32c
	movea.w	(-$0d6c,a0),a2					;1p表示セルID
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00a32c:
	lea.l	(WORK_2P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00a34a
	movea.w	(-$0d6c,a0),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00a34a:
	clr.w	(WORK_2P_1756_セル非表示フラグ)
	clr.w	(WORK_1P_1756_セル非表示フラグ)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00cb2a)
	addq.w	#8,sp
	tst.w	(処理順制御フラグ)
	bne	L00a392
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_2P_0000)
	bra	L00a3b0
L00a392:
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_2P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_1P_0000)
L00a3b0:
	jsr	(a3)
	addq.w	#8,sp
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L00a3ca
	pea.l	(WORK_1P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00a3ca:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00a3e0
	pea.l	(WORK_2P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00a3e0:
	jsr	(L0041fa)
L00a3e6:
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L00a462
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00a462
	lea.l	(SFSYSINFO_0078_ヒットストップ),a0
	tst.w	(a0)
	ble	L00a402
	subq.w	#1,(a0)
L00a402:
	lea.l	(SFSYSINFO_001c_気絶量減少カウンタ),a0
	addq.w	#1,(a0)
	cmpi.w	#$000d,(a0)
	ble	L00a42a
	clr.w	(a0)
	lea.l	(WORK_1P_0032_気絶量),a0
	tst.w	(a0)
	ble	L00a41e
	subq.w	#1,(a0)
L00a41e:
	lea.l	(WORK_2P_0032_気絶量),a0
	tst.w	(a0)
	ble	L00a42a
	subq.w	#1,(a0)
L00a42a:
	lea.l	(WORK_1P_0a98),a0
	tst.w	(a0)
	ble	L00a446
	subq.w	#1,(a0)
	bne	L00a446
	pea.l	(WORK_1P_0000)
	jsr	(SR_コンボ数表示クリア)
	addq.w	#4,sp
L00a446:
	lea.l	(WORK_2P_0a98),a0
	tst.w	(a0)
	ble	L00a462
	subq.w	#1,(a0)
	bne	L00a462
	pea.l	(WORK_2P_0000)
	jsr	(SR_コンボ数表示クリア)
	addq.w	#4,sp
L00a462:
	movem.l	(sp)+,a3-a4
	rts

L00a468:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.l	($000c,sp),-(sp)
	move.l	a3,-(sp)
	jsr	(L001646)
	addq.w	#8,sp
	tst.w	d0
	bne	L00a484
	moveq.l	#$00,d0
	bra	L00a4b4
L00a484:
	movea.w	($000a,a3),a0
	move.l	a0,-(sp)
	jsr	(SR_PCM8ファンクションコール_データ長問い合わせ)
	addq.w	#4,sp
	tst.l	d0
	bne	L00a484
L00a496:
	pea.l	($0000)
	jsr	(SR_PCM8ファンクションコール_データ長問い合わせ)
	addq.w	#4,sp
	tst.l	d0
	bne	L00a496
	pea.l	($0020)
	jsr	(L0015ee)
	addq.w	#4,sp
	moveq.l	#$01,d0
L00a4b4:
	movea.l	(sp)+,a3
	rts

L00a4b8:
	movea.l	($0004,sp),a0
	cmpi.w	#$0065,($09e2,a0)
	beq	L00a4c8
	moveq.l	#$00,d0
	bra	L00a4ca
L00a4c8:
	moveq.l	#$01,d0
L00a4ca:
	rts

L00a4cc:
	.dc.b	$72,$00
L00a4ce:
	.dc.b	'SFXVI.LST',$00
L00a4d8:
	.dc.b	'ERROR...CAN NOT OPEN DATA',$0a,$00,$00
L00a4f4:
	.dc.b	$0a
	.dc.b	'Error:Can not open SFXVI.LST',$0a,$00,$00
L00a514:
	.dc.b	'(LOAD_SFXVI_LST)',$00,$00
L00a526:
	.dc.b	'追加データが登録されていません',$00,$00
L00a546:
	.dc.b	'== SFXVI STORY SELECTER ==',$00,$00
L00a562:
	.dc.b	'   %2d.%-32S',$0a,$00
L00a570:
	.dc.b	$2a,$00
L00a572:
	.dc.b	$20,$00
L00a574:
	.dc.b	'*** END ***',$00
L00a580:
	.dc.b	$20,$20,$00,$00
L00a584:
	.dc.b	$2d,$3e,$00,$00
L00a588:
	.dc.b	'(SELECT_STORY)',$00,$00
L00a598:
	.dc.b	'ストーリーが選択されていません',$00,$00
L00a5b8:
	.dc.b	$0a,$00
L00a5ba:
	.dc.b	$00,$00
L00a5bc:
	.dc.b	'Character Controller Size = %DKB',$0a,$00
L00a5de:
	.dc.b	'CHAR CONTROLLER SIZE  %DKB',$0a,$00
L00a5fa:
	.dc.b	'CHAR CONTROLLER SIZE  AUTO',$0a,$00
L00a616:
	.dc.b	'Character Controller Size = Auto',$0a,$00
L00a638:
	.dc.b	'PCM Channel Count = %d',$0a,$00
L00a650:
	.dc.b	'PCM CHANNEL  %D',$0a,$00,$00
L00a662:
	.dc.b	$0a
	.dc.b	'REGISTERING STORY..',$00,$00
L00a678:
	.dc.b	$0a
	.dc.b	'Registering Story ...',$00,$00
L00a690:
	.dc.b	$2f,$00
L00a692:
	.dc.b	'ERROR...NOT EXIST DATA',$0a,$00
L00a6aa:
	.dc.b	$0a
	.dc.b	'Error:Not Exist Data',$0a,$00,$00
L00a6c2:
	.dc.b	'OK',$0a,$00
SR_起動時ストーリー選択シーン:
	link	a6,#-$0688
	movem.l	d3-d7/a3-a5,-(sp)
	
	
	d7 = 192;	// 無入力時の待機フレーム(約3秒)

	for (d4 = 1; d4 <= 200; d4++) {
		L008b72(d4);
		L008bae(d4);
	}

	for (d4 = 0; d4 <= 19; d4++) {
		if (SFSYSINFO_0480_最大ストーリー数 > d4) {
			*(a6_mi0408+d4*2) = 1;
		} else {
			*(a6_mi0408+d4*2) = 0;
		}
		*(a6_mi03e0+d4*24) = 0;
	}

	d6 = XCLIB_fopen("SFXVI.LIST", "r");
	if (d6 <= 0) {
		L0099b6(1, "\nError:Can not open SFXVI.LST\n", "ERROR...CAN NOT OPEN DATA\n");
		SYSCALL_0264_システム異常終了("追加データが登録されていません", "(LOAD_SFXVI_LST)");
	}

	while (d4 <= 19) {
		*a3 = 0;

		XCLIB_fgets(a3, 0x1ff, d6);
		if (XCLIB_strlen(a3) == 0) break;

		if (*a3 == '#') continue;
		if (*a3 != '%') continue;

		a3[XCLIB_strlen(a3)-1] = 0;
		d3 = a6_mi03e0 + d4 * 24;
		XCLIB_strcpy(d3, a3+1);
		XCLIB_strtoupper(d3);
		
		d4++;
	}

L00a7f6:
	XCLIB_fclose(d6);
	L009a08(1);
	SR_BG_LOCATE(2, 3);
	L0099de("== SFXVI STORY SELECTER ==");

	for (d4 = 0; d4 <= 19; d4++) {

		XCLIB_sprintf(a6_mi0488, "   %2d.%-32S\n", d4+1, a6_mi03e0 + d4 * 24);

		SR_BG_LOCATE(2, d4 + 5);
		L0099de(d5);

		SR_BG_LOCATE(4, d4 + 5)
		if (*(a6+d3-0x0408)) {
			L0099de("*");
		} else {
			L0099de(" ");
		}
	}

	SR_BG_LOCATE(5, 26);
	L0099de("*** END ***");

	d4 = 20;
	a4 = -1;

	while (1) {
		SR_VDISP回数指定待機(1);

		SR_STC_TRG_直接状態更新(WORK_1P_0000);
		SR_STC_TRG_直接状態更新(WORK_2P_0000);


		if (WORK_1P_0acc_スティック直接状態 || WORK_2P_0acc_スティック直接状態) {
			d7 = 32767;
			if (WORK_1P_0acc_スティック直接状態 == 2 || WORK_2P_0acc_スティック直接状態 == 2) d4++;
			if (WORK_1P_0acc_スティック直接状態 == 8 || WORK_2P_0acc_スティック直接状態 == 8) d4--;

			if (d4 > 20) d4 = 0;
			if (d4 < 0) d4 = 20;
		} else {
			if (--d7 <= 0) break;
		}
		
		if (d4 != a4) {
			for (d3 = 0; d3 <= 19; d3++) {
				SR_BG_LOCATE(2, d3 + 5);
				L0099de("  ");
			}
			
			SR_BG_LOCATE(2, 26);
			L0099de("  ");

			SR_BG_LOCATE(2, d4 <= 19 ? d4 + 5 : 26);
			L0099de("->");
			
			a4 = d4;
			SR_VDISP回数指定待機(6);
		}
		
		if (WORK_1P_0ad0_xxxx > 0 || WORK_2P_0ad0_xxxx > 0) {
			if (d4 > 19) break;
			
			if (*(a6_mi0408 + d4 * 2) == 0) {
				d1 = 0;
				for (d3 = 0; d3 <= 19; d3++) {
					if (*(a6_mi0408 + d3 * 2)) d1++;
				}
				if (d1 < SFSYSINFO_0480_最大ストーリー数)
					*(a6_mi0408 + d4 * 2] = 1;
			} else {
				*(a6_mi0408 + d4 * 2] = 0;
			}
			
			for (d3 = 0; d3 <= 19; d3++) {
				SR_BG_LOCATE(4, d3 + 5);
				L0099de(*(a6_mi0408 + d3 * 2) ? '*' : ' ');
			}

			SR_VDISP回数指定待機(8);
		}
	}

	d1 = 0;
	for (d3 = 0; d3 <= 19; d3++) {
		if (*(a6_mi0408 + d3 * 2)) d1++;
	}

	if (d1 == 0)
		SYSCALL_0264_システム異常終了("ストーリーが選択されていません", "(SELECT_STORY)");

L00aadc:
	L009a08(1);
	L0099b6(1, "\0", "\n");

	tst.l	(L0690a0)
	ble	L00ab68
	move.l	(L0690a0),d0
	bge	L00ab18
	add.l	#$000003ff,d0
L00ab18:
	XCLIB_sprintf(a6_mi0508, "Character Controller Size = %DKB\n", d0 / 1024);

	move.l	(L0690a0),d0
	bge	L00ab40
	add.l	#$000003ff,d0
L00ab40:
	XCLIB_sprintf(a6_mi0588, "CHAR CONTROLLER SIZE  %DKB\n", d0 / 1024);

	move.l	d3,-(sp)
	pea.l	(-$0508,a6)
	bra	L00ab74
L00ab68:
	pea.l	(L00a5fa)
	pea.l	(L00a616)
L00ab74:
	pea.l	($0001)
	jsr	(L0099b6)
	lea.l	($000c,sp),sp

	SR_VDISP回数指定待機(4);

	XCLIB_sprintf(a6_mi0608, "PCM Channel Count = %d\n", SFSYSINFO_0004_PCMチャンネル数);
	XCLIB_sprintf(a6_mi0688, "PCM CHANNEL  %D\n", SFSYSINFO_0004_PCMチャンネル数);

	L0099b6(1, d3, d4);

	SR_VDISP回数指定待機(4);

	L0099b6(2, "\nRegistering Story ...", "\nREGISTERING STORY..");
	XCLIB_fopen("SFXVI.LST", "r");

	move.l	d0,d6

	for (;;) {
		a3 = a6_mi0200;
		*a3 = 0;
		XCLIB_strlen(a3);
		if (XCLIB_strlen(a3) == 9) break;
		
		if (*a3 == '#') continue;

		if (*a3 == '%') {
			d4++;
			a4 = 0;
			
			if (d4 > 19) break;
			if (*(a6_mi0408 + d4 * 2) == 0) continue;
			if (++d3 > 19) break;

			XCLIB_strcpy(*L069122 + d3 * 24, a6_mi03e0 + d4 * 24);
			continue;
		}
		
		if (d4 < 0) continue;
		if (a4 > 9) continue;
		if (d3 < 0) continue;
		if (*(a6_mi0408 + d4 * 2) == 0) continue;
		
		if (*a3 == '~') {
			d0 = a3;
			if (*a3 != '/') {
				while(*++a3 != '/') ;
			}
			*a3++ = '\0';
			XCLIB_strcpy(d5, d0);
			XCLIB_strcat(d5, "/");
		} else {
			d5 = "\0";
		}
		L00899c(SFSYSINFO_047e_ストーリー内最大ステージ数 * d3 + a4 + 1, d5);
		
		


	moveq.l	#$ff,d4
	movea.w	#$0000,a4
	move.w	d4,d3
	move.l	a6,d5
	add.l	#$fffffb78,d5		;d5 = a6_mi0488;
	lea.l	(SFSYSINFO_047e_ストーリー内最大ステージ数),a5
L00ac2e:
	*a6_mi0200 = 0;
	XCLIB_fgets(a6_mi0200, 511, d6);

	d0 = XCLIB_strlen(a6_mi0200);

	tst.l	d0
	beq	L00adec
	cmpi.b	#$23,(a3)
	beq	L00ac2e
	cmpi.b	#$25,(a3)
	bne	L00acb8
	addq.w	#1,d4
	movea.w	#$0000,a4
	cmp.w	#$0013,d4
	bgt	L00adec
	if (*(a6_mi0408 + d4 * 2) == 0) goto L00ac2e;

	if (++d3 > 19) goto L00adec;

	XCLIB_strcpy(*L069122 + d3 * 24, a6_mi03e0 + d4 * 24);

	bra	L00ac2e
L00acb8:
	if (d4 < 0) goto L00ac2e;
	if (9 < a4) goto L00ac2e;
	if (d3 < 0) goto L00ac2e;

	if (*(a6_mi0408 + d4 * 2) == 0) goto L00ac2e;

	if (*a3 != '~') goto L00ad16;
	d0 = a3;
	if (*a3 == '/') goto L00acf4;

L00acec:
	while (*(++a3) == '/');

L00acf4:
	*(a3++) = 0;

	XCLIB_strcpy(d5, d0);
	XCLIB_strcat(d5, "/");

	move.l	d5,-(sp)
	bra	L00ad1c
L00ad16:
	pea.l	(L00a5ba)	;"\0"
L00ad1c:
	move.w	d3,d0
	muls.w	(a5),d0
	movea.l	d0,a2
	pea.l	($01,a2,a4.w)			SFSYSINFO_047e_ストーリー内最大ステージ数 * d3 + a4 + 1
	jsr	(L00899c)
	addq.w	#8,sp
	move.l	a3,d0
	cmpi.b	#$20,(a3)
	beq	L00ad44
L00ad36:
	cmpi.b	#$09,(a3)
	beq	L00ad44
	addq.w	#1,a3
	cmpi.b	#$20,(a3)
	bne	L00ad36
L00ad44:
	clr.b	(a3)+
	move.l	d0,-(sp)
	move.w	d3,d0
	muls.w	(a5),d0
	movea.l	d0,a2
	pea.l	($01,a2,a4.w)
	jsr	(SR_REG_キャラクタディレクトリ名設定)
	addq.w	#8,sp
L00ad5a:
	cmpi.b	#$20,(a3)
	beq	L00ad66
	cmpi.b	#$09,(a3)
	bne	L00ad6a
L00ad66:
	addq.w	#1,a3
	bra	L00ad5a
L00ad6a:
	if (*a3 == '~') {
		d0 = a3;
		if (*a3 != '/') {
			while (*++a3 != '/') ;
		}
		
		*a3++ = '\0';
		XCLIB_strcpy(d5, d0);
		XCLIB_strcat(d5, "/");
		
		SR_REG_個別ディレクトリ名設定(SFSYSINFO_047e_ストーリー内最大ステージ数 * d3 + a4 + 1, d5);
	} else {
		SR_REG_個別ディレクトリ名設定(SFSYSINFO_047e_ストーリー内最大ステージ数 * d3 + a4 + 1, "");
	}

	move.l	a3,d0
	cmpi.b	#$20,(a3)
	beq	L00add0
L00adc2:
	cmpi.b	#$0a,(a3)
	beq	L00add0
	addq.w	#1,a3
	cmpi.b	#$20,(a3)
	bne	L00adc2
L00add0:
	clr.b	(a3)
	move.l	d0,-(sp)
	move.w	d3,d0
	muls.w	(a5),d0
	movea.l	d0,a2
	pea.l	($01,a2,a4.w)
	jsr	(SR_REG_ステージディレクトリ名設定)
	addq.w	#8,sp
	addq.w	#1,a4
	bra	L00ac2e
L00adec:
	XCLIB_fclose(d6);

	if (L008aea(1) && L008b2e(1)) {
		L0099b6(2, "OK\n", "OK\n");
	} else {
		L0099b6(1, "\nError:Not Exist Data\n", "ERROR...NOT EXIST DATA");
		SYSCALL_0264_システム異常終了("追加データが登録されていません", "(LOAD_SFXVI_LST)");
	}

L00ae5a:
	movem.l	(-$06a8,a6),d3-d7/a3-a5
	unlk	a6
	rts

L00ae64:
	.dc.b	'(ALLOC_SELECT_PIC)',$00,$00
L00ae78:
	.dc.b	'メモリが不足しています',$00,$00
L00ae90:
	.dc.b	'  [CHAR]   / [STAGE]',$0a,$00
L00aea6:
	.dc.b	'%2d.',$0a,$00,$00,$00
L00aeae:
	.dc.b	'  %-8S / %S',$0a,$00,$00
L00aebc:
	.dc.b	'SELECT.PIC',$00,$00
L00aec8:
	.dc.b	'SYSTEM/DUMMY.PIC',$00,$00
L00aeda:
	link	a6,#-$0200
	movem.l	d3-d7/a3-a5,-(sp)

	SFSYSINFO_0010_xxxx = 0;
	d0 = SFSYSINFO_0476_xxxx = SYSCALL_025c_Data確保_メモリブロック(SFSYSINFO_047e_ストーリー内最大ステージ数 * SFSYSINFO_0480_最大ストーリー数 * 2184);
	if (d0 == 0)
		SYSCALL_0264_システム異常終了("メモリが不足しています", "(ALLOC_SELECT_PIC)");

	L005bb0(2, "  [CHAR]   / [STAGE]\n");

	for (d5 = 1; d5 <= SFSYSINFO_0480_最大ストーリー数; d5++) {
		XCLIB_sprintf(a6_mi0180, "%2d.\n", d5);
		L0099b6(2, "", a6_mi0180);

		if (SFSYSINFO_047e_ストーリー内最大ステージ数 < 1)
			continue;
			
		d6 = d5;

		for (d4 = 1; d4 <= SFSYSINFO_047e_ストーリー内最大ステージ数; d4++) {
			a0 = 0x00c40200;	//512*512ドットモードの座標(256,256)
			for (d3 = 0; d3 <= 41; d3++) {
				*a3++ = 0;		// 横方向に26ドット分くりかえし
			}

			d0 = SR_32bit乗算(d5-1, SFSYSINFO_047e_ストーリー内最大ステージ数);
			d3 = d0 + d4;

			if (SYSCALL_0240_Reg取得_登録状態(d5, d4)) {
				XCLIB_sprintf(d7, "  %-8S / %S", SR_REG_キャラクタディレクトリ名取得(d3), SR_REG_ステージディレクトリ名取得(d3));
				XCLIB_sprintf(a6_mi0200, "  %-8S / %S", SR_REG_キャラクタディレクトリ名取得(d3), SR_REG_ステージディレクトリ名取得(d3));

				L0099b6(2, d7, d3);

				L008bf8(WORK_1P_0000, d3);
				L008c7e(WORK_1P_0000, "SELECT.PIC", a6_mi0100);
				SR_PIC画像展開(1, 256, 256, a6_mi0100);

				SR_NAME_SP_読み込み・登録(WORK_1P_0000, d3);
				goto L00b0e0;
			} else {
				SYSCALL_0224_Dataクリア_メモリブロック(32, L0090b6(d3), 16);
				SR_PIC画像展開(1, 256, 256, "SYSTEM/DUMMY.PIC");
			}

			d0 = SYSCALL_0244_Sel取得_アイコン(d5, d4);
			// 26 * 42ドットのグラフィックデータをSel取得_アイコン()で得られたアドレスに書き込む ※ロジック省略

			if (d5 == SFSYSINFO_0480_最大ストーリー数 && d4 == SFSYSINFO_047e_ストーリー内最大ステージ数) {
				L0099b6(1, "\0", "\n");
				break;
			}
		}
	}
}

L00b168:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	movea.w	($176c,a3),a0
	movea.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),a1
	move.l	a1,-(sp)
	pea.l	(-$0001,a0)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	add.w	($176a,a3),d0
	move.w	d0,($000c,a3)
	movea.l	(sp)+,a3
	rts

L00b192:
	move.l	a3,-(sp)
	lea.l	(SFSYSINFO_0016_ステージ番号),a3
	movea.w	($004e,a3),a0
	movea.w	($0468,a3),a1
	move.l	a1,-(sp)
	pea.l	(-$0001,a0)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	add.w	($0464,a3),d0
	move.w	d0,(a3)
	movea.l	(sp)+,a3
	rts

L00b1ba:
	movea.l	($0004,sp),a0
	move.w	($000c,a0),d0
	ext.l	d0
	rts

L00b1c6:
	move.w	(SFSYSINFO_0016_ステージ番号),d0
	ext.l	d0
	rts

L00b1d0:
	lea.l	(SFSYSINFO_047a_現在ステージ番号),a0
	move.w	($0004,a0),d1
	cmp.w	(a0),d1
	bgt	L00b1e2
	moveq.l	#$00,d0
	bra	L00b1f0
L00b1e2:
	lea.l	(SFSYSINFO_047a_現在ステージ番号),a0
	addq.w	#1,(a0)
	addq.w	#1,(-$0464,a0)
	moveq.l	#$01,d0
L00b1f0:
	rts

L00b1f2:
	lea.l	(SFSYSINFO_047a_現在ステージ番号),a1
	move.w	($0004,a1),d1
	cmp.w	(a1),d1
	ble	L00b218
	movea.w	(a1),a0
	pea.l	($0001,a0)
	movea.w	(-$0416,a1),a2
	move.l	a2,-(sp)
	jsr	(SYSCALL_0240_Reg取得_登録状態)
	addq.w	#8,sp
	tst.w	d0
	bne	L00b21c
L00b218:
	moveq.l	#$01,d0
	bra	L00b21e
L00b21c:
	moveq.l	#$00,d0
L00b21e:
	rts

SYSCALL_0230_Sel設定_キャラクタ番号:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),($176a,a0)
	rts

SYSCALL_0250_Sel設定_ストーリー番号:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),($176c,a0)
	rts

SYSCALL_0234_Sel設定_同キャラ識別番号:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	movea.l	($132a,a1),a0
	tst.w	($002a,a0)
	bne	L00b250
	move.w	#$0001,($002a,a1)
L00b250:
	move.w	d0,($001a,a1)
	rts

SYSCALL_0238_Sel設定_ステージ番号:
	move.w	($0006,sp),(SFSYSINFO_047a_現在ステージ番号)
	rts

SYSCALL_023c_Sel設定_全体ストーリー番号:
	move.w	($0006,sp),(SFSYSINFO_0064_全体ストーリー番号)
	rts

SYSCALL_0244_Sel取得_アイコン:
	movem.l	d3/a3,-(sp)
	movea.w	($0012,sp),a3
	lea.l	(SFSYSINFO_0476_xxxx),a0
	move.l	(a0),d3
	movea.w	($000e,sp),a1
	movea.w	($0008,a0),a2
	move.l	a2,-(sp)
	pea.l	(-$0001,a1)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	movea.l	d0,a0
	lea.l	(-$01,a0,a3.w),a2
	move.l	a2,d1
	move.l	d1,d0
	asl.l	#4,d0
	add.l	d1,d0
	asl.l	#4,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	d3,d0
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_024c_Sel表示_ＢＧネーム:
	movem.l	d3-d6/a3-a5,-(sp)
	movea.l	($0020,sp),a3				;a3=p1
	move.w	($0026,sp),d5				;d5=x
	move.w	($002a,sp),d6				;d6=y
	move.w	($0032,sp),d4				;d4=param2
	movea.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),a0
	movea.w	($002e,sp),a1				;a1=param1
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)					;SR_32bit乗算(SFSYSINFO_047e_ストーリー内最大ステージ数, param1);
	addq.w	#8,sp
	move.w	d0,d3
	add.w	d4,d3
	tst.w	d3
	bgt	L00b2f6							;1以上のときスキップ
	move.w	($000a,a3),d0				;プレイヤー番号
	ext.l	d0
	lea.l	(処理順制御フラグ),a0
	add.l	d0,d0
	clr.w	(a0,d0.l)					;処理順制御フラグの次のアドレスをクリア
	bra	L00b516
L00b2f6:
	cmp.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),d4
	bgt	L00b516
	move.w	($000a,a3),d0				;プレイヤー番号
	ext.l	d0
	lea.l	(処理順制御フラグ),a0
	add.l	d0,d0
	cmp.w	(a0,d0.l),d3				;処理順制御フラグの次のアドレスの値と比較
	beq	L00b362
	cmpi.w	#$0001,($000a,a3)			;プレイヤー番号
	bne	L00b324
	move.l	#$00eb9800,d4				;PCG番号48のアドレス
	bra	L00b32a
L00b324:
	move.l	#$00eb9a00,d4				;PCG番号52のアドレス
L00b32a:
	movea.w	d3,a2
	move.l	a2,-(sp)
	jsr	(L0090b6)						;L0090b6(d3);
	addq.w	#4,sp
	tst.l	d0
	beq	L00b350
	pea.l	($0010)
	move.l	d4,-(sp)
	move.l	d0,-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)						;SYSCALL_0220_Dataコピー_メモリブロック(32, d0, d4, 16);
	lea.l	($0010,sp),sp
L00b350:
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(処理順制御フラグ),a0
	add.l	d0,d0
	move.w	d3,(a0,d0.l)
L00b362:
	cmpi.w	#$0100,(L06f44a)
	bne	L00b4a6
	cmpi.w	#$0001,($000a,a3)
	bne	L00b37c
	move.w	#$0fc0,d4
	bra	L00b380
L00b37c:
	move.w	#$0fd0,d4
L00b380:
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)					;引数3:スプライトパターン番号
	movea.w	d6,a4
	move.l	a4,-(sp)					;引数2:y
	movea.w	d5,a5
	move.l	a5,-(sp)					;引数1:x
	lea.l	(SR_BGページ1_書き込み),a3
	jsr	(a3)							;SR_BGページ1_書き込み()
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,d3
	addq.l	#1,d3
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	d3,-(sp)
	addq.w	#1,d5
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a4
	move.l	a4,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	ext.l	d4
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(a3)
	bra	L00b512
L00b4a6:
	cmpi.w	#$0200,(L06f44a)
	bne	L00b516
	cmpi.w	#$0001,($000a,a3)
	bne	L00b4be
	move.w	#$0f30,d3
	bra	L00b4c2
L00b4be:
	move.w	#$0f34,d3
L00b4c2:
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	movea.w	d6,a3
	move.l	a3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	move.l	a3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	move.l	a3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a4)
L00b512:
	lea.l	($000c,sp),sp
L00b516:
	movem.l	(sp)+,d3-d6/a3-a5
	rts

SYSCALL_02c4_Sel更新_PATH_キャラクタ:
	link	a6,#$0000
	move.l	d3,-(sp)
	move.w	($0012,a6),d3
	movea.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),a0
	movea.w	($000e,a6),a1
	pea.l	(-$0001,a1)
	move.l	a0,-(sp)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	add.w	d3,d0
	ext.l	d0
	move.l	d0,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L008bf8)
	addq.w	#8,sp
	move.l	(-$0004,a6),d3
	unlk	a6
	rts

L00b558:
	pea.l	($0001)
	jsr	(L01c4d6)
	addq.w	#4,sp
	jsr	(L01c4e6)
	pea.l	($0001)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	pea.l	($0001)
	jsr	(L017c60)
	addq.w	#4,sp
	jsr	(SYSCALL_01f8_Bgm制御_停止)

	L005e18(WORK_3P_0000, WORK_4P_0000, 6);

	ext.l	d0
	rts

L00b5aa:
	.dc.b	'(END_ALLOC_BGM_ZMD)',$00
L00b5be:
	.dc.b	'メモリが不足しています',$00,$00
L00b5d6:
	.dc.b	'ENDING/BGM_M.ZMD',$00,$00
L00b5e8:
	.dc.b	'ENDING/BGM.ZMD',$00,$00
L00b5f8:
	.dc.b	$00,$00
L00b5fa:
	.dc.b	'TRY NEXT STORY',$00,$00
L00b60a:
	link	a6,#-$0008
	movem.l	d3-d7/a3-a5,-(sp)
	move.l	#WORK_1P_0000,(-$0008,a6)
	move.w	#$0001,(SFSYSINFO_0474_場面_エンディング)
	tst.w	(L033c7a)
	bne	L00b632
	move.l	#WORK_2P_0000,(-$0008,a6)
L00b632:
	lea.l	(SFSYSINFO_0064_全体ストーリー番号),a3
	move.w	(a3),(-$0002,a6)
	lea.l	(-$0058,a3),a4
	move.w	(a4),(-$0004,a6)
	movea.l	(-$0008,a6),a1
	move.w	($176a,a1),d5
	move.w	($176c,a1),d6
	move.w	($001a,a1),d7
	pea.l	($0000)
	jsr	(SR_MESS_SP表示_固定位置)
	addq.w	#4,sp
	jsr	(SYSCALL_0200_Bgm制御_フェードアウト)
	jsr	(SR_画面フェードアウト)
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	jsr	(SR_画面フェードイン)
	move.w	#$0001,(-$004a,a3)
	clr.w	(a4)
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	move.l	#$00008000,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d4
	bne	L00b6dc
	pea.l	(L00b5aa)
	pea.l	(L00b5be)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L00b6dc:
	pea.l	(L00b5d6)
	pea.l	(L00b5e8)
	move.l	d4,-(sp)
	pea.l	(-$0001)
	jsr	(SYSCALL_0208_Bgm展開_ＺＭＤファイル)
	lea.l	($0010,sp),sp
	pea.l	(L00b5f8)
	pea.l	(-$0001)
	jsr	(SYSCALL_020c_Bgm展開_ＺＰＤファイル)
	addq.w	#8,sp
	movea.w	(SFSYSINFO_0002_PCMドラム有効),a1
	move.l	a1,-(sp)
	jsr	(L017c60)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(SYSCALL_01fc_Bgm制御_再生)
	addq.w	#4,sp
	moveq.l	#$01,d3
	cmp.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),d3
	bgt	L00b7e2
	lea.l	(SFSYSINFO_0064_全体ストーリー番号),a5
	lea.l	(WORK_1P_0ad0_xxxx),a3
	lea.l	(WORK_2P_0ad0_xxxx),a4
L00b742:
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	(a5),a1
	move.l	a1,-(sp)
	jsr	(SYSCALL_0240_Reg取得_登録状態)
	addq.w	#8,sp
	tst.w	d0
	beq	L00b7e2
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	jsr	(SR_ラスター割込み設定解除)
	moveq.l	#$03,d2
	cmp.l	(a3),d2
	beq	L00b7e2
	moveq.l	#$fd,d2
	cmp.l	(a3),d2
	beq	L00b7e2
	moveq.l	#$03,d2
	cmp.l	(a4),d2
	beq	L00b7e2
	moveq.l	#$fd,d2
	cmp.l	(a4),d2
	beq	L00b7e2
	move.w	d3,($0c9a,a3)
	move.w	(a5),($0c9c,a3)
	move.w	#$0001,(WORK_1P_001a_同キャラ識別番号)

	L005e18(WORK_1P_0000, WORK_2P_0000, 2);

	addq.w	#1,d3
	cmp.w	(SFSYSINFO_047e_ストーリー内最大ステージ数),d3
	ble	L00b742
L00b7e2:
	lea.l	(WORK_1P_176a_XXXX),a0
	move.w	d5,(a0)
	move.w	d6,($0002,a0)
	move.w	d7,(-$1750,a0)

	L005e18(WORK_1P_0000, WORK_2P_0000, 2);

	move.w	#$0002,(SFSYSINFO_0474_場面_エンディング)
	jsr	(SYSCALL_0200_Bgm制御_フェードアウト)
	jsr	(SR_画面フェードアウト)
	jsr	(SR_ラスター割込み設定解除)
	jsr	(SR_PCM8ファンクションコール_一時停止)
	pea.l	($0001)
	lea.l	(SR_PCM8ファンクションコール_L017eba),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0002)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(L017c60)
	addq.w	#4,sp
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	tst.l	d4
	beq	L00b862
	move.l	d4,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	addq.w	#4,sp
L00b862:
	lea.l	(WORK_1P_176a_XXXX),a4
	move.w	d5,(a4)
	lea.l	($0002,a4),a5
	move.w	d6,(a5)
	move.w	d7,(-$1750,a4)

	L005e18(WORK_1P_0000, WORK_2P, 2);

	lea.l	(SFSYSINFO_007c_xxxx),a3
	clr.w	(a3)
	move.w	#$0068,(-$1764,a4)
	move.w	#$0320,(L0331fa)
	move.w	(-$0002,a6),d1
	subq.w	#1,d1
	pea.l	($0f00)
	ext.l	d1
	move.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	asl.l	#3,d0
	add.l	#L069122,d0
	move.l	d0,-(sp)
	pea.l	($0002)
	move.l	d0,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	lsr.l	#1,d0
	moveq.l	#$10,d2
	sub.l	d0,d2
	move.l	d2,-(sp)
	jsr	(SR_BG文字列描画)
	lea.l	($0010,sp),sp
	movea.w	(a4),a1
	move.l	a1,-(sp)
	movea.w	(a5),a1
	move.l	a1,-(sp)
	pea.l	($0005)
	pea.l	($000c)
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_024c_Sel表示_ＢＧネーム)
	lea.l	($0014,sp),sp
	jsr	(L0043f0)
	lea.l	(SR_画面フェードイン),a5
	jsr	(a5)
	pea.l	($0001)
	pea.l	($0064)				;ACT_アイドル
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	clr.w	(-$0d28,a4)
	pea.l	($0000)
	pea.l	($0066)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L007342)
	lea.l	($0010,sp),sp
	jsr	(SR_BG文字消去_9_23行)
	pea.l	($0c00)
	pea.l	(L00b5fa)
	pea.l	($000e)
	pea.l	($000a)
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
	jsr	(SYSCALL_0200_Bgm制御_フェードアウト)
	pea.l	($0060)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	jsr	(SR_画面フェードアウト)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0001)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	jsr	(SR_ラスター割込み設定解除)
	clr.w	(-$0052,a3)
	clr.w	(-$0054,a3)
	move.w	#$0001,(a3)
	jsr	(a5)
	move.w	(-$0002,a6),(-$0018,a3)
	move.w	(-$0004,a6),(-$0070,a3)
	movea.l	(-$0008,a6),a1
	move.w	d5,($176a,a1)
	move.w	d6,($176c,a1)
	move.w	d7,($001a,a1)
	clr.w	($0a86,a1)
	movea.l	($132a,a1),a0
	move.w	#$0001,($0a86,a0)
	clr.w	($03f8,a3)
	moveq.l	#$01,d0
	movem.l	(-$0028,a6),d3-d7/a3-a5
	unlk	a6
	rts

L00ba06:
	movem.l	a3-a5,-(sp)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00402c)
	addq.w	#8,sp
	lea.l	(WORK_1P_1324_思考完了),a0
	lea.l	(WORK_2P_1324_思考完了),a1
	clr.w	(a1)
	clr.w	(a0)
	clr.w	($041c,a1)
	clr.w	($041c,a0)
	tst.w	(-$115e,a0)
	bgt	L00ba42
	tst.w	(-$115e,a1)
	ble	L00ba56
L00ba42:
	move.w	#$0001,(SFSYSINFO_0078_ヒットストップ)
	subq.w	#1,(WORK_1P_01c6_硬直時間)
	subq.w	#1,(WORK_2P_01c6_硬直時間)
L00ba56:
	lea.l	(SFSYSINFO_0078_ヒットストップ),a4
	tst.w	(a4)
	bne	L00bcdc
	pea.l	(WORK_1P_0000)
	lea.l	(SR_ヒット情報クリア),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	clr.w	($0002,a4)
	lea.l	(WORK_1P_0f22_振動),a4
	lea.l	(WORK_2P_キャラ振動フラグ),a5
	clr.w	(a5)
	clr.w	(a4)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	lea.l	(L00d2dc),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L011116)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L015c8c)
	addq.w	#8,sp
	tst.w	(-$0460,a4)
	bne	L00bb3a
	tst.w	(-$0460,a5)
	bne	L00bb3a
	tst.w	(-$0492,a4)
	ble	L00bb12
	pea.l	(WORK_1P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L00bb12:
	lea.l	(L022b86),a0
	tst.w	(a0)
	ble	L00bb26
	subq.w	#1,(a0)
	tst.w	(a0)
	bgt	L00bb26
	clr.w	(-$156e,a0)
L00bb26:
	lea.l	(L034922),a0
	tst.w	(a0)
	ble	L00bb3a
	subq.w	#1,(a0)
	tst.w	(a0)
	bgt	L00bb3a
	clr.w	(-$156e,a0)
L00bb3a:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00bb58
	movea.w	(-$0d6c,a0),a2
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00bb58:
	lea.l	(WORK_2P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00bb76
	movea.w	(-$0d6c,a0),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00bb76:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a3
	clr.w	(WORK_2P_1756_セル非表示フラグ)
	clr.w	(a3)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00cb2a)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a4
	jsr	(a4)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_2P_0000)
	jsr	(a4)
	addq.w	#8,sp
	tst.w	(-$0c94,a3)
	bne	L00bbd4
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00c0be)
	addq.w	#8,sp
L00bbd4:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00bbf0
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(L00c0be)
	addq.w	#8,sp
L00bbf0:
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L00bc06
	pea.l	(WORK_1P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00bc06:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00bc1c
	pea.l	(WORK_2P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00bc1c:
	lea.l	(WORK_1P_0008_Y座標),a0
	cmpi.w	#$006f,(a0)
	ble	L00bc38
	clr.w	($174c,a0)
	tst.w	($0f12,a0)
	bne	L00bc40
	move.w	#$0070,(a0)
	bra	L00bc40
L00bc38:
	move.w	#$0001,(WORK_1P_1754_xxxx)
L00bc40:
	lea.l	(WORK_2P_0008_Y座標),a0
	cmpi.w	#$006f,(a0)
	ble	L00bc5c
	clr.w	($174c,a0)
	tst.w	($0f12,a0)
	bne	L00bc64
	move.w	#$0070,(a0)
	bra	L00bc64
L00bc5c:
	move.w	#$0001,(WORK_2P_1754_xxxx)
L00bc64:
	jsr	(L0041fa)
	lea.l	(WORK_1P_0a3c_攻撃判定有無),a0
	tst.w	(a0)
	beq	L00bc8e
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00e688)
	lea.l	($000c,sp),sp
L00bc8e:
	lea.l	(L033c30),a0
	tst.w	(a0)
	beq	L00bcb2
	move.l	($0002,a0),-(sp)
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(L00e688)
	lea.l	($000c,sp),sp
L00bcb2:
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	lea.l	(L0040d0),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	bra	L00be24
L00bcdc:
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	lea.l	(WORK_1P_09ea_セル番号),a4
	movea.w	(a4),a2
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	lea.l	(SYSCALL_0000_セル設定_表示),a3
	jsr	(a3)
	addq.w	#8,sp
	lea.l	(WORK_2P_09ea_セル番号),a5
	movea.w	(a5),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L011116)
	addq.w	#8,sp
	tst.w	($00d8,a4)
	bne	L00bd74
	tst.w	($00d8,a5)
	bne	L00bd74
	tst.w	($00a6,a4)
	ble	L00bd52
	pea.l	(WORK_1P_0000)
	jsr	(L019f60)
	addq.w	#4,sp
L00bd52:
	pea.l	($00cd)				;cd=OPT_衝撃硬直
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00cd)				;cd=OPT_衝撃硬直
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
L00bd74:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00bd92
	movea.w	(-$0d6c,a0),a2
	move.l	a2,-(sp)
	pea.l	(WORK_1P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00bd92:
	lea.l	(WORK_2P_1756_セル非表示フラグ),a0
	tst.w	(a0)
	bne	L00bdb0
	movea.w	(-$0d6c,a0),a2
	move.l	a2,-(sp)
	pea.l	(WORK_2P_0000)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
L00bdb0:
	lea.l	(WORK_1P_1756_セル非表示フラグ),a3
	clr.w	(WORK_2P_1756_セル非表示フラグ)
	clr.w	(a3)
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(L00cb2a)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a4
	jsr	(a4)
	addq.w	#8,sp
	pea.l	($00cf)				;cf=OPT_サイクル２
	pea.l	(WORK_2P_0000)
	jsr	(a4)
	addq.w	#8,sp
	tst.w	(-$0c94,a3)
	bne	L00be08
	pea.l	(WORK_1P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00be08:
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00be1e
	pea.l	(WORK_2P_0000)
	jsr	(SR_残像座標更新)
	addq.w	#4,sp
L00be1e:
	jsr	(L0041fa)
L00be24:
	tst.w	(WORK_1P_0ac2_気集中)
	bne	L00be68
	tst.w	(WORK_2P_0ac2_気集中)
	bne	L00be68
	lea.l	(SFSYSINFO_0078_ヒットストップ),a0
	tst.w	(a0)
	ble	L00be40
	subq.w	#1,(a0)
L00be40:
	lea.l	(SFSYSINFO_001c_気絶量減少カウンタ),a0
	addq.w	#1,(a0)
	cmpi.w	#$000d,(a0)
	ble	L00be68
	clr.w	(a0)
	lea.l	(WORK_1P_0032_気絶量),a0
	tst.w	(a0)
	ble	L00be5c
	subq.w	#1,(a0)
L00be5c:
	lea.l	(WORK_2P_0032_気絶量),a0
	tst.w	(a0)
	ble	L00be68
	subq.w	#1,(a0)
L00be68:
	movem.l	(sp)+,a3-a5
	rts

SYSCALL_007c_Cmd実行_防御:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	tst.w	($0012,sp)
	bne	L00be84
	clr.w	($09f0,a3)
	clr.w	($0f06,a3)
	bra	L00bec2
L00be84:
	tst.w	($01be,a3)				;防御許可
	beq	L00bec2
	move.l	a3,-(sp)
	jsr	(SR_防御動作IDチェック)
	addq.w	#4,sp
	tst.w	d0
	bne	L00bec2
	cmpi.w	#$0064,($09e2,a3)		;動作ID==ACT_アイドル
	beq	L00beb0
	cmpi.w	#$0066,($09e2,a3)		;動作ID==ACT_ジャンプ
	bne	L00bec2
	cmpi.w	#$0064,($09e4,a3)		;複合動作ID==ACT_アイドル
	bne	L00bec2
L00beb0:
	move.w	#$0009,($09f0,a3)
	move.w	#$000c,($0f06,a3)
	move.w	($01b6,a3),($1758,a3)
L00bec2:
	movea.l	(sp)+,a3
	rts

L00bec6:
	.dc.b	'     CANCEL',$00
L00bed2:
	.dc.b	'   GUARD',$00,$00
L00bedc:
	link	a6,#-$0004
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0008,a6),a3				;a3=キャラハンドラ
	move.l	($000c,a6),d3
	move.w	#$0001,(-$0004,a6)
	move.w	#$000c,(-$0002,a6)
	tst.w	($1752,a3)					;防御キャンセルフラグをチェック
	bne	L00bf04
	moveq.l	#$00,d0						;フラグが立っていないとき、0を返して終了
	bra	L00c052
L00bf04:
	cmpi.w	#$0001,($000a,a3)
	bne	L00bf18							;プレイヤー番号で分岐
	moveq.l	#$0a,d4
	move.w	#$0001,(SFSYSINFO_007a_セル前面表示フラグ)
	bra	L00bf22
L00bf18:
	moveq.l	#$12,d4
	move.w	#$ffff,(SFSYSINFO_007a_セル前面表示フラグ)
L00bf22:
	pea.l	($0000)
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	move.l	($0980,a3),(L06f432)		;VCT_防御キャンセル処理
	beq	L00bf5e
	pea.l	(-$0004,a6)
	movea.w	d4,a1
	move.l	a1,-(sp)
	pea.l	(-$0002,a6)
	pea.l	(-$0001)
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0018,sp),sp
L00bf5e:
	tst.w	(-$0004,a6)
	beq	L00c00a
	pea.l	($0003)
	pea.l	($0018)
	pea.l	(L00bec6)			;CANCELの文字
	pea.l	(L00bed2)			;GUARDの文字
	move.l	a3,-(sp)
	jsr	(SYSCALL_0064_演出表示_メッセージ)
	lea.l	($0014,sp),sp
	pea.l	($00ec)
	movea.w	($000a,a3),a1
	move.l	a1,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	bra	L00c00a
L00bf9a:
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L003f12)
	addq.w	#8,sp
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_SHOT実行_CMD状態変化・表示)
	addq.w	#8,sp
	move.w	#$0001,(-$0004,a6)
	move.l	($0980,a3),(L06f432)	;VCT_防御キャンセル処理
	beq	L00bfe2
	pea.l	(-$0004,a6)
	movea.w	d4,a1
	move.l	a1,-(sp)
	pea.l	(-$0002,a6)
	pea.l	($0000)
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0018,sp),sp
L00bfe2:
	tst.w	(-$0004,a6)
	beq	L00bfec
	subq.w	#1,(-$0002,a6)
L00bfec:
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L015c8c)
	addq.w	#8,sp
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L00cb2a)
	addq.w	#8,sp
	jsr	(L0041fa)
L00c00a:
	tst.w	(-$0002,a6)
	bgt	L00bf9a
	move.w	#$0001,(-$0004,a6)
	move.l	($0980,a3),(L06f432)	;VCT_防御キャンセル処理
	beq	L00c040
	pea.l	(-$0004,a6)
	ext.l	d4
	move.l	d4,-(sp)
	pea.l	(-$0002,a6)
	pea.l	($0001)
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0018,sp),sp
L00c040:
	pea.l	($0001)			;IVC_無敵
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	clr.w	($1752,a3)
	moveq.l	#$01,d0
L00c052:
	movem.l	(-$0010,a6),d3-d4/a3
	unlk	a6
	rts

SYSCALL_00c4_Cmd実行_歩行:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	clr.w	($01bc,a0)
	clr.w	($09e6,a0)
	tst.w	d0
	beq	L00c082
	bgt	L00c07a
	cmp.w	#$ffff,d0
	beq	L00c08e
	bra	L00c09c
L00c07a:
	cmp.w	#$0001,d0
	beq	L00c088
	bra	L00c09c
L00c082:
	pea.l	($008c)			;8c=SUB_直立
	bra	L00c092
L00c088:
	pea.l	($008d)			;8d=SUB_前方歩行
	bra	L00c092
L00c08e:
	pea.l	($008e)			;8e=SUB_後方歩行
L00c092:
	move.l	a0,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00c09c:
	rts

SYSCALL_00c8_Cmd実行_しゃがみ:
	move.l	($0004,sp),d0
	pea.l	($008f)			;8f=SUB_しゃがむ
	move.l	d0,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	rts

SYSCALL_00c0_状態設定_永続無敵:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),($01c0,a0)		;無敵状態
	rts

L00c0be:
	movem.l	d3-d7/a3-a4,-(sp)
	movea.l	($0020,sp),a4
	movea.l	($0024,sp),a3
	cmpi.w	#$0100,($01c0,a4)			;無敵状態
	beq	L00c1d0
	cmpi.w	#$0100,($01c0,a3)			;無敵状態
	beq	L00c1d0
	tst.w	($01cc,a4)
	bne	L00c1d0
	tst.w	($01cc,a3)
	bne	L00c1d0
	cmpi.w	#$0001,($01b6,a3)
	bne	L00c108
	move.w	($0a0c,a3),d7
	move.w	($0a0e,a3),d6
	move.w	($0a10,a3),d2
	move.w	($0a12,a3),d0
	bra	L00c118
L00c108:
	move.w	($0a14,a3),d7
	move.w	($0a16,a3),d6
	move.w	($0a18,a3),d2
	move.w	($0a1a,a3),d0
L00c118:
	cmpi.w	#$0001,($01b6,a4)
	bne	L00c172
	move.w	($0a0c,a4),d5
	move.w	($0a0e,a4),d4
	move.w	($0a10,a4),d3
	move.w	($0a12,a4),d1
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L00c1d0
	cmp.w	d5,d7
	ble	L00c168
	pea.l	(-$0001)
	bra	L00c1c2
L00c168:
	cmp.w	d4,d6
	blt	L00c1be
	pea.l	(-$0001)
	bra	L00c1c2
L00c172:
	move.w	($0a14,a4),d5
	move.w	($0a16,a4),d4
	move.w	($0a18,a4),d3
	move.w	($0a1a,a4),d1
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L00c1d0
	cmp.w	d4,d6
	blt	L00c1be
	cmp.w	d5,d7
	ble	L00c1be
	pea.l	(-$0001)
	bra	L00c1c2
L00c1be:
	pea.l	($0001)
L00c1c2:
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(L00c410)
	lea.l	($000c,sp),sp
L00c1d0:
	movem.l	(sp)+,d3-d7/a3-a4
	rts

SR_状態設定_相対方向:
	movea.l	($0004,sp),a2				;a2=自分ハンドラ
	movea.l	($0008,sp),a0				;a0=相手ハンドラ
	cmpi.w	#$0001,($01b6,a0)			;相手の表示方向がDRCT_右ではない？
	bne	L00c1f0
	move.w	($0a0c,a0),d1				;右向き時存在矩形X1
	move.w	($0a0e,a0),d0				;右向き時存在矩形X2
	bra	L00c1f8
L00c1f0:
	move.w	($0a14,a0),d1				;左向き時存在矩形X1
	move.w	($0a16,a0),d0				;左向き時存在矩形X2
L00c1f8:
	cmpi.w	#$0001,($01b6,a2)			;自分の表示方向がDRCT_右ではない？
	bne	L00c210
	movea.w	d0,a1
	movea.w	($0a0c,a2),a0
	lea.l	($0014,a0),a0				;a0=自分の右向き時存在矩形X1+20
	cmpa.l	a1,a0
	bgt	L00c226							;自分の方が右側にいる？
	bra	L00c21e
L00c210:
	movea.w	($0a16,a2),a0
	lea.l	(-$0014,a0),a0
	movea.w	d1,a1
	cmpa.l	a0,a1
	ble	L00c226
L00c21e:
	move.w	#$0001,($01b8,a2)			;自分相対方向をDRCT_右に設定
	bra	L00c22c
L00c226:
	move.w	#$ffff,($01b8,a2)			;自分相対方向をDRCT_左に設定
L00c22c:
	rts

SYSCALL_0044_キャラクタ向かい合わせ設定(p1, p2)
{
	if (p1->0008_Y座標 != BASE_LINE) return;
	if (p1->01cc_敗北状態) return;

	SR_状態設定_相対方向(p1, p2);
	SYSCALL_01c8_状態設定_表示方向(p1, p1->01b8_相対方向);
}

SYSCALL_00b0_座標設定_Ｙ移動:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	add.w	d0,($0008,a0)
	tst.w	d0
	beq	L00c284
	pea.l	($00ce)					;ce=OPT_身体位置変化
	move.l	a0,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00c284:
	rts

SYSCALL_001c_座標設定_Ｘ移動２:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a1
	move.l	($000c,sp),d3
	move.w	($0012,sp),d2
	move.w	($0016,sp),d1
	move.w	($001a,sp),d0
	addq.w	#1,($09f8,a1)
	cmp.w	($09f8,a1),d0
	ble	L00c2b0
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	bra	L00c2be
L00c2b0:
	clr.w	($09f8,a1)
	ext.l	d1
	move.l	d1,-(sp)
	movea.w	d2,a0
	pea.l	($0001,a0)
L00c2be:
	move.l	d3,-(sp)
	move.l	a1,-(sp)
	jsr	(SYSCALL_0018_座標設定_Ｘ移動)
	lea.l	($0010,sp),sp
	ext.l	d0
	move.l	(sp)+,d3
	rts

SYSCALL_0018_座標設定_Ｘ移動:
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0024,sp),a4
	movea.l	($0028,sp),a3
	move.w	($002e,sp),d3
	move.w	($0032,sp),d0
	cmp.w	#$ffff,d0
	beq	L00c2f6
	tst.w	d0
	bne	L00c2f8
L00c2f0:
	moveq.l	#$00,d0
	bra	L00c40a
L00c2f6:
	neg.w	d3
L00c2f8:
	cmpi.w	#$0001,($01b6,a4)			;1p表示方向がDRCT_右か？
	bne	L00c316
	movea.w	d3,a5
	adda.w	($0a0c,a4),a5
	move.w	d3,d7
	add.w	($0a0e,a4),d7
	move.w	($0a10,a4),d6
	move.w	($0a12,a4),d2
	bra	L00c32a
L00c316:
	movea.w	d3,a5
	adda.w	($0a14,a4),a5
	move.w	d3,d7
	add.w	($0a16,a4),d7
	move.w	($0a18,a4),d6
	move.w	($0a1a,a4),d2
L00c32a:
	cmpi.w	#$0001,($01b6,a3)			;2p表示方向がDRCT_右か？
	bne	L00c344
	move.w	($0a0c,a3),d5
	move.w	($0a0e,a3),d4
	move.w	($0a10,a3),d1
	move.w	($0a12,a3),d0
	bra	L00c354
L00c344:
	move.w	($0a14,a3),d5
	move.w	($0a16,a3),d4
	move.w	($0a18,a3),d1
	move.w	($0a1a,a3),d0
L00c354:
	cmpi.w	#$0100,($01c0,a4)			;1pがゾンビ状態か？
	beq	L00c3f6
	tst.w	($01cc,a3)					;2pが敗北状態か？
	bne	L00c3f6
	tst.w	d3
	ble	L00c3b0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d7
	move.l	d7,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L00c3f6
	cmp.w	a5,d5
	ble	L00c3f6
	cmpi.w	#$0100,($01c0,a3)		;無敵状態
	beq	L00c2f0
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	bra	L00c3fe
L00c3b0:
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L00c3f6
	cmp.w	d4,d7
	ble	L00c3f6
	cmpi.w	#$0100,($01c0,a3)		;無敵状態
	beq	L00c2f0
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	bra	L00c3fe
L00c3f6:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
L00c3fe:
	jsr	(L00c410)
	lea.l	($000c,sp),sp
	ext.l	d0
L00c40a:
	movem.l	(sp)+,d3-d7/a3-a5
	rts

L00c410:
	movem.l	d3-d5/a3-a5,-(sp)
	movea.l	($001c,sp),a4
	movea.l	($0020,sp),a5
	move.w	($0026,sp),d0
	moveq.l	#$00,d4
	tst.w	(SFSYSINFO_007c_xxxx)
	bne	L00c444
	pea.l	($0001)
	movea.w	d0,a0
	pea.l	(a0,a0.l)
	move.l	a4,-(sp)
	jsr	(L00c5c0)
	lea.l	($000c,sp),sp
	bra	L00c5b8
L00c444:
	tst.w	d0
	ble	L00c4fe
	move.w	d0,d5
	subq.w	#1,d5
	bmi	L00c5b6
L00c452:
	cmpi.w	#$0001,($01b6,a4)
	bne	L00c460
	move.w	($0a0e,a4),d3
	bra	L00c464
L00c460:
	move.w	($0a16,a4),d3
L00c464:
	cmpi.w	#$015f,(L06f430)
	bgt	L00c4d8
	cmp.w	#$00c6,d3
	ble	L00c4de
	cmpi.w	#$000a,($0006,a5)
	ble	L00c4d8
	pea.l	($0001)
	pea.l	(-$0002)
	move.l	a5,-(sp)
	jsr	(L00c5c0)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L00c4d8
	moveq.l	#$01,d4
	addq.w	#2,(L06f430)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	(-$0002)
	pea.l	($0009)				;SHOT_CMD_背景スクロール
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	lea.l	(SR_SHOT実行),a3
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	(-$0002)
	pea.l	($0009)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($0018,sp),sp
	bra	L00c4f4
L00c4d8:
	cmp.w	#$00f4,d3
	bgt	L00c4f4
L00c4de:
	pea.l	($0001)
	pea.l	($0002)
	move.l	a4,-(sp)
	jsr	(L00c5c0)
	lea.l	($000c,sp),sp
	or.w	d0,d4
L00c4f4:
	subq.w	#1,d5
	bpl	L00c452
	bra	L00c5b6
L00c4fe:
	tst.w	d0
	bge	L00c5b6
	move.w	#$ffff,d5
	sub.w	d0,d5
	bmi	L00c5b6
L00c50e:
	cmpi.w	#$0001,($01b6,a4)
	bne	L00c51c
	move.w	($0a0c,a4),d3
	bra	L00c520
L00c51c:
	move.w	($0a14,a4),d3
L00c520:
	cmpi.w	#$00a0,(L06f430)
	ble	L00c594
	cmp.w	#$0038,d3
	bgt	L00c59a
	cmpi.w	#$00c5,($0006,a5)
	bgt	L00c594
	pea.l	($0001)
	pea.l	($0002)
	move.l	a5,-(sp)
	jsr	(L00c5c0)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L00c594
	moveq.l	#$01,d4
	subq.w	#2,(L06f430)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0002)
	pea.l	($0009)				;SHOT_CMD_背景スクロール
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	lea.l	(SR_SHOT実行),a3
	jsr	(a3)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0002)
	pea.l	($0009)				;SHOT_CMD_背景スクロール
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($0018,sp),sp
	bra	L00c5b0
L00c594:
	cmp.w	#$000a,d3
	ble	L00c5b0
L00c59a:
	pea.l	($0001)
	pea.l	(-$0002)
	move.l	a4,-(sp)
	jsr	(L00c5c0)
	lea.l	($000c,sp),sp
	or.w	d0,d4
L00c5b0:
	subq.w	#1,d5
	bpl	L00c50e
L00c5b6:
	move.w	d4,d0
L00c5b8:
	ext.l	d0
	movem.l	(sp)+,d3-d5/a3-a5
	rts

L00c5c0:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	move.w	($000e,sp),d1
	tst.w	d0
	ble	L00c5e4
	add.w	d0,($0006,a0)
	cmpi.w	#$00cf,($0006,a0)
	ble	L00c5f8
	move.w	#$00cf,($0006,a0)
	bra	L00c60e
L00c5e4:
	tst.w	d0
	bge	L00c60e
	add.w	($0006,a0),d0
	move.w	d0,($0006,a0)
	bge	L00c5f8
	clr.w	($0006,a0)
	bra	L00c60e
L00c5f8:
	tst.w	d1
	beq	L00c60a
	pea.l	($00ce)					;ce=OPT_身体位置変化
	move.l	a0,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00c60a:
	moveq.l	#$01,d0
	bra	L00c610
L00c60e:
	moveq.l	#$00,d0
L00c610:
	rts

SYSCALL_00b4_座標設定ＸＹ(p1, x, y)
{
	x0 = p1->0006_X座標;
	y0 = p1->0008_Y座標;
	p1->0006_X座標 = x;
	p1->0008_Y座標 = y;

	if (x != x0 || y != y0)
		SR_キャラ動作関数実行(p1, OPT_身体位置変化);
}

SYSCALL_00b8_座標設定ＸＹ_シューティングモード:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	move.w	#$0070,($0008,a0)
	add.w	#$ff90,d0
	move.w	d0,($0f1c,a0)
	rts

SYSCALL_00bc_座標設定_Ｙ移動_シューティングモード:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	add.w	d0,($0f1c,a0)
	tst.w	d0
	beq	L00c680
	pea.l	($00ce)					;ce=OPT_身体位置変化
	move.l	a0,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00c680:
	rts

SYSCALL_011c_座標設定_間合調節(p1, p2, dist)
{
	d0 = SR_防御動作IDチェック(p1);
	if (d0 == 0) {
		d0 = SYSCALL_0018_座標設定_Ｘ移動(p1, p2, dist, p1->09e8_動作方向);
		if (d0 || p1->0a5a_xxxx) return;

		a0 = p1->01b6_表示方向;
	} else {
		d0 = SYSCALL_0018_座標設定_Ｘ移動(p1, p2, dist, p1->1758_xxxx);
		if (d0 || p1->0a5a_xxxx) return;

		a0 = p1->1758_xxxx;
	}

	SYSCALL_0018_座標設定_Ｘ移動(p2, p1, -dist, a0);
}

SR_残像座標更新:
	movea.l	($0004,sp),a0
	move.l	($0efa,a0),($0efe,a0)
	move.l	($0ef6,a0),($0efa,a0)
	move.l	($0ef2,a0),($0ef6,a0)
	move.l	($0abe,a0),($0ef2,a0)
	move.l	($0aba,a0),($0abe,a0)
	move.l	($0ab6,a0),($0aba,a0)
	move.l	($0ab2,a0),($0ab6,a0)
	move.l	($0aae,a0),($0ab2,a0)
	move.l	($0aaa,a0),($0aae,a0)
	move.w	($0006,a0),($0aaa,a0)
	move.w	($0008,a0),($0aac,a0)
	rts

SR_キャラ超技関連フラグクリア:
	movea.l	($0004,sp),a0
	clr.w	($0aa6,a0)				;超技フラグクリア
	clr.w	($05de,a0)				;超技実行中フラグクリア
	rts

SR_キャラキャンセル可能フラグクリア:
	movea.l	($0004,sp),a0
	clr.w	($01c2,a0)
	clr.w	($1742,a0)				;ccla設定値クリア
	clr.w	($01c4,a0)				;必殺技キャンセル可能フラグクリア
	rts

SYSCALL_010c_同期取得_防御(p1)
{	if (p1->09f0_防御同期値 == 0)
		return SYNC_防御_解除;

	if (SFSYSINFO_0078_ヒットストップ && p1->09f0_ヒットストップ == 32767)
		return SYNC_防御_ヒット硬直;

	d0 = SR_防御動作IDチェック(p1);
	if (SR_防御動作IDチェック(p1))
		return SYNC_防御_反動硬直;

	return SYNC_防御_姿勢;
}

SYSCALL_0114_同期進行_防御(p1, drct)
{
	if (p1->09e2_動作ID == ACT_アイドル || p1->09e2_動作ID == ACT_地上防御) {
		p1->0008_Y座標 = BASE_LINE;
		if (p1->0acc_スティック直接状態) {
			if (p1->0acc_スティック直接状態 <= 3)
				p1->01bc_しゃがみ状態 = 1;
			else
				p1->01bc_しゃがみ状態 = 0;
		} else
			p1->01bc_しゃがみ状態 = 0;

		if (p1->01cc_敗北状態 == 0)
			SR_状態設定_相対方向(p1, drct);
	}

	SYSCALL_00c0_状態設定_永続無敵(p1, IVC_通常);
	SR_キャラ動作関数実行(p1, VCT_防御姿勢表示処理);
}

SYSCALL_0118_同期完了_防御(p1, arg2)
{
	SYSCALL_00d8_同期完了_一般動作(p1, arg2);
	p1->09f0_防御同期値 = 8;
	p1->0a5a_xxxx = 0;
}

SYSCALL_01c8_状態設定_表示方向(p1, drct)
{
	p1->1760_xxxx = drct;
	p1->01b6_表示方向 = drct;
}

SYSCALL_0028_XXXX:
	move.w	(SFSYSINFO_0486_xxxx),d0
	beq	L00c862
	cmp.w	#$0001,d0
	beq	L00c862
	cmp.w	#$000b,d0
	bne	L00c882
L00c862:
	tst.l	(L0690a0)
	ble	L00c876
	pea.l	($0000)
	move.l	(L0690a0),-(sp)
	bra	L00c892
L00c876:
	pea.l	($0000)
	move.l	#$001fa000,-(sp)
	bra	L00c892
L00c882:
	cmp.w	#$0064,d0
	bne	L00c89a
	pea.l	($0000)
	move.l	#$003ee000,-(sp)
L00c892:
	jsr	(XCLIB_dos_keeppr)
	addq.w	#8,sp
L00c89a:
	rts

SYSCALL_0000_セル設定_表示:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	movea.w	($000e,sp),a2
	move.l	a2,-(sp)
	move.l	a3,-(sp)
	jsr	(L00caa6)
	addq.w	#8,sp
	movea.l	d0,a1
	lea.l	($0010,a1),a0
	cmpa.w	#$0000,a1
	ble	L00caa2
	move.w	#$0001,($1756,a3)
	tst.w	($0a08,a3)		;DSP水平反転フラグ
	bne	L00c954
	move.w	($0006,a3),d0
	add.w	($0008,a1),d0
	movea.w	d0,a2
	adda.w	(a0),a2
	move.w	a2,($0a0c,a3)
	movea.w	d0,a2
	adda.w	($0002,a0),a2
	move.w	a2,($0a0e,a3)
	movea.w	d0,a2
	adda.w	($0008,a0),a2
	move.w	a2,($0a1c,a3)
	movea.w	d0,a2
	adda.w	($000a,a0),a2
	move.w	a2,($0a1e,a3)
	movea.w	d0,a2
	adda.w	($0010,a0),a2
	move.w	a2,($0a2c,a3)
	add.w	($0012,a0),d0
	move.w	d0,($0a2e,a3)
	move.w	($0008,a1),d0
	add.w	#$ffd0,d0
	movea.w	($0006,a3),a2
	suba.w	d0,a2
	move.w	a2,d0
	suba.w	($0002,a0),a2
	move.w	a2,($0a14,a3)
	movea.w	d0,a2
	suba.w	(a0),a2
	move.w	a2,($0a16,a3)
	movea.w	d0,a2
	suba.w	($000a,a0),a2
	move.w	a2,($0a24,a3)
	movea.w	d0,a2
	suba.w	($0008,a0),a2
	move.w	a2,($0a26,a3)
	movea.w	d0,a2
	suba.w	($0012,a0),a2
	move.w	a2,($0a34,a3)
	sub.w	($0010,a0),d0
	bra	L00c9e4
L00c954:
	move.w	($0a00,a3),d0		;DSP横方向スプライト数
	asl.w	#4,d0
	add.w	($0006,a3),d0
	add.w	($0008,a1),d0
	movea.w	d0,a2
	suba.w	($0002,a0),a2
	move.w	a2,($0a0c,a3)
	movea.w	d0,a2
	suba.w	(a0),a2
	move.w	a2,($0a0e,a3)
	movea.w	d0,a2
	suba.w	($000a,a0),a2
	move.w	a2,($0a1c,a3)
	movea.w	d0,a2
	suba.w	($0008,a0),a2
	move.w	a2,($0a1e,a3)
	movea.w	d0,a2
	suba.w	($0012,a0),a2
	move.w	a2,($0a2c,a3)
	sub.w	($0010,a0),d0
	move.w	d0,($0a2e,a3)
	move.w	($0a00,a3),d0		;DSP横方向スプライト数
	asl.w	#4,d0
	add.w	#$ffd0,d0
	movea.w	($0006,a3),a2
	suba.w	d0,a2
	move.w	a2,d0
	sub.w	($0008,a1),d0
	movea.w	d0,a2
	adda.w	(a0),a2
	move.w	a2,($0a14,a3)
	movea.w	d0,a2
	adda.w	($0002,a0),a2
	move.w	a2,($0a16,a3)
	movea.w	d0,a2
	adda.w	($0008,a0),a2
	move.w	a2,($0a24,a3)
	movea.w	d0,a2
	adda.w	($000a,a0),a2
	move.w	a2,($0a26,a3)
	movea.w	d0,a2
	adda.w	($0010,a0),a2
	move.w	a2,($0a34,a3)
	add.w	($0012,a0),d0
L00c9e4:
	move.w	d0,($0a36,a3)
	tst.w	($0a0a,a3)			;DSP垂直反転フラグ
	bne	L00ca42
	move.w	($0008,a3),d0
	add.w	($000a,a1),d0
	move.w	d0,d1
	add.w	($0004,a0),d1
	move.w	d1,($0a18,a3)
	move.w	d1,($0a10,a3)
	move.w	d0,d1
	add.w	($0006,a0),d1
	move.w	d1,($0a1a,a3)
	move.w	d1,($0a12,a3)
	move.w	d0,d1
	add.w	($000c,a0),d1
	move.w	d1,($0a28,a3)
	move.w	d1,($0a20,a3)
	move.w	d0,d1
	add.w	($000e,a0),d1
	move.w	d1,($0a2a,a3)
	move.w	d1,($0a22,a3)
	move.w	d0,d1
	add.w	($0014,a0),d1
	move.w	d1,($0a38,a3)
	move.w	d1,($0a30,a3)
	add.w	($0016,a0),d0
	bra	L00ca9a
L00ca42:
	move.w	($0a02,a3),d0		;DSP縦方向スプライト数
	asl.w	#4,d0
	add.w	($0008,a3),d0
	add.w	($000a,a1),d0
	move.w	d0,d1
	sub.w	($0006,a0),d1
	move.w	d1,($0a18,a3)
	move.w	d1,($0a10,a3)
	move.w	d0,d1
	sub.w	($0004,a0),d1
	move.w	d1,($0a1a,a3)
	move.w	d1,($0a12,a3)
	move.w	d0,d1
	sub.w	($000e,a0),d1
	move.w	d1,($0a28,a3)
	move.w	d1,($0a20,a3)
	move.w	d0,d1
	sub.w	($000c,a0),d1
	move.w	d1,($0a2a,a3)
	move.w	d1,($0a22,a3)
	move.w	d0,d1
	sub.w	($0016,a0),d1
	move.w	d1,($0a38,a3)
	move.w	d1,($0a30,a3)
	sub.w	($0014,a0),d0
L00ca9a:
	move.w	d0,($0a3a,a3)
	move.w	d0,($0a32,a3)
L00caa2:
	movea.l	(sp)+,a3
	rts

L00caa6:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d1
	cmp.w	#$01ff,d1
	ble	L00cac4
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	movea.l	($0f6e,a0),a0
	bra	L00cae8
L00cac4:
	cmp.w	#$00ff,d1
	bgt	L00cada
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	movea.l	($01d0,a0),a0
	bra	L00cae8
L00cada:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	movea.l	($0f2e,a0),a0
L00cae8:
	cmpa.w	#$0000,a0
	ble	L00cb26
	tst.w	($0f1a,a1)
	beq	L00cafa
	move.w	($0f1c,a1),($000a,a0)
L00cafa:
	move.w	d1,($09ea,a1)
	move.l	(a0),($0020,a1)
	move.w	($0004,a0),($0a00,a1)		;DSP横方向スプライト数
	move.w	($0006,a0),($0a02,a1)		;DSP縦方向スプライト数
	move.w	($0008,a0),($0a04,a1)
	move.w	($000a,a0),($0a06,a1)
	move.w	($000c,a0),($0a08,a1)		;DSP水平反転フラグ
	move.w	($000e,a0),($0a0a,a1)		;DSP垂直反転フラグ
L00cb26:
	move.l	a0,d0
	rts

L00cb2a:
	movea.l	($0004,sp),a1
	movea.l	($0008,sp),a0
	tst.w	(SFSYSINFO_007a_セル前面表示フラグ)
	bgt	L00cb6a
	bge	L00cb4a
	move.w	#$005a,($001e,a1)			;5a=90
	move.w	#$001a,($001e,a0)			;1a=26
	bra	L00cb8c
L00cb4a:
	cmpi.w	#$0027,($09e2,a1)		;ユーザー定義攻撃動作ID最大値
	bgt	L00cb62
	cmpi.w	#$0027,($09e2,a0)
	bgt	L00cb62
	tst.w	($05de,a0)				;超技実行中フラグ
	bne	L00cb80
	bra	L00cb6a
L00cb62:
	cmpi.w	#$0027,($09e2,a1)
	bgt	L00cb78
L00cb6a:
	move.w	#$001a,($001e,a1)
	move.w	#$005a,($001e,a0)
	bra	L00cb8c
L00cb78:
	cmpi.w	#$0027,($09e2,a0)
	bgt	L00cb8c
L00cb80:
	move.w	#$001a,($001e,a0)
	move.w	#$005a,($001e,a1)
L00cb8c:
	rts

SR_矩形接触判定:
	movem.l	d3-d7,-(sp)
	move.w	($001a,sp),d6			;d6=p1x1
	move.w	($001e,sp),d7			;d7=p1x2
	move.w	($0022,sp),d2			;d2=p1y1
	move.w	($0026,sp),d3			;d3=p1y2
	move.w	($002a,sp),d4			;d4=p2x1
	move.w	($002e,sp),d5			;d5=p2x2
	move.w	($0032,sp),d0			;d0=p2y1
	move.w	($0036,sp),d1			;d1=p2y2
	cmp.w	d0,d2
	blt	L00cbba
	cmp.w	d2,d1
	bge	L00cbca
L00cbba:
	cmp.w	d0,d3
	blt	L00cbc2
	cmp.w	d3,d1
	bge	L00cbca
L00cbc2:
	cmp.w	d2,d0
	blt	L00cbe6						;
	cmp.w	d1,d3
	blt	L00cbe6
L00cbca:
	cmp.w	d4,d6
	blt	L00cbd2
	cmp.w	d6,d5
	bge	L00cbe2
L00cbd2:
	cmp.w	d4,d7
	blt	L00cbda
	cmp.w	d7,d5
	bge	L00cbe2
L00cbda:
	cmp.w	d6,d4
	blt	L00cbe6
	cmp.w	d5,d7
	blt	L00cbe6
L00cbe2:
	moveq.l	#$01,d0
	bra	L00cbe8
L00cbe6:
	moveq.l	#$00,d0
L00cbe8:
	movem.l	(sp)+,d3-d7
	rts

L00cbee:
	movem.l	d3-d6/a3,-(sp)
	move.w	($001a,sp),d6
	move.w	($001e,sp),d5
	move.w	($0022,sp),d4
	move.w	($0026,sp),d3
	movea.l	($0028,sp),a3
	cmpi.w	#$0001,($01b6,a3)
	bne	L00cc5e
	movea.w	($0a12,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a10,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a0e,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a0c,a3),a0
	move.l	a0,-(sp)
	movea.w	d3,a0
	move.l	a0,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	bne	L00ccca
	movea.w	($0a22,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a20,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a1e,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a1c,a3),a0
	bra	L00ccaa
L00cc5e:
	movea.w	($0a1a,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a18,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a16,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a14,a3),a0
	move.l	a0,-(sp)
	movea.w	d3,a0
	move.l	a0,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	bne	L00ccca
	movea.w	($0a2a,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a28,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a26,a3),a0
	move.l	a0,-(sp)
	movea.w	($0a24,a3),a0
L00ccaa:
	move.l	a0,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L00ccce
L00ccca:
	moveq.l	#$01,d0
	bra	L00ccd0
L00ccce:
	moveq.l	#$00,d0
L00ccd0:
	movem.l	(sp)+,d3-d6/a3
	rts

L00ccd6:
	.dc.b	'           1P    2P',$00
L00ccea:
	.dc.b	'ACT ID  %5d %5d',$00
L00ccfa:
	.dc.b	'SUB ID  %5d %5d',$00
L00cd0a:
	.dc.b	'COUNTER %5d %5d',$00
L00cd1a:
	.dc.b	'ATC NUM %5d %5d',$00
L00cd2a:
	.dc.b	'ATC LV  %5d %5d',$00
L00cd3a:
	.dc.b	'MUL VAL %5d %5d',$00
L00cd4a:
	.dc.b	'CCLA    %5X %5X',$00
L00cd5a:
	.dc.b	'GUARD   %5d %5d',$00
L00cd6a:
	.dc.b	'IVT     %5d %5d',$00
L00cd7a:
	.dc.b	'LIFE    %5d %5d',$00
L00cd8a:
	.dc.b	'FAINT   %5d %5d',$00
L00cd9a:
	.dc.b	'STC INP %5d %5d',$00
L00cdaa:
	.dc.b	'TRG INP %5d %5d',$00
L00cdba:
	.dc.b	'INTERVAL  %5d  ',$00
SR_デバッグパラメータ表示()
{
	SR_BG文字列描画(11, 9, "           1P    2P", 0x0d00);

	XCLIB_sprintf(a6_mi0042, "ACT ID  %5d %5d", WORK_1P_09e2_動作ID, WORK_2P_09e2_動作ID);
	SR_BG文字列描画(11, 10, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "SUB ID  %5d %5d", WORK_1P_09e4_複合動作ID, WORK_2P_09e4_複合動作ID);
	SR_BG文字列描画(11, 11, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "COUNTER %5d %5d", WORK_1P_09ee_カウンタ現在値, WORK_2P_09ee_カウンタ現在値);
	SR_BG文字列描画(11, 12, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "ATC NUM %5d %5d", WORK_1P_0a44_最多ヒット数, WORK_2P_0a44_最多ヒット数);
	SR_BG文字列描画(11, 13, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "ATC LV  %5d %5d", WORK_1P_0a46_威力レベル, WORK_2P_0a46_威力レベル);
	SR_BG文字列描画(11, 14, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "MUL VAL %5d %5d", WORK_1P_05d6_多重化指定値, WORK_2P_05d6_多重化指定値);
	SR_BG文字列描画(11, 15, a6_mi042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "CCLA    %5X %5X", WORK_1P_1742_基本技キャンセル設定値, WORK_2P_1742_基本技キャンセル設定値);
	SR_BG文字列描画(11, 16, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "GUARD   %5d %5d", WORK_1P_09f0_防御同期値, WORK_2P_09f0_防御同期値);
	SR_BG文字列描画(11, 17, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "IVT     %5d %5d", WORK_1P_01c0_無敵状態, WORK_2P_01c0_無敵状態);
	SR_BG文字列描画(11, 18, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "LIFE    %5d %5d", WORK_1P_002e_残り体力, WORK_2P_002e_残り体力);
	SR_BG文字列描画(11, 19, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "FAINT   %5d %5d", WORK_1P_0032_気絶量, WORK_2P_0032_気絶量);
	SR_BG文字列描画(11, 20, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "STC INP %5d %5d", WORK_1P_0acc_スティック直接状態, WORK_2P_0acc_スティック直接状態);
	SR_BG文字列描画(11, 21, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "TRG INP %5d %5d", WORK_1P_0ad4_トリガー直接状態１, WORK_2P_0ad4_トリガー直接状態１);
	SR_BG文字列描画(11, 22, a6_mi0042, 0x0c00);

	XCLIB_sprintf(a6_mi0042, "INTERVAL  %5d  ", SYSCALL_0038_座標取得_相手距離(WORK_1P_0000));
	SR_BG文字列描画(11, 23, a6_mi0042, 0x0c00);
}

SR_デバッグ_矩形表示:
	link	a6,#-$000c
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a1				;a1=p1
	move.w	($000a,a1),d0				;d0=プレイヤー番号
	ext.l	d0
	subq.l	#1,d0
	lea.l	(L01fefa),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d1				;d1=L01fefa(1pのとき), L01fefc(2pのとき)
	eori.w	#$0001,d1
	move.w	d1,(a0,d0.l)				;1とXORを取って上書き
	beq	L00d2d2
	cmpi.w	#$0039,($001e,a1)
	bgt	L00d0dc
	moveq.l	#$00,d4
	bra	L00d0de
L00d0dc:
	moveq.l	#$0c,d4
L00d0de:
	cmpi.w	#$0001,($01b6,a1)
	bne	L00d124
	move.w	($0a0c,a1),d1
	move.w	($0a0e,a1),d3
	move.w	($0a10,a1),d0
	move.w	($0a12,a1),d5
	move.w	($0a1c,a1),d7
	move.w	($0a1e,a1),(-$000c,a6)
	move.w	($0a20,a1),d6
	move.w	($0a22,a1),(-$0002,a6)
	move.w	($0a2c,a1),(-$0004,a6)
	move.w	($0a2e,a1),(-$0006,a6)
	move.w	($0a30,a1),(-$0008,a6)
	move.w	($0a32,a1),(-$000a,a6)
	bra	L00d160
L00d124:
	move.w	($0a14,a1),d1
	move.w	($0a16,a1),d3
	move.w	($0a18,a1),d0
	move.w	($0a1a,a1),d5
	move.w	($0a24,a1),d7
	move.w	($0a26,a1),(-$000c,a6)
	move.w	($0a28,a1),d6
	move.w	($0a2a,a1),(-$0002,a6)
	move.w	($0a34,a1),(-$0004,a6)
	move.w	($0a36,a1),(-$0006,a6)
	move.w	($0a38,a1),(-$0008,a6)
	move.w	($0a3a,a1),(-$000a,a6)
L00d160:
	pea.l	($0003)
	pea.l	($0dee)
	movea.w	d0,a5
	lea.l	($0010,a5),a5
	move.l	a5,-(sp)
	movea.w	d1,a4
	lea.l	($0010,a4),a4
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a3
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	pea.l	($4dee)
	move.l	a5,-(sp)
	movea.w	d3,a5
	move.l	a5,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$00008dee,-(sp)
	move.w	d5,d3
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$0000cdee,-(sp)
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	pea.l	($0fee)
	movea.w	d6,a5
	lea.l	($0010,a5),a5
	move.l	a5,-(sp)
	movea.w	d7,a4
	lea.l	($0010,a4),a4
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	pea.l	($4fee)
	move.l	a5,-(sp)
	movea.w	(-$000c,a6),a5
	move.l	a5,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$00008fee,-(sp)
	move.w	(-$0002,a6),d3
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$0000cfee,-(sp)
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	pea.l	($0cee)
	movea.w	(-$0008,a6),a5
	lea.l	($0010,a5),a5
	move.l	a5,-(sp)
	movea.w	(-$0004,a6),a4
	lea.l	($0010,a4),a4
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	pea.l	($4cee)
	move.l	a5,-(sp)
	movea.w	(-$0006,a6),a5
	move.l	a5,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$00008cee,-(sp)
	move.w	(-$000a,a6),d3
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.w	d4,a0
	addq.w	#1,d4
	move.l	a0,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	#$0000ccee,-(sp)
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(a3)
	lea.l	($0014,sp),sp
L00d2d2:
	movem.l	(-$002c,a6),d3-d7/a3-a5
	unlk	a6
	rts

L00d2dc:
	movem.l	a3-a4,-(sp)
	movea.l	($000c,sp),a4
	movea.l	($0010,sp),a3
	tst.w	($0ac2,a3)
	beq	L00d2f6
	tst.w	($0ac2,a4)
	ble	L00d376
L00d2f6:
	tst.w	($09e2,a4)
	blt	L00d376
	cmpi.w	#$0027,($09e2,a4)
	bgt	L00d31c
	pea.l	($0000)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	clr.w	($01be,a4)
	bra	L00d34a
L00d31c:
	cmpi.w	#$0064,($09e4,a4)
	beq	L00d344
	pea.l	($0000)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	clr.w	($01be,a4)
	cmpi.w	#$0027,($09e4,a4)
	bgt	L00d366
	bra	L00d34a
L00d344:
	tst.w	($0f0c,a4)
	beq	L00d362
L00d34a:
	cmpi.w	#$0027,($09e2,a3)
	ble	L00d366
	cmpi.w	#$0064,($09e4,a3)
	bne	L00d366
	move.w	#$0001,($01be,a3)
	bra	L00d366
L00d362:
	clr.w	($01be,a3)
L00d366:
	movea.w	($09e2,a4),a0
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L00d376:
	movem.l	(sp)+,a3-a4
	rts

SR_CPU思考_超技:
	movem.l	d3-d4/a3-a4,-(sp)
	movea.l	($0014,sp),a4
	move.l	($0018,sp),d3
	move.w	($001e,sp),d4
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(L00d3d0)
	addq.w	#8,sp
	move.l	a4,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	tst.w	($0a86,a4)			;CPU制御状態？
	beq	L00d3ca					;人間の時終了
	movea.w	d4,a3
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_CPU超技実行判定)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(L011f3c)
	lea.l	($000c,sp),sp
L00d3ca:
	movem.l	(sp)+,d3-d4/a3-a4
	rts

L00d3d0:
	movea.l	($0004,sp),a0
	clr.w	($0a42,a0)			;攻撃過程値クリア
	clr.w	($0a3c,a0)			;攻撃判定有無クリア
	move.l	a0,-(sp)
	jsr	(SR_キャラキャンセル可能フラグクリア)
	addq.w	#4,sp
	rts

SYSCALL_002c_XXXX:
	move.l	($0004,sp),d1
	move.l	($0008,sp),d2
	move.w	($000e,sp),d0
	move.l	($0010,sp),-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	d2,-(sp)
	move.l	d1,-(sp)
	jsr	(SYSCALL_00dc_ファイル読み込み)
	lea.l	($0010,sp),sp
	ext.l	d0
	rts

L00d40e:
	.dc.b	$72,$62,$00,$00
SYSCALL_00dc_ファイル読み込み:
	link	a6,#$0000
	movem.l	d3-d4,-(sp)
	pea.l	(L00d40e)
	move.l	($000c,a6),-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(SYSCALL_0294_Sfxvi_fopen)
	lea.l	($000c,sp),sp
	move.l	d0,d4
	bgt	L00d43a
	moveq.l	#$ff,d0
	bra	L00d460
L00d43a:
	move.l	d4,-(sp)
	pea.l	($0001)
	move.l	($0010,a6),-(sp)
	move.l	($0014,a6),-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d0,d3
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	move.l	d3,d0
L00d460:
	movem.l	(-$0008,a6),d3-d4
	unlk	a6
	rts

SYSCALL_0268_Data取得_ファイルサイズ:
	link	a6,#-$0136
	move.l	d3,-(sp)
	move.l	a6,d3
	add.l	#$fffffeca,d3
	move.l	d3,-(sp)
	move.l	($000c,a6),-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	tst.l	d0
	bge	L00d4aa
	moveq.l	#$ff,d0
	bra	L00d4b8
L00d4aa:
	tst.l	(-$001c,a6)
	bne	L00d4b4
	moveq.l	#$00,d0
	bra	L00d4b8
L00d4b4:
	move.l	(-$001c,a6),d0
L00d4b8:
	move.l	(-$013a,a6),d3
	unlk	a6
	rts

SYSCALL_003c_XXXX:
	link	a6,#$0000
	move.l	a3,-(sp)
	movea.l	($0008,a6),a3
	move.w	($0012,a6),d2
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L01fefc),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d1
	move.w	#$0001,($0f22,a3)
	subq.w	#1,d1
	bne	L00d506
	movea.w	($01b6,a3),a1
	move.l	a1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	move.l	($000c,a6),-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0018_座標設定_Ｘ移動)
	lea.l	($0010,sp),sp
	moveq.l	#$03,d1
L00d506:
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L01fefc),a0
	add.l	d0,d0
	move.w	d1,(a0,d0.l)
	movea.l	(-$0004,a6),a3
	unlk	a6
	rts

SYSCALL_0040_XXXX:
	movem.l	d3-d4/a3-a4,-(sp)
	movea.l	($0014,sp),a3
	move.l	($0018,sp),d4
	move.w	($001e,sp),d3
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L01ff00),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d1
	move.w	#$0001,($0f22,a3)
	subq.w	#1,d1
	bne	L00d582
	movea.w	($09e8,a3),a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	lea.l	(SYSCALL_0018_座標設定_Ｘ移動),a4
	jsr	(a4)
	lea.l	($0010,sp),sp
	tst.w	d0
	bne	L00d580
	movea.w	($01b6,a3),a1
	move.l	a1,-(sp)
	muls.w	#$ffff,d3
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
L00d580:
	moveq.l	#$03,d1
L00d582:
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L01ff00),a0
	add.l	d0,d0
	move.w	d1,(a0,d0.l)
	movem.l	(sp)+,d3-d4/a3-a4
	rts

SYSCALL_0020_ゲージ減少_サブ:
	movea.l	($0004,sp),a1				;p1
	move.w	($000a,sp),d0				;減値
	tst.w	(SFSYSINFO_0032_飛び道具無限)
	beq	L00d5be
	subq.w	#1,d0						;増減値が0以下だったら何もせず終了
	bmi	L00d5be
	lea.l	($0a4a,a1),a0				;サブゲージ値
L00d5b2:
	tst.w	($0a4a,a1)
	ble	L00d5ba
	subq.w	#1,(a0)						;サブゲージ値が1以上なら-1
L00d5ba:
	subq.w	#1,d0
	bpl	L00d5b2							;ループ回数が0になるまで繰り返し
L00d5be:
	rts

SYSCALL_0048_ゲージ増加_サブ:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	add.w	($0a4a,a0),d0
	cmp.w	#$000a,d0
	ble	L00d5d4
	moveq.l	#$0a,d0
L00d5d4:
	move.w	d0,($0a4a,a0)
	rts

SYSCALL_004c_乱数発生:
	jsr	(乱数発生)
	ext.l	d0
	rts

SYSCALL_0058_ゲージ増減_超技:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3
	move.w	($0016,sp),d4
	bge	L00d5fc
	tst.w	(SFSYSINFO_003e_スーパーコンボ無限)
	bne	L00d6ac
L00d5fc:
	move.w	($0aa4,a3),d3
	subq.w	#1,d3
	bmi	L00d63a
L00d604:
	cmpi.w	#$0001,($000a,a3)
	bne	L00d61c
	pea.l	($0000)
	pea.l	($001a)
	movea.w	d3,a0
	pea.l	($0002,a0)
	bra	L00d62c
L00d61c:
	pea.l	($0000)
	pea.l	($001a)
	movea.w	#$001d,a1
	suba.w	d3,a1
	move.l	a1,-(sp)
L00d62c:
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#1,d3
	bpl	L00d604
L00d63a:
	tst.w	d4
	bge	L00d658
	tst.w	(SFSYSINFO_003e_スーパーコンボ無限)
	bne	L00d6ac
	move.w	d4,d0
	add.w	($0aa4,a3),d0
	move.w	d0,($0aa4,a3)
	bge	L00d66e
	clr.w	($0aa4,a3)
	bra	L00d66e
L00d658:
	tst.w	d4
	ble	L00d66e
	add.w	d4,($0aa4,a3)
	cmpi.w	#$000a,($0aa4,a3)
	ble	L00d66e
	move.w	#$000a,($0aa4,a3)
L00d66e:
	move.w	($0aa4,a3),d3
	subq.w	#1,d3
	bmi	L00d6ac
L00d676:
	cmpi.w	#$0001,($000a,a3)
	bne	L00d68e
	pea.l	($0b1d)
	pea.l	($001a)
	movea.w	d3,a0
	pea.l	($0002,a0)
	bra	L00d69e
L00d68e:
	pea.l	($0b1d)
	pea.l	($001a)
	movea.w	#$001d,a1
	suba.w	d3,a1
	move.l	a1,-(sp)
L00d69e:
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#1,d3
	bpl	L00d676
L00d6ac:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_0060_演出表示_ヒットマーク:
	link	a6,#$0000
	move.w	($000e,a6),d2
	move.w	($0012,a6),d1
	tst.w	($0016,a6)
	bne	L00d6c8
	moveq.l	#$01,d0
	bra	L00d6ca
L00d6c8:
	moveq.l	#$64,d0
L00d6ca:
	pea.l	($0001)
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L00f282)
	lea.l	($0014,sp),sp
	unlk	a6
	rts

SYSCALL_0050_演出表示_テキスト:
	link	a6,#$0000
	move.w	($000a,a6),d2
	move.w	($000e,a6),d1
	move.w	($0016,a6),d0
	cmp.w	#$0a00,d0
	bne	L00d708
	move.w	#$0b00,d0
	bra	L00d712
L00d708:
	cmp.w	#$0e00,d0
	bne	L00d712
	move.w	#$0f00,d0
L00d712:
	ext.l	d0
	move.l	d0,-(sp)
	move.l	($0010,a6),-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	jsr	(SR_BG文字列描画)
	lea.l	($0010,sp),sp
	unlk	a6
	rts

SYSCALL_0064_演出表示_メッセージ:
	movem.l	d3-d4/a3-a4,-(sp)
	movea.l	($0014,sp),a0
	move.l	($0018,sp),d2
	move.l	($001c,sp),d3
	move.w	($0022,sp),d1
	move.w	($0026,sp),d0
	ext.l	d0
	moveq.l	#$05,d4
	cmp.l	d4,d0
	bhi	L00d7de
	add.l	d0,d0
	move.w	(L00d75c,pc,d0.l),d4
	jmp	(L00d75c,pc,d4.w)

L00d75c:
	.dc.w	L00d768-L00d75c
	.dc.w	L00d768-L00d75c
	.dc.w	L00d76e-L00d75c
	.dc.w	L00d774-L00d75c
	.dc.w	L00d77a-L00d75c
	.dc.w	L00d77a-L00d75c
L00d768:
	move.w	#$0b00,d0
	bra	L00d77e
L00d76e:
	move.w	#$0c00,d0
	bra	L00d77e
L00d774:
	move.w	#$0d00,d0
	bra	L00d77e
L00d77a:
	move.w	#$0f00,d0
L00d77e:
	move.w	d1,($0a98,a0)
	cmpi.w	#$0001,($000a,a0)
	bne	L00d7b2
	movea.w	d0,a3
	move.l	a3,-(sp)
	move.l	d2,-(sp)
	pea.l	($000c)
	pea.l	($0001)
	lea.l	(SR_BG文字列描画),a4
	jsr	(a4)
	lea.l	($0010,sp),sp
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	pea.l	($000d)
	pea.l	($0001)
	bra	L00d7d8
L00d7b2:
	movea.w	d0,a3
	move.l	a3,-(sp)
	move.l	d2,-(sp)
	pea.l	($000c)
	pea.l	($0010)
	lea.l	(SR_BG文字列描画),a4
	jsr	(a4)
	lea.l	($0010,sp),sp
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	pea.l	($000d)
	pea.l	($0010)
L00d7d8:
	jsr	(a4)
	lea.l	($0010,sp),sp
L00d7de:
	movem.l	(sp)+,d3-d4/a3-a4
	rts

SYSCALL_0070_XXXX:
	link	a6,#$0000
	move.l	d3,-(sp)
	move.w	($000e,a6),d0
	move.w	($0012,a6),d1
	move.w	($0016,a6),d2
	move.w	($001a,a6),d3
	ext.l	d3
	asl.l	#2,d3
	move.l	d3,-(sp)
	ext.l	d2
	asl.l	#2,d2
	move.l	d2,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(SYSCALL_0084_ゲージ表示_非標準)
	lea.l	($0014,sp),sp
	move.l	(-$0004,a6),d3
	unlk	a6
	rts

SYSCALL_0084_ゲージ表示_非標準:
	movem.l	d3-d6/a3,-(sp)
	movea.l	($0018,sp),a0
	move.w	($001e,sp),d3
	move.w	($0022,sp),d6
	move.w	($0026,sp),d4
	move.w	($002a,sp),d5
	cmp.w	d4,d5
	bge	L00d842
	move.w	d5,d4
L00d842:
	cmpi.w	#$0001,($000a,a0)
	bne	L00d8bc
	pea.l	($0c1c)
	movea.w	d6,a1
	move.l	a1,-(sp)
	movea.w	d3,a0
	pea.l	(-$0001,a0)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	tst.w	d4
	ble	L00d894
	movea.w	d6,a3
L00d868:
	cmp.w	#$0004,d4
	ble	L00d874
	pea.l	($0c5f)
	bra	L00d87a
L00d874:
	movea.w	d4,a0
	pea.l	($0c5b,a0)
L00d87a:
	move.l	a3,-(sp)
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#4,d4
	subq.w	#4,d5
	tst.w	d4
	bgt	L00d868
L00d894:
	tst.w	d5
	ble	L00d8b6
	movea.w	d6,a3
L00d89a:
	pea.l	($0c1e)
	move.l	a3,-(sp)
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#4,d5
	tst.w	d5
	bgt	L00d89a
L00d8b6:
	pea.l	($4c1c)
	bra	L00d932
L00d8bc:
	moveq.l	#$1f,d0
	sub.w	d3,d0
	move.w	d0,d3
	pea.l	($4c1c)
	movea.w	d6,a1
	move.l	a1,-(sp)
	movea.w	d3,a0
	pea.l	($0001,a0)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	tst.w	d4
	ble	L00d90c
	movea.w	d6,a3
L00d8e0:
	cmp.w	#$0004,d4
	ble	L00d8ec
	pea.l	($4c5f)
	bra	L00d8f2
L00d8ec:
	movea.w	d4,a0
	pea.l	($4c5b,a0)
L00d8f2:
	move.l	a3,-(sp)
	movea.w	d3,a0
	subq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#4,d4
	subq.w	#4,d5
	tst.w	d4
	bgt	L00d8e0
L00d90c:
	tst.w	d5
	ble	L00d92e
	movea.w	d6,a3
L00d912:
	pea.l	($4c1e)
	move.l	a3,-(sp)
	movea.w	d3,a0
	subq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	subq.w	#4,d5
	tst.w	d5
	bgt	L00d912
L00d92e:
	pea.l	($0c1c)
L00d932:
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	movem.l	(sp)+,d3-d6/a3
	rts

SYSCALL_000c_同期開始_気集中:
	link	a6,#-$0002
	movem.l	d3-d6/a3,-(sp)
	movea.l	($0008,a6),a3
	move.w	($000e,a6),d4
	move.w	($0012,a6),d5
	move.w	($0016,a6),d3
	move.l	($132a,a3),d6
	moveq.l	#$01,d0
	move.w	d0,(-$0002,a6)
	move.w	d0,($05de,a3)
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(SYSCALL_018c_状態設定_セル前面表示)
	addq.w	#8,sp
	cmpi.w	#$0001,($01b6,a3)
	bne	L00d98e
	move.w	($0006,a3),d0
	subq.w	#6,d0
	bra	L00d994
L00d98e:
	move.w	($0006,a3),d0
	addq.w	#6,d0
L00d994:
	move.w	d0,($0efe,a3)
	move.w	d0,($0efa,a3)
	move.w	d0,($0ef6,a3)
	move.w	d0,($0ef2,a3)
	move.w	d0,($0abe,a3)
	move.w	d0,($0aba,a3)
	move.w	d0,($0ab6,a3)
	move.w	d0,($0ab2,a3)
	move.w	d0,($0aae,a3)
	move.w	d0,($0aaa,a3)
	move.w	($0008,a3),d0
	move.w	d0,($0f00,a3)
	move.w	d0,($0efc,a3)
	move.w	d0,($0ef8,a3)
	move.w	d0,($0ef4,a3)
	move.w	d0,($0ac0,a3)
	move.w	d0,($0abc,a3)
	move.w	d0,($0ab8,a3)
	move.w	d0,($0ab4,a3)
	move.w	d0,($0ab0,a3)
	move.w	d0,($0aac,a3)
	cmp.w	#$0001,d3
	bne	L00d9f6
	move.w	($01b6,a3),($0ac8,a3)
	bra	L00da00
L00d9f6:
	move.w	($01b6,a3),d1
	neg.w	d1
	move.w	d1,($0ac8,a3)
L00da00:
	move.w	#$0014,($0ac2,a3)
	move.w	d4,($0ac4,a3)
	move.w	d5,($0ac6,a3)
	move.l	($0988,a3),(L06f432)		;VCT_気集中マーク処理
	beq	L00da44
	pea.l	(-$0002,a6)					;dft
	pea.l	($0a46,a3)					;lv
	pea.l	($0000)						;sp
	pea.l	($0ac6,a3)					;y
	pea.l	($0ac4,a3)					;x
	pea.l	($0ac2,a3)					;c
	pea.l	(-$0001)					;state
	move.l	d6,-(sp)					;p2
	move.l	a3,-(sp)					;p1
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0024,sp),sp
L00da44:
	tst.w	(-$0002,a6)
	beq	L00da6a
	pea.l	($0000)
	movea.w	($0ac6,a3),a1
	move.l	a1,-(sp)
	movea.w	($0ac4,a3),a1
	move.l	a1,-(sp)
	pea.l	(-$0001)
	move.l	a3,-(sp)
	jsr	(SR_デフォルト気集中マーク表示処理)
	lea.l	($0014,sp),sp
L00da6a:
	move.l	($09c4,a3),(L06f432)		;VCT_超技ゲージ表示処理
	beq	L00da84
	pea.l	(-$0001)
	move.l	d6,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
L00da84:
	movem.l	(-$0016,a6),d3-d6/a3
	unlk	a6
	rts

SR_気集中マーク表示処理呼び出し:
	link	a6,#-$0006
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0008,a6),a3					;a3=p1
	move.l	($132a,a3),d4					;d4=p2
	move.w	#$0001,(-$0006,a6)				;dft = ON
	movea.w	($0008,a3),a1					;a1=p1Y座標
	adda.w	($0ac6,a3),a1
	move.w	a1,(-$0004,a6)					;Y座標=p1Y座標+p1気集中マークY座標
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(SYSCALL_018c_状態設定_セル前面表示)	;(p1, ON);
	addq.w	#8,sp
	cmpi.w	#$0001,($000a,a3)				;プレイヤー番号
	bne	@f
	moveq.l	#$0a,d3							;d3=使用するスプライト番号 1pのとき10
	bra	@@f
@@:	moveq.l	#$12,d3							;2pのとき18
@@:	cmpi.w	#$0001,($0ac8,a3)				;p1気集中マーク表示方向？
	bne	L00daea
	move.w	($0006,a3),d0
	add.w	($0a04,a3),d0
	add.w	($0ac4,a3),d0
	move.w	d0,(-$0002,a6)
	add.w	#$0010,d0						;x座標=p1X座標+p1_0x0a04+気集中マークX座標+0x10
	bra	L00dafe
L00daea:
	move.w	($0006,a3),d0
	sub.w	($0a04,a3),d0
	sub.w	($0ac4,a3),d0
	move.w	d0,(-$0002,a6)
	add.w	#$0030,d0						;x座標=p1X座標-p1_0x0a04-気集中マークX座標+0x30
L00dafe:
	move.w	d0,(-$0002,a6)
	move.l	($0988,a3),(L06f432)			;VCT_気集中マーク表示処理
	beq	L00db38								;未定義の場合スキップ
	pea.l	(-$0006,a6)
	pea.l	($0a46,a3)
	movea.w	d3,a1
	move.l	a1,-(sp)
	pea.l	(-$0004,a6)
	pea.l	(-$0002,a6)
	pea.l	($0ac2,a3)
	pea.l	($0000)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)								;VCT_気集中マーク表示処理(p1, p2, SYNC_ベクタ状態変化, p1気集中カウンタ, x, y, sp, p1威力レベル, dft);
	lea.l	($0024,sp),sp
L00db38:
	tst.w	(-$0006,a6)						;dt=OFFのときデフォルト処理スキップ
	beq	L00db5e
	pea.l	($0000)
	movea.w	(-$0004,a6),a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,-(sp)
	pea.l	($0000)
	move.l	a3,-(sp)
	jsr	(SR_デフォルト気集中マーク表示処理)							;SR_デフォルト気集中マーク表示処理(p1, 0, X座標, Y座標, 0);
	lea.l	($0014,sp),sp
L00db5e:
	tst.w	($0ac2,a3)						;p1気集中カウントが1以上の時終了
	bgt	L00dba2								;0以下の時、気集中マークの終了処理実行
	move.l	($0988,a3),(L06f432)			;VCT_気集中マーク表示処理
	move.w	#$0001,(-$0006,a6)				;dft=ON
	tst.l	(L06f432)
	beq	L00dba2								;未定義の時終了
	pea.l	(-$0006,a6)						;引数8:dft
	pea.l	($0a46,a3)
	ext.l	d3
	move.l	d3,-(sp)						;引数7:p1威力レベル
	pea.l	(-$0004,a6)						;引数6:y
	pea.l	(-$0002,a6)						;引数5:x
	pea.l	($0ac2,a3)						;引数4:p1気集中カウント
	pea.l	($0001)							;引数3:1(=SYNC_ベクタ完了処理)
	move.l	d4,-(sp)						;引数2:p2
	move.l	a3,-(sp)						;引数1:p1
	movea.l	(L06f432),a0
	jsr	(a0)								;VCT_気集中マーク表示処理(p1, p2, SYNC_ベクタ完了処理, p1気集中カウント, x, y, p2威力レベル, *dft);
L00dba2:
	movem.l	(-$0012,a6),d3-d4/a3
	unlk	a6
	rts

SYSCALL_02c4_気集中カウンタ_デクリメント:
	movea.l	($0004,sp),a0
	lea.l	($0ac2,a0),a0
	subq.w	#1,(a0)
	rts

SYSCALL_0010_同期完了_攻撃:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3
	move.l	($0014,sp),d4
	move.w	($09e2,a3),d3
	tst.w	($0a86,a3)
	beq	L00dbd8
	jsr	(乱数発生)
	move.w	d0,($05d6,a3)
L00dbd8:
	cmp.w	#$0066,d3
	bne	L00dbec
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0124_同期完了_ジャンプ)
	addq.w	#8,sp
	bra	L00dc6a
L00dbec:
	move.l	a3,-(sp)
	jsr	(SR_ヒット情報クリア)
	addq.w	#4,sp
	clr.w	($0a44,a3)
	clr.w	($0a92,a3)
	clr.w	($1744,a3)
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0064)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	pea.l	($0000)				;IVC_通常
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	move.l	a3,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	tst.w	($0a86,a3)
	beq	L00dc6a
	jsr	(SYSCALL_0148_場面取得_エンディング)
	tst.w	d0
	bne	L00dc6a
	movea.l	($1278,a3),a0
	cmpa.w	#$0000,a0
	beq	L00dc6a
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	lea.l	($000c,sp),sp
L00dc6a:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_0014_同期完了_複合攻撃:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	clr.w	($0a3c,a3)
	pea.l	($0000)
	pea.l	($0065)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	jsr	(SR_キャラキャンセル可能フラグクリア)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	clr.w	($0a42,a3)
	movea.l	(sp)+,a3
	rts

SYSCALL_00d8_同期完了_一般動作:
	movea.l	($0004,sp),a0
	move.l	($0008,sp),d0
	cmpi.w	#$0066,($09e2,a0)		;ACT_ジャンプ
	bne	L00dcc8
	move.l	d0,-(sp)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0124_同期完了_ジャンプ)
	addq.w	#8,sp
	bra	L00dcf0
L00dcc8:
	cmpi.w	#$0001,($0a90,a0)
	ble	L00dcd6
	move.w	#$0001,($0a90,a0)
L00dcd6:
	move.w	#$0070,($0008,a0)
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a0,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
L00dcf0:
	rts

SYSCALL_0120_同期進行_ジャンプ着地:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	clr.w	($0a3c,a3)
	pea.l	($0000)
	pea.l	($0065)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	move.w	#$0070,($0008,a3)
	move.l	a3,-(sp)
	jsr	(SR_キャラキャンセル可能フラグクリア)
	addq.w	#4,sp
	movea.l	(sp)+,a3
	rts

SYSCALL_0124_同期完了_ジャンプ:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	clr.w	($0a3c,a3)
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0064)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	pea.l	($0000)				;IVC_通常
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	move.l	a3,-(sp)
	jsr	(SR_キャラキャンセル可能フラグクリア)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	movea.l	(sp)+,a3
	rts

SYSCALL_0284_状態取得_攻撃動作:
	movea.l	($0004,sp),a0
	cmpi.w	#$0027,($09e2,a0)
	bgt	L00dd8c
	moveq.l	#$01,d0
	bra	L00dd8e
L00dd8c:
	moveq.l	#$00,d0
L00dd8e:
	rts

SYSCALL_0108_状態取得_攻撃くらい:
	movea.l	($0004,sp),a0
	cmpi.w	#$0027,($09e2,a0)
	ble	L00dda4
	cmpi.w	#$0063,($09e2,a0)
	ble	L00ddac
L00dda4:
	cmpi.w	#$0068,($09e2,a0)
	bne	L00ddb0
L00ddac:
	moveq.l	#$01,d0
	bra	L00ddb2
L00ddb0:
	moveq.l	#$00,d0
L00ddb2:
	rts

SR_防御動作IDチェック:
	movea.l	($0004,sp),a0
	cmpi.w	#$0045,($09e2,a0)		;ACT_地上防御
	beq	L00ddc8
	cmpi.w	#$006e,($09e2,a0)		;ACT_空中防御
	bne	L00ddcc
L00ddc8:
	moveq.l	#$01,d0
	bra	L00ddce
L00ddcc:
	moveq.l	#$00,d0
L00ddce:
	rts

SYSCALL_0110_Cmd実行_動作:
	movea.l	($0004,sp),a1			;a1=キャラハンドラ
	move.w	($000a,sp),d1			;d1=ACT-ID
	move.w	($000e,sp),d2			;d2=先頭サイクルフラグ
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	tst.l	($05e0,a0)				;動作関数テーブルに関数が登録されていない？
	beq	L00de20						;即終了
	cmp.w	#$0044,d1				;ACT-IDがACT_敗北転倒？
	beq	L00de02						;分岐
	tst.w	($01cc,a1)				;敗北状態？
	bne	L00de00
	cmpi.w	#$0044,($09e2,a1)		;現在の動作IDがACT_敗北転倒以外？
	bne	L00de02
L00de00:
	moveq.l	#$65,d1					;d1=ACT_待機
L00de02:							;敗北転倒状態か、敗北状態ではなくACT_敗北転倒以外のとき
	move.w	#$0001,($09ec,a1)
	move.w	d1,($09e0,a1)
	tst.w	d2
	beq	L00de1a
	move.w	d1,($09e2,a1)
	move.w	#$ffff,($173e,a1)		;先頭サイクルフラグを立てる
L00de1a:
	move.w	#$0001,($1324,a1)		;思考完了フラグを立てる
L00de20:
	rts

L00de22:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d1
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	tst.l	($05e0,a0)
	beq	L00de44
	move.w	d1,($09e4,a1)
	move.w	#$0001,($1324,a1)
L00de44:
	rts

SYSCALL_0128_状態取得_しゃがみ:
	movea.l	($0004,sp),a0
	move.w	($09e2,a0),d0
	tst.w	($01bc,a0)
	bne	L00de72
	cmp.w	#$0003,d0
	beq	L00de72
	cmp.w	#$0004,d0
	beq	L00de72
	cmp.w	#$002a,d0
	beq	L00de72
	cmp.w	#$003e,d0
	beq	L00de72
	cmp.w	#$0040,d0
	bne	L00de76
L00de72:
	moveq.l	#$01,d0
	bra	L00de78
L00de76:
	moveq.l	#$00,d0
L00de78:
	rts

SYSCALL_012c_状態設定_しゃがみ:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),($01bc,a0)			;しゃがみ状態設定
	bne	L00deae								;ONのときスキップ
	moveq.l	#$00,d1
	move.l	d1,($0acc,a0)					;スティック直接状態書き込み
	tst.w	($0a86,a0)						;CPU制御状態
	beq	L00ded8								;人間操作のときスキップ
	tst.w	($09f0,a0)
	ble	L00ded8
	tst.w	($01be,a0)						;防御許可
	beq	L00ded8
	cmpi.w	#$0001,($01b6,a0)				;表示方向
	bne	L00deaa
	moveq.l	#$04,d1							;右向き時4
	bra	L00ded4
L00deaa:
	moveq.l	#$06,d1							;左向き時6
	bra	L00ded4
L00deae:
	moveq.l	#$02,d1
	move.l	d1,($0acc,a0)					;スティック直接状態
	tst.w	($0a86,a0)						;CPU制御状態
	beq	L00ded8
	tst.w	($09f0,a0)
	ble	L00ded8
	tst.w	($01be,a0)
	beq	L00ded8
	cmpi.w	#$0001,($01b6,a0)				;表示方向
	bne	L00ded2
	moveq.l	#$01,d1							;右向き時1
	bra	L00ded4
L00ded2:
	moveq.l	#$03,d1							;左向き時3
L00ded4:
	move.l	d1,($0acc,a0)					;スティック直接状態書き込み
L00ded8:
	rts

SYSCALL_0134_演出設定_遅延ループ:
	movem.l	d3/a3,-(sp)
	move.w	($0012,sp),d3
	tst.w	($000e,sp)
	bne	L00df0c
	tst.w	d3
	ble	L00df18
	lea.l	(SFSYSINFO_000c_ゲームスピード),a3
L00def2:
	tst.w	(a3)
	beq	L00defe
	jsr	(SR_タイマーD割込み処理終了待ち)
	bra	L00df04
L00defe:
	jsr	(SR_最終ラスター割込み終了待ち)
L00df04:
	subq.w	#1,d3
	tst.w	d3
	bgt	L00def2
	bra	L00df18
L00df0c:
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
L00df18:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_0038_座標取得_相手距離:
	movea.l	($0004,sp),a1			;a1=キャラハンドラ
	movea.l	($132a,a1),a0			;a0=相手ハンドラ
	cmpi.w	#$0001,($01b6,a1)		;自分の表示方向がDRCT_右ではない？
	bne	L00df46
	cmpi.w	#$ffff,($01b6,a0)		;相手の表示方向がDRCT_左ではない？
	bne	L00df3c
									;自分がDRCT_右かつ相手がDRCT_左のとき
	move.w	($0a14,a0),d0			;d0=相手の左向き存在矩形X1
	bra	L00df40
L00df3c:							;自分がDRCT_右かつ相手がDRCT_右のとき
	move.w	($0a0c,a0),d0			;d0=相手の右向き存在矩形X1
L00df40:
	sub.w	($0a0e,a1),d0			;d0=相手の存在矩形X1 - 自分の右向き存在矩形X2
	bra	L00df60
L00df46:
	cmpi.w	#$0001,($01b6,a0)		;相手の表示方向がDRCT_右ではない？
	bne	L00df54
									;自分がDRCT_左かつ相手がDRCT_右
	move.w	($0a0e,a0),d0
	bra	L00df58
L00df54:							;自分がDRCT_左かつ相手がDRCT_左
	move.w	($0a16,a0),d0
L00df58:
	move.w	($0a14,a1),d1
	sub.w	d0,d1					;d1=自分の左向き存在矩形X2 - 相手の存在矩形X1
	move.w	d1,d0
L00df60:
	ext.l	d0
	rts

SYSCALL_013c_攻撃設定_SHOT反射:
	movea.l	($0004,sp),a0
	move.w	($000e,sp),d0
	move.w	($0012,sp),d1
	move.w	($000a,sp),($1744,a0)
	move.w	d0,($1746,a0)
	move.w	d1,($1748,a0)
	rts

SYSCALL_0140_XXXX:
	moveq.l	#$00,d0
	rts

SYSCALL_014c_セル登録_情報:
	move.l	($0004,sp),d1
	move.w	($000a,sp),d0
	move.l	($000c,sp),d2
	cmp.w	#$01ff,d0
	ble	L00dfa4
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	d2,($0f6e,a0)
	bra	L00dfc4
L00dfa4:
	cmp.w	#$00ff,d0
	bgt	L00dfb8
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	d2,($01d0,a0)
	bra	L00dfc4
L00dfb8:
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	d2,($0f2e,a0)
L00dfc4:
	rts

SYSCALL_0148_場面取得_エンディング:
	tst.w	(SFSYSINFO_0474_場面_エンディング)
	ble	L00dfd2
	moveq.l	#$01,d0
	bra	L00dfd4
L00dfd2:
	moveq.l	#$00,d0
L00dfd4:
	rts

SYSCALL_0154_同期開始_地上投げ:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a3				;a3=p1
	movea.l	($0014,sp),a4				;a4=p2
	move.w	($001a,sp),d3				;d3=距離
	move.w	($001e,sp),d0				;d0=方向
	bne	L00e03e							;方向指定があるとき分岐
	cmpi.w	#$0001,($0a46,a3)			;威力レベル==LEVEL_大？
	beq	L00e002
	cmpi.w	#$ffff,($0a46,a3)			;威力レベル==LEVEL_自動？
	beq	L00e002
	move.w	#$0001,($0a46,a3)
L00e002:
	move.w	($0a46,a3),d0
	move.w	d0,($09e8,a3)
	move.w	d0,($01b6,a3)
	move.w	($0a46,a3),d0
	muls.w	#$ffff,d0
	move.w	d0,($09e8,a4)
	move.w	d0,($01b6,a4)
	cmpi.w	#$003f,($0006,a3)			;p1X座標が63以下の時64に移動
	bgt	L00e02e
	move.w	#$0040,($0006,a3)
	bra	L00e052
L00e02e:
	cmpi.w	#$00c0,($0006,a3)			;p1X座標が192より大きいとき192に移動
	ble	L00e052
	move.w	#$00c0,($0006,a3)
	bra	L00e052
L00e03e:
	move.w	d0,($09e8,a3)
	move.w	d0,($01b6,a3)				;p1表示方向設定
	muls.w	#$ffff,d0
	move.w	d0,($09e8,a4)
	move.w	d0,($01b6,a4)				;p2表示方向をp1の反対に設定
L00e052:
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a4,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	cmpi.w	#$0001,($09e8,a3)			;右向きか？
	bne	L00e074							;左向きの時分岐
	move.w	($0006,a3),d1
	sub.w	d3,d1
	move.w	d1,($0006,a4)				;2pを左側に配置
	bra	L00e07c
L00e074:
	add.w	($0006,a3),d3				;左向きの時、2pを右側に配置
	move.w	d3,($0006,a4)
L00e07c:
	movem.l	(sp)+,d3/a3-a4
	rts

SYSCALL_0158_同期開始_地上投げられ:
	movea.l	($0004,sp),a1				;a1=投げられる側
	movea.l	($0008,sp),a0				;a0=投げる側
	move.w	($000e,sp),d0				;d0=方向指定
	bne	L00e0aa
	cmpi.w	#$0001,($0a46,a0)
	beq	L00e0a6
	cmpi.w	#$ffff,($0a46,a0)
	beq	L00e0a6
	move.w	#$0001,($0a46,a0)
L00e0a6:
	move.w	($0a46,a0),d0
L00e0aa:
	neg.w	d0
	move.w	d0,($09e8,a1)
	move.w	d0,($01b6,a1)
	rts

SYSCALL_015c_Pal設定_身体燃焼色:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	bne	L00e0c4
	moveq.l	#$02,d0
	bra	L00e0d0
L00e0c4:
	cmp.w	#$0001,d0
	bne	L00e0ce
	moveq.l	#$03,d0
	bra	L00e0d0
L00e0ce:
	moveq.l	#$0b,d0
L00e0d0:
	ext.l	d0
	asl.l	#5,d0
	moveq.l	#$34,d1
	add.l	d1,d0
	add.l	($132a,a0),d0
	cmpi.w	#$0001,($000a,a0)
	bne	L00e0ec
	move.l	#$00e82220,-(sp)
	bra	L00e0f2
L00e0ec:
	move.l	#$00e82240,-(sp)
L00e0f2:
	move.l	d0,-(sp)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
	rts

SYSCALL_0160_３２バイト転送:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a2
	movea.l	($000c,sp),a3
	movea.l	a2,a0
	movea.l	a3,a1
	move.l	(a2),(a3)
	addq.w	#4,a0
	addq.w	#4,a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
	movea.l	(sp)+,a3
	rts

SYSCALL_0164_XXXX:
	link	a6,#$0000
	movea.w	($000e,a6),a2
	move.l	a2,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(SYSCALL_01a8_セル取得_情報)
	addq.w	#8,sp
	movea.l	d0,a1
	movea.l	($0010,a6),a0
	moveq.l	#$30,d0
L00e142:
	move.b	(a1)+,(a0)+
	subq.w	#1,d0
	bpl	L00e142
	unlk	a6
	rts

SYSCALL_01a8_セル取得_情報:
	move.l	($0004,sp),d1
	move.w	($000a,sp),d0
	cmp.w	#$01ff,d0
	ble	L00e168
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	($0f6e,a0),d0
	bra	L00e188
L00e168:
	cmp.w	#$00ff,d0
	bgt	L00e17c
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	($01d0,a0),d0
	bra	L00e188
L00e17c:
	ext.l	d0
	asl.l	#2,d0
	movea.l	d1,a0
	adda.l	d0,a0
	move.l	($0f2e,a0),d0
L00e188:
	rts

SYSCALL_016c_Pal設定_表示データ:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a0
	move.l	($0010,sp),d2
	move.l	#$00e82200,d1
	move.w	($000e,sp),d0
	ext.l	d0
	moveq.l	#$32,d3
	cmp.l	d3,d0
	bhi	L00e294
	add.l	d0,d0
	move.w	(L00e1b2,pc,d0.l),d3
	jmp	(L00e1b2,pc,d3.w)

L00e1b2:
	.dc.w	L00e218-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e25a-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e22c-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e242-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e294-L00e1b2
	.dc.w	L00e272-L00e1b2
L00e218:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e226
	moveq.l	#$20,d3
	add.l	d3,d1
	bra	L00e288
L00e226:
	moveq.l	#$40,d3
	add.l	d3,d1
	bra	L00e288
L00e22c:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e23a
	moveq.l	#$60,d3
	add.l	d3,d1
	bra	L00e288
L00e23a:
	add.l	#$000000a0,d1
	bra	L00e288
L00e242:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e252
	add.l	#$00000080,d1
	bra	L00e288
L00e252:
	add.l	#$000000c0,d1
	bra	L00e288
L00e25a:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e26a
	add.l	#$000000e0,d1
	bra	L00e288
L00e26a:
	add.l	#$00000100,d1
	bra	L00e288
L00e272:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e282
	add.l	#$00000120,d1
	bra	L00e288
L00e282:
	add.l	#$000001c0,d1
L00e288:
	move.l	d1,-(sp)
	move.l	d2,-(sp)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
L00e294:
	move.l	(sp)+,d3
	rts

SYSCALL_0170_Pal取得_内部データ:
	movea.l	($0004,sp),a1
	moveq.l	#$34,d1
	add.l	a1,d1
	movea.w	($000a,sp),a0
	move.l	a0,d0
	subq.l	#2,d0
	moveq.l	#$26,d2
	cmp.l	d2,d0
	bhi	L00e358
	add.l	d0,d0
	move.w	(L00e2ba,pc,d0.l),d2
	jmp	(L00e2ba,pc,d2.w)

L00e2ba:
	.dc.w	L00e310-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e328-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e330-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e308-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e30c-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e350-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e338-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e340-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e358-L00e2ba
	.dc.w	L00e348-L00e2ba
L00e308:
	moveq.l	#$40,d2
	bra	L00e362
L00e30c:
	moveq.l	#$60,d2
	bra	L00e362
L00e310:
	cmpi.w	#$0001,($001a,a1)
	bne	L00e320
	add.l	#$00000080,d1
	bra	L00e364
L00e320:
	add.l	#$000000a0,d1
	bra	L00e364
L00e328:
	add.l	#$000000c0,d1
	bra	L00e364
L00e330:
	add.l	#$000000e0,d1
	bra	L00e364
L00e338:
	add.l	#$00000100,d1
	bra	L00e364
L00e340:
	add.l	#$00000120,d1
	bra	L00e364
L00e348:
	add.l	#$00000140,d1
	bra	L00e364
L00e350:
	add.l	#$00000160,d1
	bra	L00e364
L00e358:
	cmpi.w	#$0001,($001a,a1)
	beq	L00e364
	moveq.l	#$20,d2
L00e362:
	add.l	d2,d1
L00e364:
	move.l	d1,d0
	rts

SYSCALL_0174_同期完了_連続技:
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	cmpi.w	#$0064,($09e2,a0)
	bne	L00e386
	cmpi.w	#$0065,($09e2,a1)
	bne	L00e386
	move.w	#$0100,($09fe,a0)
L00e386:
	rts

SYSCALL_0178_カウンタ設定_初期値:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	tst.w	($0a42,a0)
	bne	L00e39c
	move.w	d0,($09ee,a0)
	bra	L00e3a0
L00e39c:
	subq.w	#1,($09ee,a0)
L00e3a0:
	move.w	#$0001,($0a42,a0)
	tst.w	($09ee,a0)
	bge	L00e3b0
	clr.w	($09ee,a0)
L00e3b0:
	move.w	($09ee,a0),d0
	ext.l	d0
	rts

SYSCALL_017c_Spr取得_番号:
	movea.l	($0004,sp),a0
	moveq.l	#$00,d0
	move.w	($000a,sp),d1
	ext.l	d1
	moveq.l	#$03,d2
	cmp.l	d2,d1
	bhi	L00e406
	move.l	d1,d0
	add.l	d0,d0
	move.w	(L00e3d6,pc,d0.l),d2
	jmp	(L00e3d6,pc,d2.w)

L00e3d6:
	.dc.w	L00e3e4-L00e3d6
	.dc.w	L00e3de-L00e3d6
	.dc.w	L00e3f4-L00e3d6
	.dc.w	L00e3f8-L00e3d6
L00e3de:
	move.w	($001e,a0),d0
	bra	L00e406
L00e3e4:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e3f0
	moveq.l	#$0a,d0
	bra	L00e406
L00e3f0:
	moveq.l	#$12,d0
	bra	L00e406
L00e3f4:
	moveq.l	#$3a,d0
	bra	L00e406
L00e3f8:
	cmpi.w	#$0001,($000a,a0)
	bne	L00e404
	moveq.l	#$0e,d0
	bra	L00e406
L00e404:
	moveq.l	#$16,d0
L00e406:
	ext.l	d0
	rts

SYSCALL_0180_Cmd実行_気絶:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d1
	move.w	($000e,sp),d0
	tst.w	($0a46,a0)
	bne	L00e422
	move.w	d1,($09ee,a0)
	bra	L00e426
L00e422:
	move.w	d0,($09ee,a0)
L00e426:
	move.w	#$0002,($09e6,a0)
	rts

SYSCALL_0184_状態設定_起き上がり必殺技許可:
	movea.l	($0004,sp),a0
	move.w	#$0001,($01c2,a0)			;必殺技キャンセル許可状態
	clr.w	($09f0,a0)					;防御同期値クリア
	move.w	#$0001,($0a94,a0)			;リバーサル必殺技許可フラグ
	rts

SYSCALL_0188_同期完了_起き上がり:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.l	($000c,sp),-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	move.w	#$0064,($09e0,a3)			;予約動作ID=ACT_アイドル
	move.w	#$0001,($09ec,a3)			;???
	move.w	#$0001,($01c2,a3)			;必殺技キャンセル許可状態をON
	move.w	#$0002,($09f0,a3)			;防御同期値=2
	clr.w	($09e6,a3)					;動作過程値をクリア
	movea.l	(sp)+,a3
	rts

SYSCALL_018c_状態設定_セル前面表示:
;超技実行中なら何もしない
;SFSYSINFO_007a_セル前面表示フラグに以下の条件に従って値をセット
;前面表示=OFFかつプレイヤー番号が1だったら-1、2だったら1
;前面表示=ONかつプレイヤー番号が1だったら1、2だったら-1
;プレイヤー番号が2だったら
	movea.l	($0004,sp),a1				;a1=p1
	move.w	($000a,sp),d0
	movea.l	($132a,a1),a0				;a0=p2
	tst.w	($05de,a0)					;超技実行中フラグ
	bne	L00e4b2							;実行中なら何もせず終了
	tst.w	d0
	beq	L00e498
	cmpi.w	#$0001,($000a,a1)			;プレイヤー番号
	beq	L00e4aa
	bra	L00e4a0
L00e498:								;前面表示OFFのとき
	cmpi.w	#$0001,($000a,a1)
	bne	L00e4aa
L00e4a0:								;プレイヤー番号=2のとき
	move.w	#$ffff,(SFSYSINFO_007a_セル前面表示フラグ)
	bra	L00e4b2
L00e4aa:								;プレイヤー番号=1のとき
	move.w	#$0001,(SFSYSINFO_007a_セル前面表示フラグ)
L00e4b2:
	rts

SYSCALL_0190_Pal設定_PCG色:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d1
	cmpi.w	#$0001,($000a,a0)
	bne	L00e4cc
	move.l	#$00e82260,d0
	bra	L00e4d2
L00e4cc:
	move.l	#$00e822a0,d0
L00e4d2:
	move.l	d0,-(sp)
	move.w	d1,d0
	ext.l	d0
	asl.l	#5,d0
	add.l	#$00000114,d0
	pea.l	(a0,d0.l)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
	rts

SYSCALL_022c_キャラハンドラ:
	cmpi.w	#$0001,($0006,sp)
	bne	L00e4fe
	move.l	#WORK_1P_0000,d0
	bra	L00e504
L00e4fe:
	move.l	#WORK_2P_0000,d0
L00e504:
	rts

SYSCALL_025c_Data確保_メモリブロック:
	move.l	($0004,sp),(確保メモリサイズ)
	movem.l	d0-d7/a0-a5,-(sp)
	move.l	(確保メモリサイズ),-(sp)
	move.w	#$0001,-(sp)
	DOS	__S_MALLOC
	addq.l	#6,sp
	move.l	d0,(確保メモリポインタ)
	movem.l	(sp)+,d0-d7/a0-a5
	tst.l	(確保メモリポインタ)
	bgt	@f
	moveq.l	#$00,d0
	bra	@@f
@@:	move.l	(確保メモリポインタ),d0
@@:	rts

SYSCALL_0260_Data解放_メモリブロック:
	move.l	($0004,sp),(確保メモリポインタ)
	beq	L00e55a
	movem.l	d0-d7/a0-a5,-(sp)
	move.l	(確保メモリポインタ),-(sp)
	DOS	__S_MFREE
	addq.l	#4,sp
	movem.l	(sp)+,d0-d7/a0-a5
L00e55a:
	rts

SYSCALL_0294_Sfxvi_fopen:
	link	a6,#-$0200
	move.l	d3,-(sp)
	move.l	a6,d3
	add.l	#$fffffe00,d3
	move.l	d3,-(sp)
	move.l	($000c,a6),-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	move.l	($0010,a6),-(sp)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	move.l	(-$0204,a6),d3
	unlk	a6
	rts

SYSCALL_0298_Sfxvi_fgets:
	move.l	($0004,sp),d0
	move.l	($0008,sp),d1
	move.l	($000c,sp),-(sp)
	move.l	d1,-(sp)
	move.l	d0,-(sp)
	jsr	(XCLIB_fgets)
	lea.l	($000c,sp),sp
	rts

SYSCALL_029c_Sfxvi_fclose:
	move.l	($0004,sp),-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	rts

SYSCALL_02a0_Sfxvi_strlen:
	move.l	($0004,sp),-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	rts

SYSCALL_02a4_Sfxvi_atoi:
	move.l	($0004,sp),-(sp)
	jsr	(L01daac)
	addq.w	#4,sp
	rts

SYSCALL_02bc_Sfxvi_strcpy:
	move.l	($0004,sp),d0
	move.l	($0008,sp),-(sp)
	move.l	d0,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	rts

SYSCALL_02c0_Sfxvi_strcat:
	move.l	($0004,sp),d0
	move.l	($0008,sp),-(sp)
	move.l	d0,-(sp)
	jsr	(XCLIB_strcat)
	addq.w	#8,sp
	rts

SYSCALL_0198_ヒット登録_情報:
	move.w	($000a,sp),d0
	ext.l	d0
	asl.l	#2,d0
	add.l	($0004,sp),d0
	movea.l	d0,a0
	adda.l	#$0000e76e,a0
	move.l	($000c,sp),(a0)
	rts

SYSCALL_019c_攻撃設定_ヒット情報:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	beq	L00e63c
	move.w	#$0004,($0a3c,a1)
	ext.l	d0
	asl.l	#2,d0
	add.l	a1,d0
	movea.l	d0,a0
	adda.l	#$0000e76e,a0
	move.l	(a0),($0a3e,a1)
L00e63c:
	rts

SYSCALL_01a0_攻撃設定_空中ヒット情報:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	ext.l	d0
	asl.l	#2,d0
	add.l	a0,d0
	movea.l	d0,a1
	adda.l	#$0000e76e,a1
	move.l	(a1),($0f02,a0)
	rts

SYSCALL_01a4_ヒット取得_情報:
	move.w	($000a,sp),d0
	ext.l	d0
	asl.l	#2,d0
	add.l	($0004,sp),d0
	movea.l	d0,a0
	adda.l	#$0000e76e,a0
	move.l	(a0),d0
	rts

SR_ヒットストップ・キャラ振動設定:
	movea.l	($0004,sp),a0
	move.w	($000e,sp),d0
	move.w	($000a,sp),(SFSYSINFO_0078_ヒットストップ)
	move.w	d0,($0f22,a0)					;キャラ振動
	rts

L00e688:
	link	a6,#-$0004
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a5					;a5=キャラハンドラ
	movea.l	($000c,a6),a4
	move.l	($0010,a6),(-$0004,a6)
	cmpi.w	#$0001,($0a3c,a5)				;攻撃判定有無のチェック
	bne	L00e6ac
	move.w	#$0004,($0a3c,a5)				;1のとき4に上書き
L00e6ac:
	lea.l	($0a3c,a5),a0
	subq.w	#1,(a0)
	cmpi.w	#$0002,($0a3c,a5)
	bgt	L00e6bc
	clr.w	(a0)
L00e6bc:
	cmpi.w	#$006f,($0008,a4)				;相手のY座標がベースライン以下か
	bgt	L00e6d0
	tst.l	($0f02,a5)						;空中ヒット情報が設定されている？
	beq	L00e6d0
	move.l	($0f02,a5),(-$0004,a6)
L00e6d0:
	cmpi.w	#$0001,($01b6,a5)				;自分の表示方向がDRCT_右か
	bne	L00e6ea
	move.w	($0a2c,a5),d4			;右向き時攻撃矩形X1
	move.w	($0a2e,a5),d5
	move.w	($0a30,a5),d6
	move.w	($0a32,a5),d7
	bra	L00e6fa
L00e6ea:
	move.w	($0a34,a5),d4			;左向き時攻撃矩形X1
	move.w	($0a36,a5),d5
	move.w	($0a38,a5),d6
	move.w	($0a3a,a5),d7
L00e6fa:
	moveq.l	#$00,d3
	tst.w	($0a92,a5)						;SHOT消滅攻撃回数
	ble	L00e722
	movea.w	d7,a3
	move.l	a3,-(sp)
	movea.w	d6,a3
	move.l	a3,-(sp)
	movea.w	d5,a3
	move.l	a3,-(sp)
	movea.w	d4,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(L016964)
	lea.l	($0018,sp),sp
	move.w	d0,d3
L00e722:
	tst.w	($1744,a5)
	ble	L00e748
	movea.w	d7,a3
	move.l	a3,-(sp)
	movea.w	d6,a3
	move.l	a3,-(sp)
	movea.w	d5,a3
	move.l	a3,-(sp)
	movea.w	d4,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(L016b60)
	lea.l	($0018,sp),sp
	or.w	d0,d3
L00e748:
	tst.w	d3
	beq	L00e7f2
	pea.l	($0001)
	movea.l	(-$0004,a6),a3
	movea.w	(a3),a3
	move.l	a3,-(sp)
	movea.w	d7,a0
	lea.l	(a0,d6.w),a3
	move.l	a3,d0
	asr.l	#1,d0
	movea.l	d0,a3
	pea.l	($0008,a3)
	movea.w	d5,a0
	lea.l	(a0,d4.w),a3
	move.l	a3,d0
	asr.l	#1,d0
	movea.l	d0,a3
	pea.l	(-$0008,a3)
	move.l	a4,-(sp)
	jsr	(L00f282)
	lea.l	($0014,sp),sp
	pea.l	($0000)				;引数3:キャラ振動
	movea.l	(-$0004,a6),a3
	movea.w	($0008,a3),a3
	move.l	a3,-(sp)			;引数2:ヒットストップ
	move.l	a5,-(sp)			;引数1:キャラハンドラ
	jsr	(SR_ヒットストップ・キャラ振動設定)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	movea.l	(-$0004,a6),a3
	movea.w	($0008,a3),a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_ヒットストップ・キャラ振動設定)
	lea.l	($000c,sp),sp
	movea.l	(-$0004,a6),a3
	tst.w	($000c,a3)
	beq	L00e7f2
	cmpi.w	#$0031,($000c,a3)
	bgt	L00e7d4
	movea.w	($000c,a3),a3
	move.l	a3,-(sp)
	bra	L00e7e4
L00e7d4:
	movea.l	(-$0004,a6),a3
	movea.w	($000c,a3),a0
	adda.w	($000a,a5),a0
	pea.l	(-$0001,a0)
L00e7e4:
	movea.w	($000a,a4),a3
	move.l	a3,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
L00e7f2:
	tst.w	($0a44,a5)
	bgt	L00e800
	clr.w	($0a3c,a5)
	bra	L00ea10
L00e800:
	tst.w	($01cc,a4)				;敗北状態
	bne	L00e80e
	tst.w	($01c0,a4)				;無敵状態
	bne	L00ea10
L00e80e:
	move.l	a4,-(sp)
	movea.w	d7,a3
	move.l	a3,-(sp)
	movea.w	d6,a3
	move.l	a3,-(sp)
	movea.w	d5,a3
	move.l	a3,-(sp)
	movea.w	d4,a3
	move.l	a3,-(sp)
	jsr	(L00cbee)
	lea.l	($0014,sp),sp
	tst.w	d0
	beq	L00ea10
	clr.w	($0a3c,a5)
	cmpi.w	#$0001,($01b6,a4)
	bne	L00e84e
	movea.w	($0a0c,a4),a1
	move.w	($0a0e,a4),d0
	movea.w	($0a10,a4),a2
	move.w	($0a12,a4),d1
	bra	L00e85e
L00e84e:
	movea.w	($0a14,a4),a1
	move.w	($0a16,a4),d0
	movea.w	($0a18,a4),a2
	move.w	($0a1a,a4),d1
L00e85e:
	move.w	($01c4,a5),($01c2,a5)		;必殺技キャンセル設定フラグの値を必殺技キャンセル実効フラグにコピー
	move.l	(-$0004,a6),($1326,a4)		;被ヒット情報設定
	movea.w	d0,a0
	lea.l	(a0,a1.w),a0
	adda.w	d4,a0
	adda.w	d5,a0
	move.l	a0,d0
	asr.l	#2,d0
	move.w	d0,d4
	subq.w	#8,d4
	movea.w	d1,a0
	lea.l	(a0,a2.w),a0
	movea.w	d6,a1
	adda.l	a1,a0
	movea.w	d7,a2
	adda.l	a2,a0
	adda.l	a1,a0
	adda.l	a2,a0
	adda.l	a1,a0
	adda.l	a2,a0
	adda.l	a1,a0
	adda.l	a2,a0
	adda.l	a1,a0
	adda.l	a2,a0
	adda.l	a1,a0
	adda.l	a2,a0
	adda.l	a1,a0
	move.l	a0,d0
	add.l	a2,d0
	asr.l	#4,d0
	move.w	d0,d3
	addq.w	#8,d3
	movea.l	(-$0004,a6),a3
	cmpi.w	#$0002,($000a,a3)
	beq	L00e998
	tst.w	($01cc,a5)					;敗北状態
	bne	L00e998
	moveq.l	#$00,d1
	cmpi.w	#$0045,($09e0,a4)			;ACT_地上防御
	beq	L00e8d8
	cmpi.w	#$0064,($09e0,a4)			;ACT_アイドル
	bne	L00e8fc
	tst.w	($09f0,a4)
	ble	L00e8fc
L00e8d8:
	movea.l	(-$0004,a6),a3
	move.w	($000a,a3),d0				;立ち・しゃがみガード可能の攻撃か？
	beq	L00e924
	cmp.w	#$0001,d0					;立ちガード可能の攻撃か？
	bne	L00e8ee
	tst.w	($01bc,a4)					;しゃがみ状態チェック
	beq	L00e924							;立ちのとき分岐
L00e8ee:
	cmp.w	#$ffff,d0					;しゃがみガード可能の攻撃か？
	bne	L00e926
	tst.w	($01bc,a4)					;しゃがみ状態か？
	beq	L00e926							;立ちのとき分岐
	bra	L00e924							;しゃがみのとき分岐
L00e8fc:
	cmpi.w	#$006e,($09e0,a4)			;6e=ACT_空中防御
	beq	L00e912
	cmpi.w	#$0066,($09e0,a4)			;66=ACT_ジャンプ
	bne	L00e926
	tst.w	($09f0,a4)
	ble	L00e926
L00e912:
	cmpi.w	#$006f,($0008,a5)			;Y座標がベースライン以下か？
	bgt	L00e926
	move.w	($01b6,a4),d2				;表示方向
	cmp.w	($01b8,a5),d2				;相対方向
	beq	L00e926
L00e924:
	moveq.l	#$01,d1
L00e926:
	tst.w	d1
	beq	L00e998							;ガードできなかった時の分岐
	clr.w	($0a5a,a4)
	clr.w	($0a5a,a5)
	pea.l	($0001)
	pea.l	($0000)
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	move.l	(-$0004,a6),-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(L00ed6e)
	lea.l	($001c,sp),sp
	subq.w	#1,($0a44,a5)				;最多ヒット数をデクリメント
	tst.w	($01cc,a4)					;敗北状態チェック
	bne	L00e964
	pea.l	($000b)
	bra	L00e988
L00e964:
	movea.l	(-$0004,a6),a3
	cmpi.w	#$0031,($000c,a3)
	bgt	L00e978
	movea.w	($000c,a3),a3
	move.l	a3,-(sp)
	bra	L00e988
L00e978:
	movea.l	(-$0004,a6),a3
	movea.w	($000c,a3),a0
	adda.w	($000a,a5),a0
	pea.l	(-$0001,a0)
L00e988:
	movea.w	($000a,a4),a3
	move.l	a3,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	bra	L00ea10
L00e998:
	pea.l	($0000)
	jsr	(SR_PCM8ファンクションコール_L017eba)
	addq.w	#4,sp
	movea.w	($000a,a4),a3
	move.l	a3,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017eba)
	addq.w	#4,sp
	pea.l	($0001)
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	move.l	(-$0004,a6),-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(L00eab8)
	lea.l	($0018,sp),sp
	subq.w	#1,($0a44,a5)
	movea.l	(-$0004,a6),a3
	tst.w	($000c,a3)
	beq	L00ea0c
	cmpi.w	#$0031,($000c,a3)
	bgt	L00e9ee
	movea.w	($000c,a3),a3
	move.l	a3,-(sp)
	bra	L00e9fe
L00e9ee:
	movea.l	(-$0004,a6),a3
	movea.w	($000c,a3),a0
	adda.w	($000a,a5),a0
	pea.l	(-$0001,a0)
L00e9fe:
	movea.w	($000a,a4),a3
	move.l	a3,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
L00ea0c:
	moveq.l	#$01,d0
	bra	L00ea12
L00ea10:
	moveq.l	#$00,d0
L00ea12:
	movem.l	(-$0024,a6),d3-d7/a3-a5
	unlk	a6
	rts

SYSCALL_0054_ゲージ増減_体力:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	($000e,sp),d1
	bge	L00ea48
	move.w	d1,d0
	muls.w	#$ffff,d0
	pea.l	($0000)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	move.l	($132a,a3),-(sp)
	jsr	(SYSCALL_0038_状態設定_残り体力)
	lea.l	($0010,sp),sp
	bra	L00eab4
L00ea48:
	tst.w	d1
	ble	L00eab4
	move.w	($002e,a3),d0
	asr.w	#1,d0
	movea.w	d0,a0
	ext.l	d1
	move.l	d1,-(sp)
	pea.l	($004a,a0)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	asr.l	#7,d0
	move.w	d0,d1
	cmpi.w	#$0001,($000a,a3)
	bne	L00ea78
	move.w	(SFSYSINFO_0038_1Pダメージ倍率),d0
	bra	L00ea7e
L00ea78:
	move.w	(SFSYSINFO_0042_2Pダメージ倍率),d0
L00ea7e:
	cmp.w	#$0001,d0
	beq	L00ea8c
	cmp.w	#$0002,d0
	beq	L00ea90
	bra	L00ea92
L00ea8c:
	asr.w	#1,d1
	bra	L00ea92
L00ea90:
	add.w	d1,d1
L00ea92:
	cmp.w	#$0002,d0
	bgt	L00eaa6
	tst.w	d1
	bgt	L00eaa2
	addq.w	#1,($002e,a3)
	bra	L00eaa6
L00eaa2:
	add.w	d1,($002e,a3)
L00eaa6:
	cmpi.w	#$0058,($002e,a3)
	ble	L00eab4
	move.w	#$0058,($002e,a3)
L00eab4:
	movea.l	(sp)+,a3
	rts

L00eab8:
	movem.l	d3-d7/a3-a6,-(sp)
	movea.l	($0028,sp),a6			;a6=p1
	movea.l	($002c,sp),a4			;a4=p2
	movea.l	($0030,sp),a5			;a5=ヒット情報
	move.w	($0036,sp),d6
	move.w	($003a,sp),d5
	move.w	($003e,sp),d7
	move.w	($000e,a5),d3
	move.w	d3,d4
	cmpa.w	#$0000,a5				;ヒット情報指定なし？
	beq	L00ed3e
	pea.l	($0000)
	move.l	a6,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)					;SYSCALL_007c_Cmd実行_防御(p2, p1, 0)
	lea.l	($000c,sp),sp
	pea.l	($0001)					;引数5:1
	movea.w	(a5),a1
	move.l	a1,-(sp)				;引数4:ヒット時攻撃力
	ext.l	d5
	move.l	d5,-(sp)				;引数3:arg5
	ext.l	d6
	move.l	d6,-(sp)				;引数2:arg4
	move.l	a4,-(sp)				;引数1:p2
	jsr	(L00f282)					;L00f282(p2, arg4, arg5, ヒット時攻撃力, 1);
	lea.l	($0014,sp),sp
	tst.w	($01cc,a4)				;p2敗北状態
	beq	L00eb4c
	pea.l	($0000)
	move.w	($0008,a5),d0			;ヒットストップ
	asr.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a6,-(sp)
	lea.l	(SR_ヒットストップ・キャラ振動設定),a3
	jsr	(a3)						;SR_ヒットストップ・キャラ振動設定(p1, ヒットストップ/2, 0);
	lea.l	($000c,sp),sp
	pea.l	($0001)
	move.w	($0008,a5),d0
	asr.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a4,-(sp)
	jsr	(a3)						;SR_ヒットストップ・キャラ振動設定(p2, ヒットストップ/2, 1);
	lea.l	($000c,sp),sp
	bra	L00ed3e
L00eb4c:
	pea.l	($0000)
	movea.w	($0008,a5),a1
	move.l	a1,-(sp)
	move.l	a6,-(sp)
	lea.l	(SR_ヒットストップ・キャラ振動設定),a3
	jsr	(a3)						;SR_ヒットストップ・キャラ振動設定(p1, ヒットストップ, 0);
	lea.l	($000c,sp),sp
	pea.l	($0001)
	movea.w	($0008,a5),a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	jsr	(a3)						;SR_ヒットストップ・キャラ振動設定(p2, ヒットストップ, 1);
	lea.l	($000c,sp),sp
	move.l	a4,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	clr.w	($0a5a,a4)
	clr.w	($0a5a,a6)
	clr.w	($0a42,a4)				;p2攻撃過程値クリア
	clr.w	($0aa8,a4)				;p2残像クリア
	tst.w	d7
	beq	L00eba0
	move.w	($01b6,a6),d0			;p1表示方向
	ext.l	d0
	neg.l	d0
	move.l	d0,-(sp)				;表示方向反転
	bra	L00eba6
L00eba0:
	movea.w	($01b6,a6),a1
	move.l	a1,-(sp)
L00eba6:
	move.l	a4,-(sp)
	jsr	(SYSCALL_01c8_状態設定_表示方向)
	addq.w	#8,sp
	move.w	($01b6,a4),($09e8,a4)	;p2動作方向をp2表示方向に一致させる
	jsr	(SYSCALL_0148_場面取得_エンディング)
	tst.w	d0
	bne	L00ecae						;エンディング中だったら分岐
	cmp.w	#$0028,d4				;ACT_地上くらい１(40)か？
	bne	L00ebd6
	tst.w	($01bc,a4)				;しゃがみ状態か？
	beq	L00ebd2
	moveq.l	#$2a,d3					;ACT_下衝撃１
	bra	L00ebfc
L00ebd2:
	moveq.l	#$29,d3					;ACT_上衝撃１
	bra	L00ebfc
L00ebd6:
	cmp.w	#$002b,d4				;ACT_地上くらい２(43)か？
	bne	L00ebea
	tst.w	($01bc,a4)				;しゃがみ状態か？
	beq	L00ebe6
	moveq.l	#$3e,d3					;ACT_下衝撃２
	bra	L00ebfc
L00ebe6:
	moveq.l	#$3d,d3					;ACT_上衝撃２
	bra	L00ebfc
L00ebea:
	cmp.w	#$0041,d4				;ACT_根元くらい(65)か？
	bne	L00ebfc
	tst.w	($01bc,a4)				;しゃがみ状態か？
	beq	L00ebfa
	moveq.l	#$40,d3					;ACT_下衝撃３
	bra	L00ebfc
L00ebfa:
	moveq.l	#$3f,d3					;ACT_上衝撃
L00ebfc:
	cmpi.w	#$006f,($0008,a4)		;Y座標チェック
	bgt	L00ec3e
	cmp.w	#$002d,d4				;ACT_転ぶ(45)か？
	beq	L00ec3e
	cmp.w	#$0030,d4				;ACT_空中連続衝撃(48)か？
	beq	L00ec3e
	cmp.w	#$003c,d4				;ACT_空中波動くらい(60)か？
	beq	L00ec3e
	tst.l	($0f02,a6)				;空中ヒット情報が設定されている？
	beq	L00ec26
	movea.l	($0f02,a6),a0
	move.w	($000e,a0),d3			;空中ヒット情報のくらいACT-ID
	bra	L00ec3e
L00ec26:
	cmp.w	#$0041,d4				;ACT_根元くらい(65)か？
	bne	L00ec30
	moveq.l	#$2f,d3					;ACT_ふっとぶ
	bra	L00ec3e
L00ec30:
	cmp.w	#$002f,d4				;ACT_ふっとぶ(47)か？
	beq	L00ec3e
	cmp.w	#$0051,d4				;ユーザ定義のくらい動作(82以上)か？
	bgt	L00ec3e
	moveq.l	#$2e,d3					;ACT_はねかえり
L00ec3e:
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_くらい・システム動作開始)					;SR_くらい・システム動作開始(p2, act_id);
	addq.w	#8,sp
	cmp.w	#$002f,d3				;ACT_ふっとぶ(47)か？
	beq	L00ec64
	cmp.w	#$002d,d3				;ACT_転ぶ(45)か？
	beq	L00ec64
	cmp.w	#$002e,d3				;ACT_はねかえり(46)か？
	beq	L00ec64
	cmp.w	#$003c,d3				;ACT_空中波動くらい(60)か？
	bne	L00ec6a
L00ec64:
	pea.l	($0100)				;IVC_ゾンビ
	bra	L00ec74
L00ec6a:
	cmp.w	#$0030,d3				;ACT_空中連続衝撃(48)か？
	bne	L00ec7e
	pea.l	($0000)				;IVC_通常
L00ec74:
	move.l	a4,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
L00ec7e:
	movea.w	($0004,a5),a1
	move.l	a1,-(sp)
	movea.w	(a5),a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_0038_状態設定_残り体力)	;(p1, p2, ヒット時攻撃力, ピヨリ値);
	lea.l	($0010,sp),sp
	tst.w	($0006,a5)				;燃焼値
	ble	L00ed0c						;0以下の時スキップ
	move.w	($0006,a5),($0a90,a4)	;p2燃焼状態設定
	move.l	a4,-(sp)
	jsr	(SR_スプライトパレット設定_黒)					;SR_スプライトパレット設定_黒(p2);
	addq.w	#4,sp
	bra	L00ed0c
L00ecae:
	cmp.w	#$002f,d4
	bne	L00ecfc
	moveq.l	#$44,d3
	pea.l	($00cc)				;cc=OPT_ダメージ
	move.l	a4,-(sp)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00fc)				;fc=VCT_悲鳴処理
	move.l	a4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.w	#$0001,($01cc,a4)
	clr.w	($01c8,a4)
	clr.w	($01b4,a4)
	clr.w	($1752,a4)
	move.l	a4,-(sp)
	jsr	(SR_キャラクター身体パレット設定)
	addq.w	#4,sp
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a4,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	bra	L00ecfe
L00ecfc:
	moveq.l	#$6a,d3
L00ecfe:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_くらい・システム動作開始)
	addq.w	#8,sp
L00ed0c:
	move.w	($000a,a4),d0		;p2プレイヤー番号
	ext.l	d0					;1024倍
	moveq.l	#$0a,d2
	asl.l	d2,d0
	move.w	($09e0,a4),d1		;p2予約動作ID
	ext.l	d1
	asl.l	#2,d1				;4倍
	movea.l	d0,a0
	adda.l	#INIメッセージ_ジャンプテーブル,a0
	move.l	(a0,d1.l),(L06f432)
	beq	L00ed3e
	move.l	a6,-(sp)
	move.l	a4,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)					;INIメッセージ実行
	addq.w	#8,sp
L00ed3e:
	movem.l	(sp)+,d3-d7/a3-a6
	rts

SR_くらい・システム動作開始(p1, act_id)
{
	//くらい動作、システム動作のときコマンド実行
	if (act_id > 39 && act_id <= 110)
		SYSCALL_0110_Cmd実行_動作(p1, act_id, 0);
}

L00ed6e:
	movem.l	d3-d5/a3-a6,-(sp)
	movea.l	($0020,sp),a5
	movea.l	($0024,sp),a4
	movea.l	($0028,sp),a6
	move.w	($002e,sp),d5
	move.w	($0032,sp),d4
	move.w	($003a,sp),d3
	cmpi.w	#$006f,($0008,a4)
	bgt	L00ed98
	pea.l	($006e)
	bra	L00ed9c
L00ed98:
	pea.l	($0045)
L00ed9c:
	move.l	a4,-(sp)
	jsr	(SR_くらい・システム動作開始)
	addq.w	#8,sp
	tst.w	d3
	beq	L00edb6
	move.w	($01b6,a5),d0
	ext.l	d0
	neg.l	d0
	move.l	d0,-(sp)
	bra	L00edbc
L00edb6:
	movea.w	($01b6,a5),a1
	move.l	a1,-(sp)
L00edbc:
	move.l	a4,-(sp)
	jsr	(SYSCALL_01c8_状態設定_表示方向)
	addq.w	#8,sp
	move.w	($01b6,a4),d0
	move.w	d0,($1758,a4)
	move.w	d0,($09e8,a4)
	pea.l	($0000)				;IVC_通常
	move.l	a5,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	pea.l	($0002)
	pea.l	($0000)
	ext.l	d4
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	move.l	a4,-(sp)
	jsr	(L00f282)
	lea.l	($0014,sp),sp
	pea.l	($0000)
	movea.w	($0008,a6),a1
	move.l	a1,-(sp)
	move.l	a5,-(sp)
	lea.l	(SR_ヒットストップ・キャラ振動設定),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0001)
	movea.w	($0008,a6),a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	move.l	a4,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	move.w	#$7fff,($09f0,a4)
	pea.l	($00f8)					;f8=VCT_防御姿勢表示処理
	move.l	a4,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	pea.l	($0000)
	movea.w	($0002,a6),a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(SYSCALL_0038_状態設定_残り体力)
	lea.l	($0010,sp),sp
	tst.w	($002e,a4)
	bge	L00ee7e
	lea.l	(SFSYSINFO_001e_デバッグモード有効フラグ),a0
	tst.w	(a0)
	beq	L00ee72
	tst.w	($0464,a0)
	bne	L00ee7e
L00ee72:
	tst.w	($0006,a6)
	ble	L00ee7e
	move.w	($0006,a6),($0a90,a4)
L00ee7e:
	move.w	($000a,a4),d0
	ext.l	d0
	moveq.l	#$0a,d2
	asl.l	d2,d0
	move.w	($09e0,a4),d1
	ext.l	d1
	asl.l	#2,d1
	movea.l	d0,a0
	adda.l	#INIメッセージ_ジャンプテーブル,a0
	move.l	(a0,d1.l),(L06f432)
	beq	L00eeb0
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	addq.w	#8,sp
L00eeb0:
	movem.l	(sp)+,d3-d5/a3-a6
	rts

SYSCALL_0038_状態設定_残り体力(p1, p2, dm, ft)
{
	if (p1->01c8_xxxx == 0 || p2->01cc_敗北状態) return;

	SR_キャラ動作関数実行(p2, OPT_ダメージ);

	if (dm >= 0) {
		d3 = SYSCALL_0150_Cnf取得_システム(p2, SYS_CNF_DAMAGE);

		a6_mi0002 = dm;
		a6_mi0004 = 1;

		if (p1->0984_VCT_与ダメージ量調整処理)
			p1->0984_VCT_与ダメージ量調整処理(p1, p2, &a6_mi0002, &a6_mi0004);

		if (a6_mi0002 > 0 && d3 <= 2) {
			if (a6_mi0004) {
				d0 = SR_32bit乗算(p2->002e_残り体力/2+74, a6_mi0002);
				a6_mi0002 = d0 / 128;
			
				if (p1->01b4_変身状態)
					a6_mi0002 *= 2;

				if (a6_mi0002 <= 0)
					a6_mi0002 = 1;
			}

	
			if (d3 == 1) {	// ダメージ半減
				if (a6_mi0002 == 1) {
					a6_mi0002 = 1;
				} else {
					a6_mi0002 /= 2;
				}
			} else if (d3 == 2) {	// ダメージ2倍
				a6_mi0002 *= 2;
			} else {	// ダメージ通常
				// 何もしない
			}

			if (p2->0974_VCT_受ダメージ量調整処理)
				p2->0974_VCT_受ダメージ量調整処理(p2, p1, &a6_mi0002, &a6_mi0004);

			p2->002e_残り体力 -= a6_mi0002;
		}
	}

	if (ft > 0) {
		if (SFSYSINFO_0034_気絶有効) {
			p2->0032_気絶量 = ft + XCLIB_32bit符号付整数除算(乱数発生(), 10000);
		} else {
			p2->0032_気絶量 = 0;
		}
	}

	d0 = SYSCALL_0150_Cnf取得_システム(p2, SYS_CNF_TRANSFORM);
	if (d0 == 0 && p2->01b4_変身状態) {
		a6_mi0006 = 0;
		a6_mi0008 = 1;

		if (p2->097c_VCT_変身条件判定処理)
			p2->097c_VCT_変身条件判定処理(p2, p1, &a6_mi0006, &a6_mi0008);

		if (a6_mi0008 && p2->002e_残り体力 <= 7 && (SFSYSINFO_001e_デバッグモード有効フラグ == 0 || SFSYSINFO_0482_デバッグ_トレーニングモード == 0))
			a6_mi0006 = 1;

		if (a6_mi00006) {
			p2->01b4_変身状態 = 1;
			SR_キャラ動作関数実行(p2, SUB_変身);
		}
	}

	if (p2->002e_残り体力 < 0 && (SFSYSINFO_001e_デバッグモード有効フラグ == 0 || SFSYSINFO_0482_デバッグ_トレーニングモード == 0)) {
		p2->01b4_変身状態 = 0;
		p2->1752_防御キャンセルフラグ = 0;
		SR_キャラクター身体パレット設定(p2);

		SR_PCM8ファンクションコール_L017eba(プレイヤー番号);

		if (SFSYSINFO_0078_ヒットストップ <= 25)
			SR_ヒットストップ・キャラ振動設定(p2, 26, 0);

		SYSCALL_007c_Cmd実行_防御(p2, p1, 0);
		SYSCALL_00c0_状態設定_永続無敵(p2, IVC_ゾンビ);

		p2->01cc_敗北状態 = 1;
		p2->09e4_複合動作ID = ACT_アイドル;
		p2->01c8_xxxx = 0;

		if (p2->09e2 != ACT_投げられ && p2->09e2_空中投げられ) {
			p2->09e6_動作過程値 = 0;

			d0 = -p1->01b6_表示方向;
			p2->01b6_表示方向 = d0;
			p2->09e8_動作方向 = d0;

			SR_くらい・システム動作開始(p2, ACT_敗北転倒);
			L06f432 = INIメッセージ_ジャンプテーブル[p2->プレイヤー番号 * 1024 + ACT_敗北転倒 * 4];
			if (L06f432)
				L06f432(p2, p1);
		}

		SR_暗転グラフィックパレット生成(0, 128)
		SR_グラフィックパレット反映(0);

		SR_暗転グラフィックパレット生成(128, 128);
		SR_グラフィックパレット反映(128);
	} else {
		if (p2->0032_気絶量 > 40 && p2->0f1a_シューティングモード == 0) {
			if (SFSYSINFO_0034_気絶有効 {
				if (p2->0032_気絶量 > 44)
					p2->0a46_威力レベル = LEVEL_大;
				else
					p2->0a46_威力レベル = LEVEL_小;

				SR_くらい・システム動作開始(p2, ACT_ピヨピヨ);	// 0x0068

				SYSCALL_00c0_状態設定_永続無敵(p2, IVC_ゾンビ);
				p2->0032_気絶量 = 1000;
			}
		} else {
			if (p2->002e_残り体力 < 0) {
				p2->002e_残り体力 = 1;
				return;
			}
		}

		if (p2->0032_気絶量 > 40 && p2->0f1a_シューティングモード == 0) {
			if (SFSYSINFO_0034_気絶有効) {
				if (p2->0032_気絶量 > 44)
					p2->0a46_威力レベル = LEVEL_大;
				else
					p2->0a46_威力レベル = LEVEL_小;

				SR_くらい・システム動作開始(p2, ACT_ピヨピヨ);	// 0x0068

				SYSCALL_00c0_状態設定_永続無敵(p2, IVC_ゾンビ);
				p2->0032_気絶量 = 1000;
			}
		} else {
			if (p2->002e_残り体力 < 0) {
				p2->002e_残り体力 = 1;
				return;
			}
		}
	}

	SR_ステージBGM変化();

	if (p2->002e_残り体力 >= 0) return;

	if (SFSYSINFO_001e_デバッグモード有効フラグ && SFSYSINFO_0482_デバッグ_トレーニングモード) return;

	SR_MESS_SP_PCGパターン定義(8, 0, 8);	//KO
	p2->0032_気絶量 = 0;
	if (p1->002e_残り体力 == 88) {
		SYSCALL_0024_音声再生(0, PCM_完璧);
		SR_MESS_SP表示_固定位置(0x0f00);
	} else {
		SYSCALL_0024_音声再生(0, PCM_KO);
		SR_MESS_SP表示_固定位置(0x0d00);
	}
	p2->001c_xxxx = 1;
}

L00f282:
	link	a6,#-$0002
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0008,a6),a3
	move.w	($000e,a6),d2
	move.w	($0012,a6),d3
	move.w	($0016,a6),d4
	move.w	($001a,a6),d1
	movea.l	($132a,a3),a1
	moveq.l	#$01,d0
	move.w	d0,(-$0002,a6)
	move.w	($0006,a1),d5
	cmp.w	($0006,a3),d5
	ble	L00f2b8
	move.w	d0,($0f1e,a3)
	bra	L00f2be
L00f2b8:
	move.w	#$ffff,($0f1e,a3)
L00f2be:
	cmpi.w	#$0070,($0008,a3)
	bne	L00f2d6
	cmpi.w	#$0070,($0008,a1)
	beq	L00f2e6
	move.w	#$0001,($0f20,a3)
	bra	L00f2ea
L00f2d6:
	cmpi.w	#$0070,($0008,a1)
	bne	L00f2e6
	move.w	#$ffff,($0f20,a3)
	bra	L00f2ea
L00f2e6:
	clr.w	($0f20,a3)
L00f2ea:
	move.w	d1,($0a6c,a3)
	move.w	d1,d0
	ext.l	d0
	lea.l	(L01ff1a),a0
	add.l	d0,d0
	move.w	(a0,d0.l),($0a70,a3)
	move.w	d2,($0a72,a3)
	move.w	d3,($0a74,a3)
	cmp.w	#$0005,d4
	ble	L00f316
	move.w	#$0001,($0a6e,a3)
	bra	L00f31a
L00f316:
	clr.w	($0a6e,a3)
L00f31a:
	move.w	d1,d0
	ext.l	d0
	lea.l	(L01ff12),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	move.l	($05e0,a0),(L06f432)
	beq	L00f368
	pea.l	(-$0002,a6)
	pea.l	($0a6e,a3)
	pea.l	($0000)
	pea.l	($0a74,a3)
	pea.l	($0a72,a3)
	pea.l	($0a70,a3)
	pea.l	(-$0001)
	move.l	a3,-(sp)
	move.l	a1,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0024,sp),sp
L00f368:
	tst.w	(-$0002,a6)
	beq	L00f3b2
	jsr	(乱数発生)
	movea.l	a3,a0
	move.w	($0a72,a3),d1
	subq.w	#4,d1
	tst.l	d0
	bge	L00f386
	add.l	#$00000fff,d0
L00f386:
	moveq.l	#$0c,d5
	asr.l	d5,d0
	add.w	d0,d1
	move.w	d1,($0a72,a0)
	jsr	(乱数発生)
	movea.l	a3,a0
	move.w	($0a74,a3),d1
	subq.w	#8,d1
	tst.l	d0
	bge	L00f3a8
	add.l	#$000007ff,d0
L00f3a8:
	moveq.l	#$0b,d5
	asr.l	d5,d0
	add.w	d0,d1
	move.w	d1,($0a74,a0)
L00f3b2:
	move.w	($0a72,a3),($1732,a3)
	move.w	($0a74,a3),($1734,a3)
	movem.l	(-$0012,a6),d3-d5/a3
	unlk	a6
	rts

SR_ヒット・防御マーク表示処理:
	link	a6,#-$0002
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0008,a6),a3			;a3=p1
	movea.l	($132a,a3),a4			;a4=p2
	move.w	#$0001,(-$0002,a6)
	cmpi.w	#$0001,($000a,a3)		;p1->000a_プレイヤー番号
	bne	L00f3ea
	moveq.l	#$00,d3
	bra	L00f3ec
L00f3ea:
	moveq.l	#$05,d3
L00f3ec:
	cmpi.w	#$0001,($0a6c,a3)
	bne	L00f47a
	move.l	($0998,a4),(L06f432)		;VCT_ヒットマーク処理
	beq	L00f42c
	pea.l	(-$0002,a6)
	pea.l	($0a6e,a3)
	movea.w	d3,a1
	move.l	a1,-(sp)
	pea.l	($0a74,a3)					;ヒットマークY座標
	pea.l	($0a72,a3)					;ヒットマークX座標
	pea.l	($0a70,a3)					;ヒットマークアニメーションカウンタ
	pea.l	($0000)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0024,sp),sp
L00f42c:
	tst.w	(-$0002,a6)
	beq	L00f460
	subq.w	#1,($0a70,a3)
	movea.w	($0a6e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a74,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a72,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a70,a3),a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_008c_XXXX)
	lea.l	($001c,sp),sp
L00f460:
	tst.w	($0a70,a3)
	bgt	L00f5b4
	move.w	#$0001,(-$0002,a6)
	move.l	($0998,a4),(L06f432)		;VCT_ヒットマーク処理
	bra	L00f584
L00f47a:
	cmpi.w	#$0002,($0a6c,a3)
	bne	L00f506
	move.l	($0994,a4),(L06f432)		;VCT_防御マーク処理
	beq	L00f4ba
	jsr	(a0)							VCT_防御マーク処理(p2, p1, 0, p1->0a70_ヒットマークアニメーションカウンタ, p1->0a72_ヒットマークX座標, p1->0a74_ヒットマークY座標, d3, p1->0a6e_ヒット・防御マークレベル, a6_mi0002);
	lea.l	($0024,sp),sp
L00f4ba:
	tst.w	(-$0002,a6)
	beq	L00f4ee
	subq.w	#1,($0a70,a3)
	movea.w	($0a6e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a74,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a72,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a70,a3),a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0090_XXXX)
	lea.l	($001c,sp),sp
L00f4ee:
	tst.w	($0a70,a3)
	bgt	L00f5b4
	move.w	#$0001,(-$0002,a6)
	move.l	($0994,a4),(L06f432)		;VCT_防御マーク処理
	bra	L00f584
L00f506:
	move.l	($0990,a3),(L06f432)		;VCT_標準SHOT消滅マーク処理
	beq	L00f53c
	pea.l	(-$0002,a6)
	pea.l	($0a6e,a3)
	movea.w	d3,a1
	move.l	a1,-(sp)
	pea.l	($0a74,a3)
	pea.l	($0a72,a3)
	pea.l	($0a70,a3)
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0024,sp),sp
L00f53c:
	tst.w	(-$0002,a6)
	beq	L00f570
	subq.w	#1,($0a70,a3)
	movea.w	($0a6e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a74,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a72,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a70,a3),a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(L0100c0)
	lea.l	($001c,sp),sp
L00f570:
	tst.w	($0a70,a3)
	bgt	L00f5b4
	move.w	#$0001,(-$0002,a6)
	move.l	($0990,a3),(L06f432)		;VCT_標準SHOT消滅マーク処理
L00f584:
	tst.l	(L06f432)
	beq	L00f5b4
	pea.l	(-$0002,a6)
	pea.l	($0a6e,a3)
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0a74,a3)
	pea.l	($0a72,a3)
	pea.l	($0a70,a3)
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
L00f5b4:
	tst.w	($0a70,a3)
	bgt	L00f5be
	clr.w	($0a6c,a3)
L00f5be:
	movem.l	(-$000e,a6),d3/a3-a4
	unlk	a6
	rts

SYSCALL_008c_XXXX:
	link	a6,#-$0008
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($000c,a6),a0
	move.w	($0012,a6),d5
	move.w	($0016,a6),d3
	move.w	($001a,a6),d6
	move.w	($001e,a6),d4
	move.w	($0022,a6),d0
	movea.w	($0f1e,a0),a1
	cmpi.w	#$0001,($000a,a0)
	bne	L00f5fa
	move.w	#$06e0,d2
	bra	L00f5fe
L00f5fa:
	move.w	#$04e0,d2
L00f5fe:
	tst.w	d0
	bne	L00f81e
	movea.w	d3,a0
	moveq.l	#$08,d1
	sub.l	a0,d1
	asr.l	#3,d1
	moveq.l	#$10,d0
	sub.l	a0,d0
	sub.l	a0,d0
	asr.l	#3,d0
	add.w	#$0010,d6
	movea.w	d6,a4
	suba.w	d1,a4
	add.w	d6,d1
	move.w	d1,(-$0002,a6)
	move.w	d4,d1
	sub.w	d0,d1
	add.w	d4,d0
	move.w	d0,(-$0004,a6)
	cmp.w	#$000e,d3
	ble	L00f6bc
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d6,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L00ffd6
L00f6bc:
	cmp.w	#$0009,d3
	ble	L00f74e
	addq.w	#1,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d6,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L00ffd6
L00f74e:
	cmp.w	#$0005,d3
	ble	L00f7b8
	addq.w	#4,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d1,a5
	subq.w	#8,a5
	move.l	a5,-(sp)
	move.w	a4,d4
	ext.l	d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	move.w	(-$0004,a6),d3
	ext.l	d3
	addq.l	#8,d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	a5,-(sp)
	movea.w	(-$0002,a6),a5
	addq.w	#8,a5
	bra	L00ffb2
L00f7b8:
	add.w	#$0009,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d1,a5
	subq.w	#8,a5
	move.l	a5,-(sp)
	move.w	a4,d4
	ext.l	d4
	subq.l	#4,d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	move.w	(-$0004,a6),d3
	ext.l	d3
	addq.l	#8,d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	a5,-(sp)
	movea.w	(-$0002,a6),a5
	addq.w	#4,a5
	bra	L00ffb2
L00f81e:
	cmp.w	#$0001,d0
	beq	L00f82c
	cmp.w	#$0002,d0
	bne	L00ffda
L00f82c:
	cmp.w	#$0002,d0
	bne	L00f846
	movea.w	d3,a0
	moveq.l	#$08,d0
	sub.l	a0,d0
	asr.l	#2,d0
	move.w	d0,d1
	moveq.l	#$10,d0
	sub.l	a0,d0
	sub.l	a0,d0
	asr.l	#2,d0
	bra	L00f858
L00f846:
	movea.w	d3,a0
	moveq.l	#$08,d0
	sub.l	a0,d0
	asr.l	#1,d0
	move.w	d0,d1
	moveq.l	#$10,d0
	sub.l	a0,d0
	sub.l	a0,d0
	asr.l	#1,d0
L00f858:
	add.w	#$0010,d6
	movea.w	d6,a4
	suba.w	d1,a4
	add.w	d6,d1
	move.w	d1,(-$0002,a6)
	move.w	d4,d1
	sub.w	d0,d1
	add.w	d4,d0
	move.w	d0,(-$0004,a6)
	cmp.w	#$000e,d3
	ble	L00f902
	addq.w	#2,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d6,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L00ffd6
L00f902:
	cmp.w	#$0009,d3
	ble	L00f994
	addq.w	#3,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d6,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L00ffd6
L00f994:
	cmp.w	#$0006,d3
	ble	L00f9fe
	addq.w	#4,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d1,a5
	subq.w	#8,a5
	move.l	a5,-(sp)
	move.w	a4,d4
	ext.l	d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	move.w	(-$0004,a6),d3
	ext.l	d3
	addq.l	#8,d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	a5,-(sp)
	movea.w	(-$0002,a6),a5
	addq.w	#8,a5
	bra	L00ffb2
L00f9fe:
	cmp.w	#$0005,d3
	ble	L00fb2c
	addq.w	#5,d2
	moveq.l	#$ff,d7
	cmp.w	a1,d7
	bne	L00fa9c
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	a4,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fa9c:
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	(-$0002,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$0000c000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fb2c:
	cmp.w	#$0004,d3
	ble	L00fc5a
	addq.w	#7,d2
	moveq.l	#$01,d7
	cmp.w	a1,d7
	bne	L00fbca
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	a4,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fbca:
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	(-$0002,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$0000c000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fc5a:
	cmp.w	#$0003,d3
	ble	L00fd88
	addq.w	#5,d2
	moveq.l	#$ff,d7
	cmp.w	a1,d7
	bne	L00fcf8
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	a4,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fcf8:
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	(-$0002,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$0000c000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fd88:
	cmp.w	#$0002,d3
	ble	L00fe26
	add.w	#$0009,d2
	moveq.l	#$01,d7
	cmp.w	a1,d7
	bne	L00fdde
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d1,a0
	pea.l	(-$0004,a0)
	movea.w	a4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008000,a3
	move.l	a3,-(sp)
	movea.w	(-$0004,a6),a0
	pea.l	($0004,a0)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fdde:
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($4000,a3)
	movea.w	d1,a0
	pea.l	(-$0004,a0)
	movea.w	(-$0002,a6),a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	movea.w	(-$0004,a6),a0
	pea.l	($0004,a0)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fe26:
	cmp.w	#$0001,d3
	ble	L00ff54
	addq.w	#7,d2
	moveq.l	#$ff,d7
	cmp.w	a1,d7
	bne	L00fec4
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	a4,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00fec4:
	pea.l	($0001)
	movea.w	d2,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0008,a6)
	movea.l	d1,a2
	pea.l	(-$0010,a2)
	movea.w	(-$0002,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0008,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$0000c000,d7
	move.l	d7,-(sp)
	movea.w	(-$0004,a6),a2
	move.l	a2,(-$0008,a6)
	move.l	a2,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0008,a6),a2
	pea.l	($0010,a2)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L00ffd6
L00ff54:
	add.w	#$0009,d2
	pea.l	($0001)
	movea.w	d2,a3
	move.l	a3,-(sp)
	movea.w	d1,a5
	subq.w	#4,a5
	move.l	a5,-(sp)
	move.w	a4,d4
	ext.l	d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,d7
	add.l	#$00008000,d7
	move.l	d7,-(sp)
	move.w	(-$0004,a6),d3
	ext.l	d3
	addq.l	#4,d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	a5,-(sp)
	movea.w	(-$0002,a6),a5
L00ffb2:
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a4)
L00ffd6:
	lea.l	($0014,sp),sp
L00ffda:
	movem.l	(-$0028,a6),d3-d7/a3-a5
	unlk	a6
	rts

SYSCALL_0090_XXXX:
	movem.l	d3-d7/a3-a5,-(sp)
	move.w	($002e,sp),d5
	move.w	($0032,sp),d3
	move.w	($0036,sp),d2
	move.w	($003a,sp),d1
	move.w	d3,d0
	asr.w	#2,d0
	move.w	d2,d4
	add.w	d0,d4
	addq.w	#8,d4
	move.w	d2,d6
	sub.w	d0,d6
	add.w	#$0017,d6
	move.w	d1,d2
	add.w	d0,d2
	subq.w	#8,d2
	move.w	d1,d7
	sub.w	d0,d7
	addq.w	#7,d7
	cmp.w	#$000a,d3
	ble	L010022
	move.w	#$0bea,d0
	bra	L01003e
L010022:
	cmp.w	#$0006,d3
	ble	L01002e
	move.w	#$0beb,d0
	bra	L01003e
L01002e:
	cmp.w	#$0002,d3
	ble	L01003a
	move.w	#$0bec,d0
	bra	L01003e
L01003a:
	move.w	#$0bed,d0
L01003e:
	pea.l	($0001)
	movea.w	d0,a3
	move.l	a3,-(sp)
	move.w	d2,d3
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d4,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d3,-(sp)
	move.w	d6,d3
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	move.w	d7,d4
	ext.l	d4
	move.l	d4,-(sp)
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	movem.l	(sp)+,d3-d7/a3-a5
	rts

L0100c0:
	link	a6,#-$0018
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($000c,a6),a0
	move.w	($0012,a6),d5
	move.w	($0016,a6),d2
	move.w	($001e,a6),d4
	move.w	($0f1e,a0),d6
	moveq.l	#$0a,d1
	sub.w	d2,d1
	moveq.l	#$1a,d0
	sub.w	d2,d0
	sub.w	d2,d0
	move.w	($001a,a6),d3
	add.w	#$0018,d3
	move.w	d3,d7
	sub.w	d1,d7
	add.w	d3,d1
	move.w	d1,(-$0014,a6)
	move.w	d4,d1
	sub.w	d0,d1
	add.w	d4,d0
	move.w	d0,(-$0002,a6)
	cmpi.w	#$0001,($000a,a0)
	bne	L010110
	move.w	#$06e0,d0
	bra	L010114
L010110:
	move.w	#$04e0,d0
L010114:
	cmp.w	#$0010,d2
	ble	L0101a6
	addq.w	#2,d0
	pea.l	($0001)
	movea.w	d0,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d3,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L0108b0
L0101a6:
	cmp.w	#$000e,d2
	ble	L010238
	addq.w	#3,d0
	pea.l	($0001)
	movea.w	d0,a3
	move.l	a3,-(sp)
	movea.w	d4,a4
	move.l	a4,d4
	subq.l	#8,d4
	move.l	d4,-(sp)
	movea.w	d3,a5
	move.l	a5,d3
	subq.l	#8,d3
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	d4,-(sp)
	addq.w	#8,a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	addq.w	#8,a4
	move.l	a4,-(sp)
	move.l	d3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	bra	L0108b0
L010238:
	cmp.w	#$000b,d2
	ble	L0102d8
	addq.w	#4,d0
	cmp.w	#$ffff,d6
	bne	L01028e
	pea.l	($0001)
	movea.w	d0,a4
	move.l	a4,-(sp)
	movea.w	d1,a0
	pea.l	(-$0008,a0)
	movea.w	d7,a3
	subq.w	#8,a3
	move.l	a3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008000,a4
	move.l	a4,-(sp)
	movea.w	(-$0002,a6),a0
	pea.l	($0008,a0)
	move.l	a3,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L01028e:
	pea.l	($0001)
	movea.w	d0,a4
	pea.l	($4000,a4)
	movea.w	d1,a0
	pea.l	(-$0008,a0)
	movea.w	(-$0014,a6),a3
	addq.w	#8,a3
	move.l	a3,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a4
	move.l	a4,-(sp)
	movea.w	(-$0002,a6),a0
	pea.l	($0008,a0)
	move.l	a3,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L0102d8:
	cmp.w	#$0008,d2
	ble	L010406
	addq.w	#5,d0
	cmp.w	#$ffff,d6
	bne	L010376
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0018,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	d7,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0018,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L010376:
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0006,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	(-$0014,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0006,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$0000c000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L010406:
	cmp.w	#$0006,d2
	ble	L010534
	addq.w	#7,d0
	cmp.w	#$ffff,d6
	bne	L0104a4
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0018,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	d7,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0018,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L0104a4:
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$000a,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	(-$0014,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$000a,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$0000c000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L010534:
	cmp.w	#$0005,d2
	ble	L010662
	addq.w	#5,d0
	cmp.w	#$ffff,d6
	bne	L0105d2
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0018,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	d7,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0018,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L0105d2:
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$000e,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	(-$0014,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$000e,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$0000c000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L010662:
	cmp.w	#$0004,d2
	ble	L010700
	add.w	#$0009,d0
	cmp.w	#$ffff,d6
	bne	L0106b8
	pea.l	($0001)
	movea.w	d0,a3
	move.l	a3,-(sp)
	movea.w	d1,a0
	pea.l	(-$0004,a0)
	movea.w	d7,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008000,a3
	move.l	a3,-(sp)
	movea.w	(-$0002,a6),a0
	pea.l	($0004,a0)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L0106b8:
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($4000,a3)
	movea.w	d1,a0
	pea.l	(-$0004,a0)
	movea.w	(-$0014,a6),a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	movea.w	(-$0002,a6),a0
	pea.l	($0004,a0)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L010700:
	cmp.w	#$0002,d2
	ble	L01082e
	addq.w	#7,d0
	cmp.w	#$ffff,d6
	bne	L01079e
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($0001,a3)
	ext.l	d1
	move.l	d1,(-$0018,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	d7,a4
	subq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a3,-(sp)
	move.l	(-$0018,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$00008001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L01079e:
	pea.l	($0001)
	movea.w	d0,a3
	pea.l	($4001,a3)
	ext.l	d1
	move.l	d1,(-$0012,a6)
	movea.l	d1,a1
	pea.l	(-$0010,a1)
	movea.w	(-$0014,a6),a4
	addq.w	#4,a4
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a5
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	(-$0012,a6),-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$0000c000,a1
	move.l	a1,-(sp)
	movea.w	(-$0002,a6),a1
	move.l	a1,(-$0018,a6)
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a5)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c001,a3
	move.l	a3,-(sp)
	movea.l	(-$0018,a6),a1
	pea.l	($0010,a1)
	move.l	a4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a5)
	bra	L0108b0
L01082e:
	add.w	#$0009,d0
	pea.l	($0001)
	movea.w	d0,a3
	move.l	a3,-(sp)
	movea.w	d1,a5
	subq.w	#4,a5
	move.l	a5,-(sp)
	move.w	d7,d4
	ext.l	d4
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	movea.l	a3,a1
	adda.l	#$00008000,a1
	move.l	a1,-(sp)
	move.w	(-$0002,a6),d3
	ext.l	d3
	addq.l	#4,d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($4000,a3)
	move.l	a5,-(sp)
	movea.w	(-$0014,a6),a5
	move.l	a5,-(sp)
	movea.w	d5,a0
	addq.w	#1,d5
	move.l	a0,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	adda.l	#$0000c000,a3
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	move.l	a5,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	jsr	(a4)
L0108b0:
	lea.l	($0014,sp),sp
	movem.l	(-$0038,a6),d3-d7/a3-a5
	unlk	a6
	rts

SYSCALL_0030_コンボ設定_決定:
	movem.l	a3-a4,-(sp)
	movea.l	($000c,sp),a3
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L01ff04),a4
	add.l	d0,d0
	move.w	#$ffff,(a4,d0.l)
	move.w	#$0030,($0a98,a3)
	move.l	a3,-(sp)
	jsr	(SR_コンボ数表示)
	addq.w	#4,sp
	clr.w	($0a96,a3)
	move.w	($000a,a3),d0
	ext.l	d0
	add.l	d0,d0
	clr.w	(a4,d0.l)
	movem.l	(sp)+,a3-a4
	rts

L010900:
	.dc.b	'HIT',$00
L010904:
	.dc.b	'COMBO',$00
SR_コンボ数表示(p1)
{
	d6 = p1->0a96_コンボ現在値

	if (p1->0f1a_シューティングモード || p1->0a96_コンボ現在値 <= 1)
		return;

	d1 = p1->プレイヤー番号 - 1;
	a6_mi0002 = p1->プレイヤー番号 - 1;
	d7 = L01ff06[d1 * 2];
	if (d7 >= 0 && d7 >= p1->0a96_コンボ現在値)
		return;

	SR_BG文字列消去(表示中コンボ数_X座標[a6_mi0002], 表示中コンボ数_Y座標[a6_mi0002], 2);
	SR_BG文字列消去(表示中コンボ数_X座標[a6_mi0002], 表示中コンボ数_Y座標[a6_mi0002]+1, 2);

	if (a6_mi0002 == 0) {
		d5 = WORK_2P_1732_コンボ数表示_X座標;
		d4 = WORK_2P_1734_コンボ数表示_Y座標;
	} else {
		d5 = WORK_1P_1732_コンボ数表示_X座標;
		d4 = WORK_1P_1734_コンボ数表示_Y座標;
	}
	d5 /= 8;
	d4 /= 8;
	
	if (d5 <= 0) d5 = 1;
	else if (d5 > 29) d5 = 29;
	
	if (d4 <= 11) d4 = 12;
	else if (d4 > 23) d4 = 23;

	if (d7 < 0) {
		d3 = p1->000a_プレイヤー番号 == 2 ? 18 : 0;

		SR_コンボ数表示クリア(p1);

		p10>0a98_xxxx = 64;

		SR_ラウンドタイマーBG数字表示(d3+3, 12, d6, 0x0f00);
		if (d6 <= 9) {
			SR_BG文字列表示(d3+5, 12, "HIT", 0x0c00);
			SR_BG文字列表示(d3+6, 13, "COMBO", 0x0c00);
		} else {
			SR_BG文字列表示(d3+6, 12, "HIT", 0x0c00);
			SR_BG文字列表示(d3+7, 13, "COMBO", 0x0c00);
		}
	} else {
		SR_ラウンドタイマーBG数字表示(d5, d4, d6, 0x0f00);
	}
L010aa0:

	表示中コンボ数_X座標[a6_mi0002 * 2] = d5;
	表示中コンボ数_Y座標[a6_mi0002 * 2] = d4;
	L01ff04[p1->000a_プレイヤー番号 * 2] = d6:
	
	if (d6 > p1->0a9c_MAXコンボ) {
		p1->0a9c_MAXコンボ = d6;
		SR_MAXCOMBO表示(p1);
	}
}

L010af4:
	.dc.b	' MAX COMBO   ',$00
SR_MAXCOMBO表示:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a0				;a0=p1
	tst.w	($0a9c,a0)					;MAXコンボが0以下だったら分岐
	ble	L010b92
	move.w	($0a9c,a0),d3
	tst.w	($0f1a,a0)					;シューティングモードだったら何もせず終了
	bne	L010bbe
	cmp.w	#$0063,d3
	ble	L010b24
	moveq.l	#$63,d3						;MAXコンボが100以上の時、99に
L010b24:
	cmpi.w	#$0001,($000a,a0)			;プレイヤー番号で分岐
	bne	L010b5a
	pea.l	($0c00)						;引数4:パレットブロックNo.
	pea.l	(L010af4)					;引数3:文字列"MAX COMBO"
	pea.l	($0002)						;引数2:Y
	pea.l	($0001)						;引数1:X
	jsr	(SR_BG文字列描画)						;SR_BG文字列描画(1, 2, "MAX COMBO", 0xc00);
	lea.l	($0010,sp),sp
	pea.l	($0c00)
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0002)
	pea.l	($000c)						;SR_BG数字表示(12, 2, MAXコンボ, 0xc00);
	bra	L010b86
L010b5a:								;2Pの場合
	pea.l	($0c00)
	pea.l	(L010af4)
	pea.l	($0002)
	pea.l	($0012)
	jsr	(SR_BG文字列描画)						;SR_BG文字列描画(18, 2, "MAX COMBO", 0xc00);
	lea.l	($0010,sp),sp
	pea.l	($0c00)
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0002)
	pea.l	($001d)						;SR_BG数字表示(29, 2, MAXコンボ, 0xc00);
L010b86:
	jsr	(SR_BG数字表示)
	lea.l	($0010,sp),sp
	bra	L010bbe
L010b92:								;MAXコンボが0の時の処理
	cmpi.w	#$0001,($000a,a0)
	bne	L010ba8
	pea.l	($000d)
	pea.l	($0002)
	pea.l	($0001)
	bra	L010bb4
L010ba8:
	pea.l	($000d)
	pea.l	($0002)
	pea.l	($0012)
L010bb4:
	jsr	(SR_BG文字列消去)				;SR_BG文字列消去(x, y, 文字数);
	lea.l	($000c,sp),sp
L010bbe:
	move.l	(sp)+,d3
	rts

L010bc2:
	.dc.b	'FIRST',$00
L010bc8:
	.dc.b	'ATTACK',$00,$00
SYSCALL_0034_同期開始_先制攻撃判定:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	movea.l	($000c,sp),a0
	tst.w	($0a9a,a3)				;ファーストアタック表示済みか？
	bne	L010c72						;表示済みだったら何もせず終了
	move.w	#$0001,($0a9a,a3)		;p1の表示済みフラグを立てる
	move.w	#$0001,($0a9a,a0)		;p2も立てる
	move.w	#$0040,($0a98,a3)
	addq.w	#1,($0a9e,a3)
	move.l	a3,-(sp)
	jsr	(SR_コンボ数表示クリア)
	addq.w	#4,sp
	cmpi.w	#$0001,($000a,a3)
	bne	L010c3c					;プレイヤー番号で分岐
	pea.l	($0f00)
	pea.l	(L010bc2)			;FIRSTの文字
	pea.l	($000c)
	pea.l	($0003)
	lea.l	(SR_BG文字列表示),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L010bc8)			;ATTACKの文字
	pea.l	($000d)
	pea.l	($0006)
	bra	L010c6c
L010c3c:
	pea.l	($0f00)
	pea.l	(L010bc2)
	pea.l	($000c)
	pea.l	($0014)
	lea.l	(SR_BG文字列表示),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L010bc8)
	pea.l	($000d)
	pea.l	($0017)
L010c6c:
	jsr	(a3)
	lea.l	($0010,sp),sp
L010c72:
	movea.l	(sp)+,a3
	rts

L010c76:
	.dc.b	'RECOVERY',$00,$00
SR_気絶回復表示:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	#$0040,($0a98,a3)
	addq.w	#1,($0aa2,a3)
	move.l	a3,-(sp)
	jsr	(SR_コンボ数表示クリア)
	addq.w	#4,sp
	cmpi.w	#$0001,($000a,a3)
	bne	L010cb6
	pea.l	($0f00)
	pea.l	(L010c76)
	pea.l	($000c)
	pea.l	($0004)
	bra	L010cc8
L010cb6:
	pea.l	($0f00)
	pea.l	(L010c76)
	pea.l	($000c)
	pea.l	($0015)
L010cc8:
	jsr	(SR_BG文字列表示)
	lea.l	($0010,sp),sp
	movea.l	(sp)+,a3
	rts

L010cd6:
	.dc.b	'REVERSAL',$00,$00
SR_リバーサル表示:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	#$0040,($0a98,a3)
	clr.w	($0a94,a3)
	addq.w	#1,($0aa0,a3)
	move.l	a3,-(sp)
	jsr	(SR_コンボ数表示クリア)
	addq.w	#4,sp
	cmpi.w	#$0001,($000a,a3)	;プレイヤー番号は1以外？
	bne	L010d38					;分岐
	pea.l	($0f00)
	pea.l	(L010cd6)			;REVERSALの文字列
	pea.l	($000c)
	pea.l	($0002)
	lea.l	(SR_BG文字列表示),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L010bc8)			;ATTACKの文字列
	pea.l	($000d)
	pea.l	($0006)
	bra	L010d68
L010d38:
	pea.l	($0f00)
	pea.l	(L010cd6)
	pea.l	($000c)
	pea.l	($0014)
	lea.l	(SR_BG文字列表示),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	($0f00)
	pea.l	(L010bc8)
	pea.l	($000d)
	pea.l	($0018)
L010d68:
	jsr	(a3)
	lea.l	($0010,sp),sp
	movea.l	(sp)+,a3
	rts

SR_コンボ数表示クリア(p1)
{
	d3 = p1->000a_プレイヤー番号 - 1;

	if (d3 == 0) {
		SR_BG文字列消去(1, 12, 15);
		SR_BG文字列消去(1, 13, 15);
	} else {
		SR_BG文字列消去(16, 12, 15);
		SR_BG文字列消去(16, 13, 15);
	}

	SR_BG文字列消去(表示中コンボ数_X座標[d3 * 2], 表示中コンボ数_Y座標[d3 * 2], 2);
	SR_BG文字列消去(表示中コンボ数_X座標[d3 * 2], 表示中コンボ数_Y座標[d3 * 2]+1, 2);

	表示中コンボ数_X座標[d3 * 2] = 50;
	表示中コンボ数_Y座標[d3 * 2] = 20;
}

SR_ヒット情報クリア:
	movea.l	($0004,sp),a0
	cmpi.w	#$0027,($09e2,a0)		;動作ID
	ble	L010e3c
	cmpi.w	#$0027,($09e4,a0)		;複合動作ID
	bgt	L010e42
L010e3c:
	clr.w	($0a3c,a0)				;攻撃判定有無
	bra	L010e48
L010e42:
	tst.w	($0a3c,a0)
	bne	L010e52
L010e48:
	moveq.l	#$00,d0
	move.l	d0,($0f02,a0)			;ヒット情報クリア
	move.l	d0,($0a3e,a0)			;空中ヒット情報クリア
L010e52:
	move.l	a0,-(sp)
	jsr	(SR_キャラキャンセル可能フラグクリア)
	addq.w	#4,sp
	rts

L010e5e:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a4
	movea.l	($0014,sp),a5
	move.l	a4,-(sp)
	lea.l	(SR_STC_TRG_直接状態更新),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	a5,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	tst.w	($0ac2,a4)				;気集中状態チェック
	bgt	L011110
	tst.w	($0ac2,a5)
	bgt	L011110
	tst.w	($0aca,a4)
	beq	L010ecc
	tst.w	($0a86,a4)				;CPU制御状態チェック
	beq	@f							;人間制御の時スキップ
	move.w	($09e2,a4),d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a4,d0.l),a0
	movea.l	($0f24,a0),a0
	cmpa.w	#$0000,a0
	beq	L010ecc
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	jsr	(a0)						;CPU思考ルーチン実行
	bra	L010eca
@@:	tst.w	($0ce4,a4)
	ble	@f
	subq.w	#1,($0ce4,a4)			;1p受け身コマンド実行状態をデクリメント
@@:	move.l	a5,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_コマンド判定処理一括実行)	;1p側実行
L010eca:
	addq.w	#8,sp
L010ecc:
	tst.w	($0aca,a5)
	beq	L010f0c
	tst.w	($0a86,a5)
	beq	@f						;人間制御の場合スキップ
	move.w	($09e2,a5),d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a5,d0.l),a0
	movea.l	($0f24,a0),a0
	cmpa.w	#$0000,a0
	beq	L010f0c
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(a0)						;CPU思考ルーチン実行
	bra	L010f0a
@@:	tst.w	($0ce4,a5)
	ble	@f
	subq.w	#1,($0ce4,a5)
@@:	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(SR_コマンド判定処理一括実行)	;2p側実行
L010f0a:
	addq.w	#8,sp
L010f0c:
	tst.w	($0f1a,a4)					;シューティングモード
	bne	L011110
	tst.w	($0f1a,a5)
	bne	L011110
	tst.w	($0aca,a4)
	beq	L011110
	tst.w	($0aca,a5)
	beq	L011110
	cmpi.w	#$0001,($0ce2,a4)			;1p受け身==1のとき継続(Cmd実行_地上投げ()実行フレーム)
	bne	L010fae
	cmpi.w	#$0001,($0ce2,a5)			;2p受け身==1のとき継続
	bne	L010fae
	cmpi.w	#$0068,($09e2,a4)			;ACT_ピヨピヨ
	bne	@f
	pea.l	($0000)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;1p気絶中は1p受け身成立状態無効化
	addq.w	#8,sp
@@:	cmpi.w	#$0068,($09e2,a5)			;ACT_ピヨピヨ
	bne	@f
	pea.l	($0000)
	move.l	a5,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;2p気絶中は2p受け身成立状態無効化
	addq.w	#8,sp
@@:	clr.w	($0ce2,a5)
	clr.w	($0ce2,a4)
	jsr	(乱数発生)
	cmp.l	#$00003fdd,d0
	bgt	L010f92
	cmpi.w	#$0068,($09e2,a5)			;ACT_ピヨピヨ
	beq	@f
	move.w	#$0100,($0ce2,a5)			;2p受け身成立
@@:	move.l	a5,-(sp)
	move.l	a4,-(sp)
	bra	L010fa4
L010f92:
	cmpi.w	#$0068,($09e2,a4)			;ACT_ピヨピヨ
	beq	@f
	move.w	#$0100,($0ce2,a4)			;1p受け身成立
@@:	move.l	a4,-(sp)
	move.l	a5,-(sp)
L010fa4:
	jsr	(L01118e)
	bra	L0110f4
L010fae:								;1p2pどちらかがCmd実行_地上投げ()の実行フレームではない時に来る
	cmpi.w	#$0001,($0ce2,a4)
	bne	L011024							;1pがCmd実行_地上投げ()の実行フレームのとき続行
	cmpi.w	#$0068,($09e2,a4)
	bne	@f
	pea.l	($0000)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;1pが気絶中のとき1p受け身無効化
	addq.w	#8,sp
@@:	cmpi.w	#$0068,($09e2,a5)
	bne	@f
	pea.l	($0000)
	move.l	a5,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;2pが気絶中のとき2p受け身無効化
	addq.w	#8,sp
@@:	clr.w	($0ce2,a5)
	clr.w	($0ce2,a4)
	cmpi.w	#$0068,($09e2,a5)			;ACT_ピヨピヨ
	beq	@@f
	tst.w	($0a86,a5)					;CPU制御状態
	beq	@f
	movea.l	($12c4,a5),a0				;CPU_実行_受け身
	cmpa.w	#$0000,a0
	beq	@f
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(a0)
	addq.w	#8,sp
@@:	tst.w	($0ce4,a5)
	ble	@f
	move.w	#$0100,($0ce2,a5)
@@:	move.l	a5,-(sp)
	move.l	a4,-(sp)
	jsr	(L01118e)
	bra	L0110f4
L011024:
	cmpi.w	#$0001,($0ce2,a5)
	bne	L011098
	cmpi.w	#$0068,($09e2,a4)
	bne	@f
	pea.l	($0000)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;1p受け身無効化
	addq.w	#8,sp
@@:	cmpi.w	#$0068,($09e2,a5)
	bne	@f
	pea.l	($0000)
	move.l	a5,-(sp)
	jsr	(SYSCALL_0104_CMD実行_受け身)	;2p受け身無効化
	addq.w	#8,sp
@@:	clr.w	($0ce2,a5)
	clr.w	($0ce2,a4)
	cmpi.w	#$0068,($09e2,a4)
	beq	@@f
	tst.w	($0a86,a4)
	beq	@f
	movea.l	($12c4,a4),a0
	cmpa.w	#$0000,a0
	beq	@f
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	jsr	(a0)
	addq.w	#8,sp
@@:	tst.w	($0ce4,a4)
	ble	@f
	move.w	#$0100,($0ce2,a4)
@@:	move.l	a4,-(sp)
	move.l	a5,-(sp)
	jsr	(L01118e)
	bra	L0110f4
L011098:
	cmpi.w	#$0001,($0ef0,a4)
	bne	L0110c4
	cmpi.w	#$0001,($0ef0,a5)
	bne	L0110c4
	clr.w	($0ef0,a5)
	clr.w	($0ef0,a4)
	jsr	(乱数発生)
	cmp.l	#$00003fdd,d0
	bgt	L0110ea
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	bra	L0110ee
L0110c4:
	cmpi.w	#$0001,($0ef0,a4)
	bne	L0110da
	clr.w	($0ef0,a5)
	clr.w	($0ef0,a4)
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	bra	L0110ee
L0110da:
	cmpi.w	#$0001,($0ef0,a5)
	bne	L011110
	clr.w	($0ef0,a5)
	clr.w	($0ef0,a4)
L0110ea:
	move.l	a4,-(sp)
	move.l	a5,-(sp)
L0110ee:
	jsr	(L011206)
L0110f4:
	addq.w	#8,sp
	pea.l	($0000)
	move.l	a4,-(sp)
	lea.l	(SYSCALL_0104_CMD実行_受け身),a3
	jsr	(a3)					;1p受け身無効化
	addq.w	#8,sp
	pea.l	($0000)
	move.l	a5,-(sp)
	jsr	(a3)					;2p受け身無効化
	addq.w	#8,sp
L011110:
	movem.l	(sp)+,a3-a5
	rts

L011116:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a5
	movea.l	($0014,sp),a4
	move.l	a5,-(sp)
	lea.l	(SR_STC_TRG_直接状態更新),a3
	jsr	(a3)
	addq.w	#4,sp
	move.l	a4,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	tst.w	($0ac2,a5)
	bgt	L011188
	tst.w	($0ac2,a4)
	bgt	L011188
	tst.w	($0aca,a5)
	beq	L011188
	tst.w	($0aca,a4)
	beq	L011188
	clr.w	($1324,a5)
	clr.w	($1740,a5)
	pea.l	($0050)					;50=SUB_連続技
	move.l	a5,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	clr.w	($1324,a4)
	clr.w	($1740,a4)
	move.w	($09e2,a4),d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a4,d0.l),a0
	movea.l	($0f24,a0),a0
	cmpa.w	#$0000,a0
	beq	L011188
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L011188:
	movem.l	(sp)+,a3-a5
	rts

L01118e:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a3
	movea.l	($0014,sp),a4
	movea.w	($1736,a3),a0			;実行中の投げACT-ID
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0010_同期完了_攻撃)
	addq.w	#8,sp
	pea.l	($0000)
	movea.w	($1736,a3),a0
	move.l	a0,-(sp)
	move.l	a3,-(sp)
	lea.l	(SYSCALL_0110_Cmd実行_動作),a5
	jsr	(a5)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	movea.w	($1738,a3),a0			;実行中の投げられACT-ID
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	jsr	(a5)
	lea.l	($000c,sp),sp
	movea.w	($000a,a4),a0
	move.l	a0,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017eba)
	addq.w	#4,sp
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	movem.l	(sp)+,a3-a5
	rts

L011206:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a3
	movea.l	($0014,sp),a4
	movea.w	($173a,a3),a0
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0010_同期完了_攻撃)
	addq.w	#8,sp
	pea.l	($0000)
	movea.w	($173a,a3),a0
	move.l	a0,-(sp)
	move.l	a3,-(sp)
	lea.l	(SYSCALL_0110_Cmd実行_動作),a5
	jsr	(a5)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	movea.w	($173c,a3),a0
	move.l	a0,-(sp)
	move.l	a4,-(sp)
	jsr	(a5)
	lea.l	($000c,sp),sp
	movea.w	($000a,a4),a0
	move.l	a0,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017eba)
	addq.w	#4,sp
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	movem.l	(sp)+,a3-a5
	rts

SR_コマンド判定処理一括実行:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a4
	move.l	($0014,sp),d3
	lea.l	($0cd6,a4),a1				;a1=現在のスティックキューポインタ
	subq.l	#2,(a1)						;ポインタを前にずらす
	lea.l	($0eec,a4),a2				;a2=現在のトリガーキューポインタ
	subq.l	#2,(a2)						;ポインタを前にずらす
	movea.l	($0cd6,a4),a0
	tst.w	(a0)
	bge	L0112b2							;スティックキューが先頭だったら続行
	move.l	a4,d1
	add.l	#$00000cd2,d1
	move.l	d1,(a1)						;スティックキューを末尾に移動
	move.l	a4,d1
	add.l	#$00000ee8,d1
	move.l	d1,(a2)						;トリガーキューを末尾に移動
L0112b2:
	movea.l	($0cd6,a4),a0
	lea.l	(L01ff22),a1
	move.l	($0acc,a4),d0				;d0=スティック直接状態
	add.l	d0,d0
	move.w	(a1,d0.l),(a0)
	movea.l	($0eec,a4),a0
	move.w	($0ad4,a4),(a0)
	tst.w	(SFSYSINFO_0070_XXXX)
	beq	L01139a
	tst.w	($0f1a,a4)					;シューティングモードチェック
	bne	L01134e
	pea.l	($00ef)					;ef=VCT_受け身コマンド判定処理
	move.l	a4,-(sp)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00f3)					;f3=VCT_ジャンプコマンド判定処理
	move.l	a4,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	tst.w	($1324,a4)
	bne	L01139a						;思考完了していたら終了
	tst.l	($0cda,a4)
	beq	L011312
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.l	($0cda,a4),a0			;VCT_地上必殺技判定関数を実行
	jsr	(a0)
	addq.w	#8,sp
L011312:
	tst.w	($1324,a4)
	bne	L01139a						;思考完了していたら終了
	tst.w	($09e6,a4)
	beq	L011328						;動作過程値が0だったらスキップ
	cmpi.w	#$004f,($0008,a4)
	bgt	L01133a						;地上にいたらスキップ
L011328:
	tst.l	($0cde,a4)
	beq	L01133a
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.l	($0cde,a4),a0			;VCT_空中必殺技判定関数を実行
	jsr	(a0)
	addq.w	#8,sp
L01133a:
	tst.w	($1324,a4)
	bne	L01139a						;思考完了していたら終了
	pea.l	($00f0)					;f0=VCT_投げ技コマンド判定処理
	move.l	a4,-(sp)
	jsr	(SR_キャラ動作関数実行)
	bra	L01136c
L01134e:							;シューティングモードのときに実行
	pea.l	($00f3)					;f3=VCT_ジャンプコマンド判定処理
	move.l	a4,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	tst.l	($0cda,a4)
	beq	L01136e
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.l	($0cda,a4),a0			;VCT_地上必殺技判定関数を実行
	jsr	(a0)
L01136c:
	addq.w	#8,sp
L01136e:
	tst.w	($1324,a4)
	bne	L01139a						;思考完了していたら終了
	tst.l	($1762,a4)
	beq	L011386
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	movea.l	($1762,a4),a0			;CMD_基本技判定関数を実行
	jsr	(a0)
	addq.w	#8,sp
L011386:
	tst.w	($1324,a4)
	bne	L01139a						;思考完了していたら終了
	pea.l	($00f4)					;f4=VCT_基本技コマンド判定処理
	move.l	a4,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L01139a:
	movem.l	(sp)+,d3/a3-a4
	rts
; システムコール Cmd条件_地上基本技
SYSCALL_00ec_CMD条件_地上基本技:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3			;a3=キャラハンドラ
	move.w	($000e,sp),d1			;d1=cclaフラグ
	move.w	($0012,sp),d0			;d0=ガードキャンセルフラグ
	clr.w	($1740,a3)				;Cmd条件_防御キャンセルの値をクリア
	tst.w	($1324,a3)				;Cpu取得_思考完了()の値取得
	bne	L011410						;完了していたら無効を返して終了
	cmpi.w	#$006f,($0008,a3)		;Y座標とベースライン比較
	ble	L011410						;空中にいたら無効を返して終了
	cmpi.w	#$0064,($09e2,a3)		;動作IDがACT_アイドルか？
	beq	L0113f2						;アイドルだったら有効を返して終了
	cmpi.w	#$0045,($09e2,a3)		;動作IDがACT_防御か？
	bne	L0113f6						;防御じゃなければ分岐
	tst.w	d0						;ガードキャンセルフラグをチェック
	beq	L011410						;ガードキャンセルOFFだったら無効を返して終了
	pea.l	($0013)
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(L01231e)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L011410
	move.w	#$0001,($1740,a3)		;防御キャンセルフラグを有効化
L0113f2:
	moveq.l	#$01,d0					;有効を返して終了
	bra	L011412
L0113f6:
	cmpi.w	#$0004,($09e2,a3)		;動作IDがACT_直立攻撃A～座り攻撃Bの範囲か？
	bgt	L011410						;範囲外のとき無効終了
	tst.w	($1742,a3)				;ccla設定値をチェック
	beq	L011410						;0のとき無効終了
	tst.w	d1						;ccla引数をチェック
	beq	L011410						;0のとき無効終了
	move.w	d1,d0
	and.w	($1742,a3),d0			;ccla設定値と引数の論理積
	bne	L0113f2
L011410:
	moveq.l	#$00,d0					;無効を返して終了
L011412:
	movea.l	(sp)+,a3
	rts

SYSCALL_CMD条件_空中基本技:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3			;a3=キャラハンドラ
	move.w	($0012,sp),d3			;d3=cclaフラグ
	move.w	($0016,sp),d0			;d0=ガードキャンセルフラグ
	clr.w	($1740,a3)				;Cmd条件_防御キャンセルの値をクリア
	tst.w	($1324,a3)				;Cpu思考完了
	bne	L011490						;終了していたら無効を返して終了
	cmpi.w	#$0070,($0008,a3)
	beq	L011490						;キャラがベースライン上にいたら無効を返して終了
	cmpi.w	#$006e,($09e2,a3)		;動作ID取得
	bne	L011466						;ACT_空中防御ではないとき分岐
	tst.w	d0
	beq	L01146e
	pea.l	($0013)
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(L01231e)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01146e
	move.w	#$0001,($1740,a3)		;防御キャンセルを有効化
L011462:
	moveq.l	#$01,d0					;有効を返す
	bra	L011492
L011466:
	cmpi.w	#$0066,($09e2,a3)		;動作ID取得
	bne	L011490						;ACT_ジャンプではないとき分岐
L01146e:
	cmpi.w	#$0064,($09e4,a3)		;複合動作IDがACT_アイドルか？
	beq	L011462						;アイドルなら有効を返して終了
	cmpi.w	#$0008,($09e4,a3)		;複合動作IDが空中基本技ではない時
	bgt	L011490						;無効を返して終了
	tst.w	($1742,a3)				;ccla設定値が0か？
	beq	L011490						;0なら無効を返して終了
	tst.w	d3
	beq	L011490						;cclaフラグチェック
	move.w	d3,d0
	and.w	($1742,a3),d0
	bne	L011462
L011490:
	moveq.l	#$00,d0
L011492:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_00f4_CMD条件_地上必殺技:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	($000e,sp),d1
	move.w	($0012,sp),d0
	clr.w	($1740,a3)
	tst.w	($1324,a3)
	bne	L0114f8
	cmpi.w	#$006f,($0008,a3)		;Y座標がベースラインより上か？
	ble	L0114f8						;無効を返して終了
	cmpi.w	#$0064,($09e2,a3)		;ACT-IDがACT_アイドルか？
	beq	L0114ea						;有効を返して終了
	cmpi.w	#$0045,($09e2,a3)		;ACT_地上防御以外か？
	bne	L0114ee						;分岐
	tst.w	d0						;ガードキャンセルフラグが0か
	beq	L0114f8						;無効を返して終了
	pea.l	($0013)
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(L01231e)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0114f8
	move.w	#$0001,($1740,a3)		;ガードキャンセル有効
L0114ea:
	moveq.l	#$01,d0
	bra	L0114fa
L0114ee:
	tst.w	d1						;キャンセルフラグが0か？
	beq	L0114f8						;無効を返して終了
	tst.w	($01c2,a3)				;リバーサル受付中か？
	bne	L0114ea						;有効を返して終了
L0114f8:
	moveq.l	#$00,d0
L0114fa:
	movea.l	(sp)+,a3
	rts

SYSCALL_00f8_Cmd条件_空中必殺技:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3
	move.w	($0012,sp),d3
	move.w	($0016,sp),d0
	clr.w	($1740,a3)
	tst.w	($1324,a3)
	bne	L011568
	cmpi.w	#$0070,($0008,a3)
	beq	L011568
	cmpi.w	#$006e,($09e2,a3)
	bne	L01154e
	tst.w	d0
	beq	L011556
	pea.l	($0013)
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(L01231e)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L011556
	move.w	#$0001,($1740,a3)
L01154a:
	moveq.l	#$01,d0
	bra	L01156a
L01154e:
	cmpi.w	#$0066,($09e2,a3)
	bne	L011568
L011556:
	cmpi.w	#$0064,($09e4,a3)
	beq	L01154a
	tst.w	d3
	beq	L011568
	tst.w	($01c2,a3)
	bne	L01154a
L011568:
	moveq.l	#$00,d0
L01156a:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_00fc_CMD条件_地上投げ:
	movem.l	d3-d4/a3-a4,-(sp)
	movea.l	($0014,sp),a3			;a3=自分ハンドラ
	movea.l	($0018,sp),a4			;a4=相手ハンドラ
	move.w	($001e,sp),d1			;d1=ccla
	move.w	($0022,sp),d0			;d0=ガードキャンセル
	move.w	($0026,sp),d3			;d3=投げ間合
	clr.w	($1740,a3)				;防御キャンセル許可フラグをクリア
	tst.w	($1324,a3)				;思考完了フラグが立っているか
	bne	L011674						;無効を返して終了
	cmpi.w	#$006f,($0008,a3)		;空中にいるか？
	ble	L011674
	tst.w	($01c0,a4)				;無敵状態
	bne	L011674
	cmpi.w	#$0090,($09e2,a4)		;現在の相手の状態はACT_起き上がりか？
	beq	L011674						;無効を返して終了
	cmpi.w	#$006f,($0008,a4)		;相手は空中にいるか？
	ble	L011674
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00f4_CMD条件_地上必殺技)
	lea.l	($000c,sp),sp
	tst.w	d0						;地上必殺技の条件を満たしていない？
	beq	L011674						;満たしていないとき終了
	movea.l	($132a,a3),a0
	tst.w	($01cc,a0)				;相手が敗北状態か？
	bne	L011674						;敗北状態の時終了
	cmp.w	#$00ff,d3				;投げ間合が255より大きい？
	bgt	L011674						;255より大きいとき終了
	cmpi.w	#$0001,($01b6,a3)		;自分の表示方向がDRCT_右？
	bne	L011606
	move.w	($0a0c,a3),d4			;d4=右向き時存在矩形X1
	move.w	d3,d2
	add.w	($0a0e,a3),d2			;d2=右向き時存在矩形X2＋投げ間合
	move.w	($0a10,a3),d1			;d1=右向き時存在矩形Y1
	move.w	d3,d0
	add.w	($0a12,a3),d0			;d0=右向き時存在矩形Y2＋投げ間合
	bra	L01161a
L011606:							;DRCT_左のときの処理
	move.w	($0a14,a3),d4
	sub.w	d3,d4					;d4=左向き時存在矩形X1-投げ間合
	move.w	($0a16,a3),d2			;d2=左向き時存在矩形X2
	move.w	($0a18,a3),d1			;d1=左向き時存在矩形Y1-投げ間合
	sub.w	d3,d1
	move.w	($0a1a,a3),d0			;d0=左向き時存在矩形Y2
L01161a:
	cmpi.w	#$0001,($01b6,a4)		;相手の表示方向がDRCT_右？
	bne	L01163a
	movea.w	($0a12,a4),a1			;相手の右向き時存在矩形Y2
	move.l	a1,-(sp)
	movea.w	($0a10,a4),a1			;相手の右向き時存在矩形Y1
	move.l	a1,-(sp)
	movea.w	($0a0e,a4),a1			;相手の右向き時存在矩形X2
	move.l	a1,-(sp)
	movea.w	($0a0c,a4),a1			;相手の右向き時存在矩形X1
	bra	L011650
L01163a:							;DRCT_左のときの処理
	movea.w	($0a1a,a4),a1			;相手の左向き時存在矩形Y2
	move.l	a1,-(sp)
	movea.w	($0a18,a4),a1			;相手の左向き時存在矩形Y1
	move.l	a1,-(sp)
	movea.w	($0a16,a4),a1			;相手の左向き時存在矩形X2
	move.l	a1,-(sp)
	movea.w	($0a14,a4),a1			;相手の左向き時存在矩形X1
L011650:
	move.l	a1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)				;自分の存在矩形Y2
	ext.l	d1
	move.l	d1,-(sp)				;自分の存在矩形Y1
	ext.l	d2
	move.l	d2,-(sp)				;自分の存在矩形X2
	ext.l	d4
	move.l	d4,-(sp)				;自分の存在矩形X1
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L011674
	moveq.l	#$01,d0
	bra	L011676
L011674:
	moveq.l	#$00,d0
L011676:
	movem.l	(sp)+,d3-d4/a3-a4
	rts

SYSCALL_0100_Cmd条件_空中投げ:
	movem.l	d3-d4/a3-a5,-(sp)
	movea.l	($0018,sp),a3
	movea.l	($001c,sp),a4
	move.w	($0022,sp),d1
	move.w	($0026,sp),d0
	move.w	($002a,sp),d3
	move.w	($002e,sp),d4
	clr.w	($1740,a3)
	tst.w	($1324,a3)
	bne	L0117a0
	cmpi.w	#$006f,($0008,a3)
	bgt	L0117a0
	tst.w	($01c0,a4)				;無敵状態
	bne	L0117a0
	cmpi.w	#$0090,($09e2,a4)
	beq	L0117a0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00f8_Cmd条件_空中必殺技)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0117a0
	movea.w	($0008,a3),a2
	movea.w	d4,a1
	move.l	a2,d0
	sub.l	a1,d0
	movea.w	($0008,a4),a0
	cmpa.l	d0,a0
	ble	L0117a0
	move.l	a2,d0
	add.l	a1,d0
	cmpa.l	d0,a0
	bge	L0117a0
	movea.l	($132a,a3),a0
	tst.w	($01cc,a0)
	bne	L0117a0
	cmp.w	#$00ff,d3
	bgt	L0117a0
	cmp.w	#$00ff,d4
	bgt	L0117a0
	cmpi.w	#$0001,($01b6,a3)
	bne	L011732
	move.w	($0a0c,a3),d4
	move.w	d3,d2
	add.w	($0a0e,a3),d2
	move.w	($0a10,a3),d1
	move.w	d3,d0
	add.w	($0a12,a3),d0
	bra	L011746
L011732:
	move.w	($0a14,a3),d4
	sub.w	d3,d4
	move.w	($0a16,a3),d2
	move.w	($0a18,a3),d1
	sub.w	d3,d1
	move.w	($0a1a,a3),d0
L011746:
	cmpi.w	#$0001,($01b6,a4)
	bne	L011766
	movea.w	($0a12,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a10,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a0e,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a0c,a4),a5
	bra	L01177c
L011766:
	movea.w	($0a1a,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a18,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a16,a4),a5
	move.l	a5,-(sp)
	movea.w	($0a14,a4),a5
L01177c:
	move.l	a5,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L0117a0
	moveq.l	#$01,d0
	bra	L0117a2
L0117a0:
	moveq.l	#$00,d0
L0117a2:
	movem.l	(sp)+,d3-d4/a3-a5
	rts

SYSCALL_0094_CMD実行_地上基本技:
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0014,sp),a3			;a3=キャラハンドラ
	move.w	($001a,sp),d3			;d3=ACT-ID
	move.l	($132a,a3),d5			;d5=相手ハンドラ
	tst.w	($1324,a3)				;思考完了フラグはONか？
	bne	L011816						;何もせず終了
	move.w	d3,d4
	ext.l	d4
	move.l	d4,d0
	asl.l	#2,d0
	lea.l	(a3,d0.l),a0
	tst.l	($05e0,a0)				;ACT-IDに対応する動作関数は未登録？
	beq	L011816						;何もせず終了
	move.l	d5,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	tst.w	($175a,a3)
	ble	L0117f6
	pea.l	($0000)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	bra	L011804
L0117f6:
	move.w	d3,($09e0,a3)			;行動予約
	move.w	d3,($09e2,a3)			;現在の動作ID
	move.w	#$0001,($09ec,a3)
L011804:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d5,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
L011816:
	movem.l	(sp)+,d3-d5/a3
	rts

SYSCALL_0098_CMD実行_空中基本技:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3
	move.w	($0016,sp),d3
	move.l	($132a,a3),d4
	tst.w	($1324,a3)
	bne	L01187a
	tst.w	($0f1a,a3)
	bne	L01187a
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#2,d0
	lea.l	(a3,d0.l),a0
	tst.l	($05e0,a0)
	beq	L01187a
	tst.w	($175a,a3)
	ble	L011864
	pea.l	($0000)
	move.l	d1,-(sp)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	bra	L011868
L011864:
	move.w	d3,($09e4,a3)
L011868:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
L01187a:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_009c_CMD実行_地上必殺技:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3		;a3=キャラハンドラ
	move.w	($0016,sp),d3		;d3=ACT-ID
	move.l	($132a,a3),d4		;d4=相手ハンドラ
	tst.w	($1324,a3)			;自分の思考が終了している？
	bne	L01191a					;即終了
	move.w	d3,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a3,d0.l),a0
	tst.l	($05e0,a0)			;動作関数が未登録？
	beq	L01191a					;即終了
	moveq.l	#$02,d1
	cmp.l	($0ad0,a3),d1		;トリガ直接状態でBが押された？
	beq	L0118b8
	moveq.l	#$fe,d1
	cmp.l	($0ad0,a3),d1		;トリガ直接状態でBが離された？
	bne	L0118be
L0118b8:
	clr.w	($0a46,a3)			;威力レベル小を設定
	bra	L0118c4
L0118be:
	move.w	#$0001,($0a46,a3)	;威力レベル大を設定
L0118c4:
	move.l	d4,-(sp)			;相手ハンドラ
	move.l	a3,-(sp)			;キャラハンドラ
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	tst.w	($175a,a3)
	ble	L0118ec
	pea.l	($0000)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	bra	L0118fa
L0118ec:
	move.w	d3,($09e0,a3)		;ACT-ID設定
	move.w	d3,($09e2,a3)		;
	move.w	#$0001,($09ec,a3)
L0118fa:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
	pea.l	($0001)				;IVC_無敵
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
L01191a:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_00a0_CMD実行_空中必殺技:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3				;a3=キャラハンドラ
	move.w	($0016,sp),d3				;d3=ACT-ID
	move.l	($132a,a3),d4				;d4=相手ハンドラ
	tst.w	($1324,a3)					;思考完了フラグをチェック
	bne	L01199a							;完了していたら終了
	tst.w	($0f1a,a3)					;シューティングモードフラグをチェック
	bne	L01199a							;シューティングモードのとき終了
	move.w	d3,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a3,d0.l),a0
	tst.l	($05e0,a0)					;対象の動作関数が登録されている？
	beq	L01199a							;未登録なら終了
	moveq.l	#$02,d1
	cmp.l	($0ad0,a3),d1				;TRIG_Bが押された？
	beq	L01195c
	moveq.l	#$fe,d1
	cmp.l	($0ad0,a3),d1				;TRIG_Bが離された？
	bne	L011962
L01195c:
	clr.w	($0a46,a3)					;威力レベルにLEVEL_小を設定
	bra	L011968
L011962:
	move.w	#$0001,($0a46,a3)			;威力レベルにLEVEL_大を設定
L011968:
	tst.w	($175a,a3)
	ble	L011984
	pea.l	($0000)
	movea.w	d3,a1
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	jsr	(L00de22)
	lea.l	($000c,sp),sp
	bra	L011988
L011984:
	move.w	d3,($09e4,a3)				;複合動作ID設定
L011988:
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CPU思考_超技)
	lea.l	($000c,sp),sp
L01199a:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_CMD実行_地上投げ:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a1				;a1=キャラハンドラ
	move.w	($000e,sp),d1
	move.w	($0012,sp),d2
	move.w	($0016,sp),d3
	movea.l	($132a,a1),a2				;a2=相手ハンドラ
	tst.w	($1324,a1)					;思考完了フラグチェック
	bne	L0119fa
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	tst.l	($05e0,a0)					;投げ動作関数登録チェック
	beq	L0119fa
	move.w	d2,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a2,d0.l),a0
	tst.l	($05e0,a0)					;投げられ動作関数登録チェック
	beq	L0119fa
	tst.w	($01cc,a2)					;相手の敗北状態チェック
	bne	L0119fa
	move.w	#$0001,($0ce2,a1)			;受け身受付フラグを立てる
	move.w	d3,($0a46,a1)				;威力レベルに投げ方向を設定
	move.w	d1,($1736,a1)
	move.w	d2,($1738,a1)
	move.w	#$0001,($1324,a1)			;思考完了フラグを立てる
L0119fa:
	move.l	(sp)+,d3
	rts

SYSCALL_00e8_CMD実行_空中投げ:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a1
	move.w	($000e,sp),d1
	move.w	($0012,sp),d2
	move.w	($0016,sp),d3
	movea.l	($132a,a1),a2
	tst.w	($1324,a1)
	bne	L011a58
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	tst.l	($05e0,a0)
	beq	L011a58
	move.w	d2,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a2,d0.l),a0
	tst.l	($05e0,a0)
	beq	L011a58
	tst.w	($01cc,a2)
	bne	L011a58
	move.w	#$0001,($0ef0,a1)
	move.w	d3,($0a46,a1)
	move.w	d1,($173a,a1)
	move.w	d2,($173c,a1)
	move.w	#$0001,($1324,a1)
L011a58:
	move.l	(sp)+,d3
	rts

SYSCALL_0104_CMD実行_受け身:
	movea.l	($0004,sp),a0
	tst.w	($000a,sp)
	beq	L011a6e
	move.w	#$0010,($0ce4,a0)
	bra	L011a72
L011a6e:
	clr.w	($0ce4,a0)
L011a72:
	rts

SYSCALL_0080_Cmd実行_ジャンプ:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3
	move.w	($0012,sp),d3
	move.l	($132a,a3),d0
	tst.w	($1324,a3)
	bne	L011aea
	tst.w	($0f1a,a3)
	bne	L011aea
	tst.l	($077c,a3)
	beq	L011aea
	cmpi.w	#$0066,($09e2,a3)
	beq	L011aea
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	pea.l	($0000)
	pea.l	($0066)				;ACT_ジャンプ(102)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	clr.w	($09e6,a3)
	move.w	d3,($01ba,a3)
	cmp.w	#$0001,d3
	bne	L011ad4
	move.w	($01b6,a3),($09e8,a3)
	bra	L011aea
L011ad4:
	cmp.w	#$ffff,d3
	bne	L011ae6
	move.w	($01b6,a3),d1
	neg.w	d1
	move.w	d1,($09e8,a3)
	bra	L011aea
L011ae6:
	clr.w	($09e8,a3)
L011aea:
	movem.l	(sp)+,d3/a3
	rts

SR_STC_TRG_直接状態更新:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3				;a3=キャラハンドラ
	movea.w	($000a,a3),a0				;a0=プレイヤー番号
	pea.l	(-$0001,a0)
	jsr	(iocscall_joyget)						;JOYGET
	addq.w	#4,sp
	not.b	d0
	moveq.l	#$00,d2
	move.l	d2,($0acc,a3)				;Stc状態をクリア
	btst.l	#$00,d0						;上方向チェック
	beq	L011b2c							;押されていなかったら分岐
	btst.l	#$02,d0						;左方向チェック
	beq	L011b1e							;押されていなかったら分岐
	moveq.l	#$07,d2						;d2=左上が押されていたので7
	bra	L011b5c
L011b1e:
	btst.l	#$03,d0						;右方向チェック
	beq	L011b28							;押されていなかったら分岐
	moveq.l	#$09,d2						;d2=右上が押されていたので9
	bra	L011b5c
L011b28:
	moveq.l	#$08,d2						;d2=上が押されていたので8
	bra	L011b5c
L011b2c:
	btst.l	#$01,d0						;下方向チェック
	beq	L011b4a							;押されていなかったら分岐
	btst.l	#$02,d0						;左方向チェック
	beq	L011b3c
	moveq.l	#$01,d2						;d2=左下が押されていたので1
	bra	L011b5c
L011b3c:
	btst.l	#$03,d0						;右方向チェック
	beq	L011b46
	moveq.l	#$03,d2						;d2=右下が押されていたので3
	bra	L011b5c
L011b46:
	moveq.l	#$02,d2						;d2=下が押されていたので2
	bra	L011b5c
L011b4a:
	btst.l	#$02,d0						;左方向チェック
	beq	L011b54
	moveq.l	#$04,d2						;d2=左が押されていたので4
	bra	L011b5c
L011b54:
	btst.l	#$03,d0						;右方向チェック
	beq	L011b60
	moveq.l	#$06,d2						;d2=右が押されていたので6
L011b5c:
	move.l	d2,($0acc,a3)				;現フレームの値をワークエリアに書き込み
L011b60:
	btst.l	#$05,d0						;ボタン2チェック
	beq	L011b6a							;押されていなかったら分岐
	moveq.l	#$01,d1						;d1=ボタン2が押されていたので1
	bra	L011b6c
L011b6a:
	moveq.l	#$00,d1						;d1=ボタン2が押されていなかったので0
L011b6c:
	btst.l	#$06,d0						;ボタン1チェック
	beq	L011b74
	addq.l	#2,d1						;d1=ボタン1が押されていたので+2
L011b74:
	movea.w	($0ad4,a3),a0				;a0=ワークエリア(トリガー直接状態1)の値を取得
	cmpa.l	d1,a0						;前フレームの値と比較
	bne	L011b84
	moveq.l	#$00,d2						;d2=一致したら0
	move.l	d2,($0ad0,a3)				;ワークエリア(トリガー直接状態)の値を更新
	bra	L011bd6
L011b84:
	tst.l	d1							;現フレームでボタン入力がある？
	bne	L011b96							;あったら分岐
	move.w	($0ad4,a3),d0
	ext.l	d0
	neg.l	d0							;d0=前フレームのトリガー直接状態1の値を符号反転
	move.l	d0,($0ad0,a3)				;ワークエリア(トリガー直接状態)を更新
	bra	L011bd6
L011b96:
	moveq.l	#$01,d2
	cmp.l	d1,d2						;現フレームでボタン2のみ押されている？
	bne	L011bb4							;押されていなければ分岐
	cmpi.w	#$0003,($0ad4,a3)			;前フレームで両ボタンが押されている？
	bne	L011bac							;押されていなければ分岐
	moveq.l	#$fe,d2						;d2=-2(現フレームでボタン1が離された)
	move.l	d2,($0ad0,a3)				;ワークエリア(トリガー直接状態)を更新
	bra	L011bd6
L011bac:
	moveq.l	#$01,d2						;d2=1(現フレームでボタン2が押された)
	move.l	d2,($0ad0,a3)				;ワークエリア(トリガー直接状態)を更新
	bra	L011bd6
L011bb4:
	moveq.l	#$02,d2
	cmp.l	d1,d2						;現フレームでボタン1のみ押されている？
	bne	L011bd2							;押されていなければ分岐
	cmpi.w	#$0003,($0ad4,a3)			;前フレームで両ボタンが押されている？
	bne	L011bca							;押されていなければ分岐
	moveq.l	#$ff,d2						;d2=-1(現フレームでボタン2が離された)
	move.l	d2,($0ad0,a3)				;ワークエリア(トリガー直接状態)を更新
	bra	L011bd6
L011bca:
	moveq.l	#$02,d2						;d2=2(現フレームでボタン1が押された)
	move.l	d2,($0ad0,a3)
	bra	L011bd6
L011bd2:
	move.l	d1,($0ad0,a3)				;現フレームで両ボタンが押されていた
L011bd6:
	move.w	d1,($0ad4,a3)
	movea.l	(sp)+,a3
	rts

SYSCALL_0008_CPU関数実行:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a4
	move.w	($001a,sp),d3
	movea.w	d3,a0
	move.l	a0,d0
	subq.l	#1,d0
	moveq.l	#$65,d1
	cmp.l	d1,d0
	bhi	L011e1c
	add.l	d0,d0
	move.w	(L011c02,pc,d0.l),d1
	jmp	(L011c02,pc,d1.w)

L011c02:
	.dc.w	L011cce-L011c02
	.dc.w	L011d12-L011c02
	.dc.w	L011d26-L011c02
	.dc.w	L011d3a-L011c02
	.dc.w	L011dc2-L011c02
	.dc.w	L011de6-L011c02
	.dc.w	L011dc2-L011c02
	.dc.w	L011de6-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011d4e-L011c02
	.dc.w	L011d62-L011c02
	.dc.w	L011d76-L011c02
	.dc.w	L011e0a-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011d8a-L011c02
	.dc.w	L011d9e-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011e1c-L011c02
	.dc.w	L011db0-L011c02
L011cce:
	jsr	(SYSCALL_0148_場面取得_エンディング)
	tst.w	d0
	bne	L011cfe
	jsr	(乱数発生)
	movea.l	($0a82,a4),a0
	movea.w	($002c,a0),a0
	cmpa.l	d0,a0
	ble	L011cfe
	pea.l	($00dc)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011cfe:
	pea.l	($00da)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d12:
	pea.l	($00db)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d26:
	pea.l	($00dc)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d3a:
	pea.l	($00dd)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d4e:
	pea.l	($00e2)					;CPU_実行_必殺技Ｓ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d62:
	pea.l	($00e3)					;CPU_実行_必殺技Ａ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d76:
	pea.l	($00e4)					;CPU_実行_必殺技Ｍ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d8a:
	pea.l	($00e6)					;CPU_実行_地上投げ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011d9e:
	pea.l	($00e7)					;CPU_実行_空中投げ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011db0:
	pea.l	($00e9)					;CPU_実行_ジャンプ
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011dc2:
	pea.l	($00e0)					;CPU_実行_前後Ｊ技A
	pea.l	($0005)					;SUB_前後Ｊ技A
	move.l	a4,-(sp)
	lea.l	(SYSCALL_0130_Cmd実行_CPU動作),a3
	jsr	(a3)
	lea.l	($000c,sp),sp			;CPU_実行_垂直Ｊ技A
	pea.l	($00de)					;SUB_垂直Ｊ技A
	pea.l	($0007)
	move.l	a4,-(sp)
	jsr	(a3)
	bra	L011e2c
L011de6:
	pea.l	($00e1)					;CPU_実行_前後Ｊ技B
	pea.l	($0006)					;SUB_前後Ｊ技B
	move.l	a4,-(sp)
	lea.l	(SYSCALL_0130_Cmd実行_CPU動作),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($00df)					;CPU_実行_垂直Ｊ技B
	pea.l	($0008)					;SUB_垂直Ｊ技B
	move.l	a4,-(sp)
	jsr	(a3)
	bra	L011e2c
L011e0a:
	pea.l	($00e5)					;CPU_実行_空中必殺
	pea.l	($000d)					;SUB_空中必殺
	move.l	a4,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
	bra	L011e2c
L011e1c:
	pea.l	($0000)
	ext.l	d3
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
L011e2c:
	lea.l	($000c,sp),sp
	movem.l	(sp)+,d3/a3-a4
	rts

SYSCALL_0130_Cmd実行_CPU動作:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	move.w	($000e,sp),d1
	move.l	($132a,a1),d2
	tst.w	($1324,a1)				;思考完了フラグチェック
	bne	L011e76
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	tst.l	($05e0,a0)				;動作関数登録チェック
	beq	L011e76
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	movea.l	($0f24,a0),a0			;CPU関数登録チェック
	cmpa.w	#$0000,a0
	beq	L011e76
	move.l	d2,-(sp)
	move.l	a1,-(sp)
	jsr	(a0)						;CPU関数実行
	addq.w	#8,sp
L011e76:
	rts

SYSCALL_0168_Cmd実行_CPU動作2:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	move.l	($132a,a0),d1
	cmp.w	#$0044,d0
	bne	L011e9a
	pea.l	($0001)
	move.l	d1,-(sp)
	move.l	a0,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	bra	L011ee8
L011e9a:
	tst.w	($1324,a0)				;思考完了フラグチェック
	bne	L011eec
	cmp.w	#$004a,d0
	bne	L011eb6
	move.w	#$0001,($01ba,a0)		;ジャンプ方向をDRCT_前に設定
	pea.l	($00e9)					;CPU_実行_ジャンプ
	pea.l	($0066)					;ACT_ジャンプ
	bra	L011ee0
L011eb6:
	cmp.w	#$0041,d0
	beq	L011ec4
	cmp.w	#$004d,d0
	beq	L011ece
	bra	L011ed8
L011ec4:
	pea.l	($00e3)					;CPU_実行_必殺技Ａ
	pea.l	($000b)					;ACT_必殺技Ａ
	bra	L011ee0
L011ece:
	pea.l	($00e4)					;CPU_実行_必殺技Ｍ
	pea.l	($000c)					;ACT_必殺技Ｍ
	bra	L011ee0
L011ed8:
	pea.l	($00e2)					;CPU_実行_必殺技Ｓ
	pea.l	($000a)					;ACT_必殺技Ｓ
L011ee0:
	move.l	a0,-(sp)
	jsr	(SYSCALL_0130_Cmd実行_CPU動作)
L011ee8:
	lea.l	($000c,sp),sp
L011eec:
	rts

SR_CPU超技実行判定:
	link	a6,#$0000
	movem.l	d3/a3,-(sp)
	movea.l	($0008,a6),a3
	move.w	($0012,a6),d3
	move.l	a3,-(sp)
	jsr	(SR_キャラ超技関連フラグクリア)
	addq.w	#4,sp
	tst.w	($0aa4,a3)				;超技ゲージが0以下の時即終了
	ble	L011f32
	jsr	(SYSCALL_0148_場面取得_エンディング)
	tst.w	d0
	bne	L011f32
	movea.l	($1284,a3),a0			;CPU_超技設定
	cmpa.w	#$0000,a0
	beq	L011f32
	ext.l	d3
	move.l	d3,-(sp)
	move.l	($000c,a6),-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	lea.l	($000c,sp),sp
L011f32:
	movem.l	(-$0008,a6),d3/a3
	unlk	a6
	rts

L011f3c:
	movea.l	($0004,sp),a1
	move.l	($0008,sp),d1
	move.w	($000e,sp),d0
	movea.l	($1280,a1),a0
	cmpa.w	#$0000,a0
	beq	L011f60
	ext.l	d0
	move.l	d0,-(sp)
	move.l	d1,-(sp)
	move.l	a1,-(sp)
	jsr	(a0)
	lea.l	($000c,sp),sp
L011f60:
	rts

L011f62:
	movea.l	($0004,sp),a0
	cmpi.w	#$006d,($175a,a0)
	ble	L011f88
	cmpi.w	#$0001,($000a,a0)
	bne	L011f80
	move.l	#L06f4a2,($0a82,a0)
	bra	L011f88
L011f80:
	move.l	#L06f460,($0a82,a0)
L011f88:
	rts

SR_動作関数クリア:
	movem.l	d3-d4/a3-a4,-(sp)
	move.l	($0014,sp),d4			;d4=キャラハンドラ
	move.w	#$00ff,d3
	lea.l	(SYSCALL_0144_MMP登録_動作関数),a4
L011f9c:
	pea.l	($0000)
	movea.w	d3,a3
	move.l	a3,-(sp)
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	move.l	a3,-(sp)
	pea.l	($0005)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	move.l	a3,-(sp)
	pea.l	($0006)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
	subq.w	#1,d3
	bpl	L011f9c
	movem.l	(sp)+,d3-d4/a3-a4
	rts

L011fde:
	move.w	#$00ff,d1
	lea.l	(MMP_SYS_ジャンプテーブル),a0
L011fe8:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	moveq.l	#$00,d2
	move.l	d2,(a0,d0.l)
	subq.w	#1,d1
	cmp.w	#$0095,d1
	bgt	L011fe8
	rts

SR_ユーザ定義くらい動作関数クリア:
	movem.l	d3-d4/a3-a4,-(sp)
	move.l	($0014,sp),d4
	moveq.l	#$52,d3
	lea.l	(SYSCALL_0144_MMP登録_動作関数),a4
L01200e:
	pea.l	($0000)
	movea.w	d3,a3
	move.l	a3,-(sp)
	pea.l	($0001)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	move.l	a3,-(sp)
	pea.l	($0006)
	move.l	d4,-(sp)
	jsr	(a4)
	lea.l	($0010,sp),sp
	addq.w	#1,d3
	cmp.w	#$0063,d3
	ble	L01200e
	movem.l	(sp)+,d3-d4/a3-a4
	rts

L012042:
	movem.l	d3-d6/a3-a4,-(sp)
	movea.l	($001c,sp),a4			;a4 = p1
	pea.l	($0002)
	move.l	a4,-(sp)
	lea.l	(L012232),a3
	jsr	(a3)						;L012232(p1, 2);
	addq.w	#8,sp
	pea.l	($0004)
	move.l	a4,-(sp)
	jsr	(a3)						;L012232(p1, 4);
	addq.w	#8,sp
	move.w	#$00ff,d1
	move.l	#L06bc02,d5
	move.l	#L06b402,d4
	move.l	#MMP_SYS_0256_xxxx,d3
	move.l	#INIメッセージ_ジャンプテーブル,d2
L012080:
	move.w	($000a,a4),d0			;プレイヤー番号
	ext.l	d0
	moveq.l	#$0a,d6
	asl.l	d6,d0					;d0=プレイヤー番号の1024倍
	movea.w	d1,a0
	move.l	a0,d6
	asl.l	#2,d6
	movea.l	d6,a0					;a0=ループカウンタの値の4倍
	movea.l	d0,a2
	adda.l	d5,a2					;a2=L06bc02[プレイヤー番号*1024]	1pのときのコピー先 L06bc02-L06bffe/ p2 L06bc402 ～ L06bc7fe
	lea.l	(a4,a0.l),a1			;a1=p1[ループカウンタ*4]
	move.l	($05e0,a1),(a0,a2.l)	;動作関数のアドレスをコピー
	move.w	($000a,a4),d0
	ext.l	d0
	moveq.l	#$0a,d6
	asl.l	d6,d0					;d0=プレイヤー番号の1024倍
	movea.l	d0,a2
	adda.l	d4,a2					;a2=L06b402[プレイヤー番号*1024]	1p=L06b402-L06b7fe / p2=L06b802-L06bbfe
	move.l	($0f24,a1),(a0,a2.l)	;CPU関数のアドレスをコピー
	move.w	($000a,a4),d0
	ext.l	d0
	asl.l	d6,d0					;d0=プレイヤー番号の1024倍
	movea.l	d0,a1
	adda.l	d3,a1					;a1: 1p=MMP_SYS_0256_xxxx-L06affe / p2=L06b002-L06b3fe
	movea.l	d0,a2
	adda.l	d2,a2					;a2=INIメッセージ_ジャンプテーブル[プレイヤー番号*1024]
	move.l	(a0,a2.l),(a0,a1.l)
	subq.w	#1,d1
	bpl	L012080
	movem.l	(sp)+,d3-d6/a3-a4
	rts

L0120d4:
	move.l	a3,-(sp)
	pea.l	($0032)
	lea.l	(L012264),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0033)
	jsr	(a3)
	addq.w	#4,sp
	move.w	#$00ff,d1
	lea.l	(MMP_SYS_0256_xxxx),a1
	lea.l	(MMP_SYS_ジャンプテーブル),a0
L0120fc:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	move.l	(a0,d0.l),(a1,d0.l)
	subq.w	#1,d1
	bpl	L0120fc
	movea.l	(sp)+,a3
	rts

L012110:
	movem.l	d3/a3,-(sp)
	move.l	($000c,sp),d3
	pea.l	($0004)
	move.l	d3,-(sp)
	jsr	(L012232)
	addq.w	#8,sp
	pea.l	(SR_デフォルト動作_ACT_アイドル)
	pea.l	($0064)				;ACT_アイドル
	pea.l	($0001)
	move.l	d3,-(sp)
	lea.l	(SYSCALL_0144_MMP登録_動作関数),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(SR_デフォルト動作_ACT_ジャンプ)
	pea.l	($0066)				;ACT_ジャンプ
	pea.l	($0001)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(SR_デフォルト動作_ACT_はねかえり)
	pea.l	($002e)				;ACT_はねかえり
	pea.l	($0001)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(L0126fc)
	pea.l	($0068)				;ACT_ピヨピヨ
	pea.l	($0001)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(L0129f8)
	pea.l	($006e)				;ACT_空中防御
	pea.l	($0001)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(L012b4e)
	pea.l	($0065)				;ACT_待機
	pea.l	($0001)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(L012b50)
	pea.l	($0065)				;SUB_待機
	pea.l	($0002)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	pea.l	(L012b8a)
	pea.l	($0064)
	pea.l	($0005)
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	movem.l	(sp)+,d3/a3
	rts

L0121e2:
	moveq.l	#$63,d1					;99
	lea.l	(MMP_SYS_ジャンプテーブル),a1
	lea.l	(MMP_SYS_0256_xxxx),a0
L0121f0:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	move.l	(a0,d0.l),(a1,d0.l)
	subq.w	#1,d1
	cmp.w	#$003b,d1				;59
	bgt	L0121f0
	rts

SR_キャラ動作関数実行:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	ext.l	d0
	asl.l	#2,d0
	lea.l	(a1,d0.l),a0
	move.l	($05e0,a0),(L06f432)
	beq	L012230
	move.l	($132a,a1),-(sp)
	move.l	a1,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	addq.w	#8,sp
L012230:
	rts

L012232:
	movea.l	($0004,sp),a2
	movea.w	($000a,sp),a0
	lea.l	(L06a7fe),a1
	adda.w	($000a,a2),a0
	move.l	a0,d0
	asl.l	#2,d0
	move.l	(a1,d0.l),(L06f432)
	beq	L012262
	move.l	($132a,a2),-(sp)
	move.l	a2,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	addq.w	#8,sp
L012262:
	rts

L012264:
	move.w	($0006,sp),d0
	ext.l	d0
	lea.l	(MMP_SYS_ジャンプテーブル),a0
	asl.l	#2,d0
	move.l	(a0,d0.l),(L06f432)
	beq	L012284
	movea.l	(L06f432),a0
	jsr	(a0)
L012284:
	rts

SYSCALL_0144_MMP登録_動作関数:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a0			;a0=キャラハンドラ
	move.w	($000e,sp),d0			;d0=メッセージタイプ
	move.w	($0012,sp),d1			;d1=メッセージID
	move.l	($0014,sp),d2			;d2=動作関数アドレス
	cmp.w	#$0001,d0				;MMP_TYPE_ACT
	beq	L0122b0
	cmp.w	#$0002,d0				;MMP_TYPE_SUB
	beq	L0122b0
	cmp.w	#$0003,d0				;MMP_TYPE_OPT
	beq	L0122b0
	cmp.w	#$0004,d0				;MMP_TYPE_VCT
	bne	L0122be
L0122b0:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	adda.l	d0,a0
	move.l	d2,($05e0,a0)
	bra	L01231a
L0122be:
	cmp.w	#$0005,d0				;MMP_TYPE_CPU
	bne	L0122d2
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	adda.l	d0,a0
	move.l	d2,($0f24,a0)
	bra	L01231a
L0122d2:
	cmp.w	#$0064,d0				;MMP_TYPE_SYS
	bne	L0122fa
	cmpa.w	#$0000,a0
	beq	L0122e8
	move.w	d1,d0
	subq.w	#1,d0
	move.w	d0,d1
	add.w	($000a,a0),d1
L0122e8:
	move.w	d1,d0
	ext.l	d0
	lea.l	(MMP_SYS_ジャンプテーブル),a0
	asl.l	#2,d0
	move.l	d2,(a0,d0.l)
	bra	L01231a
L0122fa:
	cmp.w	#$0006,d0				;MMP_TYPE_INI
	bne	L01231a
	move.w	($000a,a0),d0			;プレイヤー番号
	ext.l	d0
	moveq.l	#$0a,d3
	asl.l	d3,d0
	ext.l	d1
	asl.l	#2,d1
	movea.l	d0,a0
	adda.l	#INIメッセージ_ジャンプテーブル,a0
	move.l	d2,(a0,d1.l)
L01231a:
	move.l	(sp)+,d3
	rts

L01231e:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a0			;a0=キャラハンドラ
	move.w	($000e,sp),d0
	move.w	($0012,sp),d1			;d1=動作ID？
	move.w	($000a,a0),d2			;d0=プレイヤー番号
	subq.w	#1,d2
	cmp.w	#$0001,d0				;引数2が1～4？
	beq	L01234a
	cmp.w	#$0002,d0
	beq	L01234a
	cmp.w	#$0003,d0
	beq	L01234a
	cmp.w	#$0004,d0
	bne	L012368
L01234a:
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	adda.l	d0,a0					;a0=キャラハンドラ+動作ID*4
	move.w	d2,d1
	ext.l	d1
	moveq.l	#$0a,d3
	asl.l	d3,d1					;d1=(プレイヤー番号-1)*1024
	lea.l	(L06c002),a1
	adda.l	d1,a1					;a1=L06c002+(プレイヤー番号-1)*1024
	move.l	($05e0,a0),d3			;d3=MMP動作関数テーブルに格納されている引数3(ACT-ID)に対応するアドレス
	bra	L01238a
L012368:
	cmp.w	#$0005,d0
	bne	L012394
	move.w	d1,d0
	ext.l	d0
	asl.l	#2,d0
	adda.l	d0,a0
	move.w	d2,d1
	ext.l	d1
	moveq.l	#$0a,d3
	asl.l	d3,d1
	lea.l	(L06b802),a1
	adda.l	d1,a1					;a1=L06b802+(プレイヤー番号-1)*1024
	move.l	($0f24,a0),d3			;d3=CPU関数テーブルに格納されている引数3(ACT-ID)に対応するアドレス
L01238a:
	cmp.l	(a1,d0.l),d3
	bne	L0123c6
L012390:
	moveq.l	#$00,d0
	bra	L0123c8
L012394:
	cmp.w	#$0064,d0
	beq	L0123c6
	cmp.w	#$0006,d0
	bne	L012390
	move.w	d2,d0
	ext.l	d0
	moveq.l	#$0a,d3
	asl.l	d3,d0
	ext.l	d1
	asl.l	#2,d1
	lea.l	(L06a002),a0
	adda.l	d0,a0
	lea.l	(L06b002),a1
	adda.l	d0,a1
	move.l	(a0,d1.l),d3
	cmp.l	(a1,d1.l),d3
	beq	L012390
L0123c6:
	moveq.l	#$01,d0
L0123c8:
	move.l	(sp)+,d3
	rts

SR_デフォルト動作_ACT_アイドル:
	movem.l	a3-a4,-(sp)
	movea.l	($000c,sp),a3
	movea.l	($0010,sp),a4
	pea.l	($0000)				;IVC_通常
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	tst.w	($0aca,a3)
	bne	L0123f2
	moveq.l	#$00,d0
	move.l	d0,($0acc,a3)
L0123f2:
	move.w	($1760,a3),d0
	cmp.w	($01b6,a3),d0
	beq	L012408
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(L012b52)
	addq.w	#8,sp
L012408:
	tst.w	($01be,a3)
	beq	L012442
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012424
	pea.l	($00f2)					;f2=VCT_防御コマンド判定処理
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012424:
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012430
	clr.w	($09f0,a3)
L012430:
	tst.w	($09f0,a3)
	ble	L012442
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0114_同期進行_防御)
	addq.w	#8,sp
L012442:
	move.w	($01b8,a4),d0
	cmp.w	($01b6,a3),d0
	bne	L01245e
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
L01245e:
	tst.w	($09f0,a3)
	ble	L01246a
	subq.w	#1,($09f0,a3)
	bra	L012498
L01246a:
	cmpi.w	#$0070,($0008,a3)
	bne	L01248a
	tst.w	($01cc,a3)
	bne	L01248a
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_状態設定_相対方向)
	addq.w	#8,sp
	move.w	($01b8,a3),($1760,a3)
L01248a:
	pea.l	($00f1)					;f1=VCT_歩行コマンド判定処理
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012498:
	movem.l	(sp)+,a3-a4
	rts

SR_デフォルト動作_ACT_ジャンプ:
	link	a6,#$0000
	move.l	a3,-(sp)
	movea.l	($0008,a6),a3
	cmpi.w	#$0070,($0008,a3)
	bne	L0124be
	pea.l	($0000)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0074_演出表示_砂煙)
	addq.w	#8,sp
L0124be:
	move.w	#$0001,($01bc,a3)
	cmpi.w	#$0001,($09e6,a3)
	bgt	L01250c
	move.w	($09e4,a3),d0
	ble	L0124f6
	cmp.w	#$0027,d0
	bgt	L0124f6
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(SYSCALL_018c_状態設定_セル前面表示)
	addq.w	#8,sp
	movea.w	($09e4,a3),a0
	move.l	a0,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	bra	L01250a
L0124f6:
	cmpi.w	#$0001,($09e6,a3)
	bne	L01250c
	pea.l	($0001)
	move.l	a3,-(sp)
	jsr	(SYSCALL_018c_状態設定_セル前面表示)
L01250a:
	addq.w	#8,sp
L01250c:
	pea.l	($0067)					;67=SUB_ＪＵＭＰ
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	cmpi.w	#$0065,($09e4,a3)
	bne	L01252c
	move.l	a3,-(sp)
	jsr	(SR_ヒット情報クリア)
	addq.w	#4,sp
L01252c:
	cmpi.w	#$0001,($09e6,a3)
	ble	L012548
	pea.l	($0000)
	move.l	($000c,a6),-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
L012548:
	tst.w	($01be,a3)
	beq	L012570
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012564
	pea.l	($00f2)					;f2=VCT_防御コマンド判定処理
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012564:
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012570
	clr.w	($09f0,a3)
L012570:
	movea.l	(-$0004,a6),a3
	unlk	a6
	rts

SR_デフォルト動作_ACT_はねかえり:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a3
	movea.l	($0014,sp),a4
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	move.w	($09e6,a3),d0
	cmp.w	#$0001,d0
	beq	L0125f6
	bgt	L0125a6
	tst.w	d0
	beq	L0125b2
	bra	L01266e
L0125a6:
	cmp.w	#$0002,d0
	beq	L01265c
	bra	L01266e
L0125b2:
	pea.l	(-$0008)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00b0_座標設定_Ｙ移動)
	addq.w	#8,sp
	move.w	#$0010,($09ee,a3)
	pea.l	($0027)				;CELL_転倒
	move.l	a3,-(sp)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
	addq.w	#1,($0a96,a4)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0030_コンボ設定_決定)
	addq.w	#4,sp
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_0034_同期開始_先制攻撃判定)
	addq.w	#8,sp
	addq.w	#1,($09e6,a3)
	bra	L0126f6
L0125f6:
	subq.w	#1,($09ee,a3)
	move.w	($09ee,a3),d3
	movea.w	($09e8,a3),a0
	move.l	a0,-(sp)
	pea.l	(-$0001)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0018_座標設定_Ｘ移動)
	lea.l	($0010,sp),sp
	cmp.w	#$000c,d3
	ble	L012622
	subq.w	#3,($0008,a3)
	bra	L01264a
L012622:
	cmp.w	#$0007,d3
	ble	L01262e
	subq.w	#2,($0008,a3)
	bra	L01264a
L01262e:
	cmp.w	#$0004,d3
	ble	L01263a
	subq.w	#1,($0008,a3)
	bra	L01264a
L01263a:
	cmp.w	#$0001,d3
	bgt	L01264a
	move.w	#$0001,($09ee,a3)
	addq.w	#1,($09e6,a3)
L01264a:
	pea.l	($0027)			;CELL_転倒
	move.l	a3,-(sp)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
	bra	L0126f6
L01265c:
	pea.l	($0033)				;33=SUB_不時着
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	bra	L0126f6
L01266e:
	pea.l	($0001)				;IVC_無敵
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	pea.l	($0000)
	movea.w	($000a,a3),a0
	move.l	a0,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	pea.l	($003b)				;CELL_着地
	move.l	a3,-(sp)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	clr.w	($09ee,a3)
	clr.w	($0f06,a3)
	clr.w	($09e6,a3)
	move.w	#$0070,($0008,a3)
	pea.l	($0001)
	pea.l	($0002)
	pea.l	($0004)
	jsr	(SYSCALL_00cc_演出設定_地面振動)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
L0126f6:
	movem.l	(sp)+,d3/a3-a4
	rts

L0126fc:
	link	a6,#-$000a
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a5
	tst.w	($09e6,a5)				;動作過程値が0以下の時スキップ
	ble	L0128c0
	cmpi.w	#$0001,($000a,a5)		;プレイヤー番号
	bne	@f
	move.w	(L02025e),d6
	move.w	(L020260),d4
	move.w	(L020262),d5
	bra	@@f
@@:	move.w	(L020264),d6
	move.w	(L020266),d4
	move.w	(L020268),d5
@@:	move.w	d6,d0
	ext.l	d0
	lea.l	(L01ff36),a1
	add.l	d0,d0
	move.w	(a1,d0.l),d1
	lea.l	(L01ff98),a0
	movea.w	(a0,d0.l),a3
	move.w	d4,d0
	ext.l	d0
	add.l	d0,d0
	move.w	(a1,d0.l),(-$0002,a6)
	move.w	(a0,d0.l),(-$0004,a6)
	move.w	d5,d0
	ext.l	d0
	add.l	d0,d0
	move.w	(a1,d0.l),(-$0006,a6)
	move.w	(a0,d0.l),(-$0008,a6)
	cmp.w	#$03e8,d1
	bne	L012788
	move.w	(a1),d1
	movea.w	(a0),a3
	moveq.l	#$ff,d6
L012788:
	cmpi.w	#$03e8,(-$0002,a6)
	bne	L0127a2
	move.w	(L01ff36),(-$0002,a6)
	move.w	(L01ff98),(-$0004,a6)
	moveq.l	#$ff,d4
L0127a2:
	cmpi.w	#$03e8,(-$0006,a6)
	bne	L0127bc
	move.w	(L01ff36),(-$0006,a6)
	move.w	(L01ff98),(-$0008,a6)
	moveq.l	#$ff,d5
L0127bc:
	move.w	#$0bef,d2
	move.w	#$0cef,d7
	move.w	#$0def,(-$000a,a6)
	cmp.w	#$0017,d6
	bgt	L0127d4
	move.w	#$4bef,d2
L0127d4:
	cmp.w	#$0017,d4
	bgt	L0127de
	add.w	#$4000,d7
L0127de:
	cmp.w	#$0017,d5
	bgt	L0127ea
	addi.w	#$4000,(-$000a,a6)
L0127ea:
	cmpi.w	#$0001,($01b6,a5)		;表示方向
	bne	L0127f6
	moveq.l	#$10,d0
	bra	L0127f8
L0127f6:
	moveq.l	#$02,d0
L0127f8:
	cmpi.w	#$0001,($000a,a5)		;プレイヤー番号
	bne	L012804
	moveq.l	#$0f,d3					;1pのとき15
	bra	L012806
L012804:
	moveq.l	#$17,d3					;2pのとき23
L012806:
	pea.l	($0003)					;引数：プライオリティ
	ext.l	d2
	move.l	d2,-(sp)				;引数：パターン
	movea.w	($0008,a5),a0			;プレイヤーY座標
	pea.l	(-$10,a0,a3.w)			;引数：Y座標
	movea.w	($0006,a5),a0			;プレイヤーX座標
	adda.w	d1,a0
	movea.w	d0,a3
	pea.l	(a3,a0.l)				;引数：X座標
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)				;引数：スプライト番号
	lea.l	(SYSCALL_0004_Spr設定_表示),a4
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0003)				;プライオリティ
	ext.l	d7
	move.l	d7,-(sp)			;パターン
	movea.w	($0008,a5),a0
	movea.w	(-$0004,a6),a2
	pea.l	(-$10,a0,a2.w)		;Y座標
	movea.w	($0006,a5),a0
	adda.w	(-$0002,a6),a0
	pea.l	(a3,a0.l)			;X座標
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)			;スプライト番号
	jsr	(a4)
	lea.l	($0014,sp),sp
	pea.l	($0003)
	movea.w	(-$000a,a6),a2
	move.l	a2,-(sp)
	movea.w	($0008,a5),a0
	movea.w	(-$0008,a6),a2
	pea.l	(-$10,a0,a2.w)
	movea.w	($0006,a5),a0
	adda.w	(-$0006,a6),a0
	pea.l	(a3,a0.l)
	ext.l	d3
	move.l	d3,-(sp)
	jsr	(a4)
	lea.l	($0014,sp),sp
	addq.w	#1,d6
	addq.w	#1,d4
	addq.w	#1,d5
	cmpi.w	#$0001,($000a,a5)
	bne	L0128ae
	move.w	d6,(L02025e)
	move.w	d4,(L020260)
	move.w	d5,(L020262)
	bra	L0128c0
L0128ae:
	move.w	d6,(L020264)
	move.w	d4,(L020266)
	move.w	d5,(L020268)
L0128c0:
	pea.l	($0100)				;IVC_ゾンビ
	move.l	a5,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	move.w	($09e6,a5),d0
	beq	L0128dc
	cmp.w	#$0001,d0
	beq	L012936
	bra	L01294e
L0128dc:
	move.w	#$ffe0,($0032,a5)
	clr.w	($0a44,a5)
	clr.w	($0a42,a5)
	cmpi.w	#$0001,($000a,a5)
	bne	L01290a
	clr.w	(L02025e)
	move.w	#$0010,(L020260)
	move.w	#$0020,(L020262)
	bra	L012920
L01290a:
	clr.w	(L020264)
	move.w	#$0010,(L020266)
	move.w	#$0020,(L020268)
L012920:
	pea.l	($0042)					;66=SUB_気絶転倒
	move.l	a5,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L01292e:
	addq.w	#1,($09e6,a5)
	bra	L0129ee
L012936:
	tst.l	($06e8,a5)
	beq	L01292e
	pea.l	($0042)					;66=SUB_気絶転倒
	move.l	a5,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	bra	L0129ee
L01294e:
	pea.l	($0000)				;IVC_通常
	move.l	a5,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	move.w	($002e,a5),($1730,a5)
	lea.l	(SFSYSINFO_001e_デバッグモード有効フラグ),a0
	tst.w	(a0)
	beq	L012980
	tst.w	($0464,a0)
	beq	L012980
	move.w	#$0058,($002e,a5)
	move.w	#$0058,($1730,a5)
	bra	L0129b0
L012980:
	cmpi.w	#$0001,($000a,a5)
	bne	L01299c
	movea.w	($1730,a5),a2
	move.l	a2,-(sp)
	movea.w	($002e,a5),a2
	move.l	a2,-(sp)
	jsr	(SR_1P体力ゲージ描画)		;SR_1P体力ゲージ描画(残り体力, コンボ前体力)
	bra	L0129ae
L01299c:
	movea.w	($1730,a5),a2
	move.l	a2,-(sp)
	movea.w	($002e,a5),a2
	move.l	a2,-(sp)
	jsr	(SR_2P体力ゲージ描画)		;SR_2P体力ゲージ描画(残り体力, コンボ前体力)
L0129ae:
	addq.w	#8,sp
L0129b0:
	pea.l	($0035)					;35=SUB_気絶
	move.l	a5,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
	subq.w	#1,($09ee,a5)
	tst.w	($09ee,a5)
	bgt	L0129ee
	move.l	a5,-(sp)
	jsr	(SR_気絶回復表示)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a5,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	clr.w	($0a42,a5)
	clr.w	($09e6,a5)
L0129ee:
	movem.l	(-$002a,a6),d3-d7/a3-a5
	unlk	a6
	rts

L0129f8:
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0010,sp),a3
	move.l	($0014,sp),d4
	move.w	#$0001,($01bc,a3)
	tst.w	($09e6,a3)
	bne	L012a1e
	move.w	#$0008,($09ee,a3)
	addq.w	#1,($09e6,a3)
	bra	L012afc
L012a1e:
	cmpi.w	#$0001,($09e6,a3)
	bne	L012a6a
	subq.w	#1,($09ee,a3)
	move.w	($09ee,a3),d3
	movea.w	($09e8,a3),a0
	move.l	a0,-(sp)
	pea.l	(-$0001)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0018_座標設定_Ｘ移動)
	lea.l	($0010,sp),sp
	cmp.w	#$0006,d3
	ble	L012a54
	subq.w	#1,($0008,a3)
	bra	L012afc
L012a54:
	cmp.w	#$0001,d3
	bgt	L012afc
	move.w	#$0001,($09ee,a3)
	addq.w	#1,($09e6,a3)
	bra	L012afc
L012a6a:
	cmpi.w	#$0002,($09e6,a3)
	beq	L012aee
	pea.l	($0000)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	clr.w	($09ee,a3)
	clr.w	($0f06,a3)
	clr.w	($09e6,a3)
	move.w	#$0070,($0008,a3)
	pea.l	($0000)
	movea.w	($000a,a3),a0
	move.l	a0,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_0044_キャラクタ向かい合わせ設定)
	addq.w	#8,sp
	pea.l	($003b)				;CELL_着地
	move.l	a3,-(sp)
	jsr	(SYSCALL_0000_セル設定_表示)
	addq.w	#8,sp
	pea.l	($0001)
	pea.l	($0002)
	pea.l	($0004)
	jsr	(SYSCALL_00cc_演出設定_地面振動)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0064)				;ACT_アイドル
	move.l	a3,-(sp)
	jsr	(SYSCALL_0110_Cmd実行_動作)
	lea.l	($000c,sp),sp
	bra	L012b48
L012aee:
	pea.l	($0033)				;33=SUB_不時着
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012afc:
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012b12
	pea.l	($00f2)				;fc=VCT_防御コマンド判定処理
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012b12:
	cmpi.w	#$0008,($09f0,a3)
	bgt	L012b2c
	pea.l	($0000)
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
L012b2c:
	pea.l	($0000)				;IVC_通常
	move.l	a3,-(sp)
	jsr	(SYSCALL_00c0_状態設定_永続無敵)
	addq.w	#8,sp
	pea.l	($00f8)				;f8=VCT_防御姿勢表示処理
	move.l	a3,-(sp)
	jsr	(SR_キャラ動作関数実行)
	addq.w	#8,sp
L012b48:
	movem.l	(sp)+,d3-d4/a3
	rts

L012b4e:
	rts

L012b50:
	rts

L012b52:
	movea.l	($0004,sp),a1
	move.w	($000a,a1),d0
	ext.l	d0
	lea.l	(L01fff6),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d1
	subq.w	#1,d1
	tst.w	d1
	bgt	L012b76
	moveq.l	#$08,d1
	move.w	($1760,a1),($01b6,a1)
L012b76:
	move.w	($000a,a1),d0
	ext.l	d0
	lea.l	(L01fff6),a0
	add.l	d0,d0
	move.w	d1,(a0,d0.l)
	rts

L012b8a:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a3
	movea.l	($0014,sp),a4
	tst.w	(SFSYSINFO_0070_XXXX)
	beq	L012d72
	movea.l	($1288,a3),a0
	cmpa.w	#$0000,a0
	beq	L012bb2
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012bb2:
	move.l	a3,-(sp)
	jsr	(SYSCALL_0038_座標取得_相手距離)
	addq.w	#4,sp
	move.w	d0,d3
	tst.w	($09f0,a3)
	ble	L012bdc
	tst.w	($01be,a3)
	beq	L012bdc
	move.w	($0ace,a3),($0a8e,a3)
	move.w	#$000c,($0a8c,a3)
	move.w	#$000c,($0f06,a3)
L012bdc:
	tst.w	($0f06,a3)
	ble	L012c50
	subq.w	#1,($0f06,a3)
	tst.w	($09f0,a3)
	ble	L012c7a
	tst.w	($01be,a3)
	beq	L012c7a
	move.l	a4,-(sp)
	jsr	(SYSCALL_0128_状態取得_しゃがみ)
	addq.w	#4,sp
	tst.w	d0
	beq	L012c0c
	cmpi.w	#$006f,($0008,a4)
	bgt	L012c12
L012c0c:
	pea.l	($0000)
	bra	L012c16
L012c12:
	pea.l	($0001)
L012c16:
	move.l	a3,-(sp)
	jsr	(SYSCALL_012c_状態設定_しゃがみ)
	addq.w	#8,sp
	move.w	($0ace,a3),($0a8e,a3)
	move.w	#$000c,($0a8c,a3)
	pea.l	($0001)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_007c_Cmd実行_防御)
	lea.l	($000c,sp),sp
	jsr	(乱数発生)
	cmp.l	#$00004e1f,d0
	ble	L012d72
	bra	L012c7a
L012c50:
	tst.w	($0a8c,a3)
	ble	L012c7a
	subq.w	#1,($0a8c,a3)
	tst.w	($0a8c,a3)
	bgt	L012c72
	movea.l	($1244,a3),a0
	cmpa.w	#$0000,a0
	beq	L012c72
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012c72:
	movea.w	($0a8e,a3),a1
	move.l	a1,($0acc,a3)
L012c7a:
	cmpi.w	#$0090,($09e2,a4)
	bne	L012c8a
	movea.l	($1270,a3),a0
	bra	L012d46
L012c8a:
	cmpi.w	#$006f,($0008,a4)
	ble	L012cee
	cmp.w	#$ffd0,d3
	ble	L012ce0
	cmp.w	#$0007,d3
	bgt	L012cb0
	movea.l	($1248,a3),a0
	cmpa.w	#$0000,a0
	beq	L012cb0
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012cb0:
	cmp.w	#$001f,d3
	bgt	L012cc8
	movea.l	($124c,a3),a0
	cmpa.w	#$0000,a0
	beq	L012cc8
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012cc8:
	cmp.w	#$0037,d3
	bgt	L012ce0
	movea.l	($1250,a3),a0
	cmpa.w	#$0000,a0
	beq	L012ce0
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012ce0:
	tst.w	($1324,a3)
	bne	L012d72
	movea.l	($1254,a3),a0
	bra	L012d46
L012cee:
	cmp.w	#$ffe0,d3
	ble	L012d3c
	cmp.w	#$0007,d3
	bgt	L012d0c
	movea.l	($1258,a3),a0
	cmpa.w	#$0000,a0
	beq	L012d0c
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012d0c:
	cmp.w	#$001f,d3
	bgt	L012d24
	movea.l	($125c,a3),a0
	cmpa.w	#$0000,a0
	beq	L012d24
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012d24:
	cmp.w	#$0037,d3
	bgt	L012d3c
	movea.l	($1260,a3),a0
	cmpa.w	#$0000,a0
	beq	L012d3c
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012d3c:
	tst.w	($1324,a3)
	bne	L012d72
	movea.l	($1264,a3),a0
L012d46:
	cmpa.w	#$0000,a0
	beq	L012d54
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012d54:
	cmp.w	#$0057,d3
	bgt	L012d72
	tst.w	($1324,a3)
	bne	L012d72
	movea.l	($1274,a3),a0
	cmpa.w	#$0000,a0
	beq	L012d72
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	addq.w	#8,sp
L012d72:
	movem.l	(sp)+,d3/a3-a4
	rts

SR_デフォルト気集中マーク表示処理:
	link	a6,#-$000e
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a0			;arg1=p1
	move.w	($000e,a6),d0			;arg2=flg?
	move.w	($0012,a6),d3			;arg3=x
	move.w	($0016,a6),d6			;arg4=y
	move.w	($001a,a6),(-$000e,a6)	;arg5=スプライト番号

	if (d0 == -1) {
		p1->0ac2_気集中 = 20;

		PCGパレットアドレス_デフォルト気集中マーク = SYSCALL_027c_Pal取得_表示データ(p1, PAL_BLK_表示_ステージ, 7);
		L02026a = 0;
		L02026c = 0;

		SYSCALL_0024_音声再生(0, PCM_気集中);
		return;
	}

	if (d0 != 0) return;

	d5 = p1->0ac2_気集中 * 2 - 10;
	if (p1->0ac8_気集中マーク表示方向 == DRCT_右)
		d3 -= 8;
	else
		d3 += 8;

	p1->0ac2_気集中--;

	if (L02026a == 0) {
		SYSCALL_0220_Dataコピー_メモリブロック(2, &L01fffc, *PCGパレットアドレス_デフォルト気集中マーク, 6);
		L02026a = 1;
	} else {
		SYSCALL_0220_Dataコピー_メモリブロック(2, &L06dc10, *PCGパレットアドレス_デフォルト気集中マーク, 6);
		L02026a = 0;
		L02026c ~= 1;
	}

	if (L02026c == 0) {
		d4 = 0x0af1;
		d7 = 0x0af2;
	} else {
		d4 = 0x0af2;
		d7 = 0x0af1;
	}

L012e72:
	pea.l	($0003)
	pea.l	($0af0)
	movea.w	d6,a4
	move.l	a4,-(sp)
	movea.w	d3,a5
	move.l	a5,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)

	jsr	(a3)	SYSCALL_0004_Spr設定_表示(a6_mi000e++, d3, d6, 0x0af0, 3)

	pea.l	($0003)
	move.w	d4,d3
	ext.l	d3
	move.l	d3,d1
	add.l	#$0000c000,d1
	move.l	d1,-(sp)
	ext.l	d5
	move.l	a4,d1
	sub.l	d5,d1
	move.l	d1,(-$0004,a6)
	move.l	d1,-(sp)
	move.l	a5,d6
	sub.l	d5,d6
	move.l	d6,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示(a6_mi000e++, ?, ?, ?, 3);
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.w	d7,d4
	ext.l	d4
	move.l	d4,d1
	add.l	#$0000c000,d1
	move.l	d1,-(sp)
	moveq.l	#$f0,d1
	add.l	(-$0004,a6),d1
	move.l	d1,(-$0008,a6)
	move.l	d1,-(sp)
	moveq.l	#$f0,d7
	add.l	d6,d7
	move.l	d7,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	d4,d1
	add.l	#$00008000,d1
	move.l	d1,-(sp)
	move.l	(-$0004,a6),-(sp)
	adda.l	d5,a5
	move.l	a5,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	d3,d1
	add.l	#$00008000,d1
	move.l	d1,-(sp)
	move.l	(-$0008,a6),-(sp)
	moveq.l	#$10,d1
	add.l	a5,d1
	move.l	d1,(-$000c,a6)
	move.l	d1,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	movea.l	d4,a1
	pea.l	($4000,a1)
	adda.l	d5,a4
	move.l	a4,-(sp)
	move.l	d6,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	movea.l	d3,a1
	pea.l	($4000,a1)
	moveq.l	#$10,d5
	add.l	a4,d5
	move.l	d5,-(sp)
	move.l	d7,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	d3,-(sp)
	move.l	a4,-(sp)
	move.l	a5,-(sp)
	movea.w	(-$000e,a6),a0
	addq.w	#1,(-$000e,a6)
	move.l	a0,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0003)
	move.l	d4,-(sp)
	move.l	d5,-(sp)
	move.l	(-$000c,a6),-(sp)
	movea.w	(-$000e,a6),a1
	move.l	a1,-(sp)
	jsr	(a3)	SYSCALL_0004_Spr設定_表示
	lea.l	($0014,sp),sp
	pea.l	($0001)
	pea.l	($0000)
	jsr	(SYSCALL_0134_演出設定_遅延ループ)
L012fd4:
	addq.w	#8,sp
L012fd6:
	movem.l	(-$002e,a6),d3-d7/a3-a5
	unlk	a6
	rts

L012fe0:
	movem.l	d3-d6,-(sp)
	moveq.l	#$80,d3
	move.w	#$f800,d6
L012fea:
	move.w	d6,d2
	add.w	#$2000,d2
	move.w	d3,d0
	ext.l	d0
	asl.l	#5,d0
	movea.l	d0,a0
	adda.l	#L0704ec,a0
	moveq.l	#$1f,d1
	move.w	d3,d5
	add.w	d5,d5
	move.b	d3,d4
L013006:
	add.w	d5,d2
	move.w	d2,d0
	lsr.w	#6,d0
	add.b	d4,d0
	move.b	d0,(a0)+
	subq.w	#1,d1
	bpl	L013006
	add.w	#$0010,d6
	addq.w	#1,d3
	cmp.w	#$007f,d3
	ble	L012fea
	movem.l	(sp)+,d3-d6
	rts

L013026:
	move.w	#$0100,(L06f430)
	move.w	#$0020,(L06f42e)
	rts

SYSCALL_0270_Stg取得_ハンドラ:
	move.l	#L0690c4,d0
	rts

L013040:
	.dc.b	'BGM.ZPD',$00
L013048:
	.dc.b	$00,$00
L01304a:
	.dc.b	'SYSTEM/HONOR.PIC',$00,$00
L01305c:
	movem.l	d3/a3,-(sp)
	jsr	(L00b1c6)
	move.w	d0,d3
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	cmpi.w	#$0002,(SFSYSINFO_0474_場面_エンディング)
	beq	L0130ae
	pea.l	($0200)
	bra	L0130b2
L0130ae:
	pea.l	($0400)
L0130b2:
	jsr	(SYSCALL_01dc_Scr設定_画面モード)
	addq.w	#4,sp
	pea.l	($0000)
	jsr	(SYSCALL_01e4_Scr設定_表示面)
	addq.w	#4,sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	lea.l	(SFSYSINFO_0474_場面_エンディング),a3
	cmpi.w	#$0001,(a3)
	beq	L013158
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	tst.w	(a3)
	bne	L01310e
	movea.w	(-$0472,a3),a1
	move.l	a1,-(sp)
	bra	L013112
L01310e:
	pea.l	($0001)
L013112:
	jsr	(L017c60)
	addq.w	#4,sp
	lea.l	(MMP_SYS_0070_STAGE_ＢＧＭロード),a0
	move.l	(a0),(L06f432)
	beq	L01312c
	movea.l	(a0),a0
	jsr	(a0)
L01312c:
	pea.l	(L013040)
	pea.l	($0000)
	lea.l	(SYSCALL_020c_Bgm展開_ＺＰＤファイル),a3
	jsr	(a3)
	addq.w	#8,sp
	tst.w	d0
	beq	L013152
	pea.l	(L013048)
	pea.l	(-$0001)
	jsr	(a3)
	addq.w	#8,sp
L013152:
	jsr	(L013384)
L013158:
	pea.l	(WORK_1P_0000)
	lea.l	(SR_PCG_SP_読み込み・登録),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	lea.l	(SR_ユーザ定義くらい動作関数クリア),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	lea.l	(L012110),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラクター身体パレット設定),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($00c8)				;c8=OPT_初期化
	pea.l	(WORK_1P_0000)
	lea.l	(SR_キャラ動作関数実行),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($00c8)				;c8=OPT_初期化
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	lea.l	(SR_燃焼状態セル生成),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	lea.l	(L0196ec),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(WORK_1P_0000)
	lea.l	(L01540c),a3
	jsr	(a3)
	addq.w	#4,sp
	pea.l	(WORK_2P_0000)
	jsr	(a3)
	addq.w	#4,sp
	pea.l	($0004)
	pea.l	($0002)
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_0228_Scr設定_余白)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	jsr	(SYSCALL_01e8_Scr設定_ＢＧマスク)
	addq.w	#8,sp
	tst.w	(SFSYSINFO_0474_場面_エンディング)
	bne	L0132a8
	lea.l	(MMP_SYS_0089_STAGE_フォントロード),a0
	move.l	(a0),(L06f432)
	beq	L013280
	movea.l	(a0),a0
	jsr	(a0)
L013280:
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(SR_ゲージ・タイム・インジケータ・勝ち数表示)
	addq.w	#8,sp
	pea.l	(WORK_2P_0000)
	pea.l	(WORK_1P_0000)
	jsr	(SR_ラウンドコールBG文字列表示)
	addq.w	#8,sp
L0132a8:
	tst.w	(SFSYSINFO_0474_場面_エンディング)
	bne	L0132d4
	lea.l	(MMP_SYS_0080_STAGE_ＮＡＭＥロード),a0
	move.l	(a0),(L06f432)
	beq	L0132c2
	movea.l	(a0),a0
	jsr	(a0)
L0132c2:
	lea.l	(MMP_SYS_0081_STAGE_ＮＡＭＥ再生),a0
	move.l	(a0),(L06f432)
	beq	L0132d4
	movea.l	(a0),a0
	jsr	(a0)
L0132d4:
	lea.l	(MMP_SYS_0086_STAGE_砂煙ロード),a0
	move.l	(a0),(L06f432)
	beq	L0132e6
	movea.l	(a0),a0
	jsr	(a0)
L0132e6:
	lea.l	(MMP_SYS_0087_STAGE_影ロード),a0
	move.l	(a0),(L06f432)
	beq	L0132f8
	movea.l	(a0),a0
	jsr	(a0)
L0132f8:
	cmpi.w	#$0002,(SFSYSINFO_0474_場面_エンディング)
	beq	L013322
	lea.l	(MMP_SYS_0060_STAGE_背景描画),a0
	move.l	(a0),(L06f432)
	beq	L013314
	movea.l	(a0),a0
	jsr	(a0)
L013314:
	movea.w	d3,a1
	move.l	a1,-(sp)
	jsr	(SR_ステージパレットデータセット読み込み)
	addq.w	#4,sp
	bra	L013358
L013322:
	jsr	(SYSCALL_0270_Stg取得_ハンドラ)
	movea.l	d0,a3
	pea.l	(L01304a)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0001)
	jsr	(SR_PIC画像展開)
	lea.l	($0010,sp),sp
	move.w	#$0001,($0058,a3)
	move.w	#$0001,($0056,a3)
	move.w	#$0001,($0054,a3)
L013358:
	tst.w	(SFSYSINFO_0474_場面_エンディング)
	bne	L013372
	lea.l	(MMP_SYS_0083_STAGE_ＮＡＭＥフリー),a0
	move.l	(a0),(L06f432)
	beq	L013372
	movea.l	(a0),a0
	jsr	(a0)
L013372:
	move.w	d3,(SFSYSINFO_000e_xxxx)
	jsr	(SR_BG文字消去_9_23行)
	movem.l	(sp)+,d3/a3
	rts

L013384:
	moveq.l	#$00,d0
	lea.l	(SFSYSINFO_0474_場面_エンディング),a0
	tst.w	(a0)
	bgt	L013396
	tst.w	(-$042c,a0)
	beq	L013398
L013396:
	moveq.l	#$01,d0
L013398:
	lea.l	(MMP_SYS_0071_STAGE_ＢＧＭ再生),a0
	move.l	(a0),(L06f432)
	beq	L0133b0
	ext.l	d0
	move.l	d0,-(sp)
	movea.l	(a0),a0
	jsr	(a0)
	addq.w	#4,sp
L0133b0:
	rts

SR_ステージBGM変化()
{
	d0 = 0;
	if (SFSYSINFO_0474_場面_エンディング > 0 || SFSYSINFO_0048_場面_デモ) {
		d0 = 1;
	}

	if (MMP_SYS_0072_STAGE_ＢＧＭ変化)
		MMP_SYS_0072_STAGE_ＢＧＭ変化(d0);
}

SYSCALL_0074_演出表示_砂煙(p1, force)
{
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	lea.l	(MMP_SYS_0084_STAGE_砂煙設定),a0
	move.l	(a0),(L06f432)
	beq	L013408
	pea.l	($0a76,a1)	;砂煙表示カウンタ
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a1,-(sp)
	movea.l	(a0),a0
	jsr	(a0)				;MMP_SYS_0084_STAGE_砂煙設定(p1, d0, p1->0a76_砂煙表示カウンタ);
	lea.l	($000c,sp),sp
L013408:
	rts

SR_キャラクター砂煙表示(p1)
{
	if (MMP_SYS_0085_STAGE_砂煙表示) MMP_SYS_0085_STAGE_砂煙表示(p1->0a76_砂煙表示カウンタ);
}


SR_SET_STAGE_XY:
	movem.l	d3-d5,-(sp)
	move.w	($0012,sp),d4			;d4=背景0 X座標
	move.w	($0016,sp),d1			;d1=背景0 Y座標
	move.w	($001a,sp),d5			;d5=背景1 X座標
	move.w	($001e,sp),d2			;d2=背景1 Y座標
	move.w	($0026,sp),d3			;d3=?
	tst.w	(地面振動_持続サイクル)
	ble	L013474						;0以下のとき分岐
	tst.w	(L020014)
	bgt	L013468						;0より大きいとき分岐
	move.w	(地面振動_振幅),d0			;d0=?
	add.w	d0,d1
	add.w	d0,d2
	add.w	d0,d3
	move.w	(地面振動_周期),(L020014)
L013468:
	subq.w	#1,(L020014)
	subq.w	#1,(地面振動_持続サイクル)
L013474:
	move.w	d4,(ステージ背景1_X座標)			;背景1 X座標
	move.w	d1,(ステージ背景1_Y座標)			;背景1 Y座標
	move.w	d5,(ステージ背景2_X座標)			;背景2 X座標
	move.w	d2,(ステージ背景2_Y座標)			;背景2 Y座標
	move.w	d3,(ワールドスプライトY座標)
	movem.l	(sp)+,d3-d5
	rts

SR_ラスター割込み処理()
{
	if (L020012 == 0) {
		d0 = ラスタースクロール量テーブル[ラスタースクロール量テーブル参照用Yインデックス + ステージ背景1_X座標 * 32];
		ラスタースクロール量テーブル参照用Yインデックス++;
		*0x00e80018 = d0;	// GR0 X座標
		*0x00e8001c = d0;	// GR1 X座標
		ラスター割込みY座標現在値 += ラスタースクロール用割込み間隔;
		if (ラスター割込み終了位置 > ラスター割込みY座標現在値) goto L013590;
		
		*0x00e80018 = ステージ背景1_X座標;	// GR0 X,Y座標まとめて更新
		*0x00e8001c = ステージ背景1_X座標;	// GR1 X,Y座標まとめて更新
		*0x00e80020 = ステージ背景2_X座標;	// GR2 X,Y座標まとめて更新
		*0x00e80024 = ステージ背景2_X座標;	// GR3 X,Y座標まとめて更新
	} else {
		ラスター割込みY座標現在値 += ラスタースクロール用割込み間隔;
		if (ラスター割込み終了位置 > ラスター割込みY座標現在値) goto L013590;
		
		*0x00e80018 = ステージ背景1_X座標;
		*0x00e8001c = ステージ背景1_X座標;
		*0x00e80020 = ステージ背景2_X座標;
		*0x00e80024 = ステージ背景2_X座標;
	}
	
	if (画面周波数) {
		ラスター割込みY座標現在値 = 32 - ステージ背景1_Y座標;
	} else {
		ラスター割込みY座標現在値 = 64 - ステージ背景1_Y座標 * 2;
	}
	
	ラスター割込み処理実行中フラグ = 0;
	ラスタースクロール量テーブル参照用Yインデックス = 0;

L013590:
	*0x00e80012 = ラスター割込みY座標現在値 + ラスター割込み適用開始位置;	// ラスター割込み位置更新
}

L0135a8:
	rts

SR_ラスター割込み設定開始:
	tst.w	(ラスター割込み設定状態)
	bne	L0135d0
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	move.w	#$0080,d1
	lea.l	(SR_ラスター割込み処理),a1
	trap	#15
	andi.w	#$f8ff,sr
	move.w	#$0001,(ラスター割込み設定状態)
L0135d0:
	rts

SR_ラスター割込み設定解除:
	tst.w	(ラスター割込み設定状態)
	beq	L0135ee
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	suba.l	a1,a1
	trap	#15
	andi.w	#$f8ff,sr
	clr.w	(ラスター割込み設定状態)
L0135ee:
	rts

SYSCALL_00cc_演出設定_地面振動(振動持続サイクル, 周期, 振幅):
	move.w	($000a,sp),d0
	move.w	($000e,sp),d1
	move.w	($0006,sp),(地面振動_持続サイクル)
	move.w	d0,(地面振動_周期)
	move.w	d1,(地面振動_振幅)
	rts

L01360e:
	tst.w	($0006,sp)
	bne	L01361e
	move.w	#$0001,(L020012)
	bra	L013624
L01361e:
	clr.w	(L020012)
L013624:
	rts

L013626:
	cmpi.w	#$000f,($0006,sp)
	bne	L013648
	move.w	#$0002,(ラスタースクロール用割込み間隔)
	move.w	#$0038,(ラスター割込み終了位置)
	move.w	#$00c0,(ラスター割込み適用開始位置)
	bra	L013660
L013648:
	move.w	#$0004,(ラスタースクロール用割込み間隔)
	move.w	#$0070,(ラスター割込み終了位置)
	move.w	#$0188,(ラスター割込み適用開始位置)
L013660:
	rts


SR_ラウンド開始前スクロール演出(flag)
{
	if (flag == 0) {
		if (乱数発生() <= 0x3fff) {
			L020272 = 0xffff;
			L020274 = 0x0090;
		} else {
			L020272 = 1;
			L020274 = 0x0170;
		}
		L020276 = 0x0080;
	}
	
	{
		if (L020274 < 0x0100) {
				 if (L020274 <= 0x00c8) L020274 += 5;
			else if (L020274 <= 0x00e8) L020274 += 4;
			else if (L020274 <= 0x00f0) L020274 += 3;
			else if (L020274 <= 0x00f8) L020274 += 2;
			else						L020274 += 1;
			
			if (L020274 > 0x0100) L020274 = 0x0100;
		} else if (L020274 > 0x0100) {
				 if (L020274 <= 0x0107) L020274 -= 1;
			else if (L020274 <= 0x010f) L020274 -= 2;
			else if (L020274 <= 0x0117) L020274 -= 3;
			else if (L020274 <= 0x0138) L020274 -= 4;
			else						L020274 -= 5;
			
			if (L020274 < 0x0100) L020274 = 0x0100;
		}
	}
	
	{
		if (L020276 > 0x0020) {
			d = L020276 - 0x0020;
				 if (d <=  7) L020276 -= 1;
			else if (d <= 15) L020276 -= 2;
			else if (d <= 23) L020276 -= 3;
			else			  L020276 -= 4;
		} else if (L020276 < 0x0020) {
			L020276 = 0x0020;
		}
	}

	L004324(L020274, L020276);

	if (L020274 == 0x0100 && L020276 == 0x0020) {
		return 1;
	} else {
		return 0;
	}


L0137f0:
	pea.l	($000a)
	jsr	(L014804)
	addq.w	#4,sp
	pea.l	($000a)
	jsr	(L013c78)
	addq.w	#4,sp
	pea.l	($000a)
	jsr	(L013e4e)
	addq.w	#4,sp
	rts

L013816:
	movem.l	d3-d4/a3,-(sp)
	move.l	($0010,sp),d4
	move.w	($0016,sp),d3
	beq	L013830
	cmp.w	#$0002,d3
	beq	L013830
	cmp.w	#$0001,d3
	bne	L013846
L013830:
	pea.l	($0000)
	movea.w	d3,a3
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(L0138ac)
	lea.l	($000c,sp),sp
	bra	L01388e
L013846:
	cmp.w	#$0009,d3
	beq	L01388c
	cmp.w	#$0005,d3
	beq	L01388c
	cmp.w	#$0006,d3
	beq	L01388c
	cmp.w	#$0003,d3
	bne	L0138a6
	pea.l	($0000)
	pea.l	($0000)
	pea.l	(WORK_2P_0000)
	lea.l	(L0138ac),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	(WORK_1P_0000)
	jsr	(a3)
	lea.l	($000c,sp),sp
L01388c:
	movea.w	d3,a3
L01388e:
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(L013986)
	addq.w	#8,sp
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	jsr	(L013aea)
	addq.w	#8,sp
L0138a6:
	movem.l	(sp)+,d3-d4/a3
	rts

L0138ac:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3
	move.w	($0012,sp),d0
	move.w	($0016,sp),d3
	tst.w	d0
	beq	L0138cc
	cmp.w	#$0002,d0
	beq	L0138cc
	cmp.w	#$0001,d0
	bne	L01391e
L0138cc:
	move.l	a3,-(sp)
	jsr	(L014910)
	addq.w	#4,sp
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(SFSYSINFO_0026_xxxx),a0
	add.l	d0,d0
	move.w	($000c,a3),d1
	cmp.w	(a0,d0.l),d1
	bne	L0138f2
	tst.w	d3
	beq	L013958
L0138f2:
	pea.l	($0000)
	move.l	a3,-(sp)
	jsr	(L014860)
	addq.w	#8,sp
	move.l	a3,-(sp)
	jsr	(L01491e)
	addq.w	#4,sp
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(SFSYSINFO_0026_xxxx),a0
	add.l	d0,d0
	clr.w	(a0,d0.l)
	bra	L013958
L01391e:
	cmp.w	#$0009,d0
	beq	L013936
	cmp.w	#$0003,d0
	beq	L013936
	cmp.w	#$0005,d0
	beq	L013936
	cmp.w	#$0006,d0
	bne	L013958
L013936:
	pea.l	($0064)
	move.l	a3,-(sp)
	jsr	(L014860)
	addq.w	#8,sp
	move.l	a3,-(sp)
	jsr	(L01491e)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(L014910)
	addq.w	#4,sp
L013958:
	movem.l	(sp)+,d3/a3
	rts

L01395e:
	.dc.b	'SC/BOOT/',$00,$00
L013968:
	.dc.b	'SC/OPEN/',$00,$00
L013972:
	.dc.b	'SC/SELECT/',$00,$00
L01397e:
	.dc.b	'SC/VS/',$00,$00
L013986:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	($000e,sp),d0
	beq	L01399e
	cmp.w	#$0002,d0
	beq	L01399e
	cmp.w	#$0001,d0
	bne	L0139d4
L01399e:
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(SFSYSINFO_0026_xxxx),a0
	add.l	d0,d0
	move.w	($000c,a3),d1
	cmp.w	(a0,d0.l),d1
	beq	L013ae6
	move.l	a3,-(sp)
	jsr	(L0140b0)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(SR_セル情報一括初期化)
	addq.w	#4,sp
	pea.l	($0000)
	bra	L013adc
L0139d4:
	cmp.w	#$0009,d0
	bne	L013a10
	move.l	#L044f90,(L0467f6)
	move.l	#L044f90,(L058592)
	pea.l	(L01395e)
	pea.l	(L044f90)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L044f98)
	pea.l	($0000)
	bra	L013abc
L013a10:
	cmp.w	#$0003,d0
	bne	L013a4a
	move.l	#L044f90,(L0467f6)
	move.l	#L044f90,(L058592)
	pea.l	(L013968)
	pea.l	(L044f90)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L044f98)
	pea.l	($0001)
	bra	L013abc
L013a4a:
	cmp.w	#$0005,d0
	bne	L013a84
	move.l	#L044f90,(L0467f6)
	move.l	#L044f90,(L058592)
	pea.l	(L013972)
	pea.l	(L044f90)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L044f9a)
	pea.l	($0002)
	bra	L013abc
L013a84:
	cmp.w	#$0006,d0
	bne	L013ae6
	move.l	#L044f90,(L0467f6)
	move.l	#L044f90,(L058592)
	pea.l	(L01397e)
	pea.l	(L044f90)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	pea.l	(L044f96)
	pea.l	($0003)
L013abc:
	jsr	(L002ab6)
	addq.w	#8,sp
	move.l	a3,-(sp)
	jsr	(SR_セル情報一括初期化)
	addq.w	#4,sp
	move.l	a3,-(sp)
	jsr	(L0140b0)
	addq.w	#4,sp
	pea.l	($0064)
L013adc:
	move.l	a3,-(sp)
	jsr	(L013bf0)
	addq.w	#8,sp
L013ae6:
	movea.l	(sp)+,a3
	rts

L013aea:
	movem.l	d3/a3-a5,-(sp)
	movea.l	($0014,sp),a4
	move.w	($001a,sp),d3
	beq	L013b06
	cmp.w	#$0002,d3
	beq	L013b06
	cmp.w	#$0001,d3
	bne	L013b8a
L013b06:
	move.l	a4,-(sp)
	jsr	(SR_VOICE_SMP読み込み・登録)
	addq.w	#4,sp
	move.l	a4,-(sp)
	jsr	(SR_MINI_PAL読み込み・登録)
	addq.w	#4,sp
	move.l	a4,-(sp)
	jsr	(SR_MINI_SP_読み込み・登録)
	addq.w	#4,sp
	movea.w	d3,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_CHAR_PAL読み込み・登録)
	addq.w	#8,sp
	move.w	($000a,a4),d0
	ext.l	d0
	lea.l	(SFSYSINFO_0026_xxxx),a5
	add.l	d0,d0
	move.w	($000c,a4),d1
	cmp.w	(a5,d0.l),d1
	beq	L013bde
	move.l	a4,-(sp)
	jsr	(SR_HIT_INF_読み込み・登録)
	addq.w	#4,sp
	move.l	a4,-(sp)
	jsr	(SR_CELL_INF読み込み・登録)
	addq.w	#4,sp
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_CHAR_ASP読み込み・登録)
	addq.w	#8,sp
	pea.l	($0000)
	move.l	a4,-(sp)
	jsr	(SR_LOAD_CHR_ACTION_X)
	addq.w	#8,sp
	move.w	($000a,a4),d0
	ext.l	d0
	add.l	d0,d0
	move.w	($000c,a4),(a5,d0.l)
	bra	L013bde
L013b8a:
	cmp.w	#$0009,d3
	beq	L013ba2
	cmp.w	#$0003,d3
	beq	L013ba2
	cmp.w	#$0005,d3
	beq	L013ba2
	cmp.w	#$0006,d3
	bne	L013bde
L013ba2:
	move.l	a4,-(sp)
	jsr	(SR_CELL_INF読み込み・登録)
	addq.w	#4,sp
	movea.w	d3,a3
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_CHAR_PAL読み込み・登録)
	addq.w	#8,sp
	move.l	a4,-(sp)
	jsr	(SR_VOICE_SMP読み込み・登録)
	addq.w	#4,sp
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SR_CHAR_ASP読み込み・登録)
	addq.w	#8,sp
	pea.l	($0064)
	move.l	a4,-(sp)
	jsr	(SR_LOAD_CHR_ACTION_X)
	addq.w	#8,sp
L013bde:
	movem.l	(sp)+,d3/a3-a5
	rts

L013be4:
	.dc.b	'CONFIG.LST',$00,$00
L013bf0:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3
	move.w	($0012,sp),d3
	moveq.l	#$00,d1
	move.l	d1,($0cda,a3)
	move.l	d1,($0cde,a3)
	move.l	d1,($1762,a3)
	move.w	d1,($0f1a,a3)
	move.w	d1,($175a,a3)
	move.l	a3,-(sp)
	jsr	(SR_動作関数クリア)
	addq.w	#4,sp
	pea.l	($0002)
	move.l	a3,-(sp)
	jsr	(L012232)
	addq.w	#8,sp
	moveq.l	#$00,d1
	move.l	d1,($175c,a3)
	pea.l	($0000)
	pea.l	(L013be4)
	move.l	a3,d1
	add.l	#$0000fd6e,d1
	move.l	d1,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_01b0_Cnf登録_キャラクタ・ステージ・システム)
	lea.l	($0010,sp),sp
	tst.w	d3
	bne	L013c66
	moveq.l	#$00,d1
	move.l	d1,($0f08,a3)
	move.l	a3,-(sp)
	jsr	(L015b36)
	addq.w	#4,sp
	bra	L013c72
L013c66:
	cmp.w	#$0064,d3
	bne	L013c72
	moveq.l	#$00,d1
	move.l	d1,($0f08,a3)
L013c72:
	movem.l	(sp)+,d3/a3
	rts

L013c78:
	pea.l	($0032)
	jsr	(L012264)
	addq.w	#4,sp
	jsr	(L0121e2)
	lea.l	(MMP_SYS_0062_xxxx),a0
	move.l	(a0),(L06f432)
	beq	L013ca4
	pea.l	(グラフィック画面プレーン0座標)
	movea.l	(a0),a0
	jsr	(a0)
	addq.w	#4,sp
L013ca4:
	jsr	(L00b1c6)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L00917e)
	addq.w	#4,sp
	rts

L013cb8:
	.dc.b	'ACTION.X',$00,$00
L013cc2:
	.dc.b	'SYSTEM/DFT_C/ACTION.X',$00
L013cd8:
	.dc.b	'%s %d %d %d',$00
L013ce4:
	.dc.b	$00,$00
L013ce6:
	.dc.b	' が実行できません',$00
L013cf8:
	.dc.b	'(LOAD_CHR_ACTION_X)',$00
SR_LOAD_CHR_ACTION_X:
	link	a6,#-$0200
	movem.l	d3-d5/a3-a4,-(sp)
	movea.l	($0008,a6),a3			;a3=p1
	move.w	($000e,a6),d3			;d3=arg2
	move.l	a3,(L06f436)
	move.l	a3,-(sp)
	jsr	(L011f62)					;L011f62(p1);
	addq.w	#4,sp
	move.w	d3,(SFSYSINFO_0486_xxxx)
	bne	L013d3c
	move.w	#$0001,($0004,a3)
	bra	L013d68
L013d3c:
	cmp.w	#$0001,d3
	bne	L013d56
	pea.l	(L013cc2)
	pea.l	(-$0100,a6)
	jsr	(XCLIB_strcpy)				;XCLIB_strcpy(&a6[-256], "SYSTEM/DFT_C/ACTION.X");
	addq.w	#8,sp
	bra	L013d7e
L013d56:
	cmp.w	#$0064,d3
	bne	L013d7e
	move.w	#$0001,($0004,a3)
	jsr	(L011fde)					;L011fde();
L013d68:
	pea.l	(-$0100,a6)
	pea.l	(L013cb8)
	move.l	a3,-(sp)
	jsr	(L008c7e)					;L008c7e(p1, "ACTION.X", &a6[-256]);
	lea.l	($000c,sp),sp
L013d7e:
	pea.l	(SFSYSINFO_0000_xxxx)
	move.l	a3,-(sp)
	pea.l	(SYSCALL_ジャンプテーブル)
	move.l	a6,d5
	add.l	#$ffffff00,d5
	move.l	d5,-(sp)
	pea.l	(L013cd8)
	move.l	a6,d3
	add.l	#$fffffe00,d3
	move.l	d3,d4
	addq.l	#1,d4
	move.l	d4,-(sp)
	jsr	(XCLIB_sprintf)					;XCLIB_sprintf(&a6[-511], "%s %d %d %d", &a6[-256], SYSCALL_ジャンプテーブル, p1, SFSYSINFO_0000_xxxx);
	lea.l	($0018,sp),sp
	pea.l	(L013ce4)
	move.l	d4,-(sp)
	lea.l	(XCLIB_strcat),a4
	jsr	(a4)						;XCLIB_strcat(&a6[-511], "\0");
	addq.w	#8,sp
	move.l	d4,-(sp)
	jsr	(XCLIB_strlen)					;XCLIB_strlen(&a6[-511]);
	addq.w	#4,sp
	move.b	d0,(-$0200,a6)
	movem.l	d0-d7/a0-a5,-(sp)
	pea.l	($0000)
	move.l	d3,-(sp)
	move.l	d5,-(sp)
	jsr	(doscall_exec)				;doscall_exec(&a6[-256], &a6[-512], 0);
	lea.l	($000c,sp),sp
	tst.l	d0
	bge	L013e0a
	pea.l	(L013ce6)
	move.l	d5,-(sp)
	jsr	(a4)						;XCLIB_strcat(&a6[-256], " が実行できません");
	addq.w	#8,sp
	pea.l	(L013cf8)
	move.l	d5,-(sp)
	jsr	(SYSCALL_0264_システム異常終了)	;SYSCALL_0264_システム異常終了(&a6[-256], "(LOAD_CHR_ACTION_X)");
	addq.w	#8,sp
L013e0a:
	movem.l	(sp)+,d0-d7/a0-a5
	move.l	a3,-(sp)
	jsr	(L011f62)					;L011f62(p1);
	movem.l	(-$0214,a6),d3-d5/a3-a4
	unlk	a6
	rts

L013e20:
	.dc.b	'SYSTEM/DFT_S/ACTION.X',$00
L013e36:
	.dc.b	$72,$62,$00,$00
L013e3a:
	.dc.b	'(LOAD_STG_ACTION_X)',$00
L013e4e:
	link	a6,#-$0200
	movem.l	d3-d5/a3,-(sp)
	move.w	($000a,a6),d0
	move.w	d0,(SFSYSINFO_0486_xxxx)
	cmp.w	#$000a,d0
	bne	L013e8c
	jsr	(L011fde)
	pea.l	(-$0100,a6)
	pea.l	(L013cb8)
	jsr	(L00b1c6)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_ステージデータファイルパス構築)
	lea.l	($000c,sp),sp
	bra	L013ea4
L013e8c:
	cmp.w	#$000b,d0
	bne	L013ea4
	pea.l	(L013e20)
	pea.l	(-$0100,a6)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
L013ea4:
	pea.l	(L013e36)
	move.l	a6,d5
	add.l	#$ffffff00,d5
	move.l	d5,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	tst.l	d0
	ble	L013f54
	move.l	d0,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	pea.l	(SFSYSINFO_0000_xxxx)
	pea.l	($0000)
	pea.l	(SYSCALL_ジャンプテーブル)
	move.l	d5,-(sp)
	pea.l	(L013cd8)
	move.l	a6,d3
	add.l	#$fffffe00,d3
	move.l	d3,d4
	addq.l	#1,d4
	move.l	d4,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($0018,sp),sp
	pea.l	(L013ce4)
	move.l	d4,-(sp)
	lea.l	(XCLIB_strcat),a3
	jsr	(a3)
	addq.w	#8,sp
	move.l	d4,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	move.b	d0,(-$0200,a6)
	movem.l	d0-d7/a0-a5,-(sp)
	pea.l	($0000)
	move.l	d3,-(sp)
	move.l	d5,-(sp)
	jsr	(doscall_exec)
	lea.l	($000c,sp),sp
	tst.l	d0
	bge	L013f50
	pea.l	(L013ce6)
	move.l	d5,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	(L013e3a)
	move.l	d5,-(sp)
	jsr	(SYSCALL_0264_システム異常終了)
L013f50:
	movem.l	(sp)+,d0-d7/a0-a5
L013f54:
	movem.l	(-$0210,a6),d3-d5/a3
	unlk	a6
	rts

SR_セル情報一括初期化(p1)
{
	for (d3 = 0; d3 <= 1023; d3+) {
		SYSCALL_014c_セル登録_情報(d4, d3, 未定義セルデータ);
	}
}

L013f8a:
	.dc.b	'CELL.INF',$00,$00
SR_CELL_INF読み込み・登録(p1)
{
	d4 = SYSCALL_0294_Sfxvi_fopen(p1, "CELL.INF", "rb");
	if (d4 <= 0) return;

	XCLIB_fread(a6_mi000a, 10, 1, d4);

	d3 = a6_mi0004;	格納セル情報数(0~1024)
	d5 = a6_mi0002;	セル情報ブロックサイズ(50)

	if (d3 * d5 > 1024 * 50) {
		d3 = 0xc800 / d5 - 1;
	}

	a3 = p1->1f6e_xxxx;
	XCLIB_fread(p1->1f6e_xxxx, d0, 1, d4);
	XCLIB_fclose(d4);

	if (d3 <= 0) return;

	for (d4 = d3; d4 <= 0; d4--) {
		SYSCALL_014c_セル登録_情報(p1, *a3, *(a3+2));
		a3 += d5;
	}
}

SR_燃焼状態セル生成(p1)
{
	if (p1->0374_セル情報#105_CELL_燃_立 == 未定義セルデータ)
		SYSCALL_014c_セル登録_情報(p1, CELL_燃_立, p1->0284_セル情報#45_CELL_立衝撃0);
	if (p1->0374_セル情報#106_CELL_燃_座 == 未定義セルデータ)
		SYSCALL_014c_セル登録_情報(p1, CELL_燃_座, p1->0290_セル情報#48_CELL_座衝撃0);
	if (p1->0374_セル情報#107_CELL_燃_空 == 未定義セルデータ)
		SYSCALL_014c_セル登録_情報(p1, CELL_燃_空, p1->026c_セル情報#39_CELL_転倒);
}

L0140b0:
	movem.l	d3-d4,-(sp)
	move.l	($000c,sp),d4
	move.w	#$00ff,d3
L0140bc:
	pea.l	(L020046)
	movea.w	d3,a0
	move.l	a0,-(sp)
	move.l	d4,-(sp)
	jsr	(SYSCALL_0198_ヒット登録_情報)
	lea.l	($000c,sp),sp
	subq.w	#1,d3
	bpl	L0140bc
	movem.l	(sp)+,d3-d4
	rts

L0140dc:
	.dc.b	'HIT.INF',$00
SR_HIT_INF_読み込み・登録:
	link	a6,#-$000a
	movem.l	d3-d6/a3,-(sp)
	move.l	($0008,a6),d6
	pea.l	(L013e36)
	pea.l	(L0140dc)
	move.l	d6,-(sp)
	jsr	(SYSCALL_0294_Sfxvi_fopen)
	lea.l	($000c,sp),sp
	move.l	d0,d4
	ble	L014194
	move.l	d4,-(sp)
	pea.l	($0001)
	pea.l	($000a)
	pea.l	(-$000a,a6)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.w	(-$0004,a6),d3
	move.w	(-$0002,a6),d5
	move.w	d5,d0
	mulu.w	d3,d0
	cmp.l	#$00001200,d0
	ble	L014148
	move.w	#$1200,d3
	and.l	#$0000ffff,d3
	divu.w	d5,d3
	subq.w	#1,d3
L014148:
	movea.l	d6,a3
	adda.l	#$0000eb6e,a3
	move.l	d4,-(sp)
	pea.l	($0001)
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	move.w	d3,d4
	subq.w	#1,d4
	bmi	L014194
	moveq.l	#$00,d3
L014176:
	move.w	(a3),d0
	pea.l	($0002,a3)
	move.w	d0,d3
	move.l	d3,-(sp)
	move.l	d6,-(sp)
	jsr	(SYSCALL_0198_ヒット登録_情報)
	lea.l	($000c,sp),sp
	move.w	d5,d3
	adda.l	d3,a3
	subq.w	#1,d4
	bpl	L014176
L014194:
	movem.l	(-$001e,a6),d3-d6/a3
	unlk	a6
	rts

L01419e:
	.dc.b	'VOICE.SMP',$00
SR_VOICE_SMP読み込み・登録:
	link	a6,#-$043c
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a5
	move.b	($000b,a5),d2
	subq.b	#1,d2
	move.b	d2,(-$043b,a6)
	pea.l	(-$0100,a6)
	pea.l	(L01419e)
	move.l	a5,-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	clr.w	d0
	move.b	(-$043b,a6),d0
	move.w	d0,d3
	add.w	#$0032,d3
	cmp.w	#$00c7,d3
	bgt	L014204
L0141e6:
	pea.l	($0000)
	pea.l	($0000)
	movea.w	d3,a0
	move.l	a0,-(sp)
	jsr	(L017c6a)
	lea.l	($000c,sp),sp
	addq.w	#2,d3
	cmp.w	#$00c7,d3
	ble	L0141e6
L014204:
	pea.l	($0000)
	pea.l	($0000)
	clr.w	d0
	move.b	(-$043b,a6),d0
	add.w	#$00e6,d0
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L017c6a)
	lea.l	($000c,sp),sp
	moveq.l	#$00,d2
	move.l	d2,(-$011c,a6)
	pea.l	($0020)
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	pea.l	(-$0136,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	movea.l	(-$011c,a6),a4
	pea.l	(L013e36)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d7
	ble	L014324
	move.l	d7,-(sp)
	pea.l	($0001)
	pea.l	($0001)
	pea.l	(-$0137,a6)
	lea.l	(XCLIB_fread),a3
	jsr	(a3)
	lea.l	($0010,sp),sp
	subq.w	#1,a4
	pea.l	($0008,a4)
	move.l	a5,-(sp)
	jsr	(SR_Voiceデータメモリ確保)
	addq.w	#8,sp
	move.l	($174e,a5),d6
	move.l	d7,-(sp)
	pea.l	($0001)
	moveq.l	#$00,d0
	move.b	(-$0137,a6),d0
	move.l	d0,d1
	add.l	d1,d1
	movea.l	d1,a0
	pea.l	(a0,d0.l)
	move.l	a6,d3
	add.l	#$fffffbc8,d3
	move.l	d3,-(sp)
	jsr	(a3)
	lea.l	($0010,sp),sp
	moveq.l	#$00,d0
	move.b	(-$0137,a6),d0
	move.l	d0,d1
	add.l	d1,d1
	add.l	d0,d1
	suba.l	d1,a4
	movea.l	d3,a3
	moveq.l	#$00,d3
	move.b	(-$0137,a6),d3
	subq.w	#1,d3
	bmi	L014306
	moveq.l	#$00,d4
	clr.w	d5
L0142d2:
	move.b	(a3)+,d0
	move.b	(a3)+,(-$043a,a6)
	move.b	(a3)+,(-$0439,a6)
	move.w	(-$043a,a6),d4
	move.l	d4,-(sp)
	move.l	d6,-(sp)
	move.b	d0,d5
	clr.w	d0
	move.b	(-$043b,a6),d0
	add.w	d5,d0
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L017c6a)
	lea.l	($000c,sp),sp
	move.w	(-$043a,a6),d4
	add.l	d4,d6
	subq.w	#1,d3
	bpl	L0142d2
L014306:
	move.l	d7,-(sp)
	pea.l	($0001)
	move.l	a4,-(sp)
	move.l	($174e,a5),-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d7,-(sp)
	jsr	(XCLIB_fclose)
L014324:
	movem.l	(-$045c,a6),d3-d7/a3-a5
	unlk	a6
	rts

L01432e:
	.dc.b	'CHAR.ASP',$00,$00
L014338:
	.dc.b	'CHAR.CSP',$00,$00
L014342:
	.dc.b	'%s がありません',$00
L014352:
	.dc.b	'(LOAD_CHAR_CSP)',$00
SR_CHAR_ASP読み込み・登録:
	link	a6,#-$0200
	movem.l	d3-d4/a3,-(sp)
	movea.l	($0008,a6),a3
	move.w	($000e,a6),d4
	clr.w	($05d8,a3)
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	pea.l	(L01432e)
	move.l	a3,-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L019192)
	addq.w	#8,sp
	tst.l	d0
	bge	L014408
	tst.w	d4
	beq	L0143b2
	cmp.w	#$0002,d4
	beq	L0143b2
	cmp.w	#$0001,d4
	bne	L014408
L0143b2:
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	pea.l	(L014338)
	move.l	a3,-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(L019310)
	addq.w	#8,sp
	tst.l	d0
	bge	L014408
	move.l	d3,-(sp)
	pea.l	(L014342)
	move.l	a6,d3
	add.l	#$fffffe00,d3
	move.l	d3,-(sp)
	jsr	(XCLIB_sprintf)
	lea.l	($000c,sp),sp
	pea.l	(L014352)
	move.l	d3,-(sp)
	jsr	(SYSCALL_0264_システム異常終了)
L014408:
	movem.l	(-$020c,a6),d3-d4/a3
	unlk	a6
	rts

L014412:
	.dc.b	'CHAR.PAL',$00,$00
SR_CHAR_PAL読み込み・登録(p1)
{
	d3 = SYSCALL_0294_Sfxvi_fopen(p1, "CHAR.PAL", "rb");
	if (d3 <= 0) return;

	XCLIB_fread(p1->0034_キャラクターパレット_0, 384, 1, d3);		//384byte=12バレットブロック
	XCLIB_fclose(d3);

	// 全パレットブロックの先頭カラー(p1->0034～)を透明色に上書き ※ロジック省略
	
	if (p1->000a_プレイヤー番号 == 1) {
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0174_キャラクターパレット_10, 0x00e82280, 1);	// 0x00e82280 = スプライトパレット#4
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0074_キャラクターパレット_2, プレイヤー1_燃焼パレットデータ1, 1);
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0094_キャラクターパレット_3, プレイヤー1_燃焼パレットデータ2, 1);
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0194_キャラクターパレット_11, プレイヤー1_燃焼パレットデータ3, 1);
	} else {
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0174_キャラクターパレット_10, 0x00e822c0, 1);	// 0x00e82280 = スプライトパレット#6
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0074_キャラクターパレット_2, プレイヤー2_燃焼パレットデータ1, 1);
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0094_キャラクターパレット_3, プレイヤー2_燃焼パレットデータ2, 1);
		SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0194_キャラクターパレット_11, プレイヤー2_燃焼パレットデータ3, 1);
	}
}

L01454a:
	.dc.b	'MINI1.PAL',$00
L014554:
	.dc.b	'MINI2.PAL',$00
SR_MINI_PAL読み込み・登録(p1)
{
	if (p1->001a_同キャラ識別番号 == 1) {
		d3 = SYSCALL_0294_Sfxvi_fopen("MINI1.PAL", "rb");
	} else {
		d3 = SYSCALL_0294_Sfxvi_fopen("MINI2.PAL", "rb");
	}

	if (d3 == 0) {
		SYSCALL_0224_Dataクリア_メモリブロック(32, a6_mi0020, 1);
	} else {
		XCLIB_fread(a6_mi0020, 32, 1, d3);
		XCLIB_fclose(d3);
	}

	a6_mi0020[0] = 0;	// 先頭カラーを透明色に上書き
	if (p1->000a_プレイヤー番号 == 1) {
		SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0020, 0x00e82320, 1);	// パレットブロック#9
	} else {
		SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0020, 0x00e823c0, 1);	// パレットブロック#14
	}
}

L014610:
	.dc.b	'MINI1.SP',$00,$00
L01461a:
	.dc.b	'MINI2.SP',$00,$00
SR_MINI_SP_読み込み・登録(p1)
{
	if (L06f44a == 0x0100) return;

	if (p1->001a_同キャラ識別番号 == 1) {
		d3 = SYSCALL_0294_Sfxvi_fopen("MINI1.SP", "rb");
	} else {
		d3 = SYSCALL_0294_Sfxvi_fopen("MINI2.SP", "rb");
	}

	if (d3 == 0) {
		SYSCALL_0224_Dataクリア_メモリブロック(32, a6_mi0200, 16);	// 512byte
	} else {
		XCLIB_fread(a6_mi0200, 512, 1, d3);
		XCLIB_fclose(d3);
	}

	// 1pのときPCG#56、2pのときPCG#60
	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0200, p1->000a_プレイヤー番号 == 1 ? 0x00eb9c00 : 0x00eb9e00, 16);p1=56
}

L0146de:
	.dc.b	'PCG.SP',$00,$00
SR_PCG_SP_読み込み・登録(p1)
{
	if (L06f44a == 0x0100) return;

	d3 = SYSCALL_0294_Sfxvi_fopen("PCG.SP", "rb");
	if (d3 == 0) {
		SYSCALL_0224_Dataクリア_メモリブロック(32, a6_mi0400, 32);	// 1024byte
	} else {
		XCLIB_fread(a6_mi0400, 1024, 1, d3);
		XCLIB_fclose(d3);
	}

	// 1pのときPCG#32 /2pのときPCG#40
	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0400, p1->000a_プレイヤー番号 == 1 ? 0x00eb9000 : 0x00eb9400, 32);
}

L01478a:
	.dc.b	'NAME.SP',$00
SR_NAME_SP_読み込み・登録:
	movem.l	d3-d4,-(sp)
	move.l	($000c,sp),d3		;p1
	movea.w	($0012,sp),a0		;セレクト番号

	d4 = L0090b6(セレクト番号);
	if (d4 == 0) return;

	d3 = SYSCALL_0294_Sfxvi_fopen(p1, "NAME.SP", "rb");
	if (d3 == 0) {
		SYSCALL_0224_Dataクリア_メモリブロック(32, d4, 16);
		return;
	}

	XCLIB_fread(d4, 512, 1, d3);
	XCLIB_fclose(d3);
}

L014804:
	movem.l	d3/a3,-(sp)
	move.w	($000e,sp),d3

	if (SFSYSINFO_0474_場面_エンディング != 1) {
		SYSCALL_01f8_Bgm制御_停止();
	
		if (MMP_SYS_0073_STAGE_ＢＧＭフリー)
			MMP_SYS_0073_STAGE_ＢＧＭフリー();
		}
	}

	if (d3 == 10) {
		a3 = &SFSYSINFO_008a_xxxx;
	} else if (d3 == 11) {
		a3 = &SFSYSINFO_008e_xxxx;
	} else {
		return;
	}
	
	if (a3 == 0)
		return;

	doscall_mfree(a3);
	a3 = 0;
}

L014860:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.w	($000e,sp),d0
	bne	L014886
	tst.w	($0004,a3)
	beq	L01490c
	SR_キャラ動作関数実行(p1, OPT_フリー);

	move.l	(a3),-(sp)
	bra	L014900
L014886:
	cmp.w	#$0001,d0
	bne	L0148a8
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(SFSYSINFO_007a_セル前面表示フラグ),a0
	asl.l	#2,d0
	move.l	(a0,d0.l),-(sp)
	jsr	(doscall_mfree)
	addq.w	#4,sp
	bra	L01490c
L0148a8:
	cmp.w	#$0064,d0
	bne	L01490c
	tst.w	($0004,a3)
	beq	L01490c
	if (MMP_SYS_0251_SYS_CTRL_クローズ)
		MMP_SYS_0251_CTRL_クローズ(WORK_3P_0000, WORK_4P_0000);

L0148d4:
	SR_ラスター割込み設定解除();
	if (MMP_SYS_0254_CTRL_フリー)
		MMP_SYS_0254_CTRL_フリー(WORK_3P_0000, WORK_4P_0000);

L0148fa:
	move.l	(SFSYSINFO_0086_xxxx),-(sp)
L014900:
	jsr	(doscall_mfree)
	addq.w	#4,sp
	clr.w	($0004,a3)
L01490c:
	movea.l	(sp)+,a3
	rts

L014910:
	move.l	($0004,sp),-(sp)
	jsr	(SR_Voiceデータメモリ解放)
	addq.w	#4,sp
	rts

L01491e:
	move.l	($0004,sp),-(sp)
	jsr	(SR_CharAspデータメモリ解放)
	addq.w	#4,sp
	rts

L01492c:
	.dc.b	'PCG.PAL',$00
L014934:
	.dc.b	'(LOAD_PCG_PAL)',$00,$00
L014944:
	.dc.b	'PCG.PAL がありません',$00,$00
SR_システムPCG_PAL読み込み・登録()
{
	d4 = SYSCALL_0294_Sfxvi_fopen(-1, "PCG.PAL", "rb");
	if (d4 == 0)
		SYSCALL_0264_システム異常終了("PCG.PAL がありません", "(LOAD_PCG_PAL)");

	XCLIB_fread(a6_mi00a0, 160, 1, d4);
	XCLIB_fclose(d4);

	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi00a0, 0x00e82360, 5);
}

L0149dc:
	.dc.b	'(LOAD_SYS_PCG_SP)',$00
L0149ee:
	.dc.b	'SYSTEM/PCG.SP がありません',$00,$00
L014a0a()
{
	d4 = SYSCALL_0294_Sfxvi_fopen(-1, "PCG.SP", "rb")
	if (d4 == 0)
		SYSCALL_0264_システム異常終了("SYSTEM/PCG.SP がありません", "(LOAD_SYS_PCG_SP)");

L014a44:
	XCLIB_fread(a6_mi0c00, 0x0c00, 1, d4);
	XCLIB_fclose(d4);

	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0c00, 0x00eb8000, 96);
}

L014a8c:
	.dc.b	'PCG2.SP',$00
L014a94:
	.dc.b	'(LOAD_SYS_PCG2_SP)',$00,$00
L014aa8:
	.dc.b	'SYSTEM/PCG2.SP がありません',$00
L014ac4:
	.dc.b	'SUPER.PAL',$00
L014ace:
	.dc.b	'(LOAD_SYS_CONCENT_PAL)',$00,$00
L014ae6:
	.dc.b	'SYSTEM/SUPER.PAL がありません',$00
SR_システムPCG2_SP読み込み・登録()
{
	d4 = SYSCALL_0294_Sfxvi_fopen(-1, "PCG2.SP", "rb")
	if (d4 == 0)
		SYSCALL_0264_システム異常終了("SYSTEM/PCG2.SP がありません", "(LOAD_SYS_PCG2_SP)");

	XCLIB_fread(a6_mi0a80, 0x0a80, 1, d4);
	XCLIB_fclose(d4);

	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi0a80, 0x00ebf000, 84);

	d0 = SYSCALL_00dc_ファイル読み込み(-1, "SUPER.PAL", 32, L06dc02);
	if (d0 == 0)
		SYSCALL_0264_システム異常終了("SYSTEM/SUPER.PAL がありません", "(LOAD_SYS_CONCENT_PAL)");
}

L014bbe:
	.dc.b	'PCG3.SP',$00
L014bc6:
	.dc.b	'(LOAD_SYS_PCG3_SP)',$00,$00
L014bda:
	.dc.b	'SYSTEM/PCG3.SP がありません',$00
SR_システムPCG3_SP読み込み・登録()
{
	d4 = SYSCALL_0294_Sfxvi_fopen(-1, "PCG3.SP", "rb");
	if (d4 == 0)
		(SYSCALL_0264_システム異常終了("SYSTEM/PCG3.SP がありません", "(LOAD_SYS_PCG3_SP)");

	XCLIB_fread(a6_mi1800, 0x1800, 1, d4);
	XCLIB_fclose(d4);

	SYSCALL_0220_Dataコピー_メモリブロック(32, a6_mi1800, 0x00eb8000, 192);
}

L014c78:
	.dc.b	'MESS.SP',$00
L014c80:
	.dc.b	'(LOAD_SYS_MESS_SP)',$00,$00
L014c94:
	.dc.b	'SYSTEM/MESS.SP がありません',$00
SR_システムMESS_SP読み込み・登録()
{
	d3 = SYSCALL_0294_Sfxvi_fopen(-1, "MESS.SP", "rb");
	if (d3 == 0)
		SYSCALL_0264_システム異常終了("SYSTEM/MESS.SP がありません", "(LOAD_SYS_MESS_SP)");

	XCLIB_fread(MESS_SP_PCGデータ格納領域, 0x1400, 1, d3);
	XCLIB_fclose(d3);
}

L014d0c:
	.dc.b	'SYSTEM/VOICE.SMP',$00,$00
L014d1e:
	.dc.b	'(ALLOC_SYS_VOICE)',$00
L014d30:
	.dc.b	'メモリが不足しています',$00,$00
L014d48:
	.dc.b	'(LOAD_SYS_VOICE_SMP)',$00,$00
L014d5e:
	.dc.b	'VOICE.SMP がありません',$00,$00
SR_システムVOICE_SMP読み込み・登録:
	link	a6,#-$033a
	movem.l	d3-d7/a3-a4,-(sp)

	a6_mi031e = 0;
	doscall_files(a6_mi0338, "SYSTEM/VOICE.SMP", 32);

	d7 = SYSCALL_025c_Data確保_メモリブロック(a6_mi031e+2);
	if (d7 == 0)
		SYSCALL_0264_システム異常終了("メモリが不足しています", "(ALLOC_SYS_VOICE)");

	d6 = SYSCALL_0294_Sfxvi_fopen(-1, "VOICE.SMP", "rb");
	if (d6 == 0)
		SYSCALL_0264_システム異常終了("VOICE.SMP がありません", "(LOAD_SYS_VOICE_SMP)");

L014df8:
	XCLIB_fread(a6_mi0339, 1, 1, d6);
	a6_mi031e--;

	XCLIB_fread(a6_mi0300, a6_mi0339 * 3, 1, d6);

	moveq.l	#$00,d0
	move.b	(-$0339,a6),d0
	move.l	d0,d1
	add.l	d1,d1
	add.l	d0,d1
	suba.l	d1,a4
	movea.l	d3,a3
	tst.b	(-$0339,a6)
	beq	L014e82
	moveq.l	#$00,d3
	clr.w	d4
L014e54:
	move.b	(a3)+,d0
	move.b	(a3)+,(-$0302,a6)
	move.b	(a3)+,(-$0301,a6)
	move.w	(-$0302,a6),d3
	move.l	d3,-(sp)
	move.l	d5,-(sp)
	move.b	d0,d4
	movea.w	d4,a0
	move.l	a0,-(sp)
	jsr	(L017c6a)
	lea.l	($000c,sp),sp
	move.w	(-$0302,a6),d3
	add.l	d3,d5
	subq.b	#1,(-$0339,a6)
	bne	L014e54
L014e82:
	move.l	d6,-(sp)
	pea.l	($0001)
	move.l	a4,-(sp)
	move.l	d7,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d6,-(sp)
	jsr	(XCLIB_fclose)
	movem.l	(-$0356,a6),d3-d7/a3-a4
	unlk	a6
	rts

L014ea8:
	cmpi.w	#$0100,(L06f44a)
	bne	L014ec4
	lea.l	(L06ad66),a0
	move.l	(a0),(L06f432)
	beq	L014ec4
	movea.l	(a0),a0
	jsr	(a0)
L014ec4:
	rts

L014ec6:
	movem.l	a3-a4,-(sp)
	movea.l	($000c,sp),a0
	movea.l	($0010,sp),a3
	move.l	($174a,a0),($174a,a3)
	move.l	($174e,a0),($174e,a3)
	pea.l	($000c)
	pea.l	($0034,a3)
	pea.l	($0034,a0)
	pea.l	($0020)
	lea.l	(SYSCALL_0220_Dataコピー_メモリブロック),a4
	jsr	(a4)				;SYSCALL_0220_Dataコピー_メモリブロック(32, p1->0x0034_xxxx, p2->0x0034_xxxx, 12);	//p1の0x0034からp2の0x0034に384バイト分コピー
	lea.l	($0010,sp),sp
	cmpi.w	#$0001,($000a,a3)
	bne	L014f1a
	pea.l	($0020)			;p2がプレイヤー番号1の時
	move.l	#$00eb9000,-(sp)	;PCG #32
	move.l	#$00eb9400,-(sp)	;PCG #48
	pea.l	($0020)
	jsr	(a4)				;SYSCALL_0220_Dataコピー_メモリブロック(32, PCG#48, PCG#32, 32);	//PCG#48から8個分をPCG#32にコピー
	bra	L014f34
L014f1a:
	pea.l	($0020)			;p1がプレイヤー番号1の時
	move.l	#$00eb9400,-(sp)
	move.l	#$00eb9000,-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)				;SYSCALL_0220_Dataコピー_メモリブロック(32, PCG#32, PCG#48, 32);	//PCG#32から8個分をPCG#48にコピー
L014f34:
	lea.l	($0010,sp),sp
	movem.l	(sp)+,a3-a4
	rts

L014f3e:
	.dc.b	'./%s',$00,$00
L014f44:
	.dc.b	$72,$62,$00,$00
L014f48:
	.dc.b	'(ALLOC_CNF_BUFF)',$00,$00
L014f5a:
	.dc.b	'メモリが不足しています',$00,$00
SYSCALL_01b0_Cnf登録_キャラクタ・ステージ・システム:
	link	a6,#-$0136
	movem.l	d3-d5/a3-a5,-(sp)
	movea.l	($0008,a6),a4
	move.l	($0010,a6),d1
	move.w	($0016,a6),d0
	movea.l	($000c,a6),a2
	clr.w	($0004,a2)
	tst.w	d0
	bne	L014fa2
	pea.l	(-$0136,a6)
	move.l	d1,-(sp)
	move.l	a4,-(sp)
	jsr	(L008c7e)
	bra	L014fd0
L014fa2:
	cmp.w	#$0001,d0
	bne	L014fbe
	pea.l	(-$0136,a6)
	move.l	d1,-(sp)
	movea.w	(SFSYSINFO_0016_ステージ番号),a2
	move.l	a2,-(sp)
	jsr	(SR_ステージデータファイルパス構築)
	bra	L014fd0
L014fbe:
	move.l	d1,-(sp)
	pea.l	(L014f3e)
	pea.l	(-$0136,a6)
	jsr	(XCLIB_sprintf)
L014fd0:
	lea.l	($000c,sp),sp
	moveq.l	#$00,d2
	move.l	d2,(-$001c,a6)
	pea.l	($0020)
	move.l	a6,d3
	add.l	#$fffffeca,d3
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	pea.l	(L014f44)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d3
	bgt	L015010
	moveq.l	#$00,d0
	bra	L01520a
L015010:
	cmpi.l	#$00001fff,(-$001c,a6)
	bls	L015022
	move.l	#$00001fff,(-$001c,a6)
L015022:
	move.l	(-$001c,a6),-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d5
	bne	L015046
	pea.l	(L014f48)
	pea.l	(L014f5a)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L015046:
	move.l	d3,-(sp)
	pea.l	($0001)
	move.l	(-$001c,a6),-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	movea.l	d5,a3
	move.l	(-$001c,a6),d0
	move.b	#$0a,(-$01,a3,d0.l)
	move.l	(-$001c,a6),d0
	move.b	#$23,(a3,d0.l)
	move.l	(-$001c,a6),d0
	move.b	#$0a,($01,a3,d0.l)
	move.l	(-$001c,a6),d0
	clr.b	($02,a3,d0.l)
	move.l	(-$001c,a6),d0
	clr.b	($03,a3,d0.l)
	tst.l	($175c,a4)
	bne	L0150b2
	move.l	($000c,a6),($175c,a4)
	adda.l	#$0000fd9c,a4
	movea.l	($000c,a6),a2
	move.l	a4,($0006,a2)
	bra	L0150dc
L0150b2:
	movea.l	($175c,a4),a1
	tst.l	($000a,a1)
	beq	L0150c6
L0150bc:
	movea.l	($000a,a1),a1
	tst.l	($000a,a1)
	bne	L0150bc
L0150c6:
	move.l	($000c,a6),($000a,a1)
	movea.w	($0002,a1),a0
	adda.l	($0006,a1),a0
	movea.l	($000c,a6),a2
	move.l	a0,($0006,a2)
L0150dc:
	movea.l	($000c,a6),a2
	clr.w	(a2)
	clr.w	($0002,a2)
	moveq.l	#$00,d2
	move.l	d2,($000a,a2)
	movea.l	($0006,a2),a4
L0150f0:
	cmpi.b	#$0a,(a3)
	beq	L0151f6
	tst.b	(a3)
	beq	L0151f6
	cmpi.b	#$23,(a3)
	bne	L015122
	cmpi.b	#$0a,(a3)
	beq	L015112
L01510a:
	addq.w	#1,a3
	cmpi.b	#$0a,(a3)
	bne	L01510a
L015112:
	cmpi.b	#$0a,(a3)
	bne	L0150f0
L015118:
	addq.w	#1,a3
	cmpi.b	#$0a,(a3)
	beq	L015118
	bra	L0150f0
L015122:
	cmpi.b	#$0d,(a3)
	bne	L01512c
	addq.w	#1,a3
	bra	L0150f0
L01512c:
	movea.l	a4,a5
	moveq.l	#$00,d4
	lea.l	($0004,a5),a4
	moveq.l	#$04,d3
	move.l	a3,d0
	cmpi.b	#$3d,(a3)
	beq	L01517a
L01513e:
	addq.w	#1,a3
	cmpi.b	#$3d,(a3)
	bne	L01513e
	bra	L01517a
L015148:
	cmpi.b	#$3b,(a3)
	beq	L0151d6
	tst.b	(a3)
	beq	L0151d6
	addq.w	#1,d4
	move.l	a3,d0
	cmpi.b	#$2c,(a3)
	beq	L015174
L015160:
	cmpi.b	#$3b,(a3)
	beq	L015174
	cmpi.b	#$0a,(a3)
	beq	L015174
	addq.w	#1,a3
	cmpi.b	#$2c,(a3)
	bne	L015160
L015174:
	cmpi.b	#$2c,(a3)
	bne	L01517e
L01517a:
	clr.b	(a3)+
	bra	L015198
L01517e:
	cmpi.b	#$3b,(a3)
	bne	L015196
	clr.b	(a3)+
	cmpi.b	#$0a,(a3)
	beq	L015198
L01518c:
	addq.w	#1,a3
	cmpi.b	#$0a,(a3)
	bne	L01518c
	bra	L015198
L015196:
	clr.b	(a3)
L015198:
	move.l	d0,-(sp)
	move.l	a4,-(sp)
	jsr	(XCLIB_strcpy)
	addq.w	#8,sp
	move.l	a4,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	movea.w	d0,a0
	addq.w	#1,a0
	move.w	a0,d0
	bge	L0151b8
	addq.w	#1,d0
L0151b8:
	and.w	#$fffe,d0
	move.w	a0,d2
	sub.w	d0,d2
	move.w	d2,d0
	beq	L0151ca
	clr.b	(a4,a0.w)
	addq.w	#1,a0
L0151ca:
	adda.w	a0,a4
	add.w	a0,d3
	cmpi.b	#$0a,(a3)
	bne	L015148
L0151d6:
	cmpi.b	#$0a,(a3)
	beq	L0151e0
	tst.b	(a3)
	bne	L0151e2
L0151e0:
	addq.w	#1,a3
L0151e2:
	move.w	d3,(a5)
	move.w	d4,($0002,a5)
	movea.l	($000c,a6),a2
	add.w	d3,($0002,a2)
	addq.w	#1,(a2)
	bra	L0150f0
L0151f6:
	movea.l	($000c,a6),a2
	move.w	#$0001,($0004,a2)
	move.l	d5,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	moveq.l	#$01,d0
L01520a:
	movem.l	(-$014e,a6),d3-d5/a3-a5
	unlk	a6
	rts

L015214:
	.dc.b	$00,$00
SYSCALL_01b4_Cnf取得_文字列:
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0014,sp),a0
	move.l	($0018,sp),d5
	move.w	($001e,sp),d4
	cmpa.w	#$0000,a0
	beq	L015272
	movea.l	($0006,a0),a3
	move.w	(a0),d3
	subq.w	#1,d3
	bmi	L015272
L015236:
	move.l	d5,-(sp)
	pea.l	($0004,a3)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L01526c
	addq.w	#2,a3
	cmp.w	(a3),d4
	bge	L015272
	addq.w	#2,a3
	tst.w	d4
	blt	L015268
	bra	L015258
L015256:
	addq.w	#1,a3
L015258:
	tst.b	(a3)
	bne	L015256
	bne	L015264
L01525e:
	addq.w	#1,a3
	tst.b	(a3)
	beq	L01525e
L015264:
	subq.w	#1,d4
	bpl	L015258
L015268:
	move.l	a3,d0
	bra	L015278
L01526c:
	adda.w	(a3),a3
	subq.w	#1,d3
	bpl	L015236
L015272:
	move.l	#L015214,d0
L015278:
	movem.l	(sp)+,d3-d5/a3
	rts

SYSCALL_01b8_Cnf取得_整数:
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0014,sp),a0
	move.l	($0018,sp),d5
	move.w	($001e,sp),d4
	cmpa.w	#$0000,a0
	beq	L0152e2
	movea.l	($0006,a0),a3
	move.w	(a0),d3
	subq.w	#1,d3
	bmi	L0152e2
L01529e:
	move.l	d5,-(sp)
	pea.l	($0004,a3)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L0152dc
	addq.w	#2,a3
	cmp.w	(a3),d4
	bge	L0152e2
	addq.w	#2,a3
	tst.w	d4
	blt	L0152d0
	bra	L0152c0
L0152be:
	addq.w	#1,a3
L0152c0:
	tst.b	(a3)
	bne	L0152be
	bne	L0152cc
L0152c6:
	addq.w	#1,a3
	tst.b	(a3)
	beq	L0152c6
L0152cc:
	subq.w	#1,d4
	bpl	L0152c0
L0152d0:
	move.l	a3,-(sp)
	jsr	(L01daac)
	addq.w	#4,sp
	bra	L0152e4
L0152dc:
	adda.w	(a3),a3
	subq.w	#1,d3
	bpl	L01529e
L0152e2:
	moveq.l	#$ff,d0
L0152e4:
	movem.l	(sp)+,d3-d5/a3
	rts

SYSCALL_01bc_Cnf取得_存在:
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0014,sp),a0
	move.l	($0018,sp),d5
	move.w	($001e,sp),d3
	cmpa.w	#$0000,a0
	beq	L015354
	movea.l	($0006,a0),a3
	move.w	(a0),d4
	subq.w	#1,d4
	bmi	L015354
L01530a:
	move.l	d5,-(sp)
	pea.l	($0004,a3)
	jsr	(L01dafc)
	addq.w	#8,sp
	tst.l	d0
	bne	L01534e
	addq.w	#2,a3
	cmp.w	(a3),d3
	bge	L015354
	addq.w	#2,a3
	tst.w	d3
	blt	L01533c
	bra	L01532c
L01532a:
	addq.w	#1,a3
L01532c:
	tst.b	(a3)
	bne	L01532a
	bne	L015338
L015332:
	addq.w	#1,a3
	tst.b	(a3)
	beq	L015332
L015338:
	subq.w	#1,d3
	bpl	L01532c
L01533c:
	move.l	a3,-(sp)
	jsr	(XCLIB_strlen)
	addq.w	#4,sp
	tst.l	d0
	beq	L01534e
	moveq.l	#$01,d0
	bra	L015356
L01534e:
	adda.w	(a3),a3
	subq.w	#1,d4
	bpl	L01530a
L015354:
	moveq.l	#$00,d0
L015356:
	movem.l	(sp)+,d3-d5/a3
	rts

L01535c:
	.dc.b	'CPU_立ち技キャンセル率',$00,$00
L015374:
	.dc.b	'CPU_座り技キャンセル率',$00,$00
L01538c:
	.dc.b	'CPU_必殺技小率',$00,$00
L01539c:
	.dc.b	'CPU_対気絶動作',$00,$00
L0153ac:
	.dc.b	'CPU_対座り動作',$00,$00
L0153bc:
	.dc.b	'CPU_対Ｓ動作_近',$00
L0153cc:
	.dc.b	'CPU_対Ｓ動作_遠',$00
L0153dc:
	.dc.b	'CPU_対空動作_近',$00
L0153ec:
	.dc.b	'CPU_対空動作_中',$00
L0153fc:
	.dc.b	'CPU_攻撃座り率',$00,$00
L01540c:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a0
	movea.l	($0a82,a0),a3
	move.l	($175c,a0),d3
	beq	L015aa6
	pea.l	($0000)
	pea.l	(L01535c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01545e
	pea.l	($0000)
	pea.l	(L01535c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,(a3)
L01545e:
	pea.l	($0001)
	pea.l	(L01535c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01549e
	pea.l	($0001)
	pea.l	(L01535c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0002,a3)
L01549e:
	pea.l	($0000)
	pea.l	(L015374)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0154de
	pea.l	($0000)
	pea.l	(L015374)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0004,a3)
L0154de:
	pea.l	($0001)
	pea.l	(L015374)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01551e
	pea.l	($0001)
	pea.l	(L015374)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0006,a3)
L01551e:
	pea.l	($0000)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01555e
	pea.l	($0000)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($002e,a3)
L01555e:
	pea.l	($0001)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01559e
	pea.l	($0001)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0030,a3)
L01559e:
	pea.l	($0002)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0155de
	pea.l	($0002)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0032,a3)
L0155de:
	pea.l	($0003)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01561e
	pea.l	($0003)
	pea.l	(L01538c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0034,a3)
L01561e:
	pea.l	($0000)
	pea.l	(L01539c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015658
	pea.l	($0000)
	pea.l	(L01539c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0008,a3)
L015658:
	pea.l	($0001)
	pea.l	(L01539c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015696
	pea.l	($0001)
	pea.l	(L01539c)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($000a,a3)
L015696:
	pea.l	($0000)
	pea.l	(L0153ac)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0156d0
	pea.l	($0000)
	pea.l	(L0153ac)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($000c,a3)
L0156d0:
	pea.l	($0001)
	pea.l	(L0153ac)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L01570e
	pea.l	($0001)
	pea.l	(L0153ac)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($000e,a3)
L01570e:
	pea.l	($0000)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015748
	pea.l	($0000)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0010,a3)
L015748:
	pea.l	($0001)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015786
	pea.l	($0001)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($0012,a3)
L015786:
	pea.l	($0002)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0157c0
	pea.l	($0002)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0014,a3)
L0157c0:
	pea.l	($0003)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0157fe
	pea.l	($0003)
	pea.l	(L0153bc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($0016,a3)
L0157fe:
	pea.l	($0000)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015838
	pea.l	($0000)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0018,a3)
L015838:
	pea.l	($0001)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015876
	pea.l	($0001)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($001a,a3)
L015876:
	pea.l	($0002)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0158b0
	pea.l	($0002)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($001c,a3)
L0158b0:
	pea.l	($0003)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0158ee
	pea.l	($0003)
	pea.l	(L0153cc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($001e,a3)
L0158ee:
	pea.l	($0000)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015928
	pea.l	($0000)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0020,a3)
L015928:
	pea.l	($0001)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015966
	pea.l	($0001)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($0022,a3)
L015966:
	pea.l	($0002)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0159aa
	pea.l	($0002)
	pea.l	(L0153dc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	movea.w	#$0064,a1
	suba.w	d0,a1
	move.l	a1,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($0024,a3)
L0159aa:
	pea.l	($0000)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L0159e4
	pea.l	($0000)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	movea.l	d0,a0
	move.b	(a0),d1
	ext.w	d1
	move.w	d1,($0026,a3)
L0159e4:
	pea.l	($0001)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015a22
	pea.l	($0001)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b4_Cnf取得_文字列)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L015aee)
	addq.w	#4,sp
	move.w	d0,($0028,a3)
L015a22:
	pea.l	($0002)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015a66
	pea.l	($0002)
	pea.l	(L0153ec)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	movea.w	#$0064,a1
	suba.w	d0,a1
	move.l	a1,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($002a,a3)
L015a66:
	pea.l	($0000)
	pea.l	(L0153fc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01bc_Cnf取得_存在)
	lea.l	($000c,sp),sp
	tst.w	d0
	beq	L015aa6
	pea.l	($0000)
	pea.l	(L0153fc)
	move.l	d3,-(sp)
	jsr	(SYSCALL_01b8_Cnf取得_整数)
	lea.l	($000c,sp),sp
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(L015aac)
	addq.w	#4,sp
	move.w	d0,($002c,a3)
L015aa6:
	movem.l	(sp)+,d3/a3
	rts

L015aac:
	movea.w	($0006,sp),a0
	move.l	a0,-(sp)
	pea.l	($7fff)
	jsr	(SR_32bit乗算)
	addq.w	#8,sp
	pea.l	($0064)
	move.l	d0,-(sp)
	jsr	(XCLIB_32bit符号付整数除算)
	addq.w	#8,sp
	cmp.l	#$00007fff,d0
	ble	L015adc
	move.l	#$00007fff,d0
	bra	L015ae2
L015adc:
	tst.l	d0
	bge	L015ae2
	moveq.l	#$00,d0
L015ae2:
	ext.l	d0
	rts

L015ae6:
	.dc.b	$8f,$ac,$00,$00
L015aea:
	.dc.b	$91,$e5,$00,$00
L015aee:
	move.l	d3,-(sp)
	move.l	($0008,sp),d3
	pea.l	($0002)
	pea.l	(L015ae6)
	move.l	d3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L015b12
	moveq.l	#$00,d0
	bra	L015b32
L015b12:
	pea.l	($0002)
	pea.l	(L015aea)
	move.l	d3,-(sp)
	jsr	(L01dc3c)
	lea.l	($000c,sp),sp
	tst.l	d0
	bne	L015b30
	moveq.l	#$01,d0
	bra	L015b32
L015b30:
	moveq.l	#$02,d0
L015b32:
	move.l	(sp)+,d3
	rts

L015b36:
	movea.l	($0004,sp),a1
	cmpi.w	#$0001,($000a,a1)
	bne	L015b52
	move.l	#L07157a,($0f08,a1)
	lea.l	(L07157a),a0
	bra	L015b60
L015b52:
	move.l	#L0715d6,($0f08,a1)
	lea.l	(L0715d6),a0
L015b60:
	move.l	a1,(a0)
	move.l	#L016ebe,($0004,a0)
	moveq.l	#$00,d0
	move.l	d0,($0022,a0)
	move.l	d0,($0034,a0)
	move.l	d0,($0038,a0)
	rts

L015b7a:
	movea.l	($0004,sp),a2
	move.l	($0008,sp),d0
	movea.l	($0f08,a2),a0
	cmpa.w	#$0000,a0
	beq	L015bae
	movea.l	($0004,a0),a1
	cmpa.w	#$0000,a1
	beq	L015bae
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	move.l	a0,-(sp)
	move.l	d0,-(sp)
	move.l	a2,-(sp)
	jsr	(a1)
	lea.l	($0018,sp),sp
L015bae:
	rts

SR_SHOT実行_CMD状態変化・表示:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a4
	movea.l	($0014,sp),a5

	if (!p1->0x0ac2_気集中 && !p2->0x0ac2_気集中) {
		SR_SHOT実行(p1, p2, SHOT_CMD_状態変化, 0, 0, 1);
		SR_SHOT実行(p2, p1, SHOT_CMD_状態変化, 0, 0, 1);
	}

	if (SFSYSINFO_001e_デバッグモード有効フラグ && SFSYSINFO_004a_デバッグ_矩形表示有効_xxxx &&p1->0x000a_プレイヤー番号 == 1 ? L01fefa : L01fefe) {
		SR_SHOT当たり判定矩形表示(p2);
		SR_SHOT当たり判定矩形表示(p1);
	} else {
		SR_SHOT実行(p1, p2, SHOT_CMD_表示, 0, 0, 0);
		SR_SHOT実行(p2, p1, SHOT_CMD_表示, 0, 0, 0);
	}

	SR_SHOT攻撃フラグ判定(p1);
	SR_SHOT攻撃フラグ判定(p2);

	movem.l	(sp)+,a3-a5
	rts

L015c8c(p1, p2)
{
	if (p1->0a4c_xxxx) {
		a0 = p1->0f08_SHOT標準ハンドラ;
		if (a0->000c_state == 0) {
			SYSCALL_00a8_Shot送信コマンド(p1, a0, SHOT_CMD_有効化, 0, 0);
		} else if (p1->0a4e_xxxx == 1) {
			SYSCALL_00a8_Shot送信コマンド(p1, a0, SHOT_CMD_消滅, 0, 0);
		}
	} else {
		a0 = p1->0f08_SHOT標準ハンドラ;
		if (a0->state && a0->0004_proc == L016ebe)
			SYSCALL_00a8_Shot送信_コマンド(p1, a0, SHOT_CMD_無効化, 0, 0);
	}

	if (p2->0a4c_xxxx) {
		a0 = p2->0f08_SHOT標準ハンドラ;
		if (a0->000c_state == 0) {
			SYSCALL_00a8_Shot送信コマンド(p2, a0, SHOT_CMD_有効化, 0, 0);
		} else if (p2->0a4e_xxxx == 1) {
			SYSCALL_00a8_Shot送信コマンド(p2, a0, SHOT_CMD_消滅, 0, 0);
		}
	} else {
		a0 = p2->0f08_SHOT標準ハンドラ;
		if (a0->000c_state && a0->0004_proc == L016ebe)
			SYSCALL_00a8_Shot送信_コマンド(p2, a0, SHOT_CMD_無効化, 0, 0);
	}

	SR_SHOT対SHOTヒットチェック(p1, p2);
	SR_SHOT対SHOTヒットチェック(p2, p1);
	L0162e6(p1, p2);
	L0162e6(p2, p1);
}

SR_SHOT実行:
	movem.l	d3-d4/a3-a6,-(sp)
	move.l	($001c,sp),d3				;d3=o1
	move.l	($0020,sp),d4				;d4=p2
	move.w	($0026,sp),d2				;a2=shot_cmd
	move.w	($002a,sp),d1				;d1=param1
	move.w	($002e,sp),d0				;d0=param2
	movea.l	d3,a1
	movea.l	($0f08,a1),a3				;a3=SHOT標準ハンドラ
	tst.w	($0032,sp)
	beq	L015dc8
	tst.w	(SFSYSINFO_0078_ヒットストップ)
	beq	L015dc8
	tst.w	($0a5a,a1)
	bne	L015e20
	movea.l	d4,a1
	tst.w	($0a5a,a1)
	bne	L015e20
L015dc8:
	cmpa.w	#$0000,a3
	beq	L015e76
	movea.w	d0,a6
	movea.w	d1,a5
	movea.w	d2,a4
L015dd6:
	tst.w	($000c,a3)					;shot->state
	beq	L015e14
	moveq.l	#$00,d0
	movea.l	($0004,a3),a0				;a0=shot->proc
	cmpa.w	#$0000,a0
	beq	L015dfa
	move.l	a6,-(sp)					;param2
	move.l	a5,-(sp)					;param1
	move.l	a4,-(sp)					;shot_cmd
	move.l	a3,-(sp)					;shot
	move.l	d4,-(sp)					;p2
	move.l	d3,-(sp)					;p1
	jsr	(a0)
	lea.l	($0018,sp),sp
L015dfa:
	tst.w	d0
	bne	L015e14
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(SR_標準SHOT関数)
	lea.l	($0018,sp),sp
L015e14:
	movea.l	($0038,a3),a3				;shot->ptr_next
	cmpa.w	#$0000,a3
	bne	L015dd6							;shotリストの末尾でなければもう一度
	bra	L015e76							;終了
L015e20:
	cmpa.w	#$0000,a3
	beq	L015e76
	movea.w	d0,a6
	movea.w	d1,a5
	movea.w	d2,a4
L015e2c:
	cmpi.w	#$ffff,($000c,a3)			;shot->state がSHOT_STATE_消滅か？
	bne	L015e6c
	moveq.l	#$00,d0
	movea.l	($0004,a3),a0				;a0=shot->proc
	cmpa.w	#$0000,a0
	beq	L015e52
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a0)
	lea.l	($0018,sp),sp
L015e52:
	tst.w	d0
	bne	L015e6c
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(SR_標準SHOT関数)
	lea.l	($0018,sp),sp
L015e6c:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3
	bne	L015e2c
L015e76:
	movem.l	(sp)+,d3-d4/a3-a6
	rts

SR_SHOT当たり判定矩形表示:
	movem.l	d3-d6/a3,-(sp)
	movea.l	($0018,sp),a0
	movea.l	($0f08,a0),a3				;a3=SHOT標準ハンドラ
	cmpa.w	#$0000,a3					;NULLのとき何もせず終了
	beq	L015fe8
L015e90:
	tst.w	($000c,a3)
	ble	L015fdc
	tst.w	($000a,a3)
	beq	L015fdc
	cmpi.w	#$0001,($0028,a3)
	bne	L015ebc
	move.w	($000e,a3),d4
	add.w	($0016,a3),d4
	move.w	d4,d0
	add.w	($001a,a3),d0
	move.w	d0,d5
	subq.w	#1,d5
	bra	L015ed6
L015ebc:
	move.w	($0012,a3),d0
	asl.w	#4,d0
	add.w	($000e,a3),d0
	move.w	d0,d5
	sub.w	($0016,a3),d5
	move.w	d5,d0
	sub.w	($001a,a3),d0
	move.w	d0,d4
	addq.w	#1,d4
L015ed6:
	move.w	($0010,a3),d3
	add.w	($0018,a3),d3
	move.w	d3,d0
	add.w	($001c,a3),d0
	move.w	d0,d6
	subq.w	#1,d6
	pea.l	($0003)				;引数5:プライオリティ
	pea.l	($0cee)				;引数4:PCGコード
	movea.w	d3,a0
	pea.l	($0010,a0)			;引数3:Y座標
	movea.w	d4,a0
	pea.l	($0010,a0)			;引数2:X座標
	movea.w	(L020056),a0		;引数1:スプライト番号
	addq.w	#1,(L020056)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	cmpi.w	#$0051,(L020056)
	ble	L015f26
	move.w	#$003a,(L020056)
L015f26:
	pea.l	($0003)
	pea.l	($4cee)
	movea.w	d3,a0
	pea.l	($0010,a0)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	(L020056),a0
	addq.w	#1,(L020056)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	cmpi.w	#$0051,(L020056)
	ble	L015f62
	move.w	#$003a,(L020056)
L015f62:
	pea.l	($0003)
	move.l	#$00008cee,-(sp)
	movea.w	d6,a1
	move.l	a1,-(sp)
	movea.w	d4,a0
	pea.l	($0010,a0)
	movea.w	(L020056),a0
	addq.w	#1,(L020056)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	cmpi.w	#$0051,(L020056)
	ble	L015fa0
	move.w	#$003a,(L020056)
L015fa0:
	pea.l	($0003)
	move.l	#$0000ccee,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	movea.w	(L020056),a0
	addq.w	#1,(L020056)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0004_Spr設定_表示)
	lea.l	($0014,sp),sp
	cmpi.w	#$0051,(L020056)
	ble	L015fdc
	move.w	#$003a,(L020056)
L015fdc:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3				;次のSHOTが存在するときはループ先頭に戻る
	bne	L015e90
L015fe8:
	movem.l	(sp)+,d3-d6/a3
	rts

SR_SHOT対SHOTヒットチェック:
	link	a6,#-$0006
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a0			;a0=p1
	movea.l	($0f08,a0),a5			;a5=SHOT標準ハンドラ
	cmpa.w	#$0000,a5
	beq	L0162dc						;return

	s1 = p1->0f08_SHOT標準ハンドラ;
	if (s1 == 0) return;

	for (; s1; s1 = s1->ptr_next) {
		if (!s1->hit_info || s1->state <= SHOT_STATE_無効 || s1->type == SHOT_TYPE_虚像) continue;

		if (s1->drct == DRCT_右) {
			s1_x1 = s1->pos_x + s1->rect_x;
			s1_x2 = s1_x1 + s1->rect_w - 1;
		} else {
			s1_x2 = s1->pos_x + s1->len_x * 16 - s1->rect_x - 1;
			s1_x1 = s1_x2 - s1->rect_w + 1;
		}
		s1_x2 = s1_x1 + s1->rect_w - 1;

		s1_y1 = s1->pos_y + s1->rect_y;
		s1_y2 = s1_y1 + s1->rect_h - 1;

		s2 = s1->friend ? p2->0f08_SHOT標準ハンドラ : p1->0f08_SHOT標準ハンドラ;
		for (; s2; s2 = s2->ptr_next) {
			if (!s2->hit_info || s2->state <= SHOT_STATE_無効 || s2->type == SHOT_TYPE_虚像) continue;

			if (s2->drct == DRCT_右) {
				s2_x1 = s2->pos_x + s2->rect_x;
				s2_x2 = s2_x1 + s2->rect_w - 1;
			} else {
				s2_x2 = s2->pos_x + s2->len_x * 16 - s2->rect_x - 1;
				s2_x1 = s2_x2 - s2->rect_w + 1;
			}
			s2_x2 = s2_x1 + s2->rect_w - 1;

			s2_y1 = s2->pos_y + s2->rect_y;
			s2_y2 = s2_y1 + s2->rect_h - 1;

			if (!SR_矩形接触判定(s1_x1, s1_x2, s1_y1, s1_y2, s2_x1, s2_x2, s2_y1, s2_y2)
				continue;
		}
	}


L016006:
	tst.l	($0022,a5)				;s1->hit_info
	beq	L0162d0
	tst.w	($000c,a5)				;s1->state
	ble	L0162d0
	tst.w	($000a,a5)				;s1->type
	beq	L0162d0
	cmpi.w	#$0001,($0028,a5)		;s1->drct
	bne	L01603c
	move.w	($000e,a5),d7
	add.w	($0016,a5),d7
	move.w	d7,d0
	add.w	($001a,a5),d0
	subq.w	#1,d0
	move.w	d0,(-$0002,a6)
	bra	L01605a
L01603c:
	move.w	($0012,a5),d0
	asl.w	#4,d0
	add.w	($000e,a5),d0
	move.w	($0016,a5),d1
	addq.w	#1,d1
	sub.w	d1,d0
	move.w	d0,(-$0002,a6)
	sub.w	($001a,a5),d0
	move.w	d0,d7
	addq.w	#1,d7
L01605a:
	movea.w	($0010,a5),a0
	adda.w	($0018,a5),a0
	move.w	a0,(-$0004,a6)
	move.w	a0,d0
	add.w	($001c,a5),d0
	subq.w	#1,d0
	move.w	d0,(-$0006,a6)
	tst.w	($003e,a5)				;s1->friend
	beq	L0161b6
	movea.l	($000c,a6),a0
	movea.l	($0f08,a0),a4
	cmpa.w	#$0000,a4
	beq	L0162d0
L01608a:
	tst.w	($000c,a4)
	ble	L0161a6
	tst.w	($003e,a4)
	beq	L0161a6
	tst.w	($000a,a4)
	beq	L0161a6
	cmpi.w	#$0001,($0028,a4)
	bne	L0160be
	move.w	($000e,a4),d4
	add.w	($0016,a4),d4
	move.w	d4,d0
	add.w	($001a,a4),d0
	move.w	d0,d3
	subq.w	#1,d3
	bra	L0160dc
L0160be:
	move.w	($0012,a4),d0
	asl.w	#4,d0
	add.w	($000e,a4),d0
	move.w	($0016,a4),d1
	addq.w	#1,d1
	move.w	d0,d3
	sub.w	d1,d3
	move.w	d3,d0
	sub.w	($001a,a4),d0
	move.w	d0,d4
	addq.w	#1,d4
L0160dc:
	move.w	($0010,a4),d5
	add.w	($0018,a4),d5
	move.w	d5,d0
	add.w	($001c,a4),d0
	move.w	d0,d6
	subq.w	#1,d6
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d5,a0
	move.l	a0,-(sp)
	movea.w	d3,a0
	move.l	a0,-(sp)
	movea.w	d4,a0
	move.l	a0,-(sp)
	movea.w	(-$0006,a6),a0
	move.l	a0,-(sp)
	movea.w	(-$0004,a6),a0
	move.l	a0,-(sp)
	movea.w	(-$0002,a6),a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L0161a6
	movea.l	($0008,a6),a0		;a0=p1
	tst.w	($01c8,a0)			;a0->01c8_xxxx
	beq	L0162dc
	movea.l	($000c,a6),a0
	tst.w	($01c8,a0)
	beq	L0162dc
	movea.l	($0008,a6),a0
	move.l	a5,($0f0e,a0)
	move.w	d7,($0f12,a0)
	move.w	(-$0002,a6),($0f14,a0)
	move.w	(-$0004,a6),($0f16,a0)
	move.w	(-$0006,a6),($0f18,a0)
	movea.l	($000c,a6),a0
	move.l	a4,($0f0e,a0)
	move.w	d4,($0f12,a0)
	move.w	d3,($0f14,a0)
	move.w	d5,($0f16,a0)
	move.w	d6,($0f18,a0)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a4,-(sp)
	move.l	a0,-(sp)
	lea.l	(SYSCALL_00a8_Shot送信_コマンド),a3
	jsr	(a3)	;SYSCALL_00a8_Shot送信_コマンド(a0, a4, SHOT_CMD_対SHOT衝突, 0, 0);
	lea.l	($0014,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a5,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(a3)	;SYSCALL_00a8_Shot送信_コマンド(a6_pl0008, a5, SHOT_CMD_対SHOT衝突, 0, 0);
	lea.l	($0014,sp),sp
L0161a6:
	movea.l	($0038,a4),a4
	cmpa.w	#$0000,a4
	bne	L01608a
	bra	L0162d0
L0161b6:
	movea.l	($0008,a6),a0
	movea.l	($0f08,a0),a4
	cmpa.w	#$0000,a4
	beq	L0162d0
L0161c6:
	tst.w	($000c,a4)
	ble	L0162c4
	tst.w	($003e,a4)
	beq	L0162c4
	tst.w	($000a,a4)
	beq	L0162c4
	cmpi.w	#$0001,($0028,a4)
	bne	L0161fa
	move.w	($000e,a4),d4
	add.w	($0016,a4),d4
	move.w	d4,d0
	add.w	($001a,a4),d0
	move.w	d0,d3
	subq.w	#1,d3
	bra	L016218
L0161fa:
	move.w	($0012,a4),d0
	asl.w	#4,d0
	add.w	($000e,a4),d0
	move.w	($0016,a4),d1
	addq.w	#1,d1
	move.w	d0,d3
	sub.w	d1,d3
	move.w	d3,d0
	sub.w	($001a,a4),d0
	move.w	d0,d4
	addq.w	#1,d4
L016218:
	move.w	($0010,a4),d5
	add.w	($0018,a4),d5
	move.w	d5,d0
	add.w	($001c,a4),d0
	move.w	d0,d6
	subq.w	#1,d6
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	movea.w	(-$0006,a6),a0
	move.l	a0,-(sp)
	movea.w	(-$0004,a6),a0
	move.l	a0,-(sp)
	movea.w	(-$0002,a6),a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L0162c4
	movea.l	($0008,a6),a0
	tst.w	($01c8,a0)
	beq	L0162dc
	movea.l	($000c,a6),a0
	tst.w	($01c8,a0)
	beq	L0162dc
	movea.l	($0008,a6),a0
	move.l	a5,($0f0e,a0)
	move.w	d7,($0f12,a0)
	move.w	(-$0002,a6),($0f14,a0)
	move.w	(-$0004,a6),($0f16,a0)
	move.w	(-$0006,a6),($0f18,a0)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a4,-(sp)
	move.l	a0,-(sp)
	lea.l	(SYSCALL_00a8_Shot送信_コマンド),a3
	jsr	(a3)	;SYSCALL_00a8_Shot送信_コマンド(a0, a4, SHOT_CMD_対SHOT衝突, 0, 0);
	lea.l	($0014,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a5,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(a3)	;SYSCALL_00a8_Shot送信_コマンド(a6_pl0008, a5, SHOT_CMD_対SHOT衝突, 0, 0);
	lea.l	($0014,sp),sp
L0162c4:
	movea.l	($0038,a4),a4
	cmpa.w	#$0000,a4
	bne	L0161c6
L0162d0:
	movea.l	($0038,a5),a5
	cmpa.w	#$0000,a5
	bne	L016006
L0162dc:
	movem.l	(-$0026,a6),d3-d7/a3-a5
	unlk	a6
	rts

L0162e6:
	movem.l	d3-d5/a3-a6,-(sp)
	movea.l	($0020,sp),a6
	movea.l	($0024,sp),a3
	movea.l	($0f08,a6),a4
	tst.w	($01cc,a3)
	bne	L01658a
	tst.w	($01c0,a3)			;無敵状態
	bne	L01682a
	tst.w	($172e,a3)			;無敵持続カウンタ
	bgt	L01682a
	bra	L01658a
L016312:
	tst.l	($0022,a4)
	beq	L016586
	tst.w	($000c,a4)
	ble	L016586
	tst.w	($003e,a4)
	beq	L016586
	tst.w	($000a,a4)
	beq	L016586
	cmpi.w	#$0001,($0028,a4)
	bne	L01634e
	movea.w	($000e,a4),a5
	adda.w	($0016,a4),a5
	move.w	a5,d0
	add.w	($001a,a4),d0
	move.w	d0,d3
	subq.w	#1,d3
	bra	L01636c
L01634e:
	move.w	($0012,a4),d0
	asl.w	#4,d0
	add.w	($000e,a4),d0
	move.w	($0016,a4),d1
	addq.w	#1,d1
	move.w	d0,d3
	sub.w	d1,d3
	move.w	d3,d0
	sub.w	($001a,a4),d0
	movea.w	d0,a5
	addq.w	#1,a5
L01636c:
	move.w	($0010,a4),d4
	add.w	($0018,a4),d4
	move.w	d4,d0
	add.w	($001c,a4),d0
	move.w	d0,d5
	subq.w	#1,d5
	cmpi.w	#$0001,($01b6,a3)
	bne	L01642e
	movea.w	($0a12,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a10,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a0e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a0c,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L0163da
	move.w	($0a0c,a3),($0f12,a3)
	move.w	($0a0e,a3),($0f14,a3)
	move.w	($0a10,a3),($0f16,a3)
	move.w	($0a12,a3),($0f18,a3)
	bra	L0164ce
L0163da:
	movea.w	($0a22,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a20,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a1e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a1c,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016586
	move.w	($0a1c,a3),($0f12,a3)
	move.w	($0a1e,a3),($0f14,a3)
	move.w	($0a20,a3),($0f16,a3)
	move.w	($0a22,a3),($0f18,a3)
	bra	L0164ce
L01642e:
	movea.w	($0a1a,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a18,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a16,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a14,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L01647e
	move.w	($0a14,a3),($0f12,a3)
	move.w	($0a16,a3),($0f14,a3)
	move.w	($0a18,a3),($0f16,a3)
	move.w	($0a1a,a3),($0f18,a3)
	bra	L0164ce
L01647e:
	movea.w	($0a2a,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a28,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a26,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a24,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016586
	move.w	($0a24,a3),($0f12,a3)
	move.w	($0a26,a3),($0f14,a3)
	move.w	($0a28,a3),($0f16,a3)
	move.w	($0a2a,a3),($0f18,a3)
L0164ce:
	move.l	a4,($0f0e,a6)
	move.w	a5,($0f12,a6)
	move.w	d3,($0f14,a6)
	move.w	d4,($0f16,a6)
	move.w	d5,($0f18,a6)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0006)
	move.l	a4,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	pea.l	($0001)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	a6,-(sp)
	jsr	(L016830)
	lea.l	($0010,sp),sp
	jsr	(乱数発生)
	movea.w	d3,a0
	lea.l	(a0,a5.w),a1
	move.l	a1,d1
	asr.l	#1,d1
	tst.l	d0
	bge	L01652a
	add.l	#$00000fff,d0
L01652a:
	moveq.l	#$0c,d2
	asr.l	d2,d0
	subq.w	#8,d0
	add.w	d1,d0
	subq.w	#4,d0
	move.w	d0,($1732,a3)
	jsr	(乱数発生)
	tst.l	d0
	bge	L016548
	add.l	#$000007ff,d0
L016548:
	moveq.l	#$0b,d2
	asr.l	d2,d0
	add.w	#$0010,d0
	add.w	d4,d0
	subq.w	#8,d0
	move.w	d0,($1734,a3)
	cmpi.w	#$006f,($0008,a3)
	bgt	L016568
	move.w	#$0001,($0f20,a3)
	bra	L01656c
L016568:
	clr.w	($0f20,a3)
L01656c:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0005)
	move.l	a4,-(sp)
	move.l	a6,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
L016586:
	movea.l	($0038,a4),a4
L01658a:
	cmpa.w	#$0000,a4
	bne	L016312
	movea.l	($0f08,a3),a4
	cmpa.w	#$0000,a4
	beq	L01682a
L01659e:
	tst.l	($0022,a4)
	beq	L01681e
	tst.w	($000c,a4)
	ble	L01681e
	tst.w	($003e,a4)
	bne	L01681e
	tst.w	($000a,a4)
	beq	L01681e
	cmpi.w	#$0001,($0028,a4)
	bne	L0165da
	movea.w	($000e,a4),a5
	adda.w	($0016,a4),a5
	move.w	a5,d0
	add.w	($001a,a4),d0
	move.w	d0,d3
	subq.w	#1,d3
	bra	L0165f8
L0165da:
	move.w	($0012,a4),d0
	asl.w	#4,d0
	add.w	($000e,a4),d0
	move.w	($0016,a4),d1
	addq.w	#1,d1
	move.w	d0,d3
	sub.w	d1,d3
	move.w	d3,d0
	sub.w	($001a,a4),d0
	movea.w	d0,a5
	addq.w	#1,a5
L0165f8:
	move.w	($0010,a4),d4
	add.w	($0018,a4),d4
	move.w	d4,d0
	add.w	($001c,a4),d0
	move.w	d0,d5
	subq.w	#1,d5
	cmpi.w	#$0001,($01b6,a3)
	bne	L0166ba
	movea.w	($0a12,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a10,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a0e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a0c,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016666
	move.w	($0a0c,a3),($0f12,a3)
	move.w	($0a0e,a3),($0f14,a3)
	move.w	($0a10,a3),($0f16,a3)
	move.w	($0a12,a3),($0f18,a3)
	bra	L01675a
L016666:
	movea.w	($0a22,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a20,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a1e,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a1c,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L01681e
	move.w	($0a1c,a3),($0f12,a3)
	move.w	($0a1e,a3),($0f14,a3)
	move.w	($0a20,a3),($0f16,a3)
	move.w	($0a22,a3),($0f18,a3)
	bra	L01675a
L0166ba:
	movea.w	($0a1a,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a18,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a16,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a14,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L01670a
	move.w	($0a14,a3),($0f12,a3)
	move.w	($0a16,a3),($0f14,a3)
	move.w	($0a18,a3),($0f16,a3)
	move.w	($0a1a,a3),($0f18,a3)
	bra	L01675a
L01670a:
	movea.w	($0a2a,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a28,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a26,a3),a1
	move.l	a1,-(sp)
	movea.w	($0a24,a3),a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	a5,a1
	move.l	a1,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L01681e
	move.w	($0a24,a3),($0f12,a3)
	move.w	($0a26,a3),($0f14,a3)
	move.w	($0a28,a3),($0f16,a3)
	move.w	($0a2a,a3),($0f18,a3)
L01675a:
	move.l	a4,($0f0e,a6)
	move.w	a5,($0f12,a6)
	move.w	d3,($0f14,a6)
	move.w	d4,($0f16,a6)
	move.w	d5,($0f18,a6)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0006)
	move.l	a4,-(sp)
	move.l	a6,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_標準SHOT関数)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	a3,-(sp)
	jsr	(L016830)
	lea.l	($0010,sp),sp
	jsr	(乱数発生)
	movea.w	d3,a0
	lea.l	(a0,a5.w),a1
	move.l	a1,d1
	asr.l	#1,d1
	tst.l	d0
	bge	L0167b8
	add.l	#$00000fff,d0
L0167b8:
	moveq.l	#$0c,d2
	asr.l	d2,d0
	subq.w	#8,d0
	add.w	d1,d0
	subq.w	#4,d0
	move.w	d0,($1732,a3)
	jsr	(乱数発生)
	tst.l	d0
	bge	L0167d6
	add.l	#$000007ff,d0
L0167d6:
	moveq.l	#$0b,d2
	asr.l	d2,d0
	add.w	#$0010,d0
	add.w	d4,d0
	subq.w	#8,d0
	move.w	d0,($1734,a3)
	move.w	($0028,a4),d2
	neg.w	d2
	move.w	d2,($0f1e,a3)
	cmpi.w	#$006f,($0008,a3)
	bgt	L016800
	move.w	#$0001,($0f20,a3)
	bra	L016804
L016800:
	clr.w	($0f20,a3)
L016804:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0005)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
L01681e:
	movea.l	($0038,a4),a4
	cmpa.w	#$0000,a4
	bne	L01659e
L01682a:
	movem.l	(sp)+,d3-d5/a3-a6
	rts

L016830:
	link	a6,#-$0010
	movem.l	d3/a3-a5,-(sp)
	movea.l	($0008,a6),a5
	movea.l	($000c,a6),a3
	movea.l	($0010,a6),a0
	move.w	($0016,a6),d3
	movea.l	($0022,a0),a4
	move.w	($000a,a4),d0
	move.l	a4,($1326,a3)
	cmp.w	#$0002,d0
	beq	L0168ec
	tst.w	($01cc,a5)
	bne	L0168ec
	moveq.l	#$00,d1
	cmpi.w	#$0045,($09e0,a3)
	beq	L01687c
	cmpi.w	#$0064,($09e0,a3)
	bne	L01689a
	tst.w	($09f0,a3)
	ble	L01689a
L01687c:
	tst.w	d0
	beq	L0168c0
	cmp.w	#$0001,d0
	bne	L01688c
	tst.w	($01bc,a3)
	beq	L0168c0
L01688c:
	cmp.w	#$ffff,d0
	bne	L0168c2
	tst.w	($01bc,a3)
	beq	L0168c2
	bra	L0168c0
L01689a:
	cmpi.w	#$006e,($09e0,a3)
	beq	L0168b0
	cmpi.w	#$0066,($09e0,a3)
	bne	L0168c2
	tst.w	($09f0,a3)
	ble	L0168c2
L0168b0:
	move.w	($01b6,a3),d2
	cmp.w	($0028,a0),d2
	beq	L0168c2
	cmp.w	#$ffff,d0
	beq	L0168c2
L0168c0:
	moveq.l	#$01,d1
L0168c2:
	tst.w	d1
	beq	L0168ec
	move.w	#$0001,($0a5a,a3)
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0014)
	pea.l	($01f4)
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	move.l	a5,-(sp)
	jsr	(L00ed6e)
	moveq.l	#$00,d0
	bra	L01695a
L0168ec:
	jsr	(SYSCALL_0148_場面取得_エンディング)
	tst.w	d0
	bne	L016906
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($01f4)
	pea.l	($0000)
	move.l	a4,-(sp)
	bra	L01692a
L016906:
	clr.w	(-$0010,a6)
	clr.w	(-$000c,a6)
	move.w	($0008,a4),(-$0008,a6)
	move.w	#$002f,(-$0002,a6)
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($01f4)
	pea.l	($0000)
	pea.l	(-$0010,a6)
L01692a:
	move.l	a3,-(sp)
	move.l	a5,-(sp)
	jsr	(L00eab8)
	lea.l	($0018,sp),sp
	tst.w	($0006,a4)
	ble	L016952
	tst.w	($01cc,a3)
	bne	L016952
	move.w	($0006,a4),($0a90,a3)
	move.l	a3,-(sp)
	jsr	(SR_スプライトパレット設定_黒)
L016952:
	move.w	#$0001,($0a5a,a3)
	moveq.l	#$01,d0
L01695a:
	movem.l	(-$0020,a6),d3/a3-a5
	unlk	a6
	rts

L016964:
	link	a6,#$0000
	movem.l	d3-d7/a3-a5,-(sp)
	movea.w	($0012,a6),a5
	movea.w	($0016,a6),a4
	move.w	($001a,a6),d7
	move.w	($001e,a6),d6
	moveq.l	#$00,d5
	movea.l	($0008,a6),a0
	move.w	($0a92,a0),d4
	movea.l	($000c,a6),a0
	movea.l	($0f08,a0),a3
	cmpa.w	#$0000,a3
	beq	L016a68
L016996:
	tst.w	d4
	ble	L016a68
	tst.w	($000c,a3)
	ble	L016a5c
	tst.w	($003e,a3)
	beq	L016a5c
	tst.w	($000a,a3)
	beq	L016a5c
	cmpi.w	#$0001,($0028,a3)
	bne	L0169d0
	move.w	($000e,a3),d3
	add.w	($0016,a3),d3
	move.w	d3,d0
	add.w	($001a,a3),d0
	move.w	d0,d2
	subq.w	#1,d2
	bra	L0169ee
L0169d0:
	move.w	($0012,a3),d0
	asl.w	#4,d0
	add.w	($000e,a3),d0
	move.w	($0016,a3),d1
	addq.w	#1,d1
	move.w	d0,d2
	sub.w	d1,d2
	move.w	d2,d0
	sub.w	($001a,a3),d0
	move.w	d0,d3
	addq.w	#1,d3
L0169ee:
	move.w	($0010,a3),d1
	add.w	($0018,a3),d1
	move.w	d1,d0
	add.w	($001c,a3),d0
	subq.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	movea.w	a4,a0
	move.l	a0,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016a5c
	tst.w	($002a,a3)
	ble	L016a5c
L016a32:
	tst.w	d4
	ble	L016a5c
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a3,-(sp)
	move.l	($000c,a6),-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	subq.w	#1,d4
	moveq.l	#$01,d5
	tst.w	($002a,a3)
	bgt	L016a32
L016a5c:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3
	bne	L016996
L016a68:
	movea.l	($0008,a6),a0
	movea.l	($0f08,a0),a3
	cmpa.w	#$0000,a3
	beq	L016b4a
L016a78:
	tst.w	d4
	ble	L016b4a
	tst.w	($000c,a3)
	ble	L016b3e
	tst.w	($003e,a3)
	bne	L016b3e
	tst.w	($000a,a3)
	beq	L016b3e
	cmpi.w	#$0001,($0028,a3)
	bne	L016ab2
	move.w	($000e,a3),d3
	add.w	($0016,a3),d3
	move.w	d3,d0
	add.w	($001a,a3),d0
	move.w	d0,d2
	subq.w	#1,d2
	bra	L016ad0
L016ab2:
	move.w	($0012,a3),d0
	asl.w	#4,d0
	add.w	($000e,a3),d0
	move.w	($0016,a3),d1
	addq.w	#1,d1
	move.w	d0,d2
	sub.w	d1,d2
	move.w	d2,d0
	sub.w	($001a,a3),d0
	move.w	d0,d3
	addq.w	#1,d3
L016ad0:
	move.w	($0010,a3),d1
	add.w	($0018,a3),d1
	move.w	d1,d0
	add.w	($001c,a3),d0
	subq.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	movea.w	a4,a0
	move.l	a0,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016b3e
	tst.w	($002a,a3)
	ble	L016b3e
L016b14:
	tst.w	d4
	ble	L016b3e
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0004)
	move.l	a3,-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	subq.w	#1,d4
	moveq.l	#$01,d5
	tst.w	($002a,a3)
	bgt	L016b14
L016b3e:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3
	bne	L016a78
L016b4a:
	movea.l	($0008,a6),a0
	move.w	d4,($0a92,a0)
	move.w	d5,d0
	ext.l	d0
	movem.l	(-$0020,a6),d3-d7/a3-a5
	unlk	a6
	rts

L016b60:
	link	a6,#-$0002
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a4
	move.w	($0012,a6),(-$0002,a6)
	movea.w	($0016,a6),a5
	move.w	($001a,a6),d7
	move.w	($001e,a6),d6
	moveq.l	#$00,d5
	move.w	($1744,a4),d4
	movea.l	($000c,a6),a0
	movea.l	($0f08,a0),a3
	cmpa.w	#$0000,a3
	beq	L016c6a
L016b94:
	tst.w	d4
	ble	L016c6a
	tst.w	($000c,a3)
	ble	L016c5e
	tst.w	($000a,a3)
	beq	L016c5e
	tst.w	($003e,a3)
	beq	L016c5e
	cmp.w	($002a,a3),d4
	blt	L016c5e
	cmpi.w	#$0001,($0028,a3)
	bne	L016bd6
	move.w	($000e,a3),d3
	add.w	($0016,a3),d3
	move.w	d3,d0
	add.w	($001a,a3),d0
	move.w	d0,d2
	subq.w	#1,d2
	bra	L016bf4
L016bd6:
	move.w	($0012,a3),d0
	asl.w	#4,d0
	add.w	($000e,a3),d0
	move.w	($0016,a3),d1
	addq.w	#1,d1
	move.w	d0,d2
	sub.w	d1,d2
	move.w	d2,d0
	sub.w	($001a,a3),d0
	move.w	d0,d3
	addq.w	#1,d3
L016bf4:
	move.w	($0010,a3),d1
	add.w	($0018,a3),d1
	move.w	d1,d0
	add.w	($001c,a3),d0
	subq.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	movea.w	(-$0002,a6),a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016c5e
	eori.w	#$0001,($003e,a3)
	movea.w	($1748,a4),a0
	move.l	a0,-(sp)
	movea.w	($1746,a4),a0
	move.l	a0,-(sp)
	pea.l	($000a)
	move.l	a3,-(sp)
	move.l	($000c,a6),-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	subq.w	#1,d4
	moveq.l	#$01,d5
L016c5e:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3
	bne	L016b94
L016c6a:
	movea.l	($0f08,a4),a3
	cmpa.w	#$0000,a3
	beq	L016d4a
L016c76:
	tst.w	d4
	ble	L016d4a
	tst.w	($000c,a3)
	ble	L016d3e
	tst.w	($000a,a3)
	beq	L016d3e
	tst.w	($003e,a3)
	bne	L016d3e
	cmp.w	($002a,a3),d4
	blt	L016d3e
	cmpi.w	#$0001,($0028,a3)
	bne	L016cb8
	move.w	($000e,a3),d3
	add.w	($0016,a3),d3
	move.w	d3,d0
	add.w	($001a,a3),d0
	move.w	d0,d2
	subq.w	#1,d2
	bra	L016cd6
L016cb8:
	move.w	($0012,a3),d0
	asl.w	#4,d0
	add.w	($000e,a3),d0
	move.w	($0016,a3),d1
	addq.w	#1,d1
	move.w	d0,d2
	sub.w	d1,d2
	move.w	d2,d0
	sub.w	($001a,a3),d0
	move.w	d0,d3
	addq.w	#1,d3
L016cd6:
	move.w	($0010,a3),d1
	add.w	($0018,a3),d1
	move.w	d1,d0
	add.w	($001c,a3),d0
	subq.w	#1,d0
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d3
	move.l	d3,-(sp)
	movea.w	d6,a0
	move.l	a0,-(sp)
	movea.w	d7,a0
	move.l	a0,-(sp)
	movea.w	a5,a0
	move.l	a0,-(sp)
	movea.w	(-$0002,a6),a0
	move.l	a0,-(sp)
	jsr	(SR_矩形接触判定)
	lea.l	($0020,sp),sp
	tst.w	d0
	beq	L016d3e
	eori.w	#$0001,($003e,a3)
	movea.w	($1748,a4),a0
	move.l	a0,-(sp)
	movea.w	($1746,a4),a0
	move.l	a0,-(sp)
	pea.l	($000a)
	move.l	a3,-(sp)
	move.l	a4,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	subq.w	#1,d4
	moveq.l	#$01,d5
L016d3e:
	movea.l	($0038,a3),a3
	cmpa.w	#$0000,a3
	bne	L016c76
L016d4a:
	move.w	d4,($1744,a4)
	move.w	d5,d0
	ext.l	d0
	movem.l	(-$0022,a6),d3-d7/a3-a5
	unlk	a6
	rts

SR_SHOT攻撃フラグ判定:
	movea.l	($0004,sp),a1				;a1=p1
	movea.l	($0f08,a1),a0				;a0=SHOT標準ハンドラ
	clr.w	($0f0c,a1)					;SHOT攻撃フラグをクリア
	cmpa.w	#$0000,a0
	beq	L016d8c							;SHOT標準ハンドラがNULLのとき何もせず終了
@@:	tst.w	($000c,a0)					;shot->state
	beq	@f
	tst.w	($003e,a0)					;shot->friend
	beq	@f
	cmpi.w	#$0001,($000a,a0)			;shot->type
	beq	L016dae							;SHOT攻撃フラグを立てて終了
@@:	movea.l	($0038,a0),a0
	cmpa.w	#$0000,a0
	bne	@@b							;次のSHOTが存在するときはループ先頭に戻る
L016d8c:
	movea.l	($132a,a1),a0				;a0=p2
	movea.l	($0f08,a0),a0				;a0=p2のSHOT標準ハンドラ
	cmpa.w	#$0000,a0
	beq	L016dc0							;SHOT標準ハンドラがNULLのとき何もせず終了
L016d9a:
	tst.w	($000c,a0)					;shot->state
	beq	L016db6
	tst.w	($003e,a0)					;shot->friend
	bne	L016db6
	cmpi.w	#$0001,($000a,a0)			;shot->type
	bne	L016db6
L016dae:
	move.w	#$0001,($0f0c,a1)			;p1のSHOT攻撃フラグを立てて終了
	bra	L016dc0
L016db6:
	movea.l	($0038,a0),a0
	cmpa.w	#$0000,a0
	bne	L016d9a							;次のSHOTが存在するときはループ先頭に戻る
L016dc0:
	rts

SYSCALL_00a4_Shot登録_モジュール:
	movea.l	($0004,sp),a2
	movea.l	($0008,sp),a1
	tst.l	($0f08,a2)
	bne	L016ddc
	move.l	a1,($0f08,a2)
	moveq.l	#$00,d0
	move.l	d0,($0034,a1)
	bra	L016dfa
L016ddc:
	movea.l	($0f08,a2),a0
	tst.l	($0038,a0)
	beq	L016df0
L016de6:
	movea.l	($0038,a0),a0
	tst.l	($0038,a0)
	bne	L016de6
L016df0:
	move.l	a1,($0038,a0)
	move.l	a0,($0034,a1)
	moveq.l	#$00,d0
L016dfa:
	move.l	d0,($0038,a1)
	moveq.l	#$00,d0
	move.l	d0,($0038,a1)
	move.l	a2,(a1)
	move.l	d0,($0022,a1)
	rts

SYSCALL_00a8_Shot送信_コマンド:
	movem.l	d3-d5/a3-a4,-(sp)
	movea.l	($0018,sp),a3
	movea.l	($001c,sp),a4
	move.w	($0022,sp),d5
	move.w	($0026,sp),d4
	move.w	($002a,sp),d3
	moveq.l	#$00,d0
	movea.l	($0004,a4),a0
	cmpa.w	#$0000,a0
	beq	L016e4a
	movea.w	d3,a1
	move.l	a1,-(sp)
	movea.w	d4,a1
	move.l	a1,-(sp)
	movea.w	d5,a1
	move.l	a1,-(sp)
	move.l	a4,-(sp)
	move.l	($132a,a3),-(sp)
	move.l	a3,-(sp)
	jsr	(a0)
	lea.l	($0018,sp),sp
L016e4a:
	tst.w	d0
	bne	L016e6c
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	move.l	a4,-(sp)
	move.l	($132a,a3),-(sp)
	move.l	a3,-(sp)
	jsr	(SR_標準SHOT関数)
	lea.l	($0018,sp),sp
L016e6c:
	movem.l	(sp)+,d3-d5/a3-a4
	rts

SYSCALL_00d0_Shot演出_ヒット音:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a0
	movea.l	($000c,sp),a2
	move.w	($0012,sp),d1
	move.w	($0016,sp),d0
	cmpi.w	#$7ffe,($09f0,a2)
	ble	L016e96
	tst.w	($01cc,a2)
	bne	L016e96
	movea.w	d0,a1
	bra	L016e98
L016e96:
	movea.w	d1,a1
L016e98:
	moveq.l	#$31,d2
	cmp.w	a1,d2
	blt	L016ea4
	movea.w	a1,a3
	move.l	a3,-(sp)
	bra	L016eac
L016ea4:
	movea.w	($000a,a0),a0
	pea.l	(-$01,a0,a1.w)
L016eac:
	movea.w	($000a,a2),a3
	move.l	a3,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	movea.l	(sp)+,a3
	rts

L016ebe:
	movem.l	a3-a5,-(sp)
	movea.l	($0010,sp),a3
	movea.l	($0014,sp),a5
	movea.l	($0018,sp),a4
	move.w	($001e,sp),d0
	move.w	($0022,sp),d1
	move.w	($0026,sp),d2
	tst.w	d0
	bne	L016efa
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00ac_Shot設定_モジュール状態)
	lea.l	($000c,sp),sp
	clr.w	($0a4c,a3)
L016ef4:
	moveq.l	#$01,d0
	bra	L0173d0
L016efa:
	cmp.w	#$0001,d0
	bne	L016fd6
	pea.l	($0001)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00ac_Shot設定_モジュール状態)
	lea.l	($000c,sp),sp
	cmpi.w	#$0001,($000a,a3)
	bne	L016f26
	move.l	#L020278,($0022,a4)
	bra	L016f2e
L016f26:
	move.l	#L020288,($0022,a4)
L016f2e:
	clr.w	($0a4e,a3)
	move.w	#$0001,($000a,a4)
	move.w	($0a52,a3),($000e,a4)
	move.w	($0a54,a3),($0010,a4)
	move.w	#$0002,($0012,a4)
	move.w	#$0002,($0014,a4)
	move.w	($0a50,a3),($0028,a4)
	move.w	($0a68,a3),($002c,a4)
	move.w	#$0004,($0016,a4)
	move.w	#$0004,($0018,a4)
	move.w	#$0018,($001a,a4)
	move.w	#$0018,($001c,a4)
	cmpi.w	#$000a,($0a66,a3)
	ble	L016f8a
	movea.w	($0a66,a3),a1
	adda.w	#$fff6,a1
	move.w	a1,($002a,a4)
	bra	L016f90
L016f8a:
	move.w	($0a66,a3),($002a,a4)
L016f90:
	movea.l	($0022,a4),a0
	move.w	($0a5e,a3),(a0)
	movea.l	($0022,a4),a0
	move.w	($0a62,a3),($0002,a0)
	movea.l	($0022,a4),a0
	move.w	($0a60,a3),($0004,a0)
	movea.l	($0022,a4),a0
	move.w	($0a64,a3),($0006,a0)
	movea.l	($0022,a4),a0
	move.w	#$000a,($0008,a0)
	movea.l	($0022,a4),a0
	clr.w	($000a,a0)
	movea.l	($0022,a4),a0
	move.w	($0a6a,a3),($000c,a0)
	bra	L017310
L016fd6:
	cmp.w	#$0002,d0
	bne	L0170ce
	cmpi.w	#$0001,($000c,a4)
	bne	L017056
	cmpi.w	#$0001,($0a58,a3)
	bne	L016ffa
	move.w	($0a56,a3),d0
	asr.w	#1,d0
	clr.w	($0a58,a3)
	bra	L01700a
L016ffa:
	movea.w	($0a56,a3),a0
	move.l	a0,d0
	addq.l	#1,d0
	asr.l	#1,d0
	move.w	#$0001,($0a58,a3)
L01700a:
	tst.w	($0a56,a3)
	bne	L017016
	moveq.l	#$00,d0
	clr.w	($0a5c,a3)
L017016:
	tst.w	($0a50,a3)
	ble	L017036
	add.w	d0,($0a52,a3)
	addq.w	#1,($0a5c,a3)
	cmpi.w	#$0002,($0a5c,a3)
	ble	L017084
	addq.w	#1,($0a52,a3)
	clr.w	($0a5c,a3)
	bra	L017084
L017036:
	tst.w	($0a50,a3)
	bge	L017084
	sub.w	d0,($0a52,a3)
	addq.w	#1,($0a5c,a3)
	cmpi.w	#$0002,($0a5c,a3)
	ble	L017084
	subq.w	#1,($0a52,a3)
	clr.w	($0a5c,a3)
	bra	L017084
L017056:
	cmpi.w	#$ffff,($000c,a4)
	bne	L017084
	subq.w	#1,($0026,a4)
	beq	L01706a
	tst.w	($0a4c,a3)
	bne	L017084
L01706a:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
L017084:
	cmpi.w	#$00ff,($0a52,a3)
	bgt	L0170a4
	cmpi.w	#$ffe0,($0a52,a3)
	ble	L0170a4
	cmpi.w	#$c001,($0a54,a3)
	blt	L0170a4
	cmpi.w	#$4000,($0a54,a3)
	ble	L0170be
L0170a4:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
L0170be:
	move.w	($0a52,a3),($000e,a4)
	move.w	($0a54,a3),($0010,a4)
	bra	L0173c4
L0170ce:
	cmp.w	#$0003,d0
	bne	L0171c0
	move.w	($001e,a4),d0
	cmpi.w	#$0001,($0a50,a3)
	bne	L0170f4
	move.w	($0a52,a3),d2
	add.w	#$0010,d2
	move.w	($0a52,a3),d1
	add.w	#$0020,d1
	bra	L017108
L0170f4:
	move.w	($0a52,a3),d2
	add.w	#$0020,d2
	move.w	($0a52,a3),d1
	add.w	#$0010,d1
	add.w	#$4000,d0
L017108:
	cmpi.w	#$0001,($000c,a4)
	bne	L017140
	move.l	($0628,a3),(L06f432)		;SUB_飛び道具
	beq	L0171b0
	ext.l	d0
	move.l	d0,-(sp)
	movea.w	($0020,a4),a1
	move.l	a1,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	move.l	a5,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0018,sp),sp
	bra	L0171b0
L017140:
	cmpi.w	#$ffff,($000c,a4)
	bne	L0171b0
	move.l	($09d4,a3),(L06f432)		;VCT__飛び道具消滅処理
	beq	L01716e
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	movea.w	($0020,a4),a1
	move.l	a1,-(sp)
	move.l	a5,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	bra	L017186
L01716e:
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	movea.w	($0020,a4),a1
	move.l	a1,-(sp)
	move.l	a5,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_005c_XXXX)
L017186:
	lea.l	($0014,sp),sp
	tst.w	($0026,a4)
	beq	L017196
	tst.w	($0a4c,a3)
	bne	L0171b0
L017196:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
L0171b0:
	move.w	($0a52,a3),($000e,a4)
	move.w	($0a54,a3),($0010,a4)
	bra	L0173c4
L0171c0:
	cmp.w	#$0004,d0
	bne	L017248
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0007)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	clr.w	($0a70,a3)
	cmpi.w	#$0001,($000c,a4)
	bne	L016ef4
	move.w	($0012,a4),d0
	asl.w	#2,d0
	add.w	($000e,a4),d0
	move.w	($0010,a4),d1
	addq.w	#8,d1
	pea.l	($0000)
	pea.l	($0000)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00d4_Shot演出_ヒットマーク)
	lea.l	($0018,sp),sp
	pea.l	($0000)
	pea.l	($0008)
	move.l	a3,-(sp)
	lea.l	(SR_ヒットストップ・キャラ振動設定),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0000)
	pea.l	($0008)
	move.l	a5,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	bra	L016ef4
L017248:
	cmp.w	#$0005,d0
	bne	L0172d8
	pea.l	($000b)
	movea.l	($0022,a4),a0
	movea.w	($000c,a0),a1
	move.l	a1,-(sp)
	move.l	a5,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00d0_Shot演出_ヒット音)
	lea.l	($0010,sp),sp
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0007)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	clr.w	($0a70,a5)
	cmpi.w	#$0001,($000c,a4)
	bne	L016ef4
	move.w	($0012,a4),d0
	asl.w	#2,d0
	add.w	($000e,a4),d0
	move.w	($0010,a4),d1
	addq.w	#8,d1
	pea.l	($0001)
	pea.l	($0001)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00d4_Shot演出_ヒットマーク)
	lea.l	($0018,sp),sp
	lea.l	(SFSYSINFO_0078_ヒットストップ),a0
	cmpi.w	#$0007,(a0)
	bgt	L016ef4
	move.w	#$0008,(a0)
	bra	L016ef4
L0172d8:
	cmp.w	#$0006,d0
	bne	L01731e
	cmpi.w	#$006f,($0008,a5)
	bgt	L017310
	tst.w	($0f1a,a5)
	bne	L017310
	cmpi.w	#$0001,($002a,a4)
	bgt	L017302
	movea.l	($0022,a4),a0
	move.w	#$003c,($000e,a0)
	bra	L016ef4
L017302:
	movea.l	($0022,a4),a0
	move.w	#$0030,($000e,a0)
	bra	L016ef4
L017310:
	movea.l	($0022,a4),a0
	move.w	#$0031,($000e,a0)
	bra	L016ef4
L01731e:
	cmp.w	#$0007,d0
	bne	L01734e
	subq.w	#1,($002a,a4)
	tst.w	($002a,a4)
	bgt	L016ef4
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0008)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	bra	L016ef4
L01734e:
	cmp.w	#$0008,d0
	bne	L017380
	pea.l	(-$0001)
	move.l	a4,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00ac_Shot設定_モジュール状態)
	lea.l	($000c,sp),sp
	move.w	#$0002,($0a4e,a3)
	clr.w	($0a56,a3)
	move.w	#$000a,($0026,a4)
	move.w	#$000a,($0a4c,a3)
	bra	L016ef4
L017380:
	cmp.w	#$0009,d0
	bne	L01739e
	add.w	d1,($0a52,a3)
	add.w	d2,($0a54,a3)
	move.w	($0a52,a3),($000e,a4)
	move.w	($0a54,a3),($0010,a4)
	bra	L016ef4
L01739e:
	cmp.w	#$000a,d0
	bne	L0173ce
	tst.w	d1
	beq	L0173b4
	move.w	($0a50,a3),d0
	muls.w	#$ffff,d0
	move.w	d0,($0a50,a3)
L0173b4:
	tst.w	d2
	beq	L0173c4
	move.w	($003c,a4),d0
	muls.w	#$ffff,d0
	move.w	d0,($003c,a4)
L0173c4:
	move.w	($0a50,a3),($0028,a4)
	bra	L016ef4
L0173ce:
	moveq.l	#$00,d0
L0173d0:
	movem.l	(sp)+,a3-a5
	rts

SR_標準SHOT関数:
	movem.l	d3-d4/a3,-(sp)
	move.l	($0010,sp),d1
	movea.l	($0014,sp),a0
	movea.l	($0018,sp),a3
	move.w	($001e,sp),d0
	move.w	($0022,sp),d2
	move.w	($0026,sp),d3
	tst.w	d0						;shot_cmdチェック
	bne	L0173fe
	pea.l	($0000)					;SHOT_CMD_無効化の時
	bra	L0174fe
L0173fe:
	cmp.w	#$0001,d0
	bne	L017428
	pea.l	($0001)					;SHOT_CMD_有効化の時
	move.l	a3,-(sp)
	move.l	d1,-(sp)
	jsr	(SYSCALL_00ac_Shot設定_モジュール状態)
	lea.l	($000c,sp),sp
	move.l	#L020298,($0022,a3)		;shot->hit_info
	moveq.l	#$00,d4
	move.l	d4,($0044,a3)			;shot->cell_info
	bra	L017544
L017428:
	cmp.w	#$0002,d0				;SHOT_CMD_状態変化
	bne	L01745a
	cmpi.w	#$0001,($000c,a3)		;shot->state == SHOT_STATE_有効
	bne	L017544
	cmpi.w	#$0100,($000e,a3)		;shot->pos_x
	bgt	L01744a
	cmpi.w	#$fff0,($000e,a3)
	bge	L017544
L01744a:
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	bra	L0174e4
L01745a:
	cmp.w	#$0003,d0
	beq	L017544
	cmp.w	#$0004,d0
	bne	L017476
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0007)
	bra	L0174e4
L017476:
	cmp.w	#$0005,d0
	bne	L01748a
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0007)
	bra	L0174e4
L01748a:
	cmp.w	#$0006,d0
	bne	L0174ce
	cmpi.w	#$006f,($0008,a0)
	bgt	L0174c2
	tst.w	($0f1a,a0)
	bne	L0174c2
	cmpi.w	#$0001,($002a,a3)
	bgt	L0174b4
	movea.l	($0022,a3),a0
	move.w	#$003c,($000e,a0)
	bra	L017544
L0174b4:
	movea.l	($0022,a3),a0
	move.w	#$0030,($000e,a0)
	bra	L017544
L0174c2:
	movea.l	($0022,a3),a0
	move.w	#$0031,($000e,a0)
	bra	L017544
L0174ce:
	cmp.w	#$0007,d0
	bne	L0174f4
	clr.w	($002a,a3)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0008)
L0174e4:
	move.l	a3,-(sp)
	move.l	d1,-(sp)
	jsr	(SYSCALL_00a8_Shot送信_コマンド)
	lea.l	($0014,sp),sp
	bra	L017544
L0174f4:
	cmp.w	#$0008,d0
	bne	L01750e
	pea.l	(-$0001)
L0174fe:
	move.l	a3,-(sp)
	move.l	d1,-(sp)
	jsr	(SYSCALL_00ac_Shot設定_モジュール状態)
	lea.l	($000c,sp),sp
	bra	L017544
L01750e:
	cmp.w	#$0009,d0
	bne	L01751e
	add.w	d2,($000e,a3)
	add.w	d3,($0010,a3)
	bra	L017544
L01751e:
	cmp.w	#$000a,d0
	bne	L017544
	tst.w	d2
	beq	L017534
	move.w	($0028,a3),d0
	muls.w	#$ffff,d0
	move.w	d0,($0028,a3)
L017534:
	tst.w	d3
	beq	L017544
	move.w	($003c,a3),d0
	muls.w	#$ffff,d0
	move.w	d0,($003c,a3)
L017544:
	movem.l	(sp)+,d3-d4/a3
	rts

SYSCALL_00ac_Shot設定_モジュール状態:
	movem.l	d3/a3-a4,-(sp)
	movea.l	($0010,sp),a4
	movea.l	($0014,sp),a3
	move.w	($001a,sp),d3
	cmp.w	#$0001,d3
	bne	L017622
	cmpi.w	#$0001,($000c,a3)
	beq	L017622
	move.w	#$0001,($000a,a3)
	move.w	#$0001,($0012,a3)
	move.w	#$0001,($0014,a3)
	clr.w	($0040,a3)
	clr.w	($0042,a3)
	clr.w	($0016,a3)
	clr.w	($0018,a3)
	move.w	#$0010,($001a,a3)
	move.w	#$0010,($001c,a3)
	move.w	#$0001,($002a,a3)
	clr.w	($002c,a3)
	clr.w	($0028,a3)
	clr.w	($003c,a3)
	clr.w	($0026,a3)
	clr.w	($002e,a3)
	moveq.l	#$00,d1
	move.l	d1,($0030,a3)
	move.w	#$0001,($003e,a3)
	cmpi.w	#$0001,($01b6,a4)
	bne	L0175d2
	move.w	($0006,a4),d1
	add.w	#$0034,d1
	bra	L0175da
L0175d2:
	move.w	($0006,a4),d1
	add.w	#$ffdc,d1
L0175da:
	move.w	d1,($000e,a3)
	pea.l	($0000)
	move.l	a4,-(sp)
	jsr	(SYSCALL_017c_Spr取得_番号)
	addq.w	#8,sp
	move.w	d0,($0020,a3)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($001e)
	move.l	a4,-(sp)
	jsr	(SYSCALL_00e0_Pcg取得_コード)
	lea.l	($001c,sp),sp
	move.w	d0,($001e,a3)
	moveq.l	#$00,d1
	move.l	d1,($0022,a3)
	move.l	d1,($0044,a3)
L017622:
	move.w	d3,($000c,a3)
	movem.l	(sp)+,d3/a3-a4
	rts

SYSCALL_00d4_Shot演出_ヒットマーク:
	link	a6,#-$0002
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0008,a6),a3
	movea.l	($000c,a6),a0
	move.w	($0012,a6),d3
	move.w	($0016,a6),d4
	move.w	($001a,a6),d0
	move.w	($001e,a6),d1
	movea.l	($132a,a3),a1
	moveq.l	#$03,d2
	move.w	#$0001,(-$0002,a6)
	tst.w	d0
	beq	L01766a
	tst.w	d1
	beq	L01766a
	cmpi.w	#$7ffe,($09f0,a1)
	ble	L01766a
	moveq.l	#$02,d2
L01766a:
	cmpa.w	#$0000,a0
	beq	L017684
	move.w	($0028,a0),d5
	neg.w	d5
	move.w	d5,($0f1e,a3)
	move.w	($003c,a0),d5
	neg.w	d5
	move.w	d5,($0f20,a3)
L017684:
	move.w	d2,($0a6c,a3)
	move.w	#$000f,($0a70,a3)
	move.w	d3,($0a72,a3)
	add.w	#$0010,d4
	move.w	d4,($0a74,a3)
	move.w	#$0001,($0a6e,a3)
	move.l	($0990,a3),(L06f432)		;VCT_標準SHOT消滅マーク処理
	beq	L0176d2
	pea.l	(-$0002,a6)
	pea.l	($0a6e,a3)
	pea.l	($0000)
	pea.l	($0a74,a3)
	pea.l	($0a72,a3)
	pea.l	($0a70,a3)
	pea.l	(-$0001)
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
L0176d2:
	move.w	($0a72,a3),($1732,a3)
	move.w	($0a74,a3),($1734,a3)
	movem.l	(-$0012,a6),d3-d5/a3
	unlk	a6
	rts

SYSCALL_005c_XXXX:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	cmpi.w	#$0002,($0a4e,a3)
	bne	L017732
	pea.l	($0000)
	pea.l	($0000)
	movea.w	($0a54,a3),a0
	pea.l	($0008,a0)
	movea.w	($0a52,a3),a0
	pea.l	($0008,a0)
	pea.l	($0000)
	move.l	a3,-(sp)
	jsr	(SYSCALL_00d4_Shot演出_ヒットマーク)
	lea.l	($0018,sp),sp
	move.w	($0a50,a3),d0
	neg.w	d0
	move.w	d0,($0f1e,a3)
	clr.w	($0f20,a3)
	move.w	#$0003,($0a4e,a3)
L017732:
	movea.l	(sp)+,a3
	rts

SYSCALL_01d0_Shot設定_セル座標:
	movea.l	($0004,sp),a2
	movea.l	($0044,a2),a1
	movea.l	(a2),a0
	cmpi.w	#$0001,($01b6,a0)
	bne	L017756
	move.w	($0006,a0),d2
	add.w	($0008,a1),d2
	move.w	d2,($000e,a2)
	bra	L017772
L017756:
	move.w	($0008,a1),d0
	add.w	#$ffd0,d0
	move.w	($0006,a0),d2
	sub.w	d0,d2
	move.w	d2,d0
	move.w	($0004,a1),d1
	asl.w	#4,d1
	sub.w	d1,d0
	move.w	d0,($000e,a2)
L017772:
	tst.w	($0f1a,a0)
	bne	L017786
	move.w	($0008,a0),d2
	add.w	($000a,a1),d2
	move.w	d2,($0010,a2)
	bra	L017796
L017786:
	move.w	($0008,a0),d0
	add.w	($0f1c,a0),d0
	add.w	($000a,a1),d0
	move.w	d0,($0010,a2)
L017796:
	rts

SYSCALL_01d4_Shot設定_セル矩形:
	movea.l	($0004,sp),a1
	movea.l	($0044,a1),a0
	move.w	($0004,a0),($0012,a1)
	move.w	($0006,a0),($0014,a1)
	move.w	($000c,a0),($0040,a1)
	move.w	($000e,a0),($0042,a1)
	tst.w	($0040,a1)
	bne	L0177c6
	move.w	($0010,a0),($0016,a1)
	bra	L0177d4
L0177c6:
	move.w	($0012,a1),d0
	asl.w	#4,d0
	sub.w	($0012,a0),d0
	move.w	d0,($0016,a1)
L0177d4:
	tst.w	($0042,a1)
	bne	L0177e2
	move.w	($0014,a0),($0018,a1)
	bra	L0177f0
L0177e2:
	move.w	($0014,a1),d0
	asl.w	#4,d0
	sub.w	($0016,a0),d0
	move.w	d0,($0018,a1)
L0177f0:
	move.w	($0012,a0),d0
	sub.w	($0010,a0),d0
	addq.w	#1,d0
	move.w	d0,($001a,a1)
	move.w	($0016,a0),d0
	sub.w	($0014,a0),d0
	addq.w	#1,d0
	move.w	d0,($001c,a1)
	rts

SYSCALL_01d8_Shot設定_表示セル:
	movem.l	d3-d7/a3-a4,-(sp)
	movea.l	($0020,sp),a4
	tst.w	($0042,a4)
	bne	L01782c
	move.w	($0010,a4),d4
	add.w	#$0010,d4
	move.w	($001e,a4),d3
	moveq.l	#$10,d6
	bra	L017842
L01782c:
	move.w	($0014,a4),d0
	asl.w	#4,d0
	move.w	d0,d4
	add.w	($0010,a4),d4
	move.w	($001e,a4),d3
	add.w	#$8000,d3
	moveq.l	#$f0,d6
L017842:
	movea.l	(a4),a0
	movea.l	($0044,a4),a1
	movea.l	($174a,a0),a3
	adda.l	(a1),a3
	move.w	($0020,a4),d0
	ext.l	d0
	move.l	d0,d1
	asl.l	#2,d1
	lea.l	(一括表示用バッファ_スプライト座標),a2
	adda.l	d1,a2
	lea.l	(一括表示用バッファ_スプライトパターン番号),a1
	adda.l	d1,a1
	add.l	d0,d0
	lea.l	(一括表示用バッファ_スプライト表示フラグ),a0
	adda.l	d0,a0
	move.w	($0012,a4),d5
	cmpi.w	#$0001,($0028,a4)
	bne	L017884
	tst.w	($0040,a4)
	beq	L017892
L017884:
	cmpi.w	#$ffff,($0028,a4)
	bne	L0178d6
	tst.w	($0040,a4)
	beq	L0178d6
L017892:
	move.w	($000e,a4),d7
	add.w	#$0010,d7
	move.w	($0014,a4),d2
	subq.w	#1,d2
	bmi	L01791e
L0178a2:
	move.w	d7,d1
	move.w	d5,d0
	subq.w	#1,d0
	bmi	L0178ce
L0178aa:
	tst.w	(a3)+
	beq	L0178c6
	move.w	d1,(a2)
	move.w	d4,($0002,a2)
	move.w	d3,(a1)
	addq.w	#1,d3
	move.w	#$0001,($0002,a1)
	move.w	#$0001,(a0)+
	addq.w	#4,a2
	addq.w	#4,a1
L0178c6:
	add.w	#$0010,d1
	subq.w	#1,d0
	bpl	L0178aa
L0178ce:
	add.w	d6,d4
	subq.w	#1,d2
	bpl	L0178a2
	bra	L01791e
L0178d6:
	move.w	d5,d0
	asl.w	#4,d0
	move.w	d0,d7
	add.w	($000e,a4),d7
	add.w	#$4000,d3
	move.w	($0014,a4),d2
	subq.w	#1,d2
	bmi	L01791e
L0178ec:
	move.w	d7,d1
	move.w	d5,d0
	subq.w	#1,d0
	bmi	L017918
L0178f4:
	tst.w	(a3)+
	beq	L017910
	move.w	d1,(a2)
	move.w	d4,($0002,a2)
	move.w	d3,(a1)
	addq.w	#1,d3
	move.w	#$0001,($0002,a1)
	move.w	#$0001,(a0)+
	addq.w	#4,a2
	addq.w	#4,a1
L017910:
	add.w	#$fff0,d1
	subq.w	#1,d0
	bpl	L0178f4
L017918:
	add.w	d6,d4
	subq.w	#1,d2
	bpl	L0178ec
L01791e:
	movem.l	(sp)+,d3-d7/a3-a4
	rts

SYSCALL_01f8_Bgm制御_停止:
	movem.l	d0-d7/a0-a5,-(sp)
	moveq.l	#$0a,d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	trap	#3
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SYSCALL_01fc_Bgm制御_再生:
	move.l	($0004,sp),d0
	addq.l	#7,d0
	move.l	d0,(L071632)
	movem.l	d0-d7/a0-a5,-(sp)
	moveq.l	#$00,d1
	trap	#3
	movea.l	(L071632),a1
	moveq.l	#$11,d1
	moveq.l	#$00,d2
	trap	#3
	tst.w	(L0690b0)
	bne	L01796a
	moveq.l	#$44,d1
	move.l	#$ffffff00,d2
	trap	#3
L01796a:
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SYSCALL_0288_Bgm制御_再生２:
	move.l	($0004,sp),d0
	addq.l	#7,d0
	move.l	d0,(L071632)
	movem.l	d0-d7/a0-a5,-(sp)
	movea.l	(L071632),a1
	moveq.l	#$11,d1
	moveq.l	#$00,d2
	trap	#3
	tst.w	(L0690b0)
	bne	L01799e
	moveq.l	#$44,d1
	move.l	#$ffffff00,d2
	trap	#3
L01799e:
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SYSCALL_0200_Bgm制御_フェードアウト:
	movem.l	d0-d7/a0-a5,-(sp)
	moveq.l	#$1a,d1
	moveq.l	#$40,d2
	trap	#3
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SYSCALL_0204_Bgm取得_状態:
	movem.l	d0-d7/a0-a5,-(sp)
	moveq.l	#$09,d1
	moveq.l	#$00,d2
	trap	#3
	move.l	d0,(L071636)
	movem.l	(sp)+,d0-d7/a0-a5
	move.l	(L071636),d0
	rts

SYSCALL_026c_Bgm確保_ＺＭＤメモリ:
	movem.l	d3-d4/a3,-(sp)
	move.l	($0010,sp),d3
	move.l	($0014,sp),d4
	move.l	($0018,sp),d0
	tst.w	(SFSYSINFO_003c_MIDIサウンド有効)
	beq	L017a02
	move.l	d0,-(sp)
	move.l	d3,-(sp)
	lea.l	(SYSCALL_0268_Data取得_ファイルサイズ),a3
	jsr	(a3)
	addq.w	#8,sp
	tst.l	d0
	bgt	L017a0e
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(a3)
	bra	L017a0c
L017a02:
	move.l	d4,-(sp)
	move.l	d3,-(sp)
	jsr	(SYSCALL_0268_Data取得_ファイルサイズ)
L017a0c:
	addq.w	#8,sp
L017a0e:
	tst.l	d0
	bgt	L017a16
	moveq.l	#$00,d0
	bra	L017a20
L017a16:
	move.l	d0,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
L017a20:
	movem.l	(sp)+,d3-d4/a3
	rts

L017a26:
	.dc.b	$72,$62,$00,$00
SYSCALL_0208_Bgm展開_ＺＭＤファイル:
	link	a6,#-$0136
	movem.l	d3-d5/a3,-(sp)
	move.l	($0008,a6),d4
	move.l	($0010,a6),d5
	tst.w	(SFSYSINFO_003c_MIDIサウンド有効)
	beq	L017a86
	move.l	a6,d3
	add.l	#$fffffeca,d3
	move.l	d3,-(sp)
	move.l	($0014,a6),-(sp)
	move.l	d4,-(sp)
	lea.l	(L008c7e),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	tst.l	d0
	bge	L017a98
	move.l	d3,-(sp)
	move.l	d5,-(sp)
	move.l	d4,-(sp)
	jsr	(a3)
	bra	L017a94
L017a86:
	pea.l	(-$0136,a6)
	move.l	d5,-(sp)
	move.l	d4,-(sp)
	jsr	(L008c7e)
L017a94:
	lea.l	($000c,sp),sp
L017a98:
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	pea.l	(-$0136,a6)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	tst.l	d0
	blt	L017ace
	pea.l	(L017a26)
	pea.l	(-$0136,a6)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d3
	bgt	L017ad2
L017ace:
	moveq.l	#$01,d0
	bra	L017af4
L017ad2:
	move.l	d3,-(sp)
	pea.l	($0001)
	move.l	(-$001c,a6),-(sp)
	move.l	($000c,a6),-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
	moveq.l	#$00,d0
L017af4:
	movem.l	(-$0146,a6),d3-d5/a3
	unlk	a6
	rts

L017afe:
	.dc.b	'BGM.ZPD',$00
L017b06:
	.dc.b	'(ALLOC_ZPD_BUFF)',$00,$00
L017b18:
	.dc.b	'メモリが不足しています',$00,$00
SYSCALL_020c_Bgm展開_ＺＰＤファイル:
	link	a6,#-$0100
	movem.l	d3-d6/a3,-(sp)
	move.l	($0008,a6),d3
	movea.l	($000c,a6),a3
	tst.b	(a3)
	bne	L017b7e
	tst.w	(L0690aa)
	beq	L017c54
	pea.l	(L017afe)
	pea.l	(-$0001)
	jsr	(SYSCALL_0268_Data取得_ファイルサイズ)
	addq.w	#8,sp
	move.l	d0,d5
	pea.l	(-$0100,a6)
	pea.l	(L017afe)
	pea.l	(-$0001)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	moveq.l	#$00,d6
	bra	L017ba0
L017b7e:
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	jsr	(SYSCALL_0268_Data取得_ファイルサイズ)
	addq.w	#8,sp
	move.l	d0,d5
	pea.l	(-$0100,a6)
	move.l	a3,-(sp)
	move.l	d3,-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	moveq.l	#$01,d6
L017ba0:
	tst.l	d5
	ble	L017be6
	jsr	(SYSCALL_01f8_Bgm制御_停止)
	tst.l	(L0690a6)
	beq	L017bc8
	move.l	(L0690a6),-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	addq.w	#4,sp
	moveq.l	#$00,d1
	move.l	d1,(L0690a6)
L017bc8:
	move.w	#$ffff,(L0690aa)
	pea.l	(L017a26)
	pea.l	(-$0100,a6)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L017bea
L017be6:
	moveq.l	#$01,d0
	bra	L017c56
L017bea:
	move.l	d5,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d3
	bne	L017c0c
	pea.l	(L017b06)
	pea.l	(L017b18)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L017c0c:
	move.l	d4,-(sp)
	pea.l	($0001)
	move.l	d5,-(sp)
	move.l	d3,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	move.l	d3,d1
	addq.l	#8,d1
	move.l	d1,(L071632)
	movem.l	d0-d7/a0-a5,-(sp)
	moveq.l	#$00,d1
	trap	#3
	movea.l	(L071632),a1
	moveq.l	#$46,d1
	trap	#3
	movem.l	(sp)+,d0-d7/a0-a5
	move.l	d3,(L0690a6)
	move.w	d6,(L0690aa)
L017c54:
	moveq.l	#$00,d0
L017c56:
	movem.l	(-$0114,a6),d3-d6/a3
	unlk	a6
	rts

L017c60:
	move.w	($0006,sp),(L0690b0)
	rts

L017c6a:
	move.w	($000e,sp),d1
	move.w	($0006,sp),d2
	ext.l	d2
	lea.l	(L069a02),a0
	move.l	d2,d0
	add.l	d0,d0
	add.l	d2,d0
	add.l	d0,d0
	move.l	($0008,sp),(a0,d0.l)
	move.w	d1,($04,a0,d0.l)
	rts

SYSCALL_0068_音声再生_標準:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d1
	move.w	($000e,sp),d0
	cmp.w	#$0031,d0
	ble	L017ca6
	cmp.w	#$00c7,d0
	ble	L017cac
L017ca6:
	cmp.w	#$00e6,d0
	bne	L017cb2
L017cac:
	subq.w	#1,d0
	add.w	($000a,a0),d0
L017cb2:
	cmp.w	#$0001,d1
	bne	L017cbe
	move.w	($000a,a0),d1
	bra	L017cca
L017cbe:
	cmp.w	#$0002,d1
	bne	L017cca
	move.w	($000a,a0),d1
	addq.w	#3,d1
L017cca:
	ext.l	d0
	move.l	d0,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	rts

SYSCALL_006c_音声再生_ユーザ:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	move.l	($000c,sp),d1
	move.l	($0010,sp),d2
	cmp.w	#$0001,d0
	bne	L017cf8
	move.w	($000a,a0),d0
	bra	L017d04
L017cf8:
	cmp.w	#$0002,d0
	bne	L017d04
	move.w	($000a,a0),d0
	addq.w	#3,d0
L017d04:
	move.l	d2,-(sp)
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017e0a)
	lea.l	($000c,sp),sp
	rts

SYSCALL_01c0_音声取得_残り時間:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	cmp.w	#$0001,d0
	bne	L017d2c
	move.w	($000a,a0),d0
	bra	L017d38
L017d2c:
	cmp.w	#$0002,d0
	bne	L017d38
	move.w	($000a,a0),d0
	addq.w	#3,d0
L017d38:
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_PCM8ファンクションコール_データ長問い合わせ)
	addq.w	#4,sp
	rts

SYSCALL_01c4_音声停止:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	cmp.w	#$0001,d0
	bne	L017d5a
	move.w	($000a,a0),d0
	bra	L017d66
L017d5a:
	cmp.w	#$0002,d0
	bne	L017d66
	move.w	($000a,a0),d0
	addq.w	#3,d0
L017d66:
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017eba)
	addq.w	#4,sp
	rts

L017d74:
	movea.l	($0004,sp),a0
	movea.w	($000a,sp),a1
	movea.w	($000a,a0),a0
	pea.l	(-$01,a0,a1.l)
	move.l	a0,-(sp)
	jsr	(SYSCALL_0024_音声再生)
	addq.w	#8,sp
	rts

SYSCALL_0024_音声再生:
	movem.l	d3-d4,-(sp)
	move.w	($000e,sp),d4			;arg1=再生チャンネル
	move.w	($0012,sp),d3			;arg2=音声ID
	tst.w	d4
	bne	L017dc2
	cmp.w	#$00c7,d3
	bgt	L017dd2						;199より大きいとき分岐
	cmpi.w	#$00c7,(L0690b2)
	ble	L017dd2
	pea.l	($0000)
	jsr	(SR_PCM8ファンクションコール_データ長問い合わせ)					;SR_PCM8ファンクションコール_データ長問い合わせ(0);
	addq.w	#4,sp
	tst.l	d0
	bne	L017e04
	bra	L017dd2
L017dc2:
	cmp.w	#$0003,d4
	ble	L017dd8
	cmpi.w	#$0008,(SFSYSINFO_0004_PCMチャンネル数)
	bgt	L017dd8
L017dd2:
	move.w	d3,(L0690b2)
L017dd8:
	move.w	d3,d1
	ext.l	d1
	lea.l	(L069a02),a0
	move.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	add.l	d0,d0
	moveq.l	#$00,d1
	move.w	($04,a0,d0.l),d1
	move.l	d1,-(sp)
	move.l	(a0,d0.l),-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(SR_PCM8ファンクションコール_L017e0a)					;SR_PCM8ファンクションコール_L017e0a(?, ?, ?)
	lea.l	($000c,sp),sp
L017e04:
	movem.l	(sp)+,d3-d4
	rts

SR_PCM8ファンクションコール_L017e0a:
	link	a6,#$0000
	move.w	($000a,a6),d1
	move.l	($0010,a6),d2
	beq	L017e68
	cmpi.w	#$0008,(SFSYSINFO_0004_PCMチャンネル数)
	ble	L017e24
	addq.w	#6,d1
L017e24:
	moveq.l	#$00,d0
	move.w	d1,d0
	lea.l	(L020058),a0
	add.l	d0,d0
	move.w	(a0,d0.l),(L07163e)
	move.l	($000c,a6),(L071640)
	move.l	d2,(L071644)
	movem.l	d0-d7/a0-a5,-(sp)
	move.l	#$ffff0403,d1
	movea.l	(L071640),a1
	move.l	(L071644),d2
	move.w	(L07163e),d0
	trap	#2						;PCM8ファンクションコール
	movem.l	(sp)+,d0-d7/a0-a5
L017e68:
	unlk	a6
	rts

SR_PCM8ファンクションコール_データ長問い合わせ:
	move.w	($0006,sp),d1			;d1=arg1
	
	if (SFSYSINFO_0004_PCMチャンネル数 > 8) d1 += 6;

L017e7c:
	moveq.l	#$00,d0
	move.w	d1,d0
	lea.l	(L020070),a0
	add.l	d0,d0					;d0 = d1 * 2;
	move.w	(a0,d0.l),(L07163e)		;L07163e = L020070[d1 * 2];
	movem.l	d0-d7/a0-a5,-(sp)
	move.w	(L07163e),d0
	trap	#2						;PCM8ファンクションコール
	move.l	d0,(L071644)
	movem.l	(sp)+,d0-d7/a0-a5
	tst.l	(L071644)
	bgt	L017eb2
	moveq.l	#$00,d0
	bra	L017eb8
L017eb2:
	move.l	(L071644),d0
L017eb8:
	rts

SR_PCM8ファンクションコール_L017eba:
	move.w	($0006,sp),d1
	cmpi.w	#$0008,(SFSYSINFO_0004_PCMチャンネル数)
	ble	L017eca
	addq.w	#6,d1
L017eca:
	moveq.l	#$00,d0
	move.w	d1,d0
	lea.l	(L020088),a0
	add.l	d0,d0
	move.w	(a0,d0.l),(L07163e)
	movem.l	d0-d7/a0-a5,-(sp)
	move.l	#$ffff0400,d1
	move.w	(L07163e),d0
	trap	#2				;pcm8ファンクションコール
	movem.l	(sp)+,d0-d7/a0-a5
	rts

SR_PCM8ファンクションコール_一時停止:
	movem.l	d0-d7/a0-a5,-(sp)
	move.w	#$0101,d0
	trap	#2
	movem.l	(sp)+,d0-d7/a0-a5
	rts

L017f06:
	.dc.b	'(ALLOC_VOICE_SMP)',$00
L017f18:
	.dc.b	'メモリが不足しています',$00,$00
SR_Voiceデータメモリ確保(p1, size)
{
	d0 = SYSCALL_025c_Data確保_メモリブロック(size);
	if (d0 == 0) {
		SYSCALL_0264_システム異常終了("メモリが不足しています", "(ALLOC_VOICE_SMP)");
	}

	p1->174e_Voiceデータメモリポインタ = d0;
}

SR_Voiceデータメモリ解放(p1)
{
	if (p1->174e_Voiceデータメモリポインタ) {
		SYSCALL_0260_Data解放_メモリブロック(p1->174e_Voiceデータメモリポインタ);
		p1->174e_Voiceデータメモリポインタ = 0;
	}
}

L017f8c:
	link	a6,#-$0008
	movem.l	a3-a4,-(sp)
	movea.l	($0008,a6),a3
	movea.l	($000c,a6),a4
	pea.l	($00ff)
	jsr	(XCLIB_dos_inpout)
	addq.w	#4,sp
	move.w	d0,(L06f42c)
	move.l	($0024,a3),d2
	cmp.l	($0020,a3),d2
	beq	L01838a
	move.w	($0a00,a3),d0		;DSP横方向スプライト数
	muls.w	($0a02,a3),d0		;DSP縦方向スプライト数
	move.w	d0,(-$0002,a6)
	move.l	($0020,a3),($0024,a3)
	move.w	($05d8,a3),($05da,a3)
	move.l	($174a,a3),d2
	add.l	($0024,a3),d2
	move.l	d2,(L07164c)
	tst.w	($05da,a3)
	bne	L0180dc
	move.w	#$0001,(-$0004,a6)
	cmpi.w	#$0040,(L0200a0)
	bne	L018038
	cmp.w	#$0020,d0
	bgt	L018012
	move.w	#$0060,(L0200a0)
	move.l	#$00ebb000,(L071650)
	bra	L01804a
L018012:
	move.w	(-$0002,a6),d0
	add.w	#$ffe0,d0
	moveq.l	#$60,d2
	sub.w	d0,d2
	move.w	d2,(L0200a0)
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebb000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L01804a
L018038:
	move.w	#$0040,(L0200a0)
	move.l	#$00eba000,(L071650)
L01804a:
	move.l	($098c,a3),(L06f432)		;VCT_CSP形式PCG転送処理
	beq	L018076
	pea.l	(-$0004,a6)
	pea.l	(-$0002,a6)
	pea.l	(L071650)
	pea.l	(L07164c)
	move.l	a3,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
	lea.l	($0014,sp),sp
L018076:
	tst.w	(-$0004,a6)
	beq	L01838a
	movea.l	(L07164c),a0
	movea.l	(L071650),a1
	subq.w	#1,(-$0002,a6)
	bmi	L01838a
L018092:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	subq.w	#1,(-$0002,a6)
	bpl	L018092
	bra	L01838a
L0180dc:
	tst.w	($05da,a3)
	ble	L01829e
	cmpi.w	#$0040,(L0200a0)
	bne	L018146
	moveq.l	#$00,d1
	movea.l	(L07164c),a0
	move.w	(-$0002,a6),d0
	subq.w	#1,d0
	bmi	L018108
L0180fe:
	tst.w	(a0)+
	beq	L018104
	addq.w	#1,d1
L018104:
	subq.w	#1,d0
	bpl	L0180fe
L018108:
	cmp.w	#$0020,d1
	bgt	L018122
	move.w	#$0060,(L0200a0)
	move.l	#$00ebb000,(L071650)
	bra	L018158
L018122:
	add.w	#$ffe0,d1
	moveq.l	#$60,d2
	sub.w	d1,d2
	move.w	d2,(L0200a0)
	move.w	d1,d0
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebb000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L018158
L018146:
	move.w	#$0040,(L0200a0)
	move.l	#$00eba000,(L071650)
L018158:
	movea.l	(L07164c),a2
	movea.l	(L071650),a1
	movea.w	(-$0002,a6),a0
	move.l	a0,d2
	add.l	d2,(L07164c)
	adda.l	(L07164c),a0
	move.l	a0,(L07164c)
	movea.l	(L07164c),a0
	subq.w	#1,(-$0002,a6)
	bmi	L01838a
L01818a:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L018292
	btst.l	#$0f,d0
	beq	L01819e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181a2
L01819e:
	clr.l	(a1)+
	clr.l	(a1)+
L0181a2:
	btst.l	#$0e,d0
	beq	L0181ae
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181b2
L0181ae:
	clr.l	(a1)+
	clr.l	(a1)+
L0181b2:
	btst.l	#$0d,d0
	beq	L0181be
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181c2
L0181be:
	clr.l	(a1)+
	clr.l	(a1)+
L0181c2:
	btst.l	#$0c,d0
	beq	L0181ce
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181d2
L0181ce:
	clr.l	(a1)+
	clr.l	(a1)+
L0181d2:
	btst.l	#$0b,d0
	beq	L0181de
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181e2
L0181de:
	clr.l	(a1)+
	clr.l	(a1)+
L0181e2:
	btst.l	#$0a,d0
	beq	L0181ee
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0181f2
L0181ee:
	clr.l	(a1)+
	clr.l	(a1)+
L0181f2:
	btst.l	#$09,d0
	beq	L0181fe
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018202
L0181fe:
	clr.l	(a1)+
	clr.l	(a1)+
L018202:
	btst.l	#$08,d0
	beq	L01820e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018212
L01820e:
	clr.l	(a1)+
	clr.l	(a1)+
L018212:
	btst.l	#$07,d0
	beq	L01821e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018222
L01821e:
	clr.l	(a1)+
	clr.l	(a1)+
L018222:
	btst.l	#$06,d0
	beq	L01822e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018232
L01822e:
	clr.l	(a1)+
	clr.l	(a1)+
L018232:
	btst.l	#$05,d0
	beq	L01823e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018242
L01823e:
	clr.l	(a1)+
	clr.l	(a1)+
L018242:
	btst.l	#$04,d0
	beq	L01824e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018252
L01824e:
	clr.l	(a1)+
	clr.l	(a1)+
L018252:
	btst.l	#$03,d0
	beq	L01825e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018262
L01825e:
	clr.l	(a1)+
	clr.l	(a1)+
L018262:
	btst.l	#$02,d0
	beq	L01826e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018272
L01826e:
	clr.l	(a1)+
	clr.l	(a1)+
L018272:
	btst.l	#$01,d0
	beq	L01827e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018282
L01827e:
	clr.l	(a1)+
	clr.l	(a1)+
L018282:
	btst.l	#$00,d0
	beq	L01828e
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L018292
L01828e:
	clr.l	(a1)+
	clr.l	(a1)+
L018292:
	subq.w	#1,(-$0002,a6)
	bpl	L01818a
	bra	L01838a
L01829e:
	cmpi.w	#$0040,(L0200a0)
	bne	L018300
	moveq.l	#$00,d1
	movea.l	(L07164c),a0
	move.w	(-$0002,a6),d0
	subq.w	#1,d0
	bmi	L0182c2
L0182b8:
	tst.w	(a0)+
	beq	L0182be
	addq.w	#1,d1
L0182be:
	subq.w	#1,d0
	bpl	L0182b8
L0182c2:
	cmp.w	#$0020,d1
	bgt	L0182dc
	move.w	#$0060,(L0200a0)
	move.l	#$00ebb000,(L071650)
	bra	L018312
L0182dc:
	add.w	#$ffe0,d1
	moveq.l	#$60,d2
	sub.w	d1,d2
	move.w	d2,(L0200a0)
	move.w	d1,d0
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebb000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L018312
L018300:
	move.w	#$0040,(L0200a0)
	move.l	#$00eba000,(L071650)
L018312:
	movea.l	(L07164c),a2
	movea.l	(L071650),a1
	movea.w	(-$0002,a6),a0
	move.l	a0,d2
	add.l	d2,(L07164c)
	adda.l	(L07164c),a0
	move.l	a0,(L07164c)
	movea.l	(L07164c),a0
	bra	L018384
L01833e:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L018384
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
L018384:
	subq.w	#1,(-$0002,a6)
	bpl	L01833e
L01838a:
	move.l	($0024,a4),d2
	cmp.l	($0020,a4),d2
	beq	L018768
	move.w	($0a00,a4),d0		;DSP横方向スプライト数
	muls.w	($0a02,a4),d0		;DSP縦方向スプライト数
	move.w	d0,(-$0006,a6)
	move.l	($0020,a4),($0024,a4)
	move.w	($05d8,a4),($05da,a4)
	move.l	($174a,a4),d2
	add.l	($0024,a4),d2
	move.l	d2,(L07164c)
	tst.w	($05da,a4)
	bne	L0184b6
	move.w	#$0001,(-$0008,a6)
	cmpi.w	#$0080,(L0200a2)
	bne	L018416
	cmp.w	#$0020,d0
	bgt	L0183ee
	move.w	#$00a0,(L0200a2)
	move.l	#$00ebd000,(L071650)
	bra	L018428
L0183ee:
	move.w	(-$0006,a6),d0
	add.w	#$ffe0,d0
	move.w	#$00a0,d2
	sub.w	d0,d2
	move.w	d2,(L0200a2)
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebd000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L018428
L018416:
	move.w	#$0080,(L0200a2)
	move.l	#$00ebc000,(L071650)
L018428:
	move.l	($098c,a4),(L06f432)		;VCT_CSP形式PCG転送処理
	beq	L018450
	pea.l	(-$0008,a6)
	pea.l	(-$0006,a6)
	pea.l	(L071650)
	pea.l	(L07164c)
	move.l	a4,-(sp)
	movea.l	(L06f432),a0
	jsr	(a0)
L018450:
	tst.w	(-$0008,a6)
	beq	L018768
	movea.l	(L07164c),a0
	movea.l	(L071650),a1
	subq.w	#1,(-$0006,a6)
	bmi	L018768
L01846c:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	subq.w	#1,(-$0006,a6)
	bpl	L01846c
	bra	L018768
L0184b6:
	tst.w	($05da,a4)
	ble	L01867a
	cmpi.w	#$0080,(L0200a2)
	bne	L018522
	moveq.l	#$00,d1
	movea.l	(L07164c),a0
	move.w	(-$0006,a6),d0
	subq.w	#1,d0
	bmi	L0184e2
L0184d8:
	tst.w	(a0)+
	beq	L0184de
	addq.w	#1,d1
L0184de:
	subq.w	#1,d0
	bpl	L0184d8
L0184e2:
	cmp.w	#$0020,d1
	bgt	L0184fc
	move.w	#$00a0,(L0200a2)
	move.l	#$00ebd000,(L071650)
	bra	L018534
L0184fc:
	add.w	#$ffe0,d1
	move.w	#$00a0,d2
	sub.w	d1,d2
	move.w	d2,(L0200a2)
	move.w	d1,d0
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebd000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L018534
L018522:
	move.w	#$0080,(L0200a2)
	move.l	#$00ebc000,(L071650)
L018534:
	movea.l	(L07164c),a2
	movea.l	(L071650),a1
	movea.w	(-$0006,a6),a0
	move.l	a0,d2
	add.l	d2,(L07164c)
	adda.l	(L07164c),a0
	move.l	a0,(L07164c)
	movea.l	(L07164c),a0
	subq.w	#1,(-$0006,a6)
	bmi	L018768
L018566:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L01866e
	btst.l	#$0f,d0
	beq	L01857a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01857e
L01857a:
	clr.l	(a1)+
	clr.l	(a1)+
L01857e:
	btst.l	#$0e,d0
	beq	L01858a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01858e
L01858a:
	clr.l	(a1)+
	clr.l	(a1)+
L01858e:
	btst.l	#$0d,d0
	beq	L01859a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01859e
L01859a:
	clr.l	(a1)+
	clr.l	(a1)+
L01859e:
	btst.l	#$0c,d0
	beq	L0185aa
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185ae
L0185aa:
	clr.l	(a1)+
	clr.l	(a1)+
L0185ae:
	btst.l	#$0b,d0
	beq	L0185ba
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185be
L0185ba:
	clr.l	(a1)+
	clr.l	(a1)+
L0185be:
	btst.l	#$0a,d0
	beq	L0185ca
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185ce
L0185ca:
	clr.l	(a1)+
	clr.l	(a1)+
L0185ce:
	btst.l	#$09,d0
	beq	L0185da
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185de
L0185da:
	clr.l	(a1)+
	clr.l	(a1)+
L0185de:
	btst.l	#$08,d0
	beq	L0185ea
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185ee
L0185ea:
	clr.l	(a1)+
	clr.l	(a1)+
L0185ee:
	btst.l	#$07,d0
	beq	L0185fa
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L0185fe
L0185fa:
	clr.l	(a1)+
	clr.l	(a1)+
L0185fe:
	btst.l	#$06,d0
	beq	L01860a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01860e
L01860a:
	clr.l	(a1)+
	clr.l	(a1)+
L01860e:
	btst.l	#$05,d0
	beq	L01861a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01861e
L01861a:
	clr.l	(a1)+
	clr.l	(a1)+
L01861e:
	btst.l	#$04,d0
	beq	L01862a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01862e
L01862a:
	clr.l	(a1)+
	clr.l	(a1)+
L01862e:
	btst.l	#$03,d0
	beq	L01863a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01863e
L01863a:
	clr.l	(a1)+
	clr.l	(a1)+
L01863e:
	btst.l	#$02,d0
	beq	L01864a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01864e
L01864a:
	clr.l	(a1)+
	clr.l	(a1)+
L01864e:
	btst.l	#$01,d0
	beq	L01865a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01865e
L01865a:
	clr.l	(a1)+
	clr.l	(a1)+
L01865e:
	btst.l	#$00,d0
	beq	L01866a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L01866e
L01866a:
	clr.l	(a1)+
	clr.l	(a1)+
L01866e:
	subq.w	#1,(-$0006,a6)
	bpl	L018566
	bra	L018768
L01867a:
	cmpi.w	#$0080,(L0200a2)
	bne	L0186de
	moveq.l	#$00,d1
	movea.l	(L07164c),a0
	move.w	(-$0006,a6),d0
	subq.w	#1,d0
	bmi	L01869e
L018694:
	tst.w	(a0)+
	beq	L01869a
	addq.w	#1,d1
L01869a:
	subq.w	#1,d0
	bpl	L018694
L01869e:
	cmp.w	#$0020,d1
	bgt	L0186b8
	move.w	#$00a0,(L0200a2)
	move.l	#$00ebd000,(L071650)
	bra	L0186f0
L0186b8:
	add.w	#$ffe0,d1
	move.w	#$00a0,d2
	sub.w	d1,d2
	move.w	d2,(L0200a2)
	move.w	d1,d0
	ext.l	d0
	asl.l	#7,d0
	move.l	#$00ebd000,d2
	sub.l	d0,d2
	move.l	d2,(L071650)
	bra	L0186f0
L0186de:
	move.w	#$0080,(L0200a2)
	move.l	#$00ebc000,(L071650)		;BGデータエリア0の先頭アドレス
L0186f0:
	movea.l	(L07164c),a2
	movea.l	(L071650),a1
	movea.w	(-$0006,a6),a0
	move.l	a0,d2
	add.l	d2,(L07164c)
	adda.l	(L07164c),a0
	move.l	a0,(L07164c)
	movea.l	(L07164c),a0
	bra	L018762
L01871c:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L018762
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
L018762:
	subq.w	#1,(-$0006,a6)
	bpl	L01871c
L018768:
	movem.l	(-$0010,a6),a3-a4
	unlk	a6
	rts

SYSCALL_0004_Spr設定_表示:
	movem.l	d3-d5,-(sp)
	move.w	($0016,sp),d3			;d3=X座標
	move.w	($001a,sp),d4			;d4=Y座標
	move.w	($001e,sp),d1			;d1=パターン
	move.w	($0022,sp),d2			;d2=プライオリティ
	move.w	($0012,sp),d0			;d0=スプライト番号
	ext.l	d0
	lea.l	(一括表示用バッファ_スプライト表示フラグ),a0
	move.l	d0,d5
	add.l	d5,d5
	move.w	#$0001,(a0,d5.l)		;一括表示用バッファ_スプライト表示フラグ + d0 * 2 の位置に1を書き込む
	lea.l	(一括表示用バッファ_スプライト座標),a0
	asl.l	#2,d0
	move.w	d3,(a0,d0.l)			;一括表示用バッファ_スプライト座標 + d0 * 4 の位置に d3を書き込む
	move.w	d4,($02,a0,d0.l)		;一括表示用バッファ_スプライト座標 + d0 * 4 +2 の位置に d4を書き込む
	lea.l	(一括表示用バッファ_スプライトパターン番号),a0
	move.w	d1,(a0,d0.l)			;一括表示用バッファ_スプライトパターン番号 + d0 * 4 の位置に d1を書き込む
	move.w	d2,($02,a0,d0.l)		;一括表示用バッファ_スプライトパターン番号 + d0 * 4 +2 の位置にd2を書き込む
	movem.l	(sp)+,d3-d5
	rts

L0187c0:
	.dc.b	'Sys_Spr設定_消去[%d]',$0a,$00
SYSCALL_0280_Spr設定_消去:
	movem.l	d3-d4,-(sp)
	move.w	($000e,sp),d3			;d3=スプライト番号
	move.w	d3,d4
	ext.l	d4
	move.l	d4,-(sp)
	pea.l	(L0187c0)
	jsr	(L01e2e4)
	addq.w	#8,sp
	tst.w	d3						;スプライト番号が0～127の範囲の時のみ非表示フラグ設定
	blt	L01880a
	cmp.w	#$007f,d3
	bgt	L01880a
	lea.l	(一括表示用バッファ_スプライト表示フラグ),a0
	move.l	d4,d0
	add.l	d0,d0
	clr.w	(a0,d0.l)
L01880a:
	movem.l	(sp)+,d3-d4
	rts

SR_キャラクタ身体・残像・影表示:
	link	a6,#-$000c
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0008,a6),a5				;引数1:p1
	move.w	($000e,a6),(-$000a,a6)		;引数2:フラグ

	if (flg <= 0) {
	}



	lea.l	(一括表示用バッファ_スプライト座標),a3
	lea.l	(一括表示用バッファ_スプライトパターン番号),a2
	lea.l	(一括表示用バッファ_スプライト表示フラグ),a1
	bgt	L018870
	move.w	($0006,a5),d2				;X座標
	move.w	($0008,a5),d4				;Y座標
	move.w	($001e,a5),d0				;???
	ext.l	d0
	move.l	d0,d1
	asl.l	#2,d1						;4倍
	adda.l	d1,a3						;a3=&一括表示用バッファ_スプライト座標[p1->001e_xxxx];
	adda.l	d1,a2						;a2=&一括表示用バッファ_スプライトパターン番号[p1->001e_xxxx];
	add.l	d0,d0						;2倍
	adda.l	d0,a1						;a1=&一括表示用バッファ_スプライト表示フラグ[p1->001e_xxxx];
	cmpi.w	#$0001,($000a,a5)			;プレイヤー番号
	bne	L018864
	move.w	(L0200a0),d3				;1pのときL0200a0の値に0x100加算
	add.w	#$0100,d3
	bra	L0188c2
L018864:
	move.w	(L0200a2),d3				;2pのときL0200a2の値に0x200加算
	add.w	#$0200,d3
	bra	L0188c2
L018870:
	// デバッグ矩形表示有効時、残像は表示しない
	if (SFSYSINFO_001e_デバッグモード有効フラグ && SFSYSINFO_004a_デバッグ_矩形表示有効_xxxx) {
		return;
	}
L018882:
	d2 = p1->0efe_残像X1;
	d4 = p1->0f00_残像Y1;
	if (d4 > BASE_LINE && !p1->0f1a_シューティングモード) {
		d4 = BASE_LINE;
	}
L018898:
	lea.l	($00e8,a3),a3
	lea.l	($00e8,a2),a2
	lea.l	($0074,a1),a1
	if (p1->000a_プレイヤー番号 == 1) {
		d3 = L0200a0 + 0x0700;
	} else {
		d3 = L0200a2 + 0x0800;
	}
L0188c2:
	d7 = p1->0a00_DSP横方向スプライト数;
	d6 = p1->0a02_DSP縦方向スプライト数;
	if (p1->0a0a_DSP垂直反転フラグ) {
		d5 = d4 + p1->0a06_xxxx+16;
		a6_000c = 16;
	} else {
		d0 = d4 + p1->0a06_xxxx;
		d5 = d0 + d6 * 16;
		a6_000c = -16;
	}
L0188fa:
	moveq.l	#$00,d4
	tst.w	(-$000a,a6)
	bgt	L018938
	tst.w	($0f22,a5)					;p1->0f22_キャラ振動フラグ
	beq	L018938
	tst.w	($0ac2,a5)					;p1->0ac2_気集中
	bne	L018938
	movea.l	($132a,a5),a0				;p1->132a_相手ハンドラ
	tst.w	($0ac2,a0)					;p2->0ac2_気集中
	bne	L018938
	move.w	($000a,a5),d0				;p1->000a_プレイヤー番号
	ext.l	d0
	subq.l	#1,d0
	lea.l	(L0200a6),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d1
	eori.w	#$0001,d1
	move.w	d1,(a0,d0.l)
	move.w	d1,d4
	subq.w	#1,d4
L018938:
	cmpi.w	#$0001,($01b6,a5)
	bne	L018b92
	tst.w	($0a08,a5)					;p1->0a08_DSP水平反転フラグ
	bne	L018a6c
	move.w	d2,d0
	add.w	($0a04,a5),d0
	move.w	d4,d1
	add.w	#$0010,d1
	add.w	d0,d1
	tst.w	($05da,a5)
	beq	L0189ee
	movea.l	($174a,a5),a0
	adda.l	($0024,a5),a0
	tst.w	($1754,a5)
	bne	L0189ae
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018976:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L0189a2
L01897e:
	tst.w	(a0)+
	beq	L01899a
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L01899a:
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L01897e
L0189a2:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018976
	bra	L018dda
L0189ae:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L0189b6:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L0189e2
L0189be:
	tst.w	(a0)+
	beq	L0189da
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L0189da:
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L0189be
L0189e2:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L0189b6
	bra	L018dda
L0189ee:
	tst.w	($1754,a5)
	bne	L018a30
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L0189fc:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018a24
L018a04:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018a04
L018a24:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L0189fc
	bra	L018dda
L018a30:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018a38:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018a60
L018a40:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018a40
L018a60:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018a38
	bra	L018dda
L018a6c:
	move.w	d2,d0
	add.w	($0a04,a5),d0
	move.w	d7,d1
	asl.w	#4,d1
	add.w	d0,d1
	add.w	d4,d1
	add.w	#$4000,d3
	tst.w	($05da,a5)
	beq	L018b14
	movea.l	($174a,a5),a0
	adda.l	($0024,a5),a0
	tst.w	($1754,a5)
	bne	L018ad4
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018a9c:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018ac8
L018aa4:
	tst.w	(a0)+
	beq	L018ac0
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018ac0:
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018aa4
L018ac8:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018a9c
	bra	L018dda
L018ad4:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018adc:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018b08
L018ae4:
	tst.w	(a0)+
	beq	L018b00
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018b00:
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018ae4
L018b08:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018adc
	bra	L018dda
L018b14:
	tst.w	($1754,a5)
	bne	L018b56
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018b22:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018b4a
L018b2a:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018b2a
L018b4a:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018b22
	bra	L018dda
L018b56:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018b5e:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018b86
L018b66:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018b66
L018b86:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018b5e
	bra	L018dda
L018b92:
	tst.w	($0a08,a5)		;DSP水平反転フラグ
	beq	L018cc0
	move.w	d2,d1
	sub.w	($0a04,a5),d1
	move.w	d7,d0
	asl.w	#4,d0
	add.w	#$ffc0,d0
	sub.w	d0,d1
	add.w	d4,d1
	tst.w	($05da,a5)
	beq	L018c42
	movea.l	($174a,a5),a0
	adda.l	($0024,a5),a0
	tst.w	($1754,a5)
	bne	L018c02
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018bca:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018bf6
L018bd2:
	tst.w	(a0)+
	beq	L018bee
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018bee:
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018bd2
L018bf6:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018bca
	bra	L018dda
L018c02:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018c0a:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018c36
L018c12:
	tst.w	(a0)+
	beq	L018c2e
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018c2e:
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018c12
L018c36:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018c0a
	bra	L018dda
L018c42:
	tst.w	($1754,a5)
	bne	L018c84
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018c50:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018c78
L018c58:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018c58
L018c78:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018c50
	bra	L018dda
L018c84:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018c8c:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018cb4
L018c94:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$0010,d0
	subq.w	#1,d2
	bpl	L018c94
L018cb4:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018c8c
	bra	L018dda
L018cc0:
	move.w	d2,d0
	sub.w	($0a04,a5),d0
	move.w	d4,d1
	add.w	#$0030,d1
	add.w	d0,d1
	add.w	#$4000,d3
	tst.w	($05da,a5)
	beq	L018d66
	movea.l	($174a,a5),a0
	adda.l	($0024,a5),a0
	tst.w	($1754,a5)
	bne	L018d28
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018cf0:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018d1c
L018cf8:
	tst.w	(a0)+
	beq	L018d14
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018d14:
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018cf8
L018d1c:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018cf0
	bra	L018dda
L018d28:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018d30:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018d5c
L018d38:
	tst.w	(a0)+
	beq	L018d54
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
L018d54:
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018d38
L018d5c:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018d30
	bra	L018dda
L018d66:
	tst.w	($1754,a5)
	bne	L018da4
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018d72:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018d9a
L018d7a:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0001,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018d7a
L018d9a:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018d72
	bra	L018dda
L018da4:
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L018dda
L018daa:
	move.w	d1,d0
	move.w	d7,d2
	subq.w	#1,d2
	bmi	L018dd2
L018db2:
	move.w	d0,(a3)
	move.w	d5,($0002,a3)
	move.w	d3,(a2)
	addq.w	#1,d3
	move.w	#$0003,($0002,a2)
	move.w	#$0001,(a1)+
	addq.w	#4,a3
	addq.w	#4,a2
	add.w	#$fff0,d0
	subq.w	#1,d2
	bpl	L018db2
L018dd2:
	add.w	(-$000c,a6),d5
	subq.w	#1,d4
	bpl	L018daa
L018dda:
	tst.w	(-$000a,a6)
	bne	L018e7a
	move.w	#$0001,(-$0008,a6)
	move.w	($0006,a5),(-$0002,a6)
	move.w	#$00d3,(-$0004,a6)
	cmpi.w	#$006f,($0008,a5)
	ble	L018e02
	clr.w	(-$0006,a6)
	bra	L018e18
L018e02:
	cmpi.w	#$0030,($0008,a5)
	ble	L018e12
	move.w	#$0001,(-$0006,a6)
	bra	L018e18
L018e12:
	move.w	#$0002,(-$0006,a6)
L018e18:
	cmpi.w	#$0001,($000a,a5)
	bne	L018e24
	moveq.l	#$7a,d3
	bra	L018e26
L018e24:
	moveq.l	#$7d,d3
L018e26:
	if (p1->0978_VCT_身体影処理)
		p1->0978_VCT_身体影処理(p1, d3, a6_mi0002, a6_mi0004, a6_mi0006, 0x0070, a6_mi0008);
L018e56:
	if (a6_mi0008)
		SYSCALL_0088_デフォルト身体影処理(p1, d3, a6_mi0002, a6_mi0004, a6_mi0006);
L018e7a:
	movem.l	(-$002c,a6),d3-d7/a3-a5
	unlk	a6
	rts

SYSCALL_0088_デフォルト身体影処理:
	movem.l	d3-d6/a3-a5,-(sp)
	movea.l	($0020,sp),a5
	move.w	($0026,sp),d6
	move.w	($002a,sp),d5
	move.w	($002e,sp),d4
	move.w	($0032,sp),d3
	tst.w	($0ac2,a5)
	ble	L018f06
	move.w	($000a,a5),d0
	ext.l	d0
	lea.l	(L0200aa),a0
	add.l	d0,d0
	tst.w	(a0,d0.l)
	bne	L018ef6
	move.w	#$0001,(a0,d0.l)
	addq.w	#1,(L0200b0)
	pea.l	($0080)
	pea.l	($0000)
	lea.l	(SR_暗転グラフィックパレット生成),a3
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0000)
	lea.l	(SR_グラフィックパレット反映),a4
	jsr	(a4)
	addq.w	#4,sp
	pea.l	($0080)
	pea.l	($0080)
	jsr	(a3)
	addq.w	#8,sp
	pea.l	($0080)
	jsr	(a4)
	addq.w	#4,sp
L018ef6:
	pea.l	($0001)
	move.l	a5,-(sp)
	jsr	(SYSCALL_0074_演出表示_砂煙)
	addq.w	#8,sp
	bra	L018f38
L018f06:
	move.w	($000a,a5),d0
	ext.l	d0
	lea.l	(L0200aa),a0
	add.l	d0,d0
	tst.w	(a0,d0.l)
	beq	L018f38
	clr.w	(a0,d0.l)
	subq.w	#1,(L0200b0)
	tst.w	(L0200b0)
	bgt	L018f38
	jsr	(SR_ステージパレット反映)
	clr.w	(L0200b0)
L018f38:
	lea.l	(MMP_SYS_0088_STAGE_影表示),a0
	move.l	(a0),(L06f432)
	beq	L018f60
	ext.l	d3
	move.l	d3,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	move.l	a5,-(sp)
	movea.l	(a0),a0
	jsr	(a0)
	lea.l	($0014,sp),sp
L018f60:
	movem.l	(sp)+,d3-d6/a3-a5
	rts

SR_スプライトスクロールレジスタ一括更新:
	movem.l	a3-a4,-(sp)
	movea.l	#$00eb0000,a1				;a1=スプライトスクロールレジスタの先頭アドレス
	lea.l	(一括表示用バッファ_スプライト座標),a3				;スプライト座標 * 128個
	lea.l	(一括表示用バッファ_スプライトパターン番号),a2				;スプライトパターン番号 * 128個
	lea.l	(一括表示用バッファ_スプライト表示フラグ),a4				;スプライト表示フラグ * 128個
	moveq.l	#$7f,d0						;全スプライト(=128個)に対して処理
L018f84:
	tst.w	(a4)
	beq	L018f96
	movea.w	(ワールドスプライトY座標),a0
	adda.l	(a3)+,a0
	move.l	a0,(a1)+					;スプライトX,Y座標書き込み
	move.l	(a2)+,(a1)+					;スプライトパターン番号書き込み
	bra	L018fa0
L018f96:
	addq.w	#4,a3
	addq.w	#4,a2
	addq.w	#4,a1
	moveq.l	#$00,d1
	move.l	d1,(a1)+					;スプライトパターン0を設定(=非表示)
L018fa0:
	clr.w	(a4)+
	subq.w	#1,d0
	bpl	L018f84							;ループ先頭に戻る
	movem.l	(sp)+,a3-a4
	rts

SR_最終ラスター割込み終了待ち:
	lea.l	(ラスター割込み処理実行中フラグ),a0
L018fb2:
	tst.w	(a0)
	bne	L018fb2
	move.w	#$0001,(ラスター割込み処理実行中フラグ)
	rts

L018fc0:
	tst.w	(L0200b2)
	beq	L018fe8
L018fc8:
	movem.l	d0-d7/a0-a5,-(sp)
	move.w	#$0001,(L0200b2)
	ori.w	#$0700,sr
	moveq.l	#$6c,d0
	suba.l	a1,a1
	trap	#15
	andi.w	#$f8ff,sr
	movem.l	(sp)+,d0-d7/a0-a5
	rte

L018fe8:
	ori.w	#$0700,sr
	moveq.l	#$6c,d0
	move.w	#$0001,d1
	lea.l	(L018fc8),a1
	trap	#15
	andi.w	#$f8ff,sr
	tst.w	(L0200b2)
	bne	L019014
L019006:
	jsr	(乱数発生)
	tst.w	(L0200b2)
	beq	L019006
L019014:
	rts

SR_MESS_SP_PCGパターン定義(コピー元PCG番号, コピー先PCG番号, 個数)
{
	a1 = MESS_SP_PCGデータ格納領域 + コピー元PCG番号 * 128;
	a0 = 0x00eb800 + (コピー先PCG番号 + 24) * 128;
	for (d1 = 0; d1 < 個数; d1++) {
		for (d0 = 0; d0 <= 63; d0++) {
			*a0++ = *a1++;
		}
	}
}

SR_MESS_SP表示(x, y, w, pat, pal)
{
	pat = (pat + 24) * 4 + pal;

	for (d5 = 0; d5 < w; d5++) {
		SR_BGページ1_書き込み(x, y, pat++);
		SR_BGページ1_書き込み(x++, y+1, pat++);
		SR_BGページ1_書き込み(x, y, pat++);
		SR_BGページ1_書き込み(x++, y+1, pat++);
	}
}

L0190ce:
	.dc.b	'(ALLOC_CHAR_ASP)',$00,$00
L0190e0:
	.dc.b	'メモリが不足しています',$00,$00
SR_CharAspデータメモリ確保:
	link	a6,#$0000
	move.l	d3,-(sp)
	move.l	($000c,a6),-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d3
	bne	L019122
	pea.l	(L0190ce)
	pea.l	(L0190e0)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L019122:
	movea.l	($0008,a6),a0
	move.l	d3,($174a,a0)
	move.l	(-$0004,a6),d3
	unlk	a6
	rts

SR_CharAspデータメモリ解放:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	tst.l	($174a,a3)
	beq	L019150
	move.l	($174a,a3),-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	addq.w	#4,sp
	moveq.l	#$00,d0
	move.l	d0,($174a,a3)
L019150:
	movea.l	(sp)+,a3
	rts

L019154:
	.dc.b	$72,$62,$00,$00
L019158:
	.dc.b	'(ALLOC_ASP1_BUFF)',$00
L01916a:
	.dc.b	'DECODE ASP MODE 1',$0a,$00,$00
L01917e:
	.dc.b	'DECODE ASP MODE 2',$0a,$00,$00
L019192:
	link	a6,#-$003e
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0008,a6),a3
	move.l	($000c,a6),d3
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	move.l	(-$001c,a6),d4
	pea.l	(L019154)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d3
	bgt	L0191da
	moveq.l	#$ff,d0
	bra	L0192e8
L0191da:
	move.l	d3,-(sp)
	pea.l	($0001)
	pea.l	($0006)
	pea.l	(-$003e,a6)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	subq.l	#6,d4
	cmpi.b	#$32,(-$0039,a6)
	bne	L019204
	move.w	#$0001,($05d8,a3)
	bra	L01920a
L019204:
	move.w	#$ffff,($05d8,a3)
L01920a:
	tst.w	($05d8,a3)
	bge	L019298
	move.l	d4,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d5
	bne	L019234
	pea.l	(L019158)
	pea.l	(L0190e0)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L019234:
	pea.l	(L01916a)
	pea.l	($0003)
	jsr	(L005bb0)
	addq.w	#8,sp
	move.l	d3,-(sp)
	pea.l	($0001)
	move.l	d4,-(sp)
	move.l	d5,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	move.l	d4,-(sp)
	move.l	d5,-(sp)
	jsr	(L019630)
	addq.w	#8,sp
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CharAspデータメモリ確保)
	addq.w	#8,sp
	move.l	($174a,a3),-(sp)
	move.l	d4,-(sp)
	move.l	d5,-(sp)
	jsr	(L01947c)
	lea.l	($000c,sp),sp
	move.l	d5,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	bra	L0192e6
L019298:
	tst.w	($05d8,a3)
	bgt	L0192aa
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
	moveq.l	#$ff,d0
	bra	L0192e8
L0192aa:
	pea.l	(L01917e)
	pea.l	($0003)
	jsr	(L005bb0)
	addq.w	#8,sp
	move.l	d4,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CharAspデータメモリ確保)
	addq.w	#8,sp
	move.l	d3,-(sp)
	pea.l	($0001)
	move.l	d4,-(sp)
	move.l	($174a,a3),-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
L0192e6:
	move.l	d4,d0
L0192e8:
	movem.l	(-$004e,a6),d3-d5/a3
	unlk	a6
	rts

L0192f2:
	.dc.b	'DECODE CSP',$0a,$00
L0192fe:
	.dc.b	'(ALLOC_CSP_BUFF)',$00,$00
L019310:
	link	a6,#-$0036
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0008,a6),a3
	move.l	($000c,a6),d3
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	move.l	(-$001c,a6),d5
	pea.l	(L019154)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d4
	bgt	L019358
	moveq.l	#$ff,d0
	bra	L0193e4
L019358:
	clr.w	($05d8,a3)
	move.l	d5,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d3
	pea.l	(L0192f2)
	pea.l	($0003)
	jsr	(L005bb0)
	addq.w	#8,sp
	tst.l	d3
	bne	L019392
	pea.l	(L0192fe)
	pea.l	(L0190e0)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L019392:
	move.l	d4,-(sp)
	pea.l	($0001)
	move.l	d5,-(sp)
	move.l	d3,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d4,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	move.l	d5,-(sp)
	move.l	d3,-(sp)
	jsr	(L019430)
	addq.w	#8,sp
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SR_CharAspデータメモリ確保)
	addq.w	#8,sp
	move.l	($174a,a3),-(sp)
	move.l	d5,-(sp)
	move.l	d3,-(sp)
	jsr	(L0193ee)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	move.l	d5,d0
L0193e4:
	movem.l	(-$0046,a6),d3-d5/a3
	unlk	a6
	rts

L0193ee:
	move.l	d3,-(sp)
	movea.l	($0008,sp),a0
	move.l	($000c,sp),d1
	movea.l	($0010,sp),a1
	ble	L01942c
	moveq.l	#$00,d2
L019400:
	move.w	(a0)+,d0
	subq.l	#2,d1
	tst.w	d0
	beq	L019410
	moveq.l	#$00,d3
L01940a:
	move.l	d3,(a1)+
	subq.w	#1,d0
	bne	L01940a
L019410:
	move.w	(a0)+,d0
	subq.l	#2,d1
	move.w	d0,d2
	sub.l	d2,d1
	sub.l	d2,d1
	sub.l	d2,d1
	sub.l	d2,d1
	tst.w	d0
	beq	L019428
L019422:
	move.l	(a0)+,(a1)+
	subq.w	#1,d0
	bne	L019422
L019428:
	tst.l	d1
	bgt	L019400
L01942c:
	move.l	(sp)+,d3
	rts

L019430:
	movem.l	d3-d4,-(sp)
	movea.l	($000c,sp),a0
	move.l	($0010,sp),d1
	moveq.l	#$00,d4
	tst.l	d1
	ble	L019474
	moveq.l	#$00,d3
L019444:
	move.w	(a0)+,d0
	subq.l	#2,d1
	tst.w	d0
	beq	L019452
L01944c:
	addq.l	#4,d4
	subq.w	#1,d0
	bne	L01944c
L019452:
	move.w	(a0)+,d0
	subq.l	#2,d1
	move.l	a0,d2
	move.w	d0,d3
	sub.l	d3,d1
	sub.l	d3,d1
	sub.l	d3,d1
	sub.l	d3,d1
	tst.w	d0
	beq	L01946e
L019466:
	addq.l	#4,d4
	addq.l	#4,d2
	subq.w	#1,d0
	bne	L019466
L01946e:
	movea.l	d2,a0
	tst.l	d1
	bgt	L019444
L019474:
	move.l	d4,d0
	movem.l	(sp)+,d3-d4
	rts

L01947c:
	movea.l	($0004,sp),a1
	movea.l	($000c,sp),a0
L019484:
	cmpi.w	#$00ff,(a1)
	beq	L01962e
	move.w	(a1)+,d0
	movea.l	a1,a2
	move.w	d0,d1
	subq.w	#1,d1
	bmi	L01949c
L019496:
	move.w	(a1)+,(a0)+
	subq.w	#1,d1
	bpl	L019496
L01949c:
	move.w	d0,d1
	subq.w	#1,d1
	bmi	L019484
L0194a2:
	move.w	(a2)+,d0
	beq	L019624
	tst.w	d0
	bge	L0194b6
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0194be
L0194b6:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0194be:
	btst.l	#$0e,d0
	beq	L0194ce
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0194d6
L0194ce:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0194d6:
	btst.l	#$0d,d0
	beq	L0194e6
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0194ee
L0194e6:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0194ee:
	btst.l	#$0c,d0
	beq	L0194fe
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L019506
L0194fe:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L019506:
	btst.l	#$0b,d0
	beq	L019516
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L01951e
L019516:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L01951e:
	btst.l	#$0a,d0
	beq	L01952e
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L019536
L01952e:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L019536:
	btst.l	#$09,d0
	beq	L019546
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L01954e
L019546:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L01954e:
	btst.l	#$08,d0
	beq	L01955e
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L019566
L01955e:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L019566:
	tst.b	d0
	bge	L019574
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L01957c
L019574:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L01957c:
	btst.l	#$06,d0
	beq	L01958c
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L019594
L01958c:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L019594:
	btst.l	#$05,d0
	beq	L0195a4
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0195ac
L0195a4:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0195ac:
	btst.l	#$04,d0
	beq	L0195bc
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0195c4
L0195bc:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0195c4:
	btst.l	#$03,d0
	beq	L0195d4
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0195dc
L0195d4:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0195dc:
	btst.l	#$02,d0
	beq	L0195ec
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L0195f4
L0195ec:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L0195f4:
	btst.l	#$01,d0
	beq	L019604
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L01960c
L019604:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L01960c:
	btst.l	#$00,d0
	beq	L01961c
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a1)+,(a0)+
	bra	L019624
L01961c:
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
	clr.w	(a0)+
L019624:
	subq.w	#1,d1
	bpl	L0194a2
	bra	L019484
L01962e:
	rts

L019630:
	movea.l	($0004,sp),a0
	moveq.l	#$00,d2
L019636:
	cmpi.w	#$00ff,(a0)
	beq	L0196e8
	move.w	(a0)+,d0
	movea.l	a0,a1
	move.w	d0,d1
	subq.w	#1,d1
	bmi	L019650
L019648:
	addq.l	#2,d2
	addq.w	#2,a0
	subq.w	#1,d1
	bpl	L019648
L019650:
	move.w	d0,d1
	subq.w	#1,d1
	bmi	L019636
L019656:
	move.w	(a1)+,d0
	beq	L0196de
	tst.w	d0
	bge	L019662
	addq.w	#8,a0
L019662:
	btst.l	#$0e,d0
	beq	L01966a
	addq.w	#8,a0
L01966a:
	btst.l	#$0d,d0
	beq	L019672
	addq.w	#8,a0
L019672:
	btst.l	#$0c,d0
	beq	L01967a
	addq.w	#8,a0
L01967a:
	btst.l	#$0b,d0
	beq	L019682
	addq.w	#8,a0
L019682:
	btst.l	#$0a,d0
	beq	L01968a
	addq.w	#8,a0
L01968a:
	btst.l	#$09,d0
	beq	L019692
	addq.w	#8,a0
L019692:
	btst.l	#$08,d0
	beq	L01969a
	addq.w	#8,a0
L01969a:
	tst.b	d0
	bge	L0196a0
	addq.w	#8,a0
L0196a0:
	btst.l	#$06,d0
	beq	L0196a8
	addq.w	#8,a0
L0196a8:
	btst.l	#$05,d0
	beq	L0196b0
	addq.w	#8,a0
L0196b0:
	btst.l	#$04,d0
	beq	L0196b8
	addq.w	#8,a0
L0196b8:
	btst.l	#$03,d0
	beq	L0196c0
	addq.w	#8,a0
L0196c0:
	btst.l	#$02,d0
	beq	L0196c8
	addq.w	#8,a0
L0196c8:
	btst.l	#$01,d0
	beq	L0196d0
	addq.w	#8,a0
L0196d0:
	btst.l	#$00,d0
	beq	L0196d8
	addq.w	#8,a0
L0196d8:
	add.l	#$00000080,d2
L0196de:
	subq.w	#1,d1
	bpl	L019656
	bra	L019636
L0196e8:
	move.l	d2,d0
	rts

L0196ec:
	link	a6,#-$0040
	movem.l	d3-d6/a3-a5,-(sp)
	movea.l	($0008,a6),a2
	movea.l	($000c,a6),a0
	cmpi.w	#$0001,($001a,a0)
	bne	L01970a
	lea.l	($0034,a0),a0
	bra	L01970e
L01970a:
	lea.l	($0054,a0),a0
L01970e:
	addq.w	#2,a0
	moveq.l	#$0f,d4
L019712:
	move.w	(a0)+,d3
	move.w	d4,d0
	ext.l	d0
	add.l	d0,d0
	lea.l	(-$20,a6,d0.l),a1
	move.l	d3,d1
	moveq.l	#$0b,d6
	lsr.l	d6,d1
	moveq.l	#$1f,d6
	and.l	d6,d1
	move.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	move.l	d3,d2
	lsr.l	#6,d2
	and.l	d6,d2
	move.l	d2,d1
	asl.l	#3,d1
	add.l	d2,d1
	add.l	d1,d1
	add.l	d2,d1
	asl.l	#2,d1
	add.l	d2,d1
	add.l	d1,d0
	move.l	d3,d2
	lsr.l	#1,d2
	and.l	d6,d2
	move.l	d2,d1
	asl.l	#3,d1
	sub.l	d2,d1
	asl.l	#2,d1
	add.l	d1,d0
	bpl	L019764
	add.l	#$000000ff,d0
L019764:
	asr.l	#8,d0
	move.w	d0,(a1)
	move.w	d4,d0
	ext.l	d0
	add.l	d0,d0
	moveq.l	#$10,d6
	sub.w	d4,d6
	move.w	d6,(-$40,a6,d0.l)
	subq.w	#1,d4
	tst.w	d4
	bgt	L019712
	moveq.l	#$0f,d4
L01977e:
	move.w	d4,d5
	move.w	d4,d2
	subq.w	#1,d2
	tst.w	d2
	ble	L0197ce
L019788:
	move.w	d5,d0
	ext.l	d0
	add.l	d0,d0
	move.l	a6,d3
	add.l	d0,d3
	moveq.l	#$e0,d6
	add.l	d3,d6
	movea.l	d6,a1
	move.w	d2,d0
	ext.l	d0
	add.l	d0,d0
	move.l	a6,d1
	add.l	d0,d1
	moveq.l	#$e0,d6
	add.l	d1,d6
	movea.l	d6,a0
	move.w	(a0),d6
	cmp.w	(a1),d6
	bls	L0197c8
	move.w	(a1),d0
	move.w	(a0),(a1)
	move.w	d0,(a0)
	moveq.l	#$c0,d6
	add.l	d3,d6
	movea.l	d6,a0
	move.w	(a0),d0
	moveq.l	#$c0,d6
	add.l	d1,d6
	movea.l	d6,a1
	move.w	(a1),(a0)
	move.w	d0,(a1)
	move.w	d2,d5
L0197c8:
	subq.w	#1,d2
	tst.w	d2
	bgt	L019788
L0197ce:
	cmp.w	d5,d4
	bne	L0197d4
	subq.w	#1,d4
L0197d4:
	cmp.w	#$0001,d4
	bgt	L01977e
	cmpi.w	#$0001,($000a,a2)
	bne	L019842
	moveq.l	#$0f,d4
	moveq.l	#$00,d3
	lea.l	(プレイヤー1_燃焼パレットデータ1),a3
	lea.l	($0020,a3),a5
	lea.l	($0040,a3),a4
L0197f4:
	move.w	d4,d2
	cmp.w	#$0001,d4
	bne	L0197fe
	moveq.l	#$02,d2
L0197fe:
	move.w	d4,d0
	ext.l	d0
	add.l	d0,d0
	lea.l	(-$40,a6,d0.l),a0
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	move.w	d2,d0
	ext.l	d0
	add.l	d0,d0
	move.w	(a3,d0.l),($74,a2,d1.l)
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	lea.l	(a2,d1.l),a1
	move.w	(a5,d0.l),($0094,a1)
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	lea.l	(a2,d1.l),a0
	move.w	(a4,d0.l),($0194,a0)
	subq.w	#1,d4
	tst.w	d4
	bgt	L0197f4
	bra	L0198a0
L019842:
	moveq.l	#$0f,d4
	moveq.l	#$00,d3
	lea.l	(プレイヤー2_燃焼パレットデータ1),a3
	lea.l	($0020,a3),a5
	lea.l	($0040,a3),a4
L019854:
	move.w	d4,d2
	cmp.w	#$0001,d4
	bne	L01985e
	moveq.l	#$02,d2
L01985e:
	move.w	d4,d0
	ext.l	d0
	add.l	d0,d0
	lea.l	(-$40,a6,d0.l),a0
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	move.w	d2,d0
	ext.l	d0
	add.l	d0,d0
	move.w	(a3,d0.l),($74,a2,d1.l)
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	lea.l	(a2,d1.l),a1
	move.w	(a5,d0.l),($0094,a1)
	move.w	(a0),d3
	move.l	d3,d1
	add.l	d1,d1
	lea.l	(a2,d1.l),a0
	move.w	(a4,d0.l),($0194,a0)
	subq.w	#1,d4
	tst.w	d4
	bgt	L019854
L0198a0:
	clr.w	($0194,a2)
	clr.w	($0094,a2)
	clr.w	($0074,a2)
	movem.l	(-$005c,a6),d3-d6/a3-a5
	unlk	a6
	rts

L0198b6:
	move.w	#$0001,(L071656)
	tst.w	(画面周波数)
	bne	L0198da
	move.w	#$00f0,($00e80012)
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	move.w	#$00f0,d1
	bra	L0198ec
L0198da:
	move.w	#$01e0,($00e80012)
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	move.w	#$01e0,d1
L0198ec:
	lea.l	(L01990a),a1
	trap	#15
	andi.w	#$f8ff,sr
	rts

L0198fa:
	ori.w	#$0700,sr
	moveq.l	#$6d,d0
	suba.l	a1,a1
	trap	#15
	andi.w	#$f8ff,sr
	rts

L01990a:
	movem.l	d0-d7/a0-a5,-(sp)
	clr.w	(L071656)
	movem.l	(sp)+,d0-d7/a0-a5
	rte

L01991a:
	rts

L01991c:
	tst.w	(L071656)
	bne	L01991c
	move.w	#$0001,(L071656)
	rts

L01992e:
	rts

L019930:
	rts

SYSCALL_01cc_Pcg転送_セル画像:
	movem.l	d3-d5/a3,-(sp)
	movea.l	($0014,sp),a3
	move.w	($001e,sp),d5
	move.w	($0022,sp),d3
	move.w	($0026,sp),d4
	movea.w	($001a,sp),a1
	move.l	a1,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_01a8_セル取得_情報)
	addq.w	#8,sp
	movea.l	d0,a0
	cmpa.w	#$0000,a0
	ble	L019b60
	move.l	($174a,a3),d2
	add.l	(a0),d2
	move.l	d2,(L071658)
	move.w	($0004,a0),d1
	muls.w	($0006,a0),d1
	cmp.w	d1,d4
	ble	L01997a
	move.w	d1,d4
L01997a:
	tst.w	d5
	bne	L019992
	cmpi.w	#$0001,($000a,a3)
	bne	L01998c
	add.w	#$0020,d3
	bra	L0199be
L01998c:
	add.w	#$0028,d3
	bra	L0199be
L019992:
	cmp.w	#$0001,d5
	bne	L0199ac
	cmpi.w	#$0001,($000a,a3)
	bne	L0199a6
	add.w	#$0040,d3
	bra	L0199be
L0199a6:
	add.w	#$0080,d3
	bra	L0199be
L0199ac:
	cmpi.w	#$0001,($000a,a3)
	bne	L0199ba
	add.w	#$0060,d3
	bra	L0199be
L0199ba:
	add.w	#$00a0,d3
L0199be:
	move.w	d3,d0
	ext.l	d0
	asl.l	#7,d0
	add.l	#$00eb8000,d0
	move.l	d0,(L07165c)
	movea.l	(L071658),a2
	movea.l	(L07165c),a1
	movea.w	d1,a0
	move.l	a0,d2
	add.l	d2,(L071658)
	adda.l	(L071658),a0
	move.l	a0,(L071658)
	movea.l	(L071658),a0
	tst.w	($05d8,a3)
	ble	L019b5c
	subq.w	#1,d4
	bmi	L019b60
L019a06:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L019b0e
	btst.l	#$0f,d0
	beq	L019a1a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a1e
L019a1a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a1e:
	btst.l	#$0e,d0
	beq	L019a2a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a2e
L019a2a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a2e:
	btst.l	#$0d,d0
	beq	L019a3a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a3e
L019a3a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a3e:
	btst.l	#$0c,d0
	beq	L019a4a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a4e
L019a4a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a4e:
	btst.l	#$0b,d0
	beq	L019a5a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a5e
L019a5a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a5e:
	btst.l	#$0a,d0
	beq	L019a6a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a6e
L019a6a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a6e:
	btst.l	#$09,d0
	beq	L019a7a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a7e
L019a7a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a7e:
	btst.l	#$08,d0
	beq	L019a8a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a8e
L019a8a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a8e:
	btst.l	#$07,d0
	beq	L019a9a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019a9e
L019a9a:
	clr.l	(a1)+
	clr.l	(a1)+
L019a9e:
	btst.l	#$06,d0
	beq	L019aaa
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019aae
L019aaa:
	clr.l	(a1)+
	clr.l	(a1)+
L019aae:
	btst.l	#$05,d0
	beq	L019aba
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019abe
L019aba:
	clr.l	(a1)+
	clr.l	(a1)+
L019abe:
	btst.l	#$04,d0
	beq	L019aca
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019ace
L019aca:
	clr.l	(a1)+
	clr.l	(a1)+
L019ace:
	btst.l	#$03,d0
	beq	L019ada
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019ade
L019ada:
	clr.l	(a1)+
	clr.l	(a1)+
L019ade:
	btst.l	#$02,d0
	beq	L019aea
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019aee
L019aea:
	clr.l	(a1)+
	clr.l	(a1)+
L019aee:
	btst.l	#$01,d0
	beq	L019afa
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019afe
L019afa:
	clr.l	(a1)+
	clr.l	(a1)+
L019afe:
	btst.l	#$00,d0
	beq	L019b0a
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	bra	L019b0e
L019b0a:
	clr.l	(a1)+
	clr.l	(a1)+
L019b0e:
	subq.w	#1,d4
	bpl	L019a06
	bra	L019b60
L019b16:
	move.w	(a2)+,d0
	tst.w	d0
	beq	L019b5c
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
L019b5c:
	subq.w	#1,d4
	bpl	L019b16
L019b60:
	movem.l	(sp)+,d3-d5/a3
	rts

SYSCALL_00e0_Pcg取得_コード:
	movem.l	d3-d6,-(sp)
	move.l	($0014,sp),d4
	move.w	($001a,sp),d5
	move.w	($001e,sp),d0
	move.w	($0022,sp),d6
	move.w	($0026,sp),d1
	move.w	($002a,sp),d2
	movea.w	($002e,sp),a0
	move.l	a0,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	d4,-(sp)
	jsr	(L019bc2)
	lea.l	($0014,sp),sp
	move.w	d0,d3
	add.w	d6,d3
	ext.l	d5
	move.l	d5,-(sp)
	move.l	d4,-(sp)
	jsr	(L01a04c)
	addq.w	#8,sp
	ext.l	d0
	asl.l	#8,d0
	add.w	d0,d3
	move.w	d3,d0
	ext.l	d0
	movem.l	(sp)+,d3-d6
	rts

L019bc2:
	movem.l	d3-d4,-(sp)
	movea.l	($000c,sp),a0
	move.w	($0012,sp),d1
	move.w	($0016,sp),d3
	move.w	($001a,sp),d4
	move.w	($001e,sp),d2
	moveq.l	#$00,d0
	tst.w	d1
	bne	L019bfe
	cmpi.w	#$0100,(L06f44a)
	bne	L019bfa
	cmpi.w	#$0001,($000a,a0)
	bne	L019bf6
	moveq.l	#$20,d0
	bra	L019c58
L019bf6:
	moveq.l	#$28,d0
	bra	L019c58
L019bfa:
	moveq.l	#$38,d0
	bra	L019c58
L019bfe:
	cmp.w	#$0001,d1
	bne	L019c16
	cmpi.w	#$0001,($000a,a0)
	bne	L019c10
	moveq.l	#$40,d0
	bra	L019c58
L019c10:
	move.w	#$0080,d0
	bra	L019c58
L019c16:
	cmp.w	#$0002,d1
	bne	L019c2e
	cmpi.w	#$0001,($000a,a0)
	bne	L019c28
	moveq.l	#$60,d0
	bra	L019c58
L019c28:
	move.w	#$00a0,d0
	bra	L019c58
L019c2e:
	cmp.w	#$0003,d1
	bne	L019c3a
	move.w	#$00f5,d0
	bra	L019c58
L019c3a:
	cmp.w	#$0004,d1
	bne	L019c46
	move.w	#$00fa,d0
	bra	L019c58
L019c46:
	cmp.w	#$0005,d1
	bne	L019c50
	moveq.l	#$0d,d0
	bra	L019c58
L019c50:
	cmp.w	#$0006,d1
	bne	L019c58
	moveq.l	#$08,d0
L019c58:
	cmpi.w	#$0100,(L06f44a)
	bne	L019c68
	tst.w	d2
	beq	L019c68
	asl.w	#2,d0
L019c68:
	tst.w	d3
	beq	L019c70
	add.w	#$4000,d0
L019c70:
	tst.w	d4
	beq	L019c78
	add.w	#$8000,d0
L019c78:
	ext.l	d0
	movem.l	(sp)+,d3-d4
	rts

SYSCALL_0278_Pcg取得_定義領域:
	move.l	d3,-(sp)
	move.l	($0008,sp),d1
	move.w	($000e,sp),d0
	move.w	($0012,sp),d3
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	ext.l	d0
	move.l	d0,-(sp)
	move.l	d1,-(sp)
	jsr	(L019bc2)
	lea.l	($0014,sp),sp
	add.w	d3,d0
	ext.l	d0
	asl.l	#7,d0
	add.l	#$00eb8000,d0
	move.l	(sp)+,d3
	rts

L019cba:
	movea.l	($0004,sp),a0
	move.l	#$00eba000,d0
	cmpi.w	#$0001,($000a,a0)
	beq	L019cd2
	move.l	#$00ebc000,d0
L019cd2:
	pea.l	($0100)
	move.l	d0,-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0224_Dataクリア_メモリブロック)
	lea.l	($000c,sp),sp
	rts

SYSCALL_02ac_Pcg設定_標準データ:
	link	a6,#$0000
	move.l	d3,-(sp)
	move.w	($0016,a6),d3
	movea.w	($0012,a6),a0
	move.l	a0,-(sp)
	pea.l	($0000)
	move.l	($0008,a6),-(sp)
	jsr	(SYSCALL_0278_Pcg取得_定義領域)
	lea.l	($000c,sp),sp
	ext.l	d3
	asl.l	#2,d3
	move.l	d3,-(sp)
	move.l	d0,-(sp)
	move.l	($000c,a6),-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)
	lea.l	($0010,sp),sp
	move.l	(-$0004,a6),d3
	unlk	a6
	rts

SYSCALL_02b0_Pcg設定_身体データ:
	link	a6,#$0000
	move.l	d3,-(sp)
	move.l	($0008,a6),d1
	move.w	($0012,a6),d0
	move.w	($0016,a6),d3
	tst.w	($001a,a6)
	bne	L019d4e
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	($0001)
	bra	L019d56
L019d4e:
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	($0002)
L019d56:
	move.l	d1,-(sp)
	jsr	(SYSCALL_0278_Pcg取得_定義領域)
	lea.l	($000c,sp),sp
	move.l	d0,d1
	move.w	d3,d0
	ext.l	d0
	asl.l	#2,d0
	move.l	d0,-(sp)
	move.l	d1,-(sp)
	move.l	($000c,a6),-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)
	lea.l	($0010,sp),sp
	move.l	(-$0004,a6),d3
	unlk	a6
	rts

SYSCALL_021c_Pal変換_ＲＧＢ増減:
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	($0024,sp),a1
	move.w	($002a,sp),d6
	movea.w	($002e,sp),a4
	move.w	($0032,sp),d1
	move.w	($0036,sp),d0
	movea.w	($003a,sp),a5
	cmpa.w	#$0000,a4
	ble	L019e18
	moveq.l	#$0a,d7
	asl.w	d7,d0
	movea.w	d0,a3
	asl.w	#5,d1
	movea.w	d1,a2
	subq.w	#1,d6
	bmi	L019e7a
L019dba:
	move.w	(a1),d1
	move.w	a4,d4
	subq.w	#1,d4
	bmi	L019e10
	moveq.l	#$00,d5
L019dc4:
	move.w	d1,d0
	and.w	#$f800,d0
	lsr.w	#1,d0
	move.w	d0,d3
	add.w	#$0400,d3
	move.w	d1,d0
	and.w	#$07c0,d0
	lsr.w	#1,d0
	move.w	d0,d2
	add.w	#$0020,d2
	move.w	d1,d0
	and.w	#$003e,d0
	lsr.w	#1,d0
	move.w	d0,d1
	addq.w	#1,d1
	cmp.w	a3,d3
	bls	L019df2
	move.w	a3,d3
L019df2:
	cmp.w	a2,d2
	bls	L019df8
	move.w	a2,d2
L019df8:
	move.w	d1,d5
	movea.w	a5,a0
	cmpa.l	d5,a0
	bge	L019e02
	move.w	a5,d1
L019e02:
	move.w	d2,d0
	or.w	d3,d0
	or.w	d1,d0
	move.w	d0,d1
	lsl.w	#1,d1
	subq.w	#1,d4
	bpl	L019dc4
L019e10:
	move.w	d1,(a1)+
	subq.w	#1,d6
	bpl	L019dba
	bra	L019e7a
L019e18:
	cmpa.w	#$0000,a4
	bge	L019e7a
	moveq.l	#$0b,d7
	asl.w	d7,d0
	movea.w	d0,a2
	asl.w	#6,d1
	movea.w	d1,a0
	move.w	a5,d5
	add.w	d5,d5
	bra	L019e76
L019e2e:
	move.w	(a1),d1
	move.w	a4,d4
	subq.w	#1,d4
	bmi	L019e74
L019e36:
	move.w	d1,d0
	and.w	#$f800,d0
	move.w	d0,d3
	add.w	#$f800,d3
	move.w	d1,d0
	and.w	#$07c0,d0
	move.w	d0,d2
	add.w	#$ffc0,d2
	move.w	d1,d0
	and.w	#$003e,d0
	move.w	d0,d1
	subq.w	#2,d1
	cmp.w	a2,d3
	bcc	L019e5e
	move.w	a2,d3
L019e5e:
	cmp.w	a0,d2
	bcc	L019e64
	move.w	a0,d2
L019e64:
	cmp.w	d1,d5
	bls	L019e6a
	move.w	d5,d1
L019e6a:
	move.w	d3,d0
	or.w	d2,d0
	or.w	d0,d1
	subq.w	#1,d4
	bpl	L019e36
L019e74:
	move.w	d1,(a1)+
L019e76:
	subq.w	#1,d6
	bpl	L019e2e
L019e7a:
	movem.l	(sp)+,d3-d7/a3-a5
	rts

SR_キャラクター身体パレット設定(p1)
{
	// e82220:パレットブロック#1, e82240:パレットブロック#2
	SYSCALL_0160_３２バイト転送(
		p1->001a_同キャラ識別番号 == 0 ? p1->0034_CHAR.PAL#0 : p1->0054_CHARA.PAL#1,
		p1->000a_プレイヤー番号 == 1 ? 0x00e82220 : 0x00e82240
	);
}

L019eb2:
	movea.l	($0004,sp),a0
	cmpi.w	#$0001,($000a,a0)			;プレイヤー番号
	bne	@f
	move.l	#$00e82220,d0				;パレットブロック #1
	bra	@@f
@@:	move.l	#$00e82240,d0				;パレットブロック #2
@@:	move.l	d0,-(sp)
	move.w	($001a,a0),d0				;同キャラ識別番号
	ext.l	d0
	asl.l	#5,d0						;32倍
	add.l	#$00000094,d0				;+148
	pea.l	(a0,d0.l)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
	rts

L019eea:
	movea.l	($0004,sp),a0
	cmpi.w	#$0001,($000a,a0)			;プレイヤー番号
	bne	@f
	move.l	#$00e82220,d0				;パレットブロック #1
	bra	@@f
@@:	move.l	#$00e82240,d0				;パレットブロック #2
@@:	move.l	d0,-(sp)
	pea.l	($0114,a0)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
	rts

SR_スプライトパレット設定_黒:
	movea.l	($0004,sp),a0
	cmpi.w	#$0001,($000a,a0)			;プレイヤー番号
	bne	L019f28
	movea.l	#$00e82220,a0				;パレットブロック #1
	bra	L019f2e
L019f28:
	movea.l	#$00e82240,a0				;パレットブロック #2
L019f2e:
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)+
	move.l	#$00010001,(a0)
	rts

L019f60:
	movem.l	d3/a3,-(sp)
	movea.l	($000c,sp),a3
	subq.w	#1,($0a90,a3)					;燃焼値デクリメント
	tst.w	($0a90,a3)
	ble	L019fcc
	move.w	($000a,a3),d0					;プレイヤー番号
	ext.l	d0
	lea.l	(L0200b2),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d3
	cmp.w	#$0001,d3
	bgt	L019f8e
	moveq.l	#$00,d0
	bra	L019fa0
L019f8e:
	cmp.w	#$0003,d3
	ble	L019f9e
	cmp.w	#$0005,d3
	bgt	L019f9e
	moveq.l	#$02,d0
	bra	L019fa0
L019f9e:
	moveq.l	#$01,d0
L019fa0:
	addq.w	#1,d3
	cmp.w	#$0007,d3
	ble	L019faa
	moveq.l	#$00,d3
L019faa:
	ext.l	d0
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	jsr	(SYSCALL_015c_Pal設定_身体燃焼色)
	addq.w	#8,sp
	move.w	($000a,a3),d0
	ext.l	d0
	lea.l	(L0200b2),a0
	add.l	d0,d0
	move.w	d3,(a0,d0.l)
	bra	L019fe6
L019fcc:
	tst.w	($01b4,a3)
	bne	L019fdc
	move.l	a3,-(sp)
	jsr	(SR_キャラクター身体パレット設定)
	bra	L019fe4
L019fdc:
	move.l	a3,-(sp)
	jsr	(L019eb2)
L019fe4:
	addq.w	#4,sp
L019fe6:
	movem.l	(sp)+,d3/a3
	rts

L019fec:
	movea.l	($0004,sp),a0
	cmpi.w	#$0001,($000a,a0)
	bne	L01a000
	move.l	#$00e822e0,d0
	bra	L01a006
L01a000:
	move.l	#$00e82300,d0
L01a006:
	move.l	d0,-(sp)
	pea.l	($00f4,a0)
	jsr	(SYSCALL_0160_３２バイト転送)
	addq.w	#8,sp
	rts

SYSCALL_027c_Pal取得_表示データ:
	movem.l	d3-d4,-(sp)
	move.l	($000c,sp),d0
	move.w	($0016,sp),d3
	move.l	#$00e82200,d4
	movea.w	($0012,sp),a0
	move.l	a0,-(sp)
	move.l	d0,-(sp)
	jsr	(L01a04c)
	addq.w	#8,sp
	ext.l	d0
	asl.l	#5,d0
	add.l	d0,d4
	ext.l	d3
	add.l	d3,d3
	move.l	d4,d0
	add.l	d3,d0
	movem.l	(sp)+,d3-d4
	rts

L01a04c:
	movea.l	($0004,sp),a0
	move.w	($000a,sp),d0
	moveq.l	#$01,d1
	cmp.w	#$0028,d0
	beq	L01a0b2
	bgt	L01a074
	cmp.w	#$0004,d0
	beq	L01a0c2
	bgt	L01a06c
	tst.w	d0
	beq	L01a092
	bra	L01a0e8
L01a06c:
	cmp.w	#$001e,d0
	beq	L01a0a2
	bra	L01a0e8
L01a074:
	cmp.w	#$003c,d0
	beq	L01a0e2
	bgt	L01a084
	cmp.w	#$0032,d0
	beq	L01a0d2
	bra	L01a0e8
L01a084:
	cmp.w	#$0064,d0
	beq	L01a0e6
	cmp.w	#$0065,d0
	beq	L01a0e2
	bra	L01a0e8
L01a092:
	cmpi.w	#$0001,($000a,a0)
	bne	L01a09e
	moveq.l	#$01,d1
	bra	L01a0e8
L01a09e:
	moveq.l	#$02,d1
	bra	L01a0e8
L01a0a2:
	cmpi.w	#$0001,($000a,a0)
	bne	L01a0ae
	moveq.l	#$03,d1
	bra	L01a0e8
L01a0ae:
	moveq.l	#$05,d1
	bra	L01a0e8
L01a0b2:
	cmpi.w	#$0001,($000a,a0)
	bne	L01a0be
	moveq.l	#$04,d1
	bra	L01a0e8
L01a0be:
	moveq.l	#$06,d1
	bra	L01a0e8
L01a0c2:
	cmpi.w	#$0001,($000a,a0)
	bne	L01a0ce
	moveq.l	#$07,d1
	bra	L01a0e8
L01a0ce:
	moveq.l	#$08,d1
	bra	L01a0e8
L01a0d2:
	cmpi.w	#$0001,($000a,a0)
	bne	L01a0de
	moveq.l	#$09,d1
	bra	L01a0e8
L01a0de:
	moveq.l	#$0e,d1
	bra	L01a0e8
L01a0e2:
	moveq.l	#$0a,d1
	bra	L01a0e8
L01a0e6:
	moveq.l	#$0f,d1
L01a0e8:
	move.w	d1,d0
	ext.l	d0
	rts

L01a0ee:
	link	a6,#-$0004
	movem.l	d3-d7/a3-a5,-(sp)
	movea.l	#$00eb81d0,a5
	moveq.l	#$00,d3
	move.l	#L071660,d5
	move.l	#L071740,d4
L01a10a:
	moveq.l	#$07,d7
	move.w	d3,d0
	ext.l	d0
	asl.l	#2,d0
	movea.l	d0,a4
L01a114:
	movea.w	d7,a0
	move.l	a0,d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d5,a1
	adda.l	d0,a1
	move.l	a0,d2
	move.l	d2,d1
	asl.l	#3,d1
	sub.l	d2,d1
	asl.l	#5,d1
	add.l	d4,d1
	lea.l	(a4,d1.l),a0
	lea.l	(L071e40),a2
	adda.l	d0,a2
	lea.l	(L071f20),a3
	adda.l	d0,a3
	move.l	(a5),d0
	move.l	d0,(a4,a3.l)
	move.l	d0,(a4,a2.l)
	move.l	d0,($00c4,a0)
	move.l	d0,($00a8,a0)
	move.l	d0,($008c,a0)
	move.l	d0,($0070,a0)
	move.l	d0,($0054,a0)
	move.l	d0,($0038,a0)
	move.l	d0,($001c,a0)
	move.l	d0,(a0)
	move.l	d0,(a4,a1.l)
	subq.w	#1,d7
	bpl	L01a114
	addq.w	#4,a5
	addq.w	#1,d3
	cmp.w	#$0006,d3
	ble	L01a10a
	moveq.l	#$07,d7
	lea.l	(L0200d8),a5
	lea.l	(L07175c),a1
	lea.l	($00a8,a1),a1
	move.l	a1,(-$0004,a6)
	lea.l	(L01a2a2),a3
L01a19a:
	move.w	d7,d6
	ext.l	d6
	lea.l	(L0200b8),a0
	move.l	d6,d4
	asl.l	#2,d4
	move.l	(a0,d4.l),-(sp)
	move.l	d6,d0
	move.l	d0,d3
	asl.l	#3,d3
	sub.l	d0,d3
	asl.l	#2,d3
	movea.l	d3,a1
	adda.l	#L071660,a1
	move.l	a1,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.l	d6,d5
	asl.l	#5,d5
	move.l	(a5,d5.l),-(sp)
	move.l	d6,d0
	asl.l	#3,d0
	sub.l	d6,d0
	asl.l	#5,d0
	movea.l	d0,a4
	movea.l	a4,a1
	adda.l	#L071740,a1
	move.l	a1,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($04,a5,d5.l),-(sp)
	lea.l	(L07175c),a1
	pea.l	(a1,a4.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($08,a5,d5.l),-(sp)
	lea.l	(L07175c),a1
	pea.l	($1c,a4,a1.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($0c,a5,d5.l),-(sp)
	lea.l	(L07175c),a1
	pea.l	($38,a4,a1.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($10,a5,d5.l),-(sp)
	lea.l	(L07175c),a1
	pea.l	($54,a4,a1.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($14,a5,d5.l),-(sp)
	lea.l	(L07175c),a1
	pea.l	($70,a4,a1.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($18,a5,d5.l),-(sp)
	lea.l	(L07175c),a0
	lea.l	($008c,a0),a0
	pea.l	(a0,a4.l)
	jsr	(a3)
	addq.w	#8,sp
	move.l	($1c,a5,d5.l),-(sp)
	movea.l	(-$0004,a6),a1
	pea.l	(a1,a4.l)
	jsr	(a3)
	addq.w	#8,sp
	lea.l	(L0201d8),a0
	move.l	(a0,d4.l),-(sp)
	movea.l	d3,a1
	adda.l	#L071e40,a1
	move.l	a1,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	lea.l	(L0201f8),a0
	move.l	(a0,d4.l),-(sp)
	add.l	#L071f20,d3
	move.l	d3,-(sp)
	jsr	(a3)
	addq.w	#8,sp
	subq.w	#1,d7
	bpl	L01a19a
	movem.l	(-$0024,a6),d3-d7/a3-a5
	unlk	a6
	rts

L01a2a2:
	movem.l	d3-d4,-(sp)
	movea.l	($000c,sp),a0
	move.l	($0010,sp),d3
	moveq.l	#$00,d1
	move.l	d3,d0
	and.l	#$f0000000,d0
	beq	L01a2c0
	move.l	#$f0000000,d1
L01a2c0:
	move.l	d3,d0
	and.l	#$0f000000,d0
	beq	L01a2d0
	or.l	#$0f000000,d1
L01a2d0:
	move.l	d3,d0
	and.l	#$00f00000,d0
	beq	L01a2e0
	or.l	#$00f00000,d1
L01a2e0:
	move.l	d3,d0
	and.l	#$000f0000,d0
	beq	L01a2f0
	or.l	#$000f0000,d1
L01a2f0:
	move.l	d3,d0
	and.l	#$0000f000,d0
	beq	L01a2fe
	or.w	#$f000,d1
L01a2fe:
	move.l	d3,d0
	and.l	#$00000f00,d0
	beq	L01a30c
	or.w	#$0f00,d1
L01a30c:
	move.l	d3,d0
	and.l	#$000000f0,d0
	beq	L01a31a
	or.w	#$00f0,d1
L01a31a:
	moveq.l	#$0f,d0
	and.l	d3,d0
	beq	L01a324
	moveq.l	#$0f,d4
	or.l	d4,d1
L01a324:
	not.l	d1
	moveq.l	#$06,d2
L01a328:
	move.l	d1,d0
	and.l	(a0),d0
	or.l	d3,d0
	move.l	d0,(a0)+
	subq.w	#1,d2
	bpl	L01a328
	movem.l	(sp)+,d3-d4
	rts

SR_1P2P体力ゲージ描画:
	SR_体力ゲージ点滅用パレット更新();

	if (WORK_1P_0030_ゲージ体力 > WORK_1P_002e_残り体力) {
		if (WORK_1P_0030_ゲージ体力 > 0) {
			WORK_1P_0030_ゲージ体力--;
		}
		SR_1P体力ゲージ描画(WORK_1P_0030_ゲージ体力, WORK_1P_1730_コンボ前体力);
	} else if (WORK_1P_0030_ゲージ体力 < WORK_1P_002e_残り体力) {
		WORK_1P_0030_ゲージ体力++;
		SR_1P体力ゲージ描画(WORK_1P_0030_ゲージ体力, WORK_1P_0030_ゲージ体力);
	} else {
		if (WORK_1P_1730_コンボ前体力 != WORK_1P_002e_残り体力) {
			if (WORK_1P_09e2_動作ID in [ACT_アイドル, ACT_待機, ACT_起き上がり]) {
				if (WORK_1P_09f0_防御同期値 <= 6) {
					WORK_1P_1730_コンボ前体力 = WORK_1P_002e_残り体力;
				}
				if (SFSYSINFO_001e_デバッグモード有効フラグ && SFSYSINFO_0482_デバッグ_トレーニングモード) {
					WORK_1P_1730_コンボ前体力 = WORK_1P_002e_残り体力 = 88;
					WORK_1P_01cc_敗北状態 = 0;
					goto L01a3f2;
				}
			}
			SR_1P体力ゲージ描画(WORK_1P_002e_残り体力, WORK_1P_1730_コンボ前体力);
		}
	}
L01a3f2:
	if (WORK_2P_0030_ゲージ体力 > WORK_2P_002e_残り体力) {
		if (WORK_2P_0030_ゲージ体力 > 0) {
			WORK_2P_0030_ゲージ体力--;
		}
		SR_2P体力ゲージ描画(WORK_2P_0030_ゲージ体力, WORK_2P_1730_コンボ前体力);
	} else if (WORK_2P_0030_ゲージ体力 < WORK_2P_002e_残り体力) {
		WORK_2P_0030_ゲージ体力++;
		SR_2P体力ゲージ描画(WORK_2P_0030_ゲージ体力, WORK_2P_0030_ゲージ体力);
	} else {
		if (WORK_2P_1730_コンボ前体力 != WORK_2P_002e_残り体力) {
			if (WORK_2P_09e2_動作ID in [ACT_アイドル, ACT_待機, ACT_起き上がり]) {
				if (WORK_2P_09f0_防御同期値 <= 6) {
					WORK_2P_1730_コンボ前体力 = WORK_2P_002e_残り体力;
				}
				if (SFSYSINFO_001e_デバッグモード有効フラグ && SFSYSINFO_0482_デバッグ_トレーニングモード) {
					WORK_2P_1730_コンボ前体力 = WORK_2P_002e_残り体力 = 88;
					WORK_2P_01cc_敗北状態 = 0;
					return;
				}
			}
			SR_2P体力ゲージ描画(WORK_2P_002e_残り体力, WORK_2P_1730_コンボ前体力);
		}
	}

SR_1P体力ゲージ描画:
	movem.l	d3-d5/a3-a4,-(sp)
	move.w	($001a,sp),d3			;体力1
	move.w	($001e,sp),d5			;体力2

	SR_BGページ1_書き込み(1, 3, 0x0d08);
	SR_BGページ1_書き込み(1, 4, 0x0d09);
	SR_BGページ1_書き込み(13, 3, 0x4d08);
	SR_BGページ1_書き込み(13, 4, 0x4d09);

	moveq.l	#$0c,d4
	cmp.w	#$0007,d3
	ble	L01a53c
	lea.l	(SR_BGページ1_書き込み),a4
L01a50e:
	subq.w	#8,d3
	subq.w	#8,d5
	pea.l	($0d0a)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0d0b)
	pea.l	($0004)
	subq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	cmp.w	#$0007,d3
	bgt	L01a50e
L01a53c:
	tst.w	d3
	ble	L01a5fc
	movea.l	#$00eb8210,a1
	cmp.w	#$0007,d5
	ble	L01a566
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071660,a0
	subq.w	#8,d5
	bra	L01a5a4
L01a566:
	tst.w	d5
	ble	L01a590
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#5,d0
	move.w	d5,d2
	ext.l	d2
	move.l	d2,d1
	asl.l	#3,d1
	sub.l	d2,d1
	asl.l	#2,d1
	add.l	#L071740,d1
	movea.l	d0,a0
	adda.l	d1,a0
	moveq.l	#$00,d5
	bra	L01a5a4
L01a590:
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071e40,a0
L01a5a4:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
	pea.l	($0d10)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0d11)
	bra	L01a5ee
L01a5d0:
	subq.w	#8,d5
	pea.l	($0d0c)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0d0d)
L01a5ee:
	pea.l	($0004)
	subq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
L01a5fc:
	cmp.w	#$0007,d5
	bgt	L01a5d0
	tst.w	d5
	ble	L01a68e
	move.w	d5,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071f20,a0
	move.l	(a0)+,($00eb8250)		;BGPCGパターン番号18の(0,8)の位置から7行分書き込み
	move.l	(a0)+,($00eb8254)
	move.l	(a0)+,($00eb8258)
	move.l	(a0)+,($00eb825c)
	move.l	(a0)+,($00eb8260)
	move.l	(a0)+,($00eb8264)
	move.l	(a0),($00eb8268)
	pea.l	($0d12)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0d13)
	bra	L01a680
L01a664:
	pea.l	($0d0e)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0d0f)
L01a680:
	pea.l	($0004)
	subq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
L01a68e:
	cmp.w	#$0001,d4
	bgt	L01a664
	movem.l	(sp)+,d3-d5/a3-a4
	rts

SR_2P体力ゲージ描画:
	movem.l	d3-d5/a3-a4,-(sp)
	move.w	($001a,sp),d3
	move.w	($001e,sp),d5
	pea.l	($0d08)
	pea.l	($0003)
	pea.l	($0012)
	lea.l	(SR_BGページ1_書き込み),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0d09)
	pea.l	($0004)
	pea.l	($0012)
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($4d08)
	pea.l	($0003)
	pea.l	($001e)
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($4d09)
	pea.l	($0004)
	pea.l	($001e)
	jsr	(a3)
	lea.l	($000c,sp),sp
	moveq.l	#$13,d4
	cmp.w	#$0007,d3
	ble	L01a730
	lea.l	(SR_BGページ1_書き込み),a4
L01a702:
	subq.w	#8,d3
	subq.w	#8,d5
	pea.l	($4d0a)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($4d0b)
	pea.l	($0004)
	addq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	cmp.w	#$0007,d3
	bgt	L01a702
L01a730:
	tst.w	d3
	ble	L01a7f0
	movea.l	#$00eb8290,a1
	cmp.w	#$0007,d5
	ble	L01a75a
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071660,a0
	subq.w	#8,d5
	bra	L01a798
L01a75a:
	tst.w	d5
	ble	L01a784
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#5,d0
	move.w	d5,d2
	ext.l	d2
	move.l	d2,d1
	asl.l	#3,d1
	sub.l	d2,d1
	asl.l	#2,d1
	add.l	#L071740,d1
	movea.l	d0,a0
	adda.l	d1,a0
	moveq.l	#$00,d5
	bra	L01a798
L01a784:
	move.w	d3,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071e40,a0
L01a798:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
	pea.l	($4d14)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($4d15)
	bra	L01a7e2
L01a7c4:
	subq.w	#8,d5
	pea.l	($4d0c)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($4d0d)
L01a7e2:
	pea.l	($0004)
	addq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
L01a7f0:
	cmp.w	#$0007,d5
	bgt	L01a7c4
	tst.w	d5
	ble	L01a882
	move.w	d5,d1
	ext.l	d1
	move.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0
	asl.l	#2,d0
	movea.l	d0,a0
	adda.l	#L071f20,a0
	move.l	(a0)+,($00eb82d0)
	move.l	(a0)+,($00eb82d4)
	move.l	(a0)+,($00eb82d8)
	move.l	(a0)+,($00eb82dc)
	move.l	(a0)+,($00eb82e0)
	move.l	(a0)+,($00eb82e4)
	move.l	(a0),($00eb82e8)
	pea.l	($4d16)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($4d17)
	bra	L01a874
L01a858:
	pea.l	($4d0e)
	pea.l	($0003)
	movea.w	d4,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($4d0f)
L01a874:
	pea.l	($0004)
	addq.w	#1,d4
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
L01a882:
	cmp.w	#$001d,d4
	ble	L01a858
	movem.l	(sp)+,d3-d5/a3-a4
	rts

SR_体力ゲージ点滅用パレット更新()
{
	if (--体力ゲージ点滅カウンタ < 0)
		体力ゲージ点滅カウンタ = 31;

	//パレットブロック#13のカラー#2を書き換え
	*(0x00e823a4) = 体力ゲージ点滅用_カラーパターン[体力ゲージ点滅カウンタ * 2];
}

SR_BG文字列描画:
	link	a6,#-$0002
	movem.l	d3/a3-a5,-(sp)
	move.w	($000a,a6),d3				;d3=X
	move.w	($000e,a6),d2				;d2=Y
	movea.l	($0010,a6),a3				;a3=文字列
	move.w	($0016,a6),d1				;d1=パレットブロックNo.
	move.b	(a3)+,d0
	beq	L01a922							;文字列の先頭が0だったら何もせず終了
	movea.w	d1,a5
	movea.w	d2,a4
L01a8d8:
	cmp.b	#$2f,d0
	ble	L01a8fe
	cmp.b	#$39,d0
	bgt	L01a8fe
	move.l	a5,-(sp)
	ext.w	d0
	movea.w	d0,a0
	pea.l	(-$0030,a0)
	move.l	a4,-(sp)
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BG数字表示)
	bra	L01a91a
L01a8fe:
	move.b	d0,(-$0002,a6)
	clr.b	(-$0001,a6)
	move.l	a5,-(sp)
	pea.l	(-$0002,a6)
	move.l	a4,-(sp)
	movea.w	d3,a0
	addq.w	#1,d3
	move.l	a0,-(sp)
	jsr	(SR_BG文字列表示)
L01a91a:
	lea.l	($0010,sp),sp
	move.b	(a3)+,d0
	bne	L01a8d8
L01a922:
	movem.l	(-$0012,a6),d3/a3-a5
	unlk	a6
	rts

SR_BG文字列消去:
	move.w	($000e,sp),d1			;d1=文字数
	movea.w	($0006,sp),a0			;a0=X座標
	move.w	($000a,sp),d0			;d0=Y座標
	ext.l	d0
	asl.l	#6,d0
	add.l	a0,d0
	add.l	d0,d0					;d0 = (d0 * 64 + a0) * 2
	movea.l	#$00ebe000,a0			;a0=BGデータエリア1の先頭
	adda.l	d0,a0
	tst.w	d1
	ble	L01a954
L01a94c:
	clr.w	(a0)+
	subq.w	#1,d1
	tst.w	d1
	bgt	L01a94c
L01a954:
	tst.w	(L06f42a)
	beq	L01a96c
	movea.w	(L06f42a),a1
	move.l	a1,-(sp)
	jsr	(SR_MESS_SP表示_固定位置)
	addq.w	#4,sp
L01a96c:
	rts

SR_BGページ1_書き込み:
	movea.w	($0006,sp),a0
	move.w	($000a,sp),d0
	ext.l	d0
	asl.l	#6,d0
	add.l	a0,d0
	add.l	d0,d0
	movea.l	#$00ebe000,a1
	adda.l	d0,a1
	move.w	($000e,sp),(a1)
	rts

SR_ラウンドタイマーBG数字表示:
	movem.l	d3-d5/a3-a6,-(sp)
	move.w	($0022,sp),d2
	move.w	($0026,sp),d1
	move.w	($002a,sp),d5
	move.w	($002e,sp),d4
	cmp.w	#$0063,d5
	ble	L01a9a8
	moveq.l	#$63,d5
L01a9a8:
	cmpi.w	#$0100,(L06f44a)
	bne	L01a9b8
	add.w	#$0020,d4
	bra	L01a9ba
L01a9b8:
	addq.w	#8,d4
L01a9ba:
	cmp.w	#$0009,d5
	bgt	L01a9ec
	move.w	d5,d0
	add.w	d0,d0
	add.w	d0,d4
	movea.w	d4,a3
	move.l	a3,-(sp)
	movea.w	d1,a4
	move.l	a4,-(sp)
	movea.w	d2,a5
	move.l	a5,-(sp)
	lea.l	(SR_BGページ1_書き込み),a6
	jsr	(a6)
	lea.l	($000c,sp),sp
	pea.l	($0001,a3)
	pea.l	($0001,a4)
	move.l	a5,-(sp)
	jsr	(a6)
	bra	L01aa4a
L01a9ec:
	move.w	d5,d0
	ext.l	d0
	divs.w	#$000a,d0
	add.w	d0,d0
	add.w	d4,d0
	movea.w	d0,a6
	move.l	a6,-(sp)
	movea.w	d1,a5
	move.l	a5,-(sp)
	movea.w	d2,a3
	move.l	a3,-(sp)
	lea.l	(SR_BGページ1_書き込み),a4
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0001,a6)
	move.l	a5,d3
	addq.l	#1,d3
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	move.w	d5,d0
	ext.l	d0
	divs.w	#$000a,d0
	swap.w	d0
	add.w	d0,d0
	add.w	d4,d0
	movea.w	d0,a6
	move.l	a6,-(sp)
	move.l	a5,-(sp)
	addq.w	#1,a3
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0001,a6)
	move.l	d3,-(sp)
	move.l	a3,-(sp)
	jsr	(a4)
L01aa4a:
	lea.l	($000c,sp),sp
	movem.l	(sp)+,d3-d5/a3-a6
	rts

SR_BG数字表示:
	movem.l	d3/a3-a6,-(sp)
	move.w	($001a,sp),d2
	move.w	($001e,sp),d1
	move.w	($0022,sp),d3
	movea.w	($0026,sp),a1
	cmpi.w	#$0100,(L06f44a)
	bne	L01aa78
	adda.w	#$0034,a1
	bra	L01aa7a
L01aa78:
	addq.w	#8,a1
L01aa7a:
	cmp.w	#$0009,d3
	bgt	L01aa96
	movea.w	d3,a0
	pea.l	(a0,a1.w)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d2
	move.l	d2,-(sp)
	jsr	(SR_BGページ1_書き込み)
	bra	L01aace
L01aa96:
	movea.w	a1,a3
	move.w	d3,d0
	ext.l	d0
	divs.w	#$000a,d0
	pea.l	(a3,d0.w)
	movea.w	d1,a4
	move.l	a4,-(sp)
	movea.w	d2,a5
	move.l	a5,-(sp)
	lea.l	(SR_BGページ1_書き込み),a6
	jsr	(a6)
	lea.l	($000c,sp),sp
	move.w	d3,d0
	ext.l	d0
	divs.w	#$000a,d0
	swap.w	d0
	pea.l	(a3,d0.w)
	move.l	a4,-(sp)
	pea.l	($0001,a5)
	jsr	(a6)
L01aace:
	lea.l	($000c,sp),sp
	movem.l	(sp)+,d3/a3-a6
	rts

SR_BG文字列表示:
	movem.l	a3-a4,-(sp)
	movea.w	($000e,sp),a2
	move.w	($0012,sp),d0
	movea.l	($0014,sp),a1
	movea.l	#$00ebe000,a0
	move.w	($001a,sp),d1
	cmpi.w	#$0100,(L06f44a)
	bne	L01ab02
	add.w	#$003e,d1
	bra	L01ab06
L01ab02:
	add.w	#$0012,d1
L01ab06:
	ext.l	d0
	asl.l	#6,d0
	movea.l	d0,a3
	lea.l	(a3,a2.w),a4
	move.l	a4,d0
	add.l	d0,d0
	adda.l	d0,a0
	move.b	(a1)+,d0
	beq	L01ab40
	move.w	d1,d2
	addq.w	#1,d2
	add.w	#$ffc3,d1
L01ab22:
	cmp.b	#$5f,d0
	bne	L01ab2c
	move.w	d2,(a0)+
	bra	L01ab3c
L01ab2c:
	cmp.b	#$20,d0
	bne	L01ab36
	clr.w	(a0)+
	bra	L01ab3c
L01ab36:
	ext.w	d0
	add.w	d1,d0
	move.w	d0,(a0)+
L01ab3c:
	move.b	(a1)+,d0
	bne	L01ab22
L01ab40:
	movem.l	(sp)+,a3-a4
	rts

SR_BG文字消去_9_23行:
	move.l	d3,-(sp)
	moveq.l	#$09,d3
L01ab4a:
	pea.l	($0020)
	movea.w	d3,a0
	move.l	a0,-(sp)
	pea.l	($0000)
	jsr	(SR_BG文字列消去)
	lea.l	($000c,sp),sp
	addq.w	#1,d3
	cmp.w	#$0017,d3
	ble	L01ab4a
	move.l	(sp)+,d3
	rts

SYSCALL_0220_Dataコピー_メモリブロック:
	move.w	($0006,sp),d1
	movea.l	($0008,sp),a0
	movea.l	($000c,sp),a2
	move.w	($0012,sp),d0
	cmp.w	#$0020,d1
	bne	L01aba2
	movea.l	a0,a1
	movea.l	a2,a0
	subq.w	#1,d0
	bmi	L01ac10
L01ab8c:
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	subq.w	#1,d0
	bpl	L01ab8c
	bra	L01ac10
L01aba2:
	cmp.w	#$0001,d1
	bne	L01abb4
	subq.w	#1,d0
	bmi	L01ac10
L01abac:
	move.b	(a0)+,(a2)+
	subq.w	#1,d0
	bpl	L01abac
	bra	L01ac10
L01abb4:
	cmp.w	#$0002,d1
	bne	L01abca
	movea.l	a0,a1
	movea.l	a2,a0
	subq.w	#1,d0
	bmi	L01ac10
L01abc2:
	move.w	(a1)+,(a0)+
	subq.w	#1,d0
	bpl	L01abc2
	bra	L01ac10
L01abca:
	cmp.w	#$0004,d1
	bne	L01abe0
	movea.l	a0,a1
	movea.l	a2,a0
	subq.w	#1,d0
	bmi	L01ac10
L01abd8:
	move.l	(a1)+,(a0)+
	subq.w	#1,d0
	bpl	L01abd8
	bra	L01ac10
L01abe0:
	cmp.w	#$0008,d1
	bne	L01abf8
	movea.l	a0,a1
	movea.l	a2,a0
	subq.w	#1,d0
	bmi	L01ac10
L01abee:
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	subq.w	#1,d0
	bpl	L01abee
	bra	L01ac10
L01abf8:
	cmp.w	#$0010,d1
	bne	L01ac10
	movea.l	a0,a1
	movea.l	a2,a0
	bra	L01ac0c
L01ac04:
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
L01ac0c:
	subq.w	#1,d0
	bpl	L01ac04
L01ac10:
	rts

SYSCALL_0224_Dataクリア_メモリブロック:
	move.w	($0006,sp),d1
	movea.l	($0008,sp),a0
	move.w	($000e,sp),d0
	cmp.w	#$0020,d1
	bne	L01ac40
	subq.w	#1,d0
	bmi	L01aca4
	moveq.l	#$00,d2
L01ac2a:
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	subq.w	#1,d0
	bpl	L01ac2a
	bra	L01aca4
L01ac40:
	cmp.w	#$0001,d1
	bne	L01ac52
	subq.w	#1,d0
	bmi	L01aca4
L01ac4a:
	clr.b	(a0)+
	subq.w	#1,d0
	bpl	L01ac4a
	bra	L01aca4
L01ac52:
	cmp.w	#$0002,d1
	bne	L01ac64
	subq.w	#1,d0
	bmi	L01aca4
L01ac5c:
	clr.w	(a0)+
	subq.w	#1,d0
	bpl	L01ac5c
	bra	L01aca4
L01ac64:
	cmp.w	#$0004,d1
	bne	L01ac78
	subq.w	#1,d0
	bmi	L01aca4
	moveq.l	#$00,d2
L01ac70:
	move.l	d2,(a0)+
	subq.w	#1,d0
	bpl	L01ac70
	bra	L01aca4
L01ac78:
	cmp.w	#$0008,d1
	bne	L01ac8e
	subq.w	#1,d0
	bmi	L01aca4
	moveq.l	#$00,d2
L01ac84:
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	subq.w	#1,d0
	bpl	L01ac84
	bra	L01aca4
L01ac8e:
	cmp.w	#$0010,d1
	bne	L01aca4
	bra	L01aca0
L01ac96:
	moveq.l	#$00,d2
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
	move.l	d2,(a0)+
L01aca0:
	subq.w	#1,d0
	bpl	L01ac96
L01aca4:
	rts

SR_MESS_SP表示_固定位置(pal)
{
	L06f42a = pal;
	if (d0 != 0) {
		SR_MESS_SP表示(12, 12, 4, 0, pal);
		SR_MESS_SP表示(12, 14, 4, 4, pal);
	}
}

L01acf4:
	move.w	($0006,sp),d0
	move.w	d0,(L06f42a)
	beq	L01ad1e
	ext.l	d0
	move.l	d0,-(sp)
	pea.l	($0000)
	pea.l	($0008)
	pea.l	($000d)
	pea.l	($0008)
	jsr	(SR_MESS_SP表示)
	lea.l	($0014,sp),sp
L01ad1e:
	rts

L01ad20:
	lea.l	(SFSYSINFO_0052_xxxx),a0
	subq.w	#1,(a0)
	tst.w	(a0)
	bgt	L01ad76
	move.w	(-$0002,a0),(a0)
	ble	L01ad76
	tst.w	(-$0018,a0)
	bgt	L01ad76
	tst.w	(-$000c,a0)
	beq	L01ad4c
	lea.l	(-$000e,a0),a0
	move.w	(a0),(L02025a)
	addq.w	#1,(a0)
	bra	L01ad52
L01ad4c:
	clr.w	(L02025a)
L01ad52:
	lea.l	(SFSYSINFO_0044_xxxx),a0
	cmpi.w	#$0017,(a0)
	ble	L01ad60
	clr.w	(a0)
L01ad60:
	tst.w	(WORK_1P_0ac2_気集中)
	bgt	L01ad76
	tst.w	(WORK_2P_0ac2_気集中)
	bgt	L01ad76
	jsr	(SR_ステージパレット反映)
L01ad76:
	rts

SR_ステージパレット反映:
	move.l	a3,-(sp)
	tst.w	(SFSYSINFO_0046_時間経過有効)
	bne	L01ad88
	clr.w	(L02025a)
L01ad88:
	pea.l	($0080)
	pea.l	($0000)
	move.w	(L02025a),d0
	ext.l	d0
	moveq.l	#$09,d1
	asl.l	d1,d0
	add.l	#パレットデータ_背景1_カラーA,d0
	move.l	d0,-(sp)
	lea.l	(SR_グラフィックパレット反映_任意アドレス),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	pea.l	($0080)
	pea.l	($0080)
	move.w	(L02025a),d0
	ext.l	d0
	moveq.l	#$09,d1
	asl.l	d1,d0
	add.l	#L072100,d0
	move.l	d0,-(sp)
	jsr	(a3)
	lea.l	($000c,sp),sp
	movea.l	(sp)+,a3
	rts

L01add6:
	.dc.b	'BACK1A.PAL',$00,$00
L01ade2:
	.dc.b	'BACK1B.PAL',$00,$00
L01adee:
	.dc.b	'BACK1C.PAL',$00,$00
L01adfa:
	.dc.b	'BACK2A.PAL',$00,$00
L01ae06:
	.dc.b	'BACK2B.PAL',$00,$00
L01ae12:
	.dc.b	'BACK2C.PAL',$00,$00
SR_ステージパレットデータセット読み込み(セレクト番号)
{
	SR_ステージデータファイルパス構築(セレクト番号, "BACK1A.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーA, 0x80, a6_mi0080);

	SR_ステージデータファイルパス構築(セレクト番号, "BACK1B.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーB, 0x80, a6_mi0080);

	SR_ステージデータファイルパス構築(セレクト番号, "BACK1C.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーB+0x1000, 0x80, a6_mi0080);

	SR_ステージデータファイルパス構築(セレクト番号, "BACK2A.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーB-0x0f00, 0x80, a6_mi0080);

	SR_ステージデータファイルパス構築(セレクト番号, "BACK2B.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーB+0x0100, 0x80, a6_mi0080);

	SR_ステージデータファイルパス構築(セレクト番号, "BACK2C.PAL", a6_mi0080);
	SR_グラフィックパレットファイル読み込み(パレットデータ_背景1_カラーB+0x1100, 0x80, a6_mi0080);

	L01af8e(0x00, 0x00, 0x08);
	L01af8e(0x00, 0x08, 0x10);
	L01af8e(0x00, 0x10, 0x00);
	L01af8e(0x80, 0x00, 0x08);
	L01af8e(0x80, 0x08, 0x10);
	L01af8e(0x80, 0x10, 0x00);
}

L01af8e:
	link	a6,#-$0128
	movem.l	d3-d7/a3-a5,-(sp)
	move.w	($000a,a6),(-$0002,a6)
	move.w	($0012,a6),(-$0004,a6)
	move.w	#$007f,(-$0006,a6)
	move.w	($000e,a6),d0
	ext.l	d0
	moveq.l	#$09,d2
	asl.l	d2,d0
	move.l	d0,(-$000e,a6)
	moveq.l	#$00,d2
	move.l	d2,(-$0012,a6)
	move.l	d2,(-$0022,a6)
	move.l	d2,(-$0026,a6)
	move.l	d2,(-$0036,a6)
	move.l	d2,(-$003a,a6)
	move.l	d2,(-$004a,a6)
	move.l	d2,(-$004e,a6)
	move.l	d0,d2
	add.l	#L072e00,d2
	move.l	d2,(-$011e,a6)
L01afe0:
	movea.w	(-$0002,a6),a0
	adda.w	#$007f,a0
	suba.w	(-$0006,a6),a0
	movea.w	a0,a0
	move.l	a0,d2
	add.l	d2,d2
	movea.l	d2,a0
	lea.l	(パレットデータ_背景1_カラーA),a1
	adda.l	(-$000e,a6),a1
	move.w	(a0,a1.l),(-$0008,a6)
	move.l	(-$000a,a6),d2
	moveq.l	#$0b,d4
	lsr.l	d4,d2
	movea.l	d2,a1
	move.w	a1,d2
	and.w	#$001f,d2
	movea.w	d2,a1
	move.l	(-$000a,a6),d7
	lsr.l	#6,d7
	and.w	#$001f,d7
	move.l	(-$000a,a6),d2
	lsr.l	#1,d2
	move.l	d2,(-$0128,a6)
	move.w	(-$0126,a6),d2
	and.w	#$001f,d2
	move.w	d2,(-$0128,a6)
	move.w	(-$0008,a6),d2
	and.w	#$0001,d2
	move.w	d2,(-$0124,a6)
	move.w	(-$0004,a6),d0
	ext.l	d0
	moveq.l	#$09,d2
	asl.l	d2,d0
	lea.l	(パレットデータ_背景1_カラーA),a2
	adda.l	d0,a2
	move.w	(a0,a2.l),(-$0008,a6)
	move.l	(-$000a,a6),d6
	lsr.l	d4,d6
	and.w	#$001f,d6
	move.l	(-$000a,a6),d3
	lsr.l	#6,d3
	and.w	#$001f,d3
	move.l	(-$000a,a6),d1
	lsr.l	#1,d1
	and.w	#$001f,d1
	move.w	(-$0008,a6),d0
	and.w	#$0001,d0
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.w	a1,(-$0010,a6)
	movea.l	(-$0012,a6),a5
	adda.l	a5,a5
	move.l	a5,d2
	add.l	(-$0012,a6),d2
	move.l	d2,(-$0016,a6)
	move.l	d2,d5
	add.l	(-$0012,a6),d5
	add.l	(-$0012,a6),d5
	move.l	d5,(-$001a,a6)
	move.l	d5,d2
	add.l	(-$0012,a6),d2
	move.l	d2,(-$001e,a6)
	move.l	d2,d5
	add.l	(-$0012,a6),d5
	move.w	d6,(-$0020,a6)
	add.l	(-$0022,a6),d5
	asr.l	#3,d5
	moveq.l	#$1f,d2
	and.l	d2,d5
	lsl.l	d4,d5
	andi.w	#$07ff,(-$0008,a6)
	or.l	d5,(-$000a,a6)
	move.w	d7,(-$0024,a6)
	movea.l	(-$0026,a6),a4
	adda.l	a4,a4
	move.l	a4,d2
	add.l	(-$0026,a6),d2
	move.l	d2,(-$002a,a6)
	move.l	d2,d5
	add.l	(-$0026,a6),d5
	add.l	(-$0026,a6),d5
	move.l	d5,(-$002e,a6)
	move.l	d5,d2
	add.l	(-$0026,a6),d2
	move.l	d2,(-$0032,a6)
	move.l	d2,d5
	add.l	(-$0026,a6),d5
	move.w	d3,(-$0034,a6)
	add.l	(-$0036,a6),d5
	asr.l	#3,d5
	moveq.l	#$1f,d2
	and.l	d2,d5
	lsl.l	#6,d5
	andi.w	#$f83f,(-$0008,a6)
	or.l	d5,(-$000a,a6)
	move.w	(-$0128,a6),(-$0038,a6)
	movea.l	(-$003a,a6),a2
	adda.l	a2,a2
	move.l	a2,d2
	add.l	(-$003a,a6),d2
	move.l	d2,(-$003e,a6)
	move.l	d2,d5
	add.l	(-$003a,a6),d5
	add.l	(-$003a,a6),d5
	move.l	d5,(-$0042,a6)
	move.l	d5,d2
	add.l	(-$003a,a6),d2
	move.l	d2,(-$0046,a6)
	move.l	d2,d5
	add.l	(-$003a,a6),d5
	move.w	d1,(-$0048,a6)
	add.l	(-$004a,a6),d5
	asr.l	#3,d5
	moveq.l	#$1f,d2
	and.l	d2,d5
	lsl.l	#1,d5
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	or.l	d5,(-$000a,a6)
	move.w	(-$0124,a6),(-$004c,a6)
	movea.l	(-$004e,a6),a3
	adda.l	a3,a3
	move.l	a3,d2
	add.l	(-$004e,a6),d2
	move.l	d2,(-$0052,a6)
	move.l	d2,d5
	add.l	(-$004e,a6),d5
	add.l	(-$004e,a6),d5
	move.l	d5,(-$0056,a6)
	move.l	d5,d2
	add.l	(-$004e,a6),d2
	move.l	d2,(-$005a,a6)
	add.l	(-$004e,a6),d2
	moveq.l	#$00,d5
	move.w	d0,d5
	add.l	d5,d2
	asr.l	#3,d2
	move.l	d2,(-$005e,a6)
	moveq.l	#$01,d2
	and.l	(-$005e,a6),d2
	move.l	d2,(-$0062,a6)
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$0062,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$000e,a6),d2
	add.l	#L072200,d2
	move.l	d2,(-$0122,a6)
	move.w	(-$0008,a6),(a0,d2.l)
	move.l	(-$001e,a6),d2
	add.l	(-$0022,a6),d2
	add.l	(-$0022,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$0066,a6)
	moveq.l	#$1f,d2
	and.l	(-$0066,a6),d2
	lsl.l	d4,d2
	andi.w	#$07ff,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.l	(-$0032,a6),d2
	add.l	(-$0036,a6),d2
	add.l	(-$0036,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$0072,a6)
	moveq.l	#$1f,d2
	and.l	(-$0072,a6),d2
	lsl.l	#6,d2
	andi.w	#$f83f,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.l	(-$0046,a6),d2
	add.l	(-$004a,a6),d2
	add.l	(-$004a,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$007e,a6)
	moveq.l	#$1f,d2
	and.l	(-$007e,a6),d2
	lsl.l	#1,d2
	move.l	d2,(-$0086,a6)
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$0086,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$005a,a6),d2
	add.l	d5,d2
	add.l	d5,d2
	asr.l	#3,d2
	move.l	d2,(-$008a,a6)
	moveq.l	#$01,d2
	and.l	(-$008a,a6),d2
	move.l	d2,(-$008e,a6)
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$008e,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$000e,a6),d2
	add.l	#L072400,d2
	move.l	d2,(-$0122,a6)
	move.w	(-$0008,a6),(a0,d2.l)
	move.l	(-$001a,a6),d2
	add.l	(-$0022,a6),d2
	add.l	(-$0022,a6),d2
	add.l	(-$0022,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$0092,a6)
	moveq.l	#$1f,d2
	and.l	(-$0092,a6),d2
	lsl.l	d4,d2
	andi.w	#$07ff,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.l	(-$002e,a6),d2
	add.l	(-$0036,a6),d2
	add.l	(-$0036,a6),d2
	add.l	(-$0036,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$009e,a6)
	moveq.l	#$1f,d2
	and.l	(-$009e,a6),d2
	lsl.l	#6,d2
	andi.w	#$f83f,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.l	(-$0042,a6),d2
	add.l	(-$004a,a6),d2
	add.l	(-$004a,a6),d2
	add.l	(-$004a,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$00aa,a6)
	moveq.l	#$1f,d2
	and.l	(-$00aa,a6),d2
	lsl.l	#1,d2
	move.l	d2,(-$00b2,a6)
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$00b2,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$0056,a6),d2
	add.l	d5,d2
	add.l	d5,d2
	add.l	d5,d2
	asr.l	#3,d2
	move.l	d2,(-$00b6,a6)
	moveq.l	#$01,d2
	and.l	(-$00b6,a6),d2
	move.l	d2,(-$00ba,a6)
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$00ba,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$000e,a6),d2
	add.l	#L072600,d2
	move.l	d2,(-$0122,a6)
	move.w	(-$0008,a6),(a0,d2.l)
	move.l	(-$0012,a6),d2
	add.l	(-$0022,a6),d2
	move.l	d2,(-$00be,a6)
	asr.l	#1,d2
	move.l	d2,(-$00c2,a6)
	moveq.l	#$1f,d2
	and.l	(-$00c2,a6),d2
	lsl.l	d4,d2
	andi.w	#$07ff,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	d7,(-$0010,a6)
	move.w	d3,(-$0010,a6)
	move.l	(-$0026,a6),d2
	add.l	(-$0036,a6),d2
	move.l	d2,(-$00ce,a6)
	asr.l	#1,d2
	move.l	d2,(-$00d2,a6)
	moveq.l	#$1f,d2
	and.l	(-$00d2,a6),d2
	lsl.l	#6,d2
	andi.w	#$f83f,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	d1,(-$0010,a6)
	move.l	(-$003a,a6),d2
	add.l	(-$004a,a6),d2
	move.l	d2,(-$00de,a6)
	moveq.l	#$3e,d2
	and.l	(-$00de,a6),d2
	move.l	d2,(-$00e2,a6)
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$00e2,a6),d2
	or.l	d2,(-$000a,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	d0,(-$0010,a6)
	move.l	(-$004e,a6),d2
	add.l	d5,d2
	move.l	d2,(-$00e6,a6)
	asr.l	#1,d2
	move.l	d2,(-$00ea,a6)
	moveq.l	#$01,d2
	and.l	(-$00ea,a6),d2
	move.l	d2,(-$00ee,a6)
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$00ee,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$000e,a6),d2
	add.l	#L072800,d2
	move.l	d2,(-$0122,a6)
	move.w	(-$0008,a6),(a0,d2.l)
	move.w	a1,(-$0010,a6)
	move.w	a1,(-$0010,a6)
	move.w	a1,(-$0010,a6)
	move.w	d6,(-$0010,a6)
	move.l	(-$0016,a6),d2
	add.l	(-$0022,a6),d2
	move.w	d6,(-$0010,a6)
	add.l	(-$0022,a6),d2
	move.w	d6,(-$0010,a6)
	add.l	(-$0022,a6),d2
	move.w	d6,(-$0010,a6)
	add.l	(-$0022,a6),d2
	move.w	d6,(-$0010,a6)
	add.l	(-$0022,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$00f2,a6)
	moveq.l	#$1f,d2
	and.l	(-$00f2,a6),d2
	lsl.l	d4,d2
	andi.w	#$07ff,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	d7,(-$0010,a6)
	move.w	d7,(-$0010,a6)
	move.w	d7,(-$0010,a6)
	move.w	d3,(-$0010,a6)
	move.l	(-$002a,a6),d2
	add.l	(-$0036,a6),d2
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d2
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d2
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d2
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$00fe,a6)
	moveq.l	#$1f,d2
	and.l	(-$00fe,a6),d2
	lsl.l	#6,d2
	andi.w	#$f83f,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	d1,(-$0010,a6)
	move.l	(-$003e,a6),d2
	add.l	(-$004a,a6),d2
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d2
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d2
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d2
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d2
	asr.l	#3,d2
	move.l	d2,(-$010a,a6)
	moveq.l	#$1f,d2
	and.l	(-$010a,a6),d2
	lsl.l	#1,d2
	move.l	d2,(-$0112,a6)
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$0112,a6),d2
	or.l	d2,(-$000a,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	d0,(-$0010,a6)
	move.l	(-$0052,a6),d2
	add.l	d5,d2
	move.w	d0,(-$0010,a6)
	add.l	d5,d2
	move.w	d0,(-$0010,a6)
	add.l	d5,d2
	move.w	d0,(-$0010,a6)
	add.l	d5,d2
	move.w	d0,(-$0010,a6)
	add.l	d5,d2
	asr.l	#3,d2
	move.l	d2,(-$0116,a6)
	moveq.l	#$01,d2
	and.l	(-$0116,a6),d2
	move.l	d2,(-$011a,a6)
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	(-$011a,a6),d2
	or.l	d2,(-$000a,a6)
	move.l	(-$000e,a6),d2
	add.l	#L072a00,d2
	move.l	d2,(-$0122,a6)
	move.w	(-$0008,a6),(a0,d2.l)
	move.w	a1,(-$0010,a6)
	move.w	a1,(-$0010,a6)
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a5
	move.l	a5,d2
	asr.l	#3,d2
	movea.l	d2,a5
	moveq.l	#$1f,d4
	and.l	d4,d2
	movea.l	d2,a5
	moveq.l	#$0b,d4
	lsl.l	d4,d2
	movea.l	d2,a5
	andi.w	#$07ff,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	d7,(-$0010,a6)
	move.w	d7,(-$0010,a6)
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.w	d3,(-$0010,a6)
	adda.l	(-$0036,a6),a4
	move.l	a4,d2
	asr.l	#3,d2
	movea.l	d2,a4
	moveq.l	#$1f,d4
	and.l	d4,d2
	movea.l	d2,a4
	lsl.l	#6,d2
	movea.l	d2,a4
	andi.w	#$f83f,(-$0008,a6)
	or.l	d2,(-$000a,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.w	d1,(-$0010,a6)
	adda.l	(-$004a,a6),a2
	move.l	a2,d2
	asr.l	#3,d2
	movea.l	d2,a2
	and.l	d4,d2
	movea.l	d2,a2
	lsl.l	#1,d2
	movea.l	d2,a2
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	move.l	a2,d2
	or.l	d2,(-$000a,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.w	d0,(-$0010,a6)
	adda.l	d5,a3
	move.l	a3,d2
	asr.l	#3,d2
	movea.l	d2,a3
	moveq.l	#$01,d4
	and.l	d4,d2
	movea.l	d2,a3
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	move.l	a3,d2
	or.l	d2,(-$000a,a6)
	lea.l	(パレットデータ_背景1_カラーA),a2
	lea.l	($0c00,a2),a2
	adda.l	(-$000e,a6),a2
	move.w	(-$0008,a6),(a0,a2.l)
	move.w	a1,(-$0010,a6)
	move.w	d6,(-$0010,a6)
	move.w	d6,(-$0010,a6)
	movea.l	(-$00be,a6),a1
	adda.l	(-$0022,a6),a1
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a1
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a1
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a1
	move.w	d6,(-$0010,a6)
	adda.l	(-$0022,a6),a1
	move.w	d6,(-$0010,a6)
	move.l	a1,d6
	add.l	(-$0022,a6),d6
	asr.l	#3,d6
	moveq.l	#$1f,d2
	and.l	d2,d6
	moveq.l	#$0b,d2
	lsl.l	d2,d6
	andi.w	#$07ff,(-$0008,a6)
	or.l	d6,(-$000a,a6)
	move.w	d7,(-$0010,a6)
	move.w	d3,(-$0010,a6)
	move.w	d3,(-$0010,a6)
	move.l	(-$00ce,a6),d6
	add.l	(-$0036,a6),d6
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d6
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d6
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d6
	move.w	d3,(-$0010,a6)
	add.l	(-$0036,a6),d6
	move.w	d3,(-$0010,a6)
	move.l	d6,d3
	add.l	(-$0036,a6),d3
	asr.l	#3,d3
	moveq.l	#$1f,d2
	and.l	d2,d3
	lsl.l	#6,d3
	andi.w	#$f83f,(-$0008,a6)
	or.l	d3,(-$000a,a6)
	move.w	(-$0128,a6),(-$0010,a6)
	move.w	d1,(-$0010,a6)
	move.w	d1,(-$0010,a6)
	move.l	(-$00de,a6),d3
	add.l	(-$004a,a6),d3
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d3
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d3
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d3
	move.w	d1,(-$0010,a6)
	add.l	(-$004a,a6),d3
	move.w	d1,(-$0010,a6)
	move.l	d3,d1
	add.l	(-$004a,a6),d1
	asr.l	#3,d1
	and.l	d2,d1
	lsl.l	#1,d1
	moveq.l	#$c1,d2
	and.l	d2,(-$000a,a6)
	or.l	d1,(-$000a,a6)
	move.w	(-$0124,a6),(-$0010,a6)
	move.w	d0,(-$0010,a6)
	move.w	d0,(-$0010,a6)
	move.l	(-$00e6,a6),d1
	add.l	d5,d1
	move.w	d0,(-$0010,a6)
	add.l	d5,d1
	move.w	d0,(-$0010,a6)
	add.l	d5,d1
	move.w	d0,(-$0010,a6)
	add.l	d5,d1
	move.w	d0,(-$0010,a6)
	add.l	d5,d1
	move.w	d0,(-$0010,a6)
	move.l	d1,d0
	add.l	d5,d0
	asr.l	#3,d0
	and.l	d4,d0
	moveq.l	#$fe,d2
	and.l	d2,(-$000a,a6)
	or.l	d0,(-$000a,a6)
	move.l	(-$011e,a6),d2
	move.w	(-$0008,a6),(a0,d2.l)
	subq.w	#1,(-$0006,a6)
	bpl	L01afe0
	movem.l	(-$0148,a6),d3-d7/a3-a5
	unlk	a6
	rts

L01b810:
	.dc.b	$72,$62,$00,$00
L01b814:
	.dc.b	'(LOAD_ALL_PAL2)',$00
L01b824:
	.dc.b	'Can not Open *.PAL',$00,$00

SR_グラフィックパレットファイル読み込み(書き出しバッファ, サイズ, ファイル名)
{
	fp = XCLIB_fopen(ファイル名, "rb");
	if (fp == 0) {
		SYSCALL_0264_システム異常終了("Can not Open *.PAL", "(LOAD_ALL_PAL2)");
	}

	XCLIB_fread(書き出しバッファ, サイズ * 2, 1, fp);
	XCLIB_fclose(fp);
}

SR_グラフィックパレット反映_任意アドレス:
	movea.l	($0004,sp),a1
	move.w	($000a,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a0
	adda.l	#$00e82000,a0
	move.w	($000e,sp),d0
	bra	L01b8ba
L01b8b8:
	move.w	(a1)+,(a0)+
L01b8ba:
	subq.w	#1,d0
	bpl	L01b8b8
	rts

SR_グラフィックパレット_黒化:
	movea.l	#$00e82000,a0
	moveq.l	#$7f,d0
	moveq.l	#$00,d1
L01b8ca:
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01b8ca
	rts

L01b8d2:
	movem.l	d3-d7/a3-a4,-(sp)
	movea.w	($0032,sp),a2
	movea.w	($0036,sp),a3
	move.w	($002e,sp),d7
	moveq.l	#$0a,d6
	lsl.w	d6,d7
	move.w	($002a,sp),d6
	lsl.w	#5,d6
	movea.w	d6,a4
	move.w	($0022,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a0
	adda.l	#$00e82000,a0
	lea.l	(グラフィックパレットバッファ),a1
	move.w	($0026,sp),d5
	bra	L01b95e
L01b90a:
	move.w	(a0)+,d1
	move.w	a3,d4
	subq.w	#1,d4
	bmi	L01b95c
L01b912:
	move.w	d1,d0
	and.w	#$f800,d0
	lsr.w	#1,d0
	move.w	d0,d3
	add.w	#$0400,d3
	move.w	d1,d0
	and.w	#$07c0,d0
	lsr.w	#1,d0
	move.w	d0,d2
	add.w	#$0020,d2
	move.w	d1,d0
	and.w	#$003e,d0
	lsr.w	#1,d0
	move.w	d0,d1
	addq.w	#1,d1
	cmp.w	d3,d7
	bcc	L01b940
	move.w	d7,d3
L01b940:
	cmp.w	a4,d2
	bls	L01b946
	move.w	a4,d2
L01b946:
	cmp.w	a2,d1
	bls	L01b94c
	move.w	a2,d1
L01b94c:
	move.w	d2,d0
	or.w	d3,d0
	or.w	d1,d0
	move.w	d0,d1
	lsl.w	#1,d1
	move.w	d1,(a1)
	subq.w	#1,d4
	bpl	L01b912
L01b95c:
	addq.w	#2,a1
L01b95e:
	subq.w	#1,d5
	bpl	L01b90a
	movem.l	(sp)+,d3-d7/a3-a4
	rts

L01b968:
	movem.l	d3-d6,-(sp)
	move.w	($001e,sp),d6
	move.w	($0016,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a1
	adda.l	#$00e82000,a1
	lea.l	(グラフィックパレットバッファ),a0
	move.w	($001a,sp),d5
	bra	L01b9f4
L01b98c:
	tst.w	(a1)
	bne	L01b996
	addq.w	#2,a1
	clr.w	(a0)+
	bra	L01b9f4
L01b996:
	move.w	(a1)+,d1
	move.w	d6,d4
	subq.w	#1,d4
	bmi	L01b9f2
L01b99e:
	move.w	d1,d0
	and.w	#$f800,d0
	lsr.w	#1,d0
	move.w	d0,d3
	add.w	#$0400,d3
	move.w	d1,d0
	and.w	#$07c0,d0
	lsr.w	#1,d0
	move.w	d0,d2
	add.w	#$0020,d2
	move.w	d1,d0
	and.w	#$003e,d0
	lsr.w	#1,d0
	move.w	d0,d1
	addq.w	#1,d1
	cmp.w	#$7c00,d3
	bls	L01b9d0
	move.w	#$7c00,d3
L01b9d0:
	cmp.w	#$03e0,d2
	bls	L01b9da
	move.w	#$03e0,d2
L01b9da:
	cmp.w	#$001f,d1
	bls	L01b9e2
	moveq.l	#$1f,d1
L01b9e2:
	move.w	d2,d0
	or.w	d3,d0
	or.w	d1,d0
	move.w	d0,d1
	lsl.w	#1,d1
	move.w	d1,(a0)
	subq.w	#1,d4
	bpl	L01b99e
L01b9f2:
	addq.w	#2,a0
L01b9f4:
	subq.w	#1,d5
	bpl	L01b98c
	movem.l	(sp)+,d3-d6
	rts

L01b9fe:
	movem.l	d3-d7/a3,-(sp)
	movea.w	($0026,sp),a2
	move.w	($001e,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a0
	adda.l	#$00e82000,a0
	lea.l	(グラフィックパレットバッファ),a1
	movea.w	($0022,sp),a3
	bra	L01ba9c
L01ba22:
	move.w	(a0)+,d1
	move.w	a2,d6
	subq.w	#1,d6
	bmi	L01ba9a
	moveq.l	#$00,d2
L01ba2c:
	move.l	d1,d0
	moveq.l	#$0b,d7
	lsr.l	d7,d0
	and.w	#$001f,d0
	move.w	d0,d3
	subq.w	#1,d3
	move.l	d1,d0
	lsr.l	#6,d0
	and.w	#$001f,d0
	move.w	d0,d4
	subq.w	#1,d4
	move.l	d1,d0
	lsr.l	#1,d0
	and.w	#$001f,d0
	move.w	d0,d5
	subq.w	#1,d5
	tst.w	d3
	bgt	L01ba58
	moveq.l	#$01,d3
L01ba58:
	tst.w	d4
	bgt	L01ba5e
	moveq.l	#$01,d4
L01ba5e:
	tst.w	d5
	bgt	L01ba64
	moveq.l	#$01,d5
L01ba64:
	move.w	d3,d2
	moveq.l	#$1f,d0
	and.l	d2,d0
	moveq.l	#$0b,d7
	lsl.l	d7,d0
	and.w	#$07ff,d1
	or.l	d0,d1
	move.w	d4,d2
	moveq.l	#$1f,d0
	and.l	d2,d0
	lsl.l	#6,d0
	and.w	#$f83f,d1
	or.l	d0,d1
	move.w	d5,d2
	moveq.l	#$1f,d0
	and.l	d2,d0
	lsl.l	#1,d0
	moveq.l	#$c1,d7
	and.l	d7,d1
	or.l	d0,d1
	moveq.l	#$fe,d7
	and.l	d7,d1
	move.w	d1,(a1)
	subq.w	#1,d6
	bpl	L01ba2c
L01ba9a:
	addq.w	#2,a1
L01ba9c:
	subq.w	#1,a3
	cmpa.w	#$0000,a3
	bge	L01ba22
	movem.l	(sp)+,d3-d7/a3
	rts

SR_マスクグラフィックパレット生成:
	move.w	($0006,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a1
	adda.l	#$00e82000,a1
	lea.l	(グラフィックパレットバッファ),a0
	move.w	($000a,sp),d0
	bra	L01baf0
L01bac8:
	tst.w	(a1)+				;透明色の時は無加工
	beq	L01baee
	move.w	(a1),d1
	and.w	#$07ff,d1			;緑成分クリア
	or.w	#$0800,d1			;緑成分に1をセット
	and.w	#$f83f,d1			;赤成分クリア
	moveq.l	#$40,d2
	or.l	d2,d1				;赤成分に1をセット
	moveq.l	#$c1,d2
	and.l	d2,d1				;青成分クリア
	moveq.l	#$02,d2
	or.l	d2,d1				;青成分に1をセット
	moveq.l	#$fe,d2
	and.l	d2,d1				;輝度ビットクリア
	move.w	d1,(a0)+
	bra	L01baf0
L01baee:
	clr.w	(a0)+
L01baf0:
	subq.w	#1,d0
	bpl	L01bac8
	rts

SR_暗転グラフィックパレット生成:
	move.l	d3,-(sp)
	move.w	($000a,sp),d0		;引数1:パレット番号
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a1
	adda.l	#$00e82000,a1		;グラフィックパレットアドレス
	lea.l	(グラフィックパレットバッファ),a0
	move.w	($000e,sp),d2		;引数2：ループ回数
	bra	L01bb56
L01bb14:
	move.w	(a1)+,d1			;色情報取得
	move.l	d1,d0
	moveq.l	#$0b,d3
	lsr.l	d3,d0
	moveq.l	#$1f,d3
	and.l	d3,d0				;緑成分取得
	asr.l	#1,d0				;半減
	and.l	d3,d0
	moveq.l	#$0b,d3
	lsl.l	d3,d0
	and.w	#$07ff,d1
	or.l	d0,d1				;緑成分置換
	move.l	d1,d0
	lsr.l	#6,d0
	moveq.l	#$1f,d3
	and.l	d3,d0				;赤成分取得
	asr.l	#1,d0				;半減
	and.l	d3,d0
	lsl.l	#6,d0
	and.w	#$f83f,d1
	or.l	d0,d1				;赤成分置換
	move.l	d1,d0
	lsr.l	#1,d0
	moveq.l	#$1e,d3
	and.l	d3,d0				;青成分取得
	moveq.l	#$c1,d3
	and.l	d3,d1
	or.l	d0,d1
	moveq.l	#$fe,d3
	and.l	d3,d1
	move.w	d1,(a0)+
L01bb56:
	subq.w	#1,d2
	bpl	L01bb14
	move.l	(sp)+,d3
	rts

L01bb5e:
	link	a6,#-$0040
	movem.l	d3-d7/a3-a4,-(sp)
	move.w	($000e,a6),d5
	move.w	($000a,a6),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a3
	adda.l	#$00e82000,a3
	lea.l	(グラフィックパレットバッファ),a4
	moveq.l	#$1f,d4
L01bb82:
	move.w	d4,d3
	ext.l	d3
	move.l	d3,-(sp)
	move.l	d3,-(sp)
	move.l	d3,-(sp)
	jsr	(L01e2fe)					;L01e2fe(31, 31, 31)
	lea.l	($000c,sp),sp
	add.l	d3,d3
	move.w	d0,(-$40,a6,d3.l)
	subq.w	#1,d4
	bpl	L01bb82
	bra	L01bbf6
L01bba2:
	move.w	(a3)+,d6				;d6=パレット情報
	move.l	d6,d1
	moveq.l	#$0b,d7
	lsr.l	d7,d1
	moveq.l	#$1f,d7
	and.l	d7,d1					;d1=緑成分取得
	move.l	d1,d0
	asl.l	#3,d0
	add.l	d1,d0
	add.l	d0,d0
	add.l	d1,d0
	asl.l	#3,d0
	sub.l	d1,d0					;緑成分151倍
	move.l	d6,d2
	lsr.l	#6,d2
	and.l	d7,d2					;赤成分取得
	move.l	d2,d1
	asl.l	#3,d1
	add.l	d2,d1
	add.l	d1,d1
	add.l	d2,d1
	asl.l	#2,d1
	add.l	d2,d1					;77倍
	add.l	d1,d0
	move.l	d6,d2
	lsr.l	#1,d2					;青成分取得
	and.l	d7,d2
	move.l	d2,d1
	asl.l	#3,d1
	sub.l	d2,d1
	asl.l	#2,d1					;28倍
	add.l	d1,d0
	movea.l	a4,a0
	addq.w	#2,a4
	bpl	L01bbee
	add.l	#$000000ff,d0
L01bbee:
	asr.l	#8,d0
	add.l	d0,d0
	move.w	(-$40,a6,d0.l),(a0)
L01bbf6:
	subq.w	#1,d5
	bpl	L01bba2
	movem.l	(-$005c,a6),d3-d7/a3-a4
	unlk	a6
	rts

SR_グラフィックパレット反映:
	move.w	($0006,sp),d0
	ext.l	d0
	add.l	d0,d0
	movea.l	d0,a0
	adda.l	#$00e82000,a0
	lea.l	(グラフィックパレットバッファ),a1
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1),(a0)
	rts

L01bc9c:
	pea.l	($0010)
	move.l	#$00e82200,-(sp)
	pea.l	($0002)
	jsr	(SYSCALL_0224_Dataクリア_メモリブロック)
	lea.l	($000c,sp),sp
	rts

L01bcb6:
	movea.l	#$00c00000,a0
	move.w	#$3fff,d0
L01bcc0:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bcc0
	move.w	#$3fff,d0
L01bccc:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bccc
	move.w	#$3fff,d0
L01bcd8:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bcd8
	move.w	#$3fff,d0
L01bce4:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bce4
	rts

L01bcee:
	movea.l	#$00c40000,a0
	move.w	#$3fff,d0
L01bcf8:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bcf8
	move.w	#$3fff,d0
L01bd04:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bd04
	move.w	#$3fff,d0
L01bd10:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bd10
	move.w	#$3fff,d0
L01bd1c:
	moveq.l	#$00,d1
	move.l	d1,(a0)+
	subq.w	#1,d0
	bpl	L01bd1c
	rts

L01bd26:
	movea.l	#$00e00000,a0
L01bd2c:
	moveq.l	#$00,d0
	move.l	d0,(a0)+
	cmpa.l	#$00e7ffff,a0
	ble	L01bd2c
	rts

L01bd3a:
	move.l	a3,-(sp)
	lea.l	(L06f44a),a3
	move.w	#$0100,(a3)
	move.w	(a3),($0002,a3)
	move.w	#$0001,($0006,a3)
	move.w	#$0de4,($00e82500)
	pea.l	($0401)
	jsr	(SYSCALL_01dc_Scr設定_画面モード)
	addq.w	#4,sp
	cmpi.w	#$0001,($000a,a3)
	bne	L01bd72
	pea.l	($001f)
	bra	L01bd76
L01bd72:
	pea.l	($000f)
L01bd76:
	jsr	(L013626)
	addq.w	#4,sp
	movea.l	(sp)+,a3
	rts

SYSCALL_0274_Scr取得_スクリーン情報:
	move.l	#グラフィック画面プレーン0座標,d0
	rts

SYSCALL_01dc_Scr設定_画面モード:
	movem.l	d3-d4/a3,-(sp)
	move.w	($0012,sp),d3
	lea.l	(L06f44a),a0
	move.w	(a0),d4
	btst.l	#$00,d3
	beq	L01bdaa
	move.w	#$0100,(a0)
	move.w	(a0),($0002,a0)
	bra	L01be00
L01bdaa:
	btst.l	#$01,d3
	beq	L01bdc0
	lea.l	(L06f44a),a0
	move.w	#$0140,(a0)+
	move.w	#$0100,(a0)
	bra	L01be00
L01bdc0:
	btst.l	#$02,d3
	beq	L01bdd6
	lea.l	(L06f44a),a0
	move.w	#$0200,(a0)
	move.w	(a0),($0002,a0)
	bra	L01be00
L01bdd6:
	btst.l	#$03,d3
	beq	L01bdec
	lea.l	(L06f44a),a0
	move.w	#$0280,(a0)+
	move.w	#$01e0,(a0)
	bra	L01be00
L01bdec:
	btst.l	#$04,d3
	beq	L01be00
	lea.l	(L06f44a),a0
	move.w	#$0300,(a0)+
	move.w	#$0200,(a0)
L01be00:
	btst.l	#$08,d3
	beq	L01be54
	lea.l	(L06f44a),a0
	cmpi.w	#$0100,(a0)
	bne	L01be24
	tst.w	($000a,a0)
	bne	L01be1e
	pea.l	($0103)
	bra	L01be40
L01be1e:
	pea.l	($0102)
	bra	L01be40
L01be24:
	lea.l	(L06f44a),a0
	cmpi.w	#$0200,(a0)
	bne	L01be48
	tst.w	($000a,a0)
	bne	L01be3c
	pea.l	($0101)
	bra	L01be40
L01be3c:
	pea.l	($0100)
L01be40:
	jsr	(iocscall_crtmod)
	addq.w	#4,sp
L01be48:
	move.w	#$0004,(グラフィック画面最大ページ数)
	bra	L01bef6
L01be54:
	btst.l	#$09,d3
	beq	L01bea6
	lea.l	(L06f44a),a0
	cmpi.w	#$0100,(a0)
	bne	L01be78
	tst.w	($000a,a0)
	bne	L01be72
	pea.l	($010b)
	bra	L01be94
L01be72:
	pea.l	($010a)
	bra	L01be94
L01be78:
	lea.l	(L06f44a),a0
	cmpi.w	#$0200,(a0)
	bne	L01be9c
	tst.w	($000a,a0)
	bne	L01be90
	pea.l	($0109)
	bra	L01be94
L01be90:
	pea.l	($0108)
L01be94:
	jsr	(iocscall_crtmod)
	addq.w	#4,sp
L01be9c:
	move.w	#$0002,(グラフィック画面最大ページ数)
	bra	L01bef6
L01bea6:
	btst.l	#$0a,d3
	beq	L01bf00
	lea.l	(L06f44a),a0
	cmpi.w	#$0100,(a0)
	bne	L01beca
	tst.w	($000a,a0)
	bne	L01bec4
	pea.l	($010f)
	bra	L01bee6
L01bec4:
	pea.l	($010e)
	bra	L01bee6
L01beca:
	lea.l	(L06f44a),a0
	cmpi.w	#$0200,(a0)
	bne	L01beee
	tst.w	($000a,a0)
	bne	L01bee2
	pea.l	($010d)
	bra	L01bee6
L01bee2:
	pea.l	($010c)
L01bee6:
	jsr	(iocscall_crtmod)
	addq.w	#4,sp
L01beee:
	move.w	#$0001,(グラフィック画面最大ページ数)
L01bef6:
	tst.w	d3
	blt	L01bf00
	jsr	(iocscall_g_clr_on)
L01bf00:
	lea.l	(L06f44a),a3
	cmp.w	(a3),d4
	beq	L01bf6c
	pea.l	($0000)
	jsr	(SYSCALL_02a8_Scr設定_ＢＧ表示)
	addq.w	#4,sp
	cmpi.w	#$0100,(a3)
	bne	L01bf3c
	pea.l	($00c0)
	move.l	#$00eb8000,-(sp)
	pea.l	(L06dc22)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)
	lea.l	($0010,sp),sp
	bra	L01bf84
L01bf3c:
	cmpi.w	#$0200,(L06f44a)
	bne	L01bf84
	pea.l	($00c0)
	pea.l	(L06dc22)
	move.l	#$00eb8000,-(sp)
	pea.l	($0020)
	jsr	(SYSCALL_0220_Dataコピー_メモリブロック)
	lea.l	($0010,sp),sp
	jsr	(SR_システムPCG3_SP読み込み・登録)
	bra	L01bf84
L01bf6c:
	pea.l	($0001)
	jsr	(SYSCALL_02a8_Scr設定_ＢＧ表示)
	addq.w	#4,sp
	pea.l	($0001)
	jsr	(L01c4d6)
	addq.w	#4,sp
L01bf84:
	movem.l	(sp)+,d3-d4/a3
	rts

SR_スクリーン周波数変更(d1)
{
	if (d1 == 0) {
		画面周波数 = 1;
	} else if (d1 == 1) {
		画面周波数 = 0;
	}

	switch (グラフィック画面最大ページ数) {
		case 1:
			d1 = SCR_NO_CLEAR|SCR_MODE_P64K;
			break;
		case 2:
			d1 = SCR_NO_CLEAR|SCR_MODE_P256;
			break;
		case 4:
			d1 = SCR_NO_CLEAR|SCR_MODE_P16;
			break;
	}
	SYSCALL_01dc_Scr設定_画面モード(d1);

	L013626(画面周波数 == 1 ? 31 : 15);
}

SYSCALL_01e0_Scr設定_表示位置(page, x, y)
{
	if (グラフィック画面最大ページ数 == 1) {
		グラフィック画面プレーン0座標[0] = x;
		グラフィック画面プレーン0座標[2] = x;
		グラフィック画面プレーン0座標[4] = x;
		グラフィック画面プレーン0座標[6] = x;
		グラフィック画面プレーン0座標[1] = y;
		グラフィック画面プレーン0座標[3] = y;
		グラフィック画面プレーン0座標[5] = y;
		グラフィック画面プレーン0座標[7] = y;
	} else if (グラフィック画面最大ページ数 == 2) {
		if (page & SCR_PAGE_0) {
			グラフィック画面プレーン0座標[0] = x;
			グラフィック画面プレーン0座標[2] = x;
			グラフィック画面プレーン0座標[1] = y;
			グラフィック画面プレーン0座標[3] = y;
		} else if (page & SCR_PAGE_1) {
			グラフィック画面プレーン2座標[0] = x;
			グラフィック画面プレーン2座標[2] = x;
			グラフィック画面プレーン2座標[1] = y;
			グラフィック画面プレーン2座標[3] = y;
		}
	} else {
		if (page & SCR_PAGE_0) {
			グラフィック画面プレーン0座標[0] = x;
			グラフィック画面プレーン0座標[1] = y;
		} else if (page & SCR_PAGE_1) {
			グラフィック画面プレーン1座標[0] = x;
			グラフィック画面プレーン1座標[1] = y;
		} else if (page & SCR_PAGE_2) {
			グラフィック画面プレーン2座標[0] = x;
			グラフィック画面プレーン2座標[1] = y;
		} else if (page & SCR_PAGE_3) {
			グラフィック画面プレーン3座標[0] = x;
			グラフィック画面プレーン3座標[1] = y;
		}
	}
}

SYSCALL_01e4_Scr設定_表示面(page)
{
	iocscall_vpage(page);
	グラフィック画面表示面 = page;
}

SYSCALL_0228_Scr設定_余白(left, right, top, bottom)
{
	スクリーン余白[0] = left;
	スクリーン余白[1] = right;
	スクリーン余白[2] = top;
	スクリーン余白[3] = bottom;
}

SYSCALL_01e8_Scr設定_ＢＧマスク:
	movem.l	d3-d7/a3-a6,-(sp)
	move.w	($002a,sp),d3
	move.w	($002e,sp),d7
	move.w	d3,(L06f452)
	pea.l	($0001)
	jsr	(L01c4d6)
	addq.w	#4,sp
	tst.w	d3
	bne	L01c1ce
	moveq.l	#$0f,d4
	moveq.l	#$10,d5
	jsr	(L01bc9c)
	move.w	d4,d6
	lea.l	(L06f45a),a5
	lea.l	(-$0004,a5),a4
	lea.l	(L06f45c),a6
L01c120:
	tst.w	d7
	ble	L01c130
	movea.w	d7,a2
	move.l	a2,-(sp)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
L01c130:
	moveq.l	#$00,d0
	cmp.w	(a5),d4
	blt	L01c172
	move.w	(a4),d3
	movea.w	d3,a1
	movea.w	#$001f,a0
	suba.w	(L06f458),a0
	cmpa.l	a1,a0
	blt	L01c170
	movea.w	d4,a3
L01c14a:
	pea.l	($0f00)
	move.l	a3,-(sp)
	movea.w	d3,a2
	move.l	a2,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,d3
	movea.w	d3,a1
	movea.w	#$001f,a0
	suba.w	(L06f458),a0
	cmpa.l	a1,a0
	bge	L01c14a
L01c170:
	moveq.l	#$01,d0
L01c172:
	movea.w	d5,a0
	movea.w	#$001f,a1
	suba.w	(a6),a1
	cmpa.l	a0,a1
	blt	L01c1ba
	move.w	(a4),d3
	movea.w	d3,a1
	movea.w	#$001f,a0
	suba.w	(L06f458),a0
	cmpa.l	a1,a0
	blt	L01c1b8
	movea.w	d5,a3
L01c192:
	pea.l	($0f00)
	move.l	a3,-(sp)
	movea.w	d3,a2
	move.l	a2,-(sp)
	jsr	(SR_BGページ1_書き込み)
	lea.l	($000c,sp),sp
	addq.w	#1,d3
	movea.w	d3,a1
	movea.w	#$001f,a0
	suba.w	(L06f458),a0
	cmpa.l	a1,a0
	bge	L01c192
L01c1b8:
	moveq.l	#$01,d0
L01c1ba:
	tst.w	d0
	beq	L01c262
	subq.w	#1,d4
	addq.w	#1,d5
	subq.w	#1,d6
	bpl	L01c120
	bra	L01c262
L01c1ce:
	lea.l	(L06f45a),a0
	move.w	(a0)+,d5
	moveq.l	#$1f,d4
	sub.w	(a0),d4
	tst.w	d7
	ble	L01c226
	moveq.l	#$0f,d6
	lea.l	(SR_BGページ1_書き込み),a4
L01c1e6:
	movea.w	d7,a2
	move.l	a2,-(sp)
	jsr	(SR_VDISP回数指定待機)
	addq.w	#4,sp
	moveq.l	#$1f,d3
L01c1f4:
	pea.l	($0f01)
	movea.w	d5,a2
	move.l	a2,-(sp)
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0f01)
	movea.w	d4,a2
	move.l	a2,-(sp)
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	subq.w	#1,d3
	bpl	L01c1f4
	addq.w	#1,d5
	subq.w	#1,d4
	cmp.w	d5,d4
	ble	L01c226
	subq.w	#1,d6
	bpl	L01c1e6
L01c226:
	moveq.l	#$00,d5
	moveq.l	#$1f,d4
	moveq.l	#$0f,d6
	lea.l	(SR_BGページ1_書き込み),a4
L01c232:
	moveq.l	#$1f,d3
L01c234:
	pea.l	($0f01)
	movea.w	d5,a2
	move.l	a2,-(sp)
	movea.w	d3,a3
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	pea.l	($0f01)
	movea.w	d4,a2
	move.l	a2,-(sp)
	move.l	a3,-(sp)
	jsr	(a4)
	lea.l	($000c,sp),sp
	subq.w	#1,d3
	bpl	L01c234
	addq.w	#1,d5
	subq.w	#1,d4
	subq.w	#1,d6
	bpl	L01c232
L01c262:
	pea.l	($007f)
	pea.l	($0000)
	jsr	(XCLIB_sp_off)
	addq.w	#8,sp
	jsr	(L01bc9c)
	movem.l	(sp)+,d3-d7/a3-a6
	rts

SYSCALL_0214_Scr設定_ＧＲＰパレット:
	move.w	($0006,sp),d0
	move.l	($0008,sp),d1
	btst.l	#$00,d0
	beq	L01c294
	move.l	d1,(L06f426)
	bra	L01c2a0
L01c294:
	btst.l	#$01,d0
	beq	L01c2a0
	move.l	d1,(L06f422)
L01c2a0:
	rts

SYSCALL_01ec_Scr描画_ＰＩＣファイル:
	link	a6,#-$0100
	movem.l	d3-d6,-(sp)
	move.w	($000e,a6),d4
	move.w	($0012,a6),d5
	move.w	($0016,a6),d6
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	move.l	($0018,a6),-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(SR_PIC画像展開)
	ext.l	d0
	movem.l	(-$0110,a6),d3-d6
	unlk	a6
	rts

L01c2f2:
	.dc.b	'(ALLOC_PIC_BUFF)',$00,$00
L01c304:
	.dc.b	'メモリが不足しています',$00,$00
SR_PIC画像展開:
	movem.l	d3-d6/a3,-(sp)
	move.w	($001e,sp),d6
	move.w	($0022,sp),d5
	move.l	($0024,sp),d0
	pea.l	($0000)
	move.l	d0,-(sp)
	jsr	(doscall_open)
	addq.w	#8,sp
	move.l	d0,d3
	bge	L01c344
	moveq.l	#$01,d0
	bra	L01c3e4
L01c344:
	move.l	#$00010000,-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d4
	bne	L01c36a
	pea.l	(L01c2f2)
	pea.l	(L01c304)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L01c36a:
	move.l	d3,-(sp)
	lea.l	(doscall_fgetc),a3
	jsr	(a3)
	addq.w	#4,sp
	moveq.l	#$50,d1
	cmp.l	d0,d1
	bne	L01c3ce
	move.l	d3,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	moveq.l	#$49,d1
	cmp.l	d0,d1
	bne	L01c3ce
	move.l	d3,-(sp)
	jsr	(a3)
	addq.w	#4,sp
	moveq.l	#$43,d1
	cmp.l	d0,d1
	bne	L01c3ce
L01c394:
	move.l	d3,-(sp)
	jsr	(doscall_fgetc)
	addq.w	#4,sp
	moveq.l	#$1a,d1
	cmp.l	d0,d1
	bne	L01c394
L01c3a4:
	move.l	d3,-(sp)
	jsr	(doscall_fgetc)
	addq.w	#4,sp
	tst.l	d0
	bne	L01c3a4
	move.l	#$00010000,-(sp)
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	move.l	d3,-(sp)
	jsr	(L01cd3c)
	lea.l	($0014,sp),sp
L01c3ce:
	move.l	d3,-(sp)
	jsr	(doscall_close)
	addq.w	#4,sp
	move.l	d4,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	addq.w	#4,sp
	moveq.l	#$00,d0
L01c3e4:
	movem.l	(sp)+,d3-d6/a3
	rts

SYSCALL_01f0_Scr描画_矩形クリア:
	movem.l	d3-d4,-(sp)
	move.w	($001a,sp),d3
	move.w	($0012,sp),d0
	ext.l	d0
	add.l	d0,d0
	move.w	($0016,sp),d1
	ext.l	d1
	moveq.l	#$0a,d4
	asl.l	d4,d1
	add.l	#$00c00000,d1
	move.l	d0,d2
	add.l	d1,d2
	move.w	($001e,sp),d1
	subq.w	#1,d1
	bmi	L01c42e
L01c416:
	movea.l	d2,a0
	move.w	d3,d0
	subq.w	#1,d0
	bmi	L01c424
L01c41e:
	clr.w	(a0)+
	subq.w	#1,d0
	bpl	L01c41e
L01c424:
	add.l	#$00000400,d2
	subq.w	#1,d1
	bpl	L01c416
L01c42e:
	movem.l	(sp)+,d3-d4
	rts

SYSCALL_01f4_Scr描画_矩形クリア２:
	move.l	d3,-(sp)
	move.w	($000a,sp),d2
	move.w	($000e,sp),d0
	ext.l	d0
	add.l	d0,d0
	move.w	($0012,sp),d1
	ext.l	d1
	moveq.l	#$0a,d3
	asl.l	d3,d1
	add.l	d1,d0
	movea.l	d0,a0
	adda.l	#$00c00000,a0
	lea.l	(グラフィック画面最大ページ数),a1
	cmpi.w	#$0001,(a1)
	beq	L01c4ae
	cmpi.w	#$0002,(a1)
	bne	L01c470
	cmp.w	#$0002,d2
	bne	L01c4ae
	bra	L01c49c
L01c470:
	cmpi.w	#$0004,(グラフィック画面最大ページ数)
	bne	L01c4ae
	cmp.w	#$0004,d2
	beq	L01c49c
	bgt	L01c48a
	cmp.w	#$0002,d2
	beq	L01c492
	bra	L01c4ae
L01c48a:
	cmp.w	#$0008,d2
	beq	L01c4a6
	bra	L01c4ae
L01c492:
	movea.l	d0,a0
	adda.l	#$00c40000,a0
	bra	L01c4ae
L01c49c:
	movea.l	d0,a0
	adda.l	#$00c80000,a0
	bra	L01c4ae
L01c4a6:
	movea.l	d0,a0
	adda.l	#$00cc0000,a0
L01c4ae:
	move.w	#$00ff,d1
	moveq.l	#$00,d3
L01c4b4:
	moveq.l	#$0f,d0
L01c4b6:
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	move.l	d3,(a0)+
	subq.w	#1,d0
	bpl	L01c4b6
	lea.l	($0200,a0),a0
	subq.w	#1,d1
	bpl	L01c4b4
	move.l	(sp)+,d3
	rts

L01c4d6:
	movea.w	($0006,sp),a0
	move.l	a0,-(sp)
	jsr	(XCLIB_iocs_sp_on)
	addq.w	#4,sp
	rts

L01c4e6:
	move.l	d3,-(sp)
	moveq.l	#$7f,d3
L01c4ea:
	pea.l	($0001)
	pea.l	($0100)
	movea.w	d3,a0
	pea.l	($0230,a0)
	pea.l	($0010)
	move.l	a0,-(sp)
	jsr	(XCLIB_iocs_sp_regst)
	lea.l	($0014,sp),sp
	subq.w	#1,d3
	bpl	L01c4ea
	pea.l	($007f)
	pea.l	($0000)
	jsr	(L01e3c0)
	addq.w	#8,sp
	move.l	(sp)+,d3
	rts

SYSCALL_02a8_Scr設定_ＢＧ表示:
	movem.l	d3/a3,-(sp)
	move.w	($000e,sp),d3
	cmpi.w	#$0100,(L06f44a)
	bne	L01c55a
	pea.l	($0000)
	pea.l	($0000)
	pea.l	($0000)
	lea.l	(XCLIB_iocs_bgctrlst),a3
	jsr	(a3)
	lea.l	($000c,sp),sp
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0001)
	pea.l	($0001)
	jsr	(a3)
	bra	L01c576
L01c55a:
	cmpi.w	#$0200,(L06f44a)
	bne	L01c57a
	ext.l	d3
	move.l	d3,-(sp)
	pea.l	($0001)
	pea.l	($0000)
	jsr	(XCLIB_iocs_bgctrlst)
L01c576:
	lea.l	($000c,sp),sp
L01c57a:
	movem.l	(sp)+,d3/a3
	rts

SYSCALL_0210_Scr描画_ＧＲＰデータ:
	link	a6,#-$0002
	movem.l	d3-d7/a3,-(sp)
	move.w	($000a,a6),d0
	movea.w	($000e,a6),a0
	move.w	($0012,a6),d1
	movea.l	($0014,a6),a1
	move.w	($001a,a6),d6
	cmpa.w	#$0000,a1
	beq	L01c786
	cmpi.w	#$0002,(グラフィック画面最大ページ数)
	bne	L01c5d6
	btst.l	#$00,d0
	beq	L01c5c0
L01c5b4:
	move.l	#$00c00000,d4
L01c5ba:
	clr.b	(-$0001,a6)
	bra	L01c614
L01c5c0:
	btst.l	#$01,d0
	beq	L01c786
	move.l	#$00c80000,d4
	move.b	#$80,(-$0001,a6)
	bra	L01c614
L01c5d6:
	cmpi.w	#$0004,(グラフィック画面最大ページ数)
	bne	L01c786
	btst.l	#$00,d0
	bne	L01c5b4
	btst.l	#$01,d0
	beq	L01c5f6
	move.l	#$00c40000,d4
	bra	L01c5ba
L01c5f6:
	btst.l	#$01,d0
	beq	L01c604
	move.l	#$00c80000,d4
	bra	L01c5ba
L01c604:
	btst.l	#$01,d0
	beq	L01c786
	move.l	#$00cc0000,d4
	bra	L01c5ba
L01c614:
	tst.w	d6
	bgt	L01c61c
	move.w	#$0200,d6
L01c61c:
	move.w	d1,d0
	ext.l	d0
	moveq.l	#$09,d7
	asl.l	d7,d0
	movea.l	d0,a2
	lea.l	(a2,a0.w),a3
	move.l	a3,d0
	add.l	d0,d0
	add.l	d0,d4
L01c630:
	movea.l	d4,a0
	move.b	(a1)+,d1
	cmp.b	#$ff,d1
	beq	L01c786
	move.w	#$0200,d5
	clr.w	d3
L01c642:
	add.b	(-$0001,a6),d1
	move.b	d1,d3
	move.w	d3,(a0)+
	move.b	(a1)+,d2
	cmp.b	#$ff,d2
	beq	L01c76c
	cmp.b	#$81,d2
	bls	L01c766
	add.b	#$7f,d2
	move.b	d2,d3
	sub.w	d3,d5
	bmi	L01c786
	tst.b	d1
	bne	L01c71c
	cmp.b	#$40,d2
	bls	L01c6e8
	moveq.l	#$00,d7
L01c676:
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	add.b	#$c0,d2
	cmp.b	#$40,d2
	bhi	L01c676
	bra	L01c6e8
L01c6c2:
	moveq.l	#$00,d7
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	add.b	#$e0,d2
L01c6e8:
	cmp.b	#$20,d2
	bhi	L01c6c2
	cmp.b	#$10,d2
	bls	L01c710
	moveq.l	#$00,d7
L01c6f6:
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	move.l	d7,(a0)+
	add.b	#$f0,d2
	cmp.b	#$10,d2
	bhi	L01c6f6
L01c710:
	tst.b	d2
	beq	L01c75a
L01c714:
	clr.w	(a0)+
	subq.b	#1,d2
	bne	L01c714
	bra	L01c75a
L01c71c:
	cmp.b	#$07,d2
	bls	L01c74c
	clr.w	d0
L01c724:
	move.b	d1,d0
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	move.b	d1,d3
	move.w	d0,(a0)+
	subq.b	#8,d2
	cmp.b	#$07,d2
	bhi	L01c724
L01c74c:
	tst.b	d2
	beq	L01c75a
	clr.w	d0
L01c752:
	move.b	d1,d0
	move.w	d0,(a0)+
	subq.b	#1,d2
	bne	L01c752
L01c75a:
	move.b	(a1)+,d1
	cmp.b	#$ff,d1
	beq	L01c76c
	bra	L01c642
L01c766:
	move.b	d2,d1
	bra	L01c642
L01c76c:
	subq.w	#1,d6
	tst.w	d6
	bgt	L01c77c
	cmpi.b	#$ff,(a1)
	beq	L01c786
	move.l	a1,d0
	bra	L01c788
L01c77c:
	add.l	#$00000400,d4
	bra	L01c630
L01c786:
	moveq.l	#$00,d0
L01c788:
	movem.l	(-$001a,a6),d3-d7/a3
	unlk	a6
	rts

SYSCALL_0218_Scr描画_ＧＲＰファイル:
	link	a6,#-$0100
	movem.l	d3-d6,-(sp)
	move.w	($000e,a6),d4
	move.w	($0012,a6),d5
	move.w	($0016,a6),d6
	move.l	a6,d3
	add.l	#$ffffff00,d3
	move.l	d3,-(sp)
	move.l	($0018,a6),-(sp)
	move.l	($0008,a6),-(sp)
	jsr	(L008c7e)
	lea.l	($000c,sp),sp
	move.l	d3,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d4
	move.l	d4,-(sp)
	jsr	(L01c7f8)
	ext.l	d0
	movem.l	(-$0110,a6),d3-d6
	unlk	a6
	rts

L01c7e2:
	.dc.b	$72,$62,$00,$00
L01c7e6:
	.dc.b	'(ALLOC_GRP_BUFF)',$00,$00
L01c7f8:
	link	a6,#-$0036
	movem.l	d3-d7,-(sp)
	move.w	($000a,a6),d7
	move.w	($000e,a6),d6
	move.w	($0012,a6),d5
	move.l	($0014,a6),d3
	moveq.l	#$00,d1
	move.l	d1,(-$001c,a6)
	pea.l	($0020)
	move.l	d3,-(sp)
	pea.l	(-$0036,a6)
	jsr	(doscall_files)
	lea.l	($000c,sp),sp
	pea.l	(L01c7e2)
	move.l	d3,-(sp)
	jsr	(XCLIB_fopen)
	addq.w	#8,sp
	move.l	d0,d3
	bgt	L01c842
	moveq.l	#$01,d0
	bra	L01c8ac
L01c842:
	move.l	(-$001c,a6),-(sp)
	jsr	(SYSCALL_025c_Data確保_メモリブロック)
	addq.w	#4,sp
	move.l	d0,d4
	bne	L01c866
	pea.l	(L01c7e6)
	pea.l	(L01c304)
	jsr	(SYSCALL_0264_システム異常終了)
	addq.w	#8,sp
L01c866:
	move.l	d3,-(sp)
	pea.l	($0001)
	move.l	(-$001c,a6),-(sp)
	move.l	d4,-(sp)
	jsr	(XCLIB_fread)
	lea.l	($0010,sp),sp
	move.l	d3,-(sp)
	jsr	(XCLIB_fclose)
	addq.w	#4,sp
	pea.l	($0000)
	move.l	d4,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d7
	move.l	d7,-(sp)
	jsr	(SYSCALL_0210_Scr描画_ＧＲＰデータ)
	lea.l	($0014,sp),sp
	move.l	d4,-(sp)
	jsr	(SYSCALL_0260_Data解放_メモリブロック)
	moveq.l	#$00,d0
L01c8ac:
	movem.l	(-$004a,a6),d3-d7
	unlk	a6
	rts

L01c8b6:
	move.w	($0006,sp),d0
	cmpi.w	#$0001,(グラフィック画面最大ページ数)
	bgt	L01c8d6
	moveq.l	#$00,d1
	move.l	d1,(L06f426)
	move.l	d1,(L06f422)
	bra	L01c9d0
L01c8d6:
	cmpi.w	#$0004,(グラフィック画面最大ページ数)
	bne	L01c922
	movea.l	(L06f426),a0
	moveq.l	#$00,d1
	move.l	d1,(L06f426)
	move.l	(a0)+,($00e82000)
	move.l	(a0)+,($00e82004)
	move.l	(a0)+,($00e82008)
	move.l	(a0)+,($00e8200c)
	move.l	(a0)+,($00e82010)
	move.l	(a0)+,($00e82014)
	move.l	(a0)+,($00e82018)
	move.l	(a0),($00e8201c)
	bra	L01c9d0
L01c922:
	tst.w	d0
	bne	L01c93c
	movea.l	(L06f426),a0
	movea.l	#$00e82000,a1
	moveq.l	#$00,d1
	move.l	d1,(L06f426)
	bra	L01c950
L01c93c:
	movea.l	(L06f422),a0
	movea.l	#$00e82100,a1
	moveq.l	#$00,d1
	move.l	d1,(L06f422)
L01c950:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0),(a1)
L01c9d0:
	rts

SYSCALL_028c_Scr描画_文字列:
	link	a6,#$0000
	movem.l	d3-d6,-(sp)
	move.w	($000a,a6),d0
	move.w	($000e,a6),d1
	move.b	($0017,a6),d2
	move.b	($001b,a6),d3
	move.b	($001f,a6),d4
	move.w	($0022,a6),d5
	move.b	($0027,a6),d6
	ext.w	d6
	ext.l	d6
	move.l	d6,-(sp)
	ext.l	d5
	move.l	d5,-(sp)
	ext.w	d4
	ext.l	d4
	move.l	d4,-(sp)
	ext.w	d3
	ext.l	d3
	move.l	d3,-(sp)
	ext.w	d2
	ext.l	d2
	move.l	d2,-(sp)
	move.l	($0010,a6),-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(XCLIB_iocs_symbol)
	lea.l	($0020,sp),sp
	movem.l	(-$0010,a6),d3-d6
	unlk	a6
	rts

SYSCALL_0290_Scr描画_ヘルプ文字列:
	move.w	($0006,sp),d0
	move.w	($000a,sp),d1
	move.l	($000c,sp),-(sp)
	ext.l	d1
	move.l	d1,-(sp)
	ext.l	d0
	move.l	d0,-(sp)
	jsr	(SR_ヘルプ文字列描画)
	lea.l	($000c,sp),sp
	rts

L01ca52:
	link	a6,#-$0002
	movem.l	a3-a5,-(sp)

	if (arg1) {
		a1 = 0x00eb9000;
		a0 = L0202a8;
		for (d0 = 0; d0 <= 511; d0++)
			*a0++ = *a1++;	// PCG番号32番から16個分をL0202a8にコピー

		SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
		SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);

		XCLIB_sp_off(0, 127);

		SR_ラスター割込み設定解除();

		SYSCALL_01e4_Scr設定_表示面(0);
		SYSCALL_02a8_Scr設定_ＢＧ表示(0);

		SYSCALL_01dc_Scr設定_画面モード(0x0404);

		SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
		SYSCALL_01e8_Scr設定_ＢＧマスク(1, 1);
		SYSCALL_02a8_Scr設定_ＢＧ表示(1);

		XCLIB_iocs_home(1, 0, 0);
		XCLIB_iocs_home(2, 0, 0);

		XCLIB_iocs_window(0, 0, 511, 511);

		// グラフィック画面の上から32ドット分を 0x6006で埋める
		a0 = 0x00c00000;
		for (d1 = 0; d1 <= 511; d1++)
			for (d0 = 0; d0 <= 31; d0++)
				*a0++ = 0x60066006;

		return;
	}

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);

	SYSCALL_01e4_Scr設定_表示面(0);
	SYSCALL_02a8_Scr設定_ＢＧ表示(0);

	SYSCALL_01dc_Scr設定_画面モード(0x201);

	SYSCALL_01e4_Scr設定_表示面(0);

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);
	SYSCALL_02a8_Scr設定_ＢＧ表示(1);

	if (SFSYSINFO_0070_xxxx) {
		a6_mi0002 = 1;
		if (MMP_SYS_0063_STAGE_再描画)
			MMP_SYS_0063_STAGE_再描画(&a6_mi0002);

		if (a6_mi0006) {
			if (MMP_SYS_0060_STAGE_背景描画)
				MMP_SYS_0060_STAGE_背景描画(&a6_mi0002);
		}
	}

	SYSCALL_0228_Scr設定_余白(0, 0, 0, 0);
	SYSCALL_01e8_Scr設定_ＢＧマスク(1, 0);

	SR_ラスター割込み設定開始();

	SR_VDISP回数指定待機(2);

	if (SFSYSINFO_0070_XXXX) {
		SR_ステージパレット反映();

		WORK_1P_0024_xxxx = 0;
		WORK_2P_0024_xxxx = 0;

		L017f8c(WORK_1P_0000, WORK_2P_0000);

		SR_VDISP回数指定待機(2);
		SYSCALL_0228_Scr設定_余白(0, 0, 2, 4);
		SYSCALL_01e8_Scr設定_ＢＧマスク(0, 0);

		L00449c();
	}

	a1 = L0202a8;
	a0 = 0x00eb9000;				// PCG定義領域32番目から16個分まで
	for (d0 = 0; d0 <= 511; d0++) {
		*a0++ = *a1++;
	}
}

L01cd3c:
	movea.l	sp,a1
	movem.l	d3-d7/a3-a6,-(sp)
	link	a6,#-$0434
	move.l	a6,-(sp)
	lea.l	($0004,sp),a6
	bsr	L01cd5c
	move.l	d0,d1
	movea.l	(sp)+,a6
	unlk	a6
	move.l	d1,d0
	movem.l	(sp)+,d3-d7/a3-a6
	rts

L01cd5c:
	move.l	sp,($042e,a6)
	move.w	($0006,a1),($042c,a6)
	movea.l	($0010,a1),a0
	move.l	($0014,a1),d0
	bsr	L01d220
	bsr	L01d216
	bsr	L01d208
	tst.w	d0
	bne	L01d314
	bsr	L01d208
	cmp.w	#$000f,d0
	bne	L01d314
	bsr	L01d208
	subq.w	#1,d0
	and.l	#$000001ff,d0
	move.l	d0,d1
	bsr	L01d208
	subq.w	#1,d0
	and.l	#$000001ff,d0
	move.l	d0,d3
	move.l	($0008,a1),d0
	move.l	($000c,a1),d2
	add.l	d0,d1
	add.l	d2,d3
	bsr	L01cfbc
	bsr	L01d2d0
	bsr	L01cdc2
	clr.l	d0
	rts

L01cdc2:
	movea.l	($040a,a6),a0
	bsr	L01d116
	move.w	($0414,a6),d5
	subq.w	#1,d5
L01cdd0:
	move.w	d5,-(sp)
	movea.l	a0,a1
	lea.l	($0400,a0),a0
	moveq.l	#$00,d4
	move.w	($0412,a6),d4
L01cdde:
	cmp.l	d4,d3
	bgt	L01cf58
	sub.w	d3,d4
	subq.w	#1,d3
	beq	L01cdf0
	move.w	d3,d5
	bsr	L01cf66
L01cdf0:
	subq.w	#8,d7
	bpl	L01cdfc
	moveq.l	#$08,d0
	bsr	L01d1ae
	bra	L01ce00
L01cdfc:
	rol.w	#8,d6
	move.w	d6,d0
L01ce00:
	move.b	d0,d2
	bmi	L01ce2c
	lsl.w	#8,d2
	subq.w	#8,d7
	bpl	L01ce14
	moveq.l	#$08,d0
	bsr	L01d1ae
	move.b	d0,d2
	bra	L01ce18
L01ce14:
	rol.w	#8,d6
	move.b	d6,d2
L01ce18:
	add.w	d2,d2
	move.w	($0400,a6),d1
	move.w	($02,a6,d1.w),d1
	move.w	d1,($0400,a6)
	move.w	d2,(a6,d1.w)
	bra	L01ce68
L01ce2c:
	and.w	#$007f,d0
	lsl.w	#3,d0
	cmp.w	($0400,a6),d0
	beq	L01ce64
	move.w	($02,a6,d0.w),d1
	move.w	($04,a6,d0.w),d2
	move.w	d1,($02,a6,d2.w)
	move.w	d2,($04,a6,d1.w)
	move.w	($0400,a6),d1
	move.w	($02,a6,d1.w),d2
	move.w	d0,($02,a6,d1.w)
	move.w	d2,($02,a6,d0.w)
	move.w	d0,($04,a6,d2.w)
	move.w	d1,($04,a6,d0.w)
	move.w	d0,($0400,a6)
L01ce64:
	move.w	(a6,d0.w),d2
L01ce68:
	movea.l	a1,a2
	move.w	d2,(a1)+
	move.w	d2,d1
	addq.w	#1,d1
	dbra	d7,L01ce88
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01ce80
	bsr	L01d1d6
L01ce80:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bra	L01ce8a
L01ce88:
	add.w	d6,d6
L01ce8a:
	bcc	L01cf4c
L01ce8e:
	dbra	d7,L01cf18
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01ce9e
	bsr	L01d1d6
L01ce9e:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	dbcc	d7,L01cf3e
	bcs	L01cf20
L01ceaa:
	dbra	d7,L01ceca
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01ceba
	bsr	L01d1d6
L01ceba:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bcc	L01cece
L01cec2:
	lea.l	($03fe,a2),a2
	move.w	d1,(a2)
	bra	L01ce8e
L01ceca:
	add.w	d6,d6
	bcs	L01cec2
L01cece:
	dbra	d7,L01cee6
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01cede
	bsr	L01d1d6
L01cede:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bra	L01cee8
L01cee6:
	add.w	d6,d6
L01cee8:
	bcc	L01cf4c
	dbra	d7,L01cf02
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01cefa
	bsr	L01d1d6
L01cefa:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bra	L01cf04
L01cf02:
	add.w	d6,d6
L01cf04:
	bcc	L01cf0e
	lea.l	($0404,a2),a2
	move.w	d1,(a2)
	bra	L01ce8e
L01cf0e:
	lea.l	($03fc,a2),a2
	move.w	d1,(a2)
	bra	L01ce8e
L01cf18:
	add.w	d6,d6
	dbcc	d7,L01cf3e
	bcc	L01ceaa
L01cf20:
	moveq.l	#$0f,d7
	subq.l	#2,($0426,a6)
	bgt	L01cf2c
	bsr	L01d1d6
L01cf2c:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bcc	L01cf42
L01cf34:
	lea.l	($0402,a2),a2
	move.w	d1,(a2)
	bra	L01ce8e
L01cf3e:
	add.w	d6,d6
	bcs	L01cf34
L01cf42:
	lea.l	($0400,a2),a2
	move.w	d1,(a2)
	bra	L01ce8e
L01cf4c:
	bsr	L01d116
	tst.l	d4
	bne	L01cdde
	bra	L01cf5e
L01cf58:
	move.w	d4,d5
	bsr	L01cf66
	sub.l	d4,d3
L01cf5e:
	move.w	(sp)+,d5
	dbra	d5,L01cdd0
	rts

L01cf66:
	lsr.w	#1,d5
	bcc	L01cf76
	move.w	(a1),d0
	beq	L01cf74
	move.w	d0,d2
	and.w	#$fffe,d2
L01cf74:
	move.w	d2,(a1)+
L01cf76:
	dbra	d5,L01cf7c
	rts

L01cf7c:
	move.w	d2,d0
	swap.w	d2
	move.w	d0,d2
	move.l	(a1),d0
	dbne	d5,L01cf8c
	beq	L01cfb8
	bra	L01cf96
L01cf8c:
	move.l	d2,(a1)+
	move.l	(a1),d0
	dbne	d5,L01cf8c
	beq	L01cfb8
L01cf96:
	swap.w	d0
	tst.w	d0
	beq	L01cfa2
	and.w	#$fffe,d0
	move.w	d0,d2
L01cfa2:
	move.w	d2,(a1)+
	swap.w	d0
	tst.w	d0
	beq	L01cf74
	move.w	d0,d2
	and.w	#$fffe,d2
	move.w	d2,(a1)+
	dbra	d5,L01cf7c
	rts

L01cfb8:
	move.l	d2,(a1)+
	rts

L01cfbc:
	movem.l	d0-d4,-(sp)
	move.w	d0,($0402,a6)
	move.w	d1,($0404,a6)
	move.w	d2,($0406,a6)
	move.w	d3,($0408,a6)
	cmp.w	d0,d1
	blt	L01d31e
	cmp.w	d2,d3
	blt	L01d31e
	cmp.w	#$0200,d0
	bge	L01d31e
	cmp.w	#$0200,d1
	bge	L01d31e
	cmp.w	#$0200,d2
	bge	L01d31e
	cmp.w	#$0200,d3
	bge	L01d31e
	move.w	d1,d4
	sub.w	d0,d4
	addq.w	#1,d4
	move.w	d4,($0412,a6)
	move.w	d3,d4
	sub.w	d2,d4
	addq.w	#1,d4
	move.w	d4,($0414,a6)
	moveq.l	#$00,d4
	move.w	d2,d4
	lsl.l	#5,d4
	lsl.l	#5,d4
	add.l	d0,d0
	move.w	d0,($0416,a6)
	add.l	d0,d4
	add.l	#$00c00000,d4
	move.l	d4,($040a,a6)
	moveq.l	#$00,d4
	move.w	d3,d4
	lsl.l	#5,d4
	lsl.l	#5,d4
	add.l	d1,d1
	move.w	d1,($0418,a6)
	add.l	d1,d4
	add.l	#$00c00000,d4
	move.l	d4,($040e,a6)
	movem.l	(sp)+,d0-d4
	rts

L01d04a:
	movem.l	d0-d7/a0-a5,-(sp)
	cmpi.w	#$0200,($0412,a6)
	bne	L01d08e
	cmpi.w	#$0200,($0414,a6)
	bne	L01d08e
	move.w	($00e8002a),d0
	ori.w	#$000f,($00e8002a)		;crtc_r21 全グラフィックページ対象
	ori.w	#$0002,($00e80480)		;crtc動作ポート グラフィック画面高速クリア開始
L01d074:
	move.w	($00e80480),d0
	and.w	#$0002,d0
	beq	L01d074
L01d080:
	move.w	($00e80480),d0
	and.w	#$0002,d0
	bne	L01d080						;高速クリアが終了したら抜ける
	bra	L01d0d6
L01d08e:
	move.w	($0412,a6),d0
	move.w	d0,d1
	and.w	#$000f,d1
	lsr.w	#4,d0
	move.w	($0414,a6),d2
	subq.w	#1,d2
	movea.l	($040e,a6),a5
	addq.l	#2,a5
	moveq.l	#$00,d4
	move.l	d4,d5
	move.l	d4,d6
	move.l	d4,d7
	movea.l	d4,a0
	movea.l	d4,a1
	movea.l	d4,a2
	movea.l	d4,a3
L01d0b6:
	movea.l	a5,a4
	lea.l	(-$0400,a5),a5
	move.w	d1,d3
	bra	L01d0c2
L01d0c0:
	move.w	d4,-(a4)
L01d0c2:
	dbra	d3,L01d0c0
	move.w	d0,d3
	bra	L01d0ce
L01d0ca:
	movem.l	d4-d7/a0-a3,-(a4)
L01d0ce:
	dbra	d3,L01d0ca
	dbra	d2,L01d0b6
L01d0d6:
	movem.l	(sp)+,d0-d7/a0-a5
	rts

L01d0dc:
	move.w	#$0001,d4
	move.w	#$fffe,d5
	movea.l	($040a,a6),a0
	move.w	(a0),d0
	not.w	d0
	move.w	($0414,a6),d1
	subq.w	#1,d1
L01d0f2:
	movea.l	a0,a1
	lea.l	($0400,a0),a0
	move.w	($0412,a6),d2
	subq.w	#1,d2
L01d0fe:
	and.w	d5,(a1)
	move.w	(a1)+,d3
	cmp.w	d3,d0
	beq	L01d10a
	or.w	d4,(-$0002,a1)
L01d10a:
	move.w	d3,d0
	dbra	d2,L01d0fe
	dbra	d1,L01d0f2
	rts

L01d116:
	move.w	d7,d5
	dbra	d7,L01d136
L01d11c:
	moveq.l	#$0f,d7
	add.w	#$0010,d5
	subq.l	#2,($0426,a6)
	bgt	L01d12c
	bsr	L01d1d6
L01d12c:
	move.w	d6,d0
	move.w	(a5)+,d6
	add.w	d0,d0
	bcc	L01d13e
	subq.l	#1,d7
L01d136:
	add.w	d6,d6
	dbcc	d7,L01d136
	bcs	L01d11c
L01d13e:
	sub.w	d7,d5
	moveq.l	#$01,d3
	lsl.l	d5,d3
	cmp.w	#$000f,d5
	bgt	L01d166
	sub.w	d5,d7
	bpl	L01d158
	move.w	d5,d0
	bsr	L01d1ae
	add.w	d0,d3
	subq.l	#1,d3
	rts

L01d158:
	swap.w	d6
	clr.w	d6
	rol.l	d5,d6
	add.w	d6,d3
	swap.w	d6
	subq.w	#1,d3
	rts

L01d166:
	move.w	d5,d0
	sub.w	#$000f,d0
	sub.w	d0,d7
	bpl	L01d174
	bsr	L01d1ae
	bra	L01d17e
L01d174:
	swap.w	d6
	clr.w	d6
	rol.l	d0,d6
	move.w	d6,d0
	swap.w	d6
L01d17e:
	moveq.l	#$00,d1
	move.w	d0,d1
	moveq.l	#$0f,d0
	sub.w	d0,d7
	bpl	L01d18e
	bsr	L01d1ae
	lsl.l	#1,d0
	bra	L01d192
L01d18e:
	move.w	d6,d0
	ror.w	#1,d6
L01d192:
	swap.w	d1
	move.w	d0,d1
	lsr.l	#1,d1
	add.l	d1,d3
	subq.l	#1,d3
	rts

L01d19e:
	sub.w	d0,d7
	blt	L01d1ae
	swap.w	d6
	clr.w	d6
	rol.l	d0,d6
	move.w	d6,d0
	swap.w	d6
	rts

L01d1ae:
	add.w	d0,d7
	addq.w	#1,d7
	and.l	#$0000ffff,d6
	lsl.l	d7,d6
	sub.w	d7,d0
	move.w	d0,d7
	subq.l	#2,($0426,a6)
	bgt	L01d1c6
	bsr	L01d1d6
L01d1c6:
	move.w	(a5)+,d6
	lsl.l	d7,d6
	neg.w	d7
	add.w	#$000f,d7
	move.l	d6,d0
	swap.w	d0
	rts

L01d1d6:
	tst.w	($0432,a6)
	bne	L01d30c
	movea.l	($041a,a6),a5
	move.l	($041e,a6),-(sp)
	move.l	($041a,a6),-(sp)
	move.w	($042c,a6),-(sp)
	DOS	__READ
	lea.l	($0006,sp),sp
	move.l	d0,($0426,a6)
	bmi	L01d31c
	cmp.l	(sp)+,d0
	beq	L01d206
	move.w	#$0001,($0432,a6)
L01d206:
	rts

L01d208:
	subq.l	#2,($0426,a6)
	bne	L01d210
	bsr	L01d1d6
L01d210:
	move.w	d6,d0
	move.w	(a5)+,d6
	rts

L01d216:
	clr.w	($0432,a6)
	bsr	L01d1d6
	move.w	(a5)+,d6
	rts

L01d220:
	and.l	#$fffffffe,d0
	cmp.l	#$00000080,d0
	blt	L01d318
	move.l	d0,($041e,a6)
	move.l	d0,($0426,a6)
	move.l	a0,($041a,a6)
	move.l	a0,($0422,a6)
	move.w	#$000f,($042a,a6)
	moveq.l	#$0f,d7
	rts

L01d24a:
	movem.w	d0-d2,-(sp)
	lsl.w	#3,d0
	cmp.w	($0400,a6),d0
	beq	L01d282
	move.w	($02,a6,d0.w),d1
	move.w	($04,a6,d0.w),d2
	move.w	d1,($02,a6,d2.w)
	move.w	d2,($04,a6,d1.w)
	move.w	($0400,a6),d1
	move.w	($02,a6,d1.w),d2
	move.w	d0,($02,a6,d1.w)
	move.w	d2,($02,a6,d0.w)
	move.w	d0,($04,a6,d2.w)
	move.w	d1,($04,a6,d0.w)
	move.w	d0,($0400,a6)
L01d282:
	movem.w	(sp)+,d0-d2
	rts

L01d288:
	movem.l	d0/a0,-(sp)
	lea.l	(-$0008,a6),a0
	move.w	#$007f,d1
L01d294:
	lea.l	($0008,a0),a0
	cmp.w	(a0),d0
	dbeq	d1,L01d294
	bne	L01d2ae
	not.w	d1
	and.w	#$007f,d1
	move.w	d1,d0
	bsr	L01d24a
	move.w	d0,d1
	bra	L01d2b4
L01d2ae:
	bsr	L01d2ba
	move.w	#$ffff,d1
L01d2b4:
	movem.l	(sp)+,d0/a0
	rts

L01d2ba:
	move.w	d1,-(sp)
	move.w	($0400,a6),d1
	move.w	($02,a6,d1.w),d1
	move.w	d1,($0400,a6)
	move.w	d0,(a6,d1.w)
	move.w	(sp)+,d1
	rts

L01d2d0:
	movem.l	d0-d2/a0,-(sp)
	movea.l	a6,a0
	move.w	#$0008,d1
	move.w	#$03f8,d2
	moveq.l	#$7f,d0
L01d2e0:
	clr.w	(a0)+
	move.w	d1,(a0)+
	addq.w	#8,d1
	cmp.w	#$0400,d1
	bne	L01d2ee
	clr.w	d1
L01d2ee:
	move.w	d2,(a0)
	addq.w	#8,d2
	cmp.w	#$0400,d2
	bne	L01d2fa
	clr.w	d2
L01d2fa:
	lea.l	($0004,a0),a0
	dbra	d0,L01d2e0
	clr.w	($0400,a6)
	movem.l	(sp)+,d0-d2/a0
	rts

L01d30c:
	moveq.l	#$dc,d0
	bra	L01d320
L01d310:
	moveq.l	#$dd,d0
	bra	L01d320
L01d314:
	moveq.l	#$e1,d0
	bra	L01d320
L01d318:
	moveq.l	#$f8,d0
	bra	L01d320
L01d31c:
	bra	L01d320
L01d31e:
	moveq.l	#$e0,d0
L01d320:
	movea.l	($042e,a6),sp
	rts

L01d326:
	.dc.b	'C library for X68000 XCｺﾝﾊﾟｲﾗ v1.00',$00
L01d34a:
	.dc.b	'Copyright 1987 SHARP/hudson',$00
L01d366:
	lea.l	(L0758ee),sp
	move.l	a2,(コマンドライン引数文字列)
	move.l	a3,(環境変数領域)
	bsr	L01d5ee
	lea.l	($0100,a0),a5
	move.l	a5,(L075482)
	move.l	($0034,a0),d0
	move.l	d0,(L075486)
	move.l	d0,(L07548a)
	move.l	($0030,a0),d0
	move.l	d0,(L07548e)
	move.l	d0,(L075492)
	move.l	a1,(L075496)
	lea.l	($0010,a0),a5
	move.l	a1,d1
	addq.l	#1,d1
	and.l	#$00fffffe,d1
	add.l	#$00000400,d1
	move.l	d1,(L07549a)
	move.l	(L01d768),d0
	cmp.l	#$00001000,d0
	bcc	L01d3da
	move.l	#$00001000,d0
L01d3da:
	addq.l	#1,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L07549e)
	move.l	d1,(L0754ba)
	movea.l	(環境変数領域),a0
	move.l	(a0),d0
	addq.l	#5,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L0754b6)
	movea.l	(環境変数領域),a0
	addq.l	#4,a0
	clr.l	d0
L01d412:
	addq.l	#1,d0
	tst.b	(a0)+
	beq	L01d420
L01d418:
	addq.l	#1,d0
	tst.b	(a0)+
	bne	L01d418
	bra	L01d412
L01d420:
	addq.l	#1,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L0754a2)
	move.l	(L01d76c),d0
	cmp.l	#$00002000,d0
	bcc	L01d444
	move.l	#$00002000,d0
L01d444:
	add.l	#$0000000d,d0
	and.l	#$00fffffe,d0
	add.l	d0,d1
	move.l	d1,(L0754a6)
	move.l	d1,(L0754aa)
	move.l	a5,(L07547e)
	sub.l	a5,d1
	move.l	d1,-(sp)
	move.l	a5,-(sp)
	DOS	__SETBLOCK
	addq.l	#8,sp
	tst.l	d0
	bmi	L01d5d8
	movea.l	(L07549e),sp
	movea.l	(L0754a2),a0
	move.l	a0,(L0754ae)
	lea.l	($0010,a0),a1
	clr.l	(a0)+
	move.l	a1,(a0)+
	clr.l	(a0)+
	move.l	#$48454150,(a0)
	movea.l	(環境変数領域),a0
	movea.l	(L0754b6),a1
	addq.l	#4,a0
L01d4a4:
	move.b	(a0)+,(a1)+
	beq	L01d4ae
L01d4a8:
	move.b	(a0)+,(a1)+
	bne	L01d4a8
	bra	L01d4a4
L01d4ae:
	movea.l	(L0754b6),a0
	movea.l	(L0754ba),a1
L01d4ba:
	tst.b	(a0)
	beq	L01d4c6
	move.l	a0,(a1)+
L01d4c0:
	tst.b	(a0)+
	bne	L01d4c0
	bra	L01d4ba
L01d4c6:
	clr.l	(a1)
	clr.w	(L07547c)
	clr.l	(L07564a)
	lea.l	(L0754ca),a0
	lea.l	(L01d746),a1
	clr.l	d1
L01d4e2:
	move.l	d1,-(sp)
	DOS	__IOCTRL
	addq.l	#4,sp
	move.b	d1,(a0)+
	move.b	d0,(a0)+
	move.w	(a1)+,(a0)+
	addq.w	#1,d1
	cmp.w	#$0005,d1
	bne	L01d4e2
	move.l	#$0000036f,d0
	movea.l	#L07510c,a0
L01d502:
	clr.b	(a0)+
	dbra	d0,L01d502
	lea.l	(L07510c),a0
	lea.l	(L01d746),a1
	clr.l	d1
L01d516:
	move.l	d1,-(sp)
	DOS	__IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq	L01d52a
	move.l	#$00010008,d0
	bra	L01d560
L01d52a:
	move.l	#$00020000,d0
	movem.l	d0-d1/a1,-(sp)
	move.l	a0,-(sp)
	move.l	#$00000400,-(sp)
	jsr	(L01e4fa)
	addq.l	#4,sp
	tst.l	d0
	beq	L01d5d8
	movea.l	(sp)+,a0
	move.l	d0,($0000.w,a0)
	move.l	d0,($0008,a0)
	move.l	#$00000400,($0010,a0)
	movem.l	(sp)+,d0-d1/a1
L01d560:
	or.w	(a1)+,d0
	clr.l	($0004,a0)
	move.l	d0,($000c,a0)
	move.b	d1,($0014,a0)
	lea.l	($0016,a0),a0
	addq.w	#1,d1
	cmp.w	#$0005,d1
	bne	L01d516
	jsr	(L01e448)
	pea.l	(L01d5b2)
	move.w	#$fff1,-(sp)
	DOS	__INTVCS
	addq.l	#6,sp
	move.l	(L0754ba),-(sp)
	move.l	(L0754c6),-(sp)
	move.l	(L0754c2),-(sp)
	jsr	(L000000)
	lea.l	($000c,sp),sp
	move.l	d0,-(sp)
	jsr	(L01e64e)
L01d5b2:
	DOS	__GETPDB
	move.l	#$00000200,d1
	cmp.l	(L07547e),d0
	beq	L01d5d0
	move.w	d1,-(sp)
	DOS	__EXIT2

L01d5c6:
	pea.l	(L01d78f)
	DOS	__PRINT
	moveq.l	#$7f,d1
L01d5d0:
	move.l	d1,-(sp)
	jsr	(L01e64e)
L01d5d8:
	pea.l	(L01d770)
	DOS	__PRINT
	addq.l	#4,sp
	move.l	#$0000007f,-(sp)
	jsr	(L01e65a)
L01d5ee:
	movem.l	a0-a2,-(sp)
	lea.l	(L07564e),a2
	lea.l	(L07584e),a1
	move.l	a2,(a1)+
	movem.l	a0,-(sp)
	lea.l	($0080,a0),a0
L01d608:
	move.b	(a0)+,(a2)+
	bne	L01d608
	movea.l	(sp)+,a0
	tst.b	-(a2)
	lea.l	($00c4,a0),a0
L01d614:
	move.b	(a0)+,(a2)+
	bne	L01d614
	clr.l	d0
	movea.l	(コマンドライン引数文字列),a0
	move.b	(a0)+,d1
	beq	L01d6d4
L01d626:
	move.b	(a0)+,d1
	beq	L01d682
	cmpi.b	#$09,d1
	beq	L01d626
	cmpi.b	#$20,d1
	beq	L01d626
	addq.l	#1,d0
	move.l	a2,(a1)+
	cmp.b	#$27,d1
	beq	L01d654
	cmp.b	#$22,d1
	bne	L01d662
L01d646:
	move.b	(a0)+,d1
	beq	L01d682
	cmp.b	#$22,d1
	beq	L01d682
	move.b	d1,(a2)+
	bra	L01d646
L01d654:
	move.b	(a0)+,d1
	beq	L01d682
	cmp.b	#$27,d1
	beq	L01d682
	move.b	d1,(a2)+
	bra	L01d654
L01d662:
	move.b	d1,(a2)+
	move.b	(a0),d1
	beq	L01d682
	cmp.b	#$22,d1
	beq	L01d682
	cmp.b	#$27,d1
	beq	L01d682
	addq.l	#1,a0
	cmpi.b	#$09,d1
	beq	L01d682
	cmpi.b	#$20,d1
	bne	L01d662
L01d682:
	clr.b	(a2)+
	movem.l	d1/a0/a2,-(sp)
	movea.l	(-$0004,a1),a2
	move.b	(a2)+,d1
	cmp.b	#$2d,d1
	beq	L01d69a
	cmp.b	#$2f,d1
	bne	L01d6ca
L01d69a:
	lea.l	(L01d7b0),a0
	bsr	L01d6f0
	beq	L01d6c0
	lea.l	(L01d7b7),a0
	bsr	L01d6f0
	bne	L01d6ca
	bsr	L01d710
	move.l	d1,(L01d76c)
L01d6b6:
	movem.l	(sp)+,d1/a0/a2
	movea.l	-(a1),a2
	subq.l	#1,d0
	bra	L01d6ce
L01d6c0:
	bsr	L01d710
	move.l	d1,(L01d768)
	bra	L01d6b6
L01d6ca:
	movem.l	(sp)+,d1/a0/a2
L01d6ce:
	tst.b	d1
	bne	L01d626
L01d6d4:
	move.b	d1,(a2)+
	lea.l	(L07584e),a0
	addq.l	#1,d0
	move.l	d0,(L0754c2)
	move.l	a0,(L0754c6)
	movem.l	(sp)+,a0-a2
	rts

L01d6f0:
	movem.l	a2,-(sp)
L01d6f4:
	move.b	(a0)+,d1
	beq	L01d70c
	move.b	(a2)+,d2
	beq	L01d704
	or.b	#$20,d2
	cmp.b	d2,d1
	beq	L01d6f4
L01d704:
	tst.b	d1
	movem.l	(sp)+,a2
	rts

L01d70c:
	addq.l	#4,sp
	rts

L01d710:
	clr.l	d1
	clr.l	d2
L01d714:
	move.b	(a2)+,d2
	sub.b	#$30,d2
	cmp.b	#$0a,d2
	bcc	L01d72e
	add.l	d1,d1
	move.l	d1,d3
	add.l	d1,d1
	add.l	d1,d1
	add.l	d3,d1
	add.l	d2,d1
	bra	L01d714
L01d72e:
	add.b	#$30,d2
	or.b	#$20,d2
	cmp.b	#$6b,d2
	bne	L01d740
	asl.l	#8,d1
	asl.l	#2,d1
L01d740:
	bclr.l	#$00,d1
	rts

L01d746:
	.dc.b	$08,$01,$08,$02,$09,$00,$09,$00
	.dc.b	$08,$02
L01d750:
	.dc.l	L01d758
	.dc.l	L01d75c
L01d758:
	.dc.b	'JST',$00
L01d75c:
	.dc.b	$00,$00,$00,$00
L01d760:
	.dc.l	$00000000
L01d764:
	.dc.l	$ffff8170
L01d768:
	.dc.l	$00010000
L01d76c:
	.dc.l	$00010000
L01d770:
	.dc.b	'主記憶が不足しています！！！',$0d,$0a,$00
L01d78f:
	.dc.b	'スタックが不足しています！！！',$0d,$0a,$00
L01d7b0:
	.dc.b	'stack:',$00
L01d7b7:
	.dc.b	'heap:',$00,$00

XCLIB_iocs_b_super:
	movea.l	(sp)+,a2
	movea.l	(sp),a1
	movea.l	sp,a0
	IOCS	__B_SUPER
	movea.l	a0,sp
	jmp	(a2)

XCLIB_iocs_home:
	movem.l	d3,-(sp)
	movem.l	($0008,sp),d1-d3
	IOCS	__HOME
	movem.l	(sp)+,d3
	rts

L01d7e0:
	movem.l	d3,-(sp)
	movem.l	($0008,sp),d1-d3
	cmp.l	#$000003ff,d2
	bls	L01d7f4
	moveq.l	#$ff,d2
L01d7f4:
	cmp.l	#$000003ff,d3
	bls	L01d7fe
	moveq.l	#$ff,d3
L01d7fe:
	bset.l	#$1f,d1
	IOCS	__BGSCRLST
	movem.l	(sp)+,d3
	rts

XCLIB_sprintf:
	pea.l	($000c,sp)
	move.l	($000c,sp),-(sp)
	pea.l	($000c,sp)
	pea.l	(L01d830)
	jsr	(L01e65e)				;L01e65e(L01d830, arg1, arg2, arg3);
	lea.l	($0010,sp),sp
	movea.l	($0004,sp),a0
	clr.b	(a0)
	rts

L01d830:
	movem.l	($0004,sp),d0/a0
	movea.l	(a0),a1
	move.b	d0,(a1)+
	move.l	a1,(a0)
	rts

XCLIB_strcpy:
	movem.l	($0004,sp),a0-a1
	move.l	a0,d0
L01d846:
	move.b	(a1)+,(a0)+
	bne	L01d846
	rts

XCLIB_sp_off:
	movem.l	d3-d5,-(sp)
	movem.l	($0010,sp),d2-d3
	cmp.l	#$4e415349,d2			;'NASI'
	beq	L01d86a
	cmp.l	#$4e415349,d3
	bne	L01d876						;ARI,ARIのとき分岐
	move.l	d2,d3					;ARI,NASIのとき
	bra	L01d876
L01d86a:
	clr.l	d2
	cmp.l	#$4e415349,d3
	bne	L01d876
	moveq.l	#$7f,d3					;NASI,NASIのとき
L01d876:
	cmpi.l	#$0000007f,d2
	bhi	L01d8ae
	cmpi.l	#$0000007f,d3
	bhi	L01d8ae
L01d886:
	move.l	d2,d1
	movem.l	d2-d3,-(sp)
	moveq.l	#$ff,d2
	moveq.l	#$ff,d3
	moveq.l	#$ff,d4
	clr.l	d5
	bset.l	#$1f,d1
	IOCS	__SP_REGST
	movem.l	(sp)+,d2-d3
	addq.l	#1,d2
	cmp.l	d2,d3
	bge	L01d886
	clr.l	d0
L01d8a8:
	movem.l	(sp)+,d3-d5
	rts
L01d8ae:
	moveq.l	#$ff,d0
	bra	L01d8a8

XCLIB_iocs_joyget:
	move.l	($0004,sp),d1
	subq.w	#1,d1
	bmi	L01d8d0
	cmpi.w	#$0001,d1
	bhi	L01d8d0
	IOCS	__JOYGET
	rol.b	#3,d0
	not.l	d0
	andi.l	#$00000003,d0
L01d8ce:
	rts
L01d8d0:
	moveq.l	#$ff,d0
	bra	L01d8ce

L01d8d4:
	movem.l	($0004,sp),a1-a2
	bsr	L01d9c2
	bmi	L01d9be
	move.l	a1,d0
	jsr	(L01eee2)
	tst.w	d0
	beq	L01d9be
	eor.l	d2,d0
	and.l	#$00000103,d0
	bne	L01d9be
	move.l	a1,d0
	bra	L01d928
XCLIB_fopen:
	movem.l	($0004,sp),a1-a2
	bsr	L01d9c2
	bmi	L01d9be
	move.l	#$00000001,-(sp)
	move.l	d2,-(sp)
	move.l	a1,-(sp)
	jsr	(L01ed34)
	lea.l	($000c,sp),sp
	tst.l	d0
	bmi	L01d9be
L01d928:
	move.l	d0,-(sp)
	jsr	(L01e616)
	bmi	L01d9b6
	move.l	(sp),d0
	movea.l	a0,a2
	move.b	d0,($0014,a2)
	jsr	(L01eee2)
	clr.l	d1
	move.w	d0,d1
	swap.w	d0
	btst.l	#$07,d0
	beq	L01d974
	or.l	#$00010008,d1
	btst.l	#$0b,d1
	bne	L01d9a8
	move.l	(sp),d0
	clr.w	-(sp)
	move.l	d0,-(sp)
	DOS	__IOCTRL
	or.w	#$0020,d0
	move.w	d0,($0004,sp)
	move.w	#$0001,(sp)
	DOS	__IOCTRL
	addq.l	#6,sp
	bra	L01d9a8
L01d974:
	or.l	#$00020000,d1
	movem.l	d1/a2,-(sp)
	move.l	#$00000400,-(sp)
	jsr	(L01e4fa)
	addq.l	#4,sp
	movem.l	(sp)+,d1/a2
	tst.l	d0
	beq	L01d9b6
	move.l	d0,($0000.w,a2)
	clr.l	($0004,a2)
	move.l	d0,($0008,a2)
	move.l	#$00000400,($0010,a2)
L01d9a8:
	move.l	d1,($000c,a2)
	clr.b	($0015,a2)
	move.l	a2,d0
	addq.l	#4,sp
	rts

L01d9b6:
	jsr	(L01eef0)
	addq.l	#4,sp
L01d9be:
	clr.l	d0
	rts

L01d9c2:
	clr.l	d2
	bsr	L01da24
	cmp.b	#$72,d0
	beq	L01d9ee
	cmp.b	#$77,d0
	beq	L01da04
	cmp.b	#$61,d0
	bne	L01da1c
	bsr	L01da24
	cmp.b	#$2b,d1
	bne	L01d9e8
	bsr	L01da24
	or.w	#$4104,d2
	bra	L01da18
L01d9e8:
	or.w	#$4006,d2
	bra	L01da18
L01d9ee:
	bsr	L01da24
	cmp.b	#$2b,d1
	bne	L01d9fe
	bsr	L01da24
	or.w	#$0100,d2
	bra	L01da18
L01d9fe:
	or.w	#$0001,d2
	bra	L01da18
L01da04:
	bsr	L01da24
	cmp.b	#$2b,d1
	bne	L01da14
	bsr	L01da24
	or.w	#$5100,d2
	bra	L01da18
L01da14:
	or.w	#$5002,d2
L01da18:
	tst.b	d1
	beq	L01da20
L01da1c:
	moveq.l	#$ff,d0
	rts

L01da20:
	clr.l	d0
	rts

L01da24:
	move.b	(a2)+,d1
	move.b	d1,d0
	or.b	#$20,d0
	cmp.b	#$62,d0
	beq	L01da44
	cmp.b	#$74,d0
	bne	L01da50
	btst.l	#$0a,d2
	bne	L01da50
	or.w	#$0800,d2
	bra	L01da24
L01da44:
	btst.l	#$0b,d2
	bne	L01da50
	or.w	#$0400,d2
	bra	L01da24
L01da50:
	rts

XCLIB_fgets:
	movem.l	d6/a6,-(sp)
	movem.l	($000c,sp),d0-d2
	movea.l	d0,a6
	move.l	d1,d6
	move.l	d2,-(sp)
L01da62:
	subq.l	#1,d6
	beq	L01da78
	jsr	(L01ef44)
	tst.l	d0
	bmi	L01da82
	move.b	d0,(a6)+
	cmpi.b	#$0a,d0
	bne	L01da62
L01da78:
	clr.b	(a6)
	tst.l	(sp)+
	move.l	($000c,sp),d0
	bra	L01da90
L01da82:
	clr.b	(a6)
	tst.l	(sp)+
	move.l	($000c,sp),d0
	cmp.l	a6,d0
	bne	L01da90
	clr.l	d0
L01da90:
	movem.l	(sp)+,d6/a6
	rts

XCLIB_strlen:
	movea.l	($0004,sp),a0
	move.l	a0,d0
L01da9c:
	tst.b	(a0)+
	bne	L01da9c
	subq.l	#1,a0
	exg.l	d0,a0
	sub.l	a0,d0
	rts

L01daa8:
	nop
	nop
L01daac:
	clr.l	d0
	clr.l	d1
	movea.l	($0004,sp),a0
	clr.w	-(sp)
L01dab6:
	move.b	(a0)+,d1
	beq	L01daf4
	cmpi.b	#$20,d1
	beq	L01dab6
	cmpi.b	#$09,d1
	beq	L01dab6
	cmpi.b	#$2b,d1
	beq	L01dad6
	cmpi.b	#$2d,d1
	bne	L01dad8
	move.b	#$ff,(sp)
L01dad6:
	move.b	(a0)+,d1
L01dad8:
	cmpi.b	#$30,d1
	bcs	L01daf4
	cmpi.b	#$3a,d1
	bcc	L01daf4
	andi.w	#$000f,d1
	add.l	d0,d0
	move.l	d0,d2
	lsl.l	#2,d0
	add.l	d2,d0
	add.l	d1,d0
	bra	L01dad6
L01daf4:
	tst.w	(sp)+
	beq	L01dafa
	neg.l	d0
L01dafa:
	rts

L01dafc:
	movem.l	($0004,sp),a0-a1
	clr.l	d0
	clr.l	d1
L01db06:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq	L01db12
	sub.l	d1,d0
	beq	L01db06
	rts

L01db12:
	sub.l	d1,d0
	rts

XCLIB_fclose:
	movea.l	($0004,sp),a2
	move.l	($000c,a2),d0
	beq	L01dbf4
	movem.l	d0/a2,-(sp)
	btst.l	#$03,d0
	bne	L01db4c
	move.l	a2,-(sp)
	jsr	(L01efe6)
	addq.l	#4,sp
	movem.l	(sp),d0/a2
	btst.l	#$04,d0
	bne	L01db4c
	move.l	($0008,a2),-(sp)
	jsr	(L01efb4)
	addq.l	#4,sp
L01db4c:
	movem.l	(sp),d0/a2
	clr.l	d0
	move.b	($0014,a2),d0
	move.l	d0,-(sp)
	jsr	(L01eef0)
	movem.l	(sp)+,d0-d1/a2
	clr.l	($000c,a2)
	move.l	a2,d0
	sub.l	#L07510c,d0
	divu.w	#$0016,d0
	and.l	#$000000ff,d0
	cmp.l	#$00000005,d0
	bcc	L01dbf0
	lea.l	(L01dbf8),a1
	move.l	d0,d1
	asl.l	#1,d0
	adda.l	d0,a1
	movea.l	a2,a0
	move.l	d1,-(sp)
	DOS	__IOCTRL
	addq.l	#4,sp
	btst.l	#$07,d0
	beq	L01dba2
	move.l	#$00010008,d0
	bra	L01dbe6
L01dba2:
	move.l	#$00020000,d0
	movem.l	d0-d1/a1,-(sp)
	move.l	a0,-(sp)
	move.l	#$00000400,-(sp)
	jsr	(L01e4fa)
	addq.l	#4,sp
	movea.l	(sp)+,a0
	tst.l	d0
	beq	L01dbdc
	move.l	d0,($0000.w,a0)
	clr.l	($0004,a0)
	move.l	d0,($0008,a0)
	move.l	#$00000400,($0010,a0)
	movem.l	(sp)+,d0-d1/a1
	bra	L01dbe6
L01dbdc:
	movem.l	(sp)+,d0-d1/a1
	or.l	#$00000008,d0
L01dbe6:
	or.w	(a1),d0
	move.l	d0,($000c,a0)
	move.b	d1,($0014,a0)
L01dbf0:
	clr.l	d0
	rts

L01dbf4:
	moveq.l	#$ff,d0
	rts

L01dbf8:
	.dc.b	$08,$01,$08,$02,$09,$00,$09,$00
	.dc.b	$08,$02

XCLIB_iocs_b_print:
	movea.l	($0004,sp),a1
	IOCS	__B_PRINT
	rts

XCLIB_dos_exit2:
	move.w	($0006,sp),-(sp)
	DOS	__EXIT2

L01dc12:
	movem.l	a5,-(sp)
	movea.l	($0008,sp),a5
	move.l	($000c,sp),d0
	move.l	d0,-(sp)
	clr.l	d0
	clr.l	-(sp)
L01dc24:
	move.b	(a5)+,($0003,sp)
	beq	L01dc34
	jsr	(L01f042)
	tst.l	d0
	bpl	L01dc24
L01dc34:
	addq.l	#8,sp
	movem.l	(sp)+,a5
	rts

L01dc3c:
	clr.l	d0
	movea.l	($0004,sp),a0
	movea.l	($0008,sp),a1
	move.l	($000c,sp),d2
	ble	L01dc62
	clr.l	d1
L01dc4e:
	move.b	(a0)+,d0
	move.b	(a1)+,d1
	beq	L01dc60
	sub.l	d1,d0
	bne	L01dc62
	subq.l	#1,d2
	bne	L01dc4e
	clr.l	d0
	bra	L01dc62
L01dc60:
	sub.l	d1,d0
L01dc62:
	rts

L01dc64:
	move.l	($0004,sp),d0
	cmp.l	#$4e415349,d0
	beq	L01dcd6
	move.l	($0008,sp),d1
	cmp.l	#$4e415349,d1
	beq	L01dcd6
	move.l	d0,(L01f098)
	move.l	($000c,sp),d2
	cmp.l	#$4e415349,d2
	beq	L01dcf8
L01dc8e:
	cmpi.l	#$0000001f,d0
	bhi	L01dd08
	movem.l	d2,-(sp)
	move.l	d0,d2
	add.l	d1,d2
	cmpi.l	#$00000020,d2
	movem.l	(sp)+,d2
	bhi	L01dd08
	cmpi.l	#$00000001,d2
	bhi	L01dd08
	beq	L01dcb6
	moveq.l	#$04,d2
L01dcb6:
	subq.l	#1,d2
	movem.w	d0-d1,-(sp)
	move.w	d2,(L01f0a4)
	move.w	d2,-(sp)
	move.w	#$000e,-(sp)
	DOS	__CONCTRL
	addq.l	#4,sp
	move.w	#$000f,-(sp)
	DOS	__CONCTRL
	addq.l	#6,sp
	bra	L01dd0a
L01dcd6:
	moveq.l	#$ff,d1
	moveq.l	#$ff,d2
	IOCS	__B_CONSOL
	clr.l	d0
	move.w	d1,d0
	lsr.w	#2,d0
	clr.l	d1
	move.w	d2,d1
	addq.l	#1,d1
	move.l	($000c,sp),d2
	cmp.l	#$4e415349,d2
	beq	L01dd0a
	bra	L01dc8e
L01dcf8:
	clr.l	d2
	cmpi.w	#$0003,(L01f0a4)
	beq	L01dc8e
	moveq.l	#$01,d2
	bra	L01dc8e
L01dd08:
	moveq.l	#$ff,d0
L01dd0a:
	rts

L01dd0c:
	move.l	($0004,sp),d0
	cmp.l	#$4e415349,d0
	beq	L01dda0
	cmp.b	#$03,d0
	bcc	L01dd9c
	lsl.w	#3,d0
	move.w	d0,d2
	move.l	($0008,sp),d0
	cmp.b	#$04,d0
	bcc	L01dd9c
	lsl.w	#1,d0
	or.w	d0,d2
	move.l	($000c,sp),d0
	cmp.b	#$02,d0
	bcc	L01dd9c
	or.w	d0,d2
	move.l	($0010,sp),d0
	cmp.b	#$02,d0
	bcc	L01dd9c
	clr.w	d1
L01dd4a:
	move.w	d0,-(sp)
	move.w	d2,d0
	lsl.w	#1,d0
	move.b	(L01ddc0,pc,d0.w),d1
	bmi	L01dd9a
	move.b	(L01ddc1,pc,d0.w),d0
	and.w	#$00ff,d0
	move.w	d0,(L01f09c)
	move.w	d2,(L01ddf0)
	IOCS	__CRTMOD
	tst.w	(sp)+
	beq	L01dd76
	IOCS	__G_CLR_ON
L01dd76:
	tst.w	(L01f0a4)
	bne	L01dd90
	move.w	#$0003,-(sp)
	move.w	#$000e,-(sp)
	DOS	__CONCTRL
	clr.w	($0002,sp)
	DOS	__CONCTRL
	addq.l	#4,sp
L01dd90:
	clr.l	(L01f098)
	clr.l	d0
	rts

L01dd9a:
	addq.l	#2,sp
L01dd9c:
	moveq.l	#$ff,d0
	rts

L01dda0:
	move.l	($000c,sp),d0
	cmp.b	#$02,d0
	bcc	L01dd9c
	move.w	(L01ddf0),d2
	bmi	L01dd9c
	bclr.l	#$00,d2
	or.w	d0,d2
	clr.w	d0
	move.w	#$0100,d1
	bra	L01dd4a
L01ddc0:
	.dc.b	$03
L01ddc1:
	.dc.b	$20,$02,$20,$07,$20,$06,$20,$0b
	.dc.b	$20,$0a,$20,$0f,$20,$0e,$20,$01
	.dc.b	$40,$00,$40,$05,$40,$04,$40,$09
	.dc.b	$40,$08,$40,$0d,$40,$0c,$40,$ff
	.dc.b	$60,$10,$60,$ff,$60,$ff,$60,$ff
	.dc.b	$60,$ff,$60,$ff,$60,$ff,$60
L01ddf0:
	.dc.w	$0000

XCLIB_iocs_os_curon:
	IOCS	__OS_CURON
	rts

XCLIB_iocs_b_curon:
	IOCS	__B_CURON
	rts

L01ddfe:
	move.l	($0004,sp),d0
	beq	L01de1e
	cmpi.l	#$00000004,d0
	beq	L01de36
	bhi	L01de40
	cmpi.w	#$0002,d0
	bmi	L01de2a
	beq	L01de30
	IOCS	__MS_STAT
	ext.l	d0
	bra	L01de3e
L01de1e:
	IOCS	__MS_INIT
	moveq.l	#$ff,d1
	IOCS	__SKEY_MOD
	bra	L01de3c
L01de2a:
	IOCS	__MS_CURON
	bra	L01de3c
L01de30:
	IOCS	__MS_CUROF
	bra	L01de3c
L01de36:
	clr.l	d1
	IOCS	__SKEY_MOD
L01de3c:
	clr.l	d0
L01de3e:
	rts
L01de40:
	moveq.l	#$ff,d0
	bra	L01de3e

XCLIB_dos_getdate:
	DOS	__GETDATE
	rts

XCLIB_dos_gettime:
	DOS	__GETTIME
	rts

XCLIB_iocs_window:
	movem.l	d3-d4,-(sp)
	movem.l	($000c,sp),d1-d4
	IOCS	__WINDOW
	movem.l	(sp)+,d3-d4
	rts

XCLIB_dos_kflush:
	move.w	($0006,sp),-(sp)
	move.w	#$0006,-(sp)
	DOS	__KFLUSH
	addq.l	#4,sp
	rts

XCLIB_dos_inpout:
	move.w	($0006,sp),-(sp)
	DOS	__INPOUT
	addq.l	#2,sp
	rts

XCLIB_iocs_contrast:
	move.l	($0004,sp),d1
	IOCS	__CONTRAST
	rts

XCLIB_iocs_symbol:
	movem.l	d3-d7,-(sp)
	movem.l	($0018,sp),d0-d7
	cmpi.b	#$02,d5
	bhi	L01deb8
	cmpi.b	#$03,d7
	bhi	L01deb8
	lsl.w	#8,d3
	move.b	d4,d3
	lsl.w	#8,d5
	move.b	d7,d5
	exg.l	d5,d7
	movem.w	d3/d6-d7,-(sp)
	movem.l	d2,-(sp)
	movem.w	d0-d1,-(sp)
	movea.l	sp,a1
	IOCS	__SYMBOL
	lea.l	($000e,sp),sp
L01deb8:
	movem.l	(sp)+,d3-d7
	rts

XCLIB_strcat:
	movem.l	($0004,sp),a0-a1
	move.l	a0,d0
L01dec6:
	tst.b	(a0)+
	bne	L01dec6
	subq.l	#1,a0
L01decc:
	move.b	(a1)+,(a0)+
	bne	L01decc
	rts

乱数発生:
	.dc.b	$fe,$0e,$4e,$75
XCLIB_strtoupper:
	movea.l	($0004,sp),a0
	movea.l	a0,a1
	move.b	#$61,d1
	move.b	#$7a,d2
L01dee4:
	move.b	(a0)+,d0
	beq	L01def8
	cmp.b	d1,d0
	bcs	L01dee4
	cmp.b	d0,d2
	bcs	L01dee4
	subi.b	#$20,(-$0001,a0)
	bra	L01dee4
L01def8:
	move.l	a1,d0
	rts

XCLIB_32bit符号付整数除算:
	move.l	($0004,sp),d1
	move.l	d1,d0
	swap.w	d0
	or.w	($0008,sp),d0
	bne	L01df14
	divu.w	($000a,sp),d1
	moveq.l	#$00,d0
	move.w	d1,d0
	rts

L01df14:
	move.l	d1,d0
	bpl	L01df2c
	neg.l	d0
	move.l	($0008,sp),d1
	beq	L01df3c
	bpl	L01df26
	neg.l	d1
L01df24:
	bra	L01df8e
L01df26:
	bsr	L01df8e
	neg.l	d0
	rts

L01df2c:
	move.l	($0008,sp),d1
	beq	L01df3c
	bpl	L01df24
	neg.l	d1
	bsr	L01df8e
	neg.l	d0
	rts

L01df3c:
	moveq.l	#$00,d0
	rts

L01df40:
	moveq.l	#$01,d0
	rts

L01df44:
	moveq.l	#$00,d1
	divu.w	d1,d0
	rts

L01df4a:
	move.l	d0,d2
	clr.w	d2
	swap.w	d2
	divu.w	d1,d2
	movea.l	d2,a0
	move.w	d0,d2
	divu.w	d1,d2
	move.w	a0,d0
	swap.w	d0
	move.w	d2,d0
	rts

L01df60:
	swap.w	d0
	swap.w	d1
	divu.w	d1,d0
	and.l	#$0000ffff,d0
	rts

L01df6e:
	move.l	($0004,sp),d1
	move.l	d1,d0
	swap.w	d0
	or.w	($0008,sp),d0
	bne	L01df86
	divu.w	($000a,sp),d1
	moveq.l	#$00,d0
	move.w	d1,d0
	rts

L01df86:
	move.l	d1,d0
	move.l	($0008,sp),d1
	beq	L01df3c
L01df8e:
	cmp.l	d0,d1
	beq	L01df40
	bhi	L01df3c
	cmp.l	#$00010000,d1
	bcs	L01df4a
	move.w	d0,d2
	or.w	d1,d2
	beq	L01df60
	lea.l	(L01dff0,pc),a0
	movea.l	d0,a1
	movea.l	d1,a2
	cmp.l	#$01000000,d1
	bcc	L01dfc0
	move.l	d1,d2
	swap.w	d2
	move.b	(a0,d2.w),d2
	lsr.l	d2,d1
	lsr.l	d2,d0
	bra	L01dfd0
L01dfc0:
	move.l	d1,d2
	swap.w	d2
	lsr.w	#8,d2
	move.b	(a0,d2.w),d2
	addq.w	#8,d2
	lsr.l	d2,d1
	lsr.l	d2,d0
L01dfd0:
	divu.w	d1,d0
	and.l	#$0000ffff,d0
	move.l	d0,d2
	move.l	a2,d1
	mulu.w	d1,d2
	swap.w	d1
	mulu.w	d0,d1
	swap.w	d1
	clr.w	d1
	add.l	d1,d2
	cmp.l	a1,d2
	bls	L01dfee
	subq.l	#1,d0
L01dfee:
	rts

L01dff0:
	.dc.b	$00,$01,$02,$02,$03,$03,$03,$03
	.dc.b	$04,$04,$04,$04,$04,$04,$04,$04
	.dc.b	$05,$05,$05,$05,$05,$05,$05,$05
	.dc.b	$05,$05,$05,$05,$05,$05,$05,$05
	.dc.b	$06,$06,$06,$06,$06,$06,$06,$06
	.dc.b	$06,$06,$06,$06,$06,$06,$06,$06
	.dc.b	$06,$06,$06,$06,$06,$06,$06,$06
	.dc.b	$06,$06,$06,$06,$06,$06,$06,$06
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$07,$07,$07,$07,$07,$07,$07,$07
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
	.dc.b	$08,$08,$08,$08,$08,$08,$08,$08
SR_32bit乗算:
	movem.l	($0004,sp),d1
	move.l	d1,d0
	swap.w	d1
	or.w	($0008,sp),d1
	bne	L01e106
	mulu.w	($000a,sp),d0
	rts

L01e106:
	move.l	($0008,sp),d1
	movea.l	d3,a0
	move.l	d0,d2
	mulu.w	d1,d0
	move.l	d2,d3
	swap.w	d3
	mulu.w	d1,d3
	swap.w	d0
	add.w	d3,d0
	swap.w	d1
	mulu.w	d2,d1
	add.w	d1,d0
	swap.w	d0
	move.l	a0,d3
	rts

iocscall_os_curof:
	IOCS	__OS_CUROF
	rts

iocscall_b_curoff:
	IOCS	__B_CUROFF
	rts

iocscall_sp_init:
	IOCS	__SP_INIT
	rts

doscall_mfree:
	move.l	($0004,sp),-(sp)
	DOS	__MFREE
	addq.l	#4,sp
	rts

XCLIB_dos_keeppr:
	move.w	($000a,sp),-(sp)
	move.l	($0006,sp),-(sp)
	DOS	__KEEPPR

XCLIB_fread:
	movem.l	d6-d7/a5-a6,-(sp)
	movem.l	($0014,sp),d0-d2/a6
	movea.l	d0,a5
	bsr	L01e244
	move.l	d0,d6
	beq	L01e240
	clr.l	d7
	move.l	($000c,a6),d2
	btst.l	#$14,d2
	beq	L01e184
	move.b	($0015,a6),d0
	bclr.l	#$14,d2
	move.l	d2,($000c,a6)
L01e17a:
	move.b	d0,(a5)+
	addq.l	#1,d7
	subq.l	#1,d6
	beq	L01e21e
L01e184:
	btst.l	#$12,d2
	beq	L01e1be
	movea.l	($0000.w,a6),a2
	move.l	($0004,a6),d1
	beq	L01e1be
L01e194:
	move.b	(a2)+,(a5)+
	addq.l	#1,d7
	subq.l	#1,d6
	beq	L01e1b2
	subq.l	#1,d1
	bne	L01e194
	move.l	d1,($0004,a6)
	move.l	a2,($0000.w,a6)
	bclr.l	#$12,d2
	move.l	d2,($000c,a6)
	bra	L01e1d2
L01e1b2:
	subq.l	#1,d1
	move.l	d1,($0004,a6)
	move.l	a2,($0000.w,a6)
	bra	L01e21e
L01e1be:
	btst.l	#$13,d2
	beq	L01e1d2
	move.l	a6,-(sp)
	jsr	(L01efe6)
	addq.l	#4,sp
	move.l	($000c,a6),d2
L01e1d2:
	btst.l	#$03,d2
	bne	L01e1fa
	move.l	($0010,a6),d0
	cmp.l	d0,d6
	bcc	L01e1fa
	move.l	a6,-(sp)
	jsr	(L01f4a2)
	addq.l	#4,sp
	move.l	($000c,a6),d2
	tst.l	d0
	bpl	L01e17a
	btst.l	#$05,d2
	bne	L01e22c
	bra	L01e228
L01e1fa:
	clr.l	d0
	move.b	($0014,a6),d0
	move.l	d6,-(sp)
	move.l	a5,-(sp)
	move.l	d0,-(sp)
	jsr	(L01f3f2)
	lea.l	($000c,sp),sp
	tst.l	d0
	bmi	L01e228
	beq	L01e22c
	add.l	d0,d7
	adda.l	d0,a5
	sub.l	d0,d6
	bne	L01e1fa
L01e21e:
	move.l	($001c,sp),d0
L01e222:
	movem.l	(sp)+,d6-d7/a5-a6
	rts

L01e228:
	moveq.l	#$ff,d0
	bra	L01e222
L01e22c:
	move.l	($000c,a6),d1
	bset.l	#$05,d1
	move.l	d1,($000c,a6)
	move.l	($0018,sp),d1
	bsr	L01e276
	bra	L01e222
L01e240:
	clr.l	d0
	bra	L01e222
L01e244:
	.dc.b	$20,$02,$b2,$bc,$00,$00,$00,$01
	.dc.b	$67,$1a,$b2,$bc,$00,$00,$00,$02
	.dc.b	$67,$14,$b2,$bc,$00,$00,$00,$04
	.dc.b	$67,$10,$b2,$bc,$00,$00,$00,$08
	.dc.b	$67,$0c,$fe,$00,$4e,$75
L01e26a:
	asl.l	#1,d0
	rts

L01e26e:
	asl.l	#2,d0
	rts

L01e272:
	asl.l	#3,d0
	rts

L01e276:
	.dc.b	' ',$07,'ｲｼ',$00,$00,$00
L01e27d:
	.dc.b	$01,$67,$1a,$b2,$bc,$00,$00,$00
	.dc.b	$02,$67,$14,$b2,$bc,$00,$00,$00
	.dc.b	$04,$67,$10,$b2,$bc,$00,$00,$00
	.dc.b	$08,$67,$0c,$fe,$01,$4e,$75
L01e29c:
	lsr.l	#1,d0
	rts

L01e2a0:
	lsr.l	#2,d0
	rts

L01e2a4:
	lsr.l	#3,d0
	rts

doscall_files:
	move.w	($000e,sp),-(sp)
	move.l	($000a,sp),-(sp)
	move.l	($000a,sp),-(sp)
	DOS	__FILES
	lea.l	($000a,sp),sp
	rts

iocscall_joyget:
	move.l	($0004,sp),d1
	IOCS	__JOYGET
	rts

doscall_exec:
	movem.l	d3-d7/a3-a6,-(sp)
	move.l	($0030,sp),-(sp)
	move.l	($0030,sp),-(sp)
	move.l	($0030,sp),-(sp)
	clr.w	-(sp)
	DOS	__EXEC
	lea.l	($000e,sp),sp
	movem.l	(sp)+,d3-d7/a3-a6
	rts

L01e2e4:
	pea.l	($0008,sp)
	move.l	($0008,sp),-(sp)
	pea.l	(L075122)
	jsr	(L01f536)
	lea.l	($000c,sp),sp
	rts

L01e2fe:
	movem.l	($0004,sp),d0-d2
	cmpi.l	#$0000001f,d0
	bhi	L01e328
	cmpi.l	#$0000001f,d1
	bhi	L01e328
	cmpi.l	#$0000001f,d2
	bhi	L01e328
	ror.w	#5,d1
	lsl.w	#6,d0
	add.w	d2,d2
	add.w	d2,d0
	add.w	d1,d0
	rts

L01e328:
	moveq.l	#$ff,d0
	rts

iocscall_crtmod:
	move.l	($0004,sp),d1
	IOCS	__CRTMOD
	rts

iocscall_g_clr_on:
	IOCS	__G_CLR_ON
	rts

iocscall_vpage:
	move.l	($0004,sp),d1
	IOCS	__VPAGE
	rts

doscall_open:
	move.w	($000a,sp),-(sp)
	move.l	($0006,sp),-(sp)
	DOS	__OPEN
	addq.l	#6,sp
	rts

doscall_fgetc:
	move.w	($0006,sp),-(sp)
	DOS	__FGETC
	addq.l	#2,sp
	rts

doscall_close:
	move.w	($0006,sp),-(sp)
	DOS	__CLOSE
	addq.l	#2,sp
	rts

XCLIB_iocs_sp_on:
	move.l	($0004,sp),d1
	beq	L01e37a
	cmpi.b	#$01,d1
	bne	L01e37e
	IOCS	__SP_ON
	bra	L01e37e
L01e37a:
	IOCS	__SP_OFF
L01e37e:
	rts

XCLIB_iocs_sp_regst:
	movem.l	d3-d5,-(sp)
	movem.l	($0010,sp),d1-d5
	cmp.l	#$000003ff,d2
	bls	L01e394
	moveq.l	#$ff,d2
L01e394:
	cmp.l	#$000003ff,d3
	bls	L01e39e
	moveq.l	#$ff,d3
L01e39e:
	cmp.l	#$0000ffff,d4
	bls	L01e3a8
	moveq.l	#$ff,d4
L01e3a8:
	cmp.l	#$00000003,d5
	bcs	L01e3b2
	moveq.l	#$ff,d5
L01e3b2:
	bset.l	#$1f,d1
	IOCS	__SP_REGST
	movem.l	(sp)+,d3-d5
	rts

L01e3c0:
	movem.l	d3-d5,-(sp)
	movem.l	($0010,sp),d2-d3
	cmp.l	#$4e415349,d2
	beq	L01e3de
	cmp.l	#$4e415349,d3
	bne	L01e3ea
	move.l	d2,d3
	bra	L01e3ea
L01e3de:
	clr.l	d2
	cmp.l	#$4e415349,d3
	bne	L01e3ea
	moveq.l	#$7f,d3
L01e3ea:
	cmpi.l	#$0000007f,d2
	bhi	L01e41a
	cmpi.l	#$0000007f,d3
	bhi	L01e41a
L01e3fa:
	move.l	d2,d1
	movem.l	d2-d3,-(sp)
	moveq.l	#$ff,d2
	moveq.l	#$ff,d3
	moveq.l	#$ff,d4
	moveq.l	#$03,d5
	bset.l	#$1f,d1
	IOCS	__SP_REGST
	movem.l	(sp)+,d2-d3
	addq.l	#1,d2
	cmp.l	d2,d3
	bge	L01e3fa
L01e41a:
	movem.l	(sp)+,d3-d5
	rts

XCLIB_iocs_bgctrlst:
	movem.l	d3,-(sp)
	movem.l	($0008,sp),d1-d3
	cmp.l	#$00000002,d2
	bcs	L01e434
	moveq.l	#$ff,d2
L01e434:
	cmp.l	#$00000002,d3
	bcs	L01e43e
	moveq.l	#$ff,d3
L01e43e:
	IOCS	__BGCTRLST
	movem.l	(sp)+,d3
	rts

L01e448:
	pea.l	(L01e4ec)
	jsr	(L01f566)
	addq.l	#4,sp
	tst.l	d0
	bne	L01e460
	move.l	#L01e4ef,d0
L01e460:
	movea.l	d0,a0
	movea.l	#L01d750,a2
	movea.l	(a2)+,a1
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	clr.b	(a1)+
	bsr	L01e4a2
	move.l	d0,(L01d764)
	movea.l	(a2),a1
	clr.l	(L01d760)
	tst.b	(a0)
	beq	L01e49e
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	bsr	L01e4a2
	tst.l	d0
	bne	L01e498
	move.l	#$00000e10,d0
L01e498:
	move.l	d0,(L01d760)
L01e49e:
	clr.b	(a1)
	rts

L01e4a2:
	clr.l	d2
	clr.l	d0
	move.b	(a0)+,d1
	cmpi.b	#$2d,d1
	bne	L01e4b2
	moveq.l	#$01,d2
	move.b	(a0)+,d1
L01e4b2:
	cmpi.b	#$30,d1
	bcs	L01e4de
	cmpi.b	#$3a,d1
	bcc	L01e4de
	andi.w	#$000f,d1
	move.w	d1,d0
	move.b	(a0)+,d1
	cmpi.b	#$30,d1
	bcs	L01e4de
	cmpi.b	#$3a,d1
	bcc	L01e4de
	andi.w	#$000f,d1
	mulu.w	#$000a,d0
	add.w	d1,d0
	tst.b	(a0)+
L01e4de:
	mulu.w	#$0e10,d0
	tst.w	d2
	beq	L01e4e8
	neg.l	d0
L01e4e8:
	subq.l	#1,a0
	rts

L01e4ec:
	.dc.b	$54,$5a,$00
L01e4ef:
	.dc.b	'JST-9',$00,$00
L01e4f6:
	.dc.b	'NqNq'
L01e4fa:
	move.l	($0004,sp),d2
	bne	L01e502
	addq.l	#1,d2
L01e502:
	ble	L01e5e0
	moveq.l	#$0c,d0
	add.l	d0,d2
	movea.l	d0,a1
	movea.l	(L0754ae),a2
L01e512:
	cmpi.b	#$fe,($0004,a2)
	beq	L01e542
	move.l	($0008,a2),d1
	beq	L01e582
	move.l	d1,d0
	sub.l	($0004,a2),d0
	bclr.l	#$00,d0
	cmp.l	d2,d0
	bcc	L01e598
	movea.l	d1,a2
L01e530:
	cmp.l	a1,d0
	bcs	L01e512
	moveq.l	#$ff,d0
	movea.l	d0,a1
	move.l	($0000.w,a2),(L0754ae)
	bra	L01e512
L01e542:
	move.l	($0008,a2),d1
	beq	L01e572
L01e548:
	movea.l	d1,a0
	cmpi.b	#$fe,($0004,a0)
	bne	L01e55e
	move.l	($0008,a0),d1
	bne	L01e548
	clr.l	($0008,a2)
	bra	L01e572
L01e55e:
	move.l	a0,($0008,a2)
	move.l	a2,($0000.w,a0)
	move.l	a0,d0
	sub.l	a2,d0
	cmp.l	d2,d0
	bcc	L01e5b0
	movea.l	a0,a2
	bra	L01e530
L01e572:
	suba.l	a0,a0
	move.l	(L0754aa),d0
	sub.l	a2,d0
	cmp.l	d2,d0
	bcc	L01e5b0
	bra	L01e5e0
L01e582:
	move.l	(L0754aa),d0
	sub.l	($0004,a2),d0
	bmi	L01e5e0
	bclr.l	#$00,d0
	cmp.l	d2,d0
	bcs	L01e5e0
	clr.l	d1
L01e598:
	move.l	($0004,a2),d0
	addq.l	#1,d0
	bclr.l	#$00,d0
	movea.l	d0,a0
	move.l	a0,($0008,a2)
	move.l	a2,($0000.w,a0)
	movea.l	a0,a2
	movea.l	d1,a0
L01e5b0:
	move.l	d2,d0
	add.l	a2,d0
	move.l	d0,($0004,a2)
	move.l	a0,($0008,a2)
	move.l	a0,d1
	beq	L01e5c4
	move.l	a2,($0000.w,a0)
L01e5c4:
	cmpa.l	#$ffffffff,a1
	beq	L01e5d2
	move.l	a2,(L0754ae)
L01e5d2:
	lea.l	($000c,a2),a2
	move.l	a2,d0
	clr.w	(L02025c)
	rts

L01e5e0:
	tst.w	(L02025c)
	bne	L01e60c
	move.l	d2,d0
	add.l	#$00001000,d0
	and.l	#$fffff000,d0
	move.l	d0,-(sp)
	jsr	(L01f59c)
	addq.l	#4,sp
	move.w	#$0001,(L02025c)
	bra	L01e4fa
L01e60c:
	clr.w	(L02025c)
	clr.l	d0
	rts

L01e616:
	move.l	d1,-(sp)
	movea.l	#L07510c,a0
	moveq.l	#$27,d1
L01e620:
	tst.l	($000c,a0)
	beq	L01e644
	adda.l	#$00000016,a0
	dbra	d1,L01e620
	move.l	#$00000018,(L075104)
	clr.l	(L075108)
	moveq.l	#$ff,d0
	bra	L01e648
L01e644:
	moveq.l	#$27,d0
	sub.w	d1,d0
L01e648:
	movem.l	(sp)+,d1
	rts

L01e64e:
	jsr	(L01f5e0)
	jmp	(L01e65a)

L01e65a:
	addq.l	#6,sp
	DOS	__EXIT2

L01e65e:
	movem.l	d3-d7/a3-a6,-(sp)
	lea.l	(-$026c,sp),sp
	movea.l	($0294,sp),a6
	movea.l	($02a0,sp),a5
	movea.l	($029c,sp),a4
	move.l	($0298,sp),d6
	clr.l	d7
L01e678:
	clr.l	d4
	clr.l	d5
	movea.l	sp,a3
	bsr	L01e692
	btst.l	#$19,d4
	beq	L01e678
	lea.l	($026c,sp),sp
	move.l	d7,d0
	movem.l	(sp)+,d3-d7/a3-a6
	rts

L01e692:
	move.b	(a4)+,d0
	bne	L01e69c
	bset.l	#$19,d4
	bra	L01e6ac
L01e69c:
	movea.l	a4,a2
	cmpi.b	#$25,d0
	bne	L01e6a8
	bsr	L01e6ae
	bra	L01e6ac
L01e6a8:
	bsr	L01ecb0
L01e6ac:
	rts

L01e6ae:
	move.b	(a4)+,d0
	bne	L01e6b8
	bset.l	#$19,d4
	rts

L01e6b8:
	cmpi.b	#$2d,d0
	bne	L01e6c4
	bset.l	#$1f,d4
	bra	L01e6ae
L01e6c4:
	cmpi.b	#$2b,d0
	bne	L01e6d0
	bset.l	#$1e,d4
	bra	L01e6ae
L01e6d0:
	cmpi.b	#$20,d0
	bne	L01e6dc
	bset.l	#$16,d4
	bra	L01e6ae
L01e6dc:
	cmpi.b	#$23,d0
	bne	L01e6e8
	bset.l	#$17,d4
	bra	L01e6ae
L01e6e8:
	moveq.l	#$ff,d3
	cmpi.b	#$30,d0
	bne	L01e6f6
	bset.l	#$1a,d4
	bra	L01e708
L01e6f6:
	cmpi.b	#$2a,d0
	bne	L01e708
	move.l	(a5)+,d1
	move.w	d1,d3
	move.b	(a4)+,d0
	beq	L01ecaa
	bra	L01e720
L01e708:
	cmp.b	#$30,d0
	bcs	L01e720
	cmp.b	#$39,d0
	bhi	L01e720
	bsr	L01ecca
	bmi	L01ecaa
	move.w	d0,d3
	swap.w	d0
L01e720:
	cmpi.b	#$2e,d0
	bne	L01e762
	bset.l	#$1d,d4
	move.b	(a4)+,d0
	beq	L01ecaa
	cmpi.b	#$2a,d0
	bne	L01e746
	move.l	(a5)+,d1
	swap.w	d3
	move.w	d1,d3
	swap.w	d3
	move.b	(a4)+,d0
	beq	L01ecaa
	bra	L01e762
L01e746:
	cmp.b	#$30,d0
	bcs	L01e762
	cmp.b	#$39,d0
	bhi	L01e762
	bsr	L01ecca
	bmi	L01ecaa
	swap.w	d3
	move.w	d0,d3
	swap.w	d3
	swap.w	d0
L01e762:
	cmpi.b	#$6c,d0
	beq	L01e76e
	cmpi.b	#$4c,d0
	bne	L01e778
L01e76e:
	bset.l	#$1c,d4
	move.b	(a4)+,d0
	beq	L01ecaa
L01e778:
	cmpi.b	#$41,d0
	bcs	L01ecaa
	cmpi.b	#$5a,d0
	bhi	L01e790
	bset.l	#$1b,d4
	add.b	#$20,d0
	bra	L01e7a0
L01e790:
	cmpi.b	#$61,d0
	bcs	L01ecaa
	cmpi.b	#$7a,d0
	bhi	L01ecaa
L01e7a0:
	cmpi.b	#$62,d0
	bcs	L01ecaa
	cmpi.b	#$63,d0
	bcs	L01eb2e
	cmpi.b	#$64,d0
	bcs	L01ea5c
	cmpi.b	#$65,d0
	bcs	L01eac0
	cmpi.b	#$68,d0
	bcs	L01e7ea
	cmpi.b	#$6f,d0
	beq	L01eb36
	cmpi.b	#$73,d0
	beq	L01ea80
	cmpi.b	#$75,d0
	beq	L01eac0
	cmpi.b	#$78,d0
	beq	L01eb3e
	bra	L01ecaa
L01e7ea:
	clr.l	d2
	move.b	d0,d2
	move.l	(a5)+,d0
	move.l	(a5)+,d1
	cmpi.b	#$67,d2
	beq	L01e88e
	cmpi.b	#$66,d2
	beq	L01e84c
	cmp.w	#$ffff,d3
	bne	L01e80a
	move.w	#$0001,d3
L01e80a:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01e816
	move.w	#$0006,d3
L01e816:
	move.w	d3,d2
	swap.w	d3
	bsr	L01e92e
	bsr	L01e974
L01e822:
	lea.l	($0001,a3),a0
	cmpi.b	#$2d,(a0)
	beq	L01ea4c
	btst.l	#$1e,d4
	bne	L01e844
	btst.l	#$16,d4
	beq	L01ea4c
	move.b	#$20,-(a0)
	bra	L01ea4c
L01e844:
	move.b	#$2b,-(a0)
	bra	L01ea4c
L01e84c:
	cmp.w	#$ffff,d3
	bne	L01e856
	move.w	#$0001,d3
L01e856:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01e862
	move.w	#$0006,d3
L01e862:
	move.w	d3,d2
	swap.w	d3
	subq.l	#8,sp
	movea.l	sp,a0
	lea.l	($0004,sp),a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	move.l	d2,-(sp)
	movem.l	d0-d1,-(sp)
	jsr	(L01f776)
	lea.l	($0014,sp),sp
	movem.l	(sp)+,d1-d2
	movea.l	d0,a0
	bsr	L01e9ba
	bra	L01e822
L01e88e:
	cmp.w	#$ffff,d3
	bne	L01e898
	move.w	#$0001,d3
L01e898:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01e8a4
	move.w	#$000e,d3
L01e8a4:
	move.w	d3,d2
	swap.w	d3
	movem.l	d0-d2,-(sp)
	subq.l	#8,sp
	movea.l	sp,a0
	lea.l	($0004,sp),a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	move.l	d2,-(sp)
	movem.l	d0-d1,-(sp)
	jsr	(L01f776)
	lea.l	($0014,sp),sp
	movem.l	(sp)+,d1-d2
	movea.l	d0,a0
	subq.l	#1,d1
	cmp.w	#$fffc,d1
	blt	L01e8de
	move.l	d3,d0
	swap.w	d0
	cmp.w	d0,d1
	ble	L01e8ee
L01e8de:
	movem.l	(sp)+,d0-d2
	bsr	L01e92e
	bsr	L01e8fe
	bsr	L01e974
	bra	L01e822
L01e8ee:
	addq.l	#1,d1
	lea.l	($000c,sp),sp
	bsr	L01e9ba
	bsr	L01e8fe
	bra	L01e822
L01e8fe:
	btst.l	#$17,d4
	bne	L01e92c
	clr.b	(a1)
	lea.l	($0001,a3),a0
L01e90a:
	move.b	(a0)+,d0
	beq	L01e92c
	cmp.b	#$2e,d0
	bne	L01e90a
L01e914:
	move.b	-(a1),d0
	cmp.b	#$30,d0
	beq	L01e914
	cmp.b	#$2e,d0
	bne	L01e928
	btst.l	#$17,d4
	beq	L01e92a
L01e928:
	addq.l	#1,a1
L01e92a:
	clr.b	(a1)
L01e92c:
	rts

L01e92e:
	addq.w	#1,d2
	subq.l	#8,sp
	movea.l	sp,a0
	lea.l	($0004,sp),a1
	move.l	a1,-(sp)
	move.l	a0,-(sp)
	move.l	d2,-(sp)
	movem.l	d0-d1,-(sp)
	jsr	(L01f620)
	movem.l	(sp)+,d1-d2
	lea.l	($000c,sp),sp
	or.l	d2,d1
	movem.l	(sp)+,d1-d2
	bne	L01e95a
	moveq.l	#$01,d1
L01e95a:
	movea.l	d0,a0
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L01e968
	move.b	#$2d,(a1)+
L01e968:
	bsr	L01ea40
	move.b	d0,(a1)+
	bsr	L01ea16
	rts

L01e974:
	move.b	#$65,d0
	btst.l	#$1b,d4
	beq	L01e982
	move.b	#$45,d0
L01e982:
	move.b	d0,(a1)+
	move.b	#$2b,d0
	subq.l	#1,d1
	tst.l	d1
	bpl	L01e994
	move.b	#$2d,d0
	neg.l	d1
L01e994:
	move.b	d0,(a1)+
	divu.w	#$0064,d1
	add.b	#$30,d1
	move.b	d1,(a1)+
	clr.w	d1
	swap.w	d1
	divu.w	#$000a,d1
	add.b	#$30,d1
	move.b	d1,(a1)+
	swap.w	d1
	add.b	#$30,d1
	move.b	d1,(a1)+
	clr.b	(a1)
	rts

L01e9ba:
	lea.l	($0001,a3),a1
	tst.l	d2
	beq	L01e9c6
	move.b	#$2d,(a1)+
L01e9c6:
	tst.l	d1
	bmi	L01e9dc
	beq	L01e9dc
	subq.l	#1,d1
L01e9ce:
	bsr	L01ea40
	move.b	d0,(a1)+
	dbra	d1,L01e9ce
	bsr	L01ea16
	clr.b	(a1)
	rts

L01e9dc:
	neg.l	d1
	move.l	d3,d0
	swap.w	d0
	move.b	#$30,(a1)+
	btst.l	#$17,d4
	bne	L01e9f0
	tst.w	d0
	beq	L01ea12
L01e9f0:
	move.b	#$2e,(a1)+
	tst.w	d0
	beq	L01ea12
	subq.w	#1,d1
	bmi	L01ea08
L01e9fc:
	move.b	#$30,(a1)+
	subq.w	#1,d0
	beq	L01ea12
	dbra	d1,L01e9fc
L01ea08:
	move.l	d0,d1
L01ea0a:
	bsr	L01ea40
	move.b	d0,(a1)+
	subq.w	#1,d1
	bne	L01ea0a
L01ea12:
	clr.b	(a1)
	rts

L01ea16:
	move.l	d3,d0
	swap.w	d0
	btst.l	#$17,d4
	bne	L01ea24
	tst.w	d0
	ble	L01ea3e
L01ea24:
	move.b	#$2e,(a1)+
	subq.w	#1,d0
	bmi	L01ea3e
	movem.l	d1,-(sp)
	move.l	d0,d1
L01ea32:
	bsr	L01ea40
	move.b	d0,(a1)+
	dbra	d1,L01ea32
	movem.l	(sp)+,d1
L01ea3e:
	rts

L01ea40:
	move.b	(a0)+,d0
	bne	L01ea4a
	move.b	#$30,d0
	subq.l	#1,a0
L01ea4a:
	rts

L01ea4c:
	movea.l	a0,a1
L01ea4e:
	tst.b	(a1)+
	bne	L01ea4e
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	bra	L01ebf8
L01ea5c:
	cmp.w	#$ffff,d3
	bne	L01ea66
	move.w	#$0001,d3
L01ea66:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01ea72
	move.w	#$0001,d3
L01ea72:
	swap.w	d3
	lea.l	($0003,a5),a0
	tst.l	(a5)+
	moveq.l	#$01,d5
	bra	L01ebf8
L01ea80:
	move.l	(a5)+,d0
	bmi	L01ea8e
	bne	L01ea94
	move.l	#L01ed24,d0
	bra	L01ea94
L01ea8e:
	move.l	#L01ed2b,d0
L01ea94:
	movea.l	d0,a0
	movea.l	a0,a1
L01ea98:
	tst.b	(a1)+
	bne	L01ea98
	move.l	a1,d5
	sub.l	a0,d5
	subq.l	#1,d5
	cmp.w	#$ffff,d3
	bne	L01eaaa
	clr.w	d3
L01eaaa:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01eab4
	move.w	d5,d3
L01eab4:
	cmp.w	d3,d5
	bcs	L01eaba
	move.w	d3,d5
L01eaba:
	swap.w	d3
	bra	L01ebf8
L01eac0:
	move.l	a3,-(sp)
	lea.l	(-$0022,sp),sp
	movea.l	sp,a0
	move.l	(a5)+,d1
	clr.l	d5
	cmpi.b	#$75,d0
	beq	L01eaf6
	tst.l	d1
	bmi	L01eaee
	btst.l	#$1e,d4
	bne	L01eae8
	btst.l	#$16,d4
	beq	L01eaf6
	move.b	#$20,(a3)+
	bra	L01eaf4
L01eae8:
	move.b	#$2b,(a3)+
	bra	L01eaf4
L01eaee:
	move.b	#$2d,(a3)+
	neg.l	d1
L01eaf4:
	addq.l	#1,d5
L01eaf6:
	tst.l	d1
	beq	L01eb28
	lea.l	(L01ecf4),a1
L01eb00:
	move.l	(a1)+,d0
	cmp.l	d0,d1
	bcs	L01eb00
L01eb06:
	moveq.l	#$2f,d2
L01eb08:
	addq.b	#1,d2
	sub.l	d0,d1
	bcc	L01eb08
	add.l	d0,d1
	move.b	d2,(a0)+
	move.l	(a1)+,d0
	bne	L01eb06
L01eb16:
	clr.b	(a0)
	movea.l	sp,a0
	moveq.l	#$ff,d1
L01eb1c:
	addq.w	#1,d1
	tst.b	(a0)+
	bne	L01eb1c
	movea.l	sp,a0
	bra	L01ebbc
L01eb28:
	move.b	#$30,(a0)+
	bra	L01eb16
L01eb2e:
	move.l	#$00010001,d1
	bra	L01eb44
L01eb36:
	move.l	#$00030007,d1
	bra	L01eb44
L01eb3e:
	move.l	#$0004000f,d1
L01eb44:
	movem.l	a3,-(sp)
	clr.l	d5
	bclr.l	#$17,d4
	beq	L01eb7a
	move.b	#$30,(a3)+
	addq.w	#1,d5
	cmpi.w	#$0001,d1
	bne	L01eb62
	move.b	#$62,(a3)+
	bra	L01eb6c
L01eb62:
	cmpi.w	#$000f,d1
	bne	L01eb7a
	move.b	#$78,(a3)+
L01eb6c:
	addq.w	#1,d5
	btst.l	#$1b,d4
	beq	L01eb7a
	subi.b	#$20,(-$0001,a3)
L01eb7a:
	movea.l	sp,a0
	lea.l	(-$0022,sp),sp
	move.l	(a5)+,d0
	clr.b	-(a0)
	move.l	d0,d2
	movem.l	d5,-(sp)
	clr.l	d5
L01eb8c:
	addq.l	#1,d5
	and.b	d1,d2
	cmpi.b	#$09,d2
	bgt	L01eb9c
	add.b	#$30,d2
	bra	L01ebaa
L01eb9c:
	add.b	#$37,d2
	btst.l	#$1b,d4
	bne	L01ebaa
	add.b	#$20,d2
L01ebaa:
	move.b	d2,-(a0)
	swap.w	d1
	lsr.l	d1,d0
	swap.w	d1
	move.l	d0,d2
	bne	L01eb8c
	move.l	d5,d1
	movem.l	(sp)+,d5
L01ebbc:
	cmp.w	#$ffff,d3
	bne	L01ebc6
	move.w	#$0001,d3
L01ebc6:
	swap.w	d3
	cmp.w	#$ffff,d3
	bne	L01ebd2
	move.w	#$0001,d3
L01ebd2:
	move.w	d3,d0
	swap.w	d3
	sub.w	d1,d0
	ble	L01ebe6
	subq.w	#1,d0
L01ebdc:
	move.b	#$30,(a3)+
	addq.l	#1,d5
	dbra	d0,L01ebdc
L01ebe6:
	addq.l	#1,d5
	move.b	(a0)+,(a3)+
	bne	L01ebe6
	subq.l	#1,d5
	lea.l	($0022,sp),sp
	movem.l	(sp)+,a3
	movea.l	a3,a0
L01ebf8:
	cmp.w	d3,d5
	bcs	L01ebfe
	move.w	d5,d3
L01ebfe:
	btst.l	#$1f,d4
	bne	L01ec68
	btst.l	#$1a,d4
	beq	L01ec54
	lea.l	(L01ed21),a1
	move.b	(a0),d0
	cmp.b	#$30,d0
	beq	L01ec32
	cmp.b	#$20,d0
	beq	L01ec2a
	cmpi.b	#$2b,d0
	beq	L01ec2a
	cmpi.b	#$2d,d0
	bne	L01ec5a
L01ec2a:
	bsr	L01ec88
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L01ec5a
L01ec32:
	move.b	($0001,a0),d0
	or.b	#$20,d0
	cmp.b	#$62,d0
	beq	L01ec46
	cmp.b	#$78,d0
	bne	L01ec5a
L01ec46:
	bsr	L01ec88
	tst.b	(a0)+
	subq.w	#1,d5
	bsr	L01ec88
	tst.b	(a0)+
	subq.w	#1,d5
	bra	L01ec5a
L01ec54:
	lea.l	(L01ed20),a1
L01ec5a:
	cmp.w	d3,d5
	bcc	L01ec68
	exg.l	a1,a0
L01ec60:
	bsr	L01ec88
	cmp.w	d3,d5
	bcs	L01ec60
	exg.l	a1,a0
L01ec68:
	tst.w	d5
	beq	L01ec78
	bsr	L01ec88
	tst.b	(a0)+
	tst.w	d3
	ble	L01ec86
	subq.w	#1,d5
	bne	L01ec68
L01ec78:
	tst.w	d3
	ble	L01ec86
	lea.l	(L01ed20),a0
L01ec82:
	bsr	L01ec88
	bne	L01ec82
L01ec86:
	rts

L01ec88:
	movem.l	d1-d5/d7/a0-a6,-(sp)
	move.b	(a0),d0
	andi.l	#$000000ff,d0
	movem.l	d0/d6,-(sp)
	jsr	(a6)
	movem.l	(sp)+,d0/d6
	movem.l	(sp)+,d1-d5/d7/a0-a6
	moveq.l	#$01,d0
	add.l	d0,d7
	sub.w	d0,d3
	rts

L01ecaa:
	clr.l	d4
	movea.l	a2,a4
	move.b	(a4)+,d0
L01ecb0:
	lea.l	(-$0001,a4),a0
L01ecb4:
	move.b	(a4)+,d0
	beq	L01ecbe
	cmpi.b	#$25,d0
	bne	L01ecb4
L01ecbe:
	tst.b	-(a4)
	move.l	a4,d5
	sub.l	a0,d5
	move.w	d5,d3
	bra	L01ebf8
L01ecca:
	clr.l	d1
L01eccc:
	cmpi.b	#$30,d0
	bcs	L01ecec
	cmpi.b	#$39,d0
	bhi	L01ecec
	andi.w	#$000f,d0
	add.w	d1,d1
	add.w	d1,d0
	lsl.w	#2,d1
	add.w	d0,d1
	move.b	(a4)+,d0
	bne	L01eccc
	moveq.l	#$ff,d1
	rts

L01ecec:
	swap.w	d0
	move.w	d1,d0
	clr.l	d1
	rts

L01ecf4:
	.dc.b	$3b,$9a,$ca,$00,$05,$f5,$e1,$00
	.dc.b	$00,$98,$96,$80,$00,$0f,$42,$40
	.dc.b	$00,$01,$86,$a0,$00,$00,$27,$10
	.dc.b	$00,$00,$03,$e8,$00,$00,$00,$64
	.dc.b	$00,$00,$00,$0a,$00,$00,$00,$01
	.dc.b	$00,$00,$00,$00
L01ed20:
	.dc.b	$20
L01ed21:
	.dc.b	$30,$0d,$00
L01ed24:
	.dc.b	'(NULL)',$00
L01ed2b:
	.dc.b	'(ERROR)',$00,$00
L01ed34:
	movem.l	($0004,sp),d1-d2
	movea.l	d1,a2
	btst.l	#$02,d2
	bne	L01ede0
	btst.l	#$00,d2
	bne	L01edd4
	btst.l	#$01,d2
	bne	L01edae
	btst.l	#$08,d2
	bne	L01edce
	btst.l	#$0c,d2
	bne	L01edae
	btst.l	#$0e,d2
	bne	L01ed70
	bra	L01ee44
L01ed68:
	btst.l	#$0e,d2
	beq	L01ee46
L01ed70:
	bsr	L01ee50
	bmi	L01ed8c
	bsr	L01ee72
	btst.l	#$0d,d2
	bne	L01ee40
	bsr	L01ee54
	bmi	L01ee46
	bra	L01edb4
L01ed8c:
	move.l	($000c,sp),d0
	moveq.l	#$20,d1
	cmp.l	#$00000000,d0
	bne	L01ed9e
	bset.l	#$00,d1
L01ed9e:
	bsr	L01ee66
	bmi	L01ee46
	move.l	d0,-(sp)
	bsr	L01ee7a
	bra	L01ee12
L01edae:
	bsr	L01ee54
L01edb2:
	bmi	L01ed68
L01edb4:
	move.l	d0,-(sp)
	bsr	L01ee7a
	btst.l	#$07,d1
	bne	L01ee12
	btst.l	#$0c,d2
	beq	L01ee12
	move.l	(sp),d0
	bsr	L01ee86
	bra	L01ee12
L01edce:
	bsr	L01ee58
	bra	L01edb2
L01edd4:
	bsr	L01ee50
	bmi	L01ed68
	move.l	d0,-(sp)
	bsr	L01ee7a
	bra	L01ee12
L01ede0:
	bsr	L01ee58
	bmi	L01ed68
	move.l	d0,-(sp)
	bsr	L01ee7a
	btst.l	#$07,d1
	bne	L01ee12
	btst.l	#$0b,d2
	bne	L01ee0c
	btst.l	#$0a,d2
	bne	L01ee04
	move.l	(L07564a),d0
	beq	L01ee0c
L01ee04:
	move.l	(sp),d0
	bsr	L01ee98
	bra	L01ee12
L01ee0c:
	move.l	(sp),d0
	bsr	L01eea6
L01ee12:
	btst.l	#$0b,d2
	bne	L01ee30
	btst.l	#$0a,d2
	bne	L01ee30
	move.l	(L07564a),d0
	beq	L01ee2c
	bset.l	#$0a,d2
	bra	L01ee30
L01ee2c:
	bset.l	#$0b,d2
L01ee30:
	move.l	(sp),d0
	bsr	L01eee2
	move.l	(sp)+,d0
	move.b	d0,(a0)+
	move.b	d1,(a0)+
	move.w	d2,(a0)
	rts

L01ee40:
	moveq.l	#$ea,d0
	bra	L01ee46
L01ee44:
	moveq.l	#$f4,d0
L01ee46:
	jsr	(L01fa02)
	moveq.l	#$ff,d0
	rts

L01ee50:
	clr.l	d0
	bra	L01ee5a
L01ee54:
	moveq.l	#$01,d0
	bra	L01ee5a
L01ee58:
	moveq.l	#$02,d0
L01ee5a:
	move.w	d0,-(sp)
	move.l	a2,-(sp)
	DOS	__OPEN
	addq.l	#6,sp
	tst.l	d0
	rts

L01ee66:
	move.w	d1,-(sp)
	move.l	a2,-(sp)
	DOS	__CREATE
	addq.l	#6,sp
	tst.l	d0
	rts

L01ee72:
	move.w	d0,-(sp)
	DOS	__CLOSE
	addq.l	#2,sp
	rts

L01ee7a:
	move.w	d0,-(sp)
	clr.w	-(sp)
	DOS	__IOCTRL
	addq.l	#4,sp
	move.l	d0,d1
	rts

L01ee86:
	clr.l	-(sp)
	pea.l	(L01ee86)
	move.w	d0,-(sp)
	DOS	__WRITE
	lea.l	($000a,sp),sp
	rts

L01ee98:
	move.w	#$0002,-(sp)
	clr.l	-(sp)
	move.w	d0,-(sp)
	DOS	__SEEK
	addq.l	#8,sp
	rts

L01eea6:
	clr.w	-(sp)
	movea.l	sp,a0
	clr.w	-(sp)
	move.w	#$0002,-(sp)
	move.l	#$ffffffff,-(sp)
	move.w	d0,-(sp)
	DOS	__SEEK
	moveq.l	#$01,d0
	move.l	d0,($0006,sp)
	move.l	a0,($0002,sp)
	DOS	__READ
	cmpi.b	#$1a,(a0)
	bne	L01eedc
	move.w	#$0002,($0006,sp)
	move.l	#$ffffffff,($0002,sp)
	DOS	__SEEK
L01eedc:
	lea.l	($000c,sp),sp
	rts

L01eee2:
	asl.l	#2,d0
	lea.l	(L0754ca),a0
	adda.l	d0,a0
	move.l	(a0),d0
	rts

L01eef0:
	move.l	($0004,sp),d0
	move.w	d0,-(sp)
	move.w	d0,-(sp)
	jsr	(L01eee2)
	tst.w	d0
	beq	L01ef2c
	clr.l	(a0)
	DOS	__CLOSE
	move.w	(sp),d0
	cmp.w	#$0005,d0
	bcc	L01ef26
	move.w	d0,d1
	add.w	d0,d0
	lea.l	(L01ef3a),a1
	move.w	(a1,d0.w),d2
	clr.w	(sp)
	DOS	__IOCTRL
	move.b	d1,(a0)+
	move.b	d0,(a0)+
	move.w	d2,(a0)
L01ef26:
	addq.l	#4,sp
	clr.l	d0
	rts

L01ef2c:
	addq.l	#4,sp
	moveq.l	#$fa,d0
	jsr	(L01fa02)
	moveq.l	#$ff,d0
	rts

L01ef3a:
	.dc.b	$08,$01,$08,$02,$09,$00,$09,$00
	.dc.b	$08,$02
L01ef44:
	movea.l	($0004,sp),a2
	move.l	($000c,a2),d2
	btst.l	#$13,d2
	beq	L01ef5c
	move.l	a2,-(sp)
	jsr	(L01efe6)
	movea.l	(sp)+,a2
L01ef5c:
	move.l	($000c,a2),d2
	btst.l	#$14,d2
	bne	L01ef8a
	subq.l	#1,($0004,a2)
	bmi	L01ef7a
	movea.l	($0000.w,a2),a0
	clr.l	d0
	move.b	(a0)+,d0
	move.l	a0,($0000.w,a2)
	bra	L01ef98
L01ef7a:
	move.l	a2,-(sp)
	jsr	(L01f4a2)
	movea.l	(sp)+,a2
	tst.l	d0
	bmi	L01efb0
	bra	L01ef98
L01ef8a:
	clr.l	d0
	move.b	($0015,a2),d0
	bclr.l	#$14,d2
	move.l	d2,($000c,a2)
L01ef98:
	move.l	($000c,a2),d2
	btst.l	#$0b,d2
	beq	L01efb2
	cmp.b	#$1a,d0
	bne	L01efb2
	bset.l	#$05,d2
	move.l	d2,($000c,a2)
L01efb0:
	moveq.l	#$ff,d0
L01efb2:
	rts

L01efb4:
	movea.l	($0004,sp),a2
	lea.l	(-$000c,a2),a2
	cmpa.l	(L0754a2),a2
	bcs	L01efe2
	cmpa.l	(L0754aa),a2
	bcc	L01efe2
	move.b	#$fe,($0004,a2)
	lea.l	(L0754ae),a1
	cmpa.l	(a1),a2
	bcc	L01efde
	move.l	a2,(a1)
L01efde:
	clr.l	d0
	rts

L01efe2:
	moveq.l	#$ff,d0
	rts

L01efe6:
	movea.l	($0004,sp),a2
	move.l	($000c,a2),d2
	beq	L01f03e
	btst.l	#$13,d2
	beq	L01f028
	move.l	($0010,a2),d1
	sub.l	($0004,a2),d1
	beq	L01f028
	movem.l	d1-d2/a2,-(sp)
	move.l	d1,-(sp)
	move.l	($0008,a2),-(sp)
	clr.l	d0
	move.b	($0014,a2),d0
	move.l	d0,-(sp)
	jsr	(L01fa64)
	lea.l	($000c,sp),sp
	movem.l	(sp)+,d1-d2/a2
	cmp.l	d1,d0
	beq	L01f028
	bset.l	#$06,d2
L01f028:
	clr.l	($0004,a2)
	and.l	#$ffe3ffff,d2
	move.l	d2,($000c,a2)
	clr.l	d0
	btst.l	#$06,d2
	beq	L01f040
L01f03e:
	moveq.l	#$ff,d0
L01f040:
	rts

L01f042:
	movem.l	a6,-(sp)
	movem.l	($0008,sp),d0/a6
	move.l	($000c,a6),d2
	btst.l	#$12,d2
	beq	L01f05a
	clr.l	($0004,a6)
L01f05a:
	subq.l	#1,($0004,a6)
	bmi	L01f086
	movea.l	($0000.w,a6),a0
	move.b	d0,(a0)+
	move.l	a0,($0000.w,a6)
	cmp.b	#$0a,d0
	bne	L01f092
	btst.l	#$08,d2
	beq	L01f092
	move.l	d0,-(sp)
	move.l	a6,-(sp)
	jsr	(L01efe6)
	addq.l	#4,sp
	move.l	(sp)+,d0
	bra	L01f092
L01f086:
	move.l	a6,-(sp)
	move.l	d0,-(sp)
	jsr	(L01fb66+$000002)
	addq.l	#8,sp
L01f092:
	movem.l	(sp)+,a6
	rts

L01f098:
	.dc.l	$00000000
L01f09c:
	.dc.w	$0040,$0000,$0000,$0001
L01f0a4:
	.dc.w	$0000,$0000,$0020,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$ffff
	.dc.w	$ffff,$ffff,$ffff,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000,$0000
	.dc.w	$0000,$0000,$0000
L01f3f2:
	movem.l	($0004,sp),d0-d2
	movem.l	d1-d2,-(sp)
	move.w	d0,-(sp)
	jsr	(L01eee2)
	tst.w	d0
	beq	L01f492
	btst.l	#$0f,d0
	bne	L01f484
	tst.l	d2
	beq	L01f484
	bmi	L01f48e
	btst.l	#$0a,d0
	bne	L01f472
	swap.w	d0
	btst.l	#$07,d0
	beq	L01f42a
	btst.l	#$05,d0
	bne	L01f472
L01f42a:
	movea.l	d1,a2
L01f42c:
	DOS	__READ
	move.l	d0,d1
	bmi	L01f494
	beq	L01f46a
	movea.l	a2,a1
L01f436:
	move.b	(a2)+,d0
	cmp.b	#$0d,d0
	beq	L01f452
	cmp.b	#$1a,d0
	beq	L01f46a
	move.b	d0,(a1)+
	subq.l	#1,d2
	tst.l	d2
	bne	L01f452
	move.l	($0016,sp),d1
	bra	L01f486
L01f452:
	subq.l	#1,d1
	bne	L01f436
	move.l	($0016,sp),d1
	sub.l	d2,d1
	bne	L01f486
	movea.l	a1,a2
	move.l	a2,($0002,sp)
	move.l	d2,($0006,sp)
	bra	L01f42c
L01f46a:
	move.l	($0016,sp),d1
	sub.l	d2,d1
	bra	L01f47a
L01f472:
	DOS	__READ
	move.l	d0,d1
	bmi	L01f494
	bne	L01f486
L01f47a:
	move.l	(a0),d0
	bset.l	#$0f,d0
	move.l	d0,(a0)
	bra	L01f486
L01f484:
	clr.l	d1
L01f486:
	move.l	d1,d0
	lea.l	($000a,sp),sp
	rts

L01f48e:
	moveq.l	#$f2,d0
	bra	L01f494
L01f492:
	moveq.l	#$fa,d0
L01f494:
	lea.l	($000a,sp),sp
	jsr	(L01fa02)
	moveq.l	#$ff,d0
	rts

L01f4a2:
	movem.l	d6/a6,-(sp)
	movea.l	($000c,sp),a6
	move.l	($000c,a6),d6
	clr.l	d2
	move.b	($0014,a6),d2
	btst.l	#$14,d6
	bne	L01f50e
	btst.l	#$03,d6
	bne	L01f4f2
	move.l	($0010,a6),-(sp)
	move.l	($0008,a6),-(sp)
	move.l	d2,-(sp)
	jsr	(L01f3f2)
	lea.l	($000c,sp),sp
	tst.l	d0
	bmi	L01f52e
	beq	L01f526
	subq.l	#1,d0
	move.l	d0,($0004,a6)
	movea.l	($0008,a6),a0
	clr.l	d0
	move.b	(a0)+,d0
	move.l	a0,($0000.w,a6)
	bset.l	#$12,d6
	bra	L01f51c
L01f4f2:
	move.l	#$00000001,-(sp)
	pea.l	($0015,a6)
	move.l	d2,-(sp)
	jsr	(L01f3f2)
	lea.l	($000c,sp),sp
	tst.l	d0
	bmi	L01f52e
	beq	L01f526
L01f50e:
	bclr.l	#$14,d6
	clr.l	($0004,a6)
	clr.l	d0
	move.b	($0015,a6),d0
L01f51c:
	move.l	d6,($000c,a6)
	movem.l	(sp)+,d6/a6
	rts

L01f526:
	bset.l	#$05,d6
	moveq.l	#$ff,d0
	bra	L01f51c
L01f52e:
	bset.l	#$06,d6
	moveq.l	#$ff,d0
	bra	L01f51c
L01f536:
	move.l	a3,-(sp)
	movea.l	($0008,sp),a3
	move.l	($000c,sp),d0
	move.l	($0010,sp),-(sp)
	move.l	d0,-(sp)
	move.l	a3,-(sp)
	pea.l	(L01f042)
	jsr	(L01e65e)
	lea.l	($0010,sp),sp
	btst.b	#$06,($000f,a3)
	beq	L01f562
	moveq.l	#$ff,d0
L01f562:
	movea.l	(sp)+,a3
	rts

L01f566:
	move.l	($0004,sp),d2
	movea.l	(L0754ba),a2
L01f570:
	movea.l	d2,a0
	move.l	(a2)+,d0
	beq	L01f58a
	movea.l	d0,a1
L01f578:
	move.b	(a0)+,d0
	beq	L01f58e
	move.b	(a1)+,d1
	beq	L01f570
	cmp.b	d1,d0
	bne	L01f570
	cmp.b	#$3d,d0
	bne	L01f578
L01f58a:
	clr.l	d0
	rts

L01f58e:
	move.b	(a1)+,d0
	beq	L01f570
	cmp.b	#$3d,d0
	bne	L01f570
	move.l	a1,d0
	rts

L01f59c:
	move.l	($0004,sp),d1
	add.l	(L0754aa),d1
	cmp.l	(L0754a6),d1
	bcs	L01f5d2
	movea.l	(L07547e),a1
	move.l	d1,d0
	sub.l	a1,d0
	move.l	d0,-(sp)
	move.l	a1,-(sp)
	DOS	__SETBLOCK
	addq.l	#8,sp
	tst.l	d0
	bmi	L01f5d2
	move.l	(L0754aa),d0
	move.l	d1,(L0754aa)
	rts

L01f5d2:
	move.l	#$0000000c,(L075104)
	moveq.l	#$ff,d0
	rts

L01f5e0:
	movem.l	d6-d7/a6,-(sp)
	clr.l	d6
	moveq.l	#$28,d7
	subq.l	#1,d7
	movea.l	#L07510c,a6
	subq.l	#4,sp
L01f5f2:
	move.l	a6,(sp)
	jsr	(L01efe6)
	tst.l	d0
	bne	L01f600
	addq.l	#1,d6
L01f600:
	adda.l	#$00000016,a6
	dbra	d7,L01f5f2
	move.l	d6,d0
	bne	L01f610
	moveq.l	#$ff,d0
L01f610:
	addq.l	#4,sp
	movem.l	(sp)+,d6-d7/a6
	move.l	d0,-(sp)
	DOS	__FFLUSH
	movem.l	(sp)+,d0
	rts

L01f620:
	.dc.b	$4c,$ef,$06,$07,$00,$04,$20,$7c
	.dc.l	L01f640
	.dc.b	$42,$10,$b4,$bc,$00,$00,$01,$35
	.dc.b	$64,$06,$fe,$24,$22,$80,$24,$81
	.dc.b	$20,$08,$4e,$75
L01f640:
	.ds.b	310
L01f776:
	.dc.b	$4c,$ef,$06,$07,$00,$04,$41,$f9
	.dc.l	L01f796
	.dc.b	$42,$10,$b4,$bc,$00,$00,$01,$35
	.dc.b	$64,$06,$fe,$25,$22,$80,$24,$81
	.dc.b	$20,$08,$4e,$75
L01f796:
	.ds.b	620
L01fa02:
	tst.l	d0
	bge	L01fa42
	move.l	d0,(L075108)
	rol.l	#8,d0
	cmp.b	#$81,d0
	beq	L01fa46
	cmp.b	#$82,d0
	beq	L01fa46
	ror.w	#8,d0
	neg.l	d0
	cmpi.l	#$00000020,d0
	bgt	L01fa40
	move.l	a0,-(sp)
	lea.l	(L01fa4a),a0
	move.b	(-$01,a0,d0.w),d0
	movea.l	(sp)+,a0
	andi.l	#$000000ff,d0
L01fa3a:
	move.l	d0,(L075104)
L01fa40:
	moveq.l	#$ff,d0
L01fa42:
	tst.l	d0
	rts

L01fa46:
	moveq.l	#$0c,d0
	bra	L01fa3a
L01fa4a:
	.dc.b	$00,$02,$02,$18,$0d,$09,$00,$0c
	.dc.b	$00,$00,$08,$11,$16,$00,$16,$0d
	.dc.b	$0d,$02,$0d,$0d,$0d,$0d,$1c,$1c
	.dc.b	$16,$16
L01fa64:
	movem.l	($0004,sp),d0-d2
	movea.l	d1,a2
	movem.l	d1-d2,-(sp)
	move.w	d0,-(sp)
	jsr	(L01eee2)
	tst.w	d0
	beq	L01fb56
	movem.l	d0/a0,-(sp)
	btst.l	#$02,d0
	beq	L01faa4
	btst.l	#$0a,d0
	beq	L01fa9a
	clr.l	d0
	move.b	(a0),d0
	jsr	(L01ee98)
	bra	L01faa4
L01fa9a:
	clr.l	d0
	move.b	(a0),d0
	jsr	(L01eea6)
L01faa4:
	movem.l	(sp)+,d0/a0
	btst.l	#$0a,d0
	bne	L01fb26
	swap.w	d0
	btst.l	#$07,d0
	beq	L01fabc
	btst.l	#$05,d0
	bne	L01fb26
L01fabc:
	tst.l	d2
	ble	L01fb26
L01fac0:
	movea.l	a2,a1
	tst.l	d2
	ble	L01fb38
	clr.l	d1
L01fac8:
	move.b	(a2)+,d0
	subq.l	#1,d2
	cmp.b	#$0a,d0
	beq	L01faee
	addq.l	#1,d1
	cmp.b	#$1a,d0
	beq	L01fae2
	tst.l	d2
	bgt	L01fac8
	moveq.l	#$ff,d2
	bra	L01faee
L01fae2:
	moveq.l	#$ff,d2
	move.w	(a0),d0
	btst.l	#$01,d0
	beq	L01faee
	subq.l	#1,d1
L01faee:
	tst.l	d1
	beq	L01fb06
	move.l	d1,($0006,sp)
	move.l	a1,($0002,sp)
	DOS	__WRITE
	tst.l	d0
	bmi	L01fb44
	adda.l	d0,a1
	cmp.l	d1,d0
	bcs	L01fb4c
L01fb06:
	tst.l	d2
	bmi	L01fb38
	moveq.l	#$02,d1
	move.l	d1,($0006,sp)
	move.l	#L01fb66,($0002,sp)
	DOS	__WRITE
	tst.l	d0
	bmi	L01fb44
	cmp.l	d1,d0
	bcs	L01fb4c
	addq.l	#1,a1
	bra	L01fac0
L01fb26:
	movea.l	a2,a1
	tst.l	d2
	bmi	L01fb4c
	DOS	__WRITE
	tst.l	d0
	bmi	L01fb44
	adda.l	d0,a1
	cmp.l	d2,d0
	bcs	L01fb4c
L01fb38:
	lea.l	($000a,sp),sp
	move.l	a1,d0
	sub.l	($0008,sp),d0
	rts

L01fb44:
	cmp.l	#$ffffffe9,d0
	bne	L01fb58
L01fb4c:
	move.l	(a0),d1
	bset.l	#$0f,d1
	move.l	d1,(a0)
	bra	L01fb38
L01fb56:
	moveq.l	#$fa,d0
L01fb58:
	lea.l	($000a,sp),sp
	jsr	(L01fa02)
	moveq.l	#$ff,d0
	rts

L01fb66:
	movep.w	($48e7,a2),d6
	btst.l	d1,d2
	movem.l	($0010,sp),d7/a6
	move.l	($000c,a6),d6
	clr.l	d2
	move.b	($0014,a6),d2
	btst.l	#$03,d6
	bne	L01fbce
	btst.l	#$13,d6
	beq	L01fbaa
	move.l	($0010,a6),-(sp)
	move.l	($0008,a6),-(sp)
	move.l	d2,-(sp)
	jsr	(L01fa64)
	lea.l	($000c,sp),sp
	bclr.l	#$13,d6
	tst.l	d0
	bmi	L01fbec
	cmp.l	($0010,a6),d0
	bne	L01fbec
L01fbaa:
	move.l	($0010,a6),d1
	subq.l	#1,d1
	move.l	d1,($0004,a6)
	movea.l	($0008,a6),a0
	move.b	d7,(a0)+
	move.l	a0,($0000.w,a6)
	bset.l	#$13,d6
L01fbc2:
	move.l	d7,d0
L01fbc4:
	move.l	d6,($000c,a6)
	movem.l	(sp)+,d6-d7/a6
	rts

L01fbce:
	move.b	d7,($0015,a6)
	move.l	#$00000001,-(sp)
	pea.l	($0015,a6)
	move.l	d2,-(sp)
	jsr	(L01fa64)
	lea.l	($000c,sp),sp
	subq.l	#1,d0
	beq	L01fbc2
L01fbec:
	bset.l	#$06,d6
	moveq.l	#$ff,d0
	bra	L01fbc4

	.data

L01fbf4:
	.dc.w	$0000
L01fbf6:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
L01fc3e:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$00,$01
	.dc.b	$01,$01,$01,$00,$00,$01,$01,$01
	.dc.b	$01,$00,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
L01fc86:
	.dc.b	$01,$01,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$01,$01,$00,$00,$00
	.dc.b	$00,$01,$01,$00,$00,$00,$00,$01
	.dc.b	$01,$00,$00,$00,$00,$01,$01,$00
	.dc.b	$00,$00,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$00,$00
L01fcce:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
L01fd16:
	.dc.b	$01,$01,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$00,$00,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
L01fd5e:
	.dc.b	$00,$00,$00,$01,$01,$00,$00,$00
	.dc.b	$01,$01,$01,$00,$00,$00,$01,$01
	.dc.b	$01,$00,$00,$01,$01,$01,$01,$00
	.dc.b	$01,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$00,$01,$01,$00,$01,$01,$00,$01
	.dc.b	$01,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$00,$01,$01,$00,$00,$00,$00,$01
	.dc.b	$01,$00,$00,$00,$00,$01,$01,$00
L01fda6:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$00,$00,$00,$01,$01
	.dc.b	$01,$00,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
L01fdee:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$00,$01,$01,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$01,$01,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$01,$01
L01fe36:
	.dc.b	$00,$00,$01,$01,$00,$00,$00,$01
	.dc.b	$01,$01,$00,$00,$00,$01,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$00,$00,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$00,$01,$01
	.dc.b	$00,$00,$00,$00,$01,$01,$00,$00
	.dc.b	$00,$00,$01,$01,$00,$00,$00,$00
	.dc.b	$01,$01,$00,$00,$00,$01,$01,$01
	.dc.b	$01,$00,$00,$01,$01,$01,$01,$00
L01fe7e:
	.dc.b	$00,$01,$01,$01,$01,$00,$01,$01
	.dc.b	$01,$01,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$00,$00
	.dc.b	$01,$01,$01,$01,$00,$00,$01,$01
	.dc.b	$01,$01,$00,$00,$01,$01,$01,$01
	.dc.b	$00,$00,$01,$01,$01,$01,$01,$01
	.dc.b	$01,$01,$00,$01,$01,$01,$01,$00
タイマーD割込みウェイトテーブル:
	.dc.b	$00,$01,$00,$06,$00,$05,$00,$04
	.dc.b	$00,$02,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00
L01feda:
	.dc.w	$0000
L01fedc:
	.dc.w	$0001
L01fede:
	.dc.w	$0000
L01fee0:
	.dc.w	$0040
L01fee2:
	.dc.b	$00,$00,$00,$3e,$07,$c0,$07,$fe
	.dc.b	$f8,$00,$f8,$3e,$ff,$c0,$ff,$ff
L01fef2:
	.dc.w	$0028
処理順制御フラグ:
	.dc.w	$0000
L01fef6:
	.dc.b	$00,$00,$00,$00
L01fefa:
	.dc.b	$00,$00
L01fefc:
	.dc.b	$00,$00,$00,$03
L01ff00:
	.dc.b	$00,$03,$00,$03
L01ff04:
	.dc.b	$00,$03
L01ff06:
	.dc.b	$00,$00,$00,$00
表示中コンボ数_X座標:
	.dc.b	$00,$0f,$00,$0f
表示中コンボ数_Y座標:
	.dc.b	$00,$14,$00,$14
L01ff12:
	.dc.b	$00,$00,$00,$ee,$00,$ed,$00,$ec
L01ff1a:
	.dc.b	$00,$00,$00,$14,$00,$0a,$00,$14
L01ff22:
	.dc.b	$00,$00,$00,$0a,$00,$08,$00,$09
	.dc.b	$00,$02,$00,$00,$00,$01,$00,$06
	.dc.b	$00,$04,$00,$05
L01ff36:
	.dc.w	$0000,$0001,$0002,$0003
	.dc.w	$0004,$0006,$0008,$000a
	.dc.w	$000c,$000e,$0010,$0013
	.dc.w	$0016,$001a,$001d,$0020
	.dc.w	$0022,$0024,$0026,$0028
	.dc.w	$002a,$002b,$002c,$002d
	.dc.w	$002d,$002c,$002b,$002a
	.dc.w	$0028,$0026,$0024,$0022
	.dc.w	$0020,$001d,$001a,$0016
	.dc.w	$0013,$0010,$000e,$000c
	.dc.w	$000a,$0008,$0006,$0004
	.dc.w	$0003,$0002,$0001,$0000
	.dc.w	$03e8
L01ff98:
	.dc.w	$0010,$0011,$0012,$0013
	.dc.w	$0014,$0015,$0015,$0016
	.dc.w	$0016,$0017,$0017,$0018
	.dc.w	$0018,$0018,$0017,$0017
	.dc.w	$0016,$0016,$0015,$0015
	.dc.w	$0014,$0013,$0012,$0011
	.dc.w	$0010,$000f,$000e,$000d
	.dc.w	$000c,$000b,$000b,$000a
	.dc.w	$000a,$0009,$0009,$0008
	.dc.w	$0008,$0008,$0009,$0009
	.dc.w	$000a,$000a,$000b,$000b
	.dc.w	$000c,$000d,$000e
L01fff6:
	.dc.b	$00,$0f,$00,$08,$00,$08
L01fffc:
	.dc.b	$00,$02,$00,$02,$00,$02,$00,$02
	.dc.b	$00,$02,$00,$02
ラスター割込みY座標現在値:
	.dc.w	$0000
ラスタースクロール量テーブル参照用Yインデックス:
	.dc.w	$0000
ラスタースクロール用割込み間隔:
	.dc.w	$0004
ラスター割込み終了位置:
	.dc.w	$0070
ラスター割込み適用開始位置:
	.dc.w	$0188
L020012:
	.dc.w	$0000
L020014:
	.dc.w	$0000
未定義セルデータ:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
L020046:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$00
	.dc.b	$00,$00,$00,$02,$00,$28,$00,$2c
L020056:
	.dc.w	$003a
L020058:
	.dc.b	$00,$04,$00,$05,$00,$06,$00,$07
	.dc.b	$00,$04,$00,$04,$00,$0f,$00,$0e
	.dc.b	$00,$0d,$00,$0c,$00,$0b,$00,$0a
L020070:
	.dc.b	$00,$84,$00,$85,$00,$86,$00,$87
	.dc.b	$00,$84,$00,$84,$00,$8f,$00,$8e
	.dc.b	$00,$8d,$00,$8c,$00,$8b,$00,$8a
L020088:
	.dc.b	$00,$74,$00,$75,$00,$76,$00,$77
	.dc.b	$00,$74,$00,$74,$00,$7f,$00,$7e
	.dc.b	$00,$7d,$00,$7c,$00,$7b,$00,$7a
L0200a0:
	.dc.w	$0040
L0200a2:
	.dc.w	$0080
ラスター割込み設定状態:
	.dc.w	$0000
L0200a6:
	.dc.b	$00,$00,$00,$00
L0200aa:
	.dc.b	$00,$00,$00,$00,$00,$00
L0200b0:
	.dc.w	$0000
L0200b2:
	.dc.w	$0000,$0000,$0000
L0200b8:
	.dc.b	'"""""""#"""3""#3""33"#33"333#333'
L0200d8:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$02
	.dc.b	$00,$00,$00,$22,$00,$00,$02,$22
	.dc.b	$00,$00,$22,$22,$00,$02,$22,$22
	.dc.b	$00,$22,$22,$22,$02,$22,$22,$22
	.dc.b	$00,$00,$00,$03,$00,$00,$00,$03
	.dc.b	$00,$00,$00,$23,$00,$00,$02,$23
	.dc.b	$00,$00,$22,$23,$00,$02,$22,$23
	.dc.b	$00,$22,$22,$23,$02,$22,$22,$23
	.dc.b	$00,$00,$00,$33,$00,$00,$00,$33
	.dc.b	$00,$00,$00,$33,$00,$00,$02,$33
	.dc.b	$00,$00,$22,$33,$00,$02,$22,$33
	.dc.b	$00,$22,$22,$33,$02,$22,$22,$33
	.dc.b	$00,$00,$03,$33,$00,$00,$03,$33
	.dc.b	$00,$00,$03,$33,$00,$00,$03,$33
	.dc.b	$00,$00,$23,$33,$00,$02,$23,$33
	.dc.b	$00,$22,$23,$33,$02,$22,$23,$33
	.dc.b	$00,$00,$33,$33,$00,$00,$33,$33
	.dc.b	$00,$00,$33,$33,$00,$00,$33,$33
	.dc.b	$00,$00,$33,$33,$00,$02,$33,$33
	.dc.b	$00,$22,$33,$33,$02,$22,$33,$33
	.dc.b	$00,$03,$33,$33,$00,$03,$33,$33
	.dc.b	$00,$03,$33,$33,$00,$03,$33,$33
	.dc.b	$00,$03,$33,$33,$00,$03,$33,$33
	.dc.b	$00,$23,$33,$33,$02,$23,$33,$33
	.dc.b	$00,$33,$33,$33,$00,$33,$33,$33
	.dc.b	$00,$33,$33,$33,$00,$33,$33,$33
	.dc.b	$00,$33,$33,$33,$00,$33,$33,$33
	.dc.b	$00,$33,$33,$33,$02,$33,$33,$33
	.dc.b	$03,$33,$33,$33,$03,$33,$33,$33
	.dc.b	$03,$33,$33,$33,$03,$33,$33,$33
	.dc.b	$03,$33,$33,$33,$03,$33,$33,$33
	.dc.b	$03,$33,$33,$33,$03,$33,$33,$33
L0201d8:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$03
	.dc.b	$00,$00,$00,$33,$00,$00,$03,$33
	.dc.b	$00,$00,$33,$33,$00,$03,$33,$33
	.dc.b	$00,$33,$33,$33,$03,$33,$33,$33
L0201f8:
	.dc.b	$00,$00,$00,$00,$00,$00,$00,$02
	.dc.b	$00,$00,$00,$22,$00,$00,$02,$22
	.dc.b	$00,$00,$22,$22,$00,$02,$22,$22
	.dc.b	$00,$22,$22,$22,$02,$22,$22,$22
体力ゲージ点滅用_カラーパターン:
	.dc.b	$07,$c0,$07,$80,$07,$40,$07,$00
	.dc.b	$06,$c0,$06,$80,$06,$40,$06,$00
	.dc.b	$05,$c0,$05,$80,$05,$40,$05,$00
	.dc.b	$04,$c0,$04,$80,$04,$40,$04,$00
	.dc.b	$04,$00,$04,$40,$04,$80,$04,$c0
	.dc.b	$05,$00,$05,$40,$05,$80,$05,$c0
	.dc.b	$06,$00,$06,$40,$06,$80,$06,$c0
	.dc.b	$07,$00,$07,$40,$07,$80,$07,$c0
体力ゲージ点滅カウンタ:
	.dc.w	$001f
L02025a:
	.dc.w	$0000
L02025c:
	.dc.w	$0000

	.bss

L02025e:
	.ds.w	1
L020260:
	.ds.w	1
L020262:
	.ds.w	1
L020264:
	.ds.w	1
L020266:
	.ds.w	1
L020268:
	.ds.w	1
L02026a:
	.ds.w	1
L02026c:
	.ds.w	1
PCGパレットアドレス_デフォルト気集中マーク:
	.ds.l	1
L020272:
	.ds.w	1
L020274:
	.ds.w	1
L020276:
	.ds.w	1
L020278:
	.ds.b	16
L020288:
	.ds.b	16
L020298:
	.ds.b	16
L0202a8:
	.ds.b	2048
L020aa8:
	.ds.b	36
L020acc:
	.ds.l	1
SFSYSINFO_0000_xxxx:
	.ds.b	2
SFSYSINFO_0002_PCMドラム有効:
	.ds.w	1
SFSYSINFO_0004_PCMチャンネル数:
	.ds.b	4
SFSYSINFO_0008_Cpu思考レベル:
	.ds.w	1
SFSYSINFO_000a_タイムリミット有効:
	.ds.w	1
SFSYSINFO_000c_ゲームスピード:
	.ds.w	1
SFSYSINFO_000e_xxxx:
	.ds.w	1
SFSYSINFO_0010_xxxx:
	.ds.b	4
SFSYSINFO_0014_xxxx:
	.ds.w	1
SFSYSINFO_0016_ステージ番号:
	.ds.b	4
SFSYSINFO_001a_ラウンド番号:
	.ds.w	1
SFSYSINFO_001c_気絶量減少カウンタ:
	.ds.b	2
SFSYSINFO_001e_デバッグモード有効フラグ:
	.ds.w	1
SFSYSINFO_0020_xxxx:
	.ds.b	6
SFSYSINFO_0026_xxxx:
	.ds.b	2
SFSYSINFO_0028_xxxx:
	.ds.b	4
SFSYSINFO_002c_システムバージョン:
	.ds.b	2
SFSYSINFO_002e_スクリーン周波数:
	.ds.b	4
SFSYSINFO_0032_飛び道具無限:
	.ds.w	1
SFSYSINFO_0034_気絶有効:
	.ds.w	1
SFSYSINFO_0036_ステージループ有効:
	.ds.w	1
SFSYSINFO_0038_1Pダメージ倍率:
	.ds.w	1
SFSYSINFO_003a_xxxx:
	.ds.b	2
SFSYSINFO_003c_MIDIサウンド有効:
	.ds.w	1
SFSYSINFO_003e_スーパーコンボ無限:
	.ds.w	1
SFSYSINFO_0040_変身有効:
	.ds.w	1
SFSYSINFO_0042_2Pダメージ倍率:
	.ds.w	1
SFSYSINFO_0044_xxxx:
	.ds.b	2
SFSYSINFO_0046_時間経過有効:
	.ds.w	1
SFSYSINFO_0048_場面_デモ:
	.ds.w	1
SFSYSINFO_004a_デバッグ_矩形表示有効:
	.ds.w	1
SFSYSINFO_004c_デバッグ_スローモーション有効:
	.ds.w	1
SFSYSINFO_004e_xxxx:
	.ds.b	4
SFSYSINFO_0052_xxxx:
	.ds.b	18
SFSYSINFO_0064_全体ストーリー番号:
	.ds.w	1
SFSYSINFO_0066_xxxx:
	.ds.b	8
SFSYSINFO_006e_xxxx:
	.ds.b	2
SFSYSINFO_0070_XXXX:
	.ds.b	8
SFSYSINFO_0078_ヒットストップ:
	.ds.w	1
SFSYSINFO_007a_セル前面表示フラグ:
	.ds.w	1
SFSYSINFO_007c_xxxx:
	.ds.w	1
SFSYSINFO_007e_xxxx:
	.ds.b	8
SFSYSINFO_0086_xxxx:
	.ds.l	1
SFSYSINFO_008a_xxxx:
	.ds.b	4
SFSYSINFO_008e_xxxx:
	.ds.b	996
SFSYSINFO_0472_xxxx:
	.ds.w	1
SFSYSINFO_0474_場面_エンディング:
	.ds.w	1
SFSYSINFO_0476_xxxx:
	.ds.b	4
SFSYSINFO_047a_現在ステージ番号:
	.ds.w	1
SFSYSINFO_047c_セレクタ動作モード:
	.ds.w	1
SFSYSINFO_047e_ストーリー内最大ステージ数:
	.ds.w	1
SFSYSINFO_0480_最大ストーリー数:
	.ds.w	1
SFSYSINFO_0482_デバッグ_トレーニングモード:
	.ds.b	2
SFSYSINFO_0484_デバッグ_パラメータ表示:
	.ds.w	1
SFSYSINFO_0486_xxxx:
	.ds.w	1
SFSYSINFO_0488_キャラクタディレクトリパス:
	.ds.b	256
SFSYSINFO_0588_ステージディレクトリパス:
	.ds.b	256
SFSYSINFO_0688_xxxディレクトリパス:
	.ds.b	256
L021258:
	.ds.b	256
L021358:
	.ds.b	256
WORK_1P_0000:
	.ds.b	8
WORK_1P_0008_Y座標:
	.ds.b	4
WORK_1P_000c_セレクト番号:
	.ds.b	14
WORK_1P_001a_同キャラ識別番号:
	.ds.w	1
WORK_1P_001c_xxxx:
	.ds.b	8
WORK_1P_0024_xxxx:
	.ds.b	8
L021484:
	.ds.w	1
WORK_1P_002e_残り体力:
	.ds.w	1
WORK_1P_0030_ゲージ体力:
	.ds.b	2
WORK_1P_0032_気絶量:
	.ds.b	398
WORK_1P_01c0_無敵状態:
	.ds.b	6
WORK_1P_01c6_硬直時間:
	.ds.b	6
WORK_1P_01cc_敗北状態:
	.ds.b	1034
WORK_1P_05d6_多重化指定値:
	.ds.b	8
L021a36:
	.ds.b	998
WORK_1P_09c4_VCT_超技ゲージ表示処理:
	.ds.b	4
WORK_1P_09c8_VCT_サブゲージ表示処理:
	.ds.b	26
WORK_1P_09e2_動作ID:
	.ds.w	1
WORK_1P_09e4_複合動作ID:
	.ds.b	6
WORK_1P_09ea_セル番号:
	.ds.b	4
WORK_1P_09ee_カウンタ現在値:
	.ds.w	1
WORK_1P_09f0_防御同期値:
	.ds.b	76
WORK_1P_0a3c_攻撃判定有無:
	.ds.b	8
WORK_1P_0a44_最多ヒット数:
	.ds.w	1
WORK_1P_0a46_威力レベル:
	.ds.b	42
WORK_1P_0a70_ヒット・ガードマークアニメーションカウンタ:
	.ds.b	22
WORK_1P_0a86_CPU制御状態:
	.ds.b	18
WORK_1P_0a98:
	.ds.b	42
WORK_1P_0ac2_気集中:
	.ds.b	8
WORK_1P_0aca_xxxx:
	.ds.b	2
WORK_1P_0acc_スティック直接状態:
	.ds.l	1
WORK_1P_0ad0_xxxx:
	.ds.l	1
WORK_1P_0ad4_トリガー直接状態１:
	.ds.b	1102
WORK_1P_0f22_振動:
	.ds.b	1026
WORK_1P_1324_思考完了:
	.ds.b	1034
L022b86:
	.ds.b	2
WORK_1P_1730_コンボ前体力:
	.ds.b	2
WORK_1P_1732_コンボ数表示_X座標:
	.ds.b	16
WORK_1P_1742_基本技キャンセル設定値:
	.ds.b	18
WORK_1P_1754_xxxx:
	.ds.w	1
WORK_1P_1756_セル非表示フラグ:
	.ds.b	16
L022bbe:
	.ds.l	1
WORK_1P_176a_XXXX:
	.ds.b	67122
WORK_2P_0000:
	.ds.b	6
L0331fa:
	.ds.w	1
WORK_2P_0008_Y座標:
	.ds.b	4
WORK_2P_000c_セレクト番号:
	.ds.b	16
L033210:
	.ds.b	8
WORK_2P_0024_xxxx:
	.ds.b	8
L033220:
	.ds.w	1
L033222:
	.ds.w	1
L033224:
	.ds.b	2
WORK_2P_0032_気絶量:
	.ds.b	404
WORK_2P_01c6_硬直時間:
	.ds.b	6
WORK_2P_01cc_敗北状態:
	.ds.b	1042
L0337d2:
	.ds.b	998
WORK_2P_09c4_VCT_超技ゲージ表示処理:
	.ds.b	4
WORK_2P_09c8_VCT_サブゲージ表示処理:
	.ds.b	26
WORK_2P_09e2_動作ID:
	.ds.b	8
WORK_2P_09ea_セル番号:
	.ds.b	6
L033be4:
	.ds.b	76
L033c30:
	.ds.b	52
WORK_2P_0a70_ヒットマークアニメーションカウンタ:
	.ds.b	22
L033c7a:
	.ds.b	10
L033c84:
	.ds.b	8
WORK_2P_0a98:
	.ds.b	42
WORK_2P_0ac2_気集中:
	.ds.b	8
WORK_2P_0aca_xxxx:
	.ds.b	2
WORK_2P_0acc_スティック直接状態:
	.ds.l	1
WORK_2P_0ad0_xxxx:
	.ds.l	1
L033cc8:
	.ds.b	1102
WORK_2P_キャラ振動フラグ:
	.ds.b	1026
WORK_2P_1324_思考完了:
	.ds.b	1034
L034922:
	.ds.b	2
WORK_2P_1730_コンボ前体力:
	.ds.b	2
WORK_2P_1732_コンボ数表示_X座標:
	.ds.b	34
WORK_2P_1754_xxxx:
	.ds.w	1
WORK_2P_1756_セル非表示フラグ:
	.ds.b	16
L03495a:
	.ds.l	1
WORK_2P_176a_XXXX:
	.ds.b	67122
L044f90:
	.ds.b	6
L044f96:
	.ds.b	2
L044f98:
	.ds.b	2
L044f9a:
	.ds.b	246
WORK_3P_0000:
	.ds.b	8
WORK_3P_0008_Y座標:
	.ds.b	2746
WORK_3P_0ac2_気集中:
	.ds.b	2146
WORK_3P_1324_思考完了フラグ:
	.ds.b	1034
WORK_3P_172e_無敵持続カウンタ:
	.ds.b	38
WORK_3P_1754_xxxx:
	.ds.w	1
WORK_3P_1756_セル非表示フラグ:
	.ds.b	16
L0467f6:
	.ds.b	67126
WORK_4P_0000:
	.ds.b	8
WORK_4P_0008_Y座標:
	.ds.b	2696
WORK_4P_0a90_燃焼状態:
	.ds.b	50
WORK_4P_0ac2_気集中:
	.ds.b	2146
WORK_4P_1324_思考完了フラグ:
	.ds.b	1034
WORK_4P_172e_無敵持続カウンタ:
	.ds.b	38
WORK_4P_1754_xxxx:
	.ds.w	1
WORK_4P_1756_セル非表示フラグ:
	.ds.b	16
L058592:
	.ds.b	67126
SYSCALL_ジャンプテーブル:
	.ds.b	712
L068e90:
	.ds.w	1
L068e92:
	.ds.w	1
L068e94:
	.ds.w	1
L068e96:
	.ds.w	1
L068e98:
	.ds.b	8
L068ea0:
	.ds.b	128
L068f20:
	.ds.b	128
L068fa0:
	.ds.b	128
L069020:
	.ds.b	128
L0690a0:
	.ds.l	1
L0690a4:
	.ds.w	1
L0690a6:
	.ds.l	1
L0690aa:
	.ds.w	1
現在の試合数1桁目:
	.ds.w	1
現在の試合数2桁目:
	.ds.w	1
L0690b0:
	.ds.w	1
L0690b2:
	.ds.w	1
L0690b4:
	.ds.w	1
L0690b6:
	.ds.w	1
L0690b8:
	.ds.w	1
L0690ba:
	.ds.w	1
ラウンドタイマー一の位:
	.ds.w	1
ラウンドタイマー十の位:
	.ds.w	1
ステージリスト格納メモリポインタ:
	.ds.l	1
L0690c4:
	.ds.b	24
L0690dc:
	.ds.b	46
L06910a:
	.ds.b	24
L069122:
	.ds.b	480
一括表示用バッファ_スプライト表示フラグ:
	.ds.b	320
一括表示用バッファ_スプライトパターン番号:
	.ds.b	640
一括表示用バッファ_スプライト座標:
	.ds.b	640
プレイヤー2_燃焼パレットデータ1:
	.ds.b	32
プレイヤー2_燃焼パレットデータ2:
	.ds.b	64
プレイヤー1_燃焼パレットデータ1:
	.ds.b	32
プレイヤー1_燃焼パレットデータ2:
	.ds.b	64
L069a02:
	.ds.b	512
INIメッセージ_ジャンプテーブル:
	.ds.b	1024
L06a002:
	.ds.b	2044
L06a7fe:
	.ds.b	4
MMP_SYS_ジャンプテーブル:	;L06a802
	.ds.b	240
MMP_SYS_0060_STAGE_背景描画:
	.ds.b	4
MMP_SYS_0061_STAGE_背景登場:
	.ds.b	4
MMP_SYS_0062_xxxx:
	.ds.b	4
MMP_SYS_0063_STAGE_再描画:
	.ds.b	28
MMP_SYS_0070_STAGE_ＢＧＭロード:
	.ds.b	4
MMP_SYS_0071_STAGE_ＢＧＭ再生:
	.ds.b	4
MMP_SYS_0072_STAGE_ＢＧＭ変化:
	.ds.b	4
MMP_SYS_0073_STAGE_ＢＧＭフリー:
	.ds.b	28
MMP_SYS_0080_STAGE_ＮＡＭＥロード:
	.ds.b	4
MMP_SYS_0081_STAGE_ＮＡＭＥ再生:
	.ds.b	8
MMP_SYS_0083_STAGE_ＮＡＭＥフリー:
	.ds.b	4
MMP_SYS_0084_STAGE_砂煙設定:
	.ds.b	4
MMP_SYS_0085_STAGE_砂煙表示:
	.ds.b	4
MMP_SYS_0086_STAGE_砂煙ロード:
	.ds.b	4
MMP_SYS_0087_STAGE_影ロード:
	.ds.b	4
MMP_SYS_0088_STAGE_影表示:
	.ds.b	4
MMP_SYS_0089_STAGE_フォントロード:
	.ds.b	248
MMP_SYS_0151_BOOT_標準出力:
	.ds.b	4
MMP_SYS_0152_BOOT_画面クリア:
	.ds.b	4
MMP_SYS_0153_BOOT_カーソル移動:
	.ds.b	28
MMP_SYS_0160_OPEN_タイトル画面:
	.ds.b	360
MMP_SYS_0250_xxxx:
	.ds.b	4
MMP_SYS_0251_xxxx:
	.ds.b	8
MMP_SYS_0253_xxxx:
	.ds.b	4
MMP_SYS_0254_xxxx:
	.ds.b	4
MMP_SYS_0255_xxxx:
	.ds.b	4
MMP_SYS_0256_xxxx:
	.ds.b	356
L06ad66:
	.ds.b	668
L06b002:
	.ds.b	1024
L06b402:
	.ds.b	1024
L06b802:
	.ds.b	1024
L06bc02:
	.ds.b	1024
L06c002:
	.ds.b	2048
MESS_SP_PCGデータ格納領域:
	.ds.b	5120
L06dc02:
	.ds.b	14
L06dc10:
	.ds.b	18
L06dc22:
	.ds.b	6144
L06f422:
	.ds.l	1
L06f426:
	.ds.l	1
L06f42a:
	.ds.w	1
L06f42c:
	.ds.w	1
L06f42e:
	.ds.w	1
L06f430:
	.ds.w	1
L06f432:
	.ds.l	1
L06f436:
	.ds.l	1
グラフィック画面プレーン0座標:
	.ds.b	4
グラフィック画面プレーン1座標:
	.ds.b	4
グラフィック画面プレーン2座標:
	.ds.b	4
グラフィック画面プレーン3座標:
	.ds.b	4
L06f44a:
	.ds.b	4
グラフィック画面表示面:
	.ds.w	1
グラフィック画面最大ページ数:
	.ds.w	1
L06f452:
	.ds.w	1
画面周波数:
	.ds.w	1
スクリーン余白:
	.ds.b	2
L06f458:
	.ds.w	1
L06f45a:
	.ds.b	2
L06f45c:
	.ds.b	2
ラスター割込み処理実行中フラグ:
	.ds.w	1
L06f460:
	.ds.b	66
L06f4a2:
	.ds.b	66
確保メモリサイズ:
	.ds.l	1
確保メモリポインタ:
	.ds.l	1
ラスタースクロール量テーブル:
	.ds.b	4096
L0704ec:
	.ds.b	4224
地面振動_持続サイクル:
	.ds.w	1
地面振動_振幅:
	.ds.w	1
地面振動_周期:
	.ds.w	1
ステージ背景1_X座標:
	.ds.b	2
ステージ背景1_Y座標:
	.ds.w	1
ステージ背景2_X座標:
	.ds.b	2
ステージ背景2_Y座標:
	.ds.w	1
L07157a:
	.ds.b	92
L0715d6:
	.ds.b	92
L071632:
	.ds.l	1
L071636:
	.ds.b	8
L07163e:
	.ds.w	1
L071640:
	.ds.l	1
L071644:
	.ds.b	8
L07164c:
	.ds.l	1
L071650:
	.ds.l	1
ワールドスプライトY座標:
	.ds.w	1
L071656:
	.ds.w	1
L071658:
	.ds.l	1
L07165c:
	.ds.l	1
L071660:
	.ds.b	224
L071740:
	.ds.b	28
L07175c:
	.ds.b	1764
L071e40:
	.ds.b	224
L071f20:
	.ds.b	224
パレットデータ_背景1_カラーA:
	.ds.b	256
L072100:
	.ds.b	256
L072200:
	.ds.b	512
L072400:
	.ds.b	512
L072600:
	.ds.b	512
L072800:
	.ds.b	512
L072a00:
	.ds.b	1024
L072e00:
	.ds.b	512
パレットデータ_背景1_カラーB:
	.ds.b	8192
グラフィックパレットバッファ:
	.ds.b	260
L075104:
	.ds.l	1
L075108:
	.ds.l	1
L07510c:
	.ds.b	22
L075122:
	.ds.b	858
L07547c:
	.ds.w	1
L07547e:
	.ds.l	1
L075482:
	.ds.l	1
L075486:
	.ds.l	1
L07548a:
	.ds.l	1
L07548e:
	.ds.l	1
L075492:
	.ds.l	1
L075496:
	.ds.l	1
L07549a:
	.ds.l	1
L07549e:
	.ds.l	1
L0754a2:
	.ds.l	1
L0754a6:
	.ds.l	1
L0754aa:
	.ds.l	1
L0754ae:
	.ds.l	1
環境変数領域:
	.ds.l	1
L0754b6:
	.ds.l	1
L0754ba:
	.ds.l	1
コマンドライン引数文字列:
	.ds.l	1
L0754c2:
	.ds.l	1
L0754c6:
	.ds.l	1
L0754ca:
	.ds.b	384
L07564a:
	.ds.l	1
L07564e:
	.ds.b	512
L07584e:
	.ds.b	160
L0758ee:

	.end	L01d366
