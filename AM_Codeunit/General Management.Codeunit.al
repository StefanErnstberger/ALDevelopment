codeunit 55031 "General Management"
{
    Permissions = TableData "Item" = rmid,
        tabledata "Vendor" = rmid,
        tabledata "Customer" = rmid;

    trigger OnRun()
    begin
    end;

    procedure T27_OnAfterValidate_VendorNo(var Rec: record Item)
    //-----------------------------------------------------------
    //Havit Get Reference Name 
    //-----------------------------------------------------------
    var

    begin
        rec.CalcFields("Vendor Name");
    end;

}