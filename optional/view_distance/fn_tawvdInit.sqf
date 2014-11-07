/*
	File: fn_tawvdInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master init for TAW View Distance (Addon version). If the script verson is present it will exit.
*/
tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_addon_disable = true;
//The hacky method... Apparently if you stall (sleep or waitUntil) with CfgFunctions you stall the mission initialization process... Good job BIS, why wouldn't you spawn it via preInit or postInit?
[] spawn
{
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};
        
        bon_func_keyspressed = compile preprocessFileLineNumbers (OPTIONAL_PATH+"view_distance\bon_func_keyspressed.sqf");        
        (findDisplay 46) displayAddEventHandler ["KeyDown","_this call bon_func_keyspressed"];

	[] spawn TAWVD_fnc_trackViewDistance;
};