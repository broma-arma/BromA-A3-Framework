_trg= createTrigger["EmptyDetector", getPos _origin]; 
_trg setTriggerArea [_size,_size,0,false];
_trg setTriggerActivation ["ANY","PRESENT",false];

sleep 1;

{
    _pass = false;
    if (!(isNil "_side")) then {
        if (side _x == _side) then {
            _pass = true;
        };
    } else {
        _pass = true;
    };
    if (_pass) then {
        _units set[count _units, _x];
    };
} forEach (list _trg);