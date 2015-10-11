#include "script_component.hpp"

params ["_range", "_height", "_magazine", ["_return", "all"]];

private ["_velocity", "_mode"];

{
    _initSpeed = getNumber(_magazine >> "initSpeed");
    _artilleryCharge = getNumber(_x >> "artilleryCharge");

    _velocity = _initSpeed * _artilleryCharge;
    _mode = getText(_x >> "displayName");

    if(ELEV_DISC(_velocity, _range, _height) > 0) exitWith {};
} foreach GVAR(modeConfigs);

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
