report 85004 "BoQ Template"
{
    DefaultLayout = RDLC;
    RDLCLayout = './BoQ Template.rdlc';

    dataset
    {
        dataitem("Boq Template  Header";"Boq Template  Header")
        {
            column(TemplateID_BoqTemplateHeader;"Boq Template  Header"."Template ID")
            {
            }
            column(Examination_BoqTemplateHeader;"Boq Template  Header".Examination)
            {
            }
            column(Description_BoqTemplateHeader;"Boq Template  Header".Description)
            {
            }
            column(Blocked_BoqTemplateHeader;"Boq Template  Header".Blocked)
            {
            }
            column(EffectiveDate_BoqTemplateHeader;"Boq Template  Header"."Effective Date")
            {
            }
            column(CurrencyCode_BoqTemplateHeader;"Boq Template  Header"."Currency Code")
            {
            }
            column(NoSeries_BoqTemplateHeader;"Boq Template  Header"."No. Series")
            {
            }
            column(CreatedBy_BoqTemplateHeader;"Boq Template  Header"."Created By")
            {
            }
            column(CreatedOn_BoqTemplateHeader;"Boq Template  Header"."Created On")
            {
            }
            dataitem("BoQ Template Lines";"BoQ Template Lines")
            {
                DataItemLink = "Boq Header"=FIELD("Template ID");
                column(LineNo_BoQTemplateLines;"BoQ Template Lines"."Line No.")
                {
                }
                column(BoqHeader_BoQTemplateLines;"BoQ Template Lines"."Boq Header")
                {
                }
                column(Examination_BoQTemplateLines;"BoQ Template Lines".Examination)
                {
                }
                column(Type_BoQTemplateLines;"BoQ Template Lines".Type)
                {
                }
                column(No_BoQTemplateLines;"BoQ Template Lines"."No.")
                {
                }
                column(Description_BoQTemplateLines;"BoQ Template Lines".Description)
                {
                }
                column(UnitofMeasure_BoQTemplateLines;"BoQ Template Lines"."Unit of Measure")
                {
                }
                column(AmountExclVAT_BoQTemplateLines;"BoQ Template Lines"."Amount Excl. VAT")
                {
                }
                column(ShortcutDimension1Code_BoQTemplateLines;"BoQ Template Lines"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_BoQTemplateLines;"BoQ Template Lines"."Shortcut Dimension 2 Code")
                {
                }
                column(Variant_BoQTemplateLines;"BoQ Template Lines".Variant)
                {
                }
                column(DimensionSetID_BoQTemplateLines;"BoQ Template Lines"."Dimension Set ID")
                {
                }
                column(CI_Picture;CI.Picture)
                {
                }
                column(CI_Address;CI.Address)
                {
                }
                column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
                {
                }
                column(CI_City;CI.City)
                {
                }
                column(CI_PhoneNo;CI."Phone No.")
                {
                }
                column(COMPANYNAME;CompanyName)
                {
                }
            }
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

