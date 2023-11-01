#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51317 "Audit Requisition Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;Description;Text[80])
        {
            Editable = false;
        }
        field(3;"Audit Plan No.";Code[30])
        {
            TableRelation = "Audit Plan Header";
        }
        field(4;"Audit Plan Item";Integer)
        {
            TableRelation = "Audit Plan Lines"."Line No." where ("Audit Plan Header"=field("Audit Plan No."));

            trigger OnValidate()
            begin
                AuditPlanLines.Reset;
                AuditPlanLines.SetRange("Audit Plan Header","Audit Plan No.");
                AuditPlanLines.SetRange("Line No.","Audit Plan Item");
                if AuditPlanLines.FindFirst then begin
                  Description:=AuditPlanLines.Description;
                  "Audit Plan Start Date":=AuditPlanLines."Planning Start Date";
                  "Audit Plan End Date":=AuditPlanLines."Planning End Date";
                  "Responsible Officer No.":=AuditPlanLines."Responsible Officer";
                  "Officer Name":=AuditPlanLines."Officer Name";
                  "Insitution/Programme No.":=AuditPlanLines."Institution/Programme ID";
                  "Task Type":=AuditPlanLines."Task Type";
                  "Institution Code":=AuditPlanLines."Institution Code";
                  "Institution Email":=AuditPlanLines."Institution Email";
                  "Institution Name":=AuditPlanLines."Institution Name";
                end
            end;
        }
        field(5;"Audit Plan Start Date";Date)
        {
            Editable = false;
        }
        field(6;"Audit Plan End Date";Date)
        {
            Editable = false;
        }
        field(7;"Insitution/Programme No.";Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","Insitution/Programme No.");
                if Customer.FindFirst then
                begin
                  "Institution Code":=Customer."No.";
                  Validate("Institution Code");
                end
            end;
        }
        field(8;"Responsible Officer No.";Code[30])
        {
            Editable = false;
        }
        field(9;"Officer Name";Text[50])
        {
            Editable = false;
        }
        field(10;"SAR Template No.";Code[30])
        {
            TableRelation = "SAR Template Header";

            trigger OnValidate()
            begin
                SARTemplateHeader.Reset;
                SARTemplateHeader.SetRange(Code,"SAR Template No.");
                if SARTemplateHeader.FindFirst then  begin
                  "SAR Template Description":=SARTemplateHeader.Description;
                  end
            end;
        }
        field(11;"SAR Template Description";Text[100])
        {
            Editable = false;
        }
        field(12;"No. Of Questions";Integer)
        {
            CalcFormula = count("Audit Requisition Lines" where ("Audit Requisition No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Document Status";Option)
        {
            OptionCaption = 'Draft,Open,Closed,Awaiting Finance Processing,Awaiting Completeness Checks,Awaiting Site Inspection,Awaiting Board Approval';
            OptionMembers = Draft,Open,Closed,"Awaiting Finance Processing","Awaiting Completeness Checks","Awaiting Site Inspection","Awaiting Board Approval";
        }
        field(14;"Approval Status";Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(15;"Created By";Code[30])
        {
            Editable = false;
        }
        field(16;"Created On";DateTime)
        {
            Editable = false;
        }
        field(17;Published;Boolean)
        {
            Editable = false;
        }
        field(18;"Published By";Code[30])
        {
            Editable = false;
        }
        field(19;"Published On";Date)
        {
            Editable = false;
        }
        field(20;"Expected Submission End Date";Date)
        {
        }
        field(21;"Document Type";Option)
        {
            OptionCaption = ' ,Engagement,Engagement Response,SAR Response,SAR Feedback Voucher,SAR Site Inspection,Audit Roadmap,Audit Closure,Rating Tool';
            OptionMembers = " ",Engagement,"Engagement Response","SAR Response","SAR Feedback Voucher","SAR Site Inspection","Audit Roadmap","Audit Closure","Rating Tool";
        }
        field(22;"Institution Name";Text[50])
        {
            Editable = false;
        }
        field(23;"Submission Status";Option)
        {
            OptionCaption = 'Open,Submitted';
            OptionMembers = Open,Submitted;
        }
        field(24;"Response No.";Code[30])
        {
            TableRelation = "Audit Requisition Header" where ("Document Type"=filter("Engagement Response"));

            trigger OnValidate()
            begin
                AuditRequisitionHeader.Reset;
                AuditRequisitionHeader.SetRange(Code,"Response No.");
                if AuditRequisitionHeader.FindFirst then  begin
                 "Audit Plan No.":=AuditRequisitionHeader."Audit Plan No.";
                  "Audit Plan Item":=AuditRequisitionHeader."Audit Plan Item";
                  "Audit Plan Start Date":=AuditRequisitionHeader."Audit Plan Start Date";
                  "Audit Plan End Date":=AuditRequisitionHeader."Audit Plan End Date";
                  "Insitution/Programme No.":=AuditRequisitionHeader."Insitution/Programme No.";
                  "Programme Name":=AuditRequisitionHeader."Programme Name";
                  "SAR Template No.":=AuditRequisitionHeader."SAR Template No.";
                  Validate("SAR Template No.");

                 end;
            end;
        }
        field(25;"Institution Email";Text[30])
        {
            Editable = false;
        }
        field(26;"Institution Code";Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","Institution Code");
                if Customer.FindFirst then begin
                  "Institution Name":=Customer.Name;
                  "Institution Email":=Customer."E-Mail";
                  end
            end;
        }
        field(27;"Task Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Institution Quality Audit,Course Quality Audit';
            OptionMembers = "Institution Quality Audit","Course Quality Audit";
        }
        field(28;"Domain Code";Code[30])
        {
            Editable = false;
        }
        field(29;"Domain Name";Text[50])
        {
            Editable = false;
        }
        field(30;"Programme Name";Text[50])
        {
            Editable = true;
        }
        field(31;"Engagement ID";Code[30])
        {
            Editable = false;
            TableRelation = "Audit Requisition Header";
        }
        field(32;"No. Series";Code[10])
        {
        }
        field(33;"Payment Mode";Code[30])
        {
            TableRelation = "Pay Mode";
        }
        field(34;"Transaction No.";Code[30])
        {
        }
        field(35;"Payment Document";Boolean)
        {
        }
        field(36;"Audit Invoice No.";Code[30])
        {
            Editable = false;
        }
        field(37;"Invoice Amount";Decimal)
        {
            CalcFormula = sum("Receipt Lines1"."Net Amount");
            Editable = false;
            FieldClass = FlowField;
        }
        field(38;"Audit Receipt No.";Code[30])
        {
            Editable = false;
        }
        field(39;"Receipt Amount";Decimal)
        {
            CalcFormula = sum("Receipt Lines1"."Net Amount");
            Editable = false;
            FieldClass = FlowField;
        }
        field(40;"Reason For Rejection";Text[150])
        {
        }
        field(41;"SAR Completeness Status";Option)
        {
            OptionCaption = 'Incomplete,Complete';
            OptionMembers = Incomplete,Complete;
        }
        field(42;"Resource No.";Code[30])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                  "Resource Name":=Resource.Name;
                  end
            end;
        }
        field(43;"Resource Name";Text[50])
        {
        }
        field(44;"Resource Feedback Type";Option)
        {
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
        }
        field(45;"Resource Person Role";Code[100])
        {
        }
        field(46;"Project No.";Code[30])
        {
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
                SARSectionsSetup: Record "Audit Sections Setup";
                EntryNo: Integer;
                SARCompletenessLines: Record "SAR Completeness Lines";
                SARCompletenessLines1: Record "SAR Completeness Lines";
            begin
                Job.Reset;
                Job.SetRange("No.","Project No.");
                if Job.FindFirst then begin
                  "Project Name":=Job.Description;
                  //"Task Type":=Job."Project Subtype";
                end;
                 SARCompletenessLines1.Reset;
                    SARCompletenessLines1.SetRange(Code,Code);
                    if SARCompletenessLines1.FindSet then begin
                      SARCompletenessLines1.DeleteAll;
                      end;
                //validate the sections
                if "Task Type"="task type"::"Institution Quality Audit" then begin
                SARSectionsSetup.Reset;
                SARSectionsSetup.SetRange(Category,SARSectionsSetup.Category::"Programme Quality Audit");
                if SARSectionsSetup.FindSet then begin
                  repeat

                    SARCompletenessLines.Code:=Code;
                    SARCompletenessLines."Section Code":=SARSectionsSetup.Code;
                    SARCompletenessLines.Validate("Section Code");
                    SARCompletenessLines.Insert(true);

                  until SARSectionsSetup.Next=0;
                end
                end;
                if "Task Type"="task type"::"Course Quality Audit" then begin
                SARSectionsSetup.Reset;
                SARSectionsSetup.SetRange(Category,SARSectionsSetup.Category::"Institution Quality Audit");
                if SARSectionsSetup.FindSet then begin
                  repeat


                    SARCompletenessLines.Code:=Code;
                    SARCompletenessLines."Section Code":=SARSectionsSetup.Code;
                    SARCompletenessLines.Validate("Section Code");
                    SARCompletenessLines.Insert(true);

                  until SARSectionsSetup.Next=0;
                end
                end
            end;
        }
        field(47;"Project Name";Text[100])
        {
            Editable = false;
        }
        field(48;"Board Verdict";Option)
        {
            OptionCaption = ',Approved,Not Approved';
            OptionMembers = ,Approved,"Not Approved";
        }
        field(49;"Verdict Date";Date)
        {
        }
        field(50;"Board Comments";Text[250])
        {
        }
        field(51;"Ordinal Number";Code[30])
        {
        }
    }

    keys
    {
        key(Key1;"Code","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        QualityAuditSetup.Get;
        if "Document Type"="document type"::Engagement then begin
                QualityAuditSetup.TestField("Engagement Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."Engagement Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"Engagement Response" then begin
                QualityAuditSetup.TestField("Engagement Response Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."Engagement Response Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"SAR Response" then begin
                QualityAuditSetup.TestField("SAR Response Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."SAR Response Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"SAR Feedback Voucher" then begin
                QualityAuditSetup.TestField("SAR Feedback Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."SAR Feedback Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"SAR Site Inspection" then begin
                QualityAuditSetup.TestField("Site Visit Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."Site Visit Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"Audit Roadmap" then begin
                QualityAuditSetup.TestField("Audit Roadmap Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."Audit Roadmap Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        if "Document Type"="document type"::"Audit Closure" then begin
                QualityAuditSetup.TestField("Audit Roadmap Nos.");
                if Code=''  then begin
                NoSeriesMgt.InitSeries(QualityAuditSetup."Audit Roadmap Nos.",xRec."No. Series",0D,Code,"No. Series");
                end
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        AuditPlanLines: Record "Audit Plan Lines";
        SARTemplateHeader: Record "SAR Template Header";
        AccreditationQualityAudit: Codeunit "Accreditation-Quality Audit";
        AuditRequisitionHeader: Record "Audit Requisition Header";
        Customer: Record Customer;
        QualityAuditSetup: Record "Quality Audit Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Resource: Record Resource;
}

