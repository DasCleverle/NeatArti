class CfgFunctions {
    class ADDON {
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

            class btnGo_click {};
            class btnClear_click {};
            class btnBack_click {};
        };
    };
};