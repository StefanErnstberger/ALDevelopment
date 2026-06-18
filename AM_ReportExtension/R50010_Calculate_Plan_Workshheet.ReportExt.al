reportextension 50010 CalculatePlanPlanWksh extends "Calculate Plan - Plan. Wksh."
{
    dataset
    {

    }

    requestpage
    {
        layout
        {

            addlast(Options)
            {

                field(ProdOrderNo_Filter; ProdOrderNo_Filter)
                {
                    ApplicationArea = All;
                    editable = true;
                    Caption = 'Prod. Order No. Filter', comment = 'DEU="Fertigungsauftrag Nr."';
                    TableRelation = "Production Order"."No." where(Status = filter(Planned | "Firm Planned" | Released));
                    Lookup = true;
                    trigger OnAssistEdit()
                    begin
                        If Confirm(ClearLabel, true) then
                            ProdOrderNoSave_Filter := '';
                    end;

                    trigger OnValidate()
                    begin
                        if ProdOrderNoSave_Filter <> '' then begin
                            if copystr(ProdOrderNoSave_Filter, strlen(ProdOrderNoSave_Filter), 1) <> '|' then
                                if ProdOrderNo_Filter <> '' then
                                    ProdOrderNoSave_Filter += '|';
                        end;
                        ProdOrderNoSave_Filter += ProdOrderNo_Filter;
                        ProdOrderNo_Filter := '';

                    end;

                    trigger OnAfterLookup(Selected: RecordRef)
                    begin
                        if ProdOrderNoSave_Filter <> '' then begin
                            if copystr(ProdOrderNoSave_Filter, strlen(ProdOrderNoSave_Filter), 1) <> '|' then
                                if ProdOrderNo_Filter <> '' then
                                    ProdOrderNoSave_Filter += '|';
                        end;
                        ProdOrderNoSave_Filter += ProdOrderNo_Filter;
                        ProdOrderNo_Filter := '';
                    end;
                }

                field(ProdOrderNosave_Filter; ProdOrderNosave_Filter)
                {

                    ApplicationArea = All;
                    editable = false;
                    Caption = 'Prod. Order No. Result Filter', comment = 'DEU="Fertigungsauftrag Suchfilter"';

                }
            }
        }
    }
    trigger OnPreReport()
    begin
        Production_Planning_Mgt.ClearPlanningitem();

        Production_Planning_Mgt.SetPlanningitem(ProdOrderNosave_Filter);
    end;

    trigger OnPostReport()
    begin
        Production_Planning_Mgt.Clearplanningitem();
        UpdateReqLines();
    end;

    var
        Production_Planning_Mgt: Codeunit Production_Planning_Mgt;
        ProdOrderNo_Filter: Code[200];
        ProdOrderNoSave_Filter: Code[200];
        ClearLabel: Label 'Do you want to clear the filter?';


    local procedure UpdateReqLines()
    var
        RequisitionLine: Record "Requisition Line";
    begin
        RequisitionLine.Reset();
        if RequisitionLine.FindSet() then
            repeat
                RequisitionLine.CalcOrigOrderTracking();
            until RequisitionLine.Next() = 0;
    end;
}
