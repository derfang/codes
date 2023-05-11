/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/decoderx2/decoderx2TB.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1570693639_2372691052_p_0(char *t0)
{
    char t6[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int64 t14;
    int t15;

LAB0:    t1 = (t0 + 1528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 3033);
    *((int *)t2) = 0;
    t3 = (t0 + 3037);
    *((int *)t3) = 3;
    t4 = 0;
    t5 = 3;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3041);
    *((int *)t2) = 0;
    t3 = (t0 + 3045);
    *((int *)t3) = 3;
    t4 = 0;
    t5 = 3;

LAB13:    if (t4 <= t5)
        goto LAB14;

LAB16:    xsi_set_current_line(60, ng0);

LAB24:    *((char **)t1) = &&LAB25;

LAB1:    return;
LAB5:    xsi_set_current_line(50, ng0);
    t7 = (t0 + 3033);
    t8 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 2);
    t9 = (t0 + 1760);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 2U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(51, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 1428);
    xsi_process_wait(t2, t14);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 3033);
    t4 = *((int *)t2);
    t3 = (t0 + 3037);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB12:    t15 = (t4 + 1);
    t4 = t15;
    t7 = (t0 + 3033);
    *((int *)t7) = t4;
    goto LAB4;

LAB8:    goto LAB6;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB14:    xsi_set_current_line(56, ng0);
    t7 = (t0 + 3041);
    t8 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 3);
    t9 = (t0 + 1796);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 3U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(57, ng0);
    t14 = (10 * 1000LL);
    t2 = (t0 + 1428);
    xsi_process_wait(t2, t14);

LAB19:    *((char **)t1) = &&LAB20;
    goto LAB1;

LAB15:    t2 = (t0 + 3041);
    t4 = *((int *)t2);
    t3 = (t0 + 3045);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB16;

LAB21:    t15 = (t4 + 1);
    t4 = t15;
    t7 = (t0 + 3041);
    *((int *)t7) = t4;
    goto LAB13;

LAB17:    goto LAB15;

LAB18:    goto LAB17;

LAB20:    goto LAB18;

LAB22:    goto LAB2;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

}


extern void work_a_1570693639_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1570693639_2372691052_p_0};
	xsi_register_didat("work_a_1570693639_2372691052", "isim/decoderx2TB_isim_beh.exe.sim/work/a_1570693639_2372691052.didat");
	xsi_register_executes(pe);
}
