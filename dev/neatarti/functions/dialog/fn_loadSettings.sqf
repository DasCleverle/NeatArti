#include "script_component.hpp"

params ["_display"];

_txtSettingsPosX = _display displayCtrl IDC_TXT_SETTINGS_POSX;
_txtSettingsPosY = _display displayCtrl IDC_TXT_SETTINGS_POSY;
_txtSettingsHeight = _display displayCtrl IDC_TXT_SETTINGS_HEIGHT;
_cmbSettingsWeapon = _display displayCtrl IDC_CMB_SETTINGS_ARTY;

_dlblPos = _display displayCtrl IDC_DLBL_POS;
_dlblHeight = _display displayCtrl IDC_DLBL_HEIGHT;
_dlblArty = _display displayCtrl IDC_DLBL_ARTY;

_txtSettingsPosX ctrlSetText str (GVAR(settingsPos) select 0);
_txtSettingsPosY ctrlSetText str (GVAR(settingsPos) select 1);
_txtSettingsHeight ctrlSetText str GVAR(settingsHeight);
_cmbSettingsWeapon lbSetCurSel GVAR(settingsWeapon);

_dlblPos ctrlSetText format ["POS: %1 %2", GVAR(settingsPos) select 0, GVAR(settingsPos) select 1];
_dlblHeight ctrlSetText format ["HEIGHT: %1 m", GVAR(settingsHeight)];
_dlblArty ctrlSetText format ["ARTY: %1", GVAR(weaponNames) select GVAR(settingsWeapon)];