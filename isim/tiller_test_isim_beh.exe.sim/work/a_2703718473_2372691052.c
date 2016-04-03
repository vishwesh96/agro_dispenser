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
static const char *ng0 = "/home/gowtham/Desktop/acads/sem4/CS254/project/agro_dispenser/tiller_test.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_2255506239096166994_3965413181(char *, char *, char *, char *, int );


static void work_a_2703718473_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3352);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2448U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3352);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2703718473_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;

LAB0:    t1 = (t0 + 3792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4504);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(106, ng0);
    t7 = (15 * 1000LL);
    t2 = (t0 + 3600);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 4504);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(108, ng0);
    t7 = (1000 * 1000LL);
    t2 = (t0 + 3600);
    xsi_process_wait(t2, t7);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2703718473_2372691052_p_2(char *t0)
{
    char t11[16];
    char t16[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    unsigned char t6;
    char *t7;
    int t8;
    int t9;
    char *t10;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    char *t23;
    int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 1792U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 1792U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    t6 = (!(t2));
    if (t6 != 0)
        goto LAB15;

LAB17:
LAB16:
LAB3:    t1 = (t0 + 4360);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(115, ng0);
    t3 = (t0 + 2568U);
    t4 = *((char **)t3);
    t5 = *((int *)t4);
    t6 = (t5 != 15);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 7836);
    *((int *)t1) = 0;
    t3 = (t0 + 7840);
    *((int *)t3) = 7;
    t5 = 0;
    t8 = 7;

LAB8:    if (t5 <= t8)
        goto LAB9;

LAB11:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(116, ng0);
    t3 = (t0 + 2568U);
    t7 = *((char **)t3);
    t8 = *((int *)t7);
    t9 = (t8 + 1);
    t3 = (t0 + 2568U);
    t10 = *((char **)t3);
    t3 = (t10 + 0);
    *((int *)t3) = t9;
    goto LAB6;

LAB9:    xsi_set_current_line(120, ng0);
    t4 = (t0 + 1192U);
    t7 = *((char **)t4);
    t4 = (t0 + 7836);
    t9 = *((int *)t4);
    t12 = (t9 - 0);
    t13 = (t12 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, *((int *)t4));
    t14 = (8U * t13);
    t15 = (0 + t14);
    t10 = (t7 + t15);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 7;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 7);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t18 = ieee_p_3620187407_sub_2255506239096166994_3965413181(IEEE_P_3620187407, t11, t10, t16, 1);
    t21 = (t11 + 12U);
    t20 = *((unsigned int *)t21);
    t22 = (1U * t20);
    t2 = (8U != t22);
    if (t2 == 1)
        goto LAB12;

LAB13:    t23 = (t0 + 7836);
    t24 = *((int *)t23);
    t25 = (t24 - 0);
    t26 = (t25 * 1);
    t27 = (8U * t26);
    t28 = (0U + t27);
    t29 = (t0 + 4568);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t18, 8U);
    xsi_driver_first_trans_delta(t29, t28, 8U, 0LL);

LAB10:    t1 = (t0 + 7836);
    t5 = *((int *)t1);
    t3 = (t0 + 7840);
    t8 = *((int *)t3);
    if (t5 == t8)
        goto LAB11;

LAB14:    t9 = (t5 + 1);
    t5 = t9;
    t4 = (t0 + 7836);
    *((int *)t4) = t5;
    goto LAB8;

LAB12:    xsi_size_not_matching(8U, t22, 0);
    goto LAB13;

LAB15:    xsi_set_current_line(125, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t3 = (t0 + 4632);
    t7 = (t3 + 56U);
    t10 = *((char **)t7);
    t17 = (t10 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t4, 8U);
    xsi_driver_first_trans_fast(t3);
    goto LAB16;

}


extern void work_a_2703718473_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2703718473_2372691052_p_0,(void *)work_a_2703718473_2372691052_p_1,(void *)work_a_2703718473_2372691052_p_2};
	xsi_register_didat("work_a_2703718473_2372691052", "isim/tiller_test_isim_beh.exe.sim/work/a_2703718473_2372691052.didat");
	xsi_register_executes(pe);
}
