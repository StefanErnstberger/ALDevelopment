pageextension 50208 "Posted Purch. Invoice Subform" extends "Posted Purch. Invoice Subform"
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