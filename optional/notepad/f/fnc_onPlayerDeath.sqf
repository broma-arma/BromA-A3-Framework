_unit = _this select 0;
_killer = _this select 1;
_strings = [];

if (local _unit) then {
	
	_contents = CRACK_var_NotePad_contents;
	
	{
		_strings = _strings + [(_x select 0)] + (_x select 1);
	} foreach _contents;
	
	_result = [_playerName, _strings] call CRACK_fnc_checkText;
	_strings = _result select 0;
	_isTruncated = _result select 1;
	
	if (_isTruncated) then {
		
		_contents = [];
		
		for "_i" from 1 to (count _strings) do {
			
			_stringIndex = _i - 1;
			_contentIndex = floor((_i - 1) / 22);
			
			if (((_i - 1) % 22) == 0) then { // Multiple of 22 (Title)
				
				_contents set [_index, [(_strings select _stringIndex)]];
				
			} else { // Note a multiple of 22 (String)
				
				_newArray = (_contents select _index) + (_strings select _stringIndex);
				_contents set [_index, _newArray];
				
			};
		};
	};
	
	_unit setvariable ["CRACK_gvar_thisUnitDied", player, true];
	call compile format ["%1 setvariable ['CRACK_var_old_NotePad', %2, true];", _unit, _contents]; // Let's see if this works

	CRACK_var_NotePadCopyBlocked = false;
	
};