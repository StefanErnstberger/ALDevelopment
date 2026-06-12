reportextension 50011 Carry_Out_Action_Msg_Plan extends "Carry Out Action Msg. - Plan."
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
        productionplanningMgt.CarryOutActionReqLine(SummaryComponents);
    end;

    trigger OnPostReport()
    var

    begin

    end;

    var
        SummaryComponents: Boolean;

}
