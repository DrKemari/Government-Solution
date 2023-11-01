#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85111 "Checkers Ticket Lines"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Course; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field(Course));
        }
        field(5; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field(Course));
        }
        field(6; "Paper ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Course),
                                               Level = field(Level));

            trigger OnValidate()
            begin
                if Paperss.Get("Paper ID") then begin

                    "Paper Name" := Paperss.Description;
                end;
            end;
        }
        field(7; "Paper Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(11; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if ExaminationCentres.Get("Center Code") then begin
                    "Center Name" := ExaminationCentres.Name;

                end
            end;
        }
        field(12; "Center Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "No. of Scripts Before"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "No. of Scripts After"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Cumulative Total"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Date; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No" <> '' then begin
                    ScriptsDispatchHeader.Reset;
                    ScriptsDispatchHeader.SetRange("Document No.", "Document No");
                    if ScriptsDispatchHeader.FindSet then begin
                        "Document Type" := ScriptsDispatchHeader."Document Type";
                        Modify(true);
                    end;

                end;
            end;
        }
        field(17; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = const("Checker Attendance")) "Resource Role Allocation"."Resource No" where(Role = const(Checker))
            else
            if ("Document Type" = const("Marker Attendance")) "Resource Role Allocation"."Resource No" where(Role = const(Marker))
            else
            Resource."No.";

            trigger OnValidate()
            begin
                if Resources.Get("Marker No") then begin
                    "Marker Name" := Resources.Name;
                    ScriptsDispatchHeader.Reset;
                    ScriptsDispatchHeader.SetRange("Document No.", "Document No");
                    if ScriptsDispatchHeader.FindFirst then begin
                        "Examination Sitting" := ScriptsDispatchHeader."Sitting Cycle";
                    end
                end;
            end;
        }
        field(18; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "No. of Envelope"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Script Dispatch Voucher,Team Leader Sampling Voucher,Marker Claim Voucher,Checker Work Ticket,Marker Attendance,Checker Attendance,Script Re-allocation,Marking Center Checklist,Marker Tally,Dummy Form';
            OptionMembers = "Script Dispatch Voucher","Team Leader Sampling Voucher","Marker Claim Voucher","Checker Work Ticket","Marker Attendance","Checker Attendance","Script Re-allocation","Marking Center Checklist","Marker Tally","Dummy Form";
        }
        field(21; "Attended Morning Session"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Attended Evening Session"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", Name)
        {
        }
    }

    var
        Paperss: Record Papers;
        Resources: Record Resource;
        ExaminationCentres: Record "Examination Centres";
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        DispatchHeader: Record "Scripts Dispatch Header";
}
