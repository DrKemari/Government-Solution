#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51337 "Audit Mobilization Header"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Audit Commencement Notice No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Auditee Notice Response No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Entrace Meeting No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Description:=Format("Document Type")+'-'+"Engagement ID";
                
                /*
                AuditProject.RESET;
                AuditProject.SETRANGE(AuditProject."Engagement ID","Engagement ID");
                IF AuditProject.FINDSET THEN BEGIN
                  "Audit Plan ID":=AuditProject."Audit Plan ID";
                  "Audit  Work Type":=AuditProject."Audit  Work Type";
                  "Engagement Name":=AuditProject."Engagement Name";
                  "Engagement Category":=AuditProject."Engagement Category";
                  "Auditor Type":=AuditProject."Auditor Type";
                  "Auditee Type":=AuditProject."Auditee Type";
                  "Project ID":=AuditProject."Project ID";
                  "Primary Auditee ID":=AuditProject."Primary Auditee ID";
                  "Auditee Name":=AuditProject."Auditee Name";
                
                  END;
                
                //Populate Sections
                AuditProjectSection.RESET;
                AuditProjectSection.SETRANGE(AuditProjectSection."Engagement ID","Engagement ID");
                IF AuditProjectSection.FINDSET THEN BEGIN
                    REPEAT
                      ObjAuditProjectSection.INIT;
                      ObjAuditProjectSection.TRANSFERFIELDS(AuditProjectSection);
                      ObjAuditProjectSection."Engagement ID":="Document No.";
                      IF ObjAuditProjectSection.INSERT(TRUE) THEN
                        ObjAuditProjectSection.MODIFY(TRUE);
                     UNTIL AuditProjectSection.NEXT=0;
                  END;
                
                
                //Populate Objectives
                AuditProjectObjective.RESET;
                AuditProjectObjective.SETRANGE(AuditProjectObjective."Engagement ID","Engagement ID");
                IF AuditProjectObjective.FINDSET THEN BEGIN
                    REPEAT
                      ObjAuditProjectObjective.INIT;
                      ObjAuditProjectObjective.TRANSFERFIELDS(AuditProjectObjective);
                      ObjAuditProjectObjective."Engagement ID":="Document No.";
                      IF ObjAuditProjectObjective.INSERT(TRUE) THEN
                         ObjAuditProjectObjective.MODIFY(TRUE);
                     UNTIL AuditProjectObjective.NEXT=0;
                  END;
                //Populate Checlist
                AuditProjectChecklist.RESET;
                AuditProjectChecklist.SETRANGE(AuditProjectChecklist."Engagement ID","Engagement ID");
                IF AuditProjectChecklist.FINDSET THEN BEGIN
                    REPEAT
                      ObjAuditProjectChecklist.INIT;
                      ObjAuditProjectChecklist.TRANSFERFIELDS(AuditProjectChecklist);
                      ObjAuditProjectChecklist."Engagement ID":="Document No.";
                      IF ObjAuditProjectChecklist.INSERT(TRUE) THEN
                        ObjAuditProjectChecklist.MODIFY(TRUE);
                     UNTIL AuditProjectChecklist.NEXT=0;
                  END;
                //Populate Locations
                AuditProjectLocation.RESET;
                AuditProjectLocation.SETRANGE(AuditProjectLocation."Engagement ID","Engagement ID");
                IF AuditProjectLocation.FINDSET THEN BEGIN
                    REPEAT
                      ObjAuditProjectLocation.INIT;
                      ObjAuditProjectLocation.TRANSFERFIELDS(AuditProjectLocation);
                      ObjAuditProjectLocation."Engagement ID":="Document No.";
                      IF ObjAuditProjectLocation.INSERT(TRUE) THEN
                        ObjAuditProjectLocation.MODIFY(TRUE);
                     UNTIL AuditProjectLocation.NEXT=0;
                  END;
                //Populate Procedures
                AuditProjectProcedure.RESET;
                AuditProjectProcedure.SETRANGE(AuditProjectProcedure."Engagement ID","Engagement ID");
                IF AuditProjectProcedure.FINDSET THEN BEGIN
                    REPEAT
                      ObjAuditProjectProcedure.INIT;
                      ObjAuditProjectProcedure.TRANSFERFIELDS(AuditProjectProcedure);
                      ObjAuditProjectProcedure."Engagement ID":="Document No.";
                      IF ObjAuditProjectProcedure.INSERT(TRUE) THEN
                        ObjAuditProjectProcedure.MODIFY(TRUE);
                     UNTIL AuditProjectProcedure.NEXT=0;
                  END;
                */

            end;
        }
        field(8;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Plan Header".Code;

            trigger OnValidate()
            begin
                AuditPlanHeader.Reset;
                AuditPlanHeader.SetRange(Code,"Audit Plan ID");
                if AuditPlanHeader.FindSet then begin
                  "Engagement Name":=AuditPlanHeader.Description;

                  end
            end;
        }
        field(10;"Audit  Work Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Engagement Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Engagement Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(13;"Auditor Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Internal Audit,External Audit';
            OptionMembers = ,"Internal Audit","External Audit";
        }
        field(14;"Audit Lead ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Auditee Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre ';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre ";
        }
        field(16;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(17;"Primary Auditee ID";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Primary Auditee ID") then begin
                  "Auditee Name":=ResponsibilityCenter.Name;
                end;
            end;
        }
        field(18;"Auditee Name";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Auditee Lead ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Global Dimension 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(1));
        }
        field(21;"Global Dimension 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(2));
        }
        field(22;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(24;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27;"Entrance Meeting Venue";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Entrance Meeting Venue';
        }
        field(28;"Entrance Meeting Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Entrance Meeting Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Entrance Meeting End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Entrance Meeting End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(32;Duration;Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Meeting Medium";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(34;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Audit Plan Item";Integer)
        {
            TableRelation = "Audit Plan Lines" where ("Audit Plan Header"=field("Audit Plan ID"));

            trigger OnValidate()
            begin
                AuditPlanLines.Reset;
                AuditPlanLines.SetRange("Audit Plan Header","Audit Plan ID");
                AuditPlanLines.SetRange("Line No.","Audit Plan Item");
                if AuditPlanLines.FindFirst then begin
                  "Auditee Name":=AuditPlanLines."Institution/Programme ID";
                  end
            end;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By":=UserId;
        "Created DateTime":=CurrentDatetime;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ResponsibilityCenter: Record "Responsibility Center";
        QualityAuditSetup: Record "Quality Audit Setup";
        AuditPlanHeader: Record "Audit Plan Header";
        AuditPlanLines: Record "Audit Plan Lines";
}

