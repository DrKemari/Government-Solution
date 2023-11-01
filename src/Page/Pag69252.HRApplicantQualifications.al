#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69252 "HR Applicant Qualifications"
{
    Caption = 'Applicant Qualifications';
    PageType = List;
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Applicant Qualifications";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Description field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Award';
                    ToolTip = 'Specifies the value of the Award field.';
                }
                field("Date of Renewal"; Rec."Date of Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Renewal field.';
                }
                field("Membership Registration No"; Rec."Membership Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field(Specialization; Rec.Specialization)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

