[] spawn {
	//Wait for mission init, in case there are variables defined some place else
	waitUntil {time > 0};
        
	//Define variables, load from profileNamespace
	CHVD_allowNoGrass = if (isNil "CHVD_allowNoGrass") then {true} else {CHVD_allowNoGrass};
	CHVD_maxView = if (isNil "CHVD_maxView") then {12000} else {CHVD_maxView};
	CHVD_maxObj = if (isNil "CHVD_maxObj") then {12000} else {CHVD_maxObj};

	CHVD_footSyncObj = profileNamespace getVariable ["CHVD_footSyncObj",false];
	CHVD_carSyncObj = profileNamespace getVariable ["CHVD_carSyncObj",false];
	CHVD_airSyncObj = profileNamespace getVariable ["CHVD_airSyncObj",false];

	CHVD_foot = (profileNamespace getVariable ["CHVD_foot",viewDistance]) min CHVD_maxView;
	CHVD_car = (profileNamespace getVariable ["CHVD_car",viewDistance]) min CHVD_maxView;
	CHVD_air = (profileNamespace getVariable ["CHVD_air",viewDistance]) min CHVD_maxView;

	CHVD_footObj = (profileNamespace getVariable ["CHVD_footObj",viewDistance]) min CHVD_maxObj;
	CHVD_carObj = (profileNamespace getVariable ["CHVD_carObj",viewDistance]) min CHVD_maxObj;
	CHVD_airObj = (profileNamespace getVariable ["CHVD_airObj",viewDistance]) min CHVD_maxObj;

	CHVD_footTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_footTerrain",25]} else {(profileNamespace getVariable ["CHVD_footTerrain",25]) min 48.9 max 3.125};
	CHVD_carTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_carTerrain",25]} else {(profileNamespace getVariable ["CHVD_carTerrain",25]) min 48.9 max 3.125};
	CHVD_airTerrain = if (CHVD_allowNoGrass) then {profileNamespace getVariable ["CHVD_airTerrain",25]} else {(profileNamespace getVariable ["CHVD_airTerrain",25]) min 48.9 max 3.125};

	//Begin initialization
	waitUntil {!isNull player};
	waitUntil {!isNull findDisplay 46};

        bon_func_keyspressed = compile preprocessFileLineNumbers (OPTIONAL_PATH+"view_distance\bon_func_keyspressed.sqf");        
        (findDisplay 46) displayAddEventHandler ["KeyDown","_this call bon_func_keyspressed"];

	//Detect when to change setting type and save
	while {true} do {
		_currentVehicle = vehicle player;
		waitUntil {_currentVehicle != vehicle player};
		[] call CHVD_fnc_updateSettings;
		saveProfileNamespace;
	};
};