report 70031 "BackOrder-Requistion Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './BackOrder-Requistion Report.rdlc';

    dataset
    {
        dataitem("Purchase Line";"Purchase Line")
        {
            DataItemTableView = WHERE("Document Type"=FILTER("Store Requisition"),Status=CONST(Released));
            column(Department_PurchaseLine;"Purchase Line".Department)
            {
            }
            column(ItemDescription_PurchaseLine;"Purchase Line"."Item Description")
            {
            }
            column(QtyApproved_PurchaseLine;"Purchase Line"."Qty Approved")
            {
            }
            column(Quantityissued_PurchaseLine;"Purchase Line"."Quantity  issued")
            {
            }
            column(EmployeeName_PurchaseLine;"Purchase Line"."Employee Name")
            {
            }
            column(RemainingQuantity_PurchaseLine;"Purchase Line"."Remaining Quantity")
            {
            }
            column(RequestByName_PurchaseLine;"Purchase Line"."Request-By Name")
            {
            }
            column(QuantityInStore_PurchaseLine;"Purchase Line"."Quantity In Store")
            {
            }
            column(No_PurchaseLine;"Purchase Line"."No.")
            {
            }
            column(QtyRequested_PurchaseLine;"Purchase Line"."Qty. Requested")
            {
            }
            column(DocumentNo_PurchaseLine;"Purchase Line"."Document No.")
            {
            }
            column(DepartmentCode_PurchaseLine;DeptName)
            {
            }
            column(Description_PurchaseLine;"Purchase Line".Description)
            {
            }
            column(LocationCode_PurchaseLine;"Purchase Line"."Location Code")
            {
            }
            column(Type_PurchaseLine;"Purchase Line".Type)
            {
            }
            column(LastIssuedate_PurchaseLine;"Purchase Line"."Last Issue date")
            {
            }
            column(storeRecType;storeRecType)
            {
            }
            column(DocumentType_PurchaseLine;"Purchase Line"."Document Type")
            {
            }
            column(RemainingQty;RemainingQty)
            {
            }
            column(NAME;CompanyInfo.Name)
            {
            }
            column(LOGO;CompanyInfo.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*puchline.RESET;
                puchline.SETRANGE("Document Type",puchline."Document Type"::"Store Requisition");
                IF puchline.FINDSET THEN BEGIN
                  storeRecType:= puchline."Document Type"::"Store Requisition";
                  END*/
                  RemainingQty:="Purchase Line"."Qty Approved"-"Purchase Line"."Quantity  issued";
                  RC.Reset;
                RC.SetRange(Code,"Purchase Line"."Department Code");
                if RC.FindSet then
                DeptName:=RC.Name;

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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        storeRecType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition";
        puchline: Record "Purchase Line";
        RemainingQty: Decimal;
        RC: Record "Responsibility Center";
        DeptName: Text;
        CompanyInfo: Record "Company Information";
}

