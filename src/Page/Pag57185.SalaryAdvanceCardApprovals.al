#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57185 "Salary Advance Card Approvals"
{
    PageType = Card;
    SourceTable = Payments;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = Basic;
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remarks By HOD/Principal';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments HR Dept';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount Approved by Accounts Dept';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = Basic;
                    Caption = 'Effective from Month';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57015,true,true,Rec)
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Salary Advance";
        Rec."Document Type" := Rec."document type"::"Salary Advance";
        Rec.Date := Today;
        Rec."Created By" := UserId;
        Rec."Account Type" := Rec."account type"::Employee;

        Usersetup.Reset;
        Usersetup.SetRange("User ID", Rec."Created By");
        if Usersetup.FindSet then
        begin

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        end;

        Employee.Reset;
        Employee.SetRange("No.", Rec."Account No.");
        if Employee.FindSet then
        begin
          Employee.CalcFields("Job Title");
            //Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
            Rec.Validate("Shortcut Dimension 2 Code");
            Rec.Validate("Shortcut Dimension 1 Code");

        end;
    end;

    var
        Usersetup: Record "User Setup";
        Employee: Record Employee;
}

#pragma implicitwith restore

