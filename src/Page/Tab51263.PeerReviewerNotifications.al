/// <summary>
/// Table "PeerReviewerNotifications" (ID 51263).
/// </summary>
table 51263 PeerReviewerNotifications
{
    Caption = 'PeerReviewerNotifications';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            Caption = 'EntryNo';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Peer Code"; Code[30])
        {
            Caption = 'Peer Code';
            DataClassification = ToBeClassified;
        }
        field(3; "Task Code"; Code[30])
        {
            Caption = 'Task Code';
            DataClassification = ToBeClassified;
        }
        field(4; "Notification Decription"; Text[250])
        {
            Caption = 'Notification Decription';
            DataClassification = ToBeClassified;
        }
        field(5; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = ToBeClassified;
        }
        field(6; Notified; Boolean)
        {
            Caption = 'Notified';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}
