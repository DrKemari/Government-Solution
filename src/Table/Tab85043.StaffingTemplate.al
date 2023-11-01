#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85043 "Staffing Template"
{
    DrillDownPageID = "Staff Templates";
    LookupPageID = "Staff Templates";

    fields
    {
        field(1;"Template ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get(Examination) then begin
                  Description:=Courses.Description;
                end
            end;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Exam Sittings";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Total Resources";Integer)
        {
            CalcFormula = sum("Staff Template Line"."Min. No. of Recommended Staff" where ("Staff Template ID"=field("Template ID"),
                                                                                           Examination=field(Examination)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Template ID")
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
        ExaminationSetup.TestField("Staff Appointment Nos.");
          if "Template ID"='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Staff Appointment Nos.",xRec."No. Series",0D,"Template ID","No. Series");
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationSetup: Record "Examination Setup";
        Courses: Record Courses;
}

