slot0 = {
	isupgrade = 1,
	child_point_prefab = "",
	click_sound = "",
	Correction_temperature = 0,
	cover = "",
	upgrade_interface_type = 0,
	resources_icon = "",
	islivelihood = 0,
	burning_effect = "",
	init_lv = 1,
	build_bubble = 1,
	isbuild = 1,
	warm_type = 3,
	isdetails = 1,
	ftype = 102,
	clearing_model = "city_building_td_arrowTower_00",
	furniture_ini = {},
	coordinates2 = {},
	td_coordinates = {},
	offset_position = {
		-2,
		0,
		-2
	},
	ack_def_pattern = {
		2
	},
	host_coordinates = {},
	ui_bubble = {
		0.06,
		0,
		5,
		0
	},
	td_cover = {},
	grade_board = {},
	show = {}
}
slot1 = {
	dup1 = {},
	dup2 = {
		101,
		1
	},
	dup3 = {
		-7,
		0,
		-7
	},
	dup4 = {
		7.5,
		0,
		-56.5,
		13,
		0,
		-52
	},
	dup5 = {
		-3.8,
		0,
		-1.5,
		107
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
	{
		isbuild = 0,
		name = "builddes_name_301",
		build_bubble = 0,
		bid = 301,
		warm_type = 1,
		ftype = 1,
		clearing_model = "city_building_furnace_00",
		coordinates = {
			0,
			0,
			0,
			0
		},
		ack_def_pattern = {
			1
		},
		host_coordinates = {
			0,
			0,
			-8.6,
			0,
			0,
			-5.57
		},
		ui_bubble = slot1.dup1
	},
	{
		name = "builddes_name_302",
		bid = 302,
		child_point_prefab = "city_building_sawmill",
		resources_icon = "item_icon_103",
		warm_type = 2,
		islivelihood = 1,
		ftype = 2,
		clearing_model = "city_building_sawmill_00",
		furniture_ini = {
			401,
			1
		},
		coordinates = {
			27,
			0,
			27,
			42
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			-16,
			0,
			5.7,
			-23.6,
			0,
			6.2
		}
	},
	{
		name = "builddes_name_303",
		bid = 303,
		child_point_prefab = "city_building_coalmine",
		resources_icon = "item_icon_104",
		warm_type = 2,
		islivelihood = 1,
		ftype = 3,
		clearing_model = "city_building_coalmine_00",
		furniture_ini = {
			501,
			1
		},
		coordinates = {
			37,
			0,
			8,
			-10
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			26,
			0,
			-5.5,
			28.8,
			0,
			-1.65
		}
	},
	{
		name = "builddes_name_304",
		Correction_temperature = -5,
		bid = 304,
		child_point_prefab = "city_building_ironworks",
		resources_icon = "item_icon_105",
		islivelihood = 1,
		ftype = 4,
		clearing_model = "city_building_ironworks_00",
		furniture_ini = {
			601,
			1
		},
		coordinates = {
			36,
			0,
			-9.5,
			15
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			38.2,
			0,
			22.7,
			41,
			0,
			26
		}
	},
	{
		name = "builddes_name_305",
		bid = 305,
		child_point_prefab = "city_building_hunter_cabin",
		resources_icon = "item_icon_102",
		warm_type = 2,
		islivelihood = 1,
		ftype = 5,
		clearing_model = "city_building_hunter_cabin_00",
		coordinates = {
			10,
			0,
			36,
			17
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			-9.6,
			0,
			24.5,
			-9.6,
			0,
			30
		}
	},
	{
		name = "builddes_name_306",
		bid = 306,
		child_point_prefab = "city_building_kitchen",
		resources_icon = "resource_icon_food_001",
		warm_type = 2,
		islivelihood = 1,
		ftype = 6,
		clearing_model = "city_building_kitchen_00",
		furniture_ini = {
			204,
			1,
			205,
			1,
			208,
			1,
			201,
			1
		},
		coordinates = {
			0,
			0,
			21.5,
			0
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			10,
			0,
			1.5,
			12,
			0,
			6.5
		}
	},
	{
		name = "builddes_name_307",
		Correction_temperature = -5,
		bid = 307,
		child_point_prefab = "city_building_hospital",
		islivelihood = 1,
		ftype = 7,
		clearing_model = "city_building_hospital_00",
		furniture_ini = {
			701,
			1,
			702,
			1,
			703,
			1
		},
		coordinates = {
			-14,
			0,
			36,
			-22
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			-25,
			0,
			-4.5,
			-23.5,
			0,
			-0.5
		}
	},
	{
		name = "builddes_name_308",
		bid = 308,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			18.5,
			0,
			1,
			86
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			-0.6,
			0,
			11.3,
			3.9,
			0,
			13.7
		},
		grade_board = {
			-2.4,
			0,
			-4,
			-22.5
		}
	},
	{
		name = "builddes_name_309",
		bid = 309,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			14.5,
			0,
			12.5,
			51
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			5.8,
			0,
			11.3,
			12.1,
			0,
			13.7
		},
		grade_board = {
			-2.5,
			0,
			-3.5,
			0
		}
	},
	{
		name = "builddes_name_310",
		bid = 310,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-18.5,
			0,
			0,
			-91
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			14.7,
			0,
			11.3,
			21.3,
			0,
			13.7
		},
		grade_board = slot1.dup5
	},
	{
		name = "builddes_name_311",
		bid = 311,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-15,
			0,
			13,
			-51.5
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			24.4,
			0,
			11.3,
			30.4,
			0,
			13.7
		},
		grade_board = {
			-4.5,
			0,
			-1.9,
			74
		}
	},
	{
		name = "builddes_name_312",
		bid = 312,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-33.5,
			0,
			-8.5,
			-101
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			0.8,
			0,
			24.2,
			6.6,
			0,
			24.2
		},
		grade_board = {
			-4.4,
			0,
			-1.9,
			113.5
		}
	},
	{
		name = "builddes_name_313",
		bid = 313,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-34.5,
			0,
			3.5,
			-88
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			8.1,
			0,
			24.2,
			15.1,
			0,
			24.2
		},
		grade_board = slot1.dup5
	},
	{
		name = "builddes_name_314",
		bid = 314,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-31.5,
			0,
			15.5,
			-60
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			16.9,
			0,
			24.2,
			24.4,
			0,
			24.2
		},
		grade_board = {
			-4,
			0,
			-0.5,
			81.5
		}
	},
	{
		name = "builddes_name_315",
		bid = 315,
		child_point_prefab = "city_building_dorm",
		warm_type = 2,
		islivelihood = 2,
		ftype = 8,
		clearing_model = "city_building_dorm_00",
		furniture_ini = slot1.dup2,
		coordinates = {
			-25.5,
			0,
			25,
			-45
		},
		offset_position = slot1.dup3,
		host_coordinates = {
			26.7,
			0,
			24.2,
			33.4,
			0,
			24.2
		},
		grade_board = {
			-3.5,
			0,
			-0.5,
			67.5
		}
	},
	{
		isbuild = 0,
		name = "builddes_name_316",
		Correction_temperature = -5,
		bid = 316,
		isupgrade = 0,
		ftype = 9,
		clearing_model = "city_building_no_model",
		coordinates = {
			-14.5,
			0,
			-36.5,
			0
		},
		host_coordinates = {
			15.2,
			0,
			13.9,
			17.8,
			0,
			-11.2
		}
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_318",
		isupgrade = 0,
		ftype = 11,
		bid = 318,
		clearing_model = "city_building_heroes_hall_00",
		coordinates = {
			14.5,
			0,
			-36.5,
			0
		},
		host_coordinates = {
			5.85,
			0,
			-43.14,
			5.85,
			0,
			-37.9
		}
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_319",
		burning_effect = "fx_city_law_fire_lxy",
		bid = 319,
		isupgrade = 0,
		ftype = 12,
		clearing_model = "city_building_law_office_00",
		coordinates = {
			-29.5,
			0,
			-41.5,
			0
		},
		host_coordinates = {
			4.7,
			0,
			-37.9,
			-9.32,
			0,
			-39.9
		},
		show = {
			304,
			5
		}
	},
	{
		isbuild = 0,
		name = "builddes_name_320",
		Correction_temperature = -20,
		build_bubble = 0,
		bid = 320,
		isupgrade = 0,
		isdetails = 0,
		ftype = 13,
		clearing_model = "",
		coordinates = {
			-5.5,
			0,
			-11.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_321",
		bid = 321,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 14,
		clearing_model = "city_building_infantry_quarters_00",
		coordinates = {
			16.5,
			0,
			-56,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_322",
		bid = 322,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 15,
		clearing_model = "city_building_pikeman_camp_00",
		coordinates = {
			35,
			0,
			-57,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_323",
		bid = 323,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 16,
		clearing_model = "city_anim_building_archer_house_00",
		coordinates = {
			14,
			0,
			-80,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_324",
		burning_effect = "fx_city_hospita_fire_lxy",
		bid = 324,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 17,
		clearing_model = "city_building_military_hospital_00",
		coordinates = {
			-15.5,
			0,
			-56,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_325",
		burning_effect = "fx_city_infantry_quarters_fire_lxy",
		bid = 325,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 18,
		clearing_model = "city_anim_building_embassy_00",
		coordinates = {
			31.5,
			0,
			-96.5,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_326",
		bid = 326,
		isupgrade = 0,
		ftype = 19,
		clearing_model = "city_building_arena_00",
		coordinates = {
			33.5,
			0,
			-78.5,
			0
		},
		host_coordinates = {
			12.3,
			0,
			-46.3,
			17.23,
			0,
			-46.3
		},
		show = {
			301,
			7
		}
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_327",
		bid = 327,
		upgrade_interface_type = 1,
		build_bubble = 0,
		ftype = 20,
		clearing_model = "city_building_warehouse_00",
		coordinates = {
			-30,
			0,
			-78.5,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_328",
		burning_effect = "fx_city_lighthouse_fire_lxy",
		build_bubble = 0,
		bid = 328,
		isupgrade = 0,
		ftype = 21,
		clearing_model = "city_building_lighthouse_00",
		coordinates = {
			32,
			0,
			-40,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_329",
		bid = 329,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 22,
		clearing_model = "city_anim_building_lab_00",
		coordinates = {
			-13,
			0,
			-83,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_330",
		burning_effect = "fx_city_conscription_office_fire_lxy",
		build_bubble = 0,
		bid = 330,
		isupgrade = 0,
		ftype = 23,
		clearing_model = "city_anim_building_conscription_office_00",
		coordinates = {
			-34.5,
			0,
			-58.5,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_331",
		burning_effect = "fx_city_lab_fire_lxy",
		bid = 331,
		upgrade_interface_type = 1,
		build_bubble = 0,
		ftype = 24,
		clearing_model = "city_building_command_00",
		coordinates = {
			-12.5,
			0,
			-101.5,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -20,
		name = "builddes_name_332",
		burning_effect = "fx_city_lighthouse_fire_lxy",
		bid = 332,
		upgrade_interface_type = 2,
		build_bubble = 0,
		ftype = 25,
		clearing_model = "city_building_arena_00",
		coordinates = {
			11.5,
			0,
			-100,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_335",
		build_bubble = 0,
		bid = 335,
		isupgrade = 0,
		ftype = 27,
		clearing_model = "city_building_monument_00",
		coordinates = {
			0,
			0,
			-68,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		isupgrade = 0,
		name = "builddes_name_336",
		Correction_temperature = -5,
		bid = 336,
		build_bubble = 0,
		ftype = 28,
		clearing_model = "city_building_firecrystal_alchemist_workshop_00",
		coordinates = {
			12.5,
			0,
			-118,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_337",
		init_lv = 35,
		bid = 337,
		build_bubble = 0,
		ftype = 29,
		clearing_model = "city_anim_building_firecrystal_wra_cademy_00",
		coordinates = {
			-17,
			0,
			-119.5,
			0
		},
		ui_bubble = slot1.dup1
	},
	{
		isbuild = 0,
		name = "builddes_name_338",
		Correction_temperature = -5,
		build_bubble = 0,
		bid = 338,
		isupgrade = 0,
		ftype = 30,
		clearing_model = "",
		coordinates = {
			26.5,
			0,
			73.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		Correction_temperature = -5,
		name = "builddes_name_339",
		build_bubble = 0,
		bid = 339,
		isupgrade = 0,
		ftype = 31,
		clearing_model = "city_building_pet_home_00",
		coordinates = {
			-32,
			0,
			-96,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		name = "builddes_name_got_01",
		burning_effect = "fx_city_gate_fire_lxy",
		bid = 401,
		upgrade_interface_type = 2,
		islivelihood = 2,
		ftype = 101,
		clearing_model = "city_building_td_gate_01_00",
		coordinates = {
			0,
			0,
			-27,
			0
		},
		host_coordinates = {
			0,
			0,
			-30,
			2,
			0,
			-28
		},
		show = {
			302,
			1
		}
	},
	{
		name = "builddes_name_got_04",
		burning_effect = "fx_city_gate_fire_lxy",
		bid = 402,
		upgrade_interface_type = 2,
		islivelihood = 2,
		ftype = 101,
		clearing_model = "city_building_td_gate_02b_00",
		coordinates = {
			0,
			0,
			-115,
			0
		},
		td_coordinates = {
			0,
			0,
			-130,
			0
		},
		host_coordinates = {
			0,
			0,
			-65.9,
			3,
			0,
			-61.7
		}
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_02",
		islivelihood = 2,
		bid = 407,
		coordinates = {
			-13,
			0,
			-17,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = {
			-0.3,
			0,
			-22.7,
			-2.77,
			0,
			-18
		}
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_08",
		islivelihood = 2,
		bid = 408,
		coordinates = {
			13,
			0,
			-17,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = {
			8.5,
			0,
			-22,
			12.5,
			0,
			-19.2
		}
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_09",
		islivelihood = 2,
		bid = 409,
		coordinates = {
			-43.5,
			0,
			-10.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = {
			-0.1,
			0,
			-55.6,
			-1.9,
			0,
			-50.6
		}
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_10",
		islivelihood = 2,
		bid = 410,
		coordinates = {
			53.5,
			0,
			-14,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = slot1.dup4
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_11",
		islivelihood = 2,
		bid = 411,
		coordinates = {
			-42.5,
			0,
			-79,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = slot1.dup4,
		grade_board = {
			-1.5,
			0,
			-3,
			34
		}
	},
	{
		upgrade_interface_type = 2,
		name = "builddes_name_got_12",
		islivelihood = 2,
		bid = 412,
		coordinates = {
			43.5,
			0,
			-85.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = slot1.dup4
	},
	{
		isbuild = 0,
		name = "builddes_name_got_15",
		build_bubble = 0,
		bid = 451,
		isupgrade = 0,
		isdetails = 0,
		ftype = 103,
		clearing_model = "",
		coordinates = {
			5,
			0,
			-11.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		islivelihood = 2,
		name = "builddes_name_got_13",
		bid = 413,
		upgrade_interface_type = 2,
		coordinates = {
			-28.5,
			0,
			-108.5,
			0
		},
		coordinates2 = {
			-30.5,
			0,
			-119,
			0
		},
		td_coordinates = {
			-30.5,
			0,
			-119,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = slot1.dup4,
		grade_board = {
			-3,
			0,
			-0.9,
			34
		}
	},
	{
		islivelihood = 2,
		name = "builddes_name_got_14",
		bid = 414,
		upgrade_interface_type = 2,
		coordinates = {
			24.5,
			0,
			-108.5,
			0
		},
		coordinates2 = {
			29.5,
			0,
			-119,
			0
		},
		td_coordinates = {
			29.5,
			0,
			-119,
			0
		},
		ack_def_pattern = slot1.dup1,
		host_coordinates = slot1.dup4
	},
	{
		isbuild = 0,
		name = "builddes_name_340",
		Correction_temperature = -5,
		cover = "city_anim_building_pier_00_a",
		build_bubble = 0,
		bid = 340,
		isupgrade = 0,
		ftype = 32,
		clearing_model = "",
		coordinates = {
			52,
			0,
			-100.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	},
	{
		cover = "city_anim_building_expert_academy_00_a",
		name = "builddes_name_341",
		Correction_temperature = -5,
		build_bubble = 0,
		bid = 341,
		isupgrade = 0,
		ftype = 33,
		clearing_model = "city_anim_building_expert_academy_00",
		coordinates = {
			-52,
			0,
			-105.5,
			0
		},
		ack_def_pattern = slot1.dup1,
		ui_bubble = slot1.dup1
	}
}) do
	setmetatable(slot17, slot12)
end

slot12.__metatable = false

return slot2
