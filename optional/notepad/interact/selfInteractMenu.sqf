private ["_menuDef", "_target", "_params", "_menuName", "_menuRsc", "_menus"];

// _this==[_target, _menuNameOrParams]
_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------

_Allow = false;
if (CRACK_var_NotePadCopyBlocked) then {_Allow = true;};

_menus = [
	[
		["main", "Main Menu", _menuRsc],
		[
			["<t color='#ffc600'>Notepad ></t>", "", "", "",
				["_this call CRACK_fnc_NotePadSelfInteractMenu", "notepadmenu", 1],
				-1, 1, (!CRACK_var_NotePadInUse)]	
		]
	]
];

if(_menuName == "notepadmenu") then {
		
	_menus set [count _menus,
		[
			["notepadmenu", "Notepad Menu", "popup", ""],
			[
				[
				"Open notepad",
					{ [] call CRACK_fnc_openNotepad; },
					"", "", "", -1, 1,
					(!CRACK_var_NotePadInUse), (true)
				],
				[
				"Reminders",
					{ [] call CRACK_fnc_openReminders; },
					"", "", "", -1, 1,
					(!CRACK_var_NotePadInUse), (true)
				],
				[
				"Disable reminders",
					{ [] call CRACK_fnc_disableReminders; },
					"", "", "", -1, 1,
					(!CRACK_var_RemindersDisabled AND !CRACK_var_NotePadInUse), (true)
				],
				[
				"Enable reminders",
					{ [] call CRACK_fnc_enableReminders; },
					"", "", "", -1, 1,
					(CRACK_var_RemindersDisabled AND !CRACK_var_NotePadInUse), (true)
				],
				[
				"Allow external access",
					{ player setvariable ["CRACK_var_NotePadCopyBlocked", false, true]; CRACK_var_NotePadCopyBlocked = false; },
					"", "", "", -1, 1,
					((!CRACK_var_NotePadInUse) AND (CRACK_var_NotePadCopyBlocked)), (_Allow)
				],
				[
				"Block external access",
					{ player setvariable ["CRACK_var_NotePadCopyBlocked", true, true]; CRACK_var_NotePadCopyBlocked = true; },
					"", "", "", -1, 1,
					((!CRACK_var_NotePadInUse) AND (!CRACK_var_NotePadCopyBlocked)), (!_Allow)
				]
			]
		]
	];
};

//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value
