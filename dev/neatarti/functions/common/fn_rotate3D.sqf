#include "script_component.hpp"

params ["_vector", "_axis", "_angle"];

_axis params ["_n1", "_n2", "_n3"];

_matrix = [
    [(_n1 ^ 2) * (1 - cos _angle) + cos _angle,       _n1 * _n2 * (1 - cos _angle) - _n3 * sin _angle, _n1 * _n3 * (1 - cos _angle) + _n2 * sin _angle],
    [_n2 * _n1 * (1 - cos _angle) + _n3 * sin _angle, (_n2 ^ 2) * (1 - cos _angle) + cos _angle,       _n2 * _n3 * (1 - cos _angle) - _n1 * sin _angle],
    [_n3 * _n1 * (1 - cos _angle) - _n2 * sin _angle, _n3 * _n2 * (1 - cos _angle) + _n1 * sin _angle, (_n3 ^ 2) * (1 - cos _angle) + cos _angle]
];

_vector params ["_x", "_y", "_z"];

[
    _x * (_matrix select 0 select 0) + _y * (_matrix select 0 select 1) + _z * (_matrix select 0 select 2),
    _x * (_matrix select 1 select 0) + _y * (_matrix select 1 select 1) + _z * (_matrix select 1 select 2),
    _x * (_matrix select 2 select 0) + _y * (_matrix select 2 select 1) + _z * (_matrix select 2 select 2)
];