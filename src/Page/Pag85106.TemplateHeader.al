#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85106 "Template Header"
{
    PageType = Card;
    SourceTable = "Staffing Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Exam Sittings"; Rec."No. of Exam Sittings")
                {
                    ApplicationArea = Basic;
                }
                field("Total Resources"; Rec."Total Resources")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control14; "Template Lines1")
            {
                SubPageLink = "Staff Template ID" = field("Template ID"),
                              Examination = field(Examination);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Open Staff Appointments")
            {
                ApplicationArea = Basic;
                Image = OpenWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Resource Appointment Vouchers";
                RunPageLink = "Project Staff Template ID" = field("Template ID");
            }
            action("Ongoing Appointments")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Approved Appointment Vouchers";
                RunPageLink = "Project Staff Template ID" = field("Template ID");
            }
            action("Closed Appointments")
            {
                ApplicationArea = Basic;
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Posted Appointment Vouchers";
                RunPageLink = "Project Staff Template ID" = field("Template ID");
            }
        }
    }
}

#pragma implicitwith restore

