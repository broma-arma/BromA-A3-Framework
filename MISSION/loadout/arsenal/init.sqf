private["_unit","_type","_cond"];

_faction = _this select 0;
_unit = _this select 1;
_type = "";

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