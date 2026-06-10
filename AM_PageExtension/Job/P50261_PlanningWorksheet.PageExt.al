pageextension 50261 PlanningWorksheet extends "Planning Worksheet"
{
    layout
    {
        modify(ItemClassification)
        {
            Visible = false;
        }
        addafter("Vendor Item No.")
        {
            field("Manufacturer Code"; rec."Manufacturer Code")
            {
                ApplicationArea = all;
            }
            field("Manufacturer Name"; rec."Manufacturer Name")
            {
                ApplicationArea = all;
            }
            field("item Classification"; rec."item Classification")
            {
                ApplicationArea = all;
            }
        }
    }
}