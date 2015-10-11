#include "script_component.hpp"

params ["_range", "_height", "_magazine"];

[_range, _height, _magazine, "mode"] call FUNC(getModeAndVelocity);