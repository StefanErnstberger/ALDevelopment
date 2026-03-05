pageextension 50204 "Purchase Invoice Subform" extends "Purch. Invoice Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Vendor Item No."; rec."Vendor Item No.")
            {
                ApplicationArea = all;
            }
        }
    }
}