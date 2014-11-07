tf_same_sw_frequencies_for_side = true;
tf_same_lr_frequencies_for_side = true;
tf_no_auto_long_range_radio = true;
ace_sys_interaction_key_self = 211;

if (isNil"alpha_grp_blu") then {alpha_grp_blu = grpNull};if (isNil"bravo_grp_blu") then {bravo_grp_blu = grpNull};if (isNil"charlie_grp_blu") then {charlie_grp_blu = grpNull};if (isNil"delta_grp_blu") then {delta_grp_blu = grpNull};
if (isNil"alpha_grp_op") then {alpha_grp_op = grpNull};if (isNil"bravo_grp_op") then {bravo_grp_op = grpNull};if (isNil"charlie_grp_op") then {charlie_grp_op = grpNull};if (isNil"delta_grp_op") then {delta_grp_op = grpNull};
if (isNil"alpha_grp_ind") then {alpha_grp_ind = grpNull};if (isNil"bravo_grp_ind") then {bravo_grpind = grpNull};if (isNil"charlie_grp_ind") then {charlie_grp_ind = grpNull};if (isNil"delta_grp_ind") then {delta_grp_ind = grpNull};
if (isNil "savedLoadouts") then { savedLoadouts = []; publicVariable "savedLoadouts" };
if (isNil"playerLives") then { playerLives = []; publicVariable "playerLives" };
if (isNil"deadPlayersArray") then { deadPlayersArray = []; publicVariable "deadPlayersArray" };
oldPlayerGear = [];
color = "white";

// =============================================================================
INIT_load_mission_settings = compile preprocessFileLineNumbers (CUSTOM_FILES_PATH+"mission-settings.sqf");
// =============================================================================

// =============================================================================
INIT_player = compile preprocessFileLineNumbers (CUSTOM_FILES_PATH+"player_init.sqf");
// =============================================================================

// =============================================================================
INIT_sp_loadout = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"initPlayerLocal.sqf");
// =============================================================================

// =============================================================================
INIT_playerGear = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"init_playerGear.sqf");
// =============================================================================

// =============================================================================
FNC_saveGear = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_saveGear.sqf");
// =============================================================================

// =============================================================================
FNC_assignGear = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_assignGear.sqf");
// =============================================================================

// =============================================================================
FNC_fixHeadbug = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_fixHeadbug.sqf");
// =============================================================================

// =============================================================================
FNC_Z_setLoadout = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_z_setLoadout.sqf");
// =============================================================================

// =============================================================================
FNC_Z_setSkill = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_z_setSkill.sqf");
// =============================================================================

// =============================================================================
FNC_Z_setMode = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_z_setMode.sqf");
// =============================================================================

// =============================================================================
FNC_Z_setAll = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_z_setAll.sqf");
// =============================================================================

// =============================================================================
FNC_arsenalLoadout = compile preprocessFileLineNumbers (MISSION_PATH+"loadout\arsenal\init.sqf");
// =============================================================================

// =============================================================================
FNC_onDisconnect = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_onDisconnect.sqf");
// =============================================================================

// =============================================================================
FNC_onConnect = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_onConnect.sqf");
// =============================================================================

// =============================================================================
INIT_spectator = { player addEventHandler ["Respawn", {_this execvm ENGINE_FUNC_PATH+"onPlayerRespawn.sqf"}] };
// =============================================================================

// =============================================================================
INIT_getTeamKill = {
    player addEventHandler ["Hit", {_this execVM (ENGINE_FUNC_PATH+"init_getTeamKill.sqf")}];
    player addEventHandler ["Killed", {_this execVM (ENGINE_FUNC_PATH+"init_getTeamKill.sqf")}];
};
// =============================================================================

// =============================================================================
// Waiting on API
//INIT_ai_hear_TFAR = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"init_aiHearsTFAR.sqf");
// =============================================================================

// =============================================================================
FNC_callCamera = compile preprocessFileLineNumbers "a3\functions_f\Debug\fn_camera.sqf";
// =============================================================================

// =============================================================================
FNC_putWeaponAway = compile preprocessFileLineNumbers (ENGINE_FUNC_PATH+"fnc_weaponAway.sqf");
// =============================================================================

// =============================================================================
INIT_debug = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"init_debug.sqf");
// =============================================================================

// =============================================================================
FNC_stamp_time = {[] execVM (ENGINE_FUNC_PATH+"fnc_stampTime.sqf")};
// =============================================================================

// =============================================================================
FNC_isJIP = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_isJIP.sqf");
// =============================================================================

// =============================================================================
FNC_swap_spec = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_swapSpectators.sqf");
// =============================================================================

// =============================================================================
FNC_taskmaster = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_taskmaster.sqf");
// =============================================================================

// =============================================================================
FNC_check_task = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_checkTask.sqf");
// =============================================================================

// =============================================================================
FNC_assignLoadout = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_assignLoadout.sqf");
// =============================================================================

// =============================================================================
INIT_ai_hear_TFAR = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"INIT_aiHearsTFAR.sqf");
// =============================================================================

// =============================================================================
FNC_loading_screen = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"loading.sqf");
// =============================================================================

// =============================================================================
FNC_process_color = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_processColor.sqf");
// =============================================================================

// =============================================================================
FNC_stripItems = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_stripItems.sqf");
// =============================================================================

// =============================================================================
FNC_remove_jip = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_removeJIP.sqf");
// =============================================================================

// =============================================================================
FNC_teleport_jip = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_teleportJip.sqf");
// =============================================================================

// =============================================================================
FNC_sync_time = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_syncTime.sqf");
// =============================================================================

// =============================================================================
FNC_getLives = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_getLives.sqf");
// =============================================================================

// =============================================================================
FNC_isDead = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_isDead.sqf");
// =============================================================================

// =============================================================================
FNC_prepareSpectator = compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"fnc_prepareSpectator.sqf");
// =============================================================================

// =============================================================================
FNC_assignFactionGear = compile preprocessfilelinenumbers (MISSION_PATH+"loadout\faction-list.sqf");
// =============================================================================

diag_log "==================== ENGINE FUNCTIONS COMPILED =======================";