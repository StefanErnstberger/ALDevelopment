table 50016 LoE_SerialNo
{
    DataClassification = CustomerContent;
    Caption = 'LoE Serial No.';
    LookupPageId = LoE_SerialNo;

    fields
    {
        field(1; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = job;
        }

        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
        }

        field(3; "Job Line No."; Integer)
        {
            Caption = 'Job Line No.', comment = 'DEU="Zeilen Nr."';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.', comment = 'DEU="Zeilen Nr."';
        }

        field(5; "List Of Equipment No."; Code[20])
        {
            Caption = 'List of Equipment No.';
            TableRelation = BIT_AEM_ListOfEqmtHeader;
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; "Item No. Component"; Code[20])
        {
            Caption = 'Item No. Component';
            TableRelation = item;
        }
        field(12; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
        }
        field(13; Comment; Text[100])
        {
            Caption = 'Serial No.';
        }
        field(21; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            TableRelation = item;
            Editable = false;
            CalcFormula = lookup(item.Description where("No." = field("Item No. Component")));
        }
    }
    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Job Line No.", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Job No.", "List Of Equipment No.")
        {

        }
    }
    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
    begin
        Date := WorkDate;
    end;

    procedure DeleteSerialNoHeader(LOEHeader: record BIT_AEM_ListOfEqmtHeader)
    var
        LOESerialNo: record LoE_SerialNo;
    begin
        LOESerialNo.SetRange("Job No.", LOEHeader."Job No.");
        LOESerialNo.SetRange("List Of Equipment No.", LOEHeader."No.");
        if not LOESerialNo.IsEmpty() then
            LOESerialNo.DeleteAll(true);
    end;

    procedure DeleteSerialNoLine(JobPlanningLine: record "Job Planning Line")
    var
        LOESerialNo: record LoE_SerialNo;
    begin
        LOESerialNo.SetRange("Job No.", JobPlanningLine."Job No.");
        LOESerialNo.setrange("Job Task No.", JobPlanningLine."Job Task No.");
        LOESerialNo.SetRange("Job line no.", JobPlanningLine."line No.");
        if not LOESerialNo.IsEmpty() then
            LOESerialNo.DeleteAll(true);
    end;

    trigger OnInsert()
    begin
        SetUpNewLine();
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
