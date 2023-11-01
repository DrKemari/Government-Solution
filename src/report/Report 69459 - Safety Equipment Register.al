report 69459 "Safety Equipment Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Safety Equipment Register.rdlc';

    dataset
    {
        dataitem("Safety Equipment Register";"Safety Equipment Register")
        {
            column(COMPANY;CompanyInfo.Name)
            {
            }
            column(logo;CompanyInfo.Picture)
            {
            }
            column(PostCode;CompanyInfo."Post Code")
            {
            }
            column(City;CompanyInfo.City)
            {
            }
            column(Address;CompanyInfo.Address)
            {
            }
            column(Address2;CompanyInfo."Address 2")
            {
            }
            column(EquipmentID_SafetyEquipmentRegister;"Safety Equipment Register"."Equipment ID")
            {
            }
            column(SubType_SafetyEquipmentRegister;"Safety Equipment Register".SubType)
            {
            }
            column(SubTypeNo_SafetyEquipmentRegister;"Safety Equipment Register"."SubType No.")
            {
            }
            column(Description_SafetyEquipmentRegister;"Safety Equipment Register".Description)
            {
            }
            column(SafetyEquipmentCategory_SafetyEquipmentRegister;"Safety Equipment Register"."Safety Equipment Category")
            {
            }
            column(SafetyNotesComments_SafetyEquipmentRegister;"Safety Equipment Register"."Safety Notes/Comments")
            {
            }
            column(FALocationCode_SafetyEquipmentRegister;"Safety Equipment Register"."FA Location Code")
            {
            }
            column(SerialNo_SafetyEquipmentRegister;"Safety Equipment Register"."Serial No.")
            {
            }
            column(NextServiceDate_SafetyEquipmentRegister;"Safety Equipment Register"."Next Service Date")
            {
            }
            column(InventoryQuantity_SafetyEquipmentRegister;"Safety Equipment Register"."Inventory Quantity")
            {
            }
            column(FixedAssetResourceQuantity_SafetyEquipmentRegister;"Safety Equipment Register"."Fixed Asset/Resource Quantity")
            {
            }
            column(MaintenanceVendorNo_SafetyEquipmentRegister;"Safety Equipment Register"."Maintenance Vendor No.")
            {
            }
            column(WarrantyDate_SafetyEquipmentRegister;"Safety Equipment Register"."Warranty Date")
            {
            }
            column(Insured_SafetyEquipmentRegister;Format("Safety Equipment Register".Insured))
            {
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

