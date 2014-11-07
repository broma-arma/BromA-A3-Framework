#include "definitions.sqf"

class SettingsDialog {
	idd = BON_SETTINGS_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[_this] execVM 'optional\view_distance\bon_settings.sqf'";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground
	{
		class Mainback : HW_RscPicture {
			idc = 0;
			x = 0.042;
			y = 0.101;
			w = 1.0;
			h = 0.836601;
			text = "\ca\ui\data\igui_background_addrecord_ca.paa";
		};	
		class SettingsTitle : HW_RscText {
		   	idc = 0;
			x = 0.15;
			y =  0.147;
			w = __EVAL(15 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.03;
			text = "Settings";
		};
		class ViewdistTitle : HW_RscText {
		   	idc = BON_SETTINGS_SLIDERTITLE;
			x = 0.15;
			y =  0.26;
			w = __EVAL(35 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.035;
			text = "";
		};
		class GrasslayerTitle : HW_RscText {
		   	idc = 0;
			x = 0.5;
			y =  0.195;
			w = __EVAL(35 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 1, 1, 1, 0 };
			sizeEx = 0.035;
			text = "Terrain LOD";
		};
	};
	class controls
	{
		class ViewSlider : HW_RscXSlider {
			idc = BON_SETTINGS_SLIDER;
			x = 0.07;
			y = 0.34;
			w = 0.45;
			h = __EVAL(4 * _ySpacing);
		};

		class GrassList {
			idc = BON_SETTINGS_GRASSLIST;
			type = CT_TOOLBOX;
			style = ST_LEFT;
			x = 0.6; y = 0.235;
			w = __EVAL(35 * _xSpacing); h = __EVAL(20 * _ySpacing);
			colorText[] = Color_White;
			colorTextSelect[] = {0, 0, 1, 1};
			colorSelect[] = {0, 0, 0, 1};
			colorTextDisable[] = {0, 0, 0, 1};
			color[] = { 0, 0, 0, 1 };
			colorDisable[] = { 0, 0, 0, 1 };
			coloSelectedBg[] = { 1, 1, 1, 0 };
			font = "Zeppelin32";
			sizeEx = 0.025;
			rows = 5;
			columns = 1;
			strings[] = {"bumpiest","high","normal","low","smooth"};
			onToolBoxSelChanged = "GrassLayer = (_this select 1); GrassLayerChanged=true;";
		};
		class CloseButton: HW_RscGUIShortcutButton {
			idc = 0;
			x = 0.595;
			y = 0.465;
			//w = __EVAL(20 * _xSpacing);
			//h = __EVAL(4 * _ySpacing);
			//colorActive[] = CA_UI_green;
			text = "Close";
			onButtonClick = "CloseDialog 0";
		};
	};
};