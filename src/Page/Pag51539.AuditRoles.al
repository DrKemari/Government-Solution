#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51539 "Audit Roles"
{
    PageType = List;
    SourceTable = "Audit Roles";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directly Reports To field.';
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indirectly Reports To field.';
                }
                field("No. of  Responsibilities"; Rec."No. of  Responsibilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of  Responsibilities field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Responsibilities)
            {
                ApplicationArea = Basic;
                Image = ReturnCustomerBill;
                Promoted = true;
                RunObject = Page "Role Responsibilities";
                RunPageLink = Code = field(Code);
                ToolTip = 'Executes the Responsibilities action.';
            }
        }
    }
}

#pragma implicitwith restore

