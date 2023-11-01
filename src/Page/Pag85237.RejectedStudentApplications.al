#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85237 "Rejected Student Applications"
{
    ApplicationArea = Basic;
    Caption = 'Rejected Student Applications';
    CardPageID = "Portal Student Application";
    Editable = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where(Type=filter(New|Existing),
                            "Document Type"=filter(Registration),
                            Posted=filter(false),
                            Portal=filter(true),
                            "Approval Status"=filter(Rejected));
    UsageCategory = History;

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
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("NCPWD No."; Rec."NCPWD No.")
                {
                    ApplicationArea = Basic;
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Re-Open Application")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to open the rejected application?';
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Rejected);
                    if Confirm(TXT001)=true then begin
                      Rec."Approval Status":=Rec."approval status"::Open;
                      Rec.Modify(true);
                    end
                end;
            }
        }
    }
}

#pragma implicitwith restore

