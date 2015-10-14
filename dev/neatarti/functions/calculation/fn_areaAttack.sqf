#include "script_component.hpp"
#define PER_ROTATION 6

params ["_targetPos", "_height", "_magazine", "_radius", "_count"];

private ["_solutionsHigh", "_solutionsLow"];

_solutionsHigh = [];
_solutionsLow = [];
for "_i" from 0 to _count - 1 do {
    _direction = _i * (360 / PER_ROTATION);

    while { _direction >= 360 } do { _direction = _direction - 360; };

    _range = _radius / (((_count / PER_ROTATION) + 1) / (ceil ((_i + 1) / 6) max 1));

    diag_log [_direction, _range];

    _target = [_targetPos, _range, _direction] call BIS_fnc_relPos;

    _marker = createMarker [str _target, _target];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_dot_noShadow";

    _modeVelocity = [RANGE(GVAR(settingsPos), _target), _height, _magazine] call FUNC(getModeAndVelocity);

    _solution = [_modeVelocity select 1, GVAR(settingsPos), _target, _height] call FUNC(calculate);

    (_solution select 0) pushBack (_modeVelocity select 0);
    (_solution select 1) pushBack (_modeVelocity select 0);

    _solutionsHigh pushBack (_solution select 0);
    _solutionsLow pushBack (_solution select 1);
};

[_solutionsHigh, _solutionsLow];

