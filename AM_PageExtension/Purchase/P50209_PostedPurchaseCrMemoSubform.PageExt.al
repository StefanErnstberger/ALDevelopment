pageextension 50209 "Posted Purch. Cr.Memo Subform" extends "Posted Purch. Cr. Memo Subform"
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