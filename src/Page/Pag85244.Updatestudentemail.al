#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85244 "Update student email"
{
    PageType = Card;
    SourceTable = "Dynasoft Portal User";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Authentication Email"; Rec."Authentication Email")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("New Email Address"; Newemail)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        MailManagement.ValidateEmailAddressField(Newemail);
                    end;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PasswordChanged; Rec.PasswordChanged)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control18; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
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

                trigger OnAction()
                var
                    TXT001: label 'Update student email from %1,to %2';
                    TXT002: label 'Kindly input the new email for %1';
                    TXT003: label 'The accounts allowed to be updated must be active';
                begin
                    if Newemail <> '' then begin
                        if Confirm(TXT001, true, Rec."Authentication Email", Newemail) then begin
                            //check account is active
                            if Rec.State = Rec.State::Enabled then begin
                                Examination.RegistrationUpdateStudent(Rec, Newemail);
                                exit;
                            end else begin
                                Error(TXT003);
                                exit;
                            end
                        end
                    end
                    else
                        Error(TXT002, Rec."Authentication Email");
                    exit;
                end;
            }
        }
    }

    var
        Newemail: Text;
        Examination: Codeunit Examination;
        MailManagement: Codeunit "Mail Management";
}

#pragma implicitwith restore

