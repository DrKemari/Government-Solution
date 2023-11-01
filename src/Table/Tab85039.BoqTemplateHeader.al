#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85039 "Boq Template  Header"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get(Examination) then
                  Description:=Courses.Description;
            end;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
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
        ExaminationSetup.TestField("BoQ Template Nos.");
          if "Template ID"='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."BoQ Template Nos.",xRec."No. Series",0D,"Template ID","No. Series");
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Courses: Record Courses;
}

