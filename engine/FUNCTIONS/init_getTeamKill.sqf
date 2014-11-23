private ["_unit","_attacker","_damage","_sideUnit","_sideAtk","_isUncon"];

_unit = _this select 0;
_attacker = _this select 1;

_sideUnit = side _unit;
_sideAtk = side _attacker;

sleep 1;

_isUncon = _unit getVariable ["AGM_Unconscious",false];

if ((name _attacker)=="Error: No Unit") exitWith {};

_msg = format ["FRIENDLY FIRE: %2 has wounded %1!",name _unit, name _attacker];

if (((_isUncon)||!(alive _unit))&&(_sideUnit==_sideAtk)&&(!(name _unit== name _attacker))&&(isPlayer _attacker)) then {
    [-1, { _this addScore 1 }, _attacker] call CBA_fnc_globalExecute;
};

if ((_sideUnit==_sideAtk)&&(!(name _unit == name _attacker))) exitWith {
    [-1, { player sidechat _this }, _msg] call CBA_fnc_globalExecute;    
    [-1, { _this addScore -2 }, _attacker] call CBA_fnc_globalExecute;
};