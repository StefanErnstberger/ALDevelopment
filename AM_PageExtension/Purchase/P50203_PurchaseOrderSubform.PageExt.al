pageextension 50203 "Purchase Order Subform" extends "Purchase Order Subform" //30
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