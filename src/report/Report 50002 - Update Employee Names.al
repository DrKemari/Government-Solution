report 50002 "Update Employee Names"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Employee Names.rdlc';

    dataset
    {
        dataitem("G/L Entry";"G/L Entry")
        {

            trigger OnAfterGetRecord()
            begin
                if "G/L Entry"."Source Type"="G/L Entry"."Source Type"::Employee then begin
                  Employee.Reset;
                  Employee.SetRange("No.","G/L Entry"."Source No.");
                  if Employee.Find('-') then begin
                    "G/L Entry".Name:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                    "G/L Entry".Modify;
                  end;
                end;

                if "G/L Entry"."Source Type"="G/L Entry"."Source Type"::Vendor then begin
                  Vendor.Reset;
                  Vendor.SetRange("No.","G/L Entry"."Source No.");
                  if Vendor.Find('-') then begin
                    "G/L Entry".Name:=Vendor.Name;
                    "G/L Entry".Modify;
                  end;
                end;

                if "G/L Entry"."Source Type"="G/L Entry"."Source Type"::Customer then begin
                  Customer.Reset;
                  Customer.SetRange("No.","G/L Entry"."Source No.");
                  if Customer.Find('-') then begin
                    "G/L Entry".Name:=Customer.Name;
                    "G/L Entry".Modify;
                  end;
                end;



                /////////////////////////////////////////////////////////////////////////////

                Payments.Reset;
                Payments.SetRange("No.","G/L Entry"."Document No.");
                if Payments.Find('-') then begin
                   "G/L Entry".Name:=Payments."Account Name";
                    "G/L Entry"."Description 2":=Payments."Payment Narration";
                    "G/L Entry".Modify;
                end;


                Payments.Reset;
                Payments.SetRange("Payment Type",Payments."Payment Type"::"Standing Imprest Surrender");
                Payments.SetRange("No.","G/L Entry"."Document No.");
                if Payments.Find('-') then begin
                   "G/L Entry".Name:=Payments."Account Name";
                   "G/L Entry"."Description 2":=Payments."Payment Narration";
                    "G/L Entry".Modify;
                end;
                // Staff Claim
                Payments.Reset;
                Payments.SetRange("Payment Type",Payments."Payment Type"::"Staff Claim");
                Payments.SetRange("No.","G/L Entry"."Document No.");
                if Payments.Find('-') then begin
                   "G/L Entry".Name:=Payments."Account Name";
                   "G/L Entry"."Description 2":=Payments."Payment Narration";
                    "G/L Entry".Modify;
                end;
                // Staff Claim Reversal
                Payments.Reset;
                Payments.SetRange("Payment Type",Payments."Payment Type"::"Staff Claim Reversal");
                Payments.SetRange("No.","G/L Entry"."Document No.");
                if Payments.Find('-') then begin
                   "G/L Entry".Name:=Payments."Account Name";
                   "G/L Entry"."Description 2":=Payments."Payment Narration";
                    "G/L Entry".Modify;
                end;
                Payments.Reset;
                Payments.SetRange("Document Type",Payments."Document Type"::Surrender);
                Payments.SetRange("No.","G/L Entry"."Document No.");
                if Payments.Find('-') then begin
                  PaymentsX.Reset;
                  PaymentsX.SetRange("No.",Payments."Imprest Issue Doc. No");
                  if PaymentsX.Find('-') then begin
                   "G/L Entry".Name:=PaymentsX."Account Name";
                   "G/L Entry"."Description 2":=PaymentsX."Payment Narration";
                    "G/L Entry".Modify;
                    end;
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
        Employee: Record Employee;
        Vendor: Record Vendor;
        Customer: Record Customer;
        Payments: Record Payments;
        PaymentsX: Record Payments;
}

