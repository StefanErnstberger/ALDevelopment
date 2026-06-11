page 50036 LoE_SerialNo_FactBox
{
    AutoSplitKey = true;
    Caption = 'LoE SerialNo FactBox';
    DataCaptionFields = "List Of Equipment No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = LoE_SerialNo;

    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Item No. Component"; rec."Item No. Component")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; rec."Serial No.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {

    }


}