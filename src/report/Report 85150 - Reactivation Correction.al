report 85150 "Reactivation Correction"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reactivation Correction.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }
            column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ResourcePrice.Reset;
                ResourcePrice.SetRange(Course,"Examination Account"."Course ID");
                ResourcePrice.SetRange("Currency Code","Examination Account"."Currency Code");
                ResourcePrice.SetRange("Document Type",ResourcePrice."Document Type"::"Re-Activation");
                if ResourcePrice.FindFirst then begin
                  CorrectAmount:=ResourcePrice."Unit Price";
                  if CorrectAmount<>"Examination Account"."Re-Activation Amount" then
                    begin
                      "Examination Account"."Re-Activation Amount":=CorrectAmount;
                      "Examination Account".Modify(true);

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
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
        CorrectAmount: Decimal;
}

