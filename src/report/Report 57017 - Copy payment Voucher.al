report 57017 "Copy payment Voucher"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Payments;Payments)
        {

            trigger OnAfterGetRecord()
            begin
                 DocNo:=Payments."No.";
                 //ValidateDocNo;
                 DocType:=Payments."Payment Type";
            end;

            trigger OnPostDataItem()
            begin
                 //ValidateDocNo;
            end;

            trigger OnPreDataItem()
            begin
                 /*DocNo:=Payments."No.";
                 ValidateDocNo;*/

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentNo;DocNo)
                    {
                        ApplicationArea = Basic,Suite;
                        Caption = 'Document No.';
                        ToolTip = 'Specifies the number of the document that is processed by the report or batch job.';

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            //LookupDocNo;
                        end;

                        trigger OnValidate()
                        begin
                            ValidateDocNo;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnClosePage()
        begin
            //DocNo:=Payments."No.";
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        /*IF DocNo <> '' THEN BEGIN
           IF FromPayments.GET(DocNo) THEN
           IF FromPayments."No." = '' THEN
            DocNo := '';
          END;*/

    end;

    trigger OnPreReport()
    begin
        //CLEARALL;
    end;

    var
        DocNo: Code[20];
        Payments1: Record Payments;
        FromPayments: Record Payments;
        DocNoOccurrence: Integer;
        DocVersionNo: Integer;
        FromPaymentsHeader: Record Payments;
        IncludeHeader: Boolean;
        LookupDocNo: Integer;
        ToPaymentsHeader1: Record Payments;
        ToPaymentsHeader: Page "Payment Reversal Voucher";
        TopaymentsLines: Record "PV Lines";
        FromPaymentsLines: Record "PV Lines";
        DocType: Option "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,"Standing Imprest","Salary Advance","Payment Voucher Reversal","Imprest Reversal","Staff Claim Reversal","Imprest Surrender Reversal","Petty Cash Reversal","Bank Transfer Reversal","Petty Cash Surrender Reversal","Surrender Reversal","Standing Imprest Reversal","Salary Advance Reversal";

    local procedure ValidateDocNo()
    var
        DocType2: Option Quote,"Blanket Order","Order",Invoice,"Return Order","Credit Memo","Posted Receipt","Posted Invoice","Posted Return Shipment","Posted Credit Memo";
    begin
         DocNo:=Payments."No.";
         DocType:=Payments."Document Type";
        Message('%1',DocNo);

        if DocNo = '' then begin
         DocNo:=Payments."No.";
         if  FromPaymentsHeader.Get(DocNo) then begin
                ToPaymentsHeader1.Reset;
                ToPaymentsHeader1.Init;
               ToPaymentsHeader1.Copy(FromPaymentsHeader);
               case DocType of
              DocType::"Payment Voucher":
                begin
               ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Payment Voucher Reversal";
                end;
                 DocType::"Petty Cash":
                   begin
                ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Petty Cash Reversal";
                     end;
                 end;
                ToPaymentsHeader1."No.":='';
                ToPaymentsHeader1.Posted:=false;
                //ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Payment Voucher Reversal";
                ToPaymentsHeader1."Original Document No":=DocNo;
                ToPaymentsHeader1.Status:=ToPaymentsHeader1.Status::Open;
                if ToPaymentsHeader1.Insert(true) then begin
                    //insert lines
                 FromPaymentsLines.Reset;
                 FromPaymentsLines.SetRange(No,DocNo);
                 if FromPaymentsLines.FindSet then begin
                   repeat
                  TopaymentsLines.Copy(FromPaymentsLines);
                  TopaymentsLines.No:=ToPaymentsHeader1."No.";
                  TopaymentsLines.Insert;
                  until FromPaymentsLines.Next=0;
                  end;
                end;
                ToPaymentsHeader.SetRecord(ToPaymentsHeader1);
                ToPaymentsHeader.Run;

               end;
        end else
          if DocNo <> Payments."No." then begin

           if  FromPaymentsHeader.Get(DocNo) then begin
                ToPaymentsHeader1.Reset;
                ToPaymentsHeader1.Init;
               ToPaymentsHeader1.Copy(FromPaymentsHeader);
                case DocType of
              DocType::"Payment Voucher":
                begin
               ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Payment Voucher Reversal";
                end;
                 DocType::"Petty Cash":
                   begin
                ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Petty Cash Reversal";
                     end;
                 end;
                ToPaymentsHeader1."No.":='';
                ToPaymentsHeader1.Posted:=false;
                ToPaymentsHeader1."Original Document No":=DocNo;
                //ToPaymentsHeader1."Payment Type":=ToPaymentsHeader1."Payment Type"::"Payment Voucher Reversal";
                ToPaymentsHeader1.Status:=ToPaymentsHeader1.Status::Open;
                if ToPaymentsHeader1.Insert(true) then begin
                    //insert lines
                 FromPaymentsLines.Reset;
                 FromPaymentsLines.SetRange(No,DocNo);
                 if FromPaymentsLines.FindSet then begin
                   repeat
                  TopaymentsLines.Copy(FromPaymentsLines);
                  TopaymentsLines.No:=ToPaymentsHeader1."No.";
                  TopaymentsLines.Insert;
                  until FromPaymentsLines.Next=0;
                  end;
                end;
                ToPaymentsHeader.SetRecord(ToPaymentsHeader1);
                ToPaymentsHeader.Run;

               end;
          end;
          ToPaymentsHeader1."No.":=''
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateIncludeHeader(var DoIncludeHeader: Boolean)
    begin
    end;

    [Scope('Personalization')]
    procedure SetPaymentHeader(var NewPaymentHeader: Record Payments)
    begin
        NewPaymentHeader.TestField("No.");
        Payments := NewPaymentHeader;
         DocNo:=Payments."No.";
         ValidateDocNo;
    end;

    local procedure InsertDocNo(Pay: Record Payments)
    begin
        ToPaymentsHeader1:=FromPaymentsHeader;
    end;
}

