#include "script_component.hpp"

params ["_display"];

_txtSettingsPosX = _display displayCtrl IDC_TXT_SETTINGS_POSX;
_txtSettingsPosY = _display displayCtrl IDC_TXT_SETTINGS_POSY;
_txtSettingsHeight = _display displayCtrl IDC_TXT_SETTINGS_HEIGHT;
_cmbSettingsWeapon = _display displayCtrl IDC_CMB_SETTINGS_ARTY;

_txtSettingsPosX ctrlSetText COORDPAD(str round (GVAR(settingsPos) select 0));
_txtSettingsPosY ctrlSetText COORDPAD(str round (GVAR(settingsPos) select 1));
_txtSettingsHeight ctrlSetText str GVAR(settingsHeight);
_cmbSettingsWeapon lbSetCurSel GVAR(settingsWeapon);