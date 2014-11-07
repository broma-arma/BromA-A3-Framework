//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Weapons    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Weapon_Pool","_Magazine_Pool"];

#include "loadout_init.sqf";

_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
  case 1: {
    _Weapon_Pool  = ["AK_107_GL_pso","Binocular","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["30Rnd_545x39_AK",6],["1Rnd_HE_GP25",6],["FlareWhite_GP25",2],["HandGrenade_East",2]];
  };
//-------------------------------------------------------------------------------------------------
  case 2: {
    _Weapon_Pool  = ["AK_107_pso","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["30Rnd_545x39_AK",8],["HandGrenade_East",2]];
  };
//-------------------------------------------------------------------------------------------------
  case 3: {
    _Weapon_Pool  = ["Pecheneg","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["100Rnd_762x54_PK",5]];
  };
//-------------------------------------------------------------------------------------------------
  case 4: {
    _Weapon_Pool  = ["RPK_74","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["75Rnd_545x39_RPK",8],["HandGrenade_East",2]];
  };
//-------------------------------------------------------------------------------------------------
  case 5: {
    _Weapon_Pool  = ["AK_107_pso","RPG7V","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["30Rnd_545x39_AK",6],["PG7VL",3]];
  };
//-------------------------------------------------------------------------------------------------
  case 6: {
    _Weapon_Pool  = ["SVD","ItemCompass","ItemMap"];
    _Magazine_Pool  = [["10Rnd_762x54_SVD",8]];
  };
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
  case 7: {
    _Weapon_Pool  = [_AK47 select 0,"Binocular","ItemCompass","ItemMap"];
    _Magazine_Pool  = [[_AK47 select 1,8]];
  };
//-------------------------------------------------------------------------------------------------
  case 8: {
    _Weapon_Pool  = [_AK74 select 0,"Binocular","ItemCompass","ItemMap"];
    _Magazine_Pool  = [[_AK74 select 1,8]];
  };  
//-------------------------------------------------------------------------------------------------
  case 9: {
    _Weapon_Pool  = [_AKS74GL select 0,"Binocular","ItemCompass","ItemMap"];
    _Magazine_Pool  = [[_AKS74GL select 1,8],[_AKS74GL select 2,5]];
  };
//-------------------------------------------------------------------------------------------------
  case 10: {
    _Weapon_Pool  = [_RPK select 0,"Binocular","ItemCompass","ItemMap"];
    _Magazine_Pool  = [[_RPK select 1,8]];
  };  
//-------------------------------------------------------------------------------------------------  
Default
{
  if(DAC_Basic_Value != 5) then
  {
    DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
    hintc "Error: DAC_Config_Weapons > No valid config number";
  };
  if(true) exitwith {};
  };
};

_TempArray = [_Weapon_Pool] + [_Magazine_Pool];
_TempArray