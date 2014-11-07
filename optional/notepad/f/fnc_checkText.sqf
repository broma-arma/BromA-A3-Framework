_player = _this select 0;
_textArray = _this select 1;

_byteLimit = 20000;

_characterArray = [];
_isTruncated = false;

{
	_characterArray = _characterArray + toArray(_x);
} foreach _textArrayArray;

_characterCount = count _characterArray;

if (_characterCount > _byteLimit) then {
			
	_errorText = format["%1's NotePad contains over %2 Bytes of data - Too large to send", (name _player), _characterCount];
	[_errorText, "CRACK_NotePad", [false, true, true] ] call CBA_fnc_debug;
	
	{
		_textArray = _textArray - [(_textArray select ((count _textArray) - 1))];
		{
			_characterArray = _characterArray + toArray(_x);
		} foreach _textArray;
		if (_characterCount <= _byteLimit) exitwith {};
	} foreach _textArray;
	
	_isTruncated = true;
	
};

_var = [_textArray, _isTruncated];

_var