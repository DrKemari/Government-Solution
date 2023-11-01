#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69205 "HR Leave Application"
{

    fields
    {
        field(1; "Application Code"; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Application Code" <> xRec."Application Code" then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Leave Application Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(3; "Leave Type"; Code[30])
        {
            TableRelation = "HR Leave Types".Code;

            trigger OnValidate()
            var
                CountLeaves: Integer;
                YearofApplication: Integer;
            begin
                /*29/05/2019
                objLeaveApps.RESET;
                objLeaveApps.SETRANGE(objLeaveApps."Employee No","Employee No");
                objLeaveApps.SETRANGE(objLeaveApps."Start Date","Start Date");
                //objLeaveApps.SETRANGE();
                IF objLeaveApps.FIND('-') THEN BEGIN
                IF objLeaveApps."Application Code"<>"Application Code" THEN
                ERROR('The Staff has an existing leave application starting on the same date, %1',objLeaveApps."Application Code" );
                END;
                */


                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(HRLeaveTypes.Code, "Leave Type");
                if HRLeaveTypes.Find('-') then begin
                    HREmp.Reset;
                    HREmp.SetRange(HREmp."No.", "Employee No");
                    HREmp.SetRange(HREmp.Gender, HRLeaveTypes.Gender);
                    if HREmp.Find('-') then
                        exit
                    else
                        if HRLeaveTypes.Gender <> HRLeaveTypes.Gender::Both then
                            Error('This leave type is restricted to the ' + Format(HRLeaveTypes.Gender) + ' gender');
                end;


                //Allow maximum of two Maternity Leaves
                YearofApplication := Date2dmy(Today, 3);
                CountLeaves := 0;
                if "Leave Type" = 'MATERNITY' then begin
                    objLeaveApps.Reset;
                    //    objLeaveApps.SetRange(objLeaveApps.Status, objLeaveApps.Status::"10");
                    objLeaveApps.SetRange(objLeaveApps."Employee No", "Employee No");
                    objLeaveApps.SetRange(objLeaveApps."Leave Type", "Leave Type");
                    if objLeaveApps.FindSet then
                        repeat
                            Message(Format(objLeaveApps."Application Code"));
                            if Date2dmy(objLeaveApps."Application Date", 3) = YearofApplication then
                                CountLeaves := CountLeaves + 1;
                            Message(Format(CountLeaves));
                        until objLeaveApps.Next = 0;
                    if CountLeaves > 1 then Error(TEXT003);
                end;
                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(Code, "Leave Type");
                HRLeaveTypes.SetRange("Posting Type", HRLeaveTypes."posting type"::"Off Days");
                if HRLeaveTypes.FindSet then begin
                    Employ.Reset;
                    Employ.SetRange("No.", "Employee No");
                    if Employ.FindSet then begin
                        Employ.CalcFields("Leave Outstanding Bal");
                        if Employ."Leave Outstanding Bal" > 15 then begin
                            Error('Error!, Kindly utilize your Annual leave days instead');
                        end;
                    end;
                end;

                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(Code, "Leave Type");
                HRLeaveTypes.SetRange("Posting Type", HRLeaveTypes."posting type"::Compassionate);
                if HRLeaveTypes.FindSet then begin
                    Employ.Reset;
                    Employ.SetRange("No.", "Employee No");
                    if Employ.FindSet then begin
                        Employ.CalcFields("Leave Outstanding Bal");
                        if Employ."Leave Outstanding Bal" > 0 then begin
                            Error('Error!, Kindly utilize your Annual leave days instead');
                        end;
                    end;
                end;

                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(Code, "Leave Type");
                HRLeaveTypes.SetRange("Posting Type", HRLeaveTypes."posting type"::"Terminal Leave");
                if HRLeaveTypes.FindSet then begin
                    Employ.Reset;
                    Employ.SetRange("No.", "Employee No");
                    if Employ.FindSet then begin
                        if Employ."Age in Years" < 50 then begin
                            Error('Error!, Terminal leave is only applicable to Employees over 50 Years Old');
                        end;
                    end;
                end;

            end;
        }
        field(4; "Days Applied"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                TestField("Leave Type");
                //CALCULATE THE END DATE AND RETURN DATE
                if "Days Applied" < 0 then
                    Error(TEXT002);
                /*
                BEGIN
                IF ("Days Applied" <> 0) AND ("Start Date" <> 0D) THEN
                "Return Date" := DetermineLeaveReturnDate("Start Date","Days Applied");
                "End Date" := DeterminethisLeaveEndDate("Return Date");
                MODIFY;
                END;
                */

                if "Annual Leave Type" = "annual leave type"::"Emergency Leave" then begin
                    HumanResSetup.Get;
                    if "Days Applied" > HumanResSetup."Gratuity Percentage." then
                        Error('You are only allowed to apply a maximum of %1 Days for Emergency Leave', HumanResSetup."Gratuity Percentage.");
                end;

            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
                RelieverCode: Code[30];
                Emp: Record Employee;
            begin
                GeneralOptions.Get;
                HRSetup.Get;
                if "Start Date" = 0D then begin
                    //"Return Date":=0D;
                    exit;
                end else begin
                    if DetermineIfIsNonWorking("Start Date") = true then begin
                        ;
                        Error('Start date must be a working day');
                    end;
                end;

                if HRLeaveTypes.Get("Leave Type") then begin
                    if (HRLeaveTypes.Code = 'ANNUAL') then begin
                        if ("Annual Leave Type" = "annual leave type"::"Annual Leave") then begin
                            if "Start Date" < CalcDate(Format(HRLeaveTypes."Grace Period(in Days )") + 'D', Today) then
                                Error('Annual Leave Type must have a notice period of %1 Days... Please select date after %2 ', HRLeaveTypes."Grace Period(in Days )", CalcDate(Format(HRLeaveTypes."Grace Period(in Days )") + 'D', Today));
                        end;
                    end;
                end;

                NoOfWorkingDays := 0;
                if "Days Applied" <> 0 then begin
                    if "Start Date" <> 0D then begin
                        NextWorkingDate := "Start Date";

                        repeat
                            //  if not CalendarMgmt.CheckDateStatus(HRSetup."Base Calender Code", NextWorkingDate, Description) then
                            NoOfWorkingDays := NoOfWorkingDays + 1;

                            if LeaveTypes.Get("Leave Type") then begin
                                if LeaveTypes."Inclusive of Holidays" then begin
                                    BaseCalendar.Reset;
                                    BaseCalendar.SetRange("Base Calendar Code", HRSetup."Base Calender Code");
                                    BaseCalendar.SetRange(Date, NextWorkingDate);
                                    BaseCalendar.SetRange(Nonworking, true);
                                    BaseCalendar.SetRange("Recurring System", BaseCalendar."recurring system"::"Annual Recurring");
                                    if BaseCalendar.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('Holiday =%1 Day of week %2',BaseCalendar.Date,BaseCalendar.Description);
                                    end;

                                end;

                                if LeaveTypes."Inclusive of Non Working Days" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 6);

                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        // MESSAGE('SATURDAY =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Inclusive of Non Working Days" then begin
                                    BaseCalender.Reset;
                                    BaseCalender.SetRange(BaseCalender."Period Type", BaseCalender."period type"::Date);
                                    BaseCalender.SetRange(BaseCalender."Period Start", NextWorkingDate);
                                    BaseCalender.SetRange(BaseCalender."Period No.", 7);
                                    if BaseCalender.Find('-') then begin
                                        NoOfWorkingDays := NoOfWorkingDays + 1;
                                        //  MESSAGE('Sunday =%1 Day of week %2',BaseCalender."Period Start",BaseCalender."Period Name");
                                    end;
                                end;


                                if LeaveTypes."Off/Holidays Days Leave" then
                                ;

                            end;

                            NextWorkingDate := CalcDate('1D', NextWorkingDate);
                        until NoOfWorkingDays = "Days Applied";
                        "End Date" := NextWorkingDate - 1;
                        "Return Date" := NextWorkingDate;
                    end;
                end;

                //check if the date that the person is supposed to report back is a working day or not
                //get base calendar to use
                HumanResSetup.Reset();
                HumanResSetup.Get();
                HumanResSetup.TestField(HumanResSetup."Base Calender Code");
                NonWorkingDay := false;
                if "Start Date" <> 0D then begin
                    while NonWorkingDay = false
                      do begin
                        // NonWorkingDay := CalendarMgmt.CheckDateStatus(HumanResSetup."Base Calender Code", "Return Date", Dsptn);
                        if NonWorkingDay then begin
                            NonWorkingDay := false;
                            "Return Date" := CalcDate('1D', "Return Date");
                        end
                        else begin
                            NonWorkingDay := true;
                        end;
                    end;
                end;

                /*
                
                VALIDATE("Leave Type");
                
                IF "Leave Type"<>'EMERGENCY' THEN BEGIN
                    Calendar.RESET;
                    Calendar.SETRANGE("Period Type",Calendar."Period Type"::Date);
                    Calendar.SETFILTER("Period Start",'%1..%2',TODAY,"Start Date");
                    empMonths := Calendar.COUNT;
                END ELSE
                     empMonths := 0;
                
                {IF "Leave Type"<>'EMERGENCY' THEN BEGIN
                 IF empMonths<30 THEN ERROR('You have to apply for leave one month earlier');
                END;}
                */
                //insert reliever from user setup
                // UserSetup.RESET;
                // UserSetup.SETRANGE("User ID","Requester ID");
                // IF UserSetup.FINDFIRST THEN BEGIN
                // RelieverCode:=UserSetup.Substitute;
                // Emp.RESET;
                // Emp.SETRANGE("User ID",RelieverCode);
                // IF Emp.FINDFIRST THEN BEGIN
                // Reliever:=Emp."No.";
                // VALIDATE(Reliever);
                // END
                // END

            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';
            Editable = true;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(12; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Rejected,Released';
            OptionMembers = Open,"Pending Approval",Rejected,Released;

            trigger OnValidate()
            begin
                if Status = Status::Released then begin
                    /*intEntryNo:=0;
                    HRLeaveEntries.RESET;
                    HRLeaveEntries.SETRANGE(HRLeaveEntries."Entry No.");
                     IF HRLeaveEntries.FIND('+') THEN intEntryNo:=HRLeaveEntries."Entry No.";

                    intEntryNo:=intEntryNo+1;

                    HRLeaveEntries.INIT;
                    HRLeaveEntries."Entry No.":=intEntryNo;
                    HRLeaveEntries."Staff No.":="Employee No";
                    HRLeaveEntries."Staff Name":= Names;
                    HRLeaveEntries."Posting Date":=TODAY;
                    HRLeaveEntries."Leave Entry Type":=HRLeaveEntries."Leave Entry Type"::Negative;
                    HRLeaveEntries."Leave Approval Date":="Application Date";
                    HRLeaveEntries."Document No.":="Application Code";
                    HRLeaveEntries."External Document No.":="Employee No";
                    HRLeaveEntries."Job ID":="Job Tittle";
                    HRLeaveEntries."No. of days":="Days Applied";
                    HRLeaveEntries."Leave Start Date":="Start Date";
                    HRLeaveEntries."Leave Posting Description":='Leave';
                    HRLeaveEntries."Leave End Date":="End Date";
                    HRLeaveEntries."Leave Return Date":="Return Date";
                    HRLeaveEntries."User ID" :="User ID";
                    HRLeaveEntries."Leave Type":="Leave Type";
                    HRLeaveEntries.INSERT;
                    */
                    /*
                    dTaken := 0;
                    IF HREmp.GET("Employee No") THEN BEGIN
                      HREmp.CALCFIELDS(HREmp."Total Leave Taken");
                      dTaken := HREmp."Total Leave Taken";
                    END;
                    CummDays := "Days Applied" + ABS(dTaken);
                    IF "Leave Type" = 'ANNUAL' THEN BEGIN
                      HRSetup.GET();
                      AssignMatrixX.RESET;
                      AssignMatrixX.SETRANGE(AssignMatrixX."Employee No","Employee No");
                      AssignMatrixX.SETRANGE(AssignMatrixX.Code,HRSetup."Leave Allowance Code");
                      AssignMatrixX.SETRANGE(AssignMatrixX."Payroll Period",HRSetup."Leave Posting Period[FROM]",HRSetup."Leave Posting Period[TO]");
                      IF NOT AssignMatrixX.FINDSET THEN BEGIN
                        IF CummDays > 15 THEN BEGIN
                          AssignmentMatrixX.INIT;
                          AssignmentMatrixX.Code := HRSetup."Leave Allowance Code";
                          AssignmentMatrixX."Employee No" :="Employee No";
                          AssignmentMatrixX.VALIDATE(AssignmentMatrixX.Code);
                          AssignmentMatrixX."Payroll Period" := CALCDATE('<CM+1D>', TODAY);
                          IF AssignmentMatrixX.INSERT THEN
                            MESSAGE('Leave allowance allocated for the period %1',CALCDATE ('<CM+1D>', TODAY));
                        END;
                      END;
                    END;*/
                    /* HRLeaveApp.RESET;
                     HRLeaveApp.SETRANGE(HRLeaveApp."Application Code","Application Code");
                     IF HRLeaveApp.FIND('-')THEN BEGIN
                     HRLeaveApp.CreateLeaveLedgerEntries;
                     END;
                          //Dave---To notify leave applicant
                     IF CONFIRM('Do you wish to notify the employee')=TRUE THEN BEGIN
                     HREmp.GET("Employee No");
                     HREmp.TESTFIELD(HREmp."Company E-Mail");

                     //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
                     HREmailParameters.RESET;
                     HREmailParameters.SETRANGE(HREmailParameters."Associate With",HREmailParameters."Associate With"::General);
                     IF HREmailParameters.FIND('-') THEN
                     BEGIN
                          HREmp.TESTFIELD(HREmp."Company E-Mail");
                          //SMTP.Create(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
                          HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
                          HREmailParameters.Body+' '+"Application Code"+' '+ HREmailParameters."Body 2",TRUE);
                          //SMTP.Send();
                     END;
                     END;
                     */
                end;

            end;
        }
        field(14; test; Code[10])
        {
        }
        field(15; "Applicant Comments"; Text[250])
        {
        }
        field(17; "No series"; Code[30])
        {
        }
        field(28; Selected; Boolean)
        {
        }
        field(30; tes; Code[10])
        {
        }
        field(31; "Current Balance"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("Employee No"),
                                                                             Closed = const(false)));
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;
        }
        field(3900; "End Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                Validate("End Date");
                Validate("Leave Type");
            end;
        }
        field(3901; "Total Taken"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(3921; "E-mail Address"; Text[60])
        {
            Editable = true;
            ExtendedDatatype = EMail;
        }
        field(3924; "Entry No"; Integer)
        {
        }
        field(3929; "Start Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(3936; "Cell Phone Number"; Text[50])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
        }
        field(3939; Picture; Blob)
        {
        }
        field(3940; Names; Text[100])
        {
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
        }
        field(3945; "Details of Examination"; Text[200])
        {
        }
        field(3947; "Date of Exam"; Date)
        {
        }
        field(3949; Reliever; Code[50])
        {
            TableRelation = if ("CEO Checker" = filter(false)) Employee."No." where(Status = const(Active),
                                                                                   "Department Code" = field("Department Code"))
            else
            if ("CEO Checker" = filter(true)) Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                //DISPLAY RELEIVERS NAME
                if Reliever = "Employee No" then
                    Error('Employee cannot relieve him/herself');/*
                //Check if the current reliever has a leave request at that duration or is already tagged to another  request
                HRLeaveApp1.RESET;
                HRLeaveApp1.SETRANGE(Reliever,Reliever);
                HRLeaveApp1.SETRANGE("Start Date","Start Date","Return Date");
                HRLeaveApp1.SETFILTER(Status,'=%1|%2',HRLeaveApp1.Status::"Pending Approval",HRLeaveApp1.Status::Released);
                IF HRLeaveApp1.FINDSET THEN BEGIN
                  ERROR('The reliever has an existing leave relieving starting from %1',"Start Date");
                END;
                HRLeaveApp1.RESET;
                HRLeaveApp1.SETRANGE("Employee No",Reliever);
                HRLeaveApp1.SETFILTER("Start Date",'%1..%2',"Start Date","End Date");
                HRLeaveApp1.SETFILTER(Status,'=%1|%2',HRLeaveApp1.Status::"Pending Approval",HRLeaveApp1.Status::Released);
                IF HRLeaveApp1.FINDSET THEN BEGIN
                  ERROR('The reliever has an existing leave application starting from %1',"Start Date");
                END;
                */

                if HREmp.Get(Reliever) then
                    "Reliever Name" := HREmp.FullName;

            end;
        }
        field(3950; "Reliever Name"; Text[100])
        {
        }
        field(3952; Description; Text[30])
        {
        }
        field(3955; "Supervisor Email"; Text[50])
        {
        }
        field(3956; "Number of Previous Attempts"; Text[200])
        {
        }
        field(3958; "Job Tittle"; Text[50])
        {
        }
        field(3959; "User ID"; Code[50])
        {
        }
        field(3961; "Employee No"; Code[20])
        {

            trigger OnValidate()
            begin
                if Employees.Get("Employee No") then begin
                    "Shortcut Dimension 1 Code" := Employees."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    Designation := Employees."Job Title";
                    "Job Tittle" := Employees."Job Title";

                    "Directorate Code" := Employees."Directorate Code";
                    Validate("Directorate Code");
                    "Department Code" := Employees."Department Code";
                    Validate("Department Code");
                    Division := Employees.Division;
                    "Responsibility Center" := Employees."Responsibility Center";
                    //VALIDATE(Division);
                    "Shortcut Dimension 1 Code" := Employees."Global Dimension 1 Code";
                    Validate("Shortcut Dimension 1 Code");
                    "Shortcut Dimension 2 Code" := Employees."Global Dimension 2 Code";
                    Validate("Shortcut Dimension 2 Code");

                    if Employees.Supervisor <> '' then
                        Validate(Supervisor, Employees.Supervisor)
                    else begin
                        if UserSetup.Get(UserId) then begin

                            Supervisor := UserSetup."Approver ID";
                            "CEO Checker" := Employees.CEO;
                        end;
                    end;
                    //reliver to be added Automatically
                    if Employees."Reliver Code" <> '' then begin
                        Validate(Reliever, Employees."Reliver Code");
                    end;

                end;

                /*IF Staff.GET("Staff No")THEN BEGIN
                UserName:=Staff."First Name"+' '+Staff."Middle Name"+' '+Staff."Last Name";
                "E-Mail":=Staff."Company E-Mail";
                "Global Dimension 1 Code":=Staff."HR Department Name";
                "Job Tittle":=Staff."Job Title";
                END
                */

            end;
        }
        field(3962; Supervisor; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(3969; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(3970; "Approved days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Approved days" > "Days Applied" then
                    Error(TEXT001);
            end;
        }
        field(3971; Attachments; Integer)
        {
            CalcFormula = count(Documents where("Doc No." = field("Application Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3972; Emergency; Boolean)
        {
            Description = 'This is used to ensure one can apply annual leave which is emergency';
        }
        field(3973; "Approver Comments"; Text[200])
        {
        }
        field(3974; RelieverAddress; Text[50])
        {
            CalcFormula = lookup(Employee."Company E-Mail" where("No." = field(Reliever)));
            FieldClass = FlowField;
        }
        field(3975; Grade; Code[10])
        {
        }
        field(3976; Reason; Text[50])
        {
        }
        field(3977; Department; Text[30])
        {
        }
        field(3978; Posted; Boolean)
        {
        }
        field(3979; "Employee Name"; Text[250])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(3980; "Resumption Date"; Date)
        {
        }
        field(3981; "Job ID"; Code[20])
        {
            CalcFormula = lookup(Employee."Job ID" where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(3982; Designation; Text[100])
        {
            Editable = false;

            trigger OnValidate()
            begin
                Validate("Employee No");
            end;
        }
        field(3983; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(3984; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(50014; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50015; HOD; Boolean)
        {
            CalcFormula = lookup(Employee.HOD where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(50019; "Requester ID"; Code[50])
        {
            Editable = true;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(50020; "Annual Leave Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Annual Leave,Emergency Leave,Compassionate Leave';
            OptionMembers = " ","Annual Leave","Emergency Leave","Compassionate Leave";

            trigger OnValidate()
            begin
                // if ("Leave Type" <> 'ANNUAL') then begin
                //     Error('This option is only accessible for annual leave');
                // end;
            end;
        }
        field(50021; "CEO Checker"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code Where("Global Dimension No." = const(2));
            // TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
            //    "Direct Reports To" = field("Directorate Code"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code Where("Global Dimension No." = const(1));
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code Where("Global Dimension No." = const(3));
            // TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
            //         "Direct Reports To" = field("Department Code"));
        }
        field(70020; CEO; Boolean)
        {
            CalcFormula = lookup(Employee.CEO where("No." = field("Employee No")));
            FieldClass = FlowField;
        }
        field(70021; Cancelled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Employee Name", "Approved days", "Start Date")
        {
        }
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then Error('You cannot delete this leave application');
    end;

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
        HrLeaveApplication: Record "HR Leave Application";
    begin
        /* IF ("Requester ID"<>'KEMRI\ERPPORTAL') THEN BEGIN
             HrLeaveApplication.RESET;
             HrLeaveApplication.SETRANGE(HrLeaveApplication.Posted,FALSE);
             HrLeaveApplication.SETRANGE(HrLeaveApplication."Requester ID",USERID);
              //IF LoansR."Client Name"='' THEN BEGIN
                IF HrLeaveApplication.COUNT >1 THEN
                BEGIN
                    ERROR('You still have Untilised some Open Leave Applications. Please utilise them first');
                END;
          END;
          */
        if ("Requester ID" = 'EMPOWER\ERPPORTAL') then begin
            HrLeaveApplication.Reset;
            HrLeaveApplication.SetRange(HrLeaveApplication.Posted, false);
            HrLeaveApplication.SetRange(HrLeaveApplication."Employee No", "Employee No");
            //IF LoansR."Client Name"='' THEN BEGIN
            if HrLeaveApplication.Count > 1 then begin
                Error('You still have Untilised some Open Leave Applications. Please utilise them first');
            end;
        end;

        //---------GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Application Code" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Leave Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Application Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;
        //MESSAGE('User ID %1',USERID);
        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE LEAVE APPLICATION TABLE
        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Employee No" := HREmp."No.";
            "Directorate Code" := HREmp."Directorate Code";
            "Department Code" := HREmp."Department Code";
            Division := HREmp.Division;
            "Shortcut Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := HREmp."Global Dimension 2 Code";

            /*//---------New staff (Upon completing one year of employment)---------Changed to 3 months--------------------------

            IF (HREmp."Date Of Joining the Company" <> 0D) AND (TODAY > HREmp."Date Of Joining the Company") THEN BEGIN
                Calendar.RESET;
                Calendar.SETRANGE("Period Type",Calendar."Period Type"::Month);
                Calendar.SETRANGE("Period Start",HREmp."Date Of Joining the Company",TODAY);
                empMonths := Calendar.COUNT;
            END ELSE
                 empMonths := 0;

            IF empMonths<3 THEN ERROR('You cannot apply for leave until your are over 3 months old in the company');
            //---------END New staff (Upon completing one year of employment)-----------------------------------
            */

            empMonths := 0;
            //START Existing staff (3 months into the leave year)----------------------------------------------------
            objLeaveApps.Reset;
            objLeaveApps.SetRange(objLeaveApps."Employee No", HREmp."No.");
            //  objLeaveApps.SetRange(objLeaveApps.Status, objLeaveApps.Status::"7");
            if objLeaveApps.Find('+') then begin
                if (objLeaveApps."Return Date" <> 0D) and (Today > objLeaveApps."Return Date") then begin
                    Calendar.Reset;
                    Calendar.SetRange("Period Type", Calendar."period type"::Month);
                    Calendar.SetRange("Period Start", objLeaveApps."Return Date", Today);
                    empMonths := Calendar.Count;
                end;
            end
            else
                empMonths := 4; //Change to 4 months to ensure if one has never applied for a leave he can do it

            //IF empMonths<3 THEN ERROR('You cannot apply for leave until seven months are over since the last leave'); TEmporary for trianing

            //-------------------------------------------------------------------------------------------------


            HREmp.Get(HREmp."No.");
            "Job Tittle" := HREmp."Job Title";
            //  HREmp.CalcFields(HREmp.Picture);
            Supervisor := HREmp.Supervisor;
            // Picture := HREmp.Picture;
            "User ID" := UserId;
        end else begin
            if UserSetup.Get(UserId) then begin
                if not UserSetup."Portal User" then begin
                    Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance')
                end;
            end;
        end;
        //GET LEAVE APPROVER DETAILS FROM USER SETUP TABLE COPY THEM TO THE LEAVE APPLICATION TABLE

        UserSetup.Reset;
        if UserSetup.Get(Supervisor) then begin
            "Supervisor Email" := UserSetup."E-Mail";
        end;


        //POPULATE FIELDS
        "Application Date" := Today;
        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin

            "Requester ID" := UserId;
            "Employee No" := UserSetup."Employee No.";
            "Employee Name" := UserSetup."Employee Name";
        end;
        /*//commented on 29/05/2019
       leave.RESET;
       leave.SETRANGE(leave.Status,leave.Status::Open);
       //leave.SETRANGE(leave."Document Type","Document Type");
       leave.SETRANGE(leave."Employee No","Employee No");
       leave.SETFILTER("Application Code",'<>%1',"Application Code");
       IF leave.FIND('-') THEN
       BEGIN
       ERROR(Text005,leave."Application Code");
       END
       */

    end;

    trigger OnModify()
    begin
        Validate(Status);
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HumanResSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        SMTP: Codeunit "Email Message";
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        TEXT001: label 'Days Approved cannot be more than applied days';
        HRLeaveEntries: Record "HR Leave Ledger Entries";
        intEntryNo: Integer;
        Calendar: Record Date;
        empMonths: Integer;
        objLeaveApps: Record "HR Leave Application";
        mWeekDay: Integer;
        empGender: Option Female;
        mMinDays: Integer;
        TEXT002: label 'Days Applied For cannot be negative';
        TEXT003: label 'You can not apply for more than two Maternity Leaves in one year';
        NoOfWorkingDays: Integer;
        NextWorkingDate: Date;
        CalendarMgmt: Codeunit "Calendar Management";
        BaseCalendar: Record "Base Calendar Change";
        BaseCalender: Record Date;
        NonWorkingDay: Boolean;
        GeneralOptions: Record "Company Information";
        HRSetup: Record "Human Resources Setup";
        LeaveTypes: Record "HR Leave Types";
        Dsptn: Text[50];
        DimMgt: Codeunit DimensionManagement;
        Employees: Record Employee;
        leave: Record "HR Leave Application";
        Text005: label 'The Leave Application %1 you have created is still open. Kindly reuse it to avoid too many open documents';
        CummDays: Integer;
        dTaken: Decimal;
        AssignmentMatrixX: Record "Assignment Matrix-X";
        EarnX: Record EarningsX;
        AssignMatrixX: Record "Assignment Matrix-X";
        HRLeaveApp: Record "HR Leave Application";
        HRLeaveApp1: Record "HR Leave Application";
        Employ: Record Employee;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking("Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        //MESSAGE('varDaysApplied,%1,%2',varDaysApplied,fReturnDate);
        until varDaysApplied = 0;

        //If Date to return is saturday add 2 days to returen on monday
        //IF DetermineIfIncludesNonWorking("Leave Type") =FALSE THEN BEGIN
        mWeekDay := Date2dwy(fReturnDate, 1);
        if mWeekDay = 6 then
            fReturnDate := CalcDate('+2D', fReturnDate)
        else
            if mWeekDay = 7 then
                fReturnDate := CalcDate('+1D', fReturnDate);

        exit(fReturnDate);
        //END;
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin
        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calender Code");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);
        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then
                Message('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
        Message('fEndDate,%1', fEndDate);
    end;


    procedure CreateLeaveLedgerEntries()
    begin
        if Posted = true then Error('Leave Already posted');
        if "Approved days" = 0 then
            "Approved days" := "Days Applied";
        TestField("Approved days");

        HRSetup.Reset;
        if HRSetup.Find('-') then begin

            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            //MESSAGE('template name%1',HRSetup."Leave Template");
            //MESSAGE('template name%1',HRSetup."Leave Batch");
            LeaveGjline.DeleteAll;
            //Dave
            //HRSetup.TESTFIELD(HRSetup."Leave Template");
            //HRSetup.TESTFIELD(HRSetup."Leave Batch");

            HREmp.Get("Employee No");
            HREmp.TestField(HREmp."Company E-Mail");

            //POPULATE JOURNAL LINES

            "LineNo." := 10000;
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";
            HRLeavePeriods.Reset;
            HRLeavePeriods.SetRange(HRLeavePeriods.Closed, false);
            if HRLeavePeriods.Find('-') then begin
                LeaveGjline."Leave Period" := Format(HRLeavePeriods.Code);
            end;
            LeaveGjline."Leave Application No." := "Application Code";
            LeaveGjline."Document No." := "Application Code";
            LeaveGjline."Staff No." := "Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."leave entry type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := 'Leave Taken';
            LeaveGjline."Leave Type" := "Leave Type";
            LeaveGjline."Leave Start Date" := "Start Date";
            //------------------------------------------------------------
            //HRSetup.RESET;
            //HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := "Approved days";
            if LeaveGjline."No. of Days" <> 0 then
                LeaveGjline.Insert(true);
            //Post JournaERROR('tumefika');
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.Find('-') then begin
                Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", LeaveGjline);
            end;
            Posted := true;
            if HREmp.Get("Employee No") then begin
                HREmp."Leave Status" := HREmp."leave status"::"On Leave"
            end;
            Modify(true);

            /*END ELSE BEGIN
            ERROR('You must specify no of days');
            END;
            END;*/
            //NotifyApplicant;
        end;

    end;


    procedure NotifyApplicant()
    begin
        HREmp.Get("Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
            //     HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            //     HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
            //SMTP.Send();


            Message('Leave applicant has been notified successfully');
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        if "Application Code" <> '' then
            Modify;
    end;


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        //  "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //  "Dimension Set ID", StrSubstNo('%1', "Application Code"),
        //  "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;
}

