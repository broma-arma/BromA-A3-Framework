private ["_tvton","_markfix"];
diag_log " ================= INITIALIZING OPTIONAL MODULES =====================";
diag_log "";
//==============================================================================
// F2 - Automatic Body Removal
//==============================================================================
if (useBodyRemoval) then { [] execVM (ENGINE_PATH+"f\common\f_addRemoveBodyEH.sqf") };

//==============================================================================
// F2 - Casualty Cap
//==============================================================================
if (useCasualtyCap) then { [casualtyGroupPlayer,CasualtyCapParam,casualtyEnding] execVM (ENGINE_PATH+"f\server\f_endOnCasualtiesCap.sqf") };
if (missionGameMode == "tvt") then {
    if (useCasualtyCap) then { [casualtyGroupEnemy,CasualtyCapParam,casualtyEnding] execVM (ENGINE_PATH+"f\server\f_endOnCasualtiesCap.sqf") };
};

// =============================================================================
// Civilian cap linked to a parameter
// =============================================================================
[civCapEnding] call INIT_civilian_casualty_cap;

//==============================================================================
// Construction Interface (COIN) Presets
//   this basically allows you to build stuff
//   customize the details inside the script.
//==============================================================================
[] call INIT_coin_settings;

//==============================================================================
// BromA - Mission Time Limit
//   Initiates the server-side countdown that ends the mission once the time limit has been reached.
//   Number = ending to be called when time runs out
//==============================================================================
[timeLimitEnding] call INIT_mission_timer;

//==============================================================================
// F2 - Group E&E Check
// This is basically used for Evade & Escape missions.
//==============================================================================
if (useEEcheck) then { [EEGroupName,EEObjectName,EEdistance,EEending] execVM (ENGINE_PATH+"f\server\f_groupEandECheck.sqf") };

//==============================================================================
// Creates a safe-zone around the respawn points  
//==============================================================================
if !(missionGameMode == "coop") then { _tvton = true; } else { _tvton = false; };
if (useSpawnProtection) then { [spawnSize, _tvton] call INIT_safe_zones };

//==============================================================================
// Creates the Setup Zone if the mission is a co-op
//==============================================================================
if !(missionGameMode == "coop") then {
    if (side player == resistance) then { _markfix = "resistance" } else { _markfix = side player };
    _resp1 = format ["respawn_%1", _markfix];
    _resp2 = format ["respawn_%1", _markfix];

    zone1 = [_resp1, setupSize, MissionSetup, missionPlayerSide] execVM (OPTIONAL_PATH+"sandi_barrier\setup.sqf");
    zone2 = [_resp2, setupSize, MissionSetup, missionEnemySide] execVM (OPTIONAL_PATH+"sandi_barrier\setup.sqf");
};

// =============================================================================
//                  Functions initialization is finished.
// =============================================================================
diag_log "";
diag_log " ================= OPTIONAL MODULES INITIALIZED ======================";
InitEngine = true;