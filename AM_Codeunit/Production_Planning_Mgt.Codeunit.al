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

    [EventSubscriber(ObjectType::report, report::"Calculate Plan - Plan. Wksh.", OnItemOnAfterGetRecordOnBeforeCheckSetAtStartPosition, '', true, true)]
    local procedure OnAfterGetItem(var Item: Record Item; var CounterOK: Integer; var IsHandled: Boolean)
    var
        PlanThisItem: Boolean;
    begin
        PlanThisItem := false;
        GetPlanningItem(item."no.", PlanThisItem);
        IsHandled := PlanThisItem;
    end;
}