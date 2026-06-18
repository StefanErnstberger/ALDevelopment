table 50016 LoE_SerialNo
{
    DataClassification = CustomerContent;
    Caption = 'LoE Serial No.';
    LookupPageId = LoE_SerialNo;
    DrillDownPageId = LoE_SerialNo;

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
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Job Planning Line"."Job Task No." where("job No." = field("Job No."), "job Task no." = field("Job Task No."), "Line No." = field("Job Line No.")));
        }
        field(6; "Serial No. ASYM"; Text[30])
        {
            Caption = 'Serial No. ASYM', comment = 'DEU="ASYM Seriennummer"';
            TableRelation = "Job Planning Line";
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Job Planning Line"."Serial no. Asym" where("job No." = field("Job No."), "job Task no." = field("Job Task No."), "Line No." = field("Job Line No.")));
        }
        field(7; "Serial No. OEM"; Text[30])
        {
            Caption = 'Serial No. OEM', comment = 'DEU="OEM Seriennummer"';
            TableRelation = "Job Planning Line";
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Job Planning Line"."Serial no. OEM" where("job No." = field("Job No."), "job Task no." = field("Job Task No."), "Line No." = field("Job Line No.")));


        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; "Item No. Component"; Code[20])
        {
            Caption = 'Item No. Component';
            TableRelation = item;
            trigger OnValidate()
            begin
                calcfields("Serial No. ASYM", "Serial No. OEM", "Manufacturer Code", "Manufacturer Name", ProducerItemNo, "List Of Equipment No.");
            end;
        }
        field(12; "Serial No."; Code[20])
        {
            Caption = 'Serial No.';
        }
        field(13; Comment; Text[100])
        {
            Caption = 'Comment';
        }
        field(21; Description; Text[100])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            TableRelation = item;
            Editable = false;
            CalcFormula = lookup(item.Description where("No." = field("Item No. Component")));
        }
        field(22; "Manufacturer Code Component"; Code[10])
        {
            Caption = 'Manufacturer Code Component';
            editable = false;
            FieldClass = FlowField;
            TableRelation = Manufacturer;
            CalcFormula = lookup(item."Manufacturer Code" where("No." = field("Item No. Component")));
        }
        field(23; "Manufacturer Name Component"; Text[50])
        {
            Caption = 'Manufacturer Name Component', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field("Manufacturer Code Component")));
            Editable = false;
        }
        field(24; ProducerItemNoComponent; Text[50])
        {
            Caption = 'Manufacturer Item No. Component', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.ProducerItemNo where("No." = field("item No. Component")));
            Editable = false;
        }
        field(31; "Item No. LOE"; Code[20])
        {
            Caption = 'Item No. LOE';
            TableRelation = item;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Job Planning Line"."No." where("job No." = field("Job No."), "job Task no." = field("Job Task No."), "Line No." = field("Job Line No.")));
        }
        field(32; "Description LOE"; Text[100])
        {
            Caption = 'Description LOE';
            editable = false;
            FieldClass = FlowField;
            TableRelation = Manufacturer;
            CalcFormula = lookup(item.Description where("No." = field("Item No. loe")));
        }
        field(51000; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            editable = false;
            FieldClass = FlowField;
            TableRelation = Manufacturer;
            CalcFormula = lookup(item."Manufacturer Code" where("No." = field("Item No. loe")));
        }
        field(51001; "Manufacturer Name"; Text[50])
        {
            Caption = 'Manufacturer Name', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Manufacturer.Name where(Code = field("Manufacturer Code")));
            Editable = false;
        }
        field(51003; ProducerItemNo; Text[50])
        {
            Caption = 'Manufacturer Item No.', comment = 'Hersteller Name"';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.ProducerItemNo where("No." = field("item No. loe")));
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Job No.", "Job Task No.", "Job Line No.", "Line No.")
        {
            Clustered = true;
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
