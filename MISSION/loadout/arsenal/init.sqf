private["_unit","_type","_cond"];

_faction = _this select 0;
_unit = _this select 1;
_type = "";

_done = _unit getVariable ["done",false];
if (_done) exitWith {};

if ((!isPlayer _unit)&&(!isServer)) exitWith {};

if ((!(loadoutStyleAI == "arsenal"))&&(!(isPlayer _unit))) exitWith {};

// RESETS ITEMS ================================================================

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit addItem "AGM_EarBuds";

// DETERMINE UNIT TYPE =========================================================

if (!(isPlayer _unit)) then { _type = getText (configfile >> "CfgVehicles" >> typeOf _unit >> "displayName") } 
else { 
    if ( (count _this) > 2) then {
        _type = _this select 2;
    } else {
        _type = getText (configfile >> "CfgVehicles" >> typeOf _unit >> "displayName");
    };
};

// CLASSES =====================================================================

#include "faction-list.sqf"

_unit setVariable ["done",true,true];