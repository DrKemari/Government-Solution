#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85455 "Audit Action Lines"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Recommendation;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Action";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Courses: Record Courses;
            begin
            end;
        }
        field(6;"Audit Report No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Report Lines"."Header No.";
        }
        field(7;"Audit Report Item";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Report Lines"."Entry No.";

            trigger OnValidate()
            begin
                AuditReportLines.Reset;
                AuditReportLines.SetRange("Header No.","Audit Report No.");
                AuditReportLines.SetRange("Entry No.","Audit Report Item");
                if AuditReportLines.FindFirst then begin
                  Recommendation:=AuditReportLines.Recommendation;
                end
            end;
        }
        field(8;"Actual Completion Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Completed By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Ongoing,Closed';
            OptionMembers = Open,Ongoing,Closed;
        }
    }

    keys
    {
        key(Key1;"Header No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditReportLines: Record "Audit Report Lines";
}

