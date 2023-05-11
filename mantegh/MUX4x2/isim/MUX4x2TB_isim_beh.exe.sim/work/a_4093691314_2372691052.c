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
static const char *ng0 = "E:/MUX4x2/MUX4x2TB.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_4093691314_2372691052_p_0(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    char *t12;
    char *t13;
    int64 t14;
    int t15;

LAB0:    t1 = (t0 + 1712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3348);
    t4 = (t0 + 1944);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3350);
    t4 = (t0 + 1980);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3352);
    t4 = (t0 + 2016);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3354);
    t4 = (t0 + 2052);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 3356);
    *((int *)t2) = 0;
    t3 = (t0 + 3360);
    *((int *)t3) = 3;
    t9 = 0;
    t10 = 3;

LAB4:    if (t9 <= t10)
        goto LAB5;

LAB7:    xsi_set_current_line(64, ng0);

LAB15:    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB5:    xsi_set_current_line(61, ng0);
    t4 = (t0 + 3356);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t11, *((int *)t4), 2);
    t6 = (t0 + 2088);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 2U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(62, ng0);
    t14 = (100 * 1000LL);
    t2 = (t0 + 1612);
    xsi_process_wait(t2, t14);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB6:    t2 = (t0 + 3356);
    t9 = *((int *)t2);
    t3 = (t0 + 3360);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB7;

LAB12:    t15 = (t9 + 1);
    t9 = t15;
    t4 = (t0 + 3356);
    *((int *)t4) = t9;
    goto LAB4;

LAB8:    goto LAB6;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}


extern void work_a_4093691314_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4093691314_2372691052_p_0};
	xsi_register_didat("work_a_4093691314_2372691052", "isim/MUX4x2TB_isim_beh.exe.sim/work/a_4093691314_2372691052.didat");
	xsi_register_executes(pe);
}
