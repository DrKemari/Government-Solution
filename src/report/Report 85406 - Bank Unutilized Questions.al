report 85406 "Bank Unutilized Questions"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Setter Marks Per Question";"Setter Marks Per Question")
        {
            column(DocumentNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Document No.")
            {
            }
            column(LineNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Line No.")
            {
            }
            column(EntryNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Entry No.")
            {
            }
            column(QuestionNo_SetterMarksPerQuestion;"Setter Marks Per Question"."Question No.")
            {
            }
            column(SetterCode_SetterMarksPerQuestion;"Setter Marks Per Question"."Setter Code")
            {
            }
            column(SetterName_SetterMarksPerQuestion;"Setter Marks Per Question"."Setter Name")
            {
            }
            column(MarksAwarded_SetterMarksPerQuestion;"Setter Marks Per Question"."Marks Awarded")
            {
            }
            column(Contributed_SetterMarksPerQuestion;"Setter Marks Per Question".Contributed)
            {
            }

            trigger OnAfterGetRecord()
            begin

                //check if questions for the selected sitting are present
                 SetPapersBank1.Reset;
                 SetPapersBank1.SetRange("Examination Sitting",SittingCycle);
                 if SetPapersBank1.FindFirst then
                   Error(TXT002);
                ReviewVoucher.Reset;
                ReviewVoucher.SetRange("Document Type",ReviewVoucher."Document Type"::Moderator);
                ReviewVoucher.SetRange("Examination Sitting",SittingCycle);
                ReviewVoucher.SetRange("Document No.","Setter Marks Per Question"."Document No.");
                if ReviewVoucher.FindSet then begin
                repeat
                 // MESSAGE('found moderator');
                  //insert in bank
                  SetPapersBank1.Reset;
                  if SetPapersBank1.FindLast then
                    EntryNo:=SetPapersBank1."Line No.";
                  SetterHeader.Reset;
                  SetterHeader.SetRange("Examiner Code","Setter Marks Per Question"."Setter Code");
                  SetterHeader.SetRange("Examination Sitting",SittingCycle);
                  SetterHeader.SetRange("Document Type",SetterHeader."Document Type"::"Setter Specification");
                 // SetterHeader.SETRANGE(Submitted,TRUE);
                  if SetterHeader.FindFirst then begin
                     //MESSAGE('found setter');
                      SetterQuestion.Reset;
                      SetterQuestion.SetRange("Document No.",SetterHeader."Document No.");
                      if SetterQuestion.FindFirst then begin
                        // MESSAGE('found question');
                          SetPapersBank.Init;
                          SetPapersBank."Line No.":=EntryNo+1;
                          //SetPapersBank."Document No.":=
                          SetPapersBank.Examination:=SetterHeader.Examination;
                          SetPapersBank.Validate(Examination);
                          SetPapersBank."Setter Code":="Setter Marks Per Question"."Setter Code";
                          SetPapersBank."Setter Name":="Setter Marks Per Question"."Setter Name";
                          SetPapersBank."Paper Code":=ReviewVoucher."Paper Code";
                          SetPapersBank."Paper Name":=ReviewVoucher."Paper Name";
                          SetPapersBank."Question No.":="Setter Marks Per Question"."Question No.";
                          SetPapersBank."Document No.":=SetterHeader."Document No.";
                          SetPapersBank."Topic Code":=SetterQuestion."Topic Code";
                          SetPapersBank."Topic Name":=SetterQuestion."Topic Name";
                          SetPapersBank.Insert(true);
                      end
                   end

                until ReviewVoucher.Next=0;
                end
            end;

            trigger OnPreDataItem()
            begin
                "Setter Marks Per Question".SetRange(Contributed,false);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Examination Sitting";SittingCycle)
                {
                    ShowMandatory = true;
                    TableRelation = "Exam Sitting Cycle" WHERE (Closed=CONST(false));
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        Message(TXT003,SittingCycle);
    end;

    trigger OnPreReport()
    begin
        if SittingCycle='' then
        Error(TXT001);
    end;

    var
        SittingCycle: Code[30];
        SetterQuestion: Record "Examination Review Lines";
        SetPapersBank: Record "Set Papers Bank";
        EntryNo: Integer;
        TXT001: Label 'Kindly select the sitting cycle you want to bank its questions';
        ReviewVoucher: Record "Examination Review Voucher";
        SetPapersBank1: Record "Set Papers Bank";
        SetterHeader: Record "Setter Header";
        TXT002: Label 'Questions for the sitting %1,have already  been banked';
        TXT003: Label 'Questions for the sitting %1,have been banked succesfully';
}

