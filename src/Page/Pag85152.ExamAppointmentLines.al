#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85152 "Exam Appointment Lines"
{
    PageType = ListPart;
    SourceTable = "Staff Appointment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Team Leader"; Rec."Team Leader")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Leader field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Code field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                action("Required Qualifications")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Appointment Qualifications";
                    RunPageLink = "Staff Role Code" = field("Role Code"),
                                  "Staff Appointment ID" = field("Header No.");
                    ToolTip = 'Executes the Required Qualifications action.';
                }
                action("Required Experiences")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experiences';
                    Image = Excise;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Appointment Experience";
                    RunPageLink = "Staff Role Code" = field("Role Code"),
                                  "Staff Appointment ID" = field("Header No.");
                    ToolTip = 'Executes the Required Experiences action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

