#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55009 "Board Meeting Attendance"
{

    fields
    {
        field(1;"Entry no.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Meeting Code";Code[20])
        {
            TableRelation = "Board Meetings";
        }
        field(3;"Member No";Code[20])
        {
            TableRelation = "Committee Board Members".Code;

            trigger OnValidate()
            begin
                //IF Memb.GET("Member No") THEN
                  //"Member Name":=Memb.Names;
                Memb.Reset;
                Memb.SetRange(Code,"Member No");
                if Memb.FindSet
                  then
                "Member Name":=Memb.Designation;
            end;
        }
        field(4;"Commitee No";Code[20])
        {
            Editable = false;
            TableRelation = "Board Committees".Code;
        }
        field(5;"Meeting Name";Text[100])
        {
            Editable = false;
        }
        field(6;"Member Name";Text[30])
        {
            Editable = false;
        }
        field(7;"Committee  Name";Text[30])
        {
        }
        field(8;"Meeting Date";Date)
        {
            Editable = false;
        }
        field(9;Venue;Text[30])
        {
            Editable = false;
        }
        field(10;Attendance;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Present,Apology,Absent';
            OptionMembers = " ",Present,Apology,Absent;
        }
        field(11;"Attendance Confirmation";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not confirmed,Confirmed,Apologetic Decline';
            OptionMembers = "Not confirmed",Confirmed,"Apologetic Decline";
        }
    }

    keys
    {
        key(Key1;"Entry no.","Meeting Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Meeting.Get("Meeting Code") then begin
          "Meeting Name":=Meeting.Description;
          "Meeting Date":=Meeting."Start date";
          "Commitee No":=Meeting."Meeting group Code";
          "Committee  Name":=Meeting."Meeting group";
          Venue:=Meeting."Venue/Location";
        end;
    end;

    var
        Memb: Record "Committee Board Members";
        Meeting: Record "Board Meetings";
        Committe: Record "Board Committees";
}

