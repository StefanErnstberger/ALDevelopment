pageextension 50200 "Item Card" extends "Item Card" //30
{
    layout
    {
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ToolTip = 'Shows the Vendor Name.';
                ApplicationArea = all;
            }
        }
    }
}