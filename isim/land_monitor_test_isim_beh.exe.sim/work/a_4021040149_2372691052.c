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
static const char *ng0 = "/home/vishwesh/Desktop/Desktop/CS 254 Lab/Agro/land_monitor_test.vhd";



static void work_a_4021040149_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3712);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4536);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3712);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4021040149_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int64 t20;
    int64 t21;

LAB0:    t1 = (t0 + 4152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 8008);
    *((int *)t2) = 0;
    t3 = (t0 + 8012);
    *((int *)t3) = 7;
    t4 = 0;
    t5 = 7;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 4664);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (t20 * 3);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t21);

LAB13:    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(110, ng0);
    t6 = (t0 + 8016);
    t8 = (3U != 3U);
    if (t8 == 1)
        goto LAB8;

LAB9:    t9 = (t0 + 8008);
    t10 = *((int *)t9);
    t11 = (t10 - 0);
    t12 = (t11 * 1);
    t13 = (3U * t12);
    t14 = (0U + t13);
    t15 = (t0 + 4600);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t6, 3U);
    xsi_driver_first_trans_delta(t15, t14, 3U, 0LL);

LAB6:    t2 = (t0 + 8008);
    t4 = *((int *)t2);
    t3 = (t0 + 8012);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB10:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 8008);
    *((int *)t6) = t4;
    goto LAB4;

LAB8:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB9;

LAB11:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4664);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (t20 * 38);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t21);

LAB17:    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

LAB15:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 8019);
    t8 = (3U != 3U);
    if (t8 == 1)
        goto LAB19;

LAB20:    t6 = (t0 + 4600);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 3U);
    xsi_driver_first_trans_delta(t6, 0U, 3U, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 4728);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 7U, 1, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (t20 * 6);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t21);

LAB23:    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

LAB19:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4728);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 7U, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2928U);
    t3 = *((char **)t2);
    t20 = *((int64 *)t3);
    t21 = (t20 * 38);
    t2 = (t0 + 3960);
    xsi_process_wait(t2, t21);

LAB27:    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB22:    goto LAB21;

LAB24:    goto LAB22;

LAB25:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 8022);
    t8 = (3U != 3U);
    if (t8 == 1)
        goto LAB29;

LAB30:    t6 = (t0 + 4600);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t15 = (t9 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 3U);
    xsi_driver_first_trans_delta(t6, 3U, 3U, 0LL);
    xsi_set_current_line(124, ng0);

LAB33:    *((char **)t1) = &&LAB34;
    goto LAB1;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

LAB29:    xsi_size_not_matching(3U, 3U, 0);
    goto LAB30;

LAB31:    goto LAB2;

LAB32:    goto LAB31;

LAB34:    goto LAB32;

}


extern void work_a_4021040149_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4021040149_2372691052_p_0,(void *)work_a_4021040149_2372691052_p_1};
	xsi_register_didat("work_a_4021040149_2372691052", "isim/land_monitor_test_isim_beh.exe.sim/work/a_4021040149_2372691052.didat");
	xsi_register_executes(pe);
}
