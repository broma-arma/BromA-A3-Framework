// =============================================================================
#include "folder_path.sqf"

call compile preprocessfilelinenumbers (ENGINE_FUNC_PATH+"func_init.sqf");
call compile preprocessfilelinenumbers (OPTIONAL_FUNC_PATH+"func_init.sqf");
diag_log "==================== ALL FUNCTIONS COMPILED ==========================";

call compile preprocessfilelinenumbers (CUSTOM_FILES_PATH+"mission-settings.sqf");
diag_log "==================== MISSION SETTINGS LOADED =========================";

// Common Local Variables - WARNING: DO NOT DISABLE THIS COMPONENT
f_script_setLocalVars = [] execVM (ENGINE_PATH+"f\common\f_setLocalVars.sqf");

// =============================================================================

// =============================================================================
// F2 - Process ParamsArray
f_processParamsArray = [] execVM (ENGINE_PATH+"f\common\f_processParamsArray.sqf");
// =============================================================================

// =============================================================================
// F2 - Mission Conditions Selector
[] execVM (ENGINE_PATH+"f\common\f_setMissionConditions.sqf");
waitUntil{paramLoad};
// =============================================================================

// =============================================================================
// Disables saving and auto-saving.
enableSaving [false, false];
// =============================================================================

// =============================================================================
// Disable BIS conversations
player setVariable ["BIS_noCoreConversations", true];
// =============================================================================

// =============================================================================
// F2 - Mission Maker Teleport
if !(isMultiplayer) then { [] execVM (ENGINE_PATH+"f\common\f_missionMakerTeleport.sqf") };
// =============================================================================

// =============================================================================
// BromA - Executes the briefing
[] execVM (BRIEFING_PATH+"briefingCall.sqf");
// =============================================================================

// =============================================================================
// F2 - Multiplayer Ending Controller
f_endSelected = -1; [] execVM (ENGINE_PATH+"f\common\f_mpEndSetUp.sqf");
// =============================================================================

// =============================================================================
// BromA - Points assessment
[] execVM ENGINE_PATH+"ending\setupEnding.sqf";
[] execVM ENGINE_PATH+"ending\registerPoints.sqf";
// =============================================================================

// =============================================================================
// BoN - Initializes the Crew Overlay system
[] execVM (OPTIONAL_PATH+"crewoverlay\crewoverlay.sqf");
// =============================================================================

// =============================================================================
// Initalizes the Distance View Draw system
if !(missionGameMode == "tvt") then {
[] execVM (OPTIONAL_PATH+"view_distance\fn_tawvdInit.sqf") };
// =============================================================================

// =============================================================================
// Call the mission tasks
[] execVM (CUSTOM_FILES_PATH+"call_main_tasks.sqf");
// =============================================================================

// =============================================================================
//["onDisconnLog", "onPlayerDisconnected", {diag_log format ["%3(%1) DISCONNECTED WITH ID:%2",_id, _uid, _name]}] call BIS_fnc_addStackedEventhandler;
["onDisconn", "onPlayerDisconnected", {[_uid,_name] call FNC_onDisconnect}] call BIS_fnc_addStackedEventhandler;
// =============================================================================

// =============================================================================    
// Testing and debugging
[] execVM (ENGINE_FUNC_PATH+"init_debug.sqf");
// =============================================================================

// =============================================================================
// Loads the Optional Modules
[] execVM (OPTIONAL_PATH+"optional-modules.sqf");
// =============================================================================

// =============================================================================
// BromA - Put spectator units on spectator mode
[] call FNC_swap_spec;
// =============================================================================