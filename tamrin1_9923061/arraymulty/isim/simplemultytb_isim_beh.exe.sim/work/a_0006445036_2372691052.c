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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *STD_STANDARD;
extern char *IEEE_P_2592010699;
static const char *ng2 = "C:/Users/erfan/Desktop/hossi/arraymulty/multytb.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2053728113_1035706684(char *, char *, char *, char *, char *, char *);


char *work_a_0006445036_2372691052_sub_1355907332_4163069965(char *t1, char *t2, char *t3, char *t4)
{
    char t5[152];
    char t6[24];
    char t11[16];
    char t34[16];
    char t54[16];
    char *t0;
    char *t7;
    unsigned int t8;
    int t9;
    unsigned int t10;
    char *t12;
    unsigned int t13;
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t35;
    unsigned int t36;
    char *t37;
    char *t38;
    int t39;
    unsigned int t40;
    unsigned char t41;
    char *t42;
    char *t43;
    int t44;
    char *t45;
    int t46;
    char *t47;
    int t48;
    int t49;
    int t50;
    int t51;
    int t52;
    char *t53;
    char *t55;
    char *t56;
    char *t57;
    int t58;
    char *t59;
    int t60;
    int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    unsigned char t65;
    char *t66;
    char *t67;
    char *t68;
    unsigned char t69;
    char *t70;
    char *t71;
    int t72;
    char *t73;
    int t74;
    int t75;
    unsigned int t76;
    char *t77;
    int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;

LAB0:    t7 = (t4 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (t8 - 1);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t10 = (t10 * 1U);
    t12 = (t4 + 12U);
    t13 = *((unsigned int *)t12);
    t14 = (t11 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 1;
    t15 = (t14 + 4U);
    *((unsigned int *)t15) = t13;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t16 = (t13 - 1);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t17;
    t15 = (t5 + 4U);
    t18 = ((STD_STANDARD) + 1008);
    t19 = (t15 + 88U);
    *((char **)t19) = t18;
    t20 = xsi_get_memory(t10);
    t21 = (t15 + 56U);
    *((char **)t21) = t20;
    xsi_type_set_default_value(t18, t20, t11);
    t22 = (t15 + 64U);
    *((char **)t22) = t11;
    t23 = (t15 + 80U);
    *((unsigned int *)t23) = t10;
    t24 = (t15 + 136U);
    *((char **)t24) = t20;
    t25 = (t15 + 124U);
    *((int *)t25) = 0;
    t26 = (t15 + 128U);
    t27 = (t11 + 12U);
    t17 = *((unsigned int *)t27);
    t28 = (t17 - 1);
    *((int *)t26) = t28;
    t29 = (t15 + 120U);
    t31 = (t10 > 2147483644);
    if (t31 == 1)
        goto LAB2;

LAB3:    t32 = (t10 + 3);
    t33 = (t32 / 16);
    t30 = t33;

LAB4:    *((unsigned int *)t29) = t30;
    t35 = (t4 + 12U);
    t36 = *((unsigned int *)t35);
    t37 = (t34 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 1;
    t38 = (t37 + 4U);
    *((unsigned int *)t38) = t36;
    t38 = (t37 + 8U);
    *((int *)t38) = 1;
    t39 = (t36 - 1);
    t40 = (t39 * 1);
    t40 = (t40 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t40;
    t38 = (t6 + 4U);
    t41 = (t3 != 0);
    if (t41 == 1)
        goto LAB6;

LAB5:    t42 = (t6 + 12U);
    *((char **)t42) = t4;
    t43 = (t34 + 8U);
    t44 = *((int *)t43);
    t45 = (t34 + 4U);
    t46 = *((int *)t45);
    t47 = (t34 + 0U);
    t48 = *((int *)t47);
    t49 = t48;
    t50 = t46;

LAB7:    t51 = (t50 * t44);
    t52 = (t49 * t44);
    if (t52 <= t51)
        goto LAB8;

LAB10:    t7 = (t15 + 56U);
    t12 = *((char **)t7);
    t7 = (t11 + 12U);
    t8 = *((unsigned int *)t7);
    t8 = (t8 * 1U);
    t0 = xsi_get_transient_memory(t8);
    memcpy(t0, t12, t8);
    t14 = (t11 + 0U);
    t9 = *((int *)t14);
    t18 = (t11 + 4U);
    t16 = *((int *)t18);
    t19 = (t11 + 8U);
    t28 = *((int *)t19);
    t20 = (t2 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = t9;
    t21 = (t20 + 4U);
    *((int *)t21) = t16;
    t21 = (t20 + 8U);
    *((int *)t21) = t28;
    t39 = (t16 - t9);
    t10 = (t39 * t28);
    t10 = (t10 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t10;

LAB1:    t7 = (t15 + 80);
    t9 = *((int *)t7);
    t12 = (t15 + 136U);
    t14 = *((char **)t12);
    xsi_put_memory(t9, t14);
    return t0;
LAB2:    t30 = 2147483647;
    goto LAB4;

LAB6:    *((char **)t38) = t3;
    goto LAB5;

LAB8:    t53 = ((STD_STANDARD) + 192);
    t55 = ((IEEE_P_2592010699) + 3224);
    t56 = (t3 + 0);
    t57 = (t34 + 0U);
    t58 = *((int *)t57);
    t59 = (t34 + 8U);
    t60 = *((int *)t59);
    t61 = (t49 - t58);
    t40 = (t61 * t60);
    t62 = (1U * t40);
    t63 = (0 + t62);
    t64 = (t56 + t63);
    t65 = *((unsigned char *)t64);
    t66 = xsi_char_to_mem(t65);
    t67 = xsi_string_variable_get_image(t54, t55, t66);
    t68 = xsi_scalar_type_get_value(t53, t67, t54);
    t69 = *((unsigned char *)t68);
    t70 = (t15 + 56U);
    t71 = *((char **)t70);
    t70 = (t11 + 0U);
    t72 = *((int *)t70);
    t73 = (t11 + 8U);
    t74 = *((int *)t73);
    t75 = (t49 - t72);
    t76 = (t75 * t74);
    t77 = (t11 + 4U);
    t78 = *((int *)t77);
    xsi_vhdl_check_range_of_index(t72, t78, t74, t49);
    t79 = (1U * t76);
    t80 = (0 + t79);
    t81 = (t71 + t80);
    *((unsigned char *)t81) = t69;

LAB9:    if (t49 == t50)
        goto LAB10;

LAB11:    t9 = (t49 + t44);
    t49 = t9;
    goto LAB7;

LAB12:;
}

static void work_a_0006445036_2372691052_p_0(char *t0)
{
    char t6[16];
    char t20[16];
    char t22[16];
    char t23[16];
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
    int t14;
    int t15;
    int64 t16;
    char *t17;
    unsigned char t18;
    unsigned int t19;
    int t21;
    char *t24;
    unsigned int t25;
    unsigned int t26;

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng2);
    t2 = (t0 + 5104);
    *((int *)t2) = 0;
    t3 = (t0 + 5108);
    *((int *)t3) = 63;
    t4 = 0;
    t5 = 63;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(98, ng2);

LAB33:    *((char **)t1) = &&LAB34;

LAB1:    return;
LAB5:    xsi_set_current_line(85, ng2);
    t7 = (t0 + 5104);
    t8 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 6);
    t9 = (t0 + 3056);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 6U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(86, ng2);
    t2 = (t0 + 5112);
    *((int *)t2) = 0;
    t3 = (t0 + 5116);
    *((int *)t3) = 63;
    t14 = 0;
    t15 = 63;

LAB8:    if (t14 <= t15)
        goto LAB9;

LAB11:
LAB6:    t2 = (t0 + 5104);
    t4 = *((int *)t2);
    t3 = (t0 + 5108);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB30:    t14 = (t4 + 1);
    t4 = t14;
    t7 = (t0 + 5104);
    *((int *)t7) = t4;
    goto LAB4;

LAB9:    xsi_set_current_line(87, ng2);
    t7 = (t0 + 5112);
    t8 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, *((int *)t7), 6);
    t9 = (t0 + 3120);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t8, 6U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(88, ng2);
    t16 = (0 * 1000LL);
    t2 = (t0 + 2480);
    xsi_process_wait(t2, t16);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 5112);
    t14 = *((int *)t2);
    t3 = (t0 + 5116);
    t15 = *((int *)t3);
    if (t14 == t15)
        goto LAB11;

LAB29:    t21 = (t14 + 1);
    t14 = t21;
    t7 = (t0 + 5112);
    *((int *)t7) = t14;
    goto LAB8;

LAB12:    xsi_set_current_line(89, ng2);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4996U);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 5012U);
    t9 = ieee_p_1242562249_sub_2053728113_1035706684(IEEE_P_1242562249, t6, t3, t2, t8, t7);
    t10 = (t0 + 3184);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t17 = *((char **)t13);
    memcpy(t17, t9, 12U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(90, ng2);
    t16 = (10 * 1000LL);
    t2 = (t0 + 2480);
    xsi_process_wait(t2, t16);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(91, ng2);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t18 = 1;
    if (12U == 12U)
        goto LAB23;

LAB24:    t18 = 0;

LAB25:    if ((!(t18)) != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB10;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(92, ng2);
    t9 = (t0 + 5120);
    xsi_report(t9, 11U, 0);
    xsi_set_current_line(93, ng2);
    t2 = (t0 + 5131);
    t8 = ((STD_STANDARD) + 1008);
    t9 = (t20 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 1;
    t10 = (t9 + 4U);
    *((int *)t10) = 9;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t21 = (9 - 1);
    t19 = (t21 * 1);
    t19 = (t19 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t19;
    t7 = xsi_base_array_concat(t7, t6, t8, (char)99, (unsigned char)9, (char)97, t2, t20, (char)101);
    t10 = (t0 + 1352U);
    t11 = *((char **)t10);
    t10 = (t0 + 5028U);
    t12 = work_a_0006445036_2372691052_sub_1355907332_4163069965(t0, t22, t11, t10);
    t17 = ((STD_STANDARD) + 1008);
    t13 = xsi_base_array_concat(t13, t23, t17, (char)97, t7, t6, (char)97, t12, t22, (char)101);
    t19 = (1U + 9U);
    t24 = (t22 + 12U);
    t25 = *((unsigned int *)t24);
    t25 = (t25 * 1U);
    t26 = (t19 + t25);
    xsi_report(t13, t26, 0);
    xsi_set_current_line(94, ng2);
    t2 = (t0 + 5140);
    t8 = ((STD_STANDARD) + 1008);
    t9 = (t20 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 1;
    t10 = (t9 + 4U);
    *((int *)t10) = 9;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t21 = (9 - 1);
    t19 = (t21 * 1);
    t19 = (t19 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t19;
    t7 = xsi_base_array_concat(t7, t6, t8, (char)99, (unsigned char)9, (char)97, t2, t20, (char)101);
    t10 = (t0 + 1512U);
    t11 = *((char **)t10);
    t10 = (t0 + 5044U);
    t12 = work_a_0006445036_2372691052_sub_1355907332_4163069965(t0, t22, t11, t10);
    t17 = ((STD_STANDARD) + 1008);
    t13 = xsi_base_array_concat(t13, t23, t17, (char)97, t7, t6, (char)97, t12, t22, (char)101);
    t19 = (1U + 9U);
    t24 = (t22 + 12U);
    t25 = *((unsigned int *)t24);
    t25 = (t25 * 1U);
    t26 = (t19 + t25);
    xsi_report(t13, t26, 0);
    goto LAB21;

LAB23:    t19 = 0;

LAB26:    if (t19 < 12U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t2 = (t3 + t19);
    t8 = (t7 + t19);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB24;

LAB28:    t19 = (t19 + 1);
    goto LAB26;

LAB31:    goto LAB2;

LAB32:    goto LAB31;

LAB34:    goto LAB32;

}


extern void work_a_0006445036_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0006445036_2372691052_p_0};
	static char *se[] = {(void *)work_a_0006445036_2372691052_sub_1355907332_4163069965};
	xsi_register_didat("work_a_0006445036_2372691052", "isim/simplemultytb_isim_beh.exe.sim/work/a_0006445036_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
