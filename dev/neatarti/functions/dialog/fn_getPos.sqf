#include "script_component.hpp"

disableSerialization;

params ["_control"];

private ["_display", "_pgbLoading"];
_display = ctrlParent _control;

_pgbLoading = _display displayCtrl IDC_PGB_LOADING;
_lblLoading = _display displayCtrl IDC_LBL_LOADING;

_pgbLoading ctrlShow true;
_lblLoading ctrlShow true;

#define LOAD_INTERVAL 0.01

{
    _x params ["_time", "_text"];
    _lblLoading ctrlSetText _text;
    for "_i" from 1 to (_time / LOAD_INTERVAL) do {
        sleep LOAD_INTERVAL;
        _pgbLoading progressSetPosition (_i * LOAD_INTERVAL / _time);
    };
} foreach [
    [0.9,"Contacting GPS-Satelite ..."],
    [0.5,"Retrieving position from satelite ..."],
    [0.45,"Loading data into device ..."]
];

_lblLoading ctrlSetText "Data loaded.";
sleep 0.75;
_pgbLoading ctrlShow false;
_lblLoading ctrlShow false;

_playerPos = getPosASL player;

[_control] call FUNC(saveSettings);

GVAR(settingsPos) = [(_playerPos select 0), (_playerPos select 1)];
GVAR(settingsHeight) = round (_playerPos select 2);

[_display] call FUNC(loadSettings);