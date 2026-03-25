report 50013 Temp_DeleteJobPlanningLine
{
    ProcessingOnly = true;
    Caption = 'Delete JobPlanningLine', comment = 'DEU="Projektplanzeile löschen"';
    ApplicationArea = All;
    UsageCategory = Tasks;
    UseRequestPage = true;
    Permissions = TableData "Res. Ledger Entry" = rmid,
        tabledata "Job Ledger Entry" = rmid,
        tabledata "Job Planning Line" = rmid,
        tabledata "Resource Register" = rmid;

    dataset
    {
        dataitem("Job Planning Line"; "Job Planning Line")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Job No.", "Job Task No.", "Line No.";

            trigger OnPreDataItem()

            begin
                if count > 1 then
                    Error('Sie dürfen nur einen Journaleintrag auswählen');
                WIndow.open('#########1##########');

            end;

            trigger OnAfterGetRecord()
            var
                JobPlanningLline: record "Job planning Line";
            begin
                if JobPlanningLline.get("Job Planning Line"."Job No.", "Job Planning Line"."Job Task No.", "Job Planning Line"."Line No.") then
                    JobPlanningLline.delete;
            end;
        }
    }
    var
        Window: Dialog;
}