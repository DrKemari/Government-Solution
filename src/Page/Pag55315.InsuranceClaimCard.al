#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55315 "Insurance Claim Card"
{
    PageType = Card;
    SourceTable = "Insurance Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Insurance No"; Rec."Insurance No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance No field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Premium field.';
                }
                field("Claim Amount"; Rec."Claim Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Claim Amount';
                    ToolTip = 'Specifies the value of the Estimated Claim Amount field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted On" := CurrentDatetime;
                    Message('Submitted Successfully');
                end;
            }
            action("Suggest Employees")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Suggest Employees action.';
                trigger OnAction()
                begin

                    Employee.Reset;
                    Employee.SetRange(Status, Employee.Status::Active);
                    if Employee.FindSet then begin
                        repeat
                            InsuranceLines.Init;
                            InsuranceLines2.Reset;
                            if InsuranceLines2.FindLast then
                                InsuranceLines.Entry := InsuranceLines2.Entry + 1;
                            InsuranceLines."Document No" := Rec."Document No";
                            InsuranceLines."Employee No" := Employee."No.";
                            InsuranceLines."Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
                            InsuranceLines.Premium := Rec."Premium Per Employee";
                            InsuranceLines.Insert(true);

                        until Employee.Next = 0;
                    end;
                    Message('Suggested Successfully');
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    DMSManagement.FnUploadInsuranceClaimtDocs(Rec."Document No", 'Insurance Claim', Rec.RecordId);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Insurance Claim";
    end;

    var
        InsuranceLines: Record "Insurance Lines";
        InsuranceLines2: Record "Insurance Lines";
        Employee: Record Employee;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

