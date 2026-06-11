pageextension 50260 "BIT_AEM_ListOfEquipmentSub" extends "BIT_AEM_ListOfEquipmentSub"
{
    layout
    {
        modify(ItemClassification)
        {
            Visible = false;
        }
        addafter(ItemManufacturerCode)
        {
            field("Manufacturer Name"; rec."Manufacturer Name")
            {
                ApplicationArea = all;
            }
            field("item Classification"; rec."item Classification")
            {
                ApplicationArea = all;
            }
            field("Count Serial No."; rec."Count Serial No.")
            {
                ApplicationArea = all;
            }
        }
        modify(InfoField1)
        {
            Caption = 'Material Access / Materialzugang';

        }
        modify(InfoField4)
        {
            Caption = 'Installationn Place / Verortung';
        }
        modify(InfoField5)
        {
            Caption = 'Description / Beschreibung';
        }
        modify(InfoField9)
        {
            Caption = 'Colour / Farbe';
        }
        modify(InfoField10)
        {
            Caption = 'Alt-Unit No. / Alt-Unit Nr.';
        }


    }

    actions
    {
        addbefore(CreateJobJournalLines)
        {
            action(SerialNo)
            {
                Caption = 'SerialNo';
                Image = SerialNo;
                ApplicationArea = All;
                //Promoted = true;
                //PromotedIsBig = true;
                //PromotedCategory = Process;


                RunObject = Page LoE_SerialNo;
                RunPageLink = "Job No." = field("Job No."),
                            "Job Task No." = field("Job Task No."),
                            "Job Line No." = field("Line No.");
            }
        }
    }

}