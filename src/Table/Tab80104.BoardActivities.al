#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80104 "Board Activities"
{
    DrillDownPageID = "Board Activities";
    LookupPageID = "Board Activities";

    fields
    {
        field(1;"AWP No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(2;"Board Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Activities Setup".Code;

            trigger OnValidate()
            begin
                if BoardSetup.Get("Board Activity Code") then begin
                   "Board Activity Description":=BoardSetup.Description;
                  end;
            end;
        }
        field(3;"Board Activity Description";Code[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Activity Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7;"WT(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Target;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Achieved Targets";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Framework Perspective";Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where ("Strategy Framework"=field("Strategy Framework"));
        }
        field(11;"Strategy Framework";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(12;"Achieved Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Primary Directorate Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Primary Department Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Primary Directorate";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(17;"Primary Department";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
    }

    keys
    {
        key(Key1;"AWP No","Board Activity Code","Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoardSetup: Record "Board Activities Setup";
}

