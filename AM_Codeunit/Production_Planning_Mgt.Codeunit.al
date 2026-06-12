codeunit 50022 Production_Planning_Mgt
{
    Description = 'Production Management';
    SingleInstance = true;

    var

        TempItem: record Item temporary;

    procedure ClearPlanningItem()
    begin
        Tempitem.Reset();
        Tempitem.DeleteAll();
    end;




    procedure SetPlanningItem(ProdOrderNo_Filter: Code[200])
    var
        ProductionOrder: Record "Production Order";
        ProdOrderComp: record "Prod. Order Component";
        Item: Record Item;
    begin
        if ProdOrderNo_Filter <> '' then begin
            ProductionOrder.SetCurrentKey("No.");
            ProductionOrder.SetFilter("No.", ProdOrderNo_Filter);
            If ProductionOrder.Findset() then
                repeat
                    if ProductionOrder.Status <> ProductionOrder.status::Finished then begin
                        ProdOrderComp.setrange(Status, productionorder.Status);
                        prodordercomp.setrange("Prod. Order No.", ProductionOrder."No.");
                        if ProdOrderComp.FindSet() then
                            repeat
                                if not tempitem.get(ProdOrderComp."Item No.") then
                                    if item.get(ProdOrderComp."Item No.") then begin
                                        TempItem := item;
                                        if tempitem.insert() then;
                                    end;

                            until ProdOrderComp.next() = 0;
                    end;
                until ProductionOrder.next() = 0;


        end;
    end;

    procedure GetPlanningItem(ItemNo: code[20]; var PlanThisItem: Boolean)
    begin
        planthisitem := false;
        if tempitem.isempty() then
            PlanThisItem := true
        else
            if tempitem.get(ItemNo) then
                planthisitem := true;
    end;
    //Zusammenfassung von Planungskomponenten aus dem Bestellvorschlag "Planning Component" bei gleichen Artikeln
    procedure CarryOutActionReqLine(_SetSummary: Boolean)
    begin
        SetSummary := _SetSummary;

    end;

    [EventSubscriber(ObjectType::report, report::"Calculate Plan - Plan. Wksh.", OnItemOnAfterGetRecordOnBeforeCheckSetAtStartPosition, '', true, true)]
    local procedure OnAfterGetItem(var Item: Record Item; var CounterOK: Integer; var IsHandled: Boolean)
    var
        PlanThisItem: Boolean;
    begin
        PlanThisItem := false;
        GetPlanningItem(item."no.", PlanThisItem);
        IsHandled := not PlanThisItem;
        if IsHandled then
            CounterOK += 1;
    end;

    [EventSubscriber(ObjectType::report, report::"Carry Out Action Msg. - Plan.", OnAfterRequisitionLineOnAfterGetRecord, '', true, true)]
    local procedure OnAfterGetReqLine(var RequisitionLine: Record "Requisition Line"; ProdOrderChoice: Option)
    var

    begin

    end;

    [EventSubscriber(ObjectType::report, report::"Carry Out Action Msg. - Plan.", OnAfterSetReqLineFilters, '', true, true)]
    local procedure OnAfterSetReqLineFilters(var RequisitionLine: Record "Requisition Line")
    var

        ReqLine: record "Requisition Line";
        PlanningComponent: record "Planning Component";
        TempplanningComponent: record "Planning Component" temporary;
        WorksheetTemplateName: code[10];
        JournalBatchName: code[10];
    begin
        if Setsummary then begin
            WorksheetTemplateName := requisitionLine.getfilter("Worksheet Template Name");
            JournalBatchName := RequisitionLine.getfilter("Journal Batch Name");
            ReqLine.setrange("Worksheet Template Name", WorksheetTemplateName);
            ReqLine.setrange("Journal Batch Name", JournalBatchName);
            ReqLine.setrange("Accept Action Message", true);
            if ReqLine.FindSet() then
                repeat

                    PlanningComponent.setrange("Worksheet Template Name", ReqLine."Worksheet Template Name");
                    PlanningComponent.setrange("Worksheet Batch Name", ReqLine."Journal Batch Name");
                    PlanningComponent.setrange("Worksheet Line No.", ReqLine."Line No.");
                    if PlanningComponent.findset() then
                        repeat
                            TempplanningComponent.setrange("Item No.", PlanningComponent."Item No.");
                            if TempplanningComponent.FindFirst() then begin
                                TempplanningComponent.Quantity += PlanningComponent.Quantity;
                                TempplanningComponent."Quantity (Base)" += PlanningComponent."Quantity (Base)";
                                TempplanningComponent."Net Quantity (Base)" += PlanningComponent."Net Quantity (Base)";
                                TempplanningComponent."Expected Quantity" += PlanningComponent."Expected Quantity";
                                TempplanningComponent."Expected Quantity (Base)" += PlanningComponent."Expected Quantity (Base)";
                                TempplanningComponent."Original Expected Qty. (Base)" += PlanningComponent."Original Expected Qty. (Base)";
                                TempplanningComponent.modify();
                            end else begin
                                TempplanningComponent := PlanningComponent;
                                TempplanningComponent.insert();
                            end;
                        until PlanningComponent.Next() = 0;
                    PlanningComponent.reset;
                    PlanningComponent.setrange("Worksheet Template Name", ReqLine."Worksheet Template Name");
                    PlanningComponent.setrange("Worksheet Batch Name", ReqLine."Journal Batch Name");
                    PlanningComponent.setrange("Worksheet Line No.", ReqLine."Line No.");
                    if not PlanningComponent.IsEmpty() then
                        PlanningComponent.DeleteAll((true));
                    TempplanningComponent.reset;
                    if TempplanningComponent.findset() then
                        repeat
                            PlanningComponent := TempplanningComponent;
                            PlanningComponent.insert();
                        until TempplanningComponent.Next() = 0;
                until RequisitionLine.Next() = 0;
        end;
    end;
    //Zusammenfassung von gleichen Artikeln im Fertigungsauftrag bei Fertigungsauftrag aktualisieren
    procedure RefreshProductionOrder(_SetSummary: Boolean)
    begin
        SetSummaryRefreshProdOrder := _SetSummary;

    end;

    [EventSubscriber(ObjectType::report, report::"Refresh Production Order", OnProductionOrderOnAfterGetRecordOnAfterCalcRoutingsOrComponents, '', true, true)]
    local procedure OnAfterCalcProdOrder(var ProductionOrder: Record "Production Order"; CalcComponents: Boolean; CalcLines: Boolean; CalcRoutings: Boolean; var ErrorOccured: Boolean)
    var

        ProdOrderLine: record "Prod. Order Line";
        ProdOrderComp: record "Prod. Order Component";
        TempProdOrderComp: record "Prod. Order Component" temporary;

    begin
        if SetSummaryRefreshProdOrder then begin
            ProdOrderline.SetRange(Status, ProductionOrder.Status);
            ProdOrderline.SetRange("Prod. Order No.", ProductionOrder."No.");
            if prodorderline.FindSet() then
                repeat
                    TempProdOrderComp.reset();
                    TempProdOrderComp.DeleteAll();
                    ProdOrderComp.SetRange(Status, ProductionOrder.Status);
                    ProdOrderComp.SetRange("Prod. Order No.", ProductionOrder."No.");
                    ProdOrderComp.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
                    if ProdOrderComp.FindSet() then
                        repeat
                            TempProdOrderComp.setrange("Item No.", ProdOrderComp."Item No.");
                            if TempProdOrderComp.FindFirst() then begin
                                TempProdOrderComp."Quantity per" += ProdOrderComp.Quantity;
                                TempProdOrderComp.modify();
                            end else begin
                                TempProdOrderComp := ProdOrderComp;
                                TempProdOrderComp.insert();
                            end;
                        until ProdOrderComp.Next() = 0;
                    ProdOrderComp.reset;
                    ProdOrderComp.SetRange(Status, ProductionOrder.Status);
                    ProdOrderComp.SetRange("Prod. Order No.", ProductionOrder."No.");
                    ProdOrderComp.SetRange("Prod. Order Line No.", ProdOrderLine."Line No.");
                    if ProdOrderComp.FindSet() then
                        repeat
                            if not TempProdOrderComp.get(ProdOrderComp.Status, ProdOrderComp."Prod. Order No.", ProdOrderComp."Prod. Order Line No.", ProdOrderComp."Line No.") then
                                ProdOrderComp.delete(true)
                            else begin
                                ProdOrderComp.validate("Quantity per", TempProdOrderComp."Quantity per");
                                ProdOrderComp.modify(true);
                            end;
                        until ProdOrderComp.Next() = 0;
                until ProdOrderLine.Next() = 0;
        end;
    end;
    //--------

    var
        Setsummary: Boolean;
        SetSummaryRefreshProdOrder: Boolean;

}