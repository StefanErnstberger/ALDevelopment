tableextension 50050 Item extends Item //27
{
    fields
    {
        field(50050; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}