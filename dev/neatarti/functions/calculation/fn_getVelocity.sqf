#include "script_component.hpp"

params ["_range", "_height", "_magazine"];

[_range, _height, _magazine, "velocity"] call FUNC(getModeAndVelocity);