class CfgFunctions {
    class ADDON {
        class calculation {
            file = FUNCFILE(calculation);

            class calculate {};

            class getModeAndVelocity {};
            class getMode {};
            class getVelocity {};

            class pointAttack {};
        };

        class common {
            file = FUNCFILE(common);
            class postInit { postInit = 1; };

            class padLeft {};
        };

        class dialog {
            file = FUNCFILE(dialog);

            class dialog_onLoad {};
            class main_onLoad {};
            class attackType_onLoad {};

            class loadSettings {};
            class saveSettings {};
            class getPos {};

            class switchPage {};

            class getInputs {};
            class btnGo_click {};
            class btnClear_click {};
            class btnBack_click {};

            class setSolutionType {};
            class setSolutions {};
            class clearSolutions {};
        };
    };
};