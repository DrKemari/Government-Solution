#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95117 "RMP Line Response Action"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                  "Risk ID":= RiskManagementPlanLine."Risk ID";
                  "Risk Title" := RiskManagementPlanLine."Risk Title";
                  end;
            end;
        }
        field(4;"Action ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document Type","Document Type");
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No","Document No");
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk ID","Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                  "Risk Title":=RiskManagementPlanLine."Risk Title";
                 end;
            end;
        }
        field(5;"Activity Description";Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.","Responsible Officer No.");
                if Resource.FindSet then

                "Responsible Officer Name":=Resource.Name;
            end;
        }
        field(7;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(8;"Percentage Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(14;"Actual End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Descriptive Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Low,Medium,High';
            OptionMembers = " ",Low,Medium,High;
        }
        field(16;"Risk Title";Text[400])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(17;"Responsible Officer Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Risk Response Action Taken";Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Timeline;Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // RiskManagementPlanLine.RESET;
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Document Type","Document Type");
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Document No","Document No");
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Risk ID","Risk ID");
        // IF RiskManagementPlanLine.FINDSET THEN BEGIN
        //  "Risk Title":=RiskManagementPlanLine."Risk Title";
        //  END;

        Validate("Risk ID");
    end;

    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        Resource: Record Resource;
}

