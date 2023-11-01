#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69260 "HR Medical Schemes Card"
{
    PageType = Card;
    SourceTable = "HR Medical Schemes";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme No field.';
                }
                field("Medical Insurer"; Rec."Medical Insurer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Insurer field.';
                }
                field("Scheme Name"; Rec."Scheme Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme Name field.';
                }
                field("In-patient limit"; Rec."In-patient limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In-patient limit field.';
                }
                field("Out-patient limit"; Rec."Out-patient limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out-patient limit field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
            }
            part(Control7; "HR Medical Scheme Members List")
            {
                SubPageLink = "Scheme No" = field("Scheme No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Members)
                {
                    ApplicationArea = Basic;
                    Image = DistributionGroup;
                    Promoted = true;
                    RunObject = Page "HR Medical Scheme Members List";
                    RunPageLink = "Scheme No" = field("Scheme No");
                    ToolTip = 'Executes the Members action.';
                }
                action("Suggest Members")
                {
                    ApplicationArea = Basic;
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Suggest Members action.';
                    trigger OnAction()
                    begin
                        HRInsuranceSchemeMembers.Reset;
                        HRInsuranceSchemeMembers.SetRange("Scheme No", Rec."Scheme No");
                        if HRInsuranceSchemeMembers.FindSet then
                            HRInsuranceSchemeMembers.DeleteAll;
                        Employee.Reset;
                        Employee.SetRange(Status, Employee.Status::Active);
                        if Employee.FindSet then begin
                            repeat
                                HRInsuranceSchemeMembers.Init;
                                HRInsuranceSchemeMembers."Scheme No" := Rec."Scheme No";
                                HRInsuranceSchemeMembers."Employee No" := Employee."No.";
                                HRInsuranceSchemeMembers."First Name" := Employee."First Name";
                                HRInsuranceSchemeMembers."Last Name" := Employee."Last Name";
                                Employee.CalcFields("Job Title");
                                HRInsuranceSchemeMembers.Designation := Employee."Job Title";
                                HRInsuranceSchemeMembers."Job Grade" := Employee."Salary Scale";
                                HRInsuranceSchemeMembers.Validate("Job Grade");
                                HRInsuranceSchemeMembers.Insert(true);
                            until Employee.Next = 0;
                        end;
                        Message('Suggested Successfully');
                    end;
                }
                action("Medical Benefits")
                {
                    ApplicationArea = Basic;
                    Image = ItemRegisters;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Medical Scheme Coverage";
                    RunPageLink = "Scheme No" = field("Scheme No");
                    ToolTip = 'Executes the Medical Benefits action.';
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
                        DMSManagement.FnUploadMedialSchemetDocs(Rec."Scheme No", 'Medical Scheme', Rec.RecordId);
                    end;
                }
            }
        }
    }

    var
        HRInsuranceSchemeMembers: Record "HR Insurance Scheme Members";
        Employee: Record Employee;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

