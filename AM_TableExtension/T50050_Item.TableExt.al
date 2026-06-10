tableextension 50050 Item extends Item //27
{
    fields
    {

        field(50050; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';//, comment = 'DEU="Kreditor Name"';

            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051; "item Classification"; Enum Item_Classification)
        {
            Caption = 'item Classification', comment = 'DEU="Artikelaufteilung"';
            DataClassification = CustomerContent;
        }
    }
}