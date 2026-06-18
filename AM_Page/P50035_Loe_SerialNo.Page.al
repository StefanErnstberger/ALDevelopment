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
                field("Manufacturer Code Component"; rec."Manufacturer Code Component")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Manufacturer Name Component"; rec."Manufacturer Name Component")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(ProducerItemNoComponent; rec.ProducerItemNoComponent)
                {
                    ApplicationArea = all;
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
                field("Item No. LOE"; rec."Item No. LOE")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Description LOE"; rec."Description LOE")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Serial No. ASYM"; rec."Serial No. ASYM")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Serial No. OEM"; rec."Serial No. OEM")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Manufacturer Code"; rec."Manufacturer Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Manufacturer Name"; rec."Manufacturer Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(ProducerItemNo; rec.ProducerItemNo)
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