#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51209 "Unprocessed Insitution"
{
    PageType = Card;
    SourceTable = "Ins. Accreditation Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Type"; Rec."Accreditation Type")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee No."; Rec."Assigned Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Employee Name."; Rec."Assigned Employee Name.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Communication Details")
            {
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payment & Verification")
            {
                group("University Transactions")
                {
                    field("Payment Reference No."; Rec."Payment Reference No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Received Amount"; Rec."Received Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Invoiced Amount"; Rec."Invoiced Amount")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        RowSpan = 2;
                    }
                }
                group("Required Documents")
                {
                    field("Proposal Document"; Rec."Proposal Document")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
    }

    actions
    {
    }

    var
        Text001: label 'Amount should not be %1';
        Text002: label 'Campus Accreditation Amount';
        Text003: label 'Proceed to create Customer?';
        Text004: label 'Customer created succesfully';
        Text005: label 'Create An Accreditation Document?';
}

#pragma implicitwith restore

