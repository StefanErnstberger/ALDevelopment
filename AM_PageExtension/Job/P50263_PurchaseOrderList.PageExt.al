pageextension 50263 PurchseOrderList extends "Purchase Order list"
{
    layout
    {
        addafter("Requested Receipt Date")
        {
            field("Promised Receipt Date"; rec."Promised Receipt Date")
            {
                ApplicationArea = all;
            }
            field("Expected Receipt Date"; rec."Expected Receipt Date")
            {
                ApplicationArea = all;
            }
        }
    }
}