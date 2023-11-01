#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69520 "CRM Training Suppliers"
{
    PageType = ListPart;
    SourceTable = "CRM Training Suppliers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Supplier Vendor No"; Rec."Supplier Vendor No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trainer/Supplier No';
                    ToolTip = 'Specifies the value of the Trainer/Supplier No field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field(Narration; Rec.Narration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Narration field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

