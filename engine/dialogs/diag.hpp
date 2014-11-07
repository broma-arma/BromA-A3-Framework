//     ____   ____       _       ____   _  __        _   _    ___    _____   _____   ____       _      ____  
//    / ___| |  _ \     / \     / ___| | |/ /       | \ | |  / _ \  |_   _| | ____| |  _ \     / \    |  _ \ 
//   | |     | |_) |   / _ \   | |     | ' /        |  \| | | | | |   | |   |  _|   | |_) |   / _ \   | | | |
//   | |___  |  _ <   / ___ \  | |___  | . \        | |\  | | |_| |   | |   | |___  |  __/   / ___ \  | |_| |
//    \____| |_| \_\ /_/   \_\  \____| |_|\_\       |_| \_|  \___/    |_|   |_____| |_|     /_/   \_\ |____/ 
//                                                                                                          
//*********************************************************************************************************************
//
// DIALOG INIT
//
//*********************************************************************************************************************
#include "defines.hpp"

class CRACK_notepad_diag_main {
	idd = 80509;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad;";
	onUnload = "['close'] spawn CRACK_fnc_notepad;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0);
			h = CRACK_Row_DY(0,30);
			w = CRACK_Box_W * 1.5;
		};
		class NotePadCaption : CRACK_Caption {
			text = "NotePad";
			moving = 1;
			y = CRACK_Row_Y(0);
			w = CRACK_Box_W * 1.5;
		};
		class NotePage : CRACK_Combo {
			idc = 1;
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(2);
			w = CRACK_Box_W * (.6);
			onLBSelChanged = "[] spawn CRACK_fnc_changePage;";
		};
		class NoteLoad : CRACK_Button {
			text = "Clear Page";
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.8)));
			y = CRACK_Row_Y(2);
			w = CRACK_Box_W * (.6);
			action = "[] spawn CRACK_fnc_clearNotepad;";
		};
		class NoteTitle : CRACK_Edit {
			idc = 3;
			y = CRACK_Row_Y(4);
			w = CRACK_Box_W * 1.3;
		};
		class CodeCaption : CRACK_Caption {
			text = "Notes:";
			y = CRACK_Row_Y(6);
			w = CRACK_Box_W * 1.5;
		};
		class Notes5 : CRACK_Edit {
			idc = 6;
			y = CRACK_Row_dif_Y(8);
		};
		class Notes6 : CRACK_Edit {
			idc = 7;
			y = CRACK_Row_dif_Y(9);
		};
		class Notes7 : CRACK_Edit {
			idc = 8;
			y = CRACK_Row_dif_Y(10);
		};
		class Notes8 : CRACK_Edit {
			idc = 9;
			y = CRACK_Row_dif_Y(11);
		};
		class Notes9 : CRACK_Edit {
			idc = 10;
			y = CRACK_Row_dif_Y(12);
		};
		class Notes10 : CRACK_Edit {
			idc = 11;
			y = CRACK_Row_dif_Y(13);
		};
		class Notes11 : CRACK_Edit {
			idc = 12;
			y = CRACK_Row_dif_Y(14);
		};
		class Notes12 : CRACK_Edit {
			idc = 13;
			y = CRACK_Row_dif_Y(15);
		};
		class Notes13 : CRACK_Edit {
			idc = 14;
			y = CRACK_Row_dif_Y(16);
		};
		class Notes14 : CRACK_Edit {
			idc = 15;
			y = CRACK_Row_dif_Y(17);
		};
		class Notes15 : CRACK_Edit {
			idc = 16;
			y = CRACK_Row_dif_Y(18);
			h = CRACK_Row_DY(18,19);
		};
		class Notes16 : CRACK_Edit {
			idc = 17;
			y = CRACK_Row_dif_Y(19);
		};
		class Notes17 : CRACK_Edit {
			idc = 18;
			y = CRACK_Row_dif_Y(20);
		};
		class Notes18 : CRACK_Edit {
			idc = 19;
			y = CRACK_Row_dif_Y(21);
		};
		class Notes19 : CRACK_Edit {
			idc = 20;
			y = CRACK_Row_dif_Y(22);
		};
		class Notes20 : CRACK_Edit {
			idc = 21;
			y = CRACK_Row_dif_Y(23);
		};
		class Notes21 : CRACK_Edit {
			idc = 22;
			y = CRACK_Row_dif_Y(24);
		};
		class Notes22 : CRACK_Edit {
			idc = 23;
			y = CRACK_Row_dif_Y(25);
		};
		class Notes23 : CRACK_Edit {
			idc = 24;
			y = CRACK_Row_dif_Y(26);
		};
		class Notes24 : CRACK_Edit {
			idc = 25;
			y = CRACK_Row_dif_Y(27);
		};
		class Notes25 : CRACK_Edit {
			idc = 26;
			y = CRACK_Row_dif_Y(28);
		};
		class Clear : CRACK_Button {
			text = "Copy";
			w = CRACK_Box_W * (1.5 * (0.25));
			y = CRACK_Row_Y(30);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "[] spawn CRACK_fnc_copyNotepadToClipboard;";
		};
		class Save : CRACK_Button {
			text = "Save";
			w = CRACK_Box_W * (1.5 * (0.5));
			x = CRACK_Box_X(0) + (CRACK_Box_W * (1.5 * (0.25)));
			y = CRACK_Row_Y(30);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "[] spawn CRACK_fnc_saveNotepad;";
			default = true;
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W * (1.5 * (0.25));
			x = CRACK_Box_X(0) + (CRACK_Box_W * (1.5 * (0.75)));
			y = CRACK_Row_Y(30);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "closeDialog 80509;";
		};
	};
};


class CRACK_reminders_diag_main {
	idd = 80529;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad;";
	onUnload = "['close'] spawn CRACK_fnc_notepad;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			h = CRACK_Row_DY(0,6);
			w = CRACK_Box_W * .5;
		};
		class NotePadCaption : CRACK_Caption {
			text = "Reminders";
			moving = 1;
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			w = CRACK_Box_W * .5;
		};
		class NewReminder : CRACK_Button {
			text = "Create";
			idc = 1;
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(2) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .3;
			action = "[0] spawn CRACK_fnc_openReminders;";
			default = true;
		};
		class DeleteReminder : CRACK_Button {
			text = "Delete";
			idc = 2;
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(4) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .3;
			action = "[1] spawn CRACK_fnc_openReminders;";
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W * .5;
			x = CRACK_Box_X(2);
			y = CRACK_Row_Y(6) + CRACK_Row_Y(18);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "closeDialog 80529;";
		};
	};
};

class CRACK_reminders_diag_new_reminder {
	idd = 80519;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad;";
	onUnload = "['close'] spawn CRACK_fnc_notepad;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0);
			h = CRACK_Row_DY(0,20);
			w = CRACK_Box_W;
		};
		class NotePadCaption : CRACK_Caption {
			text = "New Reminder";
			moving = 1;
			y = CRACK_Row_Y(0);
			w = CRACK_Box_W;
		};
		class TitleText : CRACK_Text {
			text = "Title:";
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.08));
			y = CRACK_Row_Y(2);
			w = CRACK_Box_W * .3;
		};
		class NoteTitle : CRACK_Edit {
			idc = 3;
			y = CRACK_Row_Y(3);
			w = CRACK_Box_W * .8;
		};
		class CodeCaption : CRACK_Caption {
			text = "Options:";
			y = CRACK_Row_Y(5);
			w = CRACK_Box_W;
		};
		class TimerText : CRACK_Text {
			text = "Timer:";
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.08));
			y = CRACK_Row_dif_Y(7);
			w = CRACK_Box_W * .3;
		};
		class MinuteText : CRACK_Edit {
			idc = 6;
			x = CRACK_Box_X(0) + (CRACK_Box_W * 0.28);
			y = CRACK_Row_dif_Y(7);
			w = CRACK_Box_W * .3;
		};
		class Notes5 : CRACK_Text {
			text = "Minutes";
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.6));
			y = CRACK_Row_dif_Y(7);
			w = CRACK_Box_W * .3;
		};
		class HintText : CRACK_Text {
			text = "Hint Text:";
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.08));
			y = CRACK_Row_dif_Y(9);
			w = CRACK_Box_W * .3;
		};
		class Hint : CRACK_Edit {
			idc = 7;
			style = 16;
			h = CRACK_Row_H * 8;
			y = CRACK_Row_dif_Y(10);
			w = CRACK_Box_W * .8;
		};
		class ExtraText : CRACK_Text {
			text = "Use <br/> to create a new line";
			sizeEx = 0.020;
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(0) + (CRACK_Box_W * 0.082));
			y = CRACK_Row_dif_Y(18);
			w = CRACK_Box_W * .8;
		};
		class Clear : CRACK_Button {
			text = "Clear";
			w = CRACK_Box_W * 0.25;
			y = CRACK_Row_Y(20);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "[] spawn CRACK_fnc_clearReminder;";
		};
		class Save : CRACK_Button {
			text = "Create";
			w = CRACK_Box_W * 0.5;
			x = CRACK_Box_X(0) + (CRACK_Box_W * 0.25);
			y = CRACK_Row_Y(20);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "[] spawn CRACK_fnc_saveReminder;";
			default = true;
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W * 0.25;
			x = CRACK_Box_X(0) + (CRACK_Box_W * 0.75);
			y = CRACK_Row_Y(20);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "closeDialog 80519;";
		};
	};
};

class CRACK_reminders_diag_delete_reminder {
	idd = 80539;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad;";
	onUnload = "['close'] spawn CRACK_fnc_notepad;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			h = CRACK_Row_DY(0,4);
			w = CRACK_Box_W;
		};
		class NotePadCaption : CRACK_Caption {
			text = "Delete Reminder";
			moving = 1;
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			w = CRACK_Box_W;
		};
		class NewReminder : CRACK_Combo {
			idc = 1;
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(2) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class DeleteReminder : CRACK_Button {
			text = "Delete";
			w = CRACK_Box_W * .5;
			x = CRACK_Box_X(2);
			y = CRACK_Row_Y(4) + CRACK_Row_Y(18);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "[] spawn CRACK_fnc_deleteReminder;";
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W * .5;
			x = CRACK_Box_X(2) + (CRACK_Box_W * .5);
			y = CRACK_Row_Y(4) + CRACK_Row_Y(18);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "closeDialog 80539;";
		};
	};
};

class CRACK_notepad_diag_copy_page {
	idd = 80549;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad;";
	onUnload = "['close'] spawn CRACK_fnc_notepad;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			h = CRACK_Row_DY(0,10);
			w = CRACK_Box_W;
		};
		class NotePadCaption : CRACK_Caption {
			text = "Copy NotePad Page";
			moving = 1;
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(2);
			w = CRACK_Box_W;
		};
		class TheirPage : CRACK_Combo {
			idc = 1;
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(2) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class ExtraText : CRACK_Text {
			text = "to your page of";
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.3));
			y = CRACK_Row_Y(4) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class YourPage : CRACK_Combo {
			idc = 2;
			x = (CRACK_Box_X(2) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(6) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class CopyPage : CRACK_Button {
			text = "Copy";
			w = CRACK_Box_W * .5;
			x = CRACK_Box_X(2) + (CRACK_Box_W * 0.25));
			y = CRACK_Row_Y(8) + CRACK_Row_Y(18);
			action = "[] spawn CRACK_fnc_getNotepad;";
			default = true;
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W ;
			x = CRACK_Box_X(2);
			y = CRACK_Row_Y(10) + CRACK_Row_Y(18);
			action = "closeDialog 80549;";
		};
	};
};

class CRACK_notepad_diag_copyPageToClipboard {
	idd = 80559;
	movingEnable = 1;
	enableSimulation = 1;
	onLoad = "['open'] spawn CRACK_fnc_notepad; CRACK_diag_copyPageToClipboard_open = true;";
	onUnload = "CRACK_diag_copyPageToClipboard_open = false;";

	class controls {
		class Background : CRACK_Frame {
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(1.5);
			h = CRACK_Row_DY(0,11);
			w = CRACK_Box_W;
		};
		class NotePadCaption : CRACK_Caption {
			text = "Copy Page to Clipboard";
			moving = 1;
			y = CRACK_Row_Y(0) + CRACK_Row_Y(18);
			x = CRACK_Box_X(1.5);
			w = CRACK_Box_W;
		};
		class CopyTextBox : CRACK_Edit {
			text = "";
			idc = 1;
			x = (CRACK_Box_X(1.5) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(2) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
			h = CRACK_Row_DY(0,5);
			style = ST_MULTI;
			default = true;
		};
		class CopyText0 : CRACK_Text {
			text = "Select & Copy (CTRL + C) all of the text above";
			sizeEx = 0.020;
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(1.5) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(7) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class CopyText1 : CRACK_Text {
			text = "Remember to find and replace every <br />";
			//sizeEx = 0.020;
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(1.5) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(8.5) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class CopyText2 : CRACK_Text {
			text = "with an actual line break.";
			//sizeEx = 0.020;
			colorText[] = {CRACK_Colours_Black, 1};
			x = (CRACK_Box_X(1.5) + (CRACK_Box_W * 0.1));
			y = CRACK_Row_Y(9.1) + CRACK_Row_Y(18);
			w = CRACK_Box_W * .8;
		};
		class Close : CRACK_Button {
			text = "Close";
			w = CRACK_Box_W;
			x = CRACK_Box_X(1.5);
			y = CRACK_Row_Y(10.99) + CRACK_Row_Y(18);
			colorFocused[] = {CRACK_Colours_White, 3/5};
			colorBackgroundActive[] = {CRACK_Colours_White, 5/5};
			action = "closeDialog 80529;";
		};
	};
};