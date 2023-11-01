#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69263 "HR Medical Scheme Members List"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "HR Insurance Scheme Members";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Scheme Join Date"; Rec."Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme Join Date field.';
                }
                field("Out-Patient Limit"; Rec."Out-Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out-Patient Limit field.';
                }
                field("In-patient Limit"; Rec."In-patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In-patient Limit field.';
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Cover field.';
                }
                field("Bed Limit"; Rec."Bed Limit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bed Limit Net of NHIF Rebate per day';
                    ToolTip = 'Specifies the value of the Bed Limit Net of NHIF Rebate per day field.';
                }
                field("Cumm.Amount Spent"; Rec."Cumm.Amount Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cumm.Amount Spent field.';
                }
                field("No Of Dependants"; Rec."No Of Dependants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No Of Dependants field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup1)
            {
                Caption = 'Line';
                action(Dependants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dependants';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "HR Employee Next of Kin";
                    RunPageLink = "Employee Code" = field("Employee No");
                    ToolTip = 'Executes the Dependants action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

