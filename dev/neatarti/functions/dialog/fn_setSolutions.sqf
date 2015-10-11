#include "script_component.hpp"

params ["_lnbSolutions", "_type", "_solutions"];

private ["_stringifedSolutions"];

_stringifedSolutions = [];
{
    _solution = [format ["%1%2", _foreachIndex + 1, _type]];
    {
        if(!IS_STRING(_x)) then {
            _solution pushBack str _x;
        }
        else {
            _solution pushBack _x;
        };
    } foreach _x;

    _stringifedSolutions pushBack _solution;
} foreach _solutions;

[_lnbSolutions] call FUNC(clearSolutions);
{
    _lnbSolutions lnbAddRow _x;
} foreach _stringifedSolutions;