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
static const char *ng0 = "E:/MUX4x2/mux4x2.vhd";



static void work_a_4211063042_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 1712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 960U);
    t3 = *((char **)t2);
    t2 = (t0 + 3058);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB9:    t6 = (t0 + 3060);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB10:    t9 = (t0 + 3062);
    t11 = xsi_mem_cmp(t9, t3, 2U);
    if (t11 == 1)
        goto LAB7;

LAB11:
LAB8:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 868U);
    t3 = *((char **)t2);
    t2 = (t0 + 1952);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 2U);
    xsi_driver_first_trans_fast_port(t2);

LAB4:    xsi_set_current_line(16, ng0);

LAB15:    t2 = (t0 + 1908);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB16;

LAB1:    return;
LAB5:    xsi_set_current_line(16, ng0);
    t12 = (t0 + 592U);
    t13 = *((char **)t12);
    t12 = (t0 + 1952);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t13, 2U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB4;

LAB6:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 684U);
    t3 = *((char **)t2);
    t2 = (t0 + 1952);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 2U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB7:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 776U);
    t3 = *((char **)t2);
    t2 = (t0 + 1952);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 2U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB12:;
LAB13:    t3 = (t0 + 1908);
    *((int *)t3) = 0;
    goto LAB2;

LAB14:    goto LAB13;

LAB16:    goto LAB14;

}


extern void work_a_4211063042_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4211063042_3212880686_p_0};
	xsi_register_didat("work_a_4211063042_3212880686", "isim/MUX4x2TB_isim_beh.exe.sim/work/a_4211063042_3212880686.didat");
	xsi_register_executes(pe);
}
