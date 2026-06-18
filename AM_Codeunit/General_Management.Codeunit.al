codeunit 50021 "General Management"
{
    Permissions = TableData "Item" = rmid,
        tabledata "Vendor" = rmid,
        tabledata "Customer" = rmid;

    trigger OnRun()
    begin
    end;

    procedure T27_OnAfterValidate_VendorNo(var Rec: record Item)
    //-----------------------------------------------------------
    //Get Reference Name 
    //-----------------------------------------------------------
    var

    begin
        rec.CalcFields("Vendor Name");
    end;


    procedure JobPlanLine_ModifyNo_Or_Delete_allowed(var Rec: record "Job Planning Line")
    var
        ErrorLbl: label 'Serial No. exist. You cannot modify the Item No. or Delete the record. You must first delete the Serial No.-Entries';
    begin
        rec.calcfields("Count Serial No.");
        if rec."Count Serial No." <> 0 then
            error(errorlbl);

    end;

}