report 85144 "Renewal Update Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Renewal Update Report.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            column(RenewalPending_ExaminationAccount;"Examination Account"."Renewal Pending")
            {
            }
            column(RenewalAmount_ExaminationAccount;"Examination Account"."Renewal Amount")
            {
            }
            column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
            {
            }
            column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
            {
            }
            column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
            {
            }

            trigger OnAfterGetRecord()
            begin
                RenewalAmt:=0.0;
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Document Type",ResourcePrice."Document Type"::Renewal);
                ResourcePrice.SetRange(Course,"Examination Account"."Course ID");
                ResourcePrice.SetRange("Currency Code","Examination Account"."Currency Code");
                if ResourcePrice.FindSet then begin
                  RenewalAmt:=ResourcePrice."Unit Price";
                  RenewalDetailsUpdate.Reset;
                  RenewalDetailsUpdate.SetRange("Registration No.","Examination Account"."Registration No.");
                  if not RenewalDetailsUpdate.FindSet then begin
                    RenewalDetailsUpdate."Registration No.":="Examination Account"."Registration No.";
                    RenewalDetailsUpdate."Renewal Amount":=RenewalAmt;
                    RenewalDetailsUpdate."Renwal Pending":="Examination Account"."Renewal Pending"+1;
                    RenewalDetailsUpdate.Insert(true);
                
                  end;
                  /*
                  "Examination Account"."Renewal Amount":="Examination Account"."Renewal Amount"+RenewalAmt;
                  "Examination Account"."Renewal Pending":="Examination Account"."Renewal Pending"+1;
                  "Examination Account".MODIFY(TRUE);*/
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
        ResourcePrice: Record "Resource Price";
        RenewalAmt: Decimal;
        RenewalDetailsUpdate: Record "Renewal Details Update";
}

