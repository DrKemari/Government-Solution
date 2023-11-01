report 69051 "Update Pension"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Pension.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No",Type,Code,"Payroll Period","Reference No") ORDER(Ascending) WHERE(Type=CONST(Deduction),Code=FILTER('D004'|'D005'));
            RequestFilterFields = "Employee No","Payroll Period";
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
            column(Assignment_Matrix_X_Type;Type)
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
            column(Assignment_Matrix_XCaption;Assignment_Matrix_XCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Assignment_Matrix_X__Employee_No__Control1000000011Caption;FieldCaption("Employee No"))
            {
            }
            column(Assignment_Matrix_X_TypeCaption;FieldCaption(Type))
            {
            }
            column(Assignment_Matrix_X_CodeCaption;FieldCaption(Code))
            {
            }
            column(Assignment_Matrix_X__Payroll_Period_Caption;FieldCaption("Payroll Period"))
            {
            }
            column(Assignment_Matrix_X_AmountCaption;FieldCaption(Amount))
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
                /*
                
                IF AssMat.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Payment,'E001',
                "Assignment Matrix-X"."Payroll Period",'') THEN BEGIN
                //MESSAGE('%1',AssMat.Amount);
                
                "Assignment Matrix-X".Amount:=-AssMat.Amount*7.5/100;
                "Assignment Matrix-X"."Employer Amount":=AssMat.Amount*7.5/100;
                "Assignment Matrix-X".MODIFY;
                
                END;
                
                */
                
                /*
                
                Emp.RESET;
                Emp.SETRANGE(Emp."No.","Assignment Matrix-X"."Employee No");
                Emp.SETRANGE(Emp."Pay Period Filter","Assignment Matrix-X"."Payroll Period");
                
                IF Emp.FIND('-') THEN BEGIN
                Emp.CALCFIELDS(Emp."CHC Contract");
                
                //MESSAGE('%1',Emp."Non-Fluctuating Allowance");
                
                END;
                
                IF AssMat.GET("Assignment Matrix-X"."Employee No","Assignment Matrix-X".Type::Deduction,'D112',
                "Assignment Matrix-X"."Payroll Period",'') THEN BEGIN
                //MESSAGE('%1',AssMat.Amount);
                Tier2:=AssMat.Amount;
                END;
                "Assignment Matrix-X".Amount:=-Emp."CHC Contract"*7.5/100-Tier2+360;
                "Assignment Matrix-X"."Employer Amount":=(Emp."CHC Contract"*7.5/100)+Tier2-360;
                "Assignment Matrix-X".MODIFY;
                
                */

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
        AssMat: Record "Assignment Matrix-X";
        Emp: Record Employee;
        Tier2: Decimal;
        Assignment_Matrix_XCaptionLbl: Label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

