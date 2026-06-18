pageextension 50211 "Purchase Lines" extends "Purchase lines" //30
{
    layout
    {
        addbefore("Expected Receipt Date")
        {
            field("Requested Receipt Date"; rec."Requested Receipt Date")
            {
                ApplicationArea = all;
            }
            field("Promised Receipt Date"; "Promised Receipt Date")
            {
                ApplicationArea = all;
            }
            field("Planned Receipt Date"; "Planned Receipt Date")
            {
                ApplicationArea = all;
            }
        }
    }
}