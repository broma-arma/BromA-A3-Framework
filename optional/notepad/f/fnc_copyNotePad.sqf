if (!isdedicated) then {
	
	_target = CRACK_easyvar_NotePadCopyTarget;
	_titles = [];
	
	if (typename (_target getvariable ["CRACK_var_old_NotePad", 69]) != typename (69)) then { // Variable is locally stored
		
		_contents = _target getvariable "CRACK_var_old_NotePad";
		
		{
			_used = false;
			{
				if (_x != "") exitwith {_used = true;};
			} foreach (_x select 1);
			
			if (_used) then {
				_titles = _titles + [(_x select 0)];
			};
		} foreach _contents;
		
	} else { // Variable is not on local machine, reach out to other machines
		
		while {CRACK_gvar_NotePadTransfer select 3 != 0} do {
			
			hintsilent "Waiting for Network Transfer Opening";
			waituntil {(CRACK_gvar_NotePadTransfer) select 3 == 0};
			sleep (random(.3));
			
		};

		CRACK_gvar_NotePadTransfer = [_target, [""], ["", ""], 1, false];
		publicvariable "CRACK_gvar_NotePadTransfer";

		hintsilent "Request Sent\nRecieving...";

		// Packet TimeOut
		CRACK_easyvar_NotePadTranfserTimeout = false;
		_handle = [] spawn {sleep 5; CRACK_easyvar_NotePadTranfserTimeout = true;};

		waituntil {((CRACK_gvar_NotePadTransfer select 3) == 0 AND (CRACK_gvar_NotePadTransfer select 0) == _target) OR CRACK_easyvar_NotePadTranfserTimeout;};

		_transferedData = CRACK_gvar_NotePadTransfer;
		
		terminate _handle;

		if (CRACK_easyvar_NotePadTranfserTimeout) exitwith {
			
			if (CRACK_gvar_NotePadTransfer select 3 == 1) then {
				CRACK_gvar_NotePadTransfer set [3, 0];
				publicvariable "CRACK_gvar_NotePadTransfer";
			};
			
			hint "Network Connection to Player Timed Out\n\nPlayer most likely disconnnected";
			
		};
		
		_titles = _transferedData select 1;
		
	};
	// Put code to execute after titles are recieved
	createdialog "CRACK_notepad_diag_copy_page";
	
	{
		_id = lbadd [1, _x];
	} foreach _titles;
	
	{
		_id = lbAdd [2,(_x select 0)];
	} foreach CRACK_var_NotePad_contents;
	
	hintsilent "";
	
};