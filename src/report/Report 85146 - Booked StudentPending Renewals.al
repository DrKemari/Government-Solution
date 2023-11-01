report 85146 "Booked StudentPending Renewals"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Booked StudentPending Renewals.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            RequestFilterFields = "Document Type","Examination Sitting",Posted;
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationCenterCode_StudentProcessingHeader;"Student Processing Header"."Examination Center Code")
            {
            }
            column(ExaminationCenter_StudentProcessingHeader;"Student Processing Header"."Examination Center")
            {
            }
            column(ShowValue;ShowValue)
            {
            }
            column(Part_StudentProcessingLines;PartID)
            {
            }

            trigger OnAfterGetRecord()
            begin
                ShowValue:=false;
                PartID:='';
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Student Processing Header"."Student Reg. No.");
                if ExaminationAccount.FindFirst then begin
                  if ExaminationAccount."Renewal Amount">0 then begin
                    ShowValue:=true;
                    StudentProcessingLines.Reset;
                    StudentProcessingLines.SetRange("Booking Header No.","Student Processing Header"."No.");
                    StudentProcessingLines.SetRange("Transaction Type",StudentProcessingLines."Transaction Type"::Booking);
                    if StudentProcessingLines.FindFirst then begin
                      PartID:=StudentProcessingLines.Part;
                    end
                  end;

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
        ShowValue: Boolean;
        StudentProcessingLines: Record "Student Processing Lines";
        PartID: Code[30];
}

