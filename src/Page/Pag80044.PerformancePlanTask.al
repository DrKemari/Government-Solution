#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80044 "Performance Plan Task"
{
    PageType = Card;
    SourceTable = "Performance Plan Task";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Task Code"; Rec."Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Task Category"; Rec."Task Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Review Periods"; Rec."Review Periods")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle Start Date"; Rec."Performance Cycle Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle End Date"; Rec."Performance Cycle End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Start Date"; Rec."Processing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Due Date"; Rec."Processing Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Published?"; Rec."Published?")
                {
                    ApplicationArea = Basic;
                }
                field("Closed?"; Rec."Closed?")
                {
                    ApplicationArea = Basic;
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By"; Rec."Closed By")
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

