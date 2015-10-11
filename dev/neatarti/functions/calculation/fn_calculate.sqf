#include "script_component.hpp"
#define UNDEF "-1.#IND"

params ["_velocity", "_pos", "_targetPos", "_height"];

_range = RANGE(_pos, _targetPos);

_elev = atan((_velocity^2 + sqrt(ELEV_DISC(_velocity, _range, _height))) / (g * _range));
_elev2 = atan((_velocity^2 - sqrt(ELEV_DISC(_velocity, _range, _height))) / (g * _range));

_direction = [_pos, _targetPos] call BIS_fnc_dirTo;
//_direction = TOMILS(_direction);

_time = (_velocity * sin _elev + sqrt((_velocity * sin _elev) ^ 2 + 2 * g * abs _height)) / (g);
_time2 = (_velocity * sin _elev2 + sqrt((_velocity * sin _elev2) ^ 2 + 2 * g * abs _height)) / (g);

if(str _range == UNDEF)     then { _range = -1; };
if(str _elev == UNDEF)      then { _elev = -1; };
if(str _elev2 == UNDEF)     then { _elev2 = -1; };
if(str _direction == UNDEF) then { _direction = -1; };
if(str _time == UNDEF)      then { _time = -1; };
if(str _time2 == UNDEF)     then { _time2 = -1; };

[[_range, _elev, _direction, _time], [_range, _elev2, _direction, _time2]];