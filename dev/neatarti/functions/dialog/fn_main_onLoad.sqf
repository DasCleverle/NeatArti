#include "script_component.hpp"

disableSerialization;

params ["_grpMainMenu"];

private ["_display", "_btnPointAttack", "_btnLineAttack", "_btnAreaAttack", "_cmbSettingsWeapon", "_btnSettingsSave", "_btnSettingsGetPos"];
_display = ctrlParent _grpMainMenu;

_btnPointAttack = _display displayCtrl IDC_BTN_POINTATTACK;
_btnLineAttack = _display displayCtrl IDC_BTN_LINEATTACK;
_btnAreaAttack = _display displayCtrl IDC_BTN_AREAATTACK;

_btnSettingsSave = _display displayCtrl IDC_BTN_SETTINGS_SAVE;
_btnSettingsGetPos = _display displayCtrl IDC_BTN_SETTINGS_GETPOS;
_cmbSettingsWeapon = _display displayCtrl IDC_CMB_SETTINGS_ARTY;

_btnPointAttack ctrlAddEventHandler ["ButtonClick", { [_this select 0, "point"] spawn FUNC(switchPage) }];
_btnLineAttack ctrlAddEventHandler ["ButtonClick", { [_this select 0, "line"] spawn FUNC(switchPage) }];
_btnAreaAttack ctrlAddEventHandler ["ButtonClick", { [_this select 0, "area"] spawn FUNC(switchPage) }];

_btnSettingsSave ctrlAddEventHandler ["ButtonClick", FUNC(saveSettings)];
_btnSettingsGetPos ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(getPos) }];

lbClear _cmbSettingsWeapon;
{
    _cmbSettingsWeapon lbAdd _x;
} foreach GVAR(weaponNames);

[_display] call FUNC(loadSettings);