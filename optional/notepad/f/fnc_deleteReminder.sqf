_index = lbCurSel 1;
_selText = lbText [1, _index];

if (_selText != "") then {
	_titleIndex = CRACK_var_reminderTitleArray find _selText;
	_handle = CRACK_var_reminderHandleArray select _titleIndex;

	terminate _handle;

	CRACK_var_reminderTitleArray = CRACK_var_reminderTitleArray - [_selText];
	CRACK_var_reminderHandleArray = CRACK_var_reminderHandleArray - [_handle];

	lbClear 1;

	{
		_id = lbAdd [1, _x];
	} foreach CRACK_var_reminderTitleArray;

	hintsilent "Reminder has been deleted";
};