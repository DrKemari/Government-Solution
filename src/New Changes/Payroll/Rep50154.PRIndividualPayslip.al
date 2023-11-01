Report 50161 "PR Individual Payslip - NEW"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PRIndividualPayslip.rdlc';

    dataset
    {
        dataitem("Employee"; "Employee")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            column(ReportForNavId_8631; 8631)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoCompanyWatermark; CompanyInfo."Company Watermark")
            {
            }
            column(IDNumber_HREmployees; "Employee"."ID Number")
            {
            }
            column(COMPANYNAME_Control1102756028; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Picture_Control1102756013; CompanyInfo.Picture)
            {
            }
            column(HR_Employee_No_; "No.")
            {
            }
            column(GlobalDimension1Code_HREmployees; "Employee"."Global Dimension 1 Code")
            {
            }
            column(PINNo_HREmployees; "Employee"."P.I.N")
            {
            }
            column(NSSFNo_HREmployees; "Employee"."NSSF No.")
            {
            }
            column(NHIFNo_HREmployees; "Employee"."NHIF No.")
            {
            }
            column(GlobalDimension2Code_HREmployees; "Employee"."Global Dimension 2 Code")
            {
            }
            column(JobTitle_HREmployees; "Employee"."Job Title")
            {
            }
            column(Spacer; Spacer)
            {
            }
            column(CountyName; CountyName)
            {
            }
            column(PayMessage; PayMessage)
            {
            }
            column(AgeMessage; AgeMessage)
            {
            }
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                DataItemLink = "Employee Code" = field("No.");
                DataItemTableView = sorting("Employee Code") order(ascending);
                PrintOnlyIfDetail = false;
                RequestFilterFields = "Employee Code", "Period Filter";
                column(ReportForNavId_9285; 9285)
                {
                }
                column(Bank; Bank)
                {
                }
                column(Branch; Branch)
                {
                }
                column(Account; Account)
                {
                }
                column(NoDaysWorked; NoDaysWorked)
                {
                }
                column(RatePerDay; RatePerDay)
                {
                }
                column(Trans_1__1_; Trans[1] [1])
                {
                }
                column(TransAmt_1__1_; TransAmt[1] [1])
                {
                }
                column(TransBal_1__1_; TransBal[1] [1])
                {
                }
                column(TransBal_1__2_; TransBal[1] [2])
                {
                }
                column(TransAmt_1__2_; TransAmt[1] [2])
                {
                }
                column(Trans_1__2_; Trans[1] [2])
                {
                }
                column(TransBal_1__3_; TransBal[1] [3])
                {
                }
                column(TransAmt_1__3_; TransAmt[1] [3])
                {
                }
                column(Trans_1__3_; Trans[1] [3])
                {
                }
                column(TransBal_1__4_; TransBal[1] [4])
                {
                }
                column(TransBal_1__5_; TransBal[1] [5])
                {
                }
                column(TransBal_1__6_; TransBal[1] [6])
                {
                }
                column(TransAmt_1__4_; TransAmt[1] [4])
                {
                }
                column(TransAmt_1__5_; TransAmt[1] [5])
                {
                }
                column(TransAmt_1__6_; TransAmt[1] [6])
                {
                }
                column(Trans_1__4_; Trans[1] [4])
                {
                }
                column(Trans_1__5_; Trans[1] [5])
                {
                }
                column(Trans_1__6_; Trans[1] [6])
                {
                }
                column(TransBal_1__7_; TransBal[1] [7])
                {
                }
                column(TransBal_1__8_; TransBal[1] [8])
                {
                }
                column(TransBal_1__9_; TransBal[1] [9])
                {
                }
                column(TransAmt_1__7_; TransAmt[1] [7])
                {
                }
                column(TransAmt_1__8_; TransAmt[1] [8])
                {
                }
                column(TransAmt_1__9_; TransAmt[1] [9])
                {
                }
                column(Trans_1__7_; Trans[1] [7])
                {
                }
                column(Trans_1__8_; Trans[1] [8])
                {
                }
                column(Trans_1__9_; Trans[1] [9])
                {
                }
                column(TransBal_1__10_; TransBal[1] [10])
                {
                }
                column(TransBal_1__12_; TransBal[1] [12])
                {
                }
                column(TransBal_1__13_; TransBal[1] [13])
                {
                }
                column(TransAmt_1__10_; TransAmt[1] [10])
                {
                }
                column(TransAmt_1__12_; TransAmt[1] [12])
                {
                }
                column(TransAmt_1__13_; TransAmt[1] [13])
                {
                }
                column(Trans_1__10_; Trans[1] [10])
                {
                }
                column(Trans_1__12_; Trans[1] [12])
                {
                }
                column(Trans_1__13_; Trans[1] [13])
                {
                }
                column(TransBal_1__14_; TransBal[1] [14])
                {
                }
                column(TransBal_1__15_; TransBal[1] [15])
                {
                }
                column(TransBal_1__16_; TransBal[1] [16])
                {
                }
                column(TransBal_1__17_; TransBal[1] [17])
                {
                }
                column(TransBal_1__18_; TransBal[1] [18])
                {
                }
                column(TransBal_1__19_; TransBal[1] [19])
                {
                }
                column(TransBal_1__11_; TransBal[1] [11])
                {
                }
                column(TransBal_1__20_; TransBal[1] [20])
                {
                }
                column(TransAmt_1__14_; TransAmt[1] [14])
                {
                }
                column(TransAmt_1__15_; TransAmt[1] [15])
                {
                }
                column(TransAmt_1__16_; TransAmt[1] [16])
                {
                }
                column(TransAmt_1__17_; TransAmt[1] [17])
                {
                }
                column(TransAmt_1__18_; TransAmt[1] [18])
                {
                }
                column(TransAmt_1__19_; TransAmt[1] [19])
                {
                }
                column(TransAmt_1__11_; TransAmt[1] [11])
                {
                }
                column(TransAmt_1__20_; TransAmt[1] [20])
                {
                }
                column(Trans_1__14_; Trans[1] [14])
                {
                }
                column(Trans_1__15_; Trans[1] [15])
                {
                }
                column(Trans_1__16_; Trans[1] [16])
                {
                }
                column(Trans_1__17_; Trans[1] [17])
                {
                }
                column(Trans_1__18_; Trans[1] [18])
                {
                }
                column(Trans_1__19_; Trans[1] [19])
                {
                }
                column(Trans_1__11_; Trans[1] [11])
                {
                }
                column(Trans_1__20_; Trans[1] [20])
                {
                }
                column(Addr_1__1_; Addr[1] [1])
                {
                }
                column(Addr_1__2_; Addr[1] [2])
                {
                }
                column(Addr_1__3_; Addr[1] [3])
                {
                }
                column(TransBal_1__21_; TransBal[1] [21])
                {
                }
                column(TransBal_1__22_; TransBal[1] [22])
                {
                }
                column(TransAmt_1__21_; TransAmt[1] [21])
                {
                }
                column(TransAmt_1__22_; TransAmt[1] [22])
                {
                }
                column(TransBal_1__23_; TransBal[1] [23])
                {
                }
                column(TransAmt_1__23_; TransAmt[1] [23])
                {
                }
                column(TransBal_1__24_; TransBal[1] [24])
                {
                }
                column(TransAmt_1__24_; TransAmt[1] [24])
                {
                }
                column(Trans_1__21_; Trans[1] [21])
                {
                }
                column(Trans_1__23_; Trans[1] [23])
                {
                }
                column(Trans_1__24_; Trans[1] [24])
                {
                }
                column(Trans_1__22_; Trans[1] [22])
                {
                }
                column(TransBal_1__25_; TransBal[1] [25])
                {
                }
                column(TransAmt_1__25_; TransAmt[1] [25])
                {
                }
                column(Trans_1__25_; Trans[1] [25])
                {
                }
                column(TransBal_1__26_; TransBal[1] [26])
                {
                }
                column(TransAmt_1__26_; TransAmt[1] [26])
                {
                }
                column(Trans_1__26_; Trans[1] [26])
                {
                }
                column(TransBal_1__27_; TransBal[1] [27])
                {
                }
                column(TransAmt_1__27_; TransAmt[1] [27])
                {
                }
                column(Trans_1__27_; Trans[1] [27])
                {
                }
                column(TransBal_1__28_; TransBal[1] [28])
                {
                }
                column(TransAmt_1__28_; TransAmt[1] [28])
                {
                }
                column(Trans_1__28_; Trans[1] [28])
                {
                }
                column(TransBal_1__29_; TransBal[1] [29])
                {
                }
                column(TransAmt_1__29_; TransAmt[1] [29])
                {
                }
                column(Trans_1__29_; Trans[1] [29])
                {
                }
                column(TransBal_1__30_; TransBal[1] [30])
                {
                }
                column(TransAmt_1__30_; TransAmt[1] [30])
                {
                }
                column(Trans_1__30_; Trans[1] [30])
                {
                }
                column(TransBal_1__31_; TransBal[1] [31])
                {
                }
                column(TransAmt_1__31_; TransAmt[1] [31])
                {
                }
                column(Trans_1__31_; Trans[1] [31])
                {
                }
                column(TransBal_1__32_; TransBal[1] [32])
                {
                }
                column(TransBal_1__33_; TransBal[1] [33])
                {
                }
                column(TransBal_1__34_; TransBal[1] [34])
                {
                }
                column(TransBal_1__35_; TransBal[1] [35])
                {
                }
                column(TransBal_1__36_; TransBal[1] [36])
                {
                }
                column(TransBal_1__37_; TransBal[1] [37])
                {
                }
                column(TransBal_1__38_; TransBal[1] [38])
                {
                }
                column(TransBal_1__39_; TransBal[1] [39])
                {
                }
                column(TransBal_1__40_; TransBal[1] [40])
                {
                }
                column(TransAmt_1__32_; TransAmt[1] [32])
                {
                }
                column(TransAmt_1__33_; TransAmt[1] [33])
                {
                }
                column(TransAmt_1__34_; TransAmt[1] [34])
                {
                }
                column(TransAmt_1__35_; TransAmt[1] [35])
                {
                }
                column(TransAmt_1__36_; TransAmt[1] [36])
                {
                }
                column(TransAmt_1__37_; TransAmt[1] [37])
                {
                }
                column(TransAmt_1__38_; TransAmt[1] [38])
                {
                }
                column(TransAmt_1__39_; TransAmt[1] [39])
                {
                }
                column(TransAmt_1__40_; TransAmt[1] [40])
                {
                }
                column(Trans_1__32_; Trans[1] [32])
                {
                }
                column(Trans_1__34_; Trans[1] [34])
                {
                }
                column(Trans_1__35_; Trans[1] [35])
                {
                }
                column(Trans_1__33_; Trans[1] [33])
                {
                }
                column(Trans_1__36_; Trans[1] [36])
                {
                }
                column(Trans_1__37_; Trans[1] [37])
                {
                }
                column(Trans_1__38_; Trans[1] [38])
                {
                }
                column(Trans_1__39_; Trans[1] [39])
                {
                }
                column(Trans_1__40_; Trans[1] [40])
                {
                }
                column(Trans_1__45_; Trans[1] [45])
                {
                }
                column(TransAmt_1__45_; TransAmt[1] [45])
                {
                }
                column(TransAmt_1__46_; TransAmt[1] [46])
                {
                }
                column(TransAmt_1__47_; TransAmt[1] [47])
                {
                }
                column(TransAmt_1__48_; TransAmt[1] [48])
                {
                }
                column(TransAmt_1__49_; TransAmt[1] [49])
                {
                }
                column(Trans_1__46_; Trans[1] [46])
                {
                }
                column(Trans_1__47_; Trans[1] [47])
                {
                }
                column(Trans_1__48_; Trans[1] [48])
                {
                }
                column(Trans_1__49_; Trans[1] [49])
                {
                }
                column(TransAmt_1__50_; TransAmt[1] [50])
                {
                }
                column(TransAmt_1__51_; TransAmt[1] [51])
                {
                }
                column(Trans_1__50_; Trans[1] [50])
                {
                }
                column(Trans_1__51_; Trans[1] [51])
                {
                }
                column(Trans_1__53_; Trans[1] [53])
                {
                }
                column(TransBal_1__42_; TransBal[1] [42])
                {
                }
                column(TransAmt_1__42_; TransAmt[1] [42])
                {
                }
                column(Trans_1__42_; Trans[1] [42])
                {
                }
                column(TransBal_1__43_; TransBal[1] [43])
                {
                }
                column(TransAmt_1__43_; TransAmt[1] [43])
                {
                }
                column(Trans_1__43_; Trans[1] [43])
                {
                }
                column(TransBal_1__44_; TransBal[1] [44])
                {
                }
                column(TransAmt_1__44_; TransAmt[1] [44])
                {
                }
                column(Trans_1__44_; Trans[1] [44])
                {
                }
                column(Trans_1__41_; Trans[1] [41])
                {
                }
                column(TransAmt_1__41_; TransAmt[1] [41])
                {
                }
                column(TransBal_1__41_; TransBal[1] [41])
                {
                }
                column(TransAmt_1__52_; TransAmt[1] [52])
                {
                }
                column(Trans_1__52_; Trans[1] [52])
                {
                }
                column(TransBal_1__45_; TransBal[1] [45])
                {
                }
                column(TransBal_1__46_; TransBal[1] [46])
                {
                }
                column(TransBal_1__47_; TransBal[1] [47])
                {
                }
                column(TransBal_1__48_; TransBal[1] [48])
                {
                }
                column(TransBal_1__49_; TransBal[1] [49])
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(Employee_Caption; Employee_CaptionLbl)
                {
                }
                column(Department_Caption; Department_CaptionLbl)
                {
                }
                column(Period_Caption; Period_CaptionLbl)
                {
                }
                column(PR_Salary_Card_Employee_Code; "Employee Code")
                {
                }
                column(PayslipMessage; PayslipMessage)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //Bank Details
                    // HREmpBA.RESET;
                    // HREmpBA.SETRANGE(HREmpBA."Employee Code","PR Salary Card"."Employee Code");
                    // IF HREmpBA.FindFirst() THEN
                    // BEGIN
                    //    Bank:=HREmpBA."Bank Name";
                    //    Branch:=HREmpBA."Branch Name";
                    //    Account:=HREmpBA."A/C  Number";
                    // END ELSE
                    // BEGIN
                    //      Bank:='';
                    //    Branch:='';
                    //    Account:='';
                    // END;


                    strNssfNo := '. ';
                    strNhifNo := '. ';
                    strBank := '. ';
                    strBranch := '. ';
                    strAccountNo := '. ';
                    strPin := '. ';
                    STRGRATUITY := 0;
                    RecordNo := RecordNo + 1;
                    ColumnNo := ColumnNo + 1;
                    //Get the staff details (header)
                    Clear(HREmployeePR);
                    HREmployeePR.SetRange(HREmployeePR."No.", "Employee Code");
                    if HREmployeePR.FindFirst() then begin
                        strEmpCode := HREmployeePR."No.";
                        strEmpName := '[' + "Employee Code" + '] ' + HREmployeePR."Last Name" + ' ' + HREmployeePR."First Name" + ' ' + HREmployeePR."Middle Name";
                        strPin := HREmployeePR."P.I.N";
                        dtDOE := HREmployeePR."Employment Date";
                        STATUS := Format(HREmployeePR.Status);
                        dept := HREmployeePR."Global DImension 1 Code";
                        if HREmployeePR."Date Of Leaving" = 0D then
                            dtOfLeaving := Dmy2date(31, 12, 9999)
                        else
                            dtOfLeaving := HREmployeePR."Date Of Leaving";

                        strNssfNo := HREmployeePR."NSSF No.";
                        strNhifNo := HREmployeePR."NHIF No.";
                        strPin := HREmployeePR."P.I.N";
                        //Get the staff banks in the payslip - Dennis ***************************************************

                        PRBankStructure.Reset;
                        PRBankStructure.SetRange(PRBankStructure."Branch Code", strBankno);
                        PRBankStructure.SetRange(PRBankStructure."Bank Code", strBranchno);
                        if PRBankStructure.FindFirst() then begin
                            //strAccountNo:=HREmployeePR."Bank Account Number";
                            //strBank:=PRBankStructure."Bank Code";
                            //strBranch:=PRBankStructure."Branch Name";
                        end;

                        //*************************************************************************************************

                    end;


                    //Clear headers
                    Addr[ColumnNo] [1] := '';
                    Addr[ColumnNo] [2] := '';
                    Addr[ColumnNo] [3] := '';
                    Addr[ColumnNo] [4] := '';
                    Addr[ColumnNo] [5] := '';

                    //Clear previous Transaction entries 53
                    for intRow := 1 to 55 do begin
                        Trans[ColumnNo, intRow] := '';
                        TransAmt[ColumnNo, intRow] := '';
                        TransBal[ColumnNo, intRow] := '';
                    end;

                    //Loop through the transactions
                    PeriodTrans.Reset;
                    PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);

                    PeriodTrans.SetCurrentkey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                    PeriodTrans."Group Order", PeriodTrans."Sub Group Order");


                    Addr[ColumnNo] [1] := Format(strEmpName);
                    Addr[ColumnNo] [2] := dept; //Depart
                    Addr[ColumnNo] [3] := PeriodName; //Period
                    Addr[ColumnNo] [4] := strPin; //Pin


                    Index := 1;
                    strGrpText := '';
                    if PeriodTrans.FindFirst() then
                        repeat

                            //****************************************************************

                            //Check if the group has changed
                            if strGrpText <> PeriodTrans."Group Text" then begin
                                if PeriodTrans."Group Order" <> 1 then begin
                                    Index := Index + 1;
                                    /* Trans[ColumnNo,Index]:='......................................';
                                     TransAmt[ColumnNo,Index]:='......................................';
                                     TransBal[ColumnNo,Index]:='......................................';  */
                                end;

                                Index := Index + 1;
                                strGrpText := PeriodTrans."Group Text";
                                Trans[ColumnNo, Index] := strGrpText;
                                TransAmt[ColumnNo, Index] := '.';
                                TransBal[ColumnNo, Index] := '.';

                                // IF PeriodTrans.Amount>0 THEN
                                // BEGIN
                                Index := Index + 1;
                                Trans[ColumnNo, Index] := PeriodTrans."Transaction Name";
                                Evaluate(TransAmt[ColumnNo, Index], Format(PeriodTrans.Amount));

                                if PeriodTrans.Balance = 0 then
                                    Evaluate(TransBal[ColumnNo, Index], Format('                           .'))
                                else
                                    Evaluate(TransBal[ColumnNo, Index], Format(PeriodTrans.Balance));
                                // END;

                            end else begin
                                //  IF PeriodTrans.Amount>0 THEN
                                //  BEGIN
                                Index := Index + 1;
                                strGrpText := PeriodTrans."Group Text";
                                Trans[ColumnNo, Index] := PeriodTrans."Transaction Name";
                                Evaluate(TransAmt[ColumnNo, Index], Format(PeriodTrans.Amount));
                                if PeriodTrans.Balance = 0 then
                                    Evaluate(TransBal[ColumnNo, Index], Format('                           .'))
                                else
                                    Evaluate(TransBal[ColumnNo, Index], Format(PeriodTrans.Balance));
                                //  END;
                            end;
                        until PeriodTrans.Next = 0;
                    //******************************************************************************
                    // DW - Display Employer Contributions on the Payslip
                    Index += 1;
                    Trans[ColumnNo, Index] := '......................................';
                    Evaluate(TransAmt[ColumnNo, Index], '......................................');

                    Index += 1;
                    Trans[ColumnNo, Index] := 'EMPLOYER CONTRIBUTIONS:';
                    Evaluate(TransAmt[ColumnNo, Index], '.');

                    PREmployerContr.Reset;
                    PREmployerContr.SetRange(PREmployerContr."Payroll Period", SelectedPeriod);
                    PREmployerContr.SetRange(PREmployerContr."Employee Code", strEmpCode);
                    if PREmployerContr.FindFirst() then begin
                        repeat
                            if PREmployerContr."Transaction Code" = 'NSSF' then begin
                                Index += 1;
                                Trans[ColumnNo, Index] := 'N.S.S.F: ';
                                Evaluate(TransAmt[ColumnNo, Index], Format(PREmployerContr.Amount));
                            end;
                            if PREmployerContr."Transaction Code" = 'D020' then begin
                                Index += 1;
                                Trans[ColumnNo, Index] := 'PENSION (EMPLOYER): ';
                                Evaluate(TransAmt[ColumnNo, Index], Format(PREmployerContr.Amount));
                            end;

                        until PREmployerContr.Next = 0;
                    end;

                    //******************************************************************************

                    if (RecordNo = NoOfRecords) and (ColumnNo < 3) then begin
                        for i := ColumnNo + 1 to NoOfColumns do begin
                            Clear(Addr[i]);
                            Clear(Trans[i]);
                            Clear(TransAmt[i]);
                            Clear(TransBal[i]);
                        end;
                        ColumnNo := 0;

                    end else begin
                        if ColumnNo = NoOfColumns then
                            ColumnNo := 0;
                    end;

                end;

                trigger OnPreDataItem()
                begin
                    NoOfRecords := Count;
                    NoOfColumns := 2;

                    /*
                    PeriodTrans.RESET;
                    PeriodTrans.SETRANGE(PeriodTrans."Employee Code","prSalary Card"."Employee Code");
                    PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",SelectedPeriod);
                    PeriodTrans.SETRANGE(PeriodTrans."Transaction Code",'NPAY');
                    IF PeriodTrans.FindFirst() =FALSE THEN
                     CurrReport.SKIP;
                     */


                    strNssfNo := '.';
                    strNhifNo := '.';
                    strBank := '.';
                    strBranch := '.';
                    strAccountNo := '.';

                end;
            }

            trigger OnAfterGetRecord()
            var
                CurrYear: Integer;
                BirthYear: Integer;
                RetireDays: Integer;
                currAge: Integer;
            begin
                AgeMessage := '';

                if "Employee"."Date Of Birth" <> 0D then begin
                    CurrYear := Date2dmy(Today, 3);
                    BirthYear := Date2dmy("Employee"."Date Of Birth", 3);
                    currAge := CurrYear - BirthYear;

                    if "Employee".Disabled = true then begin
                        RetireDays := PRVitalSetupInfo."PWD Staff Retirement Age" - currAge;
                    end else begin
                        RetireDays := PRVitalSetupInfo."Other Staff Retirement Age" - currAge;
                    end;

                    AgeMessage := 'You are now ' + Format(currAge) + ' years old ' + Format(RetireDays) + ' years to retire';
                end;




                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue."Global Dimension No.", 1);
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 1 Code");
                if DimensionValue.FindFirst() then begin
                    CountyName := UpperCase(DimensionValue.Name);
                end;
            end;

            trigger OnPreDataItem()
            begin
                //Payslip Message
                PRVitalSetupInfo.Reset;
                PRVitalSetupInfo.Get;
                PayMessage := PRVitalSetupInfo."Payslip Message";
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
        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        PRPayrollPeriods.Reset;
        if PRPayrollPeriods.Get(SelectedPeriod) then PeriodName := PRPayrollPeriods."Period Name";


        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
        CompanyInfo.CalcFields(CompanyInfo."Company Watermark");
    end;

    var
        Addr: array[2, 10] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        intInfo: Integer;
        i: Integer;
        PeriodTrans: Record "PR Period Transactions";
        intRow: Integer;
        Index: Integer;
        HREmployeePR: Record "Employee";
        strEmpName: Text[250];
        strPin: Text[30];
        Trans: array[2, 60] of Text;
        TransAmt: array[2, 60] of Text;
        TransBal: array[2, 60] of Text;
        strGrpText: Text[100];
        strNssfNo: Text[30];
        strNhifNo: Text[30];
        strBank: Text[100];
        strBranch: Text[100];
        strAccountNo: Text[100];
        strMessage: Text[100];
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        dtDOE: Date;
        strEmpCode: Text[30];
        STATUS: Text[30];
        ControlInfo: Record "Company Information";
        dtOfLeaving: Date;
        "Served Notice Period": Boolean;
        dept: Text[30];
        PRBankStructure: Record "PR Bank Branches";

        emploadva: Record "PR Employer Deductions";
        strBankno: Text[30];
        strBranchno: Text[30];
        CompanyInfo: Record "Company Information";
        PRPayrollProcessing: Codeunit "PR Payroll Processing";
        STRGRATUITY: Decimal;
        Gratuitty: array[2, 10] of Decimal;
        Gratuittities: Decimal;
        PRSalaryCard: Record "PR Salary Card";
        EmptyStringCaptionLbl: label '................................................................................................................';
        Employee_CaptionLbl: label 'Employee:';
        Department_CaptionLbl: label 'Department:';
        Period_CaptionLbl: label 'Period:';
        PREmployerContr: Record "PR Employer Deductions";
        PayslipMessage: Text;
        RatePerDay: Decimal;
        NoDaysWorked: Decimal;
        PRPerTrans: Record "PR Period Transactions";
        Spacer: label ' - ';
        CountyName: Text;
        DimensionValue: Record "Dimension Value";
        Bank: Text;
        Branch: Text;
        Account: Text;
        PRVitalSetupInfo: Record "PR Vital Setup Info";
        PayMessage: Text;
        AgeMessage: Text;
}

