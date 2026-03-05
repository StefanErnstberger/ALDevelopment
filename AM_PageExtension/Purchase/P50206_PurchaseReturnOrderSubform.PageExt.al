pageextension 50206 "Purchase Return Order Subform" extends "Purchase Return Order Subform"
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