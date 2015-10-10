#include "script_component.hpp"

params ["_text", "_padding", "_totalLength"];

for "_i" from count _text to _totalLength - 1 do {
    _text = _padding + _text;
};

_text;