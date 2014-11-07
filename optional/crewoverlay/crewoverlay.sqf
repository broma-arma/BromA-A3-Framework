//Original by Kochleffel
//adapted by Bon_Inf*

disableSerialization;

if(isDedicated) exitWith{};
Waituntil{not isNull player};

_icondriver = "optional\crewoverlay\img\imagedriver_ca.paa";
_iconcommander = "optional\crewoverlay\img\imagecommander_ca.paa";
_icongunner = "optional\crewoverlay\img\imagegunner_ca.paa";
_iconcargo = "optional\crewoverlay\img\imagecargo_ca.paa";


9 cutRsc ["crewoverlay", "PLAIN"];
_display = (uiNamespace getVariable "tfor_crewoverlay") select 0;
_idc = (uiNamespace getVariable "tfor_crewoverlay") select 1;
_ctrl = _display displayCtrl _idc;

while{true} do {

	while{sleep 0.5; vehicle player != player && !visibleMap} do {
		_vehicle = vehicle player;
		_text = "";

		{
			if(alive _x) then {

				_color = if(isPlayer _x) then{"#dfd7a5"} else{"#9a9575"};
				_role = assignedVehicleRole _x;

				switch _x do {

					case commander _vehicle : {
						_text = _text + format ["<t size='1.4' shadow='1' color='%2'>%1</t> <t size='1.5'><img image='%3'></t><br/>", name _x,_color,_iconcommander];
					};
					case gunner _vehicle : {
						_text = _text + format ["<t size='1.4' shadow='1' color='%2'>%1</t> <t size='1.5'><img image='%3'></t><br/>", name _x,_color,_icongunner];
					};
					case driver _vehicle : {
						_text = _text + format ["<t size='1.4' shadow='1' color='%2'>%1</t> <t size='1.5'><img image='%3'></t><br/>", name _x,_color,_icondriver];
					};
					default	{
						if(format["%1", (_role select 0)] != "Turret") then {
							_text=_text+format ["<t size='1.4' shadow='1' color='%2'>%1</t> <t size='1.5'><img image='%3'></t><br/>", name _x,_color,_iconcargo];
						} else {
							_text=_text+format ["<t size='1.4' shadow='1' color='%2'>%1</t> <t size='1.5'><img image='%3'></t><br/>", name _x,_color,_icongunner];
						};
					};
				};
			};
		} foreach crew _vehicle;
		_ctrl ctrlSetStructuredText parseText _text;
	};

	_ctrl ctrlSetStructuredText parseText "";
	sleep 1;
};
