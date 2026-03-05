codeunit 55030 "General Event Management"
{
    Permissions = TableData "Item" = rmid,
        tabledata "Vendor" = rmid,
        tabledata "Customer" = rmid;

    trigger OnRun()

    begin
    end;
    //-----------------------------------------------------------
    //Intrastat Event T27 On After Validate Vendor No.
    //-----------------------------------------------------------
    [EventSubscriber(ObjectType::Table, Database::Item, OnAfterValidateEvent, "Vendor No.", true, true)]
    local procedure T27_OnAfterValidateVendorNot(var Rec: Record item)
    var
        GeneralManagement: Codeunit "General Management";
    begin
        GeneralManagement.T27_OnAfterValidate_VendorNo(Rec);
    end;
}