report 50011 RenM
{
    DefaultLayout = RDLC;
    RDLCLayout = './RenM.rdlc';

    dataset
    {
        dataitem("Examination Account";"Examination Account")
        {
            RequestFilterFields = "Student Cust No.","Course ID";

            trigger OnAfterGetRecord()
            begin
                NoRenewal:=0;
                 ExaminationAccount.Reset;
                 ExaminationAccount.SetRange("Registration No.","Examination Account"."Registration No.");
                 ExaminationAccount.SetFilter(Status,'<>%1',ExaminationAccount.Status::Graduate);
                 if ExaminationAccount.FindFirst then begin
                  ExaminationAccount.CalcFields("Renewal Year");
                  if ExaminationAccount."Renewal Year"<>0 then begin
                              RenewalBuffer.Init;
                              RenewalBuffer."Registration No.":=ExaminationAccount."Registration No.";

                              NoRenewal:=(Date2DMY(Today,3)-ExaminationAccount."Renewal Year")+1;

                              //get renewal fee
                              ResourcePrice.CalcFields(Course);
                              ResourcePrice.Reset;
                              ResourcePrice.SetRange(Course,"Examination Account"."Course ID");
                              ResourcePrice.SetRange("Currency Code",'');
                              ResourcePrice.SetRange("Document Type",ResourcePrice."Document Type"::Renewal);
                                if ResourcePrice.FindSet then begin
                                    if (NoRenewal>0)then begin
                                          if NoRenewal>3 then
                                               NoRenewal:=3
                                          else
                                          NoRenewal:=NoRenewal;
                                      RenewalBuffer."Renewal Amount":=NoRenewal*ResourcePrice."Unit Price";
                                      //RenewalBuffer."Renewal Pending":=NoRenewal;

                                    end;
                                 end;

                //get reactivation
                 NoRenewal1:=0;
                             NoRenewal1:=(Date2DMY(Today,3)-ExaminationAccount."Renewal Year")+1;
                              ResourcePrice1.CalcFields(Course);
                              ResourcePrice1.Reset;
                              ResourcePrice1.SetRange(Course,"Examination Account"."Course ID");
                              ResourcePrice1.SetRange("Currency Code",'');
                              ResourcePrice1.SetRange("Document Type",ResourcePrice1."Document Type"::"Re-Activation");
                                if ResourcePrice1.FindSet then begin
                                  if NoRenewal1>3 then begin
                                      RenewalBuffer."Re-Activation Amount":=ResourcePrice1."Unit Price";
                                  end;
                                  if NoRenewal1>3 then
                                    NoRenewal1:=3 ;

                                      RenewalBuffer."Renewal Pending":=NoRenewal1;
                                end;

                 if NoRenewal1>0 then
                   RenewalBuffer.Insert(true);

                end
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
        RenewalBuffer: Record "Renewal Buffer";
        ResourcePrice: Record "Resource Price";
        ExaminationAccount: Record "Examination Account";
        NoRenewal: Integer;
        ResourcePrice1: Record "Resource Price";
        NoRenewal1: Integer;
}

