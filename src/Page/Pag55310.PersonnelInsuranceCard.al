#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55310 "Personnel Insurance Card"
{
    PageType = Document;
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type"; Rec."Insurance Type")
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
                field("Insurance No"; Rec."Insurance No")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                }
                field("Premium Per Employee"; Rec."Premium Per Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Insurance Lines")
            {
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
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
                Visible = false;

                trigger OnAction()
                begin
                    DMSManagement.FnUploadInsuranceClaimtDocs(Rec."Document No", 'Insurance Claim', Rec.RecordId);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Insurance;
    end;

    var
        InsuranceLines: Record "Insurance Lines";
        InsuranceLines2: Record "Insurance Lines";
        Employee: Record Employee;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

