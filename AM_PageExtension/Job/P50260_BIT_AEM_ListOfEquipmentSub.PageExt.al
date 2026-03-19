pageextension 50260 "BIT_AEM_ListOfEquipmentSub" extends "BIT_AEM_ListOfEquipmentSub"
{
    layout
    {
        addafter(ItemManufacturerCode)
        {
            field("Manufacturer Name"; rec."Manufacturer Name")
            {
                ApplicationArea = all;
            }
        }
        modify(InfoField1)
        {
            Caption = 'Material Access', comment = 'DEU="Materialzugang"';

        }
        modify(InfoField4)
        {
            Caption = 'Installationn Place', comment = 'DEU="Verortung"';
        }
        modify(InfoField5)
        {
            Caption = 'Description', comment = 'DEU="Beschreibung"';
        }
        modify(InfoField9)
        {
            Caption = 'Colour', comment = 'DEU="Farbe"';
        }
        modify(InfoField10)
        {
            Caption = 'Alt-Unit No.', comment = 'DEU="Alt-Unit Nr."';
        }
    }
}