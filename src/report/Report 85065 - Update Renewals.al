report 85065 "Update Renewals"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Renewals.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(FirstName_StudentProcessingHeader;"Student Processing Header"."First Name")
            {
            }
            column(MiddleName_StudentProcessingHeader;"Student Processing Header"."Middle Name")
            {
            }
            column(Surname_StudentProcessingHeader;"Student Processing Header".Surname)
            {
            }
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(ExaminationCenterCode_StudentProcessingHeader;"Student Processing Header"."Examination Center Code")
            {
            }
            column(ExaminationCenter_StudentProcessingHeader;"Student Processing Header"."Examination Center")
            {
            }
            column(HighestAcademicQCode_StudentProcessingHeader;"Student Processing Header"."Highest Academic QCode")
            {
            }
            column(HighestAcademicQualification_StudentProcessingHeader;"Student Processing Header"."Highest Academic Qualification")
            {
            }
            column(Gender_StudentProcessingHeader;"Student Processing Header".Gender)
            {
            }
            column(DateofBirth_StudentProcessingHeader;"Student Processing Header"."Date of Birth")
            {
            }
            column(Disabled_StudentProcessingHeader;"Student Processing Header".Disabled)
            {
            }
            column(NCPWDNo_StudentProcessingHeader;"Student Processing Header"."NCPWD No.")
            {
            }

            trigger OnAfterGetRecord()
            var
                RenewalEntries: Record "Student Renewal Entries";
                TotalPaid: Decimal;
                TotaltobePaid: Decimal;
                SalesInvoiceHeader: Record "Sales Invoice Header";
                Renewal: Decimal;
                RenewalValue: Decimal;
            begin
                 ProcessingLines.Reset;
                 //ProcessingLines.SETRANGE("Transaction Type",ProcessingLines."Transaction Type"::Renewal);
                 ProcessingLines.SetRange("Booking Header No.","Student Processing Header"."No.");
                 if ProcessingLines.FindFirst then  begin
                  //check if renewal is updated
                  ExaminationAccount.Reset;
                  ExaminationAccount.SetRange("Student Cust No.","Student Processing Header"."Student No.");
                  ExaminationAccount.SetRange("Registration No.",ProcessingLines."Registration No.");
                  if ExaminationAccount.FindFirst then begin
                      if (ExaminationAccount."Renewal Pending">0 ) and (ExaminationAccount."Renewal Amount"<>0) then begin
                        Examination.RenewalUpdateDetails("Student Processing Header");
                       end;
                       if (ExaminationAccount."Renewal Pending">0 ) and (ExaminationAccount."Renewal Amount"=0) then begin
                      ExaminationAccount."Renewal Pending":=0;
                         ExaminationAccount.Modify(true);
                      end
                     end
                  end

                 //
                 //     //get total amount
                 //     "Student Processing Header".CALCFIELDS("Student Processing Header"."Booking Amount");
                 //     TotaltobePaid:="Student Processing Header"."Booking Amount";
                 //     SalesInvoiceHeader.RESET;
                 //     SalesInvoiceHeader.SETRANGE("External Document No.","Student Processing Header"."No.");
                 //     IF SalesInvoiceHeader.FINDFIRST THEN BEGIN
                 //       SalesInvoiceHeader.CALCFIELDS(Amount);
                 //       TotalPaid:=SalesInvoiceHeader.Amount;
                 //      END;
                 //      IF NOT ( TotalPaid<TotaltobePaid)
                 //         THEN BEGIN
                 //        Examination.BookingRenewalUpdateDetails("Student Processing Header");
                 //      END

                // Renewal:=0;
                // IF ("Examination Account"."Course ID"='CPA') OR ("Examination Account"."Course ID"='CS') OR ("Examination Account"."Course ID"='CIFA') THEN BEGIN
                //  Renewal:=2000;
                // END ELSE IF ("Examination Account"."Course ID"='ATD') THEN BEGIN
                //  Renewal:=1600;
                // END;
                //  RenewalValue:="Examination Account"."Renewal Pending"*Renewal;
                // Header.RESET;
                // Header.SETRANGE("Student No.","Examination Account"."Student Cust No.");
                // Header.SETRANGE("Document Type",Header."Document Type"::Renewal);
                //       IF Header.FINDFIRST THEN BEGIN
                //         Header.CALCFIELDS("Renewal Amount");
                //               IF NOT  (Header."Renewal Amount"<RenewalValue) THEN BEGIN
                //                 "Examination Account"."Renewal Pending":=0;
                //                 "Examination Account"."Renewal Amount":=0;
                //                 "Examination Account"."Re-Activation Amount":=0;
                //                 "Examination Account".Status:="Examination Account".Status::Active;
                //                 "Examination Account".MODIFY(TRUE);
                //                END
                //        END;
            end;

            trigger OnPreDataItem()
            begin
                //510
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ProcessingLines: Record "Student Processing Lines";
        ExaminationAccount: Record "Examination Account";
        Examination: Codeunit Examination;
        Header: Record "Student Processing Header";
}

