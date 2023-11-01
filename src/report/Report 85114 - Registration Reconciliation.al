report 85114 "Registration Reconciliation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Registration Reconciliation.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(Registration),Posted=FILTER(false));
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(CreatedBy_StudentProcessingHeader;"Student Processing Header"."Created By")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(VisibleDetails;VisibleDetails)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //check for registration
                VisibleDetails:=true;
                if "Student Processing Header"."ID Number/Passport No."<>'' then begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Course ID","Student Processing Header"."Examination ID");
                ExaminationAccount.SetRange("ID No.","Student Processing Header"."ID Number/Passport No.");
                if ExaminationAccount.FindFirst then
                begin
                  VisibleDetails:=false;
                end
                end;

                if VisibleDetails=false then
                begin
                  //mark the document as archived
                  "Student Processing Header".Archived:=true;
                  "Student Processing Header"."Archived By":=UserId;
                  "Student Processing Header"."Archived On":=CurrentDateTime;
                  "Student Processing Header".Modify(true);

                end
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
        ExaminationAccount: Record "Examination Account";
        VisibleDetails: Boolean;
}

