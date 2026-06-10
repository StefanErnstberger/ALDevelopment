tableextension 50051 "Job Planning Line" extends "Job Planning Line"
{
    fields
    {
        field(51000; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field(ItemManufacturerCode)));
            Editable = false;
        }
        field(51001; "item Classification"; Enum Item_Classification)
        {
            Caption = 'Item Classification', comment = 'DEU="Artikelaufteilungsgruppe"';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Item."item Classification" where("No." = field("No.")));
        }
        modify(InfoField1)
        {
            Caption = 'Material Access', comment = 'Materialzugang"';

        }
        modify(InfoField4)
        {
            Caption = 'Installationn Place', comment = '"Verortung"';
        }
        modify(InfoField5)
        {
            Caption = 'Description', comment = '"Beschreibung"';
        }
        modify(InfoField9)
        {
            Caption = 'Colour', comment = '"Farbe"';
        }
        modify(InfoField10)
        {
            Caption = 'Alt-Unit No.', comment = '"Alt-Unit Nr."';
        }
    }
}
