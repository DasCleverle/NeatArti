#include "script_component.hpp"

private ["_posPlayer", "_posDistant"];

_posPlayer = ATLToASL positionCameraToWorld [0,0,0];
_posDistant = ATLToASL positionCameraToWorld [0,0,100000];

GVAR(looksAtSky) = [] isEqualTo lineIntersectsSurfaces [_posPlayer, _posDistant, player, vehicle player, true, 1, "VIEW", "NONE"];