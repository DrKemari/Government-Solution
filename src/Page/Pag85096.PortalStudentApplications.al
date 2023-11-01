#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85096 "Portal Student Applications"
{
    ApplicationArea = Basic;
    Caption = 'Portal Student Applications';
    CardPageID = "Portal Student Application";
    Editable = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where(Type=filter(New|Existing),
                            "Document Type"=filter(Registration),
                            Posted=filter(false),
                            Portal=filter(true),
                            "Approval Status"=filter(Open),
                            Submitted=filter(true));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                }
                field("Registration Date"; Rec."Registration Date")
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
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Application Invoice"; Rec."Application Invoice")
                {
                    ApplicationArea = Basic;
                }
                field("Application Amount"; Rec."Application Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Application Receipt"; Rec."Application Receipt")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Application Invoice",'<>%1','')
    end;
}

#pragma implicitwith restore

