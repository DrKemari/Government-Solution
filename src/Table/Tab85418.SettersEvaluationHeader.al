#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85418 "Setters Evaluation Header"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Engagement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabuses Development,Setting of Examinations,Moderation of Examinations,Printing of Examinations,Delivery of Examinations,Administration of Examinations,Marking Process,Processing of Results,Release of Results,Processing of Certificates,Certificate Dispatch';
            OptionMembers = "Syllabuses Development","Setting of Examinations","Moderation of Examinations","Printing of Examinations","Delivery of Examinations","Administration of Examinations","Marking Process","Processing of Results","Release of Results","Processing of Certificates","Certificate Dispatch";
        }
        field(3; "Moderator No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false),
                                                  "Exam Task Type" = const(Moderator));

            trigger OnValidate()
            begin
                if Resource.Get("Moderator No") then begin
                    Resource.TestField("E-mail Address");
                    "Moderator Email" := Resource."E-mail Address";
                    "Moderator Name" := Resource.Name;
                end;
            end;
        }
        field(4; "Moderator Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Global Dimension Dim 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Global Dimension  Dim 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Exam Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(11; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Closed';
            OptionMembers = Open,"Pending Approval",Released,Closed;
        }
        field(18; "Moderator Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Setters Evaluation Nos");
        if "Document No." = '' then
            NoSeriesMgt.InitSeries(ExaminationSetup."Setters Evaluation Nos", ExaminationSetup."Setters Evaluation Nos", 0D, "Document No.", ExaminationSetup."Setters Evaluation Nos");

        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        ExamAuditLines: Record "Exam Audit Lines";
        ExaminationSetup: Record "Setting Moderation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Resource: Record Resource;
}
