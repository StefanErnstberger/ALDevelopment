page 50035 LoE_SerialNo
{
    AutoSplitKey = true;
    Caption = 'LoE Serial No.';
    DataCaptionFields = "List Of Equipment No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = LoE_SerialNo;

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
                field(Comment; rec.Comment)
                {
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field(Date; rec.Date)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Job No."; rec."Job No.")
                {
                    ApplicationArea = Comments;
                    Editable = false;
                }
                field("List Of Equipment No."; rec."List Of Equipment No.")
                {
                    ApplicationArea = all;
                    Editable = false;

                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetUpNewLine;
    end;
}