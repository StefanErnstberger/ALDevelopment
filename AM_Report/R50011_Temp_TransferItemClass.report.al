report 50011 Temp_TransferItemClass
{
    ProcessingOnly = true;
    Caption = 'Transfer Item Class', comment = 'DEU="Projekt und Ressource Posten löschen"';
    ApplicationArea = All;
    UsageCategory = Tasks;
    UseRequestPage = true;
    Permissions = TableData "Res. Ledger Entry" = rmid,
        tabledata "Job Ledger Entry" = rmid,
        tabledata "Resource Register" = rmid;

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = sorting();
            RequestFilterFields = "No.";

            trigger OnPreDataItem()

            begin
                window.open('##1##########');

            end;

            trigger OnAfterGetRecord()
            var


            begin
                "item Classification" := "item Classification"::" ";
                if ItemClassification = ItemClassification::AV then
                    "item Classification" := "item Classification"::AV;
                if ItemClassification = ItemClassification::EK then
                    "item Classification" := "item Classification"::EK;
                if ItemClassification = ItemClassification::KB then
                    "item Classification" := "item Classification"::KB;
                modify;
                window.update(1, "No.");



            end;
        }
    }
    var
        Window: Dialog;

}