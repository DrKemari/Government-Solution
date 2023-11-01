report 50006 "Modify Exam Account Reg Nos"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modify Exam Account Reg Nos.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {

            trigger OnAfterGetRecord()
            var
                fName: Text;
                mName: Text;
                lName: Text;
            begin
                
                /*"Center Course Capacity".VALIDATE("Center Course Capacity"."Centre Code");
                "Center Course Capacity".MODIFY;*/
                
                /*
                BeforeDate:=010821D;
                
                IF "Examination Account"."Registration Date"<BeforeDate THEN BEGIN
                      RegNo:="Examination Account"."Registration No.";
                      NewString:=COPYSTR(RegNo,5,7);
                      RegNoPrefix:=COPYSTR(RegNo,1,4);
                      ConvertedString:=DELCHR(NewString,'<','0');
                      NewRegNo:=RegNoPrefix+ConvertedString;
                
                      IF (NewRegNo<>"Examination Account"."Registration No.") THEN BEGIN
                        //Update Student Remarks
                         StudentRemarks.RESET;
                         StudentRemarks.SETRANGE("Registration No.","Examination Account"."Registration No.");
                         IF StudentRemarks.FINDFIRST THEN BEGIN
                            REPEAT
                              StudentRemarks."Registration No.":=NewRegNo;
                              StudentRemarks.MODIFY;
                            UNTIL StudentRemarks.NEXT=0;
                         END;
                        //Update Student Renewals Entries
                         StudentRenewalEntries.RESET;
                         StudentRenewalEntries.SETRANGE("Stud. Reg. No","Examination Account"."Registration No.");
                         IF StudentRenewalEntries.FINDFIRST THEN BEGIN
                            REPEAT
                              StudentRenewalEntries."Stud. Reg. No":=NewRegNo;
                              StudentRenewalEntries.MODIFY;
                            UNTIL StudentRenewalEntries.NEXT=0;
                         END;
                
                        //Update Exam Booking Entries
                        { ExamBookingEntries.RESET;
                         ExamBookingEntries.SETRANGE("Student Reg No.","Examination Account"."Registration No.");
                         IF ExamBookingEntries.FINDFIRST THEN BEGIN
                            REPEAT
                              ExamBookingEntries."Student Reg No.":=NewRegNo;
                              ExamBookingEntries.MODIFY;
                            UNTIL ExamBookingEntries.NEXT=0;
                         END;}
                
                
                        //Insert the New Accounts
                        ExaminationAccount.INIT;
                        ExaminationAccount."Registration No.":=NewRegNo;
                        ExaminationAccount.TRANSFERFIELDS("Examination Account",FALSE);
                        IF ExaminationAccount.INSERT=TRUE THEN BEGIN
                           "Examination Account".DELETE;
                        END;
                      END;
                END;
                */
                
                /*
                ExaminationAccount.RESET;
                ExaminationAccount.SETRANGE("Registration No.","Accounts Buffer"."Reg No");
                IF ExaminationAccount.FINDSET THEN BEGIN
                   ExaminationAccount."Student Cust No.":="Accounts Buffer"."Student No";
                   ExaminationAccount.VALIDATE("Student Cust No.");
                   ExaminationAccount.MODIFY;
                END; */
                
                /*
                "Examination Results".VALIDATE("Student Reg No.");
                "Examination Results".VALIDATE(Paper);
                "Examination Results".MODIFY;
                */
                
                /*"Examination Results".Passed:=TRUE;
                "Examination Results".MODIFY;*/
                Exam.ApplicationAssignRegistrationNo("Student Processing Header");

            end;

            trigger OnPostDataItem()
            begin
                Message('Data Updated Successfully');
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
        CenterBuffer: Record "Surface Type";
        ExaminationAccount: Record "Examination Account";
        CustomerM: Record Customer;
        RegNo: Code[30];
        NewString: Code[7];
        RegNoPrefix: Code[4];
        ConvertedString: Code[10];
        NewRegNo: Code[10];
        "/////////New Account//////": Integer;
        ExaminationResults: Record "Examination Results";
        StudentRemarks: Record "Student Remarks";
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentRenewalEntries: Record "Student Renewal Entries";
        BeforeDate: Date;
        Exam: Codeunit Examination;
}

