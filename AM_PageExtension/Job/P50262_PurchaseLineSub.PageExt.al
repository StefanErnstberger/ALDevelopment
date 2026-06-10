pageextension 50262 PurchseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("Vendor Item No.")
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