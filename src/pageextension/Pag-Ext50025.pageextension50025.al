#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50025 "pageextension50025" extends "Resource Card"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""No."(Control 2)".

        modify("Social Security No.")
        {
            Caption = 'PIN No.';
        }
        addafter("Resource Group No.")
        {
            field("Job Group"; Rec."Job Group")
            {
                ApplicationArea = Basic;
            }
            field(Interns; Rec.Interns)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Social Security No.")
        {
            field("Bank Code"; Rec."Bank Code")
            {
                ApplicationArea = Basic;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Bank Branch No."; Rec."Bank Branch No.")
            {
                ApplicationArea = Basic;
            }
            field("Branch Name"; Rec."Branch Name")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Bank Account No."; Rec."Bank Account No.")
            {
                ApplicationArea = Basic;
            }
            field("M-Pesa Number"; Rec."M-Pesa Number")
            {
                ApplicationArea = Basic;
            }
            field("ID/Passport No"; Rec."ID/Passport No")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(City)
        {
            field("Service No"; Rec."Service No")
            {
                ApplicationArea = Basic;
            }
            field("E-mail Address"; Rec."E-mail Address")
            {
                ApplicationArea = Basic;
            }
            field(Email; Rec.Email)
            {
                ApplicationArea = Basic;
                Caption = 'Confirm Email';
            }
        }
        addafter("Personal Data")
        {
            group(Examination)
            {
                Caption = 'Examination';
                field("Exam Booking Category"; Rec."Exam Booking Category")
                {
                    ApplicationArea = Basic;
                }
                field("Exam Resorce Type"; Rec."Exam Resorce Type")
                {
                    ApplicationArea = Basic;
                }
                field("Examiner Code"; Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                }
                field("Exam Task Type"; Rec."Exam Task Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        moveafter("Address 2"; "Social Security No.")
    }
    actions
    {
        addafter(Statistics)
        {
            action(Papers)
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Marker Task Allocation";
                RunPageLink = "Resource No" = field("No.");
            }
            action("Resource Role Allocation")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Resource Role Allocation";
                RunPageLink = "Resource No" = field("No.");
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //begin
    /*
    "Resource Type":="Resource Type"::" ";
    */
    //end;
}

#pragma implicitwith restore

