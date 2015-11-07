class CfgWeapons {
    class ItemCore;
    class ItemGPS;
    class InventoryItem_Base_F;

    class GVAR(calculator) : ItemCore {
        _generalMacro = GVAR(calculator);
        author = MAINAUTHOR;
        displayName = "Artillery Calculator";
        descriptionShort = "Enables advanced artillery calculations.";
        model = "\A3\Structures_F\Items\Electronics\Laptop_F.p3d";
        picture = PATHTOF(data\thumb_tablet.paa);
        scope = 2;

        detectRange = -1;
        simulation = "ItemMineDetector"; // Dat Hack!

        class ItemInfo {
            mass = 10;
        };
    };
};