#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95134 "Risk Incident Log"
{

    fields
    {
        field(1;"Incident ID";Code[50])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (CEO),Functional (Department),Project';
            OptionMembers = " ",Corporate,"Functional (CEO)","Functional (Department)",Project;
        }
        field(3;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Risk Register Type"));
        }
        field(4;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk ID" where ("Document No"=field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID","Risk ID");
                if RiskManagementPlanLine.FindSet then
                  "Risk Incident Category":=RiskManagementPlanLine."Risk Category";
                "Risk Description":=RiskManagementPlanLine."Risk Title";
            end;
        }
        field(5;"Risk Incident Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Management Plan Line"."Risk Category" where ("Document Type"=field("Risk Register Type"));
        }
        field(6;"Incident Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Severity Level";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incident Severity Level".Code;
        }
        field(8;"Occurrence Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(9;"Incident Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Incident Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Incident End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Incident Location Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Primary Trigger ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Category Trigger"."Trigger ID" where ("Risk Category ID"=field("Risk Incident Category"));

            trigger OnValidate()
            begin
                 RiskCategoryTrigger.Reset;
                 RiskCategoryTrigger.SetRange("Trigger ID","Primary Trigger ID");
                 if RiskCategoryTrigger.FindSet then
                  "Root Cause Summary":=RiskCategoryTrigger.Description;
            end;
        }
        field(14;"Root Cause Summary";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Category of Person Reporting";Option)
        {
            Caption = 'Source of Information';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(16;"Reported By (Name)";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Incident Class";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Health/Safety/Environment Incident,Other';
            OptionMembers = " ","Health/Safety/Environment Incident",Other;
        }
        field(18;"HSE Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(19;"Hazard ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Actual Financial Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Actual Schedule Delay(Days)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(22;"Actual No. Injured Persons";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Actual No. of Fatalities";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"No. of Parties Involved";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No. of Corrective Actions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"No. of Preventive Actions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Police Report Reference No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Police Station";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Reporting Officer";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(32;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Not Applicate at KEMRI';
        }
        field(33;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(34;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;
        }
        field(35;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Blocked?"=filter(false),
                                                                "Operating Unit Type"=filter(Directorate));
        }
        field(36;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Blocked?"=filter(false),
                                                                "Operating Unit Type"=filter("Department/Center"));
        }
        field(37;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Blocked?"=filter(false),
                                                                "Operating Unit Type"=filter(Region));
        }
        field(38;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(40;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(41;"Created Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(42;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(43;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Risk Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Incident Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Escalate to Officer No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Escalate to Officer No");
                if Employee.FindSet then
                  "Ecalate to Officer Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                    Email:=Employee."Company E-Mail";
            end;
        }
        field(48;"Ecalate to Officer Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(49;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50;DocumentCreator;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where (Status=const(Active));
        }
        field(51;"Escalated?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52;Response;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(53;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Category of Person Reporting"=const("Internal Employee")) Employee."No.";

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                  "Reported By (Name)":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  end;
            end;
        }
        field(54;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            OptionCaption = 'Draft,Submitted,Escalated,Closed';
            OptionMembers = Draft,Submitted,Escalated,Closed;
        }
        field(55;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Risk Incident Report,Risk Incident Follow-up,Implementation Status';
            OptionMembers = "Risk Incident Report","Risk Incident Follow-up","Implementation Status";
        }
        field(56;"Risk Incident No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Incident Log"."Incident ID" where ("Document Type"=const("Risk Incident Report"),
                                                                     "Document Status"=filter(<>Submitted|Draft));

            trigger OnValidate()
            begin

                if "Document Type"="document type"::"Implementation Status" then begin
                  RiskIncidentLog.Reset;
                  RiskIncidentLog.SetRange("Incident ID","Risk Incident No.");
                  if RiskIncidentLog.FindSet then begin
                    "Risk Register Type":=RiskIncidentLog."Risk Register Type";
                    "Risk Management Plan ID":=RiskIncidentLog."Risk Management Plan ID";
                    "Risk ID":=RiskIncidentLog."Risk ID";
                    "Risk Description":=RiskIncidentLog."Risk Description";
                    "Risk Incident Category":=RiskIncidentLog."Risk Incident Category";
                    "Incident Description":=RiskIncidentLog."Incident Description";
                    "Severity Level":=RiskIncidentLog."Severity Level";
                    "Occurrence Type":=RiskIncidentLog."Occurrence Type";
                    "Incident Date":=RiskIncidentLog."Incident Date";
                    "Incident Time":=RiskIncidentLog."Incident Time";
                    "Incident Location Details":=RiskIncidentLog."Incident Location Details";
                    "Primary Trigger ID":=RiskIncidentLog."Primary Trigger ID";
                    "Category of Person Reporting":=RiskIncidentLog."Category of Person Reporting";
                    "Employee No":=RiskIncidentLog."Employee No";
                    "Reported By (Name)":=RiskIncidentLog."Reported By (Name)";
                    "Directorate ID":=RiskIncidentLog."Directorate ID";
                    "Escalate to Officer No":=RiskIncidentLog."Escalate to Officer No";
                    Email:=RiskIncidentLog.Email;
                    end;
                  end;







                if "Document Type"="document type"::"Risk Incident Follow-up" then begin
                  RiskIncidentLog.Reset;
                  RiskIncidentLog.SetRange("Incident ID","Risk Incident No.");
                  if RiskIncidentLog.FindSet then begin
                    "Risk Register Type":=RiskIncidentLog."Risk Register Type";
                    "Risk Management Plan ID":=RiskIncidentLog."Risk Management Plan ID";
                    "Risk ID":=RiskIncidentLog."Risk ID";
                    "Risk Description":=RiskIncidentLog."Risk Description";
                    "Risk Incident Category":=RiskIncidentLog."Risk Incident Category";
                    "Incident Description":=RiskIncidentLog."Incident Description";
                    "Severity Level":=RiskIncidentLog."Severity Level";
                    "Occurrence Type":=RiskIncidentLog."Occurrence Type";
                    "Incident Date":=RiskIncidentLog."Incident Date";
                    "Incident Time":=RiskIncidentLog."Incident Time";
                    "Incident Location Details":=RiskIncidentLog."Incident Location Details";
                    "Primary Trigger ID":=RiskIncidentLog."Primary Trigger ID";
                    "Category of Person Reporting":=RiskIncidentLog."Category of Person Reporting";
                    "Employee No":=RiskIncidentLog."Employee No";
                    "Reported By (Name)":=RiskIncidentLog."Reported By (Name)";
                    "Directorate ID":=RiskIncidentLog."Directorate ID";
                    end;
                  end;
            end;
        }
    }

    keys
    {
        key(Key1;"Incident ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin


          if "Document Type"="document type"::"Risk Incident Report" then begin
             if "Incident ID" ='' then begin
            HealthSafetySetup.Get;
            HealthSafetySetup.TestField("Risk Incident Report Nos.");
            NoSeriesManagement.InitSeries(HealthSafetySetup."Risk Incident Report Nos.",xRec."No. Series",Today,"Incident ID","No. Series");
            end;
            end;


           if "Document Type"="document type"::"Implementation Status" then begin
               if "Incident ID" ='' then begin
              HealthSafetySetup.Get;
              HealthSafetySetup.TestField("Implementation Status Nos.");
              NoSeriesManagement.InitSeries(HealthSafetySetup."Implementation Status Nos.",xRec."No. Series",Today,"Incident ID","No. Series");
              end;
              end;


          if "Document Type"="document type"::"Risk Incident Follow-up" then begin
             if "Incident ID" ='' then begin
            HealthSafetySetup.Get;
            HealthSafetySetup.TestField("Risk Incident Follow-up Nos.");
            NoSeriesManagement.InitSeries(HealthSafetySetup."Risk Incident Follow-up Nos.",xRec."No. Series",Today,"Incident ID","No. Series");
            end;
            end;
            Status:=Status::Open;
        "Created By":=UserId;
        "Created Date Time":=CreateDatetime(Today,Time);
    end;

    var
        HealthSafetySetup: Record "Health & Safety Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskCategoryTrigger: Record "Risk Category Trigger";
        Employee: Record Employee;
        RiskIncidentLog: Record "Risk Incident Log";
}

