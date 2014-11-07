if (count _this > 0) then {
	
	closeDialog 80529;
	
	// Opening New Reminder Dialog
	if (_this select 0 == 0) then {
		
		createDialog "CRACK_reminders_diag_new_reminder";
		
		_index = (count CRACK_var_reminderHandleArray) + 1;
		
		_text = format ["Reminder %1",_index];
		
		ctrlSetText [3, _text];
		
	};
	
	// Opening Delete Reminder Dialog
	if (_this select 0 == 1) then {
		
		createDialog "CRACK_reminders_diag_delete_reminder";
		
		{
			_id = lbAdd [1, _x];
		} foreach CRACK_var_reminderTitleArray;
		
	};
	
} else {

	// Just create yes/no dialog
	createDialog "CRACK_reminders_diag_main";
	
};