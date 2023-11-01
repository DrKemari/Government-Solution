#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59008 "Dialy Work Ticket Header"
{

    fields
    {
        field(1;"Daily Work Ticket";Code[30])
        {
        }
        field(2;"Vehicle Registration No";Code[50])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                WshpFA.Reset;
                WshpFA.SetRange(WshpFA."Registration No.",Rec."Vehicle Registration No");
                if WshpFA.FindFirst then begin
                  Make := WshpFA.Make;
                end;
            end;
        }
        field(3;"Driver Allocated";Code[50])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                   if  HrEmployee.Get("Driver Allocated") then begin
                    "Driver Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                   end;
            end;
        }
        field(4;"Date of Request";Date)
        {
        }
        field(5;Status;Option)
        {
            OptionMembers = Open,"Pending Approval",Released,Rejected,Cancelled,Closed;
        }
        field(6;"No. Series";Code[50])
        {
            Description = 'Stores the number series in the database';
        }
        field(7;Comments;Text[250])
        {
        }
        field(8;Department;Code[20])
        {
        }
        field(9;"Driver Name";Text[250])
        {
        }
        field(10;"Closed by";Code[50])
        {
        }
        field(11;"Date Closed";Date)
        {
        }
        field(12;"Opening Odometer";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(13;"Closing Odometer";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(14;"Created By";Code[50])
        {
        }
        field(15;"Date Created";Date)
        {
        }
        field(16;"Time Created";Time)
        {
        }
        field(17;"Total Km's Covered";Decimal)
        {
            CalcFormula = sum("Daily Work Ticket Lines"."Total Kilometres" where ("Daily Work Ticket"=field("Daily Work Ticket")));
            DecimalPlaces = 0:0;
            FieldClass = FlowField;
        }
        field(18;"Ticket No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Previous Work Ticket No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20;Make;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21;Centre;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;Station;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                */

            end;
        }
        field(24;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                /*
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                */

            end;
        }
        field(25;"Authorized By";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                   if  HrEmployee.Get("Authorized By") then begin
                    "Authorized By Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                   end;
            end;
        }
        field(26;"Authorized By Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Month Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll PeriodX"."Starting Date";

            trigger OnValidate()
            begin
                if PayrollPeriodX.Get("Month Date") then
                "Month Name" := PayrollPeriodX.Name;
            end;
        }
        field(28;"Month Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Daily Work Ticket")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Daily Work Ticket" = '' then begin
             FltMgtSetup.Get;
             FltMgtSetup.TestField(FltMgtSetup."Daily Work Ticket");
             NoSeriesMgt.InitSeries(FltMgtSetup."Daily Work Ticket",xRec."No. Series",0D,"Daily Work Ticket","No. Series");
        end;
        "Created By":=UserId;
        "Date Created":=Today;
        "Time Created":=Time;
        if WorkTH.Get() then  begin
          "Driver Allocated" := WorkTH."Driver Allocated";
        end;
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HrEmployee: Record Employee;
        Vehicleallocated: Record "Fixed Asset";
        VehicleAllocateDpt: Record "Department Vehicle Allocation";
        Usersetup: Record "User Setup";
        Wticket: Record "Dialy Work Ticket Header";
        WshpFA: Record "Fleet Vehicles.";
        WorkTH: Record "Dialy Work Ticket Header";
        PayrollPeriodX: Record "Payroll PeriodX";
}

