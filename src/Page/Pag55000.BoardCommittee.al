#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55000 "Board Committee"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Board Committees";
    UsageCategory = Lists;

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
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Mandate; Rec.Mandate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salutation field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("M&embers")
            {
                Caption = 'M&embers';
                Image = Employee;
                action("Assigned Board Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Board Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Board Members";
                    RunPageLink = Committee = field(Code);
                    ToolTip = 'Executes the Assigned Board Members action.';
                }
                action("Assigned Non- Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Non- Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Non-Board Members";
                    RunPageLink = Committee = field(Code);
                    ToolTip = 'Executes the Assigned Non- Members action.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Board;
    end;
}

#pragma implicitwith restore

