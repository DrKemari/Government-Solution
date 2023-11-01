#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 50020 "CRMCodeunit"
{

    trigger OnRun()
    begin
        Message(fnGetAllCustomers());
    end;

    procedure fnGetAllCustomers() AllData: Text
    var
        Customer: Record Customer;
    begin

          repeat
            AllData:=AllData+Customer."No."+'*'+Customer.Name+'::::';
          until Customer.Next=0;
    end;
}

