report 69054 "Update Payroll Dimensions"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Payroll Dimensions.rdlc';

    dataset
    {
        dataitem("Assignment Matrix-X";"Assignment Matrix-X")
        {
            DataItemTableView = SORTING("Employee No",Type,Code,"Payroll Period","Reference No");
            RequestFilterFields = "Payroll Period","Employee No";
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


                //"Assignment Matrix-X".VALIDATE("Assignment Matrix-X"."Employee No");
                //"Assignment Matrix-X".VALIDATE("Assignment Matrix-X"."Payroll Period");
                 // END;

                if Empl.Get("Assignment Matrix-X"."Employee No") then begin
                      Empl.CalcFields(Branch,Paypoint,"Staffing Group",Department);

                      "Assignment Matrix-X"."Posting Group Filter":=Empl."Posting Group";
                      "Assignment Matrix-X"."Profit Centre":=Empl."Global Dimension 2 Code";
                      "Assignment Matrix-X".Branch:=Empl.Branch;
                      "Assignment Matrix-X"."Department Code":=Empl.Department;
                      "Assignment Matrix-X"."Salary Pointer":=Empl."Salary Scale";
                      "Assignment Matrix-X"."Pay Point":=Empl.Paypoint;
                      "Assignment Matrix-X"."Staffing Group":=Empl."Staffing Group";

                      "Assignment Matrix-X".Modify;
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
        Assignment_Matrix_XCaptionLbl: Label 'Assignment Matrix-X';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Control1000000015CaptionLbl: Label 'Label1000000015';
}

