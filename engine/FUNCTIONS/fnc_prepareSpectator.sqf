_unit = _this select 0;

sleep 5;

removeVest _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeGoggles _unit;
removeUniform _unit;
removeAllItems _unit;
removeAllWeapons _unit;
_unit unlinkItem "ItemRadio";
_unit removeItem "ItemRadio";

[_unit] joinsilent grpnull;

_unit setPos (getMarkerPos "boot_hill");

player enablesimulation false;