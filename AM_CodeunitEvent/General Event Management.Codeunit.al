codeunit 50024 "General Event Management"
{

    EventSubscriberInstance = StaticAutomatic;
    Permissions = TableData "Item" = rmid,
        tabledata "Vendor" = rmid,
        tabledata "Job Planning Line" = rmid,
        tabledata "Customer" = rmid;

    trigger OnRun()

    begin
    end;
    //-----------------------------------------------------------
    //Intrastat Event T27 On After Validate Vendor No.
    //-----------------------------------------------------------
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterValidateEvent, "Vendor No.", true, true)]
    local procedure T27_OnAfterValidateVendorNo(var Rec: Record item)
    var
        GeneralManagement: Codeunit "General Management";
    begin
        GeneralManagement.T27_OnAfterValidate_VendorNo(Rec);
    end;

    //-----------------------------------------------------------
    //Anforderung 17.06.2026 Herr Grunz
    //eine JobPlanningLine darf nicht gelöscht werden, wenn in zu der Planungszeile mindestens eine Seriennr. existiert (Table LotNoSeries
    //-----------------------------------------------------------
    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure JobPlanningLine_No(var Rec: Record "Job Planning Line"; var xRec: Record "Job Planning Line"; CurrFieldNo: Integer)
    var
        GeneralManagement: Codeunit "General Management";
    begin
        if rec.Type = rec.type::Item then
            if CurrFieldNo = rec.FieldNo("No.") then
                GeneralManagement.JobPlanLine_ModifyNo_Or_Delete_allowed(Rec);
    end;

    //-----------------------------------------------------------
    //Anforderung 17.06.2026 Herr Grunz
    //eine JobPlanningLine darf die Artikelnr. nicht geändert werden, wenn in zu der Planungszeile mindestens eine Seriennr. existiert (Table LotNoSeries
    //-----------------------------------------------------------
    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", OnBeforeDeleteEvent, '', true, true)]
    local procedure JobPlanningLine_Delete(var Rec: Record "Job Planning Line"; RunTrigger: Boolean)
    var
        GeneralManagement: Codeunit "General Management";
    begin
        if RunTrigger then
            GeneralManagement.JobPlanLine_ModifyNo_Or_Delete_allowed(Rec);
    end;

    //-----------------------------------------------------------
    //Anforderung 17.06.2026 Herr Oertel
    //wenn in JobPlanningLine.Infofield1 ein Wert eingetragen ist, soll dise Zeile nicht im Planungsvorschlag erscheinen
    //-----------------------------------------------------------

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Profile Offsetting", OnTransJobPlanningLineToProfileOnBeforeProcessLine, '', true, true)]
    local procedure TransferJobPlanningLine(JobPlanningLine: Record "Job Planning Line"; var ShouldProcess: Boolean)
    var
        GeneralManagement: Codeunit "General Management";
    begin
        if JobPlanningLine.InfoField1 <> '' then  //Materialzugang
            ShouldProcess := false;

    end;
}
