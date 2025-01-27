-- -- Missile
local function calcPiercingMass(warhead)
	warhead.piercing_mass  = warhead.mass;
	if (warhead.expl_mass/warhead.mass > 0.1) then
		warhead.piercing_mass  = warhead.mass/5.0;
	end
end

local function simple_aa_warhead(power, caliber) -- By Saint
    local res = {};

	res.caliber = caliber
	res.mass = power; --old explosion damage effect
    res.expl_mass = power;
    res.other_factors = {1, 1, 1};
    res.obj_factors = {1, 1};
    res.concrete_factors = {1, 1, 1};
    res.cumulative_factor = 0;
    res.concrete_obj_factor = 0.0;
    res.cumulative_thickness = 0.0;
    
	calcPiercingMass(res)
    return res;
end

local SAHQ2 = {
	category = CAT_MISSILES,
	name = "SAHQ2",
	display_name = _("HQ-2 Guideline"),
	wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_SA_Missile,WSTYPE_PLACEHOLDER};
	Escort = 3,
	Head_Type = 6,
	sigma = {100, 100, 100},
	M = 2400.0,
	H_max = 30000.0,
	H_min = 100,
	Diam = 500.0,
	Cx_pil = 1,
	D_max = 35000.0,
	D_min = 6000.0,
	Head_Form = 1,
	Life_Time = 60.0,
	Nr_max = 9,
	v_min = 170.0,
	v_mid = 338.0,
	Mach_max = 3.5,
	t_b = 0.0,
	t_acc = 5.0, --Is 3 seconds in reality, but 1st stage cutoff is at 550 m/s, so 5 seconds gives us a more realistic acceleration profile.
	t_marsh = 25.0,
	Range_max = 50000.0,
	H_min_t = 100.0,
	Fi_start = 3.14152,
	Fi_rak = 3.14152,
	Fi_excort = 0.75,
	Fi_search = 99.9,
	OmViz_max = 99.9,
	ccm_k0 = 1.0,
	PN_coeffs = {3,
					2000.0 ,1.0,
					8000.0, 0.5,
					20000.0, 0.2},
	warhead 		= 
	{
		mass 					= 302; 
		expl_mass 				= 302; -- aa warhead, need to enhance for effect on F-14
		other_factors 			= {1, 1, 1};
		obj_factors 			= {1, 1};
		concrete_factors 		= {1, 1, 1};
		cumulative_factor 		= 0;
		concrete_obj_factor 	= 0.0;
		cumulative_thickness 	= 0.0;
		piercing_mass			= 40.0;
		caliber					= 500,
	},
	exhaust1 = { 1, 1, 1, 1 },
	X_back = -3.463,
	Y_back = 0.0,
	Z_back = 0.0,
	exhaust2 = {0.9, 0.9, 0.9, 0.05 },
	X_back_acc = -6.0,
	Y_back_acc = 0.0,
	Z_back_acc = 0.0,
	Reflection = 0.3967,
	KillDistance = 65.0,
	shape_table_data = 
	{
		{
			name	 = "HQ-2";
			file  	 = "S_75_Rocket";
			life  	 = 1;
			fire  	 = { 0, 1};
			username = "SAHQ2";
			index = WSTYPE_PLACEHOLDER;
		},
	},
	
	fuze_proximity = {
		ignore_inp_armed	= 1,
		radius				= 65,
	},
};
declare_weapon(SAHQ2)

GT_t.LN_t._HQ2 = {}
GT_t.LN_t._HQ2.type = 4;
GT_t.LN_t._HQ2.xc = -3.26;
GT_t.LN_t._HQ2.distanceMin = 6000;
GT_t.LN_t._HQ2.distanceMax = 50000;
GT_t.LN_t._HQ2.reactionTime = 1;
GT_t.LN_t._HQ2.launch_delay = 2;
GT_t.LN_t._HQ2.maxShootingSpeed = 0;
GT_t.LN_t._HQ2.show_external_missile = true;
GT_t.LN_t._HQ2.sensor = {};
set_recursive_metatable(GT_t.LN_t._HQ2.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._HQ2.reflection_limit = 0.02;
GT_t.LN_t._HQ2.ECM_K = -1
GT_t.LN_t._HQ2.barrels_reload_type = 3 -- BarrelsReloadTypes.SEQUENTIALY;
GT_t.LN_t._HQ2.PL = {};
GT_t.LN_t._HQ2.PL[1] = {};
GT_t.LN_t._HQ2.PL[1].ammo_capacity = 1;
GT_t.LN_t._HQ2.PL[1].type_ammunition = SAHQ2.wsTypeOfWeapon;
GT_t.LN_t._HQ2.PL[1].reload_time = 13*60; -- 13 minutes
GT_t.LN_t._HQ2.PL[1].shot_delay = 0.1;
GT_t.LN_t._HQ2.BR = {
                    {pos = {-1.477, 0.459,-1.08}, drawArgument = 4},
                    {pos = {-1.477, 0.459,-0.38}, drawArgument = 5},
                    {pos = {-1.477, 0.459, 0.43}, drawArgument = 6},
                    {pos = {-1.477, 0.459, 1.15}, drawArgument = 7},
                };