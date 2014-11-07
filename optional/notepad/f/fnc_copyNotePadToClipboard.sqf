_string = "";

_contents = CRACK_var_NotePad_contents select CRACK_var_notepadcurrentpage;

_string = (_contents select 0) + "<br /><br />";

{
	if (_x != "") then {
		_string = _string + _x + "<br />";
	};
} foreach (_contents select 1);

if (!ismultiplayer) then {

	copyToClipboard _string;

	hint "Page Copied to Clipboard\n\nRemember to replace every <br /> with an actual line break.";
	
} else {
	
	createdialog "CRACK_notepad_diag_copyPageToClipboard";
	
	ctrlSetText [1, _string];
	
	//hint "Remember to find and replace every <br /> with an actual line break.";
	
	if (isnil "CRACK_diag_copyPageToClipboard_open") then {CRACK_diag_copyPageToClipboard_open = false;};
	
	while {CRACK_diag_copyPageToClipboard_open} do {
		waituntil {((ctrlText 1) != _string) OR !CRACK_diag_copyPageToClipboard_open};
		if (!CRACK_diag_copyPageToClipboard_open) exitwith {};
		ctrlSetText [1, _string];
	};
	
};