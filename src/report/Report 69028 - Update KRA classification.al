report 69028 "Update KRA classification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update KRA classification.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No",Type,Code,"Payroll Period","Reference No");
            RequestFilterFields = "Payroll Period","Employee No","Posting Group Filter";
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(Assignment_Matrix_X__Employee_No_;"Employee No")
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011;"Employee No")
            {
            }
            column(Assignment_Matrix_X_Code;Code)
            {
            }
            column(Assignment_Matrix_X__Payroll_Period_;"Payroll Period")
            {
            }
            column(Assignment_Matrix_X_Amount;Amount)
            {
            }
            column(Assignment_Matrix_X_Type;Type)
            {
            }
            column(Assignment_Matrix_XCaption;Assignment_Matrix_XCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011Caption;FieldCaption("Employee No"))
            {
            }
            column(Control1000000015Caption;Control1000000015CaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No_Caption;FieldCaption("Employee No"))
            {
            }
            column(Assignment_Matrix_X_Reference_No;"Reference No")
            {
            }

            trigger OnAfterGetRecord()
            begin
                  //IF Emp.GET("Assignment Matrix-X"."Employee No") THEN BEGIN
                
                
                /*
                IF Empl.GET("Assignment Matrix-X"."Employee No") THEN BEGIN
                
                "Assignment Matrix-X".Rank:=Empl.Rank;
                 "Assignment Matrix-X".MODIFY;
                END;
                */
                
                if "Assignment Matrix-X".Type="Assignment Matrix-X".Type::Payment then begin
                if Earning.Get("Assignment Matrix-X".Code) then begin
                "Assignment Matrix-X"."KRA Classification":=Earning."KRA Classification";
                "Assignment Matrix-X".Modify;
                end;
                
                end;

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Employee No");
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
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Emp: Record Employee;
        Empl: Record Employee;
        PstGrp: Record "Employee Posting GroupX";
        Earning: Record EarningsX;
        Assignment_Matrix_XCaptionLbl: Label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Control1000000015CaptionLbl: Label 'Label1000000015';
}

