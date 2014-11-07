//     ____   ____       _       ____   _  __        _   _    ___    _____   _____   ____       _      ____  
//    / ___| |  _ \     / \     / ___| | |/ /       | \ | |  / _ \  |_   _| | ____| |  _ \     / \    |  _ \ 
//   | |     | |_) |   / _ \   | |     | ' /        |  \| | | | | |   | |   |  _|   | |_) |   / _ \   | | | |
//   | |___  |  _ <   / ___ \  | |___  | . \        | |\  | | |_| |   | |   | |___  |  __/   / ___ \  | |_| |
//    \____| |_| \_\ /_/   \_\  \____| |_|\_\       |_| \_|  \___/    |_|   |_____| |_|     /_/   \_\ |____/ 
//                                                                                                          
//*********************************************************************************************************************
//
// INITIALIZATION
//
//*********************************************************************************************************************
#include "f\script_macros.hpp"
#include "init\f_init.sqf"
#include "init\var_init.sqf"

if (isserver) then {
	
	if (isnil "CRACK_gvar_NotePadTransfer") then {
	
		_strings = call CRACK_fnc_createNoteStrings;
		
		CRACK_gvar_NotePadTransfer = ["",[""],["", _strings], 0, false]; // Format: [PlayerName, ["List","of","Titles"], [NoteTitle, ["List","of","Strings"]], TransferDirectionNumber, isTruncated]
		publicvariable "CRACK_gvar_NotePadTransfer";
		
		"CRACK_gvar_NotePadTransfer" addPublicVariableEventHandler {[] call CRACK_fnc_NotepadTransfer;};
		
	};
	
};

if (!isdedicated) then {
	
	waituntil {!isnull player};
	
	//if (typename(player getvariable ["CRACK_var_old_NotePad", 69]) == typename(69)) then {player setvariable ["CRACK_var_old_NotePad", CRACK_var_NotePad_contents];};
	
	waituntil {!isnil "CRACK_gvar_NotePadTransfer";};
	
	"CRACK_gvar_NotePadTransfer" addPublicVariableEventHandler {[] call CRACK_fnc_NotepadTransfer;};
	
	/*
	// Notepad activation via the map -----------------------------------------------------------------------------------------------------
	
	_index = player createDiarySubject ["notepad","Notepad"];
	
	player createDiaryRecord ["notepad", ["Notepad Toggle", "<execute expression='[] call CRACK_fnc_mapNotepad'>Open Notepad</execute>"]];
	
	// End --------------------------------------------------------------------------------------------------------------------------------
	*/
	
	["player", [ace_sys_interaction_key_self], -99999, ["_this call CRACK_fnc_NotePadSelfInteractMenu", "main"]] call CBA_ui_fnc_add;
	
	if (ismultiplayer) then {
		[["Man"], [ace_sys_interaction_key], -99999, ["_this call CRACK_fnc_NotePadInteractMenu", "main"]] call CBA_ui_fnc_add;
	};
	
	CRACK_var_notePadEHIndex = player addMPEventHandler ["mpkilled", {blah = _this spawn CRACK_fnc_onPlayerDeath;}];
	
};