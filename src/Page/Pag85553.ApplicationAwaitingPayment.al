page 85553 "Application Awaiting Payment"
{
    Caption = 'Application Awaiting Payment';
    ApplicationArea = Basic;
    CardPageID = "Portal Student Application";
    Editable = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where("Document Type" = filter(Registration),
                            Posted = filter(false),
                            Portal = filter(true),
                            "Approval Status" = filter(Open),
                            "Application Invoice" = filter(''),
                            Submitted = filter(true));

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


}
