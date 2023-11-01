#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70053 "Contract Manangement Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Management Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("Service Provided"; Rec."Service Provided")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Provided field.';
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

