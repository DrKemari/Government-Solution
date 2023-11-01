#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69557 "Succession Log Header"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Succession Program";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Succession Plan Header".Code;
        }
        field(3;Mentee;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Succession Plan Lines"."Employee No" where ("Document No"=field("Succession Program"));

            trigger OnValidate()
            begin
                SuccessionPlanLines.Reset;
                SuccessionPlanLines.SetRange("Document No","Succession Program");
                SuccessionPlanLines.SetRange("Employee No",Mentee);
                if SuccessionPlanLines.FindSet then begin
                  "Mentee Name":=SuccessionPlanLines."Employee Name";
                  Description:=SuccessionPlanLines."Employee Name" +' Succession Log';
                  Mentor:=SuccessionPlanLines.Mentor;
                  "Position ID":=SuccessionPlanLines."Projected Position ID";
                  end;
            end;
        }
        field(4;"Mentee Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Mentor;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));
        }
        field(7;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No"='' then begin
         HumanResourcesSetup.Get;
         HumanResourcesSetup.TestField("Succession Log Nos");
         NoSeriesManagement.InitSeries(HumanResourcesSetup."Succession Log Nos",xRec."No. Series",0D,"Document No","No. Series");
         end;
         "Created By":=UserId;
         "Document Date":=Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        SuccessionPlanLines: Record "Succession Plan Lines";
}

