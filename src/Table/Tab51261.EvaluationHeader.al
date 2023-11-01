#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51261 "Evaluation Header"
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
            TableRelation = if ("Document Type"=filter(Accreditation|"Site Visit"|Evaluation)) "Accreditation Application"
                            else if ("Document Type"=filter(Development)) "Syllabus Review"."Application No.";

            trigger OnValidate()
            begin

                if ("Document Type"="document type"::Accreditation ) or ("Document Type"="document type"::"Site Visit")then begin
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
                if (Type=Type::Evaluation) and ("Document Type"<>"document type"::"Site Visit") then begin
                //Insert components and sub-component lines
                ProgrammeEvalSubComponent.Reset;
                ProgrammeEvalSubComponent.SetFilter(Code,'<>%1','');
                ProgrammeEvalSubComponent.SetRange(Type,ProgrammeEvalSubComponent.Type::Evaluation);
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
                    ApplicationLines."Component Code":=ProgrammeEvalSubComponent."Component Code";
                    ApplicationLines.Validate("Component Code");
                    ApplicationLines."Sub-Component Code":=ProgrammeEvalSubComponent.Code;
                    ApplicationLines.Validate("Sub-Component Code");
                    ApplicationLines."Maximum Score":=ProgrammeEvalSubComponent."Maximum Score";
                    ApplicationLines.Insert;

                 until ProgrammeEvalSubComponent.Next=0;
                end


                end;
                if "Document Type"="document type"::"Site Visit" then begin
                //Insert components and sub-component lines
                // ProgrammeEvalSubComponent.RESET;
                // ProgrammeEvalSubComponent.SETFILTER(Code,'<>%1','');
                // ProgrammeEvalSubComponent.SETRANGE(Type,ProgrammeEvalSubComponent.Type::"Site Visit");
                // IF  ProgrammeEvalSubComponent.FINDSET THEN BEGIN
                // REPEAT
                // //increment code
                //       LineNo:=0;
                //        ApplicationLines.RESET;
                //        IF ApplicationLines.FINDLAST THEN
                //        BEGIN
                //           LineNo:=ApplicationLines.Code;
                //        END;
                //    ApplicationLines.INIT;
                //    ApplicationLines.Code:=LineNo+1;
                //    ApplicationLines."Application No.":="Application No.";
                //    ApplicationLines.Type:=ApplicationLines.Type::"Site Visit";
                //    ApplicationLines."Evaluation Header No.":=Code;
                //    ApplicationLines."Component Code":=ProgrammeEvalSubComponent."Component Code";
                //    ApplicationLines.VALIDATE("Component Code");
                //    ApplicationLines."Sub-Component Code":=ProgrammeEvalSubComponent.Code;
                //    ApplicationLines.VALIDATE("Sub-Component Code");
                //    ApplicationLines.Type:=ApplicationLines.Type::"Site Visit";
                //    ApplicationLines.INSERT;
                //
                // UNTIL ProgrammeEvalSubComponent.NEXT=0;
                // END


                end;
                end;
                end else begin
                  SyllabusReview.Reset;
                  SyllabusReview.SetRange("Application No.","Application No.");
                  if SyllabusReview.FindFirst then begin
                    "Application Description":=SyllabusReview.Description;
                    "Syllabus No.":=SyllabusReview."Syllabus No.";

                  end
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
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Type=Type::"Self-Evaluation" then begin
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
                    ApplicationLines."Component Code":=ProgrammeEvalSubComponent."Component Code";
                    ApplicationLines.Validate("Component Code");
                    ApplicationLines."Sub-Component Code":=ProgrammeEvalSubComponent.Code;
                    ApplicationLines.Validate("Sub-Component Code");
                    ApplicationLines."Maximum Score":=ProgrammeEvalSubComponent."Maximum Score";
                    ApplicationLines.Insert;

                 until ProgrammeEvalSubComponent.Next=0;
                end


                end;
            end;
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
            Editable = false;
            OptionCaption = 'Complete,Incomplete';
            OptionMembers = Complete,Incomplete;
        }
        field(22;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Accreditation,Development,Site Visit,Evaluation';
            OptionMembers = Accreditation,Development,"Site Visit",Evaluation;
        }
        field(23;"Commitee Allocated";Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Resource Accreditation Header";
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
        field(30;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.","Resource No.");
                if Resource.FindFirst then begin
                  "Resource Name":=Resource.Name;
                end
            end;
        }
        field(31;"Resource Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Site Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
        }
        field(33;"Draft Syllabus no";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Total Chapter Score";Integer)
        {
            CalcFormula = sum("Application Site Score"."Actual Score" where ("Ápplication No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(35;Recommendation;Text[2048])
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
         AccreditationSetups.Get;
        if "Document Type"="document type"::"Site Visit" then begin
          AccreditationSetups.TestField("Programme Evaluation Nos.");
        if Code='' then begin
          NoSeriesManagement.InitSeries(AccreditationSetups."Programme Evaluation Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;
        end;

        if "Document Type"="document type"::Accreditation then begin
          AccreditationSetups.Get;
                if Type=Type::Evaluation then begin
                  AccreditationSetups.TestField("Programme Evaluation Nos.");
                if Code='' then begin
                  NoSeriesManagement.InitSeries(AccreditationSetups."Programme Evaluation Nos.",xRec."No. Series",0D,Code,"No. Series");
                end;
                end;
                if Type=Type::Check then begin
                  AccreditationSetups.TestField("Completeness Voucher  Nos.");
                if Code='' then begin
                  NoSeriesManagement.InitSeries(AccreditationSetups."Completeness Voucher  Nos.",xRec."No. Series",0D,Code,"No. Series");
                end;
                end;
                if Type=Type::"Self-Evaluation" then begin
                  AccreditationSetups.TestField("Self Evaluation No.");
                if Code='' then begin
                  NoSeriesManagement.InitSeries(AccreditationSetups."Self Evaluation No.",xRec."No. Series",0D,Code,"No. Series");
                end;
                end;
        end;

        if "Document Type"="document type"::Development then begin
           ExaminationSetup.Get;
         if "Commitee Type"="commitee type"::"Examination Committee" then begin

            ExaminationSetup.TestField("EC Feedback Nos.");
            if Code='' then begin
                NoSeriesManagement.InitSeries(ExaminationSetup."EC Feedback Nos.",xRec."No. Series",0D,Code,"No. Series");
            end;
          end;
          if "Commitee Type"="commitee type"::"Examination Technical SubCommitee" then begin

            ExaminationSetup.TestField("ETC Feedback Nos.");
            if Code='' then begin
                NoSeriesManagement.InitSeries(ExaminationSetup."ETC Feedback Nos.",xRec."No. Series",0D,Code,"No. Series");
            end;
          end;
          if "Commitee Type"="commitee type"::"Board Commitee" then begin

            ExaminationSetup.TestField("Board Feedback Nos.");
            if Code='' then begin
                NoSeriesManagement.InitSeries(ExaminationSetup."Board Feedback Nos.",xRec."No. Series",0D,Code,"No. Series");
            end;
          end;
          if "Commitee Type"="commitee type"::"Stakeholder Feedback" then begin

            ExaminationSetup.TestField("Stakeholder Feedback Nos.");
            if Code='' then begin
                NoSeriesManagement.InitSeries(ExaminationSetup."Stakeholder Feedback Nos.",xRec."No. Series",0D,Code,"No. Series");
            end;
          end;
        end;
        "Created By":=UserId;
        "Created On":=Today;
    end;

    var
        AccreditationApplication: Record "Accreditation Application";
        ApplicationLines: Record "Application Lines";
        ApplicationLines1: Record "Application Lines";
        LineNo: Integer;
        ProgrammeEvalSubComponent: Record "Application SubTopics";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        AccreditationSetups: Record "Accreditation Setups";
        ExaminationSetup: Record "Examination Setup";
        SyllabusReview: Record "Syllabus Review";
}

