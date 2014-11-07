createDialog "CRACK_notepad_diag_main";

_i = 0;
{
	_id = lbAdd [1,(_x select 0)];
	CRACK_var_notepadlb set [_i,_id];
	_i = _i + 1;
} foreach CRACK_var_NotePad_contents;

_index = CRACK_var_notepadlb select CRACK_var_notepadcurrentpage;
lbSetCurSel [1, _index];

_pagename = (CRACK_var_NotePad_contents select (CRACK_var_notepadlb find _index)) select 0;
ctrlSetText [3, _pagename];