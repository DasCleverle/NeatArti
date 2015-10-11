#include "script_component.hpp"

params ["_range", "_height", "_magazine", ["_return", "all"]];

private ["_velocity", "_mode", "_hashKey", "_modeAndVel"];
_hashKey = str [_range, _height, configName _magazine];
_modeAndVel = [GVAR(modesHash), _hashKey] call CBA_fnc_hashGet;

if (isNil "_modeAndVel") then {
    {
        _initSpeed = getNumber(_magazine >> "initSpeed");
        _artilleryCharge = getNumber(_x >> "artilleryCharge");

        _velocity = _initSpeed * _artilleryCharge;
        _mode = getText(_x >> "displayName");

        [GVAR(modesHash), _hashKey, [_mode, _velocity]] call CBA_fnc_hashSet;

        if(ELEV_DISC(_velocity, _range, _height) > 0) exitWith {};
    } foreach GVAR(modeConfigs);
}
else {
    _mode = _modeAndVel select 0;
    _velocity = _modeAndVel select 1;
};

switch (_return) do {
    case "all": {
        [_mode, _velocity];
    };
    case "mode": {
        _mode;
    };
    case "velocity": {
        _velocity;
    };
};
