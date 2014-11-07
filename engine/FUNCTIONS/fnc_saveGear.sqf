private[
    "_thisVeh", "_thisPos",
    "_thisheadgear", "_thisgoggles",
    "_thisUniformItems", "_thisVestItems", "_thisBackpackItems",
    "_thisuniform", "_thisvest", "_thisbackpack", "_thisAssignedItems",
    "_thisPrimaryWep", "_thisPrimaryWepMag", "_thisSecWep", "_thisSecWepMag", "_thisSideWep","_thisSideWepMag",
    "_thisPrimaryAttachments", "_thisSecondaryAttachments",
    "_agmBLOOD", "_agmBLEEDING", "_agmPAINKILLER", "_agmPAIN", "_agmINPAIN", "_agmUNCON"];

_player = _this select 0;

_thisPos = (getPosATL (vehicle _player));
_thisVeh = (vehicle _player);    

if !(uniform _player == "") then {
_thisUniformItems = uniformItems _player;
_thisuniform = (uniform _player)} else { _thisUniformItems = []; _thisuniform = "" };

if !(vest _player == "") then {
_thisVestItems = vestItems _player;
_thisvest = (vest _player)} else { _thisVestItems = []; _thisvest = ""};

if !(backpack _player == "") then {
_thisBackpackItems = backpackItems _player;
_thisbackpack = (backpack _player)} else { _thisBackpackItems = []; _thisbackpack = ""};

if !(headgear _player == "") then {
_thisheadgear = (headgear _player)} else { _thisheadgear = ""};

if !(goggles _player == "") then {
_thisgoggles = (goggles _player)} else { _thisgoggles = ""};

if !(count(items _player) == 0) then {
_thisItems = (items _player)} else { _thisItems = [] };

if !(count(assigneditems _player) == 0) then {
_thisAssignedItems = (assigneditems _player);
} else { _thisAssignedItems = [] };

if !(primaryWeapon _player == "") then {    
_thisPrimaryWep = primaryWeapon _player} else { _thisPrimaryWep = "" };

if !(count(primaryWeaponMagazine _player) == 0) then {
_thisPrimaryWepMag = primaryWeaponMagazine _player} else { _thisPrimaryWepMag = [] };

if !(secondaryWeapon _player == "") then {
_thisSecWep = secondaryWeapon _player} else { _thisSecWep = "" };

if !(count(secondaryWeaponMagazine _player) == 0) then {
_thisSecWepMag = secondaryWeaponMagazine _player} else { _thisSecWepMag = [] };

if !(handgunWeapon _player == "") then {
_thisSideWep = handgunWeapon _player} else { _thisSideWep = "" };

if !(count(handgunMagazine _player) == 0) then {
_thisSideWepMag = handgunMagazine _player} else { _thisSideWepMag = [] };

if !(count(primaryWeaponItems _player) == 0) then {
_thisPrimaryAttachments = primaryWeaponItems _player} else { _thisPrimaryAttachments = [] };

if !(count(handgunItems _player) == 0) then {
_thisSecondaryAttachments = handgunItems _player} else { _thisSecondaryAttachments = [] };

_agmBLOOD = _player getVariable "AGM_Blood";
_agmBLEEDING = _player getVariable "AGM_Bleeding";
_agmPAINKILLER = _player getVariable "AGM_Painkiller";
_agmPAIN = _player getVariable "AGM_Pain";
_agmINPAIN = _player getVariable "AGM_InPain";
_agmUNCON = _player getVariable "AGM_Unconscious"; 

_return = [_thisVeh, _thisPos,
        _thisheadgear, _thisgoggles,
        _thisUniformItems, _thisVestItems, _thisBackpackItems,
        _thisuniform, _thisvest, _thisbackpack, _thisAssignedItems,
        _thisPrimaryWep, _thisPrimaryWepMag, _thisSecWep, _thisSecWepMag, _thisSideWep, _thisSideWepMag,
        _thisPrimaryAttachments, _thisSecondaryAttachments,
        _agmBLOOD, _agmBLEEDING, _agmPAINKILLER, _agmPAIN, _agmINPAIN, _agmUNCON];
        
_return