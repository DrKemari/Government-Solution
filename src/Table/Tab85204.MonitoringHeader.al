#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85204 "Monitoring Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Monitoring Application";

            trigger OnValidate()
            begin

                if "Document Type"="document type"::Accreditation then begin
                  AccreditationApplication.Reset;
                AccreditationApplication.SetRange("Application No.","Application No.");
                if AccreditationApplication.FindFirst then begin
                  "Institution Email":=AccreditationApplication.Email;
                  "Insitution Code":=AccreditationApplication."No.";
                  "Application Description":=Format(Type)+' '+'for'+' '+AccreditationApplication.Name;

                //delete all previous lines

                ApplicationLines.Reset;
                ApplicationLines.SetRange("Application No.","Application No.");
                ApplicationLines.SetRange("Evaluation Header No.",Code);
                if  ApplicationLines.FindSet then begin
                  ApplicationLines.DeleteAll;
                end;
                if Type=Type::Evaluation then begin
                //Insert components and sub-component lines
                ProgrammeEvalSubComponent.Reset;
                ProgrammeEvalSubComponent.SetFilter(Code,'<>%1','');
                if  ProgrammeEvalSubComponent.FindSet then begin
                repeat
                //increment code
                       LineNo:=0;
                        ApplicationLines.Reset;
                        if ApplicationLines.FindLast then
                        begin
                           LineNo:=ApplicationLines.Code;
                        end;
                    ApplicationLines.Init;
                    ApplicationLines.Code:=LineNo+1;
                    ApplicationLines."Application No.":="Application No.";
                    ApplicationLines."Evaluation Header No.":=Code;
                    ApplicationLines."Component Code":=ProgrammeEvalSubComponent."Area Code";
                    ApplicationLines.Validate("Component Code");
                    ApplicationLines."Sub-Component Code":=ProgrammeEvalSubComponent.Code;
                    ApplicationLines.Validate("Sub-Component Code");
                    ApplicationLines."Maximum Score":=ProgrammeEvalSubComponent."Maximum Score";
                    ApplicationLines.Insert;

                 until ProgrammeEvalSubComponent.Next=0;
                end


                end;
                end;
                end
            end;
        }
        field(3;"Application Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Created On";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Approved,Completed';
            OptionMembers = Open,"Pending Approval",Approved,Completed;
        }
        field(7;"Aggregate Score";Decimal)
        {
            CalcFormula = sum("Application Lines".Score where ("Evaluation Header No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Maximum Aggregate Score";Decimal)
        {
            CalcFormula = sum("Application Lines"."Maximum Score" where ("Evaluation Header No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Institution Email";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Insitution Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(13;Strength;Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Meeting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Meeting Link";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(16;"Meeting Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Percentage Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Verdict Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evaluation Verdicts";
        }
        field(19;"Verdict Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Check,Evaluation,Self-Evaluation';
            OptionMembers = Check,Evaluation,"Self-Evaluation";
        }
        field(21;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Complete,Incomplete';
            OptionMembers = Complete,Incomplete;
        }
        field(22;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Accreditation,Development';
            OptionMembers = Accreditation,Development;
        }
        field(23;"Commitee Allocated";Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Resource Accreditation Header";
        }
        field(24;"Commitee Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Examination Technical SubCommitee,Examination Committee,Board Commitee,Stakeholder Feedback';
            OptionMembers = "Examination Technical SubCommitee","Examination Committee","Board Commitee","Stakeholder Feedback";
        }
        field(25;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Board Verdict";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Pass,Fail;
        }
        field(27;"Verdict Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Ordinal Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Review Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Stakeholder Views,1st Workshop,Consecutive Workshop,1st TaskForce,Consecutive TaskForce,ETS Approval,EC Approval,Board Approval,Completed,Terminated';
            OptionMembers = New,"Stakeholder Views","1st Workshop","Consecutive Workshop","1st TaskForce","Consecutive TaskForce","ETS Approval","EC Approval","Board Approval",Completed,Terminated;
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
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Monitoring Evaluation Nos.");
        if Code='' then begin
          NoSeriesManagement.InitSeries(ExaminationSetup."Monitoring Evaluation Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;

        "Created By":=UserId;
        "Created On":=Today;
    end;

    var
        AccreditationApplication: Record "Monitoring Application";
        ApplicationLines: Record "Monitoring Lines";
        ApplicationLines1: Record "Monitoring Lines";
        LineNo: Integer;
        ProgrammeEvalSubComponent: Record "Monitoring Sub-Areas";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExaminationSetup: Record "Examination Setup";
}

