pageextension 50205 "Purchase Cr.Memo Subform" extends "Purch. Cr. Memo Subform"
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