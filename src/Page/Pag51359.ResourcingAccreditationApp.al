#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51359 "Resourcing Accreditation App"
{
    ApplicationArea = Basic;
    Caption = 'Resourcing Accreditation Application';
    CardPageID = "ResourceUniversity Application";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Accreditation Application";
    SourceTableView = where(Status = filter("Awaiting Peer Review"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("Group Name"; GroupName)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Route")
            {
                ApplicationArea = Basic;
                Image = CreateLedgerBudget;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to create a project for the selected applications';
                    TXT002: label 'Kindly include a group name in the first application selected';
                begin
                    if Confirm(TXT001) then begin
                        if GroupName = '' then
                            Error(TXT002);
                        CreateJob(Rec."No.", Rec."Application No.", GroupName);
                    end
                end;
            }
        }
    }

    var
        Select: Boolean;
        GroupName: Text;

    [ServiceEnabled]
    procedure CreateJob(var Number: Code[30]; var ApplicationNumber: Code[30]; GroupName: Text) CreatedJob: Boolean
    var
        Job: Record Job;
        AccreditationProject: Record "Accreditation Project";
        AccreditationApplication: Record "Accreditation Application";
        AccreditationProject1: Record "Accreditation Project";
        EntryNo: Integer;
    begin

        AccreditationApplication.Reset;
        AccreditationApplication.SetRange(Select, true);
        AccreditationApplication.SetRange("Job Created", false);
        if AccreditationApplication.FindSet then begin
            //create a job
            Job.Init;
            Job."No." := '';
           // Job."Document Type" := Job."document type"::"5";
            Job.Validate(Description, GroupName);
            Job.Validate("Bill-to Customer No.", Rec."No.");
            Job."Creation Date" := Today;
            Job."Starting Date" := Today;
            //Job."Examination Project Type":=Job."Examination Project Type"::"0";
            // Job."Examination Project Subtype":=Job."Examination Project Subtype"::"1";
            Job.Insert(true);
            repeat
                AccreditationProject1.Reset;
                if AccreditationProject1.FindLast then begin
                    EntryNo := AccreditationProject1."Entry No.";
                end;
                AccreditationProject.Init;
                AccreditationProject."Entry No." := EntryNo + 1;
                AccreditationProject."Application No." := AccreditationApplication."Application No.";
                AccreditationProject."Application Name" := AccreditationApplication.Name;
                AccreditationProject."Job No." := Job."No.";
                AccreditationProject.Insert(true);
                EntryNo += 1;

                AccreditationApplication."Job Created" := true;
                AccreditationApplication."Job Created By" := UserId;
                AccreditationApplication."Job Created On" := CurrentDatetime;
                AccreditationApplication.Modify(true);

            until AccreditationApplication.Next = 0;

            //insert lines

        end;

        Message('The project %1 has been created,Kindly proceed to assign tasks', Job."No.");



    end;
}

#pragma implicitwith restore

