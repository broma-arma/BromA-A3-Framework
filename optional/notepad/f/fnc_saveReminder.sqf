if (!isdedicated) then {
	
	_title = ctrlText 3;
	_timerMinutes = parseNumber (ctrlText 6);
	_text = ctrlText 7;
	
	if (_title == "") exitwith {hint "Reminder Title field is empty!"};
	if ((CRACK_var_reminderTitleArray find _title) != -1) exitwith {hint "Reminder Title has already been used!"};
	if (((typeName _timerMinutes) != (typeName 2)) OR (_timerMinutes <= 0)) exitwith {hint "The timer field only accepts positive non-zero numbers!"};
	if (_text == "") exitwith {hint "Reminder Text field is empty!"};
	
	_timeSeconds = _timerMinutes * 60;
	
	[_title, _timeSeconds, _text] call CRACK_fnc_newReminder;
	
	hintsilent "Reminder Created";
	
};