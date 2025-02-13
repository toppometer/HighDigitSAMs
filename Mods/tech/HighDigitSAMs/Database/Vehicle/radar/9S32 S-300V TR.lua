-- s-300v 9s32 tr

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 4;

GT.visual.shape = "9s32";
GT.visual.shape_dstr = "9s32_d";
GT.visual.fire_pos[2] = 1;

GT.snd.radarRotation = "RadarRotation";

GT.sensor = {};
GT.sensor.max_range_finding_target = 150000;
GT.sensor.min_range_finding_target = 200;
GT.sensor.max_alt_finding_target = 150000;
GT.sensor.height = 8.0;

--Burning after hit
GT.visual.fire_size = 0.5; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 900; --burning time (seconds)

GT.CustomAimPoint = {0,1.5,0}


-- weapon system

GT.WS = {};
GT.WS.maxTargetDetectionRange = 150000;
GT.WS.radar_type = 102;

-- 6 trackers, first tracker is main, other 5 are limited within 120 degree

-- 0 tracker, dummy
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0,27,0};
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)},
					};
GT.WS[ws].drawArgument1 = 11;
GT.WS[ws].omegaY = 0.174533;
GT.WS[ws].omegaZ = 0.174533;
GT.WS[ws].pidY = { p = 10, i = 0.1, d = 4};
GT.WS[ws].pidZ = { p = 10, i = 0.1, d = 4};
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].depends_on_unit = {{{"S-300V 9S457 cp"}}};
GT.WS[ws].LN[1].reactionTime = 1;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].distanceMin = 2000;
GT.WS[ws].LN[1].distanceMax = 150000;
GT.WS[ws].LN[1].reflection_limit = 0.02;
GT.WS[ws].LN[1].ECM_K = 0.4;
GT.WS[ws].LN[1].min_trg_alt = 15;
GT.WS[ws].LN[1].max_trg_alt = 150000;
GT.WS[ws].LN[1].beamWidth = math.rad(90);


for i = 1,5 do -- 5 tracker's
    ws = GT_t.inc_ws();
	GT.WS[ws] = {}
    GT.WS[ws].base = 1
    GT.WS[ws].pos = {0,0,0}
	GT.WS[ws].angles = {
					{math.rad(45), math.rad(-45), math.rad(-10), math.rad(80)},
					};
    GT.WS[ws].omegaY = 3
    GT.WS[ws].omegaZ = 3
    GT.WS[ws].LN = {}
    GT.WS[ws].LN[1] = {}
	set_recursive_metatable(GT.WS[ws].LN[1], GT.WS[1].LN[1])
end --for

GT.Name = "S-300V 9S32 tr";
GT.DisplayName = _("SAM SA-12 S-300V Grill Pan TR");
GT.DisplayNameShort = _("SA-12 TR");
GT.Rate = 20;

GT.Sensors = { RADAR = GT.Name };

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,RLS_9C32_1,
				"LR SAM",
				"SAM TR",
				"RADAR_BAND1_FOR_ARM",
				"CustomAimPoint",
				};
GT.category = "Air Defence";
GT.tags = {"Air Defence", "Tracking Radar"};
GT.Countries = {"Ukraine", "Russia"}
