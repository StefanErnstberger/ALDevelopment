pageextension 50207 "Purchase Order Archive Subform" extends "Purchase Order Archive Subform"
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