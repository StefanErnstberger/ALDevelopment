pageextension 50200 "Item Card" extends "Item Card" //30
{
    layout
    {
        modify(ItemClassification)
        {
            visible = false;
        }
        addafter("Vendor No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ToolTip = 'Shows the Vendor Name.';
                Caption = 'Vendor Name';
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