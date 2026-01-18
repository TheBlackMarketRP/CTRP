Config = {}
Config.Locale = 'en'
Config.Debug = false

Config.TargetScript = 'qb-target' --don't change name if using ox_target

Config.Commands = {
	createchair = 'createchair',
}

--You can set admin in alternative ways-------------------
--Ace Permission
Config.AdminWithAce = true
--Or group (Only works in my qb base)
Config.AdminWithGroup = {
    ['admin'] = true,
    ['god'] = true,
}
--Or license
Config.AdminWithLicense = {
    ['license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'] = true,
}
--Or citizen id
Config.AdminWithIdentifier = {
    ['xxxxxxxx'] = true,
}
----------------------------------------------------------

Config.Controls = {
	leave = 73,
	style = 74,
}

Config.SitEmote = {
	{
		name 	= 'Lean Forward',
		dir 	= 'timetable@ron@ig_3_couch',
		anim 	= 'base',
		offset 	= {f = 0.0, l = 0.0}, -- f->forward, l->left
	},
	{
		name 	= 'Leg Spread',
		dir 	= 'timetable@ron@ig_5_p3',
		anim 	= 'ig_5_p3_base',
		offset 	= {f = 0.2, l = 0.0},
	},
	{
		name 	= 'Leg Crossed',
		dir 	= 'timetable@reunited@ig_10',
		anim 	= 'base_amanda',
		offset 	= {f = 0.3, l = -0.2},
	},
	{
		name 	= 'Leg Crossed 2',
		dir 	= 'mouse@female_smart_sitting_crossed',
		anim 	= 'female_smart_sitting_crossed_clip',
		offset 	= {f = -0.45, l = 0.0},
	},
	{
		name 	= 'Leg Crossed 3',
		dir 	= 'timetable@jimmy@mics3_ig_15@',
		anim 	= 'mics3_15_base_tracy',
		offset 	= {f = 0.32, l = 0.0},
	},
	{
		name 	= 'Lean Side',
		dir 	= 'timetable@ron@ron_ig_2_alt1',
		anim 	= 'ig_2_alt1_base',
		offset 	= {f = 0.0, l = 0.1},
	},
	{
		name 	= 'Smart',
		dir 	= 'mouse@female_smart_sitting',
		anim 	= 'female_smart_sitting_clip',
		offset 	= {f = -0.45, l = 0.0},
	},
	{
		name 	= 'Leaning Forward',
		dir 	= 'mouse@female_sitting_forward',
		anim 	= 'female_sitting_forward_clip',
		offset 	= {f = -0.7, l = 0.0},
	},
	{
		name 	= 'Arms Folded',
		dir 	= 'mouse@female_sitting_folded',
		anim 	= 'female_sitting_folded_clip',
		offset 	= {f = -0.45, l = 0.0},
	},
	{
		name 	= 'Armchair',
		dir 	= 'mouse@femalearmchair',
		anim 	= 'female_armchair_clip_01',
		offset 	= {f = -0.5, l = 0.0},
	},
}

Config.Objects = {
	[`prop_bench_01a`] = vector3(0, 0, 0), --model & offset
	[`prop_bench_01b`] = vector3(0, 0, 0),
	[`prop_bench_01c`] = vector3(0, 0, 0),
	[`prop_bench_02`] = vector3(0, 0, 0),
	[`prop_bench_03`] = vector3(0, 0, 0),
	[`prop_bench_04`] = vector3(0, 0, 0),
	[`prop_bench_05`] = vector3(0, 0, 0),
	[`prop_bench_06`] = vector3(0, 0, 0),
	[`prop_bench_07`] = vector3(0, 0, 0),
	[`prop_bench_08`] = vector3(0, 0, 0),
	[`prop_bench_09`] = vector3(0, 0, 0),
	[`prop_bench_10`] = vector3(0, 0, 0),
	[`prop_bench_11`] = vector3(0, 0, 0),
	[`prop_fib_3b_bench`] = vector3(0, 0, 0),
	[`prop_ld_bench01`] = vector3(0, 0, 0),
	[`prop_wait_bench_01`] = vector3(0, 0, 0),
	[`v_club_stagechair`] = vector3(0, 0, 0),
	[`hei_prop_heist_off_chair`] = vector3(0, 0, 0),
	[`hei_prop_hei_skid_chair`] = vector3(0, 0, 0),
	[`prop_chair_01a`] = vector3(0, 0, 0),
	[`prop_chair_01b`] = vector3(0, 0, 0),
	[`prop_chair_02`] = vector3(0, 0, 0),
	[`prop_chair_03`] = vector3(0, 0, 0),
	[`prop_chair_04a`] = vector3(0, 0, 0),
	[`prop_chair_04b`] = vector3(0, 0, 0),
	[`prop_chair_05`] = vector3(0, 0, 0),
	[`prop_chair_06`] = vector3(0, 0, 0),
	[`prop_chair_07`] = vector3(0, 0, 0),
	[`prop_chair_08`] = vector3(0, 0, 0),
	[`prop_chair_09`] = vector3(0, 0, 0),
	[`prop_chair_10`] = vector3(0, 0, 0),
	[`prop_chateau_chair_01`] = vector3(0, 0, 0),
	[`prop_clown_chair`] = vector3(0, 0, 0),
	[`prop_cs_office_chair`] = vector3(0, 0, 0),
	[`prop_direct_chair_01`] = vector3(0, 0, 0),
	[`prop_direct_chair_02`] = vector3(0, 0, 0),
	[`prop_gc_chair02`] = vector3(0, 0, 0),
	[`prop_off_chair_01`] = vector3(0, 0, 0),
	[`prop_off_chair_03`] = vector3(0, 0, 0),
	[`prop_off_chair_04`] = vector3(0, 0, 0),
	[`prop_off_chair_04b`] = vector3(0, 0, 0),
	[`prop_off_chair_04_s`] = vector3(0, 0, 0),
	[`prop_off_chair_05`] = vector3(0, 0, 0),
	[`prop_old_deck_chair`] = vector3(0, 0, 0),
	[`prop_old_wood_chair`] = vector3(0, 0, 0),
	[`prop_rock_chair_01`] = vector3(0, 0, 0),
	[`prop_skid_chair_01`] = vector3(0, 0, 0),
	[`prop_skid_chair_02`] = vector3(0, 0, 0),
	[`prop_skid_chair_03`] = vector3(0, 0, 0),
	[`prop_sol_chair`] = vector3(0, 0, 0),
	[`prop_wheelchair_01`] = vector3(0, 0, 0),
	[`prop_wheelchair_01_s`] = vector3(0, 0, 0),
	[`p_armchair_01_s`] = vector3(0, 0, 0),
	[`p_clb_officechair_s`] = vector3(0, 0, 0),
	[`p_dinechair_01_s`] = vector3(0, 0, 0),
	[`p_ilev_p_easychair_s`] = vector3(0, 0, 0),
	[`p_soloffchair_s`] = vector3(0, 0, 0),
	[`p_yacht_chair_01_s`] = vector3(0, 0, 0),
	[`v_club_officechair`] = vector3(0, 0, 0),
	[`v_corp_bk_chair3`] = vector3(0, 0, 0),
	[`v_corp_cd_chair`] = vector3(0, 0, 0),
	[`v_corp_offchair`] = vector3(0, 0, 0),
	[`v_ilev_chair02_ped`] = vector3(0, 0, 0),
	[`v_ilev_hd_chair`] = vector3(0, 0, 0),
	[`v_ilev_p_easychair`] = vector3(0, 0, 0),
	[`v_ret_gc_chair03`] = vector3(0, 0, 0),
	[`prop_ld_farm_chair01`] = vector3(0, 0, 0),
	[`prop_table_04_chr`] = vector3(0, 0, 0),
	[`prop_table_05_chr`] = vector3(0, 0, 0),
	[`prop_table_06_chr`] = vector3(0, 0, 0),
	[`v_ilev_leath_chr`] = vector3(0, 0, 0),
	[`prop_table_01_chr_a`] = vector3(0, 0, 0),
	[`prop_table_01_chr_b`] = vector3(0, 0, 0),
	[`prop_table_02_chr`] = vector3(0, 0, 0),
	[`prop_table_03b_chr`] = vector3(0, 0, 0),
	[`prop_table_03_chr`] = vector3(0, 0, 0),
	[`prop_torture_ch_01`] = vector3(0, 0, 0),
	[`v_ilev_fh_dineeamesa`] = vector3(0, 0, 0),
	[`v_ilev_fh_kitchenstool`] = vector3(0, 0, 0.4),
	[`v_ilev_tort_stool`] = vector3(0, 0, 0),
	[`hei_prop_yah_seat_01`] = vector3(0, 0, 0),
	[`hei_prop_yah_seat_02`] = vector3(0, 0, 0),
	[`hei_prop_yah_seat_03`] = vector3(0, 0, 0),
	[`prop_waiting_seat_01`] = vector3(0, 0, 0),
	[`prop_yacht_seat_01`] = vector3(0, 0, 0),
	[`prop_yacht_seat_02`] = vector3(0, 0, 0),
	[`prop_yacht_seat_03`] = vector3(0, 0, 0),
	[`prop_hobo_seat_01`] = vector3(0, 0, 0),
	[`prop_rub_couch01`] = vector3(0, 0, 0),
	[`miss_rub_couch_01`] = vector3(0, 0, 0),
	[`prop_ld_farm_couch01`] = vector3(0, 0, 0),
	[`prop_ld_farm_couch02`] = vector3(0, 0, 0),
	[`prop_rub_couch02`] = vector3(0, 0, 0),
	[`prop_rub_couch03`] = vector3(0, 0, 0),
	[`prop_rub_couch04`] = vector3(0, 0, 0),
	[`p_lev_sofa_s`] = vector3(0, 0, 0),
	[`p_res_sofa_l_s`] = vector3(0, 0, 0),
	[`p_v_med_p_sofa_s`] = vector3(0, 0, 0),
	[`p_yacht_sofa_01_s`] = vector3(0, 0, 0),
	[`v_ilev_m_sofa`] = vector3(0, 0, 0),
	[`v_res_tre_sofa_s`] = vector3(0, 0, 0),
	[`v_tre_sofa_mess_a_s`] = vector3(0, 0, 0),
	[`v_tre_sofa_mess_b_s`] = vector3(0, 0, 0),
	[`v_tre_sofa_mess_c_s`] = vector3(0, 0, 0),
	[`prop_roller_car_01`] = vector3(0, 0, 0),
	[`prop_roller_car_02`] = vector3(0, 0, 0),
	[`v_ret_gc_chair02`] = vector3(0, 0, 0),
	[`v_serv_ct_chair02`] = vector3(0, 0, 0),
	[`v_corp_lazychair`] = vector3(0, 0, 0),
}

Config.ResetAnim = { --reset sit anim if animation cancelled for this animations
	{dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal@', anim = 'drink'},
	{dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', anim = 'drink'},
	{dict = 'amb@world_human_drinking@coffee@male@idle_a', anim = 'idle_a'},
}
