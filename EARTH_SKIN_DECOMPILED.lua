slot0 = {
	group = 60002200,
	earth_exhibit_model = "",
	zone_id = 0,
	level = 1
}
slot2 = "__key"

slot3 = function(slot0, slot1)
	for slot5, slot6 in pairs(uv0) do
		slot6[uv1] = slot5
	end

	return slot0[uv1]
end

slot4 = "__clone"

slot5 = function(slot0, slot1)
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

slot6 = "setValue"

slot7 = function(slot0, slot1, slot2)
	rawset(slot0, slot1, slot2)
end

slot8 = {}
slot9 = "__base"

slot10 = function(slot0, slot1)
	if not uv0[slot1] then
		slot2 = {}
		uv0[slot1] = slot2

		setmetatable(slot2, {
			__index = slot0
		})
	end

	return slot2
end

slot11 = {
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

for slot15, slot16 in pairs({
	[6000220] = {
		zone_id = 610001001,
		earth_exhibit_model = "exhibit_scene_planet_01",
		level = 0
	},
	[6000490] = {
		earth_exhibit_model = "exhibit_scene_planet_02",
		zone_id = 610002002
	},
	[6000500] = {
		zone_id = 610003003,
		earth_exhibit_model = "exhibit_scene_planet_03",
		level = 2
	},
	[6000510] = {
		zone_id = 610004004,
		earth_exhibit_model = "exhibit_scene_planet_04",
		level = 3
	},
	[6000520] = {
		zone_id = 610005005,
		earth_exhibit_model = "exhibit_scene_planet_05",
		level = 4
	},
	[6000530] = {
		zone_id = 610006006,
		earth_exhibit_model = "exhibit_scene_planet_06",
		level = 5
	},
	[6030210] = {
		group = 60302100,
		level = 0
	},
	[6030510] = {
		group = 60302100
	}
}) do
	setmetatable(slot16, slot11)
end

slot11.__metatable = false

return slot1
