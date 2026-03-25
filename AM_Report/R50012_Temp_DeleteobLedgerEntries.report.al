report 50012 Temp_DeleteobLedgerEntries
{
    ProcessingOnly = true;
    Caption = 'Delete Entries Job and Ressource', comment = 'DEU="Projekt und Ressource Posten löschen"';
    ApplicationArea = All;
    UsageCategory = Tasks;
    UseRequestPage = true;
    Permissions = TableData "Res. Ledger Entry" = rmid,
        tabledata "Job Ledger Entry" = rmid,
        tabledata "Resource Register" = rmid;

    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            DataItemTableView = sorting();
            RequestFilterFields = "Entry No.", "Job No.", "Unit Cost";

            trigger OnPreDataItem()

            begin
                if count > 1 then
                    Error('Sie dürfen nur einen Eintrag auswählen');
                WIndow.open('#########1##########');

            end;

            trigger OnAfterGetRecord()
            var
                JobLedgerEntry: record "Job Ledger Entry";
            begin
                if JobLedgerEntry.get("Job Ledger Entry"."Entry No.") then
                    JobLedgerEntry.delete;

            end;
        }
    }
    var
        Window: Dialog;

}