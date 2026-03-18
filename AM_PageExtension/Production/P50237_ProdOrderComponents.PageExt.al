pageextension 50237 "Prod. Order Components" extends "Prod. Order Components"
{
    layout
    {
        addafter(Control1905767507)
        {
            part(ItemPlanningFactBox; "Item Planning FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Item No.");
                Visible = true;
            }
            part(ItemReplenishmentFactBox; "Item Replenishment FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Item No.");
                Visible = true;
            }
            part(IteminvoicingFactBox; "Item invoicing FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("item No.");
                Visible = true;
            }
            part(ItemWarehouseFactBox; "Item Warehouse FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("item No.");
                Visible = true;
            }
        }
    }
}