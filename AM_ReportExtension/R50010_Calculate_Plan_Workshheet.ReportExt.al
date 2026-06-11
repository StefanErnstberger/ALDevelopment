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
                    Caption = 'Prod. Order No. Filter', comment = 'DEU="Fertigungsauftrag Nr."';
                    TableRelation = "Production Order"."No.";

                }

            }
        }

    }
    trigger OnPreReport()
    begin
        Production_Planning_Mgt.ClearPlanningitem();
        Production_Planning_Mgt.SetPlanningitem(ProdOrderNo_Filter);
    end;

    trigger OnPostReport()
    begin
        Production_Planning_Mgt.Clearplanningitem();
        UpdateReqLines();
    end;

    var
        Production_Planning_Mgt: Codeunit Production_Planning_Mgt;
        ProdOrderNo_Filter: Code[200];

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
