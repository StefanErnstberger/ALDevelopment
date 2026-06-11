pageextension 50264 "BIT_AEM_ListOfEquipmentHdr" extends BIT_AEM_ListOfEquipment
{
    layout
    {
        addbefore(CommentPartLine)
        {
            part(LoE_SerialNo_FactBox; LoE_SerialNo_FactBox)
            {
                ApplicationArea = All;
                Caption = 'LoE Serial No. FactBox';
                Provider = ListOfEquipmentSub;
                SubPageLink = "Job No." = field("Job No."), "Job Task No." = field("Job Task No."), "Job Line No." = field("Line No.");
                Editable = true;
            }
        }

    }

    actions
    {

    }

}