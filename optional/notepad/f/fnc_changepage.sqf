_index = lbCurSel 1;
_contentindex = CRACK_var_notepadlb find _index;
_contents = CRACK_var_NotePad_contents select _contentindex;
_strings = _contents select 1;
ctrlSetText [3, (_contents select 0)];

for "_j" from 6 to 26 do {
	_stringindex = _j - 6;
	_string = _strings select _stringindex;
	ctrlSetText [_j, _string];
};

CRACK_var_notepadcurrentpage = _index;