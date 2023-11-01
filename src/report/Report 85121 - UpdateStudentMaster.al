report 85121 UpdateStudentMaster
{
    DefaultLayout = RDLC;
    RDLCLayout = './UpdateStudentMaster.rdlc';

    dataset
    {
        dataitem("Update Student Details";"Update Student Details")
        {
            column(RegistrationNo_UpdateStudentDetails;"Update Student Details"."Registration No.")
            {
            }
            column(IDNo_UpdateStudentDetails;"Update Student Details"."ID No.")
            {
            }
            column(Email_UpdateStudentDetails;"Update Student Details".Email)
            {
            }
            column(PhoneNo_UpdateStudentDetails;"Update Student Details"."Phone No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //customer

                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Update Student Details"."Registration No.");
                if ExaminationAccount.FindSet then begin
                  repeat
                  ExaminationAccount.Email:="Update Student Details".Email;
                  ExaminationAccount."Phone No.":="Update Student Details"."Phone No.";
                  ExaminationAccount."ID No.":="Update Student Details"."ID No.";
                  ExaminationAccount.Modify(true);
                  until ExaminationAccount.Next=0;

                Customer.Reset;
                Customer.SetRange("No.",ExaminationAccount."Student Cust No.");
                if Customer.FindFirst then begin
                  Customer."ID. No.":="Update Student Details"."ID No.";
                  Customer."E-Mail":="Update Student Details".Email;
                  Customer."Phone No.":="Update Student Details"."Phone No.";
                  Customer.Modify(true);
                      DynasoftPortalUser.Reset;
                      DynasoftPortalUser.SetRange("Authentication Email",Customer."E-Mail");
                      DynasoftPortalUser.SetRange(State,DynasoftPortalUser.State::Enabled);
                      if DynasoftPortalUser.FindFirst then begin
                          DynasoftPortalUser."Id Number":="Update Student Details"."ID No.";
                          DynasoftPortalUser.Modify(true);
                      end;
                end;

                end;

                StudentProcessingHeader.Reset;
                StudentProcessingHeader.SetRange("Student Reg. No.","Update Student Details"."Registration No.");
                if StudentProcessingHeader.FindSet then begin
                repeat
                  StudentProcessingHeader.Email:="Update Student Details".Email;
                  StudentProcessingHeader."Phone No.":="Update Student Details"."Phone No.";
                  StudentProcessingHeader."ID Number/Passport No.":="Update Student Details"."ID No.";
                  StudentProcessingHeader.Modify(true);
                until StudentProcessingHeader.Next=0;
                end;


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
        Customer: Record Customer;
        ExaminationAccount: Record "Examination Account";
        DynasoftPortalUser: Record "Dynasoft Portal User";
        StudentProcessingHeader: Record "Student Processing Header";
}

