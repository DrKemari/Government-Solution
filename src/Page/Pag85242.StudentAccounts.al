#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85242 "Student Accounts"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dynasoft Portal User";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(State; Rec.State)
                {
                    ApplicationArea = Basic;
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Change Password"; Rec."Change Password")
                {
                    ApplicationArea = Basic;
                }
                field("Id Number"; Rec."Id Number")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Details")
            {
                ApplicationArea = Basic;
                Image = Users;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Update student email";
                RunPageLink = "Entry No" = field("Entry No");
            }
            action("Re-Send Sign-Up Email")
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Re-send sign-up email to %1';
                    Customer: Record Customer;
                    ProcessingHeader: Record "Student Processing Header";
                    ExaminationAccount: Record "Examination Account";
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.SetRange("Entry No", Rec."Entry No");
                        Examination.SendEmaiNotificationOnApplicantAccountActivation(Rec);

                    end
                end;
            }
        }
    }
}

#pragma implicitwith restore

