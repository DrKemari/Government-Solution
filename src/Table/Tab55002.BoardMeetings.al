#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55002 "Board Meetings"
{

    fields
    {
        field(1;No;Code[20])
        {
        }
        field(2;Title;Text[250])
        {
        }
        field(3;"Start date";Date)
        {
        }
        field(4;"Start time";Time)
        {
        }
        field(5;"End Date";Date)
        {
        }
        field(6;"End time";Time)
        {
        }
        field(7;"Venue/Location";Text[100])
        {
        }
        field(8;"Convened by";Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(9;"Contact Tel. No";Code[50])
        {
        }
        field(10;"Contact Email";Text[100])
        {
        }
        field(11;Description;Text[250])
        {
        }
        field(12;Status;Option)
        {
            OptionCaption = 'Pending,Upcoming,In progress,Completed,Cancelled';
            OptionMembers = Pending,Upcoming,"In progress",Completed,Cancelled;
        }
        field(13;Published;Boolean)
        {
        }
        field(14;"Meeting group Code";Code[20])
        {
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            begin
                Committees.Get("Meeting group Code");
                "Meeting group" := Committees.Description;
            end;
        }
        field(15;"Meeting group";Text[100])
        {
        }
        field(16;"Conference Venue";Text[100])
        {
        }
        field(17;"Parking Arrangement";Text[100])
        {
        }
        field(18;"Access requirement";Text[100])
        {
        }
        field(19;"Meeting Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Board Meeting,Committee Meeting,Trust Meeting';
            OptionMembers = "Board Meeting","Committee Meeting","Trust Meeting";
        }
        field(20;"Meeting Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            begin
                Committees.Get("Meeting Code");
                "Meeting group" := Committees.Description;
            end;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Convened by":=UserId;
    end;

    var
        Committees: Record "Board Committees";
}

