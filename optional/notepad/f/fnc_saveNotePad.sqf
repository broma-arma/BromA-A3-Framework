_pagename = ctrlText 3;
_strings = [];

for "_j" from 6 to 26 do {
	_text = ctrlText _j;
	_strings = _strings + [_text];
};

lbClear 1;

CRACK_var_NotePad_contents set [CRACK_var_notepadcurrentpage,[_pagename,_strings]];

_i = 0;
{
	_id = lbAdd [1,(_x select 0)];
	CRACK_var_notepadlb set [_i,_id];
	_i = _i + 1;
} foreach CRACK_var_NotePad_contents;

player setvariable ["CRACK_var_old_NotePad", CRACK_var_NotePad_contents];