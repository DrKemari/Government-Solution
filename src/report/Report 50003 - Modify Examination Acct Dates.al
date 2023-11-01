report 50003 "Modify Examination Acct Dates"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modify Examination Acct Dates.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            RequestFilterFields = "Document Type",Posted;

            trigger OnAfterGetRecord()
            begin
                /*"Student Renewal Entries".VALIDATE("Student Renewal Entries"."Stud. Reg. No");
                "Student Renewal Entries".VALIDATE("Student Renewal Entries"."Course Id");
                "Student Renewal Entries".MODIFY;*/
                /*
                RenewalEntries.RESET;
                RenewalEntries.SETRANGE("Exam RegNo","Examination Account"."Registration No.");
                //RenewalEntries.SETRANGE("Reg Date","Examination Account"."Student Cust No.");
                IF RenewalEntries.FINDFIRST THEN BEGIN
                  IF RenewalEntries."Reg Date"<>0D THEN
                    BEGIN
                     "Examination Account"."Registration Date":=RenewalEntries."Reg Date";
                    // "Examination Account".Status:=RenewalEntries.Status;
                  // "Examination Account"."Next Renewal Date":=RenewalEntries."Next Renewal Date";
                  //  "Examination Account".VALIDATE("Examination Account"."Next Renewal Date");
                    "Examination Account".MODIFY;
                    END;
                END;
                
                */
                
                /*
                ExaminationAccount.RESET;
                ExaminationAccount.SETRANGE("Registration No.","Examination Results"."Student Reg No.");
                IF ExaminationAccount.FIND('-') THEN BEGIN
                   REPEAT
                    "Examination Results".VALIDATE("Examination Results"."Student Reg No.");
                   // "Examination Results".VALIDATE("Examination Results".Paper);
                    "Examination Results".MODIFY;
                  UNTIL ExaminationAccount.NEXT=0;
                END;
                */
                
                /*
                ExaminationResultsBuffer.RESET;
                ExaminationResultsBuffer.SETRANGE("Line No.","Examination Results"."Line No.");
                ExaminationResultsBuffer.SETRANGE("Student Reg No.","Examination Results"."Student Reg No.");
                IF ExaminationResultsBuffer.FIND('-') THEN BEGIN
                  "Examination Results".Part:=ExaminationResultsBuffer.Part;
                  "Examination Results".Section:=ExaminationResultsBuffer.Section;
                  "Examination Results".MODIFY;
                
                END;*/
                
                
                
                /*
                ExaminationAccount.RESET;
                ExaminationAccount.SETRANGE("Registration No.","Student Remarks"."Registration No.");
                IF ExaminationAccount.FIND('-') THEN BEGIN
                   "Student Remarks"."Student No.":=ExaminationAccount."Student Cust No.";
                   //"Student Remarks".VALIDATE("Student Remarks"."Student No.");
                    //"Examination Results".VALIDATE("Examination Results".Paper);
                    "Student Remarks".MODIFY;
                END;
                
                */
                /*
                ExaminationAccount.RESET;
                ExaminationAccount.SETRANGE("Registration No.","Exam Booking Entries"."Student Reg No.");
                IF ExaminationAccount.FIND('-') THEN BEGIN
                   REPEAT
                    "Exam Booking Entries".VALIDATE("Exam Booking Entries"."Student Reg No.");
                   // "Examination Results".VALIDATE("Examination Results".Paper);
                    "Exam Booking Entries".MODIFY;
                  UNTIL ExaminationAccount.NEXT=0;
                END;*/
                /*"Center Course Capacity".VALIDATE("Center Course Capacity"."Centre Code");
                "Center Course Capacity".MODIFY;*/
                
                "Student Processing Header".Validate("Student Processing Header"."Student No.");
                "Student Processing Header".Modify;

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
        RenewalEntries: Record "Road Classes";
        ExaminationAccount: Record "Examination Account";
        ExaminationResultsBuffer: Record "Fund Types";
        Exam: Codeunit Examination;
}

