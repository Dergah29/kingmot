slot0 = {
	skin_quality = 5,
	display = 4,
	skin_des = "",
	td_skin_model_relation = 0,
	sale_type = 0,
	set_type = 1,
	tips_show = "",
	permanent_item = 0,
	list_sort = 999,
	td_skin_model_relation_ru = 0,
	skin_type = 4,
	is_push_pop_up = 0,
	sale_type_condition = {},
	sale_type_condition_activity = {},
	show_condition = {},
	show_condition_activity = {},
	add_attr = {},
	show_condition_ru = {},
	sale_type_condition_ru = {}
}
slot1 = {
	dup1 = {
		39,
		1787529601
	},
	dup2 = {
		39,
		1777334401
	},
	dup3 = {
		39,
		1775001601
	},
	dup4 = {
		39,
		1782000001
	},
	dup5 = {
		39,
		1773532801
	},
	dup6 = {
		39,
		1779753601
	},
	dup7 = {
		39,
		1788134401
	},
	dup8 = {
		39,
		1785801601
	},
	dup9 = {
		39,
		1773100801
	},
	dup10 = {
		39,
		1774396801
	},
	dup11 = {
		39,
		1767571201
	},
	dup12 = {
		2966004
	},
	dup13 = {
		2511003
	},
	dup14 = {
		2911501
	},
	dup15 = {
		39,
		4084250598.0
	},
	dup16 = {
		39,
		1774915201
	},
	dup17 = {
		39,
		1761523201
	},
	dup18 = {
		39,
		1763856001
	},
	dup19 = {
		39,
		1751760000
	},
	dup20 = {
		39,
		1755388800
	},
	dup21 = {
		39,
		1759017600
	},
	dup22 = {
		39,
		1766275201
	},
	dup23 = {
		39,
		1779667201
	},
	dup24 = {
		39,
		1770940801
	},
	dup25 = {
		39,
		1777161601
	},
	dup26 = {
		39,
		1768694400
	},
	dup27 = {
		39,
		1770508801
	},
	dup28 = {
		39,
		1771200001
	},
	dup29 = {
		39,
		1766966401
	},
	dup30 = {
		2961001
	},
	dup31 = {
		10115,
		250
	},
	dup32 = {
		10116,
		250
	},
	dup33 = {
		10113,
		200
	},
	dup34 = {
		10113,
		500
	},
	dup35 = {
		10403,
		500
	},
	dup36 = {
		10403,
		1000
	},
	dup37 = {
		10114,
		200
	},
	dup38 = {
		10114,
		150
	},
	dup39 = {
		10115,
		150
	},
	dup40 = {
		39,
		1783458001
	},
	dup41 = {
		39,
		1779656401
	},
	dup42 = {
		39,
		1785704401
	},
	dup43 = {
		39,
		1787518801
	},
	dup44 = {
		39,
		1781989201
	},
	dup45 = {
		39,
		1788123601
	},
	dup46 = {
		39,
		1785790801
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
		set_type = 0,
		display = 1,
		skin_type = 6,
		skin_quality = 1
	},
	[6020050] = {
		display = 2,
		skin_type = 6,
		sale_type = 1,
		list_sort = 4,
		add_attr = slot1.dup31
	},
	[6020060] = {
		list_sort = 4,
		skin_type = 6,
		sale_type = 1,
		tips_show = "skin_icon_6020060",
		sale_type_condition = slot1.dup1,
		sale_type_condition_activity = slot1.dup12,
		show_condition = slot1.dup15,
		show_condition_activity = slot1.dup30,
		add_attr = {
			10115,
			200
		},
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup43
	},
	[6020070] = {
		display = 2,
		skin_type = 6,
		sale_type = 1,
		list_sort = 4,
		tips_show = "skin_icon_6020070",
		add_attr = slot1.dup31
	},
	[6050010] = {
		skin_quality = 1,
		display = 1,
		skin_type = 8,
		set_type = 0,
		tips_show = "skin_icon_6050010"
	},
	[6050020] = {
		display = 2,
		skin_type = 8,
		sale_type = 1,
		list_sort = 998,
		tips_show = "skin_icon_6050020",
		add_attr = slot1.dup32
	},
	[6050030] = {
		display = 2,
		skin_type = 8,
		sale_type = 1,
		list_sort = 997,
		tips_show = "skin_icon_6050030",
		add_attr = {
			10116,
			200
		}
	},
	[6000010] = {
		set_type = 0,
		display = 1,
		skin_type = 1,
		skin_quality = 1
	},
	[6000020] = {
		skin_quality = 4,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010002,
		list_sort = 1,
		permanent_item = 302503,
		tips_show = "skin_icon_6000020",
		add_attr = {
			10418,
			500
		}
	},
	[6000030] = {
		skin_quality = 4,
		display = 1,
		skin_type = 1,
		is_push_pop_up = 1,
		list_sort = 5,
		td_skin_model_relation = 3010004,
		tips_show = "skin_icon_6000030"
	},
	[6000040] = {
		permanent_item = 302506,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010003,
		list_sort = 2,
		td_skin_model_relation_ru = 3910003,
		tips_show = "skin_icon_6000040",
		add_attr = slot1.dup33
	},
	[6000050] = {
		permanent_item = 302507,
		display = 0,
		skin_type = 1,
		list_sort = 500,
		tips_show = "skin_icon_6000050",
		add_attr = slot1.dup33
	},
	[6000060] = {
		permanent_item = 302508,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010010,
		list_sort = 4,
		tips_show = "skin_icon_6000060",
		add_attr = slot1.dup33
	},
	[6000070] = {
		display = 1,
		skin_type = 1,
		list_sort = 6,
		td_skin_model_relation_ru = 3910009,
		td_skin_model_relation = 3010009
	},
	[6000080] = {
		permanent_item = 302510,
		list_sort = 527,
		td_skin_model_relation = 3010024,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000080",
		sale_type_condition = slot1.dup2,
		show_condition = slot1.dup16,
		add_attr = slot1.dup33
	},
	[6000090] = {
		td_skin_model_relation = 3010007,
		display = 1,
		skin_type = 1,
		list_sort = 8,
		td_skin_model_relation_ru = 3910007,
		tips_show = "skin_icon_6000090"
	},
	[6000100] = {
		permanent_item = 302516,
		display = 2,
		skin_type = 1,
		td_skin_model_relation = 3010012,
		list_sort = 15,
		tips_show = "skin_icon_6000100",
		add_attr = slot1.dup33
	},
	[6000110] = {
		permanent_item = 302520,
		display = 0,
		skin_type = 1,
		list_sort = 503,
		tips_show = "skin_icon_6000110",
		add_attr = {
			10113,
			300
		}
	},
	[6000120] = {
		permanent_item = 302521,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010006,
		list_sort = 11,
		tips_show = "skin_icon_6000120",
		add_attr = slot1.dup33
	},
	[6000130] = {
		permanent_item = 302525,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010005,
		list_sort = 12,
		tips_show = "skin_icon_6000130",
		add_attr = slot1.dup33
	},
	[6000140] = {
		permanent_item = 302529,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010008,
		list_sort = 13,
		tips_show = "skin_icon_6000140",
		add_attr = slot1.dup33
	},
	[6000150] = {
		permanent_item = 302533,
		td_skin_model_relation = 3010017,
		skin_type = 1,
		list_sort = 504,
		tips_show = "skin_icon_6000150",
		show_condition = slot1.dup17,
		add_attr = slot1.dup33
	},
	[6000160] = {
		permanent_item = 302537,
		td_skin_model_relation = 3010018,
		skin_type = 1,
		list_sort = 506,
		tips_show = "skin_icon_6000160",
		show_condition = slot1.dup18,
		add_attr = slot1.dup33
	},
	[6000190] = {
		permanent_item = 302549,
		display = 0,
		skin_type = 1,
		list_sort = 508,
		tips_show = "skin_icon_6000190",
		add_attr = slot1.dup33
	},
	[6000200] = {
		permanent_item = 302553,
		display = 1,
		skin_type = 1,
		td_skin_model_relation = 3010011,
		list_sort = 14,
		tips_show = "skin_icon_6000200",
		add_attr = slot1.dup33
	},
	[6000230] = {
		permanent_item = 302565,
		display = 0,
		skin_type = 1,
		list_sort = 512,
		tips_show = "skin_icon_6000230",
		add_attr = slot1.dup33
	},
	[6000260] = {
		permanent_item = 302577,
		td_skin_model_relation = 3010013,
		skin_type = 1,
		list_sort = 25,
		tips_show = "skin_icon_6000260",
		show_condition = slot1.dup19,
		add_attr = slot1.dup33
	},
	[6000220] = {
		permanent_item = 302561,
		display = 2,
		skin_type = 1,
		is_push_pop_up = 1,
		list_sort = 21,
		td_skin_model_relation = 3010014,
		tips_show = "skin_icon_6000220",
		add_attr = slot1.dup34
	},
	[6000170] = {
		permanent_item = 302541,
		td_skin_model_relation = 3010015,
		skin_type = 1,
		list_sort = 26,
		tips_show = "skin_icon_6000170",
		show_condition = slot1.dup20,
		add_attr = slot1.dup33
	},
	[6000180] = {
		permanent_item = 302545,
		td_skin_model_relation = 3010016,
		skin_type = 1,
		list_sort = 27,
		tips_show = "skin_icon_6000180",
		show_condition = slot1.dup21,
		add_attr = slot1.dup33
	},
	[6000210] = {
		permanent_item = 302557,
		list_sort = 526,
		td_skin_model_relation = 3010025,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000210",
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5,
		add_attr = slot1.dup33
	},
	[6000280] = {
		display = 2,
		skin_type = 1,
		sale_type = 1,
		list_sort = 998,
		td_skin_model_relation = 3010020,
		add_attr = slot1.dup34
	},
	[6000310] = {
		permanent_item = 302594,
		td_skin_model_relation = 3010019,
		skin_type = 1,
		list_sort = 507,
		tips_show = "skin_icon_6000310",
		show_condition = slot1.dup22,
		add_attr = slot1.dup33
	},
	[6000360] = {
		display = 2,
		skin_type = 1,
		list_sort = 997,
		td_skin_model_relation = 3010021,
		add_attr = slot1.dup33
	},
	[6000370] = {
		permanent_item = 302616,
		list_sort = 530,
		td_skin_model_relation = 3010028,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000370",
		sale_type_condition = slot1.dup4,
		show_condition = slot1.dup23,
		add_attr = slot1.dup33,
		show_condition_ru = slot1.dup41,
		sale_type_condition_ru = slot1.dup44
	},
	[6000320] = {
		permanent_item = 302598,
		list_sort = 524,
		td_skin_model_relation = 3010022,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000320",
		sale_type_condition = slot1.dup5,
		sale_type_condition_activity = slot1.dup13,
		show_condition = slot1.dup24,
		add_attr = slot1.dup33
	},
	[26000060] = {
		permanent_item = 2302601,
		list_sort = 529,
		td_skin_model_relation = 3010027,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_26000060",
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25,
		add_attr = slot1.dup33
	},
	[26000070] = {
		permanent_item = 2302611,
		list_sort = 528,
		td_skin_model_relation = 3010026,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_26000070",
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25,
		add_attr = slot1.dup33
	},
	[26000210] = {
		permanent_item = 2302557,
		display = 0,
		list_sort = 526,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_26000210",
		sale_type_condition = {
			39,
			1776297601
		},
		sale_type_condition_activity = slot1.dup14,
		show_condition = {
			39,
			1773446401
		},
		add_attr = slot1.dup33
	},
	[26000290] = {
		permanent_item = 303184,
		skin_type = 1,
		list_sort = 523,
		td_skin_model_relation = 3010501,
		show_condition = slot1.dup26,
		add_attr = slot1.dup33
	},
	[6000440] = {
		permanent_item = 780001,
		list_sort = 533,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000440",
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		add_attr = slot1.dup33,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6000450] = {
		permanent_item = 780005,
		list_sort = 532,
		td_skin_model_relation = 3010030,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000450",
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		add_attr = slot1.dup33,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6000460] = {
		permanent_item = 780009,
		list_sort = 531,
		td_skin_model_relation = 3010029,
		skin_type = 1,
		sale_type = 2,
		tips_show = "skin_icon_6000460",
		sale_type_condition = slot1.dup8,
		show_condition = slot1.dup15,
		add_attr = slot1.dup33,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup46
	},
	[6000490] = {
		permanent_item = 780021,
		display = 2,
		skin_type = 1,
		sale_type = 2,
		list_sort = 801,
		is_push_pop_up = 1,
		tips_show = "skin_icon_6000490",
		add_attr = slot1.dup33
	},
	[6000500] = {
		permanent_item = 780031,
		display = 2,
		skin_type = 1,
		sale_type = 2,
		list_sort = 802,
		is_push_pop_up = 1,
		tips_show = "skin_icon_6000500",
		add_attr = slot1.dup33
	},
	[6000510] = {
		permanent_item = 780041,
		display = 2,
		skin_type = 1,
		sale_type = 2,
		list_sort = 803,
		is_push_pop_up = 1,
		tips_show = "skin_icon_6000510",
		add_attr = slot1.dup33
	},
	[6000520] = {
		permanent_item = 780051,
		display = 2,
		skin_type = 1,
		sale_type = 2,
		list_sort = 804,
		is_push_pop_up = 1,
		tips_show = "skin_icon_6000520",
		add_attr = slot1.dup33
	},
	[6000530] = {
		permanent_item = 780061,
		display = 2,
		skin_type = 1,
		sale_type = 2,
		list_sort = 805,
		is_push_pop_up = 1,
		tips_show = "skin_icon_6000530",
		add_attr = slot1.dup33
	},
	[6030010] = {
		set_type = 0,
		display = 1,
		skin_type = 2,
		skin_quality = 1
	},
	[6030020] = {
		permanent_item = 302702,
		display = 1,
		skin_type = 2,
		list_sort = 13,
		tips_show = "skin_icon_6030020",
		add_attr = slot1.dup35
	},
	[6030030] = {
		permanent_item = 302703,
		display = 1,
		skin_type = 2,
		list_sort = 2,
		tips_show = "skin_icon_6030030",
		add_attr = slot1.dup35
	},
	[6030040] = {
		permanent_item = 302704,
		display = 1,
		skin_type = 2,
		list_sort = 3,
		tips_show = "skin_icon_6030040",
		add_attr = slot1.dup35
	},
	[6030050] = {
		permanent_item = 302705,
		display = 0,
		skin_type = 2,
		list_sort = 200,
		tips_show = "skin_icon_6030050",
		add_attr = slot1.dup35
	},
	[6030060] = {
		skin_quality = 4,
		display = 1,
		skin_type = 2,
		is_push_pop_up = 1,
		list_sort = 6,
		tips_show = "skin_icon_6030060"
	},
	[6030070] = {
		permanent_item = 302707,
		display = 1,
		skin_type = 2,
		list_sort = 5,
		tips_show = "skin_icon_6030070",
		add_attr = slot1.dup35
	},
	[6030080] = {
		list_sort = 7,
		display = 1,
		skin_type = 2,
		tips_show = "skin_icon_6030080"
	},
	[6030090] = {
		skin_type = 2,
		sale_type = 2,
		list_sort = 527,
		permanent_item = 302709,
		tips_show = "skin_icon_6030090",
		sale_type_condition = slot1.dup2,
		show_condition = slot1.dup16,
		add_attr = slot1.dup35
	},
	[6030110] = {
		permanent_item = 302711,
		display = 2,
		skin_type = 2,
		list_sort = 15,
		tips_show = "skin_icon_6030110",
		add_attr = slot1.dup35
	},
	[6030120] = {
		permanent_item = 302712,
		display = 1,
		skin_type = 2,
		list_sort = 11,
		tips_show = "skin_icon_6030120",
		add_attr = slot1.dup35
	},
	[6030130] = {
		permanent_item = 302713,
		display = 1,
		skin_type = 2,
		list_sort = 12,
		tips_show = "skin_icon_6030130",
		add_attr = slot1.dup35
	},
	[6030140] = {
		permanent_item = 302715,
		display = 1,
		skin_type = 2,
		list_sort = 13,
		tips_show = "skin_icon_6030140",
		add_attr = slot1.dup35
	},
	[6030150] = {
		permanent_item = 302716,
		skin_type = 2,
		list_sort = 202,
		tips_show = "skin_icon_6030150",
		show_condition = slot1.dup17,
		add_attr = slot1.dup35
	},
	[6030160] = {
		permanent_item = 302717,
		skin_type = 2,
		list_sort = 204,
		tips_show = "skin_icon_6030160",
		show_condition = slot1.dup18,
		add_attr = slot1.dup35
	},
	[6030170] = {
		permanent_item = 302718,
		skin_type = 2,
		list_sort = 36,
		tips_show = "skin_icon_6030170",
		show_condition = slot1.dup20,
		add_attr = slot1.dup35
	},
	[6030180] = {
		permanent_item = 302719,
		skin_type = 2,
		list_sort = 37,
		tips_show = "skin_icon_6030180",
		show_condition = slot1.dup21,
		add_attr = slot1.dup35
	},
	[6030190] = {
		permanent_item = 302720,
		display = 0,
		skin_type = 2,
		list_sort = 206,
		tips_show = "skin_icon_6030190",
		add_attr = slot1.dup35
	},
	[6030200] = {
		skin_type = 2,
		sale_type = 2,
		list_sort = 526,
		permanent_item = 302721,
		tips_show = "skin_icon_6030200",
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5,
		add_attr = slot1.dup35
	},
	[6030210] = {
		permanent_item = 302722,
		display = 2,
		skin_type = 2,
		is_push_pop_up = 1,
		list_sort = 20,
		tips_show = "skin_icon_6030210",
		add_attr = slot1.dup36
	},
	[6030220] = {
		permanent_item = 302723,
		display = 0,
		skin_type = 2,
		list_sort = 209,
		tips_show = "skin_icon_6030220"
	},
	[6030230] = {
		permanent_item = 302724,
		display = 0,
		skin_type = 2,
		list_sort = 210,
		tips_show = "skin_icon_6030230"
	},
	[6030240] = {
		permanent_item = 302725,
		display = 0,
		skin_type = 2,
		sale_type = 2,
		list_sort = 211,
		tips_show = "skin_icon_6030240",
		add_attr = slot1.dup35
	},
	[6030260] = {
		permanent_item = 302727,
		display = 1,
		skin_type = 2,
		list_sort = 14,
		tips_show = "skin_icon_6030260",
		add_attr = slot1.dup35
	},
	[6030280] = {
		permanent_item = 302729,
		skin_type = 2,
		list_sort = 35,
		tips_show = "skin_icon_6030280",
		show_condition = slot1.dup19,
		add_attr = slot1.dup35
	},
	[6030300] = {
		display = 2,
		skin_type = 2,
		sale_type = 1,
		list_sort = 998,
		tips_show = "skin_icon_6030300",
		add_attr = slot1.dup36
	},
	[6030330] = {
		permanent_item = 302734,
		skin_type = 2,
		list_sort = 205,
		tips_show = "skin_icon_6030330",
		show_condition = slot1.dup22,
		add_attr = slot1.dup35
	},
	[6030350] = {
		permanent_item = 302736,
		list_sort = 530,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030350",
		sale_type_condition = slot1.dup4,
		show_condition = slot1.dup23,
		add_attr = slot1.dup35,
		show_condition_ru = slot1.dup41,
		sale_type_condition_ru = slot1.dup44
	},
	[6030340] = {
		permanent_item = 302735,
		list_sort = 524,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030340",
		sale_type_condition = slot1.dup5,
		sale_type_condition_activity = slot1.dup13,
		show_condition = slot1.dup24,
		add_attr = slot1.dup35
	},
	[26030070] = {
		skin_type = 2,
		sale_type = 2,
		list_sort = 529,
		permanent_item = 2302605,
		tips_show = "skin_icon_26030070",
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25,
		add_attr = slot1.dup35
	},
	[26030080] = {
		skin_type = 2,
		sale_type = 2,
		list_sort = 528,
		permanent_item = 2302615,
		tips_show = "skin_icon_26030080",
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25,
		add_attr = slot1.dup35
	},
	[26030270] = {
		permanent_item = 303188,
		skin_type = 2,
		list_sort = 523,
		show_condition = slot1.dup26,
		add_attr = slot1.dup35
	},
	[6030440] = {
		permanent_item = 781001,
		list_sort = 532,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030440",
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		add_attr = slot1.dup35,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6030460] = {
		permanent_item = 781002,
		list_sort = 531,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030460",
		sale_type_condition = slot1.dup8,
		show_condition = slot1.dup15,
		add_attr = slot1.dup35,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup46
	},
	[6030470] = {
		list_sort = 536,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030470",
		sale_type_condition = slot1.dup1,
		sale_type_condition_activity = slot1.dup12,
		show_condition = slot1.dup15,
		show_condition_activity = slot1.dup30,
		add_attr = slot1.dup35,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup43
	},
	[6030480] = {
		list_sort = 535,
		skin_type = 2,
		sale_type = 2,
		tips_show = "skin_icon_6030480",
		sale_type_condition = slot1.dup1,
		sale_type_condition_activity = slot1.dup12,
		show_condition = slot1.dup15,
		show_condition_activity = slot1.dup30,
		add_attr = slot1.dup35,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup43
	},
	[6030510] = {
		permanent_item = 781012,
		display = 2,
		skin_type = 2,
		sale_type = 2,
		list_sort = 888,
		tips_show = "skin_icon_6030510",
		add_attr = slot1.dup36
	},
	[6060010] = {
		set_type = 0,
		display = 1,
		skin_type = 3,
		skin_quality = 1
	},
	[6060020] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		permanent_item = 302902,
		list_sort = 1
	},
	[6060030] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		is_push_pop_up = 1,
		list_sort = 5
	},
	[6060040] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302904,
		list_sort = 3
	},
	[6060050] = {
		skin_quality = 4,
		display = 2,
		skin_type = 3,
		permanent_item = 302905,
		list_sort = 21
	},
	[6060060] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302906,
		list_sort = 4
	},
	[6060070] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302907,
		list_sort = 500
	},
	[6060080] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302908,
		list_sort = 501
	},
	[6060090] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302909,
		list_sort = 502
	},
	[6060100] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302910,
		list_sort = 503
	},
	[6060110] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 528,
		permanent_item = 302911,
		sale_type_condition = slot1.dup2,
		show_condition = slot1.dup16
	},
	[6060120] = {
		skin_quality = 4,
		display = 2,
		skin_type = 3,
		permanent_item = 302912,
		list_sort = 22
	},
	[6060130] = {
		list_sort = 11,
		display = 1,
		skin_type = 3,
		skin_quality = 4
	},
	[6060140] = {
		list_sort = 12,
		display = 1,
		skin_type = 3,
		skin_quality = 4
	},
	[6060150] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		permanent_item = 302917,
		list_sort = 13
	},
	[6060160] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		permanent_item = 302918,
		list_sort = 15
	},
	[6060170] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302919,
		list_sort = 505
	},
	[6060180] = {
		list_sort = 17,
		display = 2,
		skin_type = 3,
		skin_quality = 4
	},
	[6060190] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		permanent_item = 302922,
		list_sort = 18
	},
	[6060200] = {
		skin_quality = 4,
		permanent_item = 302923,
		skin_type = 3,
		list_sort = 506,
		show_condition = slot1.dup17
	},
	[6060210] = {
		skin_quality = 4,
		permanent_item = 302924,
		skin_type = 3,
		list_sort = 508,
		show_condition = slot1.dup18
	},
	[6060220] = {
		skin_quality = 4,
		permanent_item = 302925,
		skin_type = 3,
		list_sort = 54,
		show_condition = slot1.dup20
	},
	[6060230] = {
		skin_quality = 4,
		permanent_item = 302926,
		skin_type = 3,
		list_sort = 55,
		show_condition = slot1.dup21
	},
	[6060240] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302927,
		list_sort = 510
	},
	[6060250] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 521,
		permanent_item = 302928,
		sale_type_condition = slot1.dup9,
		show_condition = slot1.dup27
	},
	[6060260] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 522,
		permanent_item = 302929,
		sale_type_condition = slot1.dup9,
		show_condition = slot1.dup27
	},
	[6060270] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 526,
		permanent_item = 302930,
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5
	},
	[6060280] = {
		skin_quality = 4,
		display = 2,
		skin_type = 3,
		permanent_item = 302931,
		list_sort = 28
	},
	[6060290] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 525,
		permanent_item = 302932,
		sale_type_condition = slot1.dup10,
		show_condition = slot1.dup28
	},
	[6060300] = {
		list_sort = 20,
		skin_quality = 4,
		skin_type = 3,
		permanent_item = 302933
	},
	[6060310] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 302934,
		list_sort = 515
	},
	[6060320] = {
		skin_quality = 4,
		display = 1,
		skin_type = 3,
		permanent_item = 302935,
		list_sort = 19
	},
	[6060350] = {
		skin_quality = 4,
		permanent_item = 302938,
		skin_type = 3,
		list_sort = 53,
		show_condition = slot1.dup19
	},
	[6060380] = {
		list_sort = 998,
		display = 2,
		skin_type = 3,
		sale_type = 1
	},
	[6060400] = {
		permanent_item = 302947,
		skin_quality = 4,
		list_sort = 530,
		skin_type = 3,
		sale_type = 2,
		sale_type_condition = slot1.dup4,
		show_condition = slot1.dup23,
		show_condition_ru = slot1.dup41,
		sale_type_condition_ru = slot1.dup44
	},
	[6060410] = {
		skin_quality = 4,
		permanent_item = 302944,
		skin_type = 3,
		list_sort = 509,
		show_condition = slot1.dup22
	},
	[6060420] = {
		skin_quality = 4,
		display = 2,
		skin_type = 3,
		skin_des = "skin_ui_12",
		list_sort = 22,
		permanent_item = 303205
	},
	[6060430] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 524,
		permanent_item = 302946,
		sale_type_condition = slot1.dup5,
		sale_type_condition_activity = slot1.dup13,
		show_condition = slot1.dup24
	},
	[26060040] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 529,
		permanent_item = 2302904,
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25
	},
	[26060330] = {
		skin_quality = 4,
		display = 0,
		skin_type = 3,
		permanent_item = 303190,
		list_sort = 523
	},
	[26060350] = {
		skin_quality = 4,
		skin_type = 3,
		skin_des = "skin_ui_12",
		list_sort = 520,
		permanent_item = 303194,
		sale_type_condition = slot1.dup11,
		show_condition = slot1.dup29
	},
	[26060380] = {
		list_sort = 997,
		display = 2,
		skin_type = 3,
		skin_quality = 4
	},
	[6060440] = {
		permanent_item = 781501,
		skin_quality = 4,
		list_sort = 533,
		skin_type = 3,
		sale_type = 2,
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6060460] = {
		permanent_item = 781502,
		skin_quality = 4,
		list_sort = 532,
		skin_type = 3,
		sale_type = 2,
		sale_type_condition = slot1.dup8,
		show_condition = slot1.dup15,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup46
	},
	[6060480] = {
		skin_quality = 4,
		skin_type = 3,
		sale_type = 2,
		list_sort = 527,
		permanent_item = 781504,
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5
	},
	[6080010] = {
		skin_quality = 1,
		display = 1,
		set_type = 0,
		skin_des = "skin_ui_12"
	},
	[6080020] = {
		skin_quality = 4,
		display = 1,
		list_sort = 1,
		skin_des = "skin_ui_12"
	},
	[6080030] = {
		skin_quality = 4,
		display = 1,
		is_push_pop_up = 1,
		skin_des = "skin_ui_12",
		list_sort = 6
	},
	[6080040] = {
		permanent_item = 303108,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 3,
		add_attr = slot1.dup37
	},
	[6080050] = {
		list_sort = 23,
		permanent_item = 303109,
		skin_des = "skin_ui_12",
		add_attr = slot1.dup38
	},
	[6080060] = {
		permanent_item = 303110,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 4,
		add_attr = slot1.dup37
	},
	[6080070] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303116,
		skin_des = "skin_ui_12",
		list_sort = 5
	},
	[6080080] = {
		permanent_item = 303117,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 500,
		add_attr = slot1.dup37
	},
	[6080090] = {
		permanent_item = 303118,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 501,
		add_attr = slot1.dup37
	},
	[6080100] = {
		permanent_item = 303119,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 502,
		add_attr = slot1.dup38
	},
	[6080110] = {
		permanent_item = 303120,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 503,
		add_attr = slot1.dup38
	},
	[6080120] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 532,
		permanent_item = 303121,
		sale_type_condition = slot1.dup2,
		show_condition = slot1.dup16,
		add_attr = slot1.dup37
	},
	[6080130] = {
		list_sort = 12,
		display = 1,
		skin_des = "skin_ui_12"
	},
	[6080140] = {
		list_sort = 13,
		display = 1,
		skin_des = "skin_ui_12"
	},
	[6080150] = {
		permanent_item = 303126,
		display = 2,
		skin_des = "skin_ui_12",
		list_sort = 24,
		add_attr = slot1.dup37
	},
	[6080160] = {
		permanent_item = 303127,
		display = 1,
		skin_des = "skin_ui_12",
		list_sort = 14,
		add_attr = {
			10406,
			100
		}
	},
	[6080170] = {
		permanent_item = 303128,
		display = 1,
		skin_des = "skin_ui_12",
		list_sort = 16,
		add_attr = slot1.dup37
	},
	[6080180] = {
		permanent_item = 303129,
		display = 1,
		skin_des = "skin_ui_12",
		list_sort = 17,
		add_attr = slot1.dup37
	},
	[6080190] = {
		list_sort = 18,
		display = 2,
		skin_des = "skin_ui_12"
	},
	[6080200] = {
		permanent_item = 303132,
		display = 1,
		skin_des = "skin_ui_12",
		list_sort = 20,
		add_attr = slot1.dup38
	},
	[6080210] = {
		list_sort = 19,
		display = 1,
		skin_des = "skin_ui_12"
	},
	[6080220] = {
		permanent_item = 303134,
		skin_des = "skin_ui_12",
		list_sort = 505,
		show_condition = slot1.dup17,
		add_attr = slot1.dup37
	},
	[6080230] = {
		permanent_item = 303135,
		skin_des = "skin_ui_12",
		list_sort = 507,
		show_condition = slot1.dup18,
		add_attr = slot1.dup37
	},
	[6080240] = {
		permanent_item = 303136,
		skin_des = "skin_ui_12",
		list_sort = 44,
		show_condition = slot1.dup20,
		add_attr = slot1.dup37
	},
	[6080250] = {
		permanent_item = 303137,
		skin_des = "skin_ui_12",
		list_sort = 45,
		show_condition = slot1.dup21,
		add_attr = slot1.dup37
	},
	[6080260] = {
		permanent_item = 303138,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 509,
		add_attr = slot1.dup37
	},
	[6080270] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 521,
		permanent_item = 303139,
		sale_type_condition = slot1.dup9,
		show_condition = slot1.dup27,
		add_attr = slot1.dup38
	},
	[6080280] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 522,
		permanent_item = 303140,
		sale_type_condition = slot1.dup9,
		show_condition = slot1.dup27,
		add_attr = slot1.dup38
	},
	[6080290] = {
		list_sort = 26,
		display = 2,
		permanent_item = 303141,
		skin_des = "skin_ui_12"
	},
	[6080300] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 528,
		permanent_item = 303142,
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5,
		add_attr = slot1.dup37
	},
	[6080310] = {
		permanent_item = 303143,
		display = 2,
		skin_des = "skin_ui_12",
		list_sort = 33,
		add_attr = slot1.dup37
	},
	[6080320] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 525,
		permanent_item = 303144,
		sale_type_condition = slot1.dup10,
		show_condition = slot1.dup28,
		add_attr = slot1.dup37
	},
	[6080330] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303145,
		skin_des = "skin_ui_12",
		list_sort = 8
	},
	[6080340] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303146,
		skin_des = "skin_ui_12",
		list_sort = 7
	},
	[6080350] = {
		list_sort = 15,
		display = 1,
		skin_des = "skin_ui_12"
	},
	[6080360] = {
		list_sort = 22,
		permanent_item = 303154,
		skin_des = "skin_ui_12",
		add_attr = slot1.dup37
	},
	[6080370] = {
		permanent_item = 303155,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 519,
		add_attr = slot1.dup37
	},
	[6080380] = {
		permanent_item = 303159,
		display = 1,
		skin_des = "skin_ui_12",
		list_sort = 21,
		add_attr = slot1.dup37
	},
	[6080390] = {
		list_sort = 28,
		display = 2,
		permanent_item = 303200,
		skin_des = "skin_ui_12"
	},
	[6080400] = {
		permanent_item = 303206,
		skin_des = "skin_ui_12",
		list_sort = 534,
		sale_type = 2,
		sale_type_condition = slot1.dup4,
		show_condition = slot1.dup23,
		add_attr = slot1.dup37,
		show_condition_ru = slot1.dup41,
		sale_type_condition_ru = slot1.dup44
	},
	[6080410] = {
		permanent_item = 303162,
		skin_des = "skin_ui_12",
		list_sort = 43,
		show_condition = slot1.dup19,
		add_attr = slot1.dup37
	},
	[6080440] = {
		list_sort = 39,
		display = 2,
		skin_des = "skin_ui_12",
		add_attr = slot1.dup37
	},
	[6080460] = {
		sale_type = 1,
		display = 2,
		skin_des = "skin_ui_12",
		list_sort = 998,
		add_attr = {
			10114,
			300
		}
	},
	[6080490] = {
		permanent_item = 303174,
		skin_des = "skin_ui_12",
		list_sort = 508,
		show_condition = slot1.dup22,
		add_attr = slot1.dup37
	},
	[6080500] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303204,
		skin_des = "skin_ui_12",
		list_sort = 22
	},
	[6080510] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 524,
		permanent_item = 303176,
		sale_type_condition = slot1.dup5,
		sale_type_condition_activity = slot1.dup13,
		show_condition = slot1.dup24,
		add_attr = slot1.dup37
	},
	[6081480] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 529,
		permanent_item = 781904,
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5,
		add_attr = slot1.dup37
	},
	[6081490] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 530,
		permanent_item = 781905,
		sale_type_condition = slot1.dup3,
		show_condition = slot1.dup5,
		add_attr = slot1.dup37
	},
	[6085010] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303210,
		skin_des = "skin_ui_12",
		list_sort = 29
	},
	[6085020] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 303214,
		skin_des = "skin_ui_12",
		list_sort = 30
	},
	[6090000] = {
		skin_quality = 1,
		display = 0,
		skin_type = 5,
		list_sort = 0,
		set_type = 0
	},
	[6090010] = {
		list_sort = 0,
		display = 0,
		skin_type = 5,
		skin_quality = 4
	},
	[6090020] = {
		list_sort = 0,
		display = 0,
		skin_type = 5
	},
	[26080090] = {
		sale_type = 2,
		skin_des = "skin_ui_12",
		list_sort = 533,
		permanent_item = 2303127,
		sale_type_condition = slot1.dup6,
		show_condition = slot1.dup25,
		add_attr = slot1.dup37
	},
	[26080390] = {
		permanent_item = 303189,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 523,
		add_attr = slot1.dup37
	},
	[26080410] = {
		permanent_item = 303193,
		skin_des = "skin_ui_12",
		list_sort = 520,
		sale_type_condition = slot1.dup11,
		show_condition = slot1.dup29,
		add_attr = slot1.dup37
	},
	[26080460] = {
		skin_quality = 4,
		display = 2,
		list_sort = 997,
		skin_des = "skin_ui_12"
	},
	[26080500] = {
		permanent_item = 2303160,
		display = 0,
		skin_des = "skin_ui_12",
		list_sort = 531,
		sale_type_condition_activity = slot1.dup14,
		add_attr = slot1.dup37
	},
	[6081440] = {
		permanent_item = 781901,
		skin_des = "skin_ui_12",
		list_sort = 536,
		sale_type = 2,
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		add_attr = slot1.dup37,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6081460] = {
		permanent_item = 781902,
		skin_des = "skin_ui_12",
		list_sort = 535,
		sale_type = 2,
		sale_type_condition = slot1.dup8,
		show_condition = slot1.dup15,
		add_attr = slot1.dup37,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup46
	},
	[6081520] = {
		skin_quality = 4,
		display = 2,
		permanent_item = 781908,
		skin_des = "skin_ui_12",
		list_sort = 537,
		add_attr = slot1.dup37
	},
	[6085001] = {
		skin_quality = 1,
		display = 1,
		skin_type = 9,
		set_type = 0,
		tips_show = "skin_icon_6085001"
	},
	[6085002] = {
		permanent_item = 782302,
		list_sort = 1,
		skin_type = 9,
		sale_type = 2,
		tips_show = "skin_icon_6085002",
		sale_type_condition = slot1.dup8,
		show_condition = slot1.dup15,
		add_attr = slot1.dup39,
		show_condition_ru = slot1.dup40,
		sale_type_condition_ru = slot1.dup46
	},
	[6085003] = {
		permanent_item = 782305,
		list_sort = 2,
		skin_type = 9,
		sale_type = 2,
		tips_show = "skin_icon_6085003",
		sale_type_condition = slot1.dup7,
		show_condition = slot1.dup15,
		add_attr = slot1.dup39,
		show_condition_ru = slot1.dup42,
		sale_type_condition_ru = slot1.dup45
	},
	[6087001] = {
		skin_quality = 1,
		display = 1,
		skin_type = 11,
		set_type = 0,
		tips_show = "skin_icon_6087001"
	},
	[6087002] = {
		permanent_item = 782801,
		display = 2,
		skin_type = 11,
		list_sort = 1,
		tips_show = "skin_icon_6087002",
		add_attr = slot1.dup32
	}
}) do
	setmetatable(slot17, slot12)
end

slot12.__metatable = false

return slot2
