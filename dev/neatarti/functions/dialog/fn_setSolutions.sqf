#include "script_component.hpp"

params ["_lnbSolutions", "_type"];

private ["_solutions", "_stringifedSolutions", "_solution"];

switch(_type) do {
    case "H": {
        _solutions = GVAR(solutionsHigh);
    };
    case "L": {
        _solutions = GVAR(solutionsLow);
    };
};

_stringifedSolutions = [];
{
    _solution = [format ["%1%2", _foreachIndex + 1, _type]];
    {
        if(IS_NUMBER(_x) && {_x < 0}) then { _x = "ERR" };
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
    _solution = _x;
    _lnbSolutions lnbAddRow _x;
} foreach _stringifedSolutions;