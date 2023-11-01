#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51211 "Proposal Document Headr"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Accreditation No.";Code[30])
        {
            TableRelation = "Ins. Accreditation Table" where (Status=filter(<>"Awaiting Payment Processing"));

            trigger OnValidate()
            begin
                if InsAccreditation.Get("Accreditation No.") then begin
                      "Institution No.":=InsAccreditation."Institution No.";
                      "Institution Name":=InsAccreditation."Institution Name.";
                      "Campus No.":=InsAccreditation."Insitution Campus No.";
                      "Campus Name":=InsAccreditation."Institution Campus";
                    "Institution Email":=InsAccreditation.Email;
                    end;
                   //Insert Topics and Sub-Topics
                   SubTopics.Reset;
                   SubTopics.SetFilter(Code,'<>%1','');
                   if SubTopics.FindSet then begin
                     repeat
                       EvaluationComments."Line No.":=EvaluationComments."Line No."+10;
                       EvaluationComments."Application No.":= "Accreditation No.";
                       EvaluationComments."Sub-Topic Code":=SubTopics.Code;
                       EvaluationComments."Sub-Topic Name":=SubTopics.Description;
                      // EvaluationComments.VALIDATE("Sub-Topic Code");
                       EvaluationComments."Topic Code":=SubTopics."Topic Code";
                      // EvaluationComments.VALIDATE("Topic Code");
                
                       EvaluationComments.Insert(true);
                    until SubTopics.Next=0;
                
                end;
                
                
                /*IF ProgramAccreditationTable.GET("Application No.") THEN BEGIN
                "Application Description":=ProgramAccreditationTable."Program Name.";
                  "Institution Email":=ProgramAccreditationTable.Email;
                  "Institution Name":=ProgramAccreditationTable."Institution Name.";
                
                END;
                //Insert components and sub-component lines
                      ProgrammeEvalSubComponent.RESET;
                      ProgrammeEvalSubComponent.SETFILTER(Code,'<>%1','');
                      IF ProgrammeEvalSubComponent.FINDSET THEN BEGIN
                       REPEAT
                         ProgrammeEvaluationLines.Code:=ProgrammeEvaluationLines.Code+10;
                          ProgrammeEvaluationLines."Application No.":="Application No.";
                          ProgrammeEvaluationLines."Evaluation Header No.":=Code;
                          ProgrammeEvaluationLines."Component Code":=ProgrammeEvalSubComponent."Component Code";
                          ProgrammeEvaluationLines.VALIDATE("Component Code");
                          ProgrammeEvaluationLines."Sub-Component Code":=ProgrammeEvalSubComponent.Code;
                          ProgrammeEvaluationLines.VALIDATE("Sub-Component Code");
                          ProgrammeEvaluationLines.INSERT(TRUE);
                      UNTIL ProgrammeEvalSubComponent.NEXT=0;
                
                      END;
                    */

            end;
        }
        field(3;"Institution No.";Code[30])
        {
        }
        field(4;"Institution Name";Text[30])
        {
        }
        field(5;"Campus No.";Code[30])
        {
        }
        field(6;"Campus Name";Text[30])
        {
        }
        field(7;"Created By";Code[30])
        {
        }
        field(8;"Created On";Date)
        {
        }
        field(9;Submitted;Boolean)
        {
        }
        field(10;Revision;Boolean)
        {
        }
        field(11;"No Series";Code[30])
        {
        }
        field(12;"Institution Email";Text[30])
        {
        }
        field(13;Verdict;Option)
        {
            OptionCaption = 'Minor Revamp,Major Revamp,Redesign';
            OptionMembers = "Minor Revamp","Major Revamp",Redesign;
        }
        field(14;"Document Status";Option)
        {
            OptionCaption = ' ,Complete,Incomplete';
            OptionMembers = " ",Complete,Incomplete;
        }
        field(15;Published;Boolean)
        {
        }
        field(16;Status;Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Completed';
            OptionMembers = Open,"Pending Approval",Released,Completed;
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
        AccreditationSetups.Get();
          if Code='' then begin
          NoSeriesMgt.InitSeries(AccreditationSetups."Proposal Document Nos.",xRec."No Series",0D,Code,"No Series");
        end;
        "Created By":=UserId;
        "Created On":=Today;
    end;

    var
        InsAccreditation: Record "Ins. Accreditation Table";
        AccreditationSetups: Record "Accreditation Setups";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SubTopics: Record "Proposal Document Sub-Topic";
        EvaluationComments: Record "Proposal Document Template";
}

