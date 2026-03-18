report 50011 Temp_DeleteEntriesResAndJob
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
        dataitem("Resource Register"; "Resource Register")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            trigger OnPreDataItem()

            begin
                if count > 1 then
                    Error('Sie dürfen nur einen Journaleintrag auswählen');
                WIndow.open('#########1##########');

            end;

            trigger OnAfterGetRecord()
            var
                ResourceRegister: record "Resource Register";
                ResLedgerEntry: Record "Res. Ledger Entry";
                JobLedgerEntry: record "Job Ledger Entry";
            begin
                if ("Resource Register"."No." = 37) or ("Resource Register"."No." = 38) then begin
                    ResourceRegister.get("Resource Register"."No.");
                    ResLedgerEntry.setrange("Entry No.", ResourceRegister."From Entry No.", ResourceRegister."To Entry No.");
                    if ResLedgerEntry.FindSet() then
                        repeat
                            JobLedgerEntry.setrange("Document No.", ResLedgerEntry."Document No.");
                            JobLedgerEntry.setrange("Document Date", ResLedgerEntry."Document Date");
                            if not JobLedgerEntry.IsEmpty() then
                                JobLedgerEntry.deleteall();
                            ResLedgerEntry.delete();
                            WIndow.Update(1, format(ResLedgerEntry."Entry No.") + '/' + (format(ResLedgerEntry."Posting Date")));
                        //if not confirm('Weiter', true) then
                        //  error('Unterbrochen);')
                        until ResLedgerEntry.next() = 0;
                    ResourceRegister.delete;
                end else
                    Error('Nur 37 oder 38 darf gelöscht werden');
            end;
        }
    }
    var
        Window: Dialog;
}