pageextension 50231 "Requisition Worksheet" extends "Req. Worksheet"
{
    layout
    {
        addafter(Control1903326807)
        {
            part(ItemPlanningFactBox; "Item Planning FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(IteminvoicingFactBox; "Item invoicing FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(ItemWarehouseFactBox; "Item Warehouse FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }


        }

    }
}