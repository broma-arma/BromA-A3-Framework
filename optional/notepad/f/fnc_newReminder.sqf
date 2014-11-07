
_title = _this select 0;
_timer = _this select 1;
_text = _this select 2;

_handle = [_title, _timer,_text] spawn {
	
	// This all seems a little bit redundant... but oh well
	_title = _this select 0;
	_timer = _this select 1;
	_text = _this select 2;
	
	_hintText = "<t color='#00E5EE' size='1.2' shadow='1' shadowColor='#000000' align='center'>REMINDER:</t><br/><br/>" + _text;
	
	sleep _timer;
	
	if (!CRACK_var_RemindersDisabled) then {
		hint parsetext _hintText;
	};
	
	_titleIndex = CRACK_var_reminderTitleArray find _title;
	_handle = CRACK_var_reminderHandleArray select _titleIndex;
	
	CRACK_var_reminderTitleArray = CRACK_var_reminderTitleArray - [_title];
	CRACK_var_reminderHandleArray = CRACK_var_reminderHandleArray - [_handle];
	
};

CRACK_var_reminderTitleArray = CRACK_var_reminderTitleArray + [_title];
CRACK_var_reminderHandleArray = CRACK_var_reminderHandleArray + [_handle];