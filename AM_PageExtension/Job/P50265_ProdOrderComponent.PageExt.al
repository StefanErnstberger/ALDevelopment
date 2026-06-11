pageextension 50265 ProdOrderComponennt extends "Prod. Order Components"
{
    layout
    {
        modify(ItemClassification)
        {
            Visible = false;
        }
        addafter(Description)
        {
            field("Manufacturer Code"; rec."Manufacturer Code")
            {
                ApplicationArea = all;
            }
            field("Manufacturer Name"; rec."Manufacturer Name")
            {
                ApplicationArea = all;
            }
            field("item Classification"; rec."item Classification")
            {
                ApplicationArea = all;
            }
        }
    }
}