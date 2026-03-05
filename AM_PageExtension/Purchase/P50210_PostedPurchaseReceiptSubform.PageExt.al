pageextension 50210 "Posted Purch. Rcpt. Subform" extends "Posted Purchase Rcpt. Subform"
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