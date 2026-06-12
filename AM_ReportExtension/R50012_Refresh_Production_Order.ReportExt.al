reportextension 50012 Refresh_Production_Order extends "Refresh Production Order"
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
                field(SummaryComponents; SummaryComponents)
                {
                    ApplicationArea = All;
                    Caption = 'Summary Components', comment = 'DEU="Zusammenfassung FA Komponenten"';
                }
            }
        }
    }
    trigger OnPreReport()
    var
        productionplanningMgt: codeunit Production_Planning_Mgt;
    begin
        productionplanningMgt.RefreshProductionOrder(SummaryComponents);
    end;

    trigger OnPostReport()
    var

    begin

    end;

    var
        SummaryComponents: Boolean;

}
