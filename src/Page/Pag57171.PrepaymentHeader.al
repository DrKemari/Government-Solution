#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page Prepayment Header (ID 57171).
/// </summary>
Page 57171 "Prepayment Header"
{
    PageType = Card;
    SourceTable = "Prepayment Header";

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
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21; "Prepayment Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calculate Contribution")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CalcContribution(Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                end;
            }
            separator(Action4)
            {
            }
        }
    }

    var
        LineNo: Integer;

    local procedure CalcContribution(PrepaymentHeader: Record "Prepayment Header")
    var
        Employee: Record Employee;
        AssignmentMatrixX: Record "Assignment Matrix-X";
        PHeader: Record "Prepayment Header";
        EarningsX: Record EarningsX;
        EmployerAmnt: Decimal;
        EmployeeAmnt: Decimal;
        PrepaymentLines: Record "Prepayment Lines";
    begin

        Employee.Reset;
        Employee.SetRange(Status, Employee.Status::Active);
        if Employee.FindSet then begin
            repeat
                EarningsX.Reset;
                EarningsX.SetRange("Basic Salary Code", true);
                if EarningsX.FindSet then begin
                    AssignmentMatrixX.SetRange("Employee No", Employee."No.");
                    AssignmentMatrixX.SetRange(Code, EarningsX.Code);
                    if AssignmentMatrixX.FindLast then begin
                        EmployeeAmnt := (AssignmentMatrixX.Amount) * 0.1;
                        EmployerAmnt := (AssignmentMatrixX.Amount) * 0.2;
                        //get last int used
                        PrepaymentLines.Reset;
                        if PrepaymentLines.FindLast then begin
                            LineNo := PrepaymentLines."Line No";

                        end;
                        //insert on lines
                        PrepaymentLines.Init;
                        PrepaymentLines.No := PrepaymentHeader."No.";
                        PrepaymentLines."Line No" := LineNo + 1;
                        PrepaymentLines."Account Type" := PrepaymentLines."account type"::Employee;
                        PrepaymentLines."Account No." := Employee."No.";
                        PrepaymentLines.Validate("Account No.");
                        PrepaymentLines."Employee Contribution" := EmployeeAmnt;
                        PrepaymentLines."Employer Contribution" := EmployerAmnt;
                        PrepaymentLines.Validate("Employer Contribution");

                        PrepaymentLines.Insert;
                    end;
                end;
            //calculate amount based on last basic pay
            until Employee.Next = 0;
        end
    end;
}

#pragma implicitwith restore

