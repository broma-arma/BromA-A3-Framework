
[] call CRACK_fnc_openNotepad;

if (isnil "CRACK_fnc_closeOnStart") then {
	CRACK_fnc_closeOnStart = compile "sleep 0.00001; if (dialog) then {closeDialog 80509;};";
	[] spawn CRACK_fnc_closeOnStart;
};