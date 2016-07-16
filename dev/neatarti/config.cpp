#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = MAINAUTHOR;
        url = "http://www.gruppe-w.de/";
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgFunctions.hpp"
#include "dialog.hpp"