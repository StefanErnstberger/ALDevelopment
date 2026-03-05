pageextension 50230 "Planning Worksheet" extends "Planning Worksheet"
{
    layout
    {
        modify(Control9)
        {
            Visible = true;
        }
        modify(Control13)
        {
            Visible = true;
        }
        addafter(control9)
        {
            part(IteminvoicingFactBox; "Item invoicing FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }

        }

    }
}