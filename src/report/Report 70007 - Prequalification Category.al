report 70007 "Prequalification Category"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Procurement Category Header";"Procurement Category Header")
        {
            DataItemTableView = SORTING("Fiscal Year",Category);

            trigger OnAfterGetRecord()
            begin

                SupplierCategory.Reset;
                 if SupplierCategory.Find('-') then
                  repeat
                   ProcCategory.Init;
                   ProcCategory."Fiscal Year":=FiscalYear;
                   ProcCategory.Category:=SupplierCategory."Category Code";
                   ProcCategory.Validate(Category);
                    if not ProcCategory.Get(ProcCategory."Fiscal Year",ProcCategory.Category) then
                    ProcCategory.Insert;
                  until
                   SupplierCategory.Next=0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("Specify Fiscal Year")
                {
                    field("Fiscal Year";FiscalYear)
                    {
                        TableRelation = "G/L Budget Name";
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if FiscalYear='' then
        Error(Text000);
    end;

    var
        SupplierCategory: Record "Supplier Category";
        ProcCategory: Record "Procurement Category Header";
        Text000: Label 'Please specify the fiscal year';
        FiscalYear: Code[20];
}

