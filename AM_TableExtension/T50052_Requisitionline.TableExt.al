tableextension 50052 Requisition_Line extends "Requisition Line"
{
    fields
    {
        field(51000; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            FieldClass = FlowField;
            TableRelation = Manufacturer;
            CalcFormula = lookup(item."Manufacturer Code" where("No." = field("No.")));
        }
        field(51001; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field("Manufacturer Code")));
            Editable = false;
        }
        field(51002; "item Classification"; Enum Item_Classification)
        {
            Caption = 'Item Classification', comment = 'DEU="Artikelaufteilungsgruppe"';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Item."item Classification" where("No." = field("No.")));
        }
    }
}
