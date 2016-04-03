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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/humidity_checker.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3469998511_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned char t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1792U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3304);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 5690);
    *((int *)t3) = 0;
    t4 = (t0 + 5694);
    *((int *)t4) = 7;
    t5 = 0;
    t6 = 7;

LAB5:    if (t5 <= t6)
        goto LAB6;

LAB8:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 5698);
    *((int *)t1) = 0;
    t3 = (t0 + 5702);
    *((int *)t3) = 7;
    t5 = 0;
    t6 = 7;

LAB13:    if (t5 <= t6)
        goto LAB14;

LAB16:    goto LAB3;

LAB6:    xsi_set_current_line(48, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 5690);
    t9 = *((int *)t7);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t7));
    t12 = (8U * t11);
    t13 = (0 + t12);
    t14 = (t8 + t13);
    t15 = (t0 + 1352U);
    t16 = *((char **)t15);
    t15 = (t0 + 5690);
    t17 = *((int *)t15);
    t18 = (t17 - 0);
    t19 = (t18 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t15));
    t20 = (8U * t19);
    t21 = (0 + t20);
    t22 = (t16 + t21);
    t23 = ((IEEE_P_2592010699) + 4000);
    t24 = xsi_vhdl_greater(t23, t14, 8U, t22, 8U);
    if (t24 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 5690);
    t9 = *((int *)t1);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    t12 = (2U * t11);
    t13 = (0U + t12);
    t17 = (0 - 1);
    t19 = (t17 * -1);
    t20 = (1 * t19);
    t21 = (t13 + t20);
    t3 = (t0 + 3384);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t14 = *((char **)t8);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_delta(t3, t21, 1, 0LL);

LAB10:
LAB7:    t1 = (t0 + 5690);
    t5 = *((int *)t1);
    t3 = (t0 + 5694);
    t6 = *((int *)t3);
    if (t5 == t6)
        goto LAB8;

LAB12:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 5690);
    *((int *)t4) = t5;
    goto LAB5;

LAB9:    xsi_set_current_line(49, ng0);
    t25 = (t0 + 5690);
    t26 = *((int *)t25);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    t29 = (2U * t28);
    t30 = (0U + t29);
    t31 = (0 - 1);
    t32 = (t31 * -1);
    t33 = (1 * t32);
    t34 = (t30 + t33);
    t35 = (t0 + 3384);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    *((unsigned char *)t39) = (unsigned char)2;
    xsi_driver_first_trans_delta(t35, t34, 1, 0LL);
    goto LAB10;

LAB14:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 1192U);
    t7 = *((char **)t4);
    t4 = (t0 + 5698);
    t9 = *((int *)t4);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t4));
    t12 = (8U * t11);
    t13 = (0 + t12);
    t8 = (t7 + t13);
    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t14 = (t0 + 5698);
    t17 = *((int *)t14);
    t18 = (t17 - 0);
    t19 = (t18 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t14));
    t20 = (8U * t19);
    t21 = (0 + t20);
    t16 = (t15 + t21);
    t22 = ((IEEE_P_2592010699) + 4000);
    t2 = xsi_vhdl_greater(t22, t8, 8U, t16, 8U);
    if (t2 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 5698);
    t9 = *((int *)t1);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    t12 = (2U * t11);
    t13 = (0U + t12);
    t17 = (1 - 1);
    t19 = (t17 * -1);
    t20 = (1 * t19);
    t21 = (t13 + t20);
    t3 = (t0 + 3384);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t14 = *((char **)t8);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_delta(t3, t21, 1, 0LL);

LAB18:
LAB15:    t1 = (t0 + 5698);
    t5 = *((int *)t1);
    t3 = (t0 + 5702);
    t6 = *((int *)t3);
    if (t5 == t6)
        goto LAB16;

LAB20:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 5698);
    *((int *)t4) = t5;
    goto LAB13;

LAB17:    xsi_set_current_line(57, ng0);
    t23 = (t0 + 5698);
    t26 = *((int *)t23);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    t29 = (2U * t28);
    t30 = (0U + t29);
    t31 = (1 - 1);
    t32 = (t31 * -1);
    t33 = (1 * t32);
    t34 = (t30 + t33);
    t25 = (t0 + 3384);
    t35 = (t25 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    *((unsigned char *)t38) = (unsigned char)3;
    xsi_driver_first_trans_delta(t25, t34, 1, 0LL);
    goto LAB18;

}


extern void work_a_3469998511_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3469998511_3212880686_p_0};
	xsi_register_didat("work_a_3469998511_3212880686", "isim/humidity_checker_test_isim_beh.exe.sim/work/a_3469998511_3212880686.didat");
	xsi_register_executes(pe);
}
