pageextension 50250 "Production BOM" extends "Production BOM"
{
    layout
    {
        addafter(Control1905767507)
        {
            part(ItemPlanningFactBox; "Item Planning FactBox")
            {
                ApplicationArea = All;
                Provider = ProdBOMLine;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(ItemReplenishmentFactBox; "Item Replenishment FactBox")
            {
                ApplicationArea = All;
                Provider = ProdBOMLine;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(IteminvoicingFactBox; "Item invoicing FactBox")
            {
                ApplicationArea = All;
                Provider = ProdBOMLine;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(ItemWarehouseFactBox; "Item Warehouse FactBox")
            {
                ApplicationArea = All;
                Provider = ProdBOMLine;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
        }
    }
}