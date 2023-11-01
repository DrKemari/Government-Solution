#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69489 "Safety Permit Completion Lines"
{
    PageType = ListPart;
    SourceTable = "Safety Permit Completion Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Restricted Activity ID"; Rec."Restricted Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Requirement"; Rec."Compliance Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level for Violation"; Rec."Severity Level for Violation")
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Compliance Notes"; Rec."Additional Compliance Notes")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

