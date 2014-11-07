// ============================================================================================
//
//	This script allows to load cargo into any type of vehicle that you place in the editor.
//
//      nul = [this,"faction","ammo"] execVM "mission\loadout\init-cargo.sqf";
//  
//      If you need to get classnames for weapons and magazines I suggest this site:
//	http://browser.six-projects.net/cfg_weapons/tree
//
// ============================================================================================
private ["_object","_faction","_type"];

_object = _this select 0; 
_faction = _this select 1;
_type = _this select 2;

waitUntil{ time > 1 };

if (isServer) then {
    waitUntil {!isNull _object};

    clearMagazineCargoGlobal _object;
    clearItemCargoGlobal _object;
    clearWeaponCargoGlobal _object;
    clearBackpackCargoGlobal _object;

    [_type,_object,_faction] call FNC_assignFactionGear;
};
// ============================================================================================