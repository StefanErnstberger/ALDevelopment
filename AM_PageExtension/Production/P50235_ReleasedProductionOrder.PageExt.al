pageextension 50235 "Released Production Order" extends "Released Production Order"
{
    layout
    {
        addafter(Control1905767507)
        {
            part(ItemPlanningFactBox; "Item Planning FactBox")
            {
                ApplicationArea = All;
                Provider = ProdOrderLines;
                SubPageLink = "No." = field("Item No.");
                Visible = true;
            }
            part(ItemReplenishmentFactBox; "Item Replenishment FactBox")
            {
                ApplicationArea = All;
                Provider = ProdOrderLines;
                SubPageLink = "No." = field("Item No.");
                Visible = true;
            }
            part(IteminvoicingFactBox; "Item invoicing FactBox")
            {
                ApplicationArea = All;
                Provider = ProdOrderLines;
                SubPageLink = "No." = field("item No.");
                Visible = true;
            }
            part(ItemWarehouseFactBox; "Item Warehouse FactBox")
            {
                ApplicationArea = All;
                Provider = ProdOrderLines;
                SubPageLink = "No." = field("item No.");
                Visible = true;
            }
        }
    }
}