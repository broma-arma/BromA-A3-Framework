//class RscTitles {
	class crewoverlay {
		idd = 1000500;
		movingEnable=0;
		duration = 9999999999;

		//note: the idc of crewlist is 1000501. it is also stored into uinamespace, see following line
		onLoad = "uiNamespace setVariable ['tfor_crewoverlay',[_this select 0,1000501]]";
		controlsBackground[] = {"crewlist"};

		class crewlist {
			idc = 1000501;
			type = CT_STRUCTURED_TEXT;
			style = ST_RIGHT;
			x = safeZoneXAbs;
			y = (safeZoneY + 0.275);
			w = safeZoneW;
			h = 1.0;
			size = 0.02;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,0.7};
			text ="";
			class Attributes {
				align = "right";
				valign = "middle";
				size = "1";
				shadow = true;
				shadowColor = "#2D2D2D";
			};
		};
	};
//};