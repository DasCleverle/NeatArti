#include "script_component.hpp"

params ["_targetPos", "_height", "_magazine", "_range", "_direction", "_count"];

private ["_modeVelocity", "_toPos", "_fromTo", "_solutionsHigh", "_solutionsLow"];

_toPos = [_targetPos, _range, _direction] call BIS_fnc_relPos;

_targetPos pushBack 0;
_toPos pushBack 0;

_fromTo = _toPos vectorDiff _targetPos;
_partFromTo = _fromTo vectorMultiply (1 / (_count - 1));

_solutionsHigh = [];
_solutionsLow = [];
for "_i" from 0 to _count - 1 do {
    _target = _targetPos vectorAdd (_partFromTo vectorMultiply _i);

    _modeVelocity = [RANGE(GVAR(settingsPos), _target), _height, _magazine] call FUNC(getModeAndVelocity);

    _solution = [_modeVelocity select 1, GVAR(settingsPos), _target, _height] call FUNC(calculate);

    (_solution select 0) pushBack (_modeVelocity select 0);
    (_solution select 1) pushBack (_modeVelocity select 0);

    _solutionsHigh pushBack (_solution select 0);
    _solutionsLow pushBack (_solution select 1);
};

[_solutionsHigh, _solutionsLow];