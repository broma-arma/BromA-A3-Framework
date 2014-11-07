if (!isdedicated) then {
	
	_target = CRACK_easyvar_NotePadCopyTarget;
	
	_index = lbCurSel 1;
	_title = lbText [1, _index];
	_index = lbCurSel 2;
	_overwritePage = lbText [2, _index];
	_contents = [];
	_strings = [];
	
	closeDialog 80549;
	
	if (typename (_target getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then { // Variable is locally stored
		
		_notepad = _target getvariable "CRACK_var_old_NotePad";
		
		{
			if ((_x select 0) == _title) exitwith {_strings = (_x select 1);};
		} foreach _notepad;
		
		_contents = [_title, _strings];
		
	} else { // Variable is not on local machine, reach out to other machines
		
		while {CRACK_gvar_NotePadTransfer select 3 != 0} do {
			
			hintsilent "Waiting for Network Transfer Opening";
			waituntil {(CRACK_gvar_NotePadTransfer) select 3 == 0};
			sleep (round(random(.2)));
			
		};
		
		CRACK_gvar_NotePadTransfer = [_target, [""], [_title, ""], 2, false];
		publicvariable "CRACK_gvar_NotePadTransfer";

		hintsilent "Request Sent\nRecieving...";

		// Ten second Packet TimeOut
		CRACK_easyvar_NotePadTranfserTimeout = false;
		_handle = [] spawn {sleep 10; CRACK_easyvar_NotePadTranfserTimeout = true;};

		waituntil {((CRACK_gvar_NotePadTransfer select 3) == 0 AND (CRACK_gvar_NotePadTransfer select 0) == _target) OR CRACK_easyvar_NotePadTranfserTimeout;};

		_transferedData = CRACK_gvar_NotePadTransfer;
		
		terminate _handle;

		if (CRACK_easyvar_NotePadTranfserTimeout) exitwith {
			
			if (CRACK_gvar_NotePadTransfer select 3 == 2) then {
				CRACK_gvar_NotePadTransfer set [3, 0];
				publicvariable "CRACK_gvar_NotePadTransfer";
			};
			
			hint "Network Connection to Player Timed Out\n\nPlayer most likely disconnnected or changed title name";
			
		};
		
		_contents = _transferedData select 2;
		
	};
	
	// Put code to execute after notepad is recieved
	_pagename = _contents select 0;
	_strings = _contents select 1;
	
	_index = 0;
	_i = 0;
	
	{
		if ((_x select 0) == _overwritePage) exitwith {_index = _i};
		_i = _i + 1;
	} foreach CRACK_var_NotePad_contents;
	
	CRACK_var_NotePad_contents set [_index, [_pagename,_strings]];
	
	hint "NotePad Page Copied";
	
};