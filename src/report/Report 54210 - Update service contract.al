report 54210 "Update service contract"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update service contract.rdlc';

    dataset
    {
        dataitem("Service Contract Header";"Service Contract Header")
        {
            DataItemTableView = WHERE("Contract No."=CONST('SERVCONTRACT000030'));

            trigger OnAfterGetRecord()
            begin
                LastInvoiceDate:=20181130D;
                NextInvoiceDate:=20181231D;
                Desc:='01/12/18 to 31/12/18';

                //"Service Contract Header"."Next Invoice Date":=NextInvoiceDate;
                "Service Contract Header"."Next Invoice Period":='01/12/18 to 31/12/18';
                "Service Contract Header".Modify;
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
        LastInvoiceDate: Date;
        NextInvoiceDate: Date;
        Desc: Code[50];
}

