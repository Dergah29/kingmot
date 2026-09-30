slot0 = {
	first_move_time = 0,
	module_id_l = "",
	skin_name_ru = "",
	skin_scene_imge1 = "",
	skin_interface_time = 0,
	furnace_module_id_ru = "",
	BoxColliderWidth = 0,
	skin_icon_ru = "",
	module_id_m = "",
	go_move_israndom = 0,
	return_random = 0,
	Is3DModel = 0,
	skin_scene_effect = "",
	skin_interface_imge1 = "",
	attack_offset = 0,
	skin_designer = 0,
	HasAttackAnim02 = 0,
	module_id_l_ru = "",
	module_id_ru = "",
	module_scale = 0,
	skin_attack_sound = "",
	skin_scene_imge2_ru = "",
	skin_scene_effect_ru = "",
	skin_interface_effect = "",
	law_module_id_ru = "",
	movecity_showcity_time = 0,
	skin_launch_sound = "",
	file_npc_turn = 0,
	law_module_id = "",
	HasAttackAnim = 0,
	skin_interface_effect_ru = "",
	get_show = "",
	furnace_module_id = "",
	skin_name = "",
	law_module_id_festival = "",
	skin_scene_imge1_ru = "",
	second_move_time = 0,
	second_change_time = 0,
	skin_interface_time2 = 0,
	skin_interface_imge1_ru = "",
	BoxColliderHeight = 0,
	module_id = "",
	get_show_ru = "",
	move_random = 0,
	CollisionAreaLength = 0,
	CollisionAreaWidth = 0,
	module_id_m_ru = "",
	skin_icon = "",
	skin_scene_imge2 = "",
	designer_name = "",
	skin_move_sound = "",
	delay_show_march_topui = 0,
	skin_attack_sound2 = "",
	first_change_time = 0,
	march_camera_follow_type = 0,
	condition = {
		1,
		0
	},
	skin_interface_imge2 = {},
	skin_interface_imge3 = {},
	skin_interface_imge4 = {},
	skin_interface_imge6 = {},
	skin_interface_imge7 = {},
	skin_interface_imge8 = {},
	skin_interface_imge8_ar = {},
	skin_interface_imge9 = {},
	skin_interface_imge10 = {},
	skin_interface_imge11 = {},
	skin_scene_imge3 = {},
	expression_group_offset = {},
	expression_offset = {},
	file_scenes_id = {},
	random_off = {},
	skin_btn_group_offset = {},
	file_action_id = {},
	file_module_id = {},
	file_ui_color_gradient1 = {},
	special_slg_anim_names = {},
	special_slg_anim_names_time = {},
	Video = {},
	day_city_background = {},
	day_wild_background = {},
	night_city_background = {},
	night_wild_background = {},
	skin_interface_imge2_ru = {},
	skin_interface_imge3_ru = {},
	skin_interface_imge7_ru = {},
	skin_scene_imge3_ru = {}
}
slot1 = {
	dup1 = {
		1,
		999
	},
	dup2 = {
		1,
		9999
	},
	dup3 = {
		0,
		0.8,
		0
	},
	dup4 = {
		0.3,
		1.1,
		0
	},
	dup5 = {
		0.3,
		0.9,
		0
	},
	dup6 = {
		0.45,
		0.8,
		0
	},
	dup7 = {
		0.5,
		0.8,
		0
	},
	dup8 = {
		0.3,
		1,
		0
	},
	dup9 = {
		0.8,
		1.8,
		0
	},
	dup10 = {
		0,
		80
	},
	dup11 = {
		0,
		55
	},
	dup12 = {
		0,
		60
	},
	dup13 = {
		0,
		270
	},
	dup14 = {
		0,
		180
	},
	dup15 = {
		0,
		70
	},
	dup16 = {
		0,
		120
	},
	dup17 = {
		0,
		300
	},
	dup18 = {
		"sit"
	}
}
slot3 = "__key"

slot4 = function(slot0, slot1)
	for slot5, slot6 in pairs(uv0) do
		slot6[uv1] = slot5
	end

	return slot0[uv1]
end

slot5 = "__clone"

slot6 = function(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0) do
		slot2[slot6] = slot7
	end

	for slot6, slot7 in pairs(uv0) do
		if not slot2[slot6] then
			slot2[slot6] = slot7
		end
	end

	if not slot2[uv1] then
		slot2[uv1] = uv2(slot0, slot1)
	end

	return slot2
end

slot7 = "setValue"

slot8 = function(slot0, slot1, slot2)
	rawset(slot0, slot1, slot2)
end

slot9 = {}
slot10 = "__base"

slot11 = function(slot0, slot1)
	if not uv0[slot1] then
		slot2 = {}
		uv0[slot1] = slot2

		setmetatable(slot2, {
			__index = slot0
		})
	end

	return slot2
end

slot12 = {
	__index = function (slot0, slot1)
		if uv0[slot1] then
			return slot2
		end

		if slot1 == uv1 then
			return uv2(slot0, slot1)
		elseif slot1 == uv3 then
			return uv4(slot0, slot1)
		elseif slot1 == uv5 then
			return uv6(slot0, slot1)
		elseif slot1 == uv7 then
			return uv8
		end
	end,
	__newindex = function (slot0, slot1, slot2)
		if slot1 == uv0 then
			rawset(slot0, slot1, slot2)
		else
			error("Attempt to modify read-only table")
		end
	end
}

for slot16, slot17 in pairs({
	[6020010] = {
		skin_icon = "skin_icon_6020010",
		skin_interface_time = 5,
		skin_scene_effect = "fx_world_qianyi_jxm",
		skin_name = "skin_design_6020010",
		skin_move_sound = "slg_se_relocation_snowflake"
	},
	[6020050] = {
		get_show = "item_icon_304505",
		skin_icon = "skin_icon_6020050",
		skin_scene_effect = "fx_dress_qiancheng_teleporter_supremacy_gx_01",
		movecity_showcity_time = 3.45,
		skin_interface_time = 5,
		skin_name = "skin_design_6020050",
		skin_move_sound = "slg_se_relocation_supremacy"
	},
	[6020060] = {
		get_show = "item_icon_783001",
		skin_icon = "skin_icon_6020060",
		skin_scene_effect = "fx_dress_qiancheng_2026arsenal_league_gx",
		movecity_showcity_time = 1.6,
		skin_interface_time = 5,
		skin_name = "skin_design_6020060",
		skin_move_sound = "slg_se_relocation_2026arsenal_league"
	},
	[6020070] = {
		get_show = "item_icon_783002",
		skin_icon = "skin_icon_6020070",
		skin_scene_effect = "fx_dress_frozenplanet_qiancheng_xsp",
		movecity_showcity_time = 3.1,
		skin_interface_time = 5,
		skin_name = "skin_design_6020070",
		skin_move_sound = "slg_se_relocation_planet"
	},
	[6050010] = {
		skin_name = "skin_design_6050010",
		skin_icon = "skin_icon_6050010",
		skin_interface_imge6 = {
			"decorate_background_6050010"
		},
		skin_interface_imge8 = {
			"decorate_background_6050010"
		},
		skin_interface_imge8_ar = {
			"decorate_background_6050010"
		},
		skin_interface_imge9 = {
			"decorate_background_6050010"
		}
	},
	[6050020] = {
		skin_interface_effect = "fx_dress_baozhuzhan_tqcj_gx_01",
		skin_icon = "skin_icon_6050020",
		get_show = "item_icon_305502",
		skin_name = "skin_design_6050020",
		skin_interface_imge6 = {
			"decorate_background_6050020_002"
		},
		skin_interface_imge8 = {
			"decorate_background_6050020",
			"decorate_background_6050020_001"
		},
		skin_interface_imge8_ar = {
			"decorate_background_6050020",
			"decorate_background_6050020_001"
		},
		skin_interface_imge9 = {
			"decorate_background_6050020",
			"decorate_background_6050020_001"
		},
		file_scenes_id = {
			"supremacy_exhibit_scene"
		},
		file_action_id = slot1.dup18,
		Video = {
			"pv_supremacywar"
		}
	},
	[6050030] = {
		skin_interface_effect = "fx_dress_frozenplanet_gx",
		skin_icon = "skin_icon_6050030",
		get_show = "item_icon_783401",
		skin_name = "skin_design_6050030",
		skin_interface_imge6 = {
			"decorate_background_6050030_002"
		},
		skin_interface_imge8 = {
			"decorate_background_6050030",
			"decorate_background_6050030_001"
		},
		skin_interface_imge8_ar = {
			"decorate_background_6050030",
			"decorate_background_6050030_001"
		},
		skin_interface_imge9 = {
			"decorate_background_6050030",
			"decorate_background_6050030_001"
		},
		file_scenes_id = {
			"frozenplanet_exhibit_scene"
		},
		file_action_id = slot1.dup18
	},
	[6000010] = {
		skin_name = "skin_design_6000010"
	},
	[6000020] = {
		skin_scene_imge1 = "castle_dress_1",
		law_module_id = "skin_anim_building_furnace_winterpageant_law_decorate",
		get_show = "item_icon_302502",
		furnace_module_id = "skin_anim_building_furnace_winterpageant",
		skin_icon = "skin_icon_6000020",
		skin_name = "skin_design_6000020",
		module_id = "castle_dress_1",
		skin_interface_time = 5.61
	},
	[6000030] = {
		skin_scene_imge1 = "castle_dress_2",
		law_module_id = "skin_anim_building_furnace_alliancehegemony_law_decorate",
		get_show = "item_icon_302504",
		furnace_module_id = "skin_anim_building_furnace_alliancehegemony",
		skin_icon = "skin_icon_6000030",
		skin_name = "skin_design_6000030",
		module_id = "castle_dress_2",
		skin_interface_time = 4
	},
	[6000040] = {
		skin_scene_imge1 = "castle_dress_3",
		law_module_id = "skin_anim_building_furnace_competitivestar_law_decorate",
		skin_scene_imge1_ru = "castle_dress_3_ru",
		module_id = "castle_dress_3",
		module_id_ru = "castle_dress_3_ru",
		skin_icon = "skin_icon_6000040",
		get_show_ru = "item_icon_302505_ru",
		skin_icon_ru = "skin_icon_6000040_ru",
		furnace_module_id_ru = "skin_anim_building_furnace_competitivestar_ru",
		get_show = "item_icon_302505",
		furnace_module_id = "skin_anim_building_furnace_competitivestar",
		skin_name = "skin_design_6000040",
		skin_interface_time = 4
	},
	[6000050] = {
		skin_scene_imge1 = "castle_dress_4",
		law_module_id = "skin_anim_building_furnace_forgecity_law_decorate",
		get_show = "item_icon_302507",
		furnace_module_id = "skin_anim_building_furnace_forgecity",
		skin_icon = "skin_icon_6000050",
		skin_name = "skin_design_6000050",
		module_id = "castle_dress_4",
		skin_interface_time = 4
	},
	[6000060] = {
		skin_scene_imge1 = "castle_dress_5",
		law_module_id = "skin_anim_building_furnace_windmillstown_law_decorate",
		get_show = "item_icon_302508",
		furnace_module_id = "skin_anim_building_furnace_windmillstown",
		skin_icon = "skin_icon_6000060",
		skin_name = "skin_design_6000060",
		module_id = "castle_dress_5",
		skin_interface_time = 5.34
	},
	[6000070] = {
		skin_scene_imge1 = "castle_dress_6",
		law_module_id = "skin_anim_building_furnace_sunlight_law_decorate",
		skin_scene_imge1_ru = "castle_dress_6_ru",
		module_id = "castle_dress_6",
		module_id_ru = "castle_dress_6_ru",
		skin_icon = "skin_icon_6000070",
		get_show_ru = "item_icon_302509_ru",
		skin_icon_ru = "skin_icon_6000070_ru",
		furnace_module_id_ru = "skin_anim_building_furnace_sunlight_ru",
		get_show = "item_icon_302509",
		furnace_module_id = "skin_anim_building_furnace_sunlight",
		skin_name = "skin_design_6000070",
		skin_interface_time = 5.32
	},
	[6000080] = {
		skin_scene_imge1 = "castle_dress_7",
		law_module_id = "skin_anim_building_furnace_empty",
		skin_scene_imge1_ru = "castle_dress_7_ru",
		module_id = "castle_dress_7",
		module_id_ru = "castle_dress_7_ru",
		skin_icon = "skin_icon_6000080",
		furnace_module_id_ru = "skin_anim_building_furnace_easter_ru",
		get_show = "item_icon_302510",
		furnace_module_id = "skin_anim_building_furnace_easter",
		skin_name = "skin_design_6000080",
		skin_interface_time = 4.8
	},
	[6000090] = {
		skin_scene_imge1 = "castle_dress_8",
		law_module_id = "skin_anim_building_furnace_strongest_state_law_decorate",
		skin_scene_imge1_ru = "castle_dress_8_ru",
		module_id = "castle_dress_8",
		module_id_ru = "castle_dress_8_ru",
		skin_icon = "skin_icon_6000090",
		get_show_ru = "item_icon_302514_ru",
		skin_icon_ru = "skin_icon_6000090_ru",
		furnace_module_id_ru = "skin_anim_building_furnace_strongest_state_ru",
		get_show = "item_icon_302514",
		furnace_module_id = "skin_anim_building_furnace_strongest_state",
		skin_name = "skin_design_6000090",
		skin_interface_time = 4
	},
	[6000100] = {
		skin_scene_imge1 = "castle_dress_9",
		law_module_id = "skin_anim_building_furnace_childrens_day_law_decorate",
		skin_scene_imge1_ru = "castle_dress_9_ru",
		module_id = "castle_dress_9",
		module_id_ru = "castle_dress_9_ru",
		skin_icon = "skin_icon_6000100",
		furnace_module_id_ru = "skin_anim_building_furnace_childrens_day_ru",
		get_show = "item_icon_302516",
		furnace_module_id = "skin_anim_building_furnace_childrens_day",
		skin_name = "skin_design_6000100",
		skin_interface_time = 7.33
	},
	[6000110] = {
		skin_scene_imge1 = "castle_dress_10",
		law_module_id = "skin_anim_building_furnace_dragon_law_decorate",
		get_show = "item_icon_302520",
		furnace_module_id = "skin_anim_building_furnace_dragon",
		skin_icon = "skin_icon_6000110",
		skin_name = "skin_design_6000110",
		module_id = "castle_dress_10",
		skin_interface_time = 4
	},
	[6000120] = {
		skin_scene_imge1 = "castle_dress_11",
		law_module_id = "skin_anim_building_furnace_barque_law_decorate",
		get_show = "item_icon_302521",
		furnace_module_id = "skin_anim_building_furnace_barque",
		skin_icon = "skin_icon_6000120",
		skin_name = "skin_design_6000120",
		module_id = "castle_dress_11",
		skin_interface_time = 4
	},
	[6000130] = {
		skin_scene_imge1 = "castle_dress_12",
		law_module_id = "skin_anim_building_furnace_atlantis_law_decorate",
		get_show = "item_icon_302525",
		furnace_module_id = "skin_anim_building_furnace_atlantis",
		skin_icon = "skin_icon_6000130",
		skin_name = "skin_design_6000130",
		module_id = "castle_dress_12",
		skin_interface_time = 5
	},
	[6000140] = {
		skin_scene_imge1 = "castle_dress_13",
		law_module_id = "skin_anim_building_furnace_lost_temple_law_decorate",
		get_show = "item_icon_302529",
		furnace_module_id = "skin_anim_building_furnace_lost_temple",
		skin_icon = "skin_icon_6000140",
		skin_name = "skin_design_6000140",
		module_id = "castle_dress_13",
		skin_interface_time = 5.34
	},
	[6000150] = {
		skin_scene_imge1 = "castle_dress_14",
		law_module_id = "skin_anim_building_furnace_empty",
		module_id = "castle_dress_14",
		skin_icon = "skin_icon_6000150",
		get_show = "item_icon_302533",
		furnace_module_id = "skin_anim_building_furnace_2025Halloween",
		skin_name = "skin_design_6000150",
		skin_interface_time = 5.9,
		day_city_background = {
			"2",
			"bg_castle_dress_14_01"
		},
		day_wild_background = {
			"2",
			"bg_castle_dress_14_02"
		},
		night_city_background = {
			"2",
			"bg_castle_dress_14_01"
		},
		night_wild_background = {
			"2",
			"bg_castle_dress_14_02"
		}
	},
	[6000160] = {
		skin_scene_imge1 = "castle_dress_26",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302537",
		furnace_module_id = "skin_anim_building_furnace_2025Thanksgiving",
		skin_icon = "skin_icon_6000160",
		skin_name = "skin_design_6000160",
		module_id = "castle_dress_26",
		skin_interface_time = 5.01
	},
	[6000170] = {
		skin_scene_imge1 = "castle_dress_17",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302541",
		furnace_module_id = "skin_anim_building_furnace_2025food",
		skin_icon = "skin_icon_6000170",
		skin_name = "skin_design_6000170",
		module_id = "castle_dress_17",
		skin_interface_time = 6
	},
	[6000180] = {
		skin_scene_imge1 = "castle_dress_18",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302545",
		furnace_module_id = "skin_anim_building_furnace_2025moon",
		skin_icon = "skin_icon_6000180",
		skin_name = "skin_design_6000180",
		module_id = "castle_dress_18",
		skin_interface_time = 10.5
	},
	[6000190] = {
		skin_scene_imge1 = "castle_dress_15",
		law_module_id = "skin_anim_building_furnace_heartballoon_law_decorate",
		get_show = "item_icon_302549",
		furnace_module_id = "skin_anim_building_furnace_heartballoon",
		skin_icon = "skin_icon_6000190",
		skin_name = "skin_design_6000190",
		module_id = "castle_dress_15",
		skin_interface_time = 5
	},
	[6000200] = {
		skin_scene_imge1 = "castle_dress_20",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302553",
		furnace_module_id = "skin_anim_building_furnace_mushroom_town",
		skin_icon = "skin_icon_6000200",
		skin_name = "skin_design_6000200",
		module_id = "castle_dress_20",
		skin_interface_time = 5
	},
	[6000210] = {
		skin_scene_imge1 = "castle_dress_37",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302557",
		furnace_module_id = "skin_anim_building_furnace_1st",
		skin_icon = "skin_icon_6000210",
		skin_name = "skin_design_6000210",
		module_id = "castle_dress_37",
		skin_interface_time = 5
	},
	[6000220] = {
		skin_scene_imge1 = "castle_dress_21",
		law_module_id = "skin_anim_building_furnace_empty",
		skin_scene_imge1_ru = "castle_dress_21_ru",
		module_id = "castle_dress_21",
		module_id_ru = "castle_dress_21_ru",
		skin_icon = "skin_icon_6000220",
		furnace_module_id_ru = "skin_anim_building_furnace_frozenplanet_ru",
		get_show = "item_icon_302561",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet",
		skin_name = "skin_design_6000220",
		skin_interface_time = 5
	},
	[6000230] = {
		skin_scene_imge1 = "castle_dress_22",
		law_module_id = "skin_anim_building_furnace_easter_egg_law_decorate",
		get_show = "item_icon_302565",
		furnace_module_id = "skin_anim_building_furnace_easter_egg",
		skin_icon = "skin_icon_6000230",
		skin_name = "skin_design_6000230",
		module_id = "castle_dress_22",
		skin_interface_time = 5
	},
	[6000240] = {
		skin_scene_imge1 = "castle_dress_23",
		law_module_id = "skin_anim_building_furnace_loong_castle_law_decorate",
		get_show = "item_icon_302569",
		furnace_module_id = "skin_anim_building_furnace_loong_castle",
		skin_icon = "skin_icon_6000240",
		skin_name = "skin_design_6000240",
		module_id = "castle_dress_23",
		skin_interface_time = 5
	},
	[6000250] = {
		skin_scene_imge1 = "castle_dress_24",
		law_module_id = "skin_anim_building_furnace_circus_castle_law_decorate",
		get_show = "item_icon_302573",
		furnace_module_id = "skin_anim_building_furnace_circus_castle",
		skin_icon = "skin_icon_6000250",
		skin_name = "skin_design_6000250",
		module_id = "castle_dress_24",
		skin_interface_time = 5
	},
	[6000260] = {
		skin_scene_imge1 = "castle_dress_25",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302577",
		furnace_module_id = "skin_anim_building_furnace_penguin_castle",
		skin_icon = "skin_icon_6000260",
		skin_name = "skin_design_6000260",
		module_id = "castle_dress_25",
		skin_interface_time = 9.46
	},
	[6000270] = {
		skin_scene_imge1 = "castle_dress_26",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302581",
		furnace_module_id = "skin_anim_building_furnace_lantern_ball",
		skin_icon = "skin_icon_6000270",
		skin_name = "skin_design_6000270",
		module_id = "castle_dress_26",
		skin_interface_time = 8
	},
	[6000280] = {
		skin_scene_imge1 = "castle_dress_27",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302585",
		furnace_module_id = "skin_anim_building_furnace_frost_dragon",
		skin_icon = "skin_icon_6000280",
		skin_name = "skin_design_6000280",
		module_id = "castle_dress_27"
	},
	[6000310] = {
		skin_scene_imge1 = "castle_dress_19",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302594",
		furnace_module_id = "skin_anim_building_furnace_2025Xmas",
		skin_icon = "skin_icon_6000310",
		skin_name = "skin_design_6000310",
		module_id = "castle_dress_19",
		skin_interface_time = 8
	},
	[6000320] = {
		skin_scene_imge1 = "castle_dress_31",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302598",
		furnace_module_id = "skin_anim_building_furnace_sleepy_lion",
		skin_icon = "skin_icon_6000320",
		skin_name = "skin_design_6000320",
		module_id = "castle_dress_31",
		skin_interface_time = 6
	},
	[6000360] = {
		skin_scene_imge1 = "castle_dress_35",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_302614",
		furnace_module_id = "skin_anim_building_furnace_drake_tower",
		skin_icon = "skin_icon_6000360",
		skin_name = "skin_design_6000360",
		module_id = "castle_dress_35"
	},
	[6000370] = {
		skin_scene_imge1 = "castle_dress_38",
		law_module_id = "skin_anim_building_furnace_empty",
		skin_scene_imge1_ru = "castle_dress_38_ru",
		module_id = "castle_dress_38",
		module_id_ru = "castle_dress_38_ru",
		skin_icon = "skin_icon_6000370",
		furnace_module_id_ru = "skin_anim_building_furnace_childrens2026_day_ru",
		get_show = "item_icon_302616",
		furnace_module_id = "skin_anim_building_furnace_childrens2026_day",
		skin_name = "skin_design_6000370",
		skin_interface_time = 7.33
	},
	[26000060] = {
		skin_scene_imge1 = "castle_dress_33",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_2302601",
		furnace_module_id = "skin_anim_building_furnace_PeachGarden",
		skin_icon = "skin_icon_26000060",
		skin_name = "skin_design_26000060",
		module_id = "castle_dress_33"
	},
	[26000070] = {
		skin_scene_imge1 = "castle_dress_34",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_2302611",
		furnace_module_id = "skin_anim_building_furnace_Mayday",
		skin_icon = "skin_icon_26000070",
		skin_name = "skin_design_26000070",
		module_id = "castle_dress_34"
	},
	[26000210] = {
		skin_scene_imge1 = "castle_dress_37_1",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_2302557",
		furnace_module_id = "skin_anim_building_furnace_1st_cake",
		skin_icon = "skin_icon_26000210",
		skin_name = "skin_design_26000210",
		module_id = "castle_dress_37_1",
		skin_interface_time = 5
	},
	[26000290] = {
		skin_scene_imge1 = "castle_dress_cn_1",
		skin_interface_imge1 = "decorate_frame_26000290",
		skin_scene_imge1_ru = "castle_dress_cn_1_ru",
		module_id = "castle_dress_cn_1",
		module_id_ru = "castle_dress_cn_1_ru",
		skin_icon = "skin_icon_26000290",
		law_module_id = "skin_anim_building_furnace_empty",
		furnace_module_id_ru = "skin_anim_building_furnace_2025guoqing_ru",
		get_show = "item_icon_2303118",
		furnace_module_id = "skin_anim_building_furnace_2025guoqing",
		skin_name = "skin_design_26000290",
		skin_interface_time = 5
	},
	[6000440] = {
		skin_scene_imge1 = "castle_dress_40",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780001",
		furnace_module_id = "skin_anim_building_furnace_2026whitebear_day",
		skin_icon = "skin_icon_6000440",
		skin_name = "skin_design_6000440",
		module_id = "castle_dress_40",
		condition = slot1.dup1
	},
	[6000450] = {
		skin_scene_imge1 = "castle_dress_41",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780005",
		furnace_module_id = "skin_anim_building_furnace_2026whitebear_gof_day",
		skin_icon = "skin_icon_6000450",
		skin_name = "skin_design_6000450",
		module_id = "castle_dress_41",
		condition = slot1.dup1
	},
	[6000460] = {
		skin_scene_imge1 = "castle_dress_42",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780009",
		furnace_module_id = "skin_anim_building_furnace_2026worldcup_day",
		skin_icon = "skin_icon_6000460",
		skin_name = "skin_design_6000460",
		module_id = "castle_dress_42",
		condition = slot1.dup1
	},
	[6000490] = {
		skin_scene_imge1 = "castle_dress_45",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780021",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet_LV2",
		skin_icon = "skin_icon_6000490",
		skin_name = "skin_design_6000490",
		module_id = "castle_dress_45",
		condition = slot1.dup1
	},
	[6000500] = {
		skin_scene_imge1 = "castle_dress_46",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780031",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet_LV3",
		skin_icon = "skin_icon_6000500",
		skin_name = "skin_design_6000500",
		module_id = "castle_dress_46",
		condition = slot1.dup1
	},
	[6000510] = {
		skin_scene_imge1 = "castle_dress_47",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780041",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet_LV4",
		skin_icon = "skin_icon_6000510",
		skin_name = "skin_design_6000510",
		module_id = "castle_dress_47",
		condition = slot1.dup1
	},
	[6000520] = {
		skin_scene_imge1 = "castle_dress_48",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780051",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet_LV5",
		skin_icon = "skin_icon_6000520",
		skin_name = "skin_design_6000520",
		module_id = "castle_dress_48",
		condition = slot1.dup1
	},
	[6000530] = {
		skin_scene_imge1 = "castle_dress_49",
		law_module_id = "skin_anim_building_furnace_empty",
		get_show = "item_icon_780061",
		furnace_module_id = "skin_anim_building_furnace_frozenplanet_LV6",
		skin_icon = "skin_icon_6000530",
		skin_name = "skin_design_6000530",
		module_id = "castle_dress_49",
		condition = slot1.dup1
	},
	[6030010] = {
		CollisionAreaLength = 1,
		first_move_time = 2,
		get_show = "item_icon_6030010",
		module_id = "March_3D_Init",
		skin_icon = "skin_icon_6030010",
		skin_name = "skin_design_6030010",
		CollisionAreaWidth = 0.6,
		skin_btn_group_offset = {
			0,
			15
		}
	},
	[6030020] = {
		HasAttackAnim = 1,
		Is3DModel = 1,
		BoxColliderWidth = 0.4,
		module_id = "March_3D_FengXueZhiYi",
		first_move_time = 2,
		skin_icon = "skin_icon_6030020",
		skin_launch_sound = "slg_se_march_scout_launch",
		module_scale = 0.85,
		BoxColliderHeight = 1,
		skin_interface_time = 5.01,
		attack_offset = 0.65,
		CollisionAreaLength = 1.6,
		get_show = "item_icon_302702",
		skin_attack_sound = "slg_se_march_scout_attack",
		skin_name = "skin_design_6030020",
		CollisionAreaWidth = 1,
		expression_offset = {
			0.3,
			1.3,
			0
		},
		skin_btn_group_offset = slot1.dup10
	},
	[6030030] = {
		module_id = "March_3D_ZhongZhuangMengMa",
		first_move_time = 2,
		HasAttackAnim = 1,
		second_move_time = 3,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030030",
		skin_launch_sound = "slg_se_march_mammoth_launch",
		module_scale = 1.3,
		skin_interface_time = 4.95,
		attack_offset = -1,
		move_random = 50,
		CollisionAreaLength = 1.6,
		get_show = "item_icon_302703",
		skin_attack_sound = "slg_se_march_mammoth_attack",
		skin_name = "skin_design_6030030",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup4,
		skin_btn_group_offset = slot1.dup11
	},
	[6030040] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		module_id = "March_3D_XueDiMoTuo",
		attack_offset = 0.3,
		skin_icon = "skin_icon_6030040",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_motor_launch",
		module_scale = 2.5,
		get_show = "item_icon_302704",
		skin_attack_sound = "slg_se_march_motor_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030040",
		CollisionAreaWidth = 1,
		skin_interface_time = 2.5,
		expression_offset = {
			0.3,
			0.75,
			0
		},
		skin_btn_group_offset = slot1.dup10
	},
	[6030050] = {
		CollisionAreaLength = 1.6,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_LeiTingPaoChe",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030050",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_chariot_launch",
		module_scale = 2,
		get_show = "item_icon_302705",
		skin_attack_sound = "slg_se_march_chariot_attack",
		skin_name = "skin_design_6030050",
		CollisionAreaWidth = 1,
		skin_interface_time = 3.32,
		expression_offset = {
			0.3,
			0.7,
			0
		}
	},
	[6030060] = {
		CollisionAreaLength = 1.6,
		Is3DModel = 1,
		module_id = "March_3D_ShouWangQiShi",
		attack_offset = 0.7,
		skin_icon = "skin_icon_6030060",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_alfight_launch",
		module_scale = 2.2,
		get_show = "item_icon_302706",
		skin_attack_sound = "slg_se_march_alfight_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030060",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = {
			0.3,
			0.8,
			0
		},
		skin_btn_group_offset = slot1.dup12
	},
	[6030070] = {
		CollisionAreaLength = 1.6,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_ZhuRiZhe",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030070",
		first_move_time = 3.33,
		skin_launch_sound = "slg_se_march_train_launch",
		module_scale = 1.65,
		get_show = "item_icon_302707",
		skin_attack_sound = "slg_se_march_train_attack",
		skin_name = "skin_design_6030070",
		CollisionAreaWidth = 1,
		skin_interface_time = 4.33,
		expression_offset = slot1.dup5
	},
	[6030080] = {
		HasAttackAnim = 1,
		Is3DModel = 1,
		BoxColliderWidth = 0.6,
		module_id = "March_3D_King",
		first_move_time = 3.33,
		skin_icon = "skin_icon_6030080",
		skin_launch_sound = "slg_se_march_king_launch",
		module_scale = 1.3,
		BoxColliderHeight = 1,
		skin_interface_time = 3.33,
		attack_offset = 0.8,
		CollisionAreaLength = 1.6,
		get_show = "item_icon_302708",
		skin_attack_sound = "slg_se_march_king_attack",
		skin_name = "skin_design_6030080",
		CollisionAreaWidth = 1,
		expression_group_offset = {
			0,
			1.5,
			0
		},
		expression_offset = {
			0.3,
			2.8,
			0
		},
		skin_btn_group_offset = slot1.dup13
	},
	[6030090] = {
		module_id = "March_3D_Easter",
		first_move_time = 2,
		HasAttackAnim = 1,
		second_move_time = 8.276,
		module_id_ru = "March_3D_Easter_ru",
		skin_icon = "skin_icon_6030090",
		Is3DModel = 1,
		skin_launch_sound = "slg_se_march_easter_launch",
		module_scale = 1.1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302709",
		skin_attack_sound = "slg_se_march_easter_attack",
		skin_name = "skin_design_6030090",
		CollisionAreaWidth = 1,
		expression_group_offset = slot1.dup3,
		expression_offset = {
			0.4,
			1.4,
			0
		},
		skin_btn_group_offset = slot1.dup14
	},
	[6030110] = {
		module_id = "March_3D_Unicorn",
		first_move_time = 2,
		HasAttackAnim = 1,
		second_move_time = 2.5,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030110",
		skin_launch_sound = "slg_se_march_children_launch",
		module_scale = 0.8,
		skin_interface_time = 5,
		attack_offset = 0.5,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302711",
		skin_attack_sound = "slg_se_march_children_attack",
		skin_name = "skin_design_6030110",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup5,
		skin_btn_group_offset = slot1.dup10
	},
	[6030120] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		module_id = "March_3D_icebreaker",
		attack_offset = 0.7,
		skin_icon = "skin_icon_6030120",
		first_move_time = 1.667,
		skin_launch_sound = "slg_se_march_icebreaker_launch",
		module_scale = 1.5,
		get_show = "item_icon_302712",
		skin_attack_sound = "slg_se_march_icebreaker_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030120",
		CollisionAreaWidth = 1,
		skin_interface_time = 4.95,
		expression_offset = slot1.dup6,
		skin_btn_group_offset = slot1.dup15
	},
	[6030130] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		module_id = "March_3D_whale",
		attack_offset = 0.7,
		skin_icon = "skin_icon_6030130",
		first_move_time = 5,
		skin_launch_sound = "slg_se_march_whale_launch",
		module_scale = 2,
		get_show = "item_icon_302713",
		skin_attack_sound = "slg_se_march_whale_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030130",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = {
			0.4,
			1.2,
			0
		},
		skin_btn_group_offset = slot1.dup12
	},
	[6030140] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		module_id = "March_3D_chocobo",
		attack_offset = 1,
		skin_icon = "skin_icon_6030140",
		first_move_time = 1.067,
		skin_launch_sound = "slg_se_march_chocobo_launch",
		module_scale = 1.3,
		get_show = "item_icon_302715",
		skin_attack_sound = "slg_se_march_chocobo_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030140",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = slot1.dup4,
		skin_btn_group_offset = slot1.dup15
	},
	[6030150] = {
		module_id = "March_3D_pumpkin",
		first_move_time = 4.667,
		HasAttackAnim = 1,
		second_move_time = 3.633,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030150",
		skin_launch_sound = "slg_se_march_pumpkin_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 0.8,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302716",
		skin_attack_sound = "slg_se_march_pumpkin_attack",
		skin_name = "skin_design_6030150",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup7,
		skin_btn_group_offset = slot1.dup12
	},
	[6030160] = {
		module_id = "March_3D_angry_turkey",
		first_move_time = 5,
		HasAttackAnim = 1,
		second_move_time = 10.567,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030160",
		skin_launch_sound = "slg_se_march_angry_turkey_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302717",
		skin_attack_sound = "slg_se_march_angry_turkey_attack",
		skin_name = "skin_design_6030160",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup12
	},
	[6030170] = {
		module_id = "March_3D_2025food_sling",
		first_move_time = 1,
		HasAttackAnim = 1,
		second_move_time = 5.5,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030170",
		skin_launch_sound = "slg_se_march_2025food_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 5,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302718",
		skin_attack_sound = "slg_se_march_2025food_attack",
		skin_name = "skin_design_6030170",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup7,
		skin_btn_group_offset = slot1.dup12
	},
	[6030180] = {
		module_id = "March_3D_2025moon_car",
		first_move_time = 3.1,
		HasAttackAnim = 1,
		second_move_time = 11.2,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030180",
		skin_launch_sound = "slg_se_march_2025moon_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 0.8,
		move_random = 10,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302719",
		skin_attack_sound = "slg_se_march_2025moon_attack",
		skin_name = "skin_design_6030180",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup11
	},
	[6030190] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_cupid",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030190",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_cupid_launch",
		module_scale = 1,
		get_show = "item_icon_302720",
		skin_attack_sound = "slg_se_march_cupid_attack",
		skin_name = "skin_design_6030190",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = {
			0.5,
			0.7,
			0
		}
	},
	[6030200] = {
		module_id = "March_3D_cake_cannon",
		first_move_time = 1.5,
		HasAttackAnim = 1,
		second_move_time = 11.333,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030200",
		skin_launch_sound = "slg_se_march_cake_cannon_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 0.8,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302721",
		skin_attack_sound = "slg_se_march_cake_cannon_attack",
		skin_name = "skin_design_6030200",
		CollisionAreaWidth = 1,
		expression_offset = {
			0.7,
			0.8,
			0
		},
		skin_btn_group_offset = slot1.dup16
	},
	[6030210] = {
		module_id = "March_3D_meteor",
		first_move_time = 2,
		HasAttackAnim = 1,
		Is3DModel = 1,
		module_id_ru = "March_3D_meteor_ru",
		skin_icon = "skin_icon_6030210",
		skin_launch_sound = "slg_se_march_meteor_launch",
		module_scale = 1.5,
		skin_interface_time = 5,
		attack_offset = 1.5,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302722",
		skin_attack_sound = "slg_se_march_meteor_attack",
		skin_name = "skin_design_6030210",
		CollisionAreaWidth = 1,
		expression_group_offset = {
			0,
			0.7,
			0
		},
		expression_offset = slot1.dup9,
		skin_btn_group_offset = slot1.dup14
	},
	[6030220] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_giant_airship",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030220",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_giant_airship_launch",
		module_scale = 1,
		get_show = "item_icon_302723",
		skin_attack_sound = "slg_se_march_giant_airship_attack",
		skin_name = "skin_design_6030220",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = slot1.dup9
	},
	[6030230] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_snowvehicle",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030230",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_snowvehicle_launch",
		module_scale = 1,
		get_show = "item_icon_302724",
		skin_attack_sound = "slg_se_march_snowvehicle_attack",
		skin_name = "skin_design_6030230",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = slot1.dup9
	},
	[6030240] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		HasAttackAnim = 1,
		module_id = "March_3D_draw_rabbit",
		attack_offset = 0.8,
		skin_icon = "skin_icon_6030240",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_draw_rabbit_launch",
		module_scale = 1,
		get_show = "item_icon_302725",
		skin_attack_sound = "slg_se_march_draw_rabbit_attack",
		skin_name = "skin_design_6030240",
		CollisionAreaWidth = 1,
		skin_interface_time = 5,
		expression_offset = slot1.dup5
	},
	[6030260] = {
		CollisionAreaLength = 1.4,
		Is3DModel = 1,
		module_id = "March_3D_mushroom_monster",
		attack_offset = 1,
		skin_icon = "skin_icon_6030260",
		first_move_time = 2,
		skin_launch_sound = "slg_se_march_mushroom_monster_launch",
		module_scale = 1,
		get_show = "item_icon_302727",
		skin_attack_sound = "slg_se_march_mushroom_monster_attack",
		HasAttackAnim = 1,
		skin_name = "skin_design_6030260",
		CollisionAreaWidth = 1,
		skin_interface_time = 5.01,
		expression_offset = {
			0.6,
			1.4,
			0
		},
		skin_btn_group_offset = slot1.dup10
	},
	[6030280] = {
		module_id = "March_3d_penguin",
		first_move_time = 1.066,
		HasAttackAnim = 1,
		second_move_time = 4.566,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030280",
		skin_launch_sound = "slg_se_march_penguin_launch",
		module_scale = 0.67,
		skin_interface_time = 5,
		attack_offset = 0.2,
		move_random = 10,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302729",
		skin_attack_sound = "slg_se_march_penguin_attack",
		skin_name = "skin_design_6030280",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup5,
		skin_btn_group_offset = slot1.dup12
	},
	[6030300] = {
		module_id = "March_3D_ice_dragon",
		first_move_time = 11.667,
		HasAttackAnim = 1,
		second_move_time = 11.833,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030300",
		skin_launch_sound = "slg_se_march_ice_dragon_launch",
		module_scale = 1,
		delay_show_march_topui = 8,
		skin_interface_time = 5,
		attack_offset = 1.8,
		move_random = 10,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302731",
		skin_attack_sound = "slg_se_march_ice_dragon_attack",
		skin_name = "skin_design_6030300",
		CollisionAreaWidth = 1,
		march_camera_follow_type = 1,
		expression_offset = {
			0.6,
			3.2,
			0
		},
		skin_btn_group_offset = slot1.dup13,
		special_slg_anim_names = {
			"Move2",
			"Move3",
			"Move1"
		},
		special_slg_anim_names_time = {
			6.167,
			5.667,
			11.667
		}
	},
	[6030330] = {
		module_id = "March_3D_xmas_reindeer",
		first_move_time = 16,
		HasAttackAnim = 1,
		second_move_time = 10.8,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030330",
		skin_launch_sound = "slg_se_march_xmas_reindeer_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302734",
		skin_attack_sound = "slg_se_march_xmas_reindeer_attack",
		skin_name = "skin_design_6030330",
		CollisionAreaWidth = 1,
		expression_offset = {
			0.5,
			0.9,
			0
		},
		skin_btn_group_offset = {
			0,
			90
		}
	},
	[6030340] = {
		module_id = "March_3D_2026Spring",
		first_move_time = 1.5,
		HasAttackAnim = 1,
		second_move_time = 11.333,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030340",
		skin_launch_sound = "slg_se_march_3d_2026spring_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 0.6,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_302735",
		skin_attack_sound = "slg_se_march_3d_2026spring_attack",
		skin_name = "skin_design_6030340",
		CollisionAreaWidth = 1,
		expression_group_offset = slot1.dup3,
		expression_offset = slot1.dup5,
		skin_btn_group_offset = slot1.dup16
	},
	[6030350] = {
		HasAttackAnim = 1,
		Is3DModel = 1,
		CollisionAreaLength = 1.4,
		second_move_time = 2.7,
		get_show = "item_icon_302736",
		skin_icon = "skin_icon_6030350",
		second_change_time = 4.133,
		skin_interface_time2 = 5,
		skin_launch_sound = "slg_se_march_children2026_launch",
		module_scale = 0.8,
		first_move_time = 2.499,
		first_change_time = 2.6,
		module_id = "March_3D_Childrens2026",
		return_random = 50,
		skin_interface_time = 5,
		go_move_israndom = 1,
		attack_offset = 0.5,
		move_random = 50,
		HasAttackAnim02 = 1,
		skin_attack_sound2 = "slg_se_march_children2026_attack02",
		skin_attack_sound = "slg_se_march_children2026_attack",
		skin_name = "skin_design_6030350",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup5,
		skin_btn_group_offset = slot1.dup10
	},
	[26030070] = {
		module_id = "March_3D_2026Peach",
		first_move_time = 1.8,
		HasAttackAnim = 1,
		second_move_time = 5.133,
		Is3DModel = 1,
		skin_icon = "skin_icon_26030070",
		skin_launch_sound = "slg_se_march_skin_2026peach_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_2302605",
		skin_attack_sound = "slg_se_march_skin_2026peach_attack",
		skin_name = "skin_design_26030070",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup12
	},
	[26030080] = {
		module_id = "March_3D_2026May",
		first_move_time = 2,
		HasAttackAnim = 1,
		second_move_time = 5.733,
		Is3DModel = 1,
		skin_icon = "skin_icon_26030080",
		skin_launch_sound = "slg_se_march_skin_2026may_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 40,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_2302615",
		skin_attack_sound = "slg_se_march_skin_2026may_attack",
		skin_name = "skin_design_26030080",
		CollisionAreaWidth = 1,
		expression_group_offset = {
			0,
			2.6,
			0
		},
		expression_offset = {
			0,
			3.9,
			0
		},
		skin_btn_group_offset = slot1.dup17
	},
	[26030270] = {
		HasAttackAnim = 1,
		first_move_time = 5.3,
		module_id = "March_3D_2025Guoqing",
		second_move_time = 5.3,
		Is3DModel = 1,
		skin_icon = "skin_icon_26030270",
		skin_launch_sound = "slg_se_march_nationalday2024_reindeer_launch",
		module_scale = 1,
		skin_interface_time = 5,
		skin_interface_imge1 = "decorate_frame_26030270",
		attack_offset = 0.7,
		move_random = 50,
		CollisionAreaLength = 1,
		get_show = "item_icon_303188",
		skin_attack_sound = "slg_se_march_nationalday2024_reindeer_attack",
		skin_name = "skin_design_26030270",
		CollisionAreaWidth = 1,
		expression_offset = slot1.dup6,
		skin_btn_group_offset = slot1.dup12
	},
	[6030440] = {
		module_id = "March_3D_2026WhiteBear",
		first_move_time = 1.8,
		HasAttackAnim = 1,
		second_move_time = 5.133,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030440",
		skin_launch_sound = "slg_se_march_2026whitebear_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_781001",
		skin_attack_sound = "slg_se_march_2026whitebear_attack",
		skin_name = "skin_design_6030440",
		CollisionAreaWidth = 1,
		condition = slot1.dup1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup12
	},
	[6030460] = {
		module_id = "March_3D_2026worldcup",
		first_move_time = 4,
		HasAttackAnim = 1,
		second_move_time = 3.733,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030460",
		skin_launch_sound = "slg_se_march_worldcup2026_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_781002",
		skin_attack_sound = "slg_se_march_worldcup2026_attack",
		skin_name = "skin_design_6030460",
		CollisionAreaWidth = 1,
		condition = slot1.dup1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup17
	},
	[6030470] = {
		module_id = "March_3D_2026Arsenal_League01",
		first_move_time = 1.8,
		HasAttackAnim = 1,
		second_move_time = 5.133,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030470",
		skin_launch_sound = "slg_se_march_2026arsenal_league01_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_781003",
		skin_attack_sound = "slg_se_march_2026arsenal_league01_attack",
		skin_name = "skin_design_6030470",
		CollisionAreaWidth = 1,
		condition = slot1.dup1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup12
	},
	[6030480] = {
		module_id = "March_3D_2026Arsenal_League02",
		first_move_time = 1.8,
		HasAttackAnim = 1,
		second_move_time = 5.133,
		Is3DModel = 1,
		skin_icon = "skin_icon_6030480",
		skin_launch_sound = "slg_se_march_2026arsenal_league02_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_781004",
		skin_attack_sound = "slg_se_march_2026arsenal_league02_attack",
		skin_name = "skin_design_6030480",
		CollisionAreaWidth = 1,
		condition = slot1.dup1,
		expression_offset = slot1.dup8,
		skin_btn_group_offset = slot1.dup12
	},
	[6030510] = {
		module_id = "March_3D_frozenplanet_LV2",
		Is3DModel = 1,
		HasAttackAnim = 1,
		first_move_time = 2.333,
		skin_icon = "skin_icon_6030510",
		skin_launch_sound = "slg_se_march_frozenplanet_LV2_launch",
		module_scale = 1,
		skin_interface_time = 5,
		attack_offset = 1,
		move_random = 50,
		CollisionAreaLength = 1.4,
		get_show = "item_icon_781012",
		skin_attack_sound = "slg_se_march_frozenplanet_LV2_attack",
		skin_name = "skin_design_6030510",
		CollisionAreaWidth = 1,
		condition = slot1.dup1,
		expression_group_offset = {
			0,
			0.6,
			0
		},
		expression_offset = {
			0.3,
			1.5,
			0
		},
		skin_btn_group_offset = slot1.dup12
	},
	[6060010] = {
		skin_scene_imge1 = "worldscene_nameplate_6060010_1",
		skin_name = "skin_design_6060010",
		skin_icon = "skin_icon_6060010",
		skin_interface_imge3 = {
			"decorate_nameplate_6060010_1"
		}
	},
	[6060020] = {
		skin_scene_imge1 = "worldscene_nameplate_6060020_1",
		skin_interface_effect = "fxui_dress_Main630_mp01",
		get_show = "item_icon_302902",
		skin_icon = "skin_icon_6060020",
		skin_name = "skin_design_6060020",
		skin_scene_imge2 = "worldscene_nameplate_6060020_2",
		skin_scene_effect = "fx_world_name_zhengqikuangchao",
		skin_interface_imge3 = {
			"decorate_nameplate_6060020_1",
			"decorate_nameplate_6060020_2"
		}
	},
	[6060030] = {
		skin_scene_imge1 = "worldscene_nameplate_6060030_1",
		skin_interface_effect = "fx_nameplate_QiShiRongYao",
		get_show = "item_icon_302903",
		skin_icon = "skin_icon_6060030",
		skin_name = "skin_design_6060030",
		skin_scene_imge2 = "worldscene_nameplate_6060030_2",
		skin_scene_effect = "fx_world_name_qishirongyao",
		skin_interface_imge3 = {
			"decorate_nameplate_6060030_1",
			"decorate_nameplate_6060030_2"
		}
	},
	[6060040] = {
		skin_scene_imge1 = "worldscene_nameplate_6060040_1",
		skin_interface_effect = "fxui_dress_mingpai_fire_front",
		get_show = "item_icon_302904",
		skin_icon = "skin_icon_6060040",
		skin_name = "skin_design_6060040",
		skin_scene_imge2 = "worldscene_nameplate_6060040_2",
		skin_scene_effect = "fx_world_name_zhuorezhiwu",
		skin_interface_imge3 = {
			"decorate_nameplate_6060040_1",
			"decorate_nameplate_6060040_2"
		}
	},
	[6060050] = {
		skin_scene_imge1 = "worldscene_nameplate_6060050_1",
		skin_interface_effect = "fxui_dress_imgNameglow_wwj",
		get_show = "item_icon_302905",
		skin_icon = "skin_icon_6060050",
		skin_name = "skin_design_6060050",
		skin_scene_imge2 = "worldscene_nameplate_6060050_2",
		skin_scene_effect = "fx_world_name_rongxuezhimeng",
		skin_interface_imge3 = {
			"decorate_nameplate_6060050_1",
			"decorate_nameplate_6060050_2"
		}
	},
	[6060060] = {
		skin_scene_imge1 = "worldscene_nameplate_6060060_1",
		skin_interface_effect = "fxui_dress_ancient_mp_01",
		get_show = "item_icon_302906",
		skin_icon = "skin_icon_6060060",
		skin_name = "skin_design_6060060",
		skin_scene_imge2 = "worldscene_nameplate_6060060_2",
		skin_scene_effect = "fx_world_name_yuanguhuhuan",
		skin_interface_imge3 = {
			"decorate_nameplate_6060060_1",
			"decorate_nameplate_6060060_2"
		}
	},
	[6060070] = {
		skin_scene_imge1 = "worldscene_nameplate_6060070_1",
		skin_interface_effect = "fxui_dress_imgNameglow_wwj",
		get_show = "item_icon_302907",
		skin_icon = "skin_icon_6060070",
		skin_name = "skin_design_6060070",
		skin_scene_imge2 = "worldscene_nameplate_6060070_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060070_1",
			"decorate_nameplate_6060070_2"
		}
	},
	[6060080] = {
		skin_scene_imge1 = "worldscene_nameplate_6060080_1",
		skin_interface_effect = "fxui_dress_ancient_mp_01",
		get_show = "item_icon_302908",
		skin_icon = "skin_icon_6060080",
		skin_name = "skin_design_6060080",
		skin_scene_imge2 = "worldscene_nameplate_6060080_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060080_1",
			"decorate_nameplate_6060080_2"
		}
	},
	[6060090] = {
		skin_scene_imge1 = "worldscene_nameplate_6060090_1",
		skin_interface_effect = "fxui_dress_ancient_mp_01",
		get_show = "item_icon_302909",
		skin_icon = "skin_icon_6060090",
		skin_name = "skin_design_6060090",
		skin_scene_imge2 = "worldscene_nameplate_6060090_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060090_1",
			"decorate_nameplate_6060090_2"
		}
	},
	[6060100] = {
		skin_scene_imge1 = "worldscene_nameplate_6060100_1",
		skin_interface_effect = "fxui_dress_ancient_mp_01",
		get_show = "item_icon_302910",
		skin_icon = "skin_icon_6060100",
		skin_name = "skin_design_6060100",
		skin_scene_imge2 = "worldscene_nameplate_6060100_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060100_1",
			"decorate_nameplate_6060100_2"
		}
	},
	[6060110] = {
		skin_scene_imge1 = "worldscene_nameplate_6060110_1",
		skin_icon = "skin_icon_6060110",
		get_show = "item_icon_302911",
		skin_name = "skin_design_6060110",
		skin_scene_imge2 = "worldscene_nameplate_6060110_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060110_1",
			"decorate_nameplate_6060110_2"
		}
	},
	[6060120] = {
		skin_scene_imge1 = "worldscene_nameplate_6060120_1",
		get_show = "item_icon_302912",
		skin_scene_imge1_ru = "worldscene_nameplate_6060120_1_ru",
		skin_icon_ru = "skin_icon_6060120_ru",
		get_show_ru = "item_icon_302912_ru",
		skin_icon = "skin_icon_6060120",
		skin_scene_imge2_ru = "worldscene_nameplate_6060120_2_ru",
		skin_scene_imge2 = "worldscene_nameplate_6060120_2",
		skin_name = "skin_design_6060120",
		skin_interface_imge3 = {
			"decorate_nameplate_6060120_1",
			"decorate_nameplate_6060120_2"
		},
		skin_interface_imge3_ru = {
			"decorate_nameplate_6060120_1_ru",
			"decorate_nameplate_6060120_2_ru"
		}
	},
	[6060130] = {
		skin_scene_imge1 = "worldscene_nameplate_6060130_1",
		get_show = "item_icon_302913",
		skin_scene_imge1_ru = "worldscene_nameplate_6060130_1_ru",
		skin_icon_ru = "skin_icon_6060130_ru",
		get_show_ru = "item_icon_302913_ru",
		skin_icon = "skin_icon_6060130",
		skin_scene_imge2_ru = "worldscene_nameplate_6060130_2_ru",
		skin_scene_imge2 = "worldscene_nameplate_6060130_2",
		skin_name = "skin_design_6060130",
		skin_interface_imge3 = {
			"decorate_nameplate_6060130_1",
			"decorate_nameplate_6060130_2"
		},
		skin_interface_imge3_ru = {
			"decorate_nameplate_6060130_1_ru",
			"decorate_nameplate_6060130_2_ru"
		}
	},
	[6060140] = {
		skin_scene_imge1 = "worldscene_nameplate_6060140_1",
		skin_icon = "skin_icon_6060140",
		get_show = "item_icon_302916",
		skin_name = "skin_design_6060140",
		skin_scene_imge2 = "worldscene_nameplate_6060140_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060140_1",
			"decorate_nameplate_6060140_2"
		}
	},
	[6060150] = {
		skin_scene_imge1 = "worldscene_nameplate_6060150_1",
		skin_icon = "skin_icon_6060150",
		get_show = "item_icon_302917",
		skin_name = "skin_design_6060150",
		skin_scene_imge2 = "worldscene_nameplate_6060150_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060150_1",
			"decorate_nameplate_6060150_2"
		}
	},
	[6060160] = {
		skin_scene_imge1 = "worldscene_nameplate_6060160_1",
		skin_icon = "skin_icon_6060160",
		get_show = "item_icon_302918",
		skin_name = "skin_design_6060160",
		skin_scene_imge2 = "worldscene_nameplate_6060160_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060160_1",
			"decorate_nameplate_6060160_2"
		}
	},
	[6060170] = {
		skin_scene_imge1 = "worldscene_nameplate_6060170_1",
		skin_icon = "skin_icon_6060170",
		get_show = "item_icon_302919",
		skin_name = "skin_design_6060170",
		skin_scene_imge2 = "worldscene_nameplate_6060170_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060170_1",
			"decorate_nameplate_6060170_2"
		}
	},
	[6060180] = {
		skin_scene_imge1 = "worldscene_nameplate_6060180_1",
		skin_icon = "skin_icon_6060180",
		get_show = "item_icon_302921",
		skin_name = "skin_design_6060180",
		skin_scene_imge2 = "worldscene_nameplate_6060180_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060180_1",
			"decorate_nameplate_6060180_2"
		}
	},
	[6060190] = {
		skin_scene_imge1 = "worldscene_nameplate_6060190_1",
		skin_icon = "skin_icon_6060190",
		get_show = "item_icon_302922",
		skin_name = "skin_design_6060190",
		skin_scene_imge2 = "worldscene_nameplate_6060190_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060190_1",
			"decorate_nameplate_6060190_2"
		}
	},
	[6060200] = {
		skin_scene_imge1 = "worldscene_nameplate_6060200_1",
		skin_icon = "skin_icon_6060200",
		get_show = "item_icon_302923",
		skin_name = "skin_design_6060200",
		skin_scene_imge2 = "worldscene_nameplate_6060200_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060200_1",
			"decorate_nameplate_6060200_2"
		}
	},
	[6060210] = {
		skin_scene_imge1 = "worldscene_nameplate_6060210_1",
		skin_icon = "skin_icon_6060210",
		get_show = "item_icon_302924",
		skin_name = "skin_design_6060210",
		skin_scene_imge2 = "worldscene_nameplate_6060210_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060210_1",
			"decorate_nameplate_6060210_2"
		}
	},
	[6060220] = {
		skin_scene_imge1 = "worldscene_nameplate_6060220_1",
		skin_icon = "skin_icon_6060220",
		get_show = "item_icon_302925",
		skin_name = "skin_design_6060220",
		skin_scene_imge2 = "worldscene_nameplate_6060220_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060220_1",
			"decorate_nameplate_6060220_2"
		}
	},
	[6060230] = {
		skin_scene_imge1 = "worldscene_nameplate_6060230_1",
		skin_icon = "skin_icon_6060230",
		get_show = "item_icon_302926",
		skin_name = "skin_design_6060230",
		skin_scene_imge2 = "worldscene_nameplate_6060230_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060230_1",
			"decorate_nameplate_6060230_2"
		}
	},
	[6060240] = {
		skin_scene_imge1 = "worldscene_nameplate_6060240_1",
		skin_icon = "skin_icon_6060240",
		get_show = "item_icon_302927",
		skin_name = "skin_design_6060240",
		skin_scene_imge2 = "worldscene_nameplate_6060240_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060240_1",
			"decorate_nameplate_6060240_2"
		}
	},
	[6060250] = {
		skin_scene_imge1 = "worldscene_nameplate_6060250_1",
		skin_icon = "skin_icon_6060250",
		get_show = "item_icon_302928",
		skin_name = "skin_design_6060250",
		skin_scene_imge2 = "worldscene_nameplate_6060250_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060250_1",
			"decorate_nameplate_6060250_2"
		}
	},
	[6060260] = {
		skin_scene_imge1 = "worldscene_nameplate_6060260_1",
		skin_icon = "skin_icon_6060260",
		get_show = "item_icon_302929",
		skin_name = "skin_design_6060260",
		skin_scene_imge2 = "worldscene_nameplate_6060260_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060260_1",
			"decorate_nameplate_6060260_2"
		}
	},
	[6060270] = {
		skin_scene_imge1 = "worldscene_nameplate_6060270_1",
		skin_icon = "skin_icon_6060270",
		get_show = "item_icon_302930",
		skin_name = "skin_design_6060270",
		skin_scene_imge2 = "worldscene_nameplate_6060270_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060270_1",
			"decorate_nameplate_6060270_2"
		}
	},
	[6060280] = {
		skin_scene_imge1 = "worldscene_nameplate_6060280_1",
		skin_icon = "skin_icon_6060280",
		get_show = "item_icon_302931",
		skin_name = "skin_design_6060280",
		skin_scene_imge2 = "worldscene_nameplate_6060280_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060280_1",
			"decorate_nameplate_6060280_2"
		}
	},
	[6060290] = {
		skin_scene_imge1 = "worldscene_nameplate_6060290_1",
		skin_icon = "skin_icon_6060290",
		get_show = "item_icon_302932",
		skin_name = "skin_design_6060290",
		skin_scene_imge2 = "worldscene_nameplate_6060290_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060290_1",
			"decorate_nameplate_6060290_2"
		}
	},
	[6060300] = {
		skin_scene_imge1 = "worldscene_nameplate_6060300_1",
		skin_icon = "skin_icon_6060300",
		get_show = "item_icon_302933",
		skin_name = "skin_design_6060300",
		skin_scene_imge2 = "worldscene_nameplate_6060300_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060300_1",
			"decorate_nameplate_6060300_2"
		}
	},
	[6060310] = {
		skin_scene_imge1 = "worldscene_nameplate_6060310_1",
		skin_icon = "skin_icon_6060310",
		get_show = "item_icon_302934",
		skin_name = "skin_design_6060310",
		skin_scene_imge2 = "worldscene_nameplate_6060310_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060310_1",
			"decorate_nameplate_6060310_2"
		}
	},
	[6060320] = {
		skin_scene_imge1 = "worldscene_nameplate_6060320_1",
		skin_icon = "skin_icon_6060320",
		get_show = "item_icon_302935",
		skin_name = "skin_design_6060320",
		skin_scene_imge2 = "worldscene_nameplate_6060320_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060320_1",
			"decorate_nameplate_6060320_2"
		}
	},
	[6060350] = {
		skin_scene_imge1 = "worldscene_nameplate_6060350_1",
		skin_icon = "skin_icon_6060350",
		get_show = "item_icon_302938",
		skin_name = "skin_design_6060350",
		skin_scene_imge2 = "worldscene_nameplate_6060350_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060350_1",
			"decorate_nameplate_6060350_2"
		}
	},
	[6060380] = {
		skin_scene_imge1 = "worldscene_nameplate_6060380_1",
		skin_icon = "skin_icon_6060380",
		get_show = "item_icon_302941",
		skin_name = "skin_design_6060380",
		skin_scene_imge2 = "worldscene_nameplate_6060380_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060380_1",
			"decorate_nameplate_6060380_2"
		}
	},
	[6060400] = {
		skin_scene_imge1 = "worldscene_nameplate_6060400_1",
		skin_icon = "skin_icon_6060400",
		get_show = "item_icon_302947",
		skin_name = "skin_design_6060400",
		skin_scene_imge2 = "worldscene_nameplate_6060400_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060400_1",
			"decorate_nameplate_6060400_2"
		}
	},
	[6060410] = {
		skin_scene_imge1 = "worldscene_nameplate_6060410_1",
		skin_icon = "skin_icon_6060410",
		get_show = "item_icon_302944",
		skin_name = "skin_design_6060410",
		skin_scene_imge2 = "worldscene_nameplate_6060410_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060410_1",
			"decorate_nameplate_6060410_2"
		}
	},
	[6060420] = {
		skin_icon = "skin_icon_6060420",
		skin_name = "skin_design_6060420",
		get_show = "item_icon_302945",
		skin_interface_imge3 = {
			"decorate_nameplate_6060420_1",
			"decorate_nameplate_6060420_2"
		}
	},
	[6060430] = {
		skin_scene_imge1 = "worldscene_nameplate_6060430_1",
		skin_icon = "skin_icon_6060430",
		get_show = "item_icon_302946",
		skin_name = "skin_design_6060430",
		skin_scene_imge2 = "worldscene_nameplate_6060430_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060430_1",
			"decorate_nameplate_6060430_2"
		}
	},
	[26060040] = {
		skin_scene_imge1 = "worldscene_nameplate_26060040_1",
		skin_icon = "skin_icon_26060040",
		get_show = "item_icon_2302904",
		skin_name = "skin_design_26060040",
		skin_scene_imge2 = "worldscene_nameplate_26060040_2",
		skin_interface_imge3 = {
			"decorate_nameplate_26060040_1",
			"decorate_nameplate_26060040_2"
		}
	},
	[26060330] = {
		skin_scene_imge1 = "worldscene_nameplate_26060330_1",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303121",
		skin_icon = "skin_icon_26060330",
		skin_name = "skin_design_26060330",
		skin_scene_imge2 = "worldscene_nameplate_26060330_2",
		skin_interface_imge3 = {
			"decorate_nameplate_26060330_1",
			"decorate_nameplate_26060330_2"
		}
	},
	[26060350] = {
		skin_scene_imge1 = "worldscene_nameplate_26060350_1",
		skin_interface_imge1 = "decorate_frame_99999",
		skin_scene_imge1_ru = "worldscene_nameplate_26060350_1_ru",
		get_show_ru = "item_icon_26060350_ru",
		skin_icon = "skin_icon_26060350",
		skin_scene_imge2 = "worldscene_nameplate_26060350_2",
		get_show = "item_icon_26060350",
		skin_scene_imge2_ru = "worldscene_nameplate_26060350_2_ru",
		skin_icon_ru = "skin_icon_26060350_ru",
		skin_name = "cn_skin_design_26080350",
		skin_interface_imge3 = {
			"decorate_nameplate_26060350_1",
			"decorate_nameplate_26060350_2"
		},
		skin_interface_imge3_ru = {
			"decorate_nameplate_26060350_1_ru",
			"decorate_nameplate_26060350_2_ru"
		}
	},
	[26060380] = {
		skin_scene_imge1 = "worldscene_nameplate_26060380_1",
		skin_icon = "skin_icon_26060380",
		get_show = "item_icon_2302941",
		skin_name = "skin_design_26060380",
		skin_scene_imge2 = "worldscene_nameplate_26060380_2",
		skin_interface_imge3 = {
			"decorate_nameplate_26060380_1",
			"decorate_nameplate_26060380_2"
		}
	},
	[6060440] = {
		skin_scene_imge1 = "worldscene_nameplate_6060440_1",
		get_show = "item_icon_781501",
		skin_icon = "skin_icon_6060440",
		skin_scene_imge2 = "worldscene_nameplate_6060440_2",
		skin_name = "skin_design_6060440",
		condition = slot1.dup2,
		skin_interface_imge3 = {
			"decorate_nameplate_6060440_1",
			"decorate_nameplate_6060440_2"
		}
	},
	[6060460] = {
		skin_scene_imge1 = "worldscene_nameplate_6060460_1",
		get_show = "item_icon_781502",
		skin_icon = "skin_icon_6060460",
		skin_scene_imge2 = "worldscene_nameplate_6060460_2",
		skin_name = "skin_design_6060460",
		condition = slot1.dup2,
		skin_interface_imge3 = {
			"decorate_nameplate_6060460_1",
			"decorate_nameplate_6060460_2"
		}
	},
	[6060480] = {
		skin_scene_imge1 = "worldscene_nameplate_6060480_1",
		skin_icon = "skin_icon_6060480",
		get_show = "item_icon_781504",
		skin_name = "skin_design_6060480",
		skin_scene_imge2 = "worldscene_nameplate_6060480_2",
		skin_interface_imge3 = {
			"decorate_nameplate_6060480_1",
			"decorate_nameplate_6060480_2"
		}
	},
	[6080010] = {
		skin_name = "skin_design_6080010",
		skin_interface_imge1 = "decorate_frame_6080010",
		skin_icon = "skin_icon_6080010",
		skin_interface_imge2 = {
			"decorate_bubble_6080010_1",
			"decorate_bubble_6080010_2"
		}
	},
	[6080020] = {
		skin_icon = "skin_icon_6080020",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303102",
		skin_interface_effect = "fxui_dress_Main630_tx01",
		skin_name = "skin_design_6080020",
		skin_interface_imge2 = {
			"decorate_bubble_6080020_1",
			"decorate_bubble_6080020_2",
			"decorate_bubble_6080020_3",
			"decorate_bubble_6080020_4"
		}
	},
	[6080030] = {
		skin_icon = "skin_icon_6080030",
		skin_interface_imge1 = "decorate_frame_6080030",
		get_show = "item_icon_303103",
		skin_interface_effect = "fxui_dress_touxiang_qishi_jxm",
		skin_name = "skin_design_6080030",
		skin_interface_imge2 = {
			"decorate_bubble_6080030_1",
			"decorate_bubble_6080030_2",
			"decorate_bubble_6080030_3",
			"decorate_bubble_6080030_4"
		}
	},
	[6080040] = {
		skin_icon = "skin_icon_6080040",
		skin_interface_imge1 = "decorate_frame_6080040",
		get_show = "item_icon_303104",
		skin_interface_effect = "fxui_dress_touxiang_fire",
		skin_name = "skin_design_6080040",
		skin_interface_imge2 = {
			"decorate_bubble_6080040_1",
			"decorate_bubble_6080040_2",
			"decorate_bubble_6080040_3",
			"decorate_bubble_6080040_4"
		}
	},
	[6080050] = {
		skin_icon = "skin_icon_6080050",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303105",
		skin_interface_effect = "fxui_dress_imgFarmeglow_wwj",
		skin_name = "skin_design_6080050",
		skin_interface_imge2 = {
			"decorate_bubble_6080050_1",
			"decorate_bubble_6080050_2",
			"decorate_bubble_6080050_3",
			"decorate_bubble_6080050_4"
		}
	},
	[6080060] = {
		skin_icon = "skin_icon_6080060",
		skin_interface_imge1 = "decorate_frame_6080060",
		get_show = "item_icon_303106",
		skin_interface_effect = "fxui_dress_ancient_tx_01",
		skin_name = "skin_design_6080060",
		skin_interface_imge2 = {
			"decorate_bubble_6080060_1",
			"decorate_bubble_6080060_2",
			"decorate_bubble_6080060_3",
			"decorate_bubble_6080060_4"
		}
	},
	[6080070] = {
		skin_interface_imge1 = "decorate_frame_6080070",
		get_show = "item_icon_303107",
		skin_icon = "skin_icon_6080070",
		skin_name = "skin_design_6080070",
		skin_interface_imge2 = {
			"decorate_bubble_6080070_1",
			"decorate_bubble_6080070_2",
			"decorate_bubble_6080070_3",
			"decorate_bubble_6080070_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080070_3_ar",
			"decorate_bubble_6080070_4_ar"
		}
	},
	[6080080] = {
		skin_icon = "skin_icon_6080080",
		skin_interface_imge1 = "decorate_frame_6080080",
		get_show = "item_icon_303117",
		skin_interface_effect = "fxui_dress_christmasday_head_lxy",
		skin_name = "skin_design_6080080",
		skin_interface_imge2 = {
			"decorate_bubble_6080080_1",
			"decorate_bubble_6080080_2",
			"decorate_bubble_6080080_3",
			"decorate_bubble_6080080_4"
		}
	},
	[6080090] = {
		skin_interface_imge1 = "decorate_frame_6080090",
		get_show = "item_icon_303118",
		skin_icon = "skin_icon_6080090",
		skin_name = "skin_design_6080090",
		skin_interface_effect = "fx_dress_2023tx_01",
		skin_interface_imge2 = {
			"decorate_bubble_6080090_1",
			"decorate_bubble_6080090_2",
			"decorate_bubble_6080090_3",
			"decorate_bubble_6080090_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080090_3_ar"
		}
	},
	[6080100] = {
		skin_icon = "skin_icon_6080100",
		skin_interface_imge1 = "decorate_frame_6080100",
		get_show = "item_icon_303119",
		skin_interface_effect = "fx_dress_lovers_tx01_wwj",
		skin_name = "skin_design_6080100",
		skin_interface_imge2 = {
			"decorate_bubble_6080100_1",
			"decorate_bubble_6080100_2",
			"decorate_bubble_6080100_3",
			"decorate_bubble_6080100_4"
		}
	},
	[6080110] = {
		skin_icon = "skin_icon_6080110",
		skin_interface_imge1 = "decorate_frame_6080110",
		get_show = "item_icon_303120",
		skin_interface_effect = "fx_dress_lovers_tx02_wwj",
		skin_name = "skin_design_6080110",
		skin_interface_imge2 = {
			"decorate_bubble_6080110_1",
			"decorate_bubble_6080110_2",
			"decorate_bubble_6080110_3",
			"decorate_bubble_6080110_4"
		}
	},
	[6080120] = {
		skin_icon = "skin_icon_6080120",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303121",
		skin_interface_effect = "fxui_dress_touxiang_esater_jxm",
		skin_name = "skin_design_6080120",
		skin_interface_imge2 = {
			"decorate_bubble_6080120_1",
			"decorate_bubble_6080120_2",
			"decorate_bubble_6080120_3",
			"decorate_bubble_6080120_4"
		}
	},
	[6080130] = {
		skin_interface_effect = "fxui_dress_snowking_head_lxy",
		get_show = "item_icon_303122",
		skin_interface_imge1 = "decorate_frame_6080130",
		get_show_ru = "item_icon_303122_ru",
		skin_icon = "skin_icon_6080130",
		skin_interface_imge1_ru = "decorate_frame_6080130_ru",
		skin_icon_ru = "skin_icon_6080130_ru",
		skin_name = "skin_design_6080130",
		skin_interface_imge2 = {
			"decorate_bubble_6080130_1",
			"decorate_bubble_6080130_2",
			"decorate_bubble_6080130_3",
			"decorate_bubble_6080130_4"
		},
		skin_interface_imge2_ru = {
			"decorate_bubble_6080130_1_ru",
			"decorate_bubble_6080130_2_ru",
			"decorate_bubble_6080130_3_ru",
			"decorate_bubble_6080130_4_ru"
		}
	},
	[6080140] = {
		skin_icon = "skin_icon_6080140",
		skin_interface_imge1 = "decorate_frame_6080140",
		get_show = "item_icon_303125",
		skin_interface_effect = "fx_dress_zqgwtx_01_gx",
		skin_name = "skin_design_6080140",
		skin_interface_imge2 = {
			"decorate_bubble_6080140_1",
			"decorate_bubble_6080140_2",
			"decorate_bubble_6080140_3",
			"decorate_bubble_6080140_4"
		}
	},
	[6080150] = {
		skin_interface_effect = "fx_dress_etjtx_01_gx",
		get_show = "item_icon_303126",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show_ru = "item_icon_303126_ru",
		skin_icon = "skin_icon_6080150",
		skin_interface_effect_ru = "fx_dress_etjtx_01_gx_ru",
		skin_icon_ru = "skin_icon_6080150_ru",
		skin_name = "skin_design_6080150",
		skin_interface_imge2 = {
			"decorate_bubble_6080150_1",
			"decorate_bubble_6080150_2",
			"decorate_bubble_6080150_3",
			"decorate_bubble_6080150_4"
		}
	},
	[6080160] = {
		skin_icon = "skin_icon_6080160",
		skin_interface_imge1 = "decorate_frame_6080160",
		get_show = "item_icon_303127",
		skin_interface_effect = "fxui_dress_touxiang_chengjiandr_yly",
		skin_name = "skin_design_6080160",
		skin_interface_imge2 = {
			"decorate_bubble_6080160_1",
			"decorate_bubble_6080160_2",
			"decorate_bubble_6080160_3",
			"decorate_bubble_6080160_4"
		}
	},
	[6080170] = {
		skin_icon = "skin_icon_6080170",
		skin_interface_imge1 = "decorate_frame_6080170",
		get_show = "item_icon_303128",
		skin_interface_effect = "fx_dress_diaoyu_tx_wwj",
		skin_name = "skin_design_6080170",
		skin_interface_imge2 = {
			"decorate_bubble_6080170_1",
			"decorate_bubble_6080170_2",
			"decorate_bubble_6080170_3",
			"decorate_bubble_6080170_4"
		}
	},
	[6080180] = {
		skin_icon = "skin_icon_6080180",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303129",
		skin_interface_effect = "fxui_dress_touxiang_fishing_jxm",
		skin_name = "skin_design_6080180",
		skin_interface_imge2 = {
			"decorate_bubble_6080180_1",
			"decorate_bubble_6080180_2",
			"decorate_bubble_6080180_3",
			"decorate_bubble_6080180_4"
		}
	},
	[6080190] = {
		skin_icon = "skin_icon_6080190",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303131",
		skin_interface_effect = "fxui_dress_happybrithday_head_lxy",
		skin_name = "skin_design_6080190",
		skin_interface_imge2 = {
			"decorate_bubble_6080190_1",
			"decorate_bubble_6080190_2",
			"decorate_bubble_6080190_3",
			"decorate_bubble_6080190_4"
		}
	},
	[6080200] = {
		skin_icon = "skin_icon_6080200",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303132",
		skin_interface_effect = "fxui_dress_dafuweng_tx_wwj",
		skin_name = "skin_design_6080200",
		skin_interface_imge2 = {
			"decorate_bubble_6080200_1",
			"decorate_bubble_6080200_2",
			"decorate_bubble_6080200_3",
			"decorate_bubble_6080200_4"
		}
	},
	[6080210] = {
		skin_icon = "skin_icon_6080210",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303133",
		skin_interface_effect = "fxui_dress_minewar_tx_wwj",
		skin_name = "skin_design_6080210",
		skin_interface_imge2 = {
			"decorate_bubble_6080210_1",
			"decorate_bubble_6080210_2",
			"decorate_bubble_6080210_3",
			"decorate_bubble_6080210_4"
		}
	},
	[6080220] = {
		skin_icon = "skin_icon_6080220",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303134",
		skin_interface_effect = "fx_dress_wsj_gx_01",
		skin_name = "skin_design_6080220",
		skin_interface_imge2 = {
			"decorate_bubble_6080220_1",
			"decorate_bubble_6080220_2",
			"decorate_bubble_6080220_3",
			"decorate_bubble_6080220_4"
		}
	},
	[6080230] = {
		skin_icon = "skin_icon_6080230",
		skin_interface_imge1 = "decorate_frame_6080230",
		get_show = "item_icon_303135",
		skin_interface_effect = "fxui_dress_ganenjie_tx_wwj",
		skin_name = "skin_design_6080230",
		skin_interface_imge2 = {
			"decorate_bubble_6080230_1",
			"decorate_bubble_6080230_2",
			"decorate_bubble_6080230_3",
			"decorate_bubble_6080230_4"
		}
	},
	[6080240] = {
		skin_icon = "skin_icon_6080240",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303136",
		skin_interface_effect = "fxui_dress_touxiang_2025food",
		skin_name = "skin_design_6080240",
		skin_interface_imge2 = {
			"decorate_bubble_6080240_1",
			"decorate_bubble_6080240_2",
			"decorate_bubble_6080240_3",
			"decorate_bubble_6080240_4"
		}
	},
	[6080250] = {
		skin_icon = "skin_icon_6080250",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303137",
		skin_interface_effect = "fxui_dress_touxiang_2025moon",
		skin_name = "skin_design_6080250",
		skin_interface_imge2 = {
			"decorate_bubble_6080250_1",
			"decorate_bubble_6080250_2",
			"decorate_bubble_6080250_3",
			"decorate_bubble_6080250_4"
		}
	},
	[6080260] = {
		skin_interface_imge1 = "decorate_frame_6080260",
		get_show = "item_icon_303138",
		skin_icon = "skin_icon_6080260",
		skin_name = "skin_design_6080260",
		skin_interface_effect = "fx_dress_2024xinnian_gx_01",
		skin_interface_imge2 = {
			"decorate_bubble_6080260_1",
			"decorate_bubble_6080260_2",
			"decorate_bubble_6080260_3",
			"decorate_bubble_6080260_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080260_3_ar"
		}
	},
	[6080270] = {
		skin_icon = "skin_icon_6080270",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303139",
		skin_interface_effect = "fxui_dress_valentine2026_girl_yly",
		skin_name = "skin_design_6080270",
		skin_interface_imge2 = {
			"decorate_bubble_6080270_1",
			"decorate_bubble_6080270_2",
			"decorate_bubble_6080270_3",
			"decorate_bubble_6080270_4"
		}
	},
	[6080280] = {
		skin_icon = "skin_icon_6080280",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303140",
		skin_interface_effect = "fxui_dress_valentine2026_man_yly",
		skin_name = "skin_design_6080280",
		skin_interface_imge2 = {
			"decorate_bubble_6080280_1",
			"decorate_bubble_6080280_2",
			"decorate_bubble_6080280_3",
			"decorate_bubble_6080280_4"
		}
	},
	[6080290] = {
		skin_icon = "skin_icon_6080290",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303141",
		skin_interface_effect = "fxui_dress_sunshine_txiang_yly",
		skin_name = "skin_design_6080290",
		skin_interface_imge2 = {
			"decorate_bubble_6080290_1",
			"decorate_bubble_6080290_2",
			"decorate_bubble_6080290_3"
		}
	},
	[6080300] = {
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303142",
		skin_icon = "skin_icon_6080300",
		skin_name = "skin_design_6080300",
		skin_interface_effect = "fxui_dress_anniversary_oneyear_jxm",
		skin_interface_imge2 = {
			"decorate_bubble_6080300_1",
			"decorate_bubble_6080300_2",
			"decorate_bubble_6080300_3",
			"decorate_bubble_6080300_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080300_3_ar"
		}
	},
	[6080310] = {
		skin_icon = "skin_icon_6080310",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303143",
		skin_interface_effect = "fxui_decorate_frame_tx_cmg",
		skin_name = "skin_design_6080310",
		skin_interface_imge2 = {
			"decorate_bubble_6080310_1",
			"decorate_bubble_6080310_2",
			"decorate_bubble_6080310_3",
			"decorate_bubble_6080310_4"
		}
	},
	[6080320] = {
		skin_icon = "skin_icon_6080320",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303144",
		skin_interface_effect = "fx_dress_zhongdongyue_gx_01",
		skin_name = "skin_design_6080320",
		skin_interface_effect_ru = "fx_dress_zhongdongyue_gx_01_ru",
		skin_interface_imge2 = {
			"decorate_bubble_6080320_1",
			"decorate_bubble_6080320_2",
			"decorate_bubble_6080320_3",
			"decorate_bubble_6080320_4"
		}
	},
	[6080330] = {
		skin_interface_imge1 = "decorate_frame_6080330",
		get_show = "item_icon_303145",
		skin_icon = "skin_icon_6080330",
		skin_name = "skin_design_6080330",
		skin_interface_imge2 = {
			"decorate_bubble_6080330_1",
			"decorate_bubble_6080330_2",
			"decorate_bubble_6080330_3",
			"decorate_bubble_6080330_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080330_3_ar",
			"decorate_bubble_6080330_4_ar"
		}
	},
	[6080340] = {
		skin_interface_imge1 = "decorate_frame_6080340",
		get_show = "item_icon_303146",
		skin_icon = "skin_icon_6080340",
		skin_name = "skin_design_6080340",
		skin_interface_imge2 = {
			"decorate_bubble_6080340_1",
			"decorate_bubble_6080340_2",
			"decorate_bubble_6080340_3",
			"decorate_bubble_6080340_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080340_3_ar",
			"decorate_bubble_6080340_4_ar"
		}
	},
	[6080350] = {
		skin_icon = "skin_icon_6080350",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303153",
		skin_interface_effect = "fxui_dress_touxiang_threeallianceswar_lxy",
		skin_name = "skin_design_6080350",
		skin_interface_imge2 = {
			"decorate_bubble_6080350_1",
			"decorate_bubble_6080350_2",
			"decorate_bubble_6080350_3",
			"decorate_bubble_6080350_4"
		}
	},
	[6080360] = {
		skin_icon = "skin_icon_6080360",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303154",
		skin_interface_effect = "fxui_dress_touxiang_esater_2024_jxm",
		skin_name = "skin_design_6080360",
		skin_interface_imge2 = {
			"decorate_bubble_6080360_1",
			"decorate_bubble_6080360_2",
			"decorate_bubble_6080360_3",
			"decorate_bubble_6080360_4"
		}
	},
	[6080370] = {
		skin_icon = "skin_icon_6080370",
		skin_interface_imge1 = "decorate_frame_6080370",
		get_show = "item_icon_303155",
		skin_interface_effect = "fxui_dress_touxiang_chunjie_lxy",
		skin_name = "skin_design_6080370",
		skin_interface_imge2 = {
			"decorate_bubble_6080370_1",
			"decorate_bubble_6080370_2",
			"decorate_bubble_6080370_3",
			"decorate_bubble_6080370_4"
		}
	},
	[6080380] = {
		skin_icon = "skin_icon_6080380",
		skin_interface_imge1 = "decorate_frame_6080380",
		get_show = "item_icon_303159",
		skin_interface_effect = "fxui_dress_touxiang_moguc_yly",
		skin_name = "skin_design_6080380",
		skin_interface_imge2 = {
			"decorate_bubble_6080380_1",
			"decorate_bubble_6080380_2",
			"decorate_bubble_6080380_3",
			"decorate_bubble_6080380_4"
		}
	},
	[6080390] = {
		skin_icon = "skin_icon_2608060",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303115",
		skin_interface_effect = "fxui_dress_shemeilt_txk_yly",
		skin_name = "skin_design_26080060",
		skin_interface_imge2 = {
			"decorate_bubble_26080060_1",
			"decorate_bubble_26080060_2",
			"decorate_bubble_26080060_3",
			"decorate_bubble_26080060_4"
		}
	},
	[6080400] = {
		skin_interface_effect = "fxui_dress_anniversary_childrens2026_jxm",
		get_show = "item_icon_303206",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show_ru = "item_icon_303206_ru",
		skin_icon = "skin_icon_6080400",
		skin_interface_effect_ru = "fxui_dress_anniversary_childrens2026_jxm_ru",
		skin_icon_ru = "skin_icon_6080400_ru",
		skin_name = "skin_design_6080400",
		skin_interface_imge2 = {
			"decorate_bubble_6080400_1",
			"decorate_bubble_6080400_2",
			"decorate_bubble_6080400_3",
			"decorate_bubble_6080400_4"
		}
	},
	[6080410] = {
		skin_icon = "skin_icon_6080410",
		skin_interface_imge1 = "decorate_frame_6080410",
		get_show = "item_icon_303162",
		skin_interface_effect = "fxui_dress_qieyundong_txk_yly",
		skin_name = "skin_design_6080410",
		skin_interface_imge2 = {
			"decorate_bubble_6080410_1",
			"decorate_bubble_6080410_2",
			"decorate_bubble_6080410_3",
			"decorate_bubble_6080410_4"
		}
	},
	[6080440] = {
		skin_icon = "skin_icon_6080440",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303166",
		skin_interface_effect = "fxui_dress_kaifu_txk_yly",
		skin_name = "skin_design_6080440",
		skin_interface_imge2 = {
			"decorate_bubble_6080440_1",
			"decorate_bubble_6080440_2",
			"decorate_bubble_6080440_3",
			"decorate_bubble_6080440_4"
		}
	},
	[6080460] = {
		skin_icon = "skin_icon_6080460",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303171",
		skin_interface_effect = "fxui_dress_touxiang_bazhu_jxm",
		skin_name = "skin_design_6080460",
		skin_interface_imge2 = {
			"decorate_bubble_6080460_1",
			"decorate_bubble_6080460_2",
			"decorate_bubble_6080460_3",
			"decorate_bubble_6080460_4"
		}
	},
	[6080490] = {
		skin_icon = "skin_icon_6080490",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303174",
		skin_interface_effect = "fxui_dress_24Christmas_wwj",
		skin_name = "skin_design_6080490",
		skin_interface_imge2 = {
			"decorate_bubble_6080490_1",
			"decorate_bubble_6080490_2",
			"decorate_bubble_6080490_3",
			"decorate_bubble_6080490_4"
		}
	},
	[6080500] = {
		skin_interface_imge1 = "decorate_frame_6080500",
		get_show = "item_icon_303175",
		skin_icon = "skin_icon_6080500",
		skin_name = "skin_design_6080500",
		skin_interface_effect = "fxui_dress_kuanian2025_txk_yly",
		skin_interface_imge2 = {
			"decorate_bubble_6080500_1",
			"decorate_bubble_6080500_2",
			"decorate_bubble_6080500_3",
			"decorate_bubble_6080500_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_6080500_3_ar"
		}
	},
	[6080510] = {
		skin_icon = "skin_icon_6080510",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_303176",
		skin_interface_effect = "fxui_dress_touxiang_spring2026_jxm",
		skin_name = "skin_design_6080510",
		skin_interface_effect_ru = "fxui_dress_touxiang_spring2026_jxm_ru",
		skin_interface_imge2 = {
			"decorate_bubble_6080510_1",
			"decorate_bubble_6080510_2",
			"decorate_bubble_6080510_3",
			"decorate_bubble_6080510_4"
		}
	},
	[6081480] = {
		skin_icon = "skin_icon_6081480",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_781904",
		designer_name = "skin_designer_6081480",
		skin_name = "skin_design_6081480",
		skin_designer = 1,
		skin_interface_effect = "fxui_dress_anniversary_oneyear03_jxm",
		skin_interface_imge2 = {
			"decorate_bubble_6081480_1",
			"decorate_bubble_6081480_2",
			"decorate_bubble_6081480_3",
			"decorate_bubble_6081480_4"
		}
	},
	[6081490] = {
		skin_icon = "skin_icon_6081490",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_781905",
		skin_interface_effect = "fxui_dress_anniversary_oneyear04_jxm",
		skin_name = "skin_design_6081490",
		skin_interface_imge2 = {
			"decorate_bubble_6081490_1",
			"decorate_bubble_6081490_2",
			"decorate_bubble_6081490_3",
			"decorate_bubble_6081490_4"
		}
	},
	[6085010] = {
		skin_icon = "skin_icon_6085010",
		skin_interface_imge1 = "decorate_frame_6085010",
		get_show = "item_icon_2303104",
		skin_name = "skin_design_6085010",
		skin_interface_imge2 = {
			"decorate_bubble_6085010_1",
			"decorate_bubble_6085010_2",
			"decorate_bubble_6085010_3",
			"decorate_bubble_6085010_4"
		}
	},
	[6085020] = {
		skin_icon = "skin_icon_6085020",
		skin_interface_imge1 = "decorate_frame_6085020",
		get_show = "item_icon_2303107",
		skin_name = "skin_design_6085020",
		skin_interface_imge2 = {
			"decorate_bubble_6085020_1",
			"decorate_bubble_6085020_2",
			"decorate_bubble_6085020_3",
			"decorate_bubble_6085020_4"
		}
	},
	[6090000] = {},
	[6090010] = {
		skin_scene_imge1 = "3d_world_building_bouncingpumpkin",
		skin_scene_imge2 = "fx_dress_wanshengjie_change01_lxy"
	},
	[6090020] = {
		skin_scene_imge1 = "3d_world_building_clownbox",
		skin_scene_imge2 = "fx_dress_wanshengjie_change02_lxy"
	},
	[26080090] = {
		skin_icon = "skin_icon_26080090",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303127",
		skin_interface_effect = "fxui_dress_touxiang_2026peach",
		skin_name = "skin_design_26080090",
		skin_interface_imge2 = {
			"decorate_bubble_26080090_1",
			"decorate_bubble_26080090_2",
			"decorate_bubble_26080090_3",
			"decorate_bubble_26080090_4"
		}
	},
	[26080390] = {
		skin_icon = "skin_icon_26080390",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303120",
		skin_interface_effect = "fx_dress_touxiang_cn2025guoqing",
		skin_name = "skin_design_26080390",
		skin_interface_imge2 = {
			"decorate_bubble_26080390_1",
			"decorate_bubble_26080390_2",
			"decorate_bubble_26080390_3",
			"decorate_bubble_26080390_4"
		}
	},
	[26080410] = {
		get_show = "item_icon_26080410",
		skin_interface_effect = "fxui_dress_touxiang_cn2026yuandan",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show_ru = "item_icon_26080410_ru",
		skin_icon = "skin_icon_26080410",
		skin_interface_effect_ru = "fxui_dress_touxiang_cn2026yuandan_ru",
		skin_icon_ru = "skin_icon_26080410_ru",
		skin_name = "cn_skin_design_26060410",
		skin_interface_imge2 = {
			"decorate_bubble_26080410_1",
			"decorate_bubble_26080410_2",
			"decorate_bubble_26080410_3",
			"decorate_bubble_26080410_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_26080410_3_ar"
		}
	},
	[26080460] = {
		skin_icon = "skin_icon_26080460",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303171",
		skin_interface_effect = "fxui_dress_touxiang_bazhuzhiyuan_jxm",
		skin_name = "skin_design_26080460",
		skin_interface_imge2 = {
			"decorate_bubble_26080460_1",
			"decorate_bubble_26080460_2",
			"decorate_bubble_26080460_3",
			"decorate_bubble_26080460_4"
		}
	},
	[26080500] = {
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_2303160",
		skin_icon = "skin_icon_26080500",
		skin_name = "skin_design_26080500",
		skin_interface_effect = "fxui_dress_anniversary_oneyear02_jxm",
		skin_interface_imge2 = {
			"decorate_bubble_26080500_1",
			"decorate_bubble_26080500_2",
			"decorate_bubble_26080500_3",
			"decorate_bubble_26080500_4"
		},
		skin_interface_imge4 = {
			"decorate_bubble_26080500_3_ar"
		}
	},
	[6081440] = {
		skin_icon = "skin_icon_6081440",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_781901",
		skin_interface_effect = "fx_dress_touxiang_2026whitebear",
		skin_name = "skin_design_6081440",
		condition = slot1.dup2,
		skin_interface_imge2 = {
			"decorate_bubble_6081440_1",
			"decorate_bubble_6081440_2",
			"decorate_bubble_6081440_3",
			"decorate_bubble_6081440_4"
		}
	},
	[6081460] = {
		skin_icon = "skin_icon_6081460",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_781902",
		skin_interface_effect = "fxui_dress_touxiang_worldcup2026",
		skin_name = "skin_design_6081460",
		condition = slot1.dup2,
		skin_interface_imge2 = {
			"decorate_bubble_6081460_1",
			"decorate_bubble_6081460_2",
			"decorate_bubble_6081460_3",
			"decorate_bubble_6081460_4"
		}
	},
	[6081520] = {
		skin_icon = "skin_icon_6081520",
		skin_interface_imge1 = "decorate_frame_99999",
		get_show = "item_icon_781908",
		skin_interface_effect = "fx_dress_touxiang_webshop01",
		skin_name = "skin_design_6081520",
		condition = slot1.dup2,
		skin_interface_imge2 = {
			"decorate_bubble_6081520_1",
			"decorate_bubble_6081520_2",
			"decorate_bubble_6081520_3",
			"decorate_bubble_6081520_4"
		}
	},
	[6085001] = {
		skin_name = "skin_design_6085001",
		skin_icon = "skin_icon_6085001",
		skin_scene_imge3 = {
			"DressItem_6085001"
		}
	},
	[6085002] = {
		skin_icon = "skin_icon_6085002",
		get_show = "item_icon_782302",
		skin_name = "skin_design_6085002",
		condition = slot1.dup2,
		skin_interface_imge7 = {
			"decorate_card_6085002_1_02",
			"decorate_card_6085002_2",
			"decorate_card_6085002_3",
			"decorate_card_6085002_4",
			"decorate_card_6085002_5",
			"decorate_card_6085002_6",
			"decorate_card_6085002_7"
		},
		skin_scene_imge3 = {
			"DressItem_6085002"
		}
	},
	[6085003] = {
		skin_icon = "skin_icon_6085003",
		get_show = "item_icon_782305",
		skin_name = "skin_design_6085003",
		condition = slot1.dup2,
		skin_interface_imge7 = {
			"decorate_card_6085003_1_02",
			"decorate_card_6085003_2",
			"decorate_card_6085003_3",
			"decorate_card_6085003_4",
			"decorate_card_6085003_5",
			"decorate_card_6085003_6",
			"decorate_card_6085003_7"
		},
		skin_scene_imge3 = {
			"DressItem_6085003"
		}
	},
	[6087001] = {
		skin_name = "skin_design_6087001",
		skin_icon = "skin_icon_6087001",
		skin_interface_imge10 = {
			"decorate_assemble_6087001_1",
			"decorate_assemble_6087001_2",
			"decorate_assemble_6087001_3"
		},
		skin_scene_imge3 = {
			"DressItem_6087001_2",
			"DressItem_6087001"
		}
	},
	[6087002] = {
		skin_name = "skin_design_6087002",
		skin_icon = "skin_icon_6087002",
		get_show = "item_icon_782801",
		skin_interface_imge10 = {
			"decorate_assemble_6087002_1",
			"decorate_assemble_6087002_2",
			"decorate_assemble_6087002_3"
		},
		skin_interface_imge11 = {
			"WorldAllianceMarchComplexAttackItem_Skin1",
			"WorldAllianceMarchComplexInfoItem_Skin1",
			"WorldAllianceMarchDetailAttackItem_Skin1"
		},
		skin_scene_imge3 = {
			"DressItem_6087002_2",
			"DressItem_6087002"
		}
	}
}) do
	setmetatable(slot17, slot12)
end

slot12.__metatable = false

return slot2
