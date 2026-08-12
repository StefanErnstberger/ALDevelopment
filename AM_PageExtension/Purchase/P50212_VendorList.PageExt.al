pageextension 50212 "Vendor List" extends "Vendor List"
{
    layout
    {

        addafter("Name 2")
        {
            field(Address; rec.Address)
            {
                ApplicationArea = all;
                Visible = true;
            }
            field("Address 2"; rec."Address 2")
            {
                ApplicationArea = all;
                visible = false;
            }
        }
        addafter("Post Code")
        {
            field(City; rec.City)
            {
                ApplicationArea = all;
                visible = true;

            }
        }
        moveafter("address 2"; "Post Code")

        moveafter(Name; "Name 2")

        movebefore("Post Code"; "Country/Region Code")


        modify("Post Code")
        {
            visible = true;
        }
        modify("Country/Region Code")
        {
            visible = true;
        }
        modify("name 2")
        {
            visible = true;
        }

    }
}