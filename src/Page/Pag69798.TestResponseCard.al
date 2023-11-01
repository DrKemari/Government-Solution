#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69798 "Test Response Card"
{
    Caption = 'Test Response Card';
    PageType = Card;
    SourceTable = "Ability Test Response";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test End Time"; Rec."Test End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Questions"; Rec."Total No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Total No. of Pass Questions"; Rec."Total No. of Pass Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Pass Score %"; Rec."Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                }
                field("Response Status"; Rec."Response Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control6; "Test Responses")
            {
                SubPageLink = "Response ID" = field("Response ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Perfomance Report")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Response ID", Rec."Response ID");
                    Report.Run(69621, true, false, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total No. of Pass Questions", "Total No. of Questions");
        if Rec."Total No. of Questions" > 0 then
            Rec."Ability Test Pass Score %" := (Rec."Total No. of Pass Questions" / Rec."Total No. of Questions") * 100;
    end;
}

#pragma implicitwith restore

