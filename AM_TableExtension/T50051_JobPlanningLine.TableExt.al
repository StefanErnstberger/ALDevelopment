tableextension 50051 "Job Planning Line" extends "Job Planning Line"
{
    fields
    {
        field(51000; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field(ItemManufacturerCode)));
            Editable = false;
        }
        modify(InfoField1)
        {
            Caption = 'Material Access', comment = 'DEU=""';
        }
        modify(InfoField4)
        {
            Caption = 'Installationn Place', comment = 'DEU=""';
        }
        modify(InfoField5)
        {
            Caption = 'Description', comment = 'DEU=""';
        }
        modify(InfoField9)
        {
            Caption = 'Colour', comment = 'DEU=""';
        }
        modify(InfoField10)
        {
            Caption = 'Alt-Unit No.', comment = 'DEU=""';
        }
    }
}
