#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69254 "Disciplinary Committees"
{
    DrillDownPageID = "Disciplinary Committe";
    LookupPageID = "Disciplinary Committe";

    fields
    {
        field(1;"Code";Code[20])
        {

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                  HRSetup.Get;
                  NoSeriesMgt.TestManual(HRSetup."Disciplinary Committee Nos");
                  "No series" := '';
                end;
            end;
        }
        field(2;Description;Text[200])
        {
            NotBlank = true;
        }
        field(3;Comments;Text[200])
        {
        }
        field(4;"Start Date";Date)
        {
        }
        field(5;"End Date";Date)
        {
        }
        field(6;Status;Option)
        {
            OptionCaption = 'Active,Disbanded';
            OptionMembers = Active,Disbanded;
        }
        field(7;Mandate;Text[250])
        {
        }
        field(8;"No series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Disciplinary Committee Nos");
          NoSeriesMgt.InitSeries(HRSetup."Disciplinary Committee Nos",xRec."No series",0D,Code,"No series");
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

