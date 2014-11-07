#include "script_macros.hpp"

_playerName = (CRACK_gvar_NotePadTransfer select 0);
_isRequest = (CRACK_gvar_NotePadTransfer select 3);

// If requesting only titles
if (_isRequest == 1) then {
	
	ifNotePadLocal(_playerName) then {
		
		_titles = [];
		_strings = [];
		_characterArray = [];
		_contents = [];
		
		if (!isdedicated) then {
			if (_playerName == player) then {
				
				_contents = CRACK_var_NotePad_contents;
				
			};
		};
		if (isserver) then {	
			if (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then {
				
				_contents = _playerName getvariable "CRACK_var_old_NotePad";
				
			};
		};
		
		{
			_used = false;
			{
				if (_x != "") exitwith {_used = true;};
			} foreach (_x select 1);
			
			if (_used) then {
				_titles = _titles + [(_x select 0)];
			};
		} foreach _contents;
		
		_result = [_playerName, _titles] call CRACK_fnc_checkText;
		_isTruncated = _result select 1;
		
		CRACK_gvar_NotePadTransfer = [_playerName, _titles, ["", ""], 0, false];
		publicvariable "CRACK_gvar_NotePadTransfer";
		
	};
	
};

// If requesting complete data
if (_isRequest == 2) then {
	
	ifNotePadLocal(_playerName) then {
		
		_title = (CRACK_gvar_NotePadTransfer select 2) select 0;
		_strings = [];
		_characterArray = [];
		_contents = [];
		_name = "";
		
		if (!isdedicated) then {
			if (_playerName == player) then {
				
				_contents = CRACK_var_NotePad_contents;
				
			};
		};
		if (isserver) then {	
			if (typename (_playerName getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then {
				
				_contents = _playerName getvariable "CRACK_var_old_NotePad";
				
			};
		};
		
		{
			if ((_x select 0) == _title) exitwith {_strings = (_x select 1);};
		} foreach _contents;
		
		if (count _strings < 1) then {
			
			_strings = [] call CRACK_fnc_createNoteStrings;
			
			if (isdedicated) then {_name = "the server";} else {_name = name player;};
			_errorText = format["%1 changed his or her title of a NotePad Page while %2 was accessing it - Data not sent", (name _playerName), _name];
			[_errorText, "CRACK_NotePad", [false, true, true] ] call CBA_fnc_debug;
		};
		
		_result = [_playerName, _strings] call CRACK_fnc_checkText;
		_strings = _result select 0;
		_isTruncated = _result select 1;
		
		CRACK_gvar_NotePadTransfer = [_playerName, [""], [_title, _strings], 0, _isTruncated];
		publicvariable "CRACK_gvar_NotePadTransfer";
		
	};
	
};