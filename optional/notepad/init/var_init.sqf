if (isnil "CRACK_var_NotePadInUse") then {CRACK_var_NotePadInUse = false;};
if (isnil "CRACK_var_NotePadCopyBlocked") then {CRACK_var_NotePadCopyBlocked = false;};
if (isnil "CRACK_var_RemindersDisabled") then {CRACK_var_RemindersDisabled = false;};
if (isnil "CRACK_var_notepadpages") then {CRACK_var_notepadpages = 15;};
if (isnil "CRACK_var_notepadlines") then {CRACK_var_notepadlines = 15;};
if (isnil "CRACK_var_notepadcurrentpage") then {CRACK_var_notepadcurrentpage = 0;};
if (isnil "CRACK_var_notepadlb") then {CRACK_var_notepadlb = [];};
if (isnil "CRACK_var_reminderTitleArray") then {CRACK_var_reminderTitleArray = [];};
if (isnil "CRACK_var_reminderHandleArray") then {CRACK_var_reminderHandleArray = [];};

if (isnil "CRACK_var_NotePad_contents") then {
	
	// Initializing Variables
	CRACK_var_NotePad_contents = [];
	_strings = call CRACK_fnc_createNoteStrings;
	
	// Adding Pages to Main Array
	for "_j" from 1 to CRACK_var_notepadpages do {
		_pagename = format["Page %1",_j];
		CRACK_var_NotePad_contents = CRACK_var_NotePad_contents + [[_pagename,_strings]];
	};
};