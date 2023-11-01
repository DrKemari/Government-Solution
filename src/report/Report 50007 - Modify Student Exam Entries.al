report 50007 "Modify Student Exam Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Modify Student Exam Entries.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            RequestFilterFields = "Examination ID","Student Reg. No.";

            trigger OnAfterGetRecord()
            var
                fName: Text;
                mName: Text;
                lName: Text;
            begin
                
                // IF ("Exam Booking Entries".Code='') THEN BEGIN
                //  RegNo:="Exam Booking Entries"."Student Reg No.";
                //  NewString:=COPYSTR(RegNo,5,7);
                //  RegNoPrefix:=COPYSTR(RegNo,1,4);
                //  ConvertedString:=DELCHR(NewString,'<','0');
                //  NewRegNo:=RegNoPrefix+ConvertedString;
                //
                //   IF (NewRegNo<>"Exam Booking Entries"."Student Reg No.") THEN BEGIN
                //          //Insert the New Accounts
                //          ExamBookingEntries.INIT;
                //          ExamBookingEntries."Entry No.":="Exam Booking Entries"."Entry No.";
                //          ExamBookingEntries."Student Reg No.":=NewRegNo;
                //          ExamBookingEntries.TRANSFERFIELDS("Exam Booking Entries",FALSE);
                //          IF ExamBookingEntries.INSERT=TRUE THEN BEGIN
                //             "Exam Booking Entries".DELETE;
                //          END;
                //     END;
                //END;
                
                /*ExaminationAccount.RESET;
                ExaminationAccount.SETRANGE("Registration No.","Student Processing Header"."Student Reg. No.");
                IF ExaminationAccount.FINDSET THEN BEGIN
                   IF (ExaminationAccount."Student Cust No."<>"Student Processing Header"."Student No.") THEN BEGIN
                     "Student Processing Header".VALIDATE("Student Processing Header"."Student No.",ExaminationAccount."Student Cust No.");
                     "Student Processing Header".MODIFY;
                
                     END
                   END;*/
                
                
                /*"Student Processing Header"."Posted By":='EMPOWER\ERPPORTAL';
                "Student Processing Header".MODIFY;*/
                
                CustomerM.Reset;
                CustomerM.SetRange("No.","Student Processing Header"."Student No.");
                if CustomerM.FindSet then begin
                if CustomerM.Image.HasValue=true then begin
                if "Student Processing Header".Image.HasValue=false then begin
                "Student Processing Header".Image:=CustomerM.Image;
                "Student Processing Header".Modify;
                end;
                end;
                end;

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
}

