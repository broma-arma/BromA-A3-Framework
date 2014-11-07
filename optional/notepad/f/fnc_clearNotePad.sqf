_index = CRACK_var_notepadcurrentpage;
_strings = [];
_pagename = format ["Page %1", (_index + 1)];

ctrlSetText [3, _pagename];

for "_j" from 6 to 26 do {
	ctrlSetText [_j, ""];
};