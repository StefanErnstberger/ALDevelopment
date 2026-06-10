pageextension 50201 "Item List" extends "Item List" //30
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
        addbefore(Blocked)
        {
            field("item Classificiation"; rec."item Classification")
            {
                ToolTip = 'Shows the Item Classification';
                ApplicationArea = all;
            }
        }
    }
}