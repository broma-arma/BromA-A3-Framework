//==============================================================================
/*
Don't edit the header and the footer, only the middle part.

To call this action just add this on init.sqf or wherever you want:

[ "player", [ace_sys_interaction_key_self], -100, ["damageVehicle_interact.sqf", "main"] ] call CBA_ui_fnc_add;

And by the way, you can add any vehicle where the "player" thing is, for more info
see http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles

*///==============================================================================
_unknownWeaponClass = currentWeapon player;

_unknownConfig = configFile >> "CfgWeapons" >> _unknownWeaponClass;
_pistolConfig = configFile >> "CfgWeapons" >> "PistolCore";

_isPistol = false;
while {isClass _unknownConfig} do
{
    if (_unknownConfig == _pistolConfig) exitWith {_isPistol = true;};
    _unknownConfig = inheritsFrom _unknownConfig;
};

private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus","_menucon2", "_menucon3"];

_target = _this select 0;
_params = _this select 1;
_count = player ammo (currentWeapon player);
_menucon2 = (_isPistol);
_menucon3 = (_isPistol && _count > 0);
_menuName = "";
_menuRsc = "popup";


if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};

//==============================================================================
// You can start editing below here v v v
//==============================================================================

_visible = true;
_menus = [
	[
		["main", "Main Menu", _menuRsc],
		[
			["<t color='#cc6600'>Contemplate Suicide</t>", "", "", "",
				[OPTIONAL_PATH+"suicide_script\killyoureself.sqf", "bitebullet", 1],
				-1, 1, (_menucon2)]	
		]
	]
];

if(_menuName == "bitebullet") then {
	
	_menus set [count _menus,
		[
			["bitebullet","", _menuRsc],
			[
				["End it.",
					{_destroy = [] execVM OPTIONAL_PATH+"suicide_script\suicide.sqf";},
					"", "", "", -1, (_menucon3)]                                       
			]
		]
	];
};

//==============================================================================
// Stop editing from here on.
//==============================================================================

_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};
_menuDef // return value