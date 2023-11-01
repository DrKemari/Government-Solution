#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59070 "File Movement Header"
{
    Caption = 'File Movement Header';

    fields
    {
        field(1;"No.";Code[20])
        {
            Editable = false;
        }
        field(2;"File Number";Code[40])
        {
        }
        field(3;"File Name";Text[100])
        {
        }
        field(4;"Account No.";Code[40])
        {

            trigger OnValidate()
            begin
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.","Account No.");
                if Vendor.Find('-') then
                  "Account Name":=Vendor.Name;
            end;
        }
        field(5;"Account Name";Text[50])
        {
            Editable = false;
        }
        field(6;"Date Requested";Date)
        {
            Editable = false;
        }
        field(7;"Requested By";Code[50])
        {
            Editable = false;
        }
        field(8;"Date Retrieved";Date)
        {
        }
        field(9;"Responsiblity Center";Code[50])
        {
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const("Department/Center"));
        }
        field(10;"Expected Return Date";Date)
        {
            Editable = false;
        }
        field(11;"Duration Requested";DateFormula)
        {

            trigger OnValidate()
            begin
                "Expected Return Date":=CalcDate("Duration Requested",Today);
            end;
        }
        field(12;"Date Returned";Date)
        {
        }
        field(13;"File Location";Code[40])
        {
            TableRelation = "File Locations Setup".Location;
        }
        field(14;"Current File Location";Code[40])
        {
            Editable = false;
            TableRelation = "File Locations Setup".Location;
        }
        field(15;"Retrieved By";Code[40])
        {
        }
        field(16;"Returned By";Code[40])
        {
        }
        field(17;"Global Dimension 1 Code";Code[40])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(1));
        }
        field(18;"Global Dimension 2 Code";Code[40])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(2));
        }
        field(19;Status;Option)
        {
            Editable = false;
            InitValue = Open;
            OptionCaption = ',Open,Pending Approval,Approved,Issued,Returned,Transferred';
            OptionMembers = ,Open,"Pending Approval",Approved,Issued,Returned,Transferred;
        }
        field(20;"User ID";Code[40])
        {
            Editable = false;
        }
        field(21;"Issuing File Location";Code[40])
        {
            TableRelation = "File Locations Setup".Location;
        }
        field(22;"No. Series";Code[20])
        {
        }
        field(23;"File Movement Status";Option)
        {
            Editable = false;
            InitValue = Open;
            OptionCaption = 'Open,Issued,Returned,Transferred';
            OptionMembers = Open,Issued,Returned,Transferred;
        }
        field(24;"Recieved By";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Issued By";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Issued By");
                if Employee.FindSet then
                  "Issued By Name":=Employee."First Name"+' '+Employee."Last Name";
            end;
        }
        field(26;"Issued By Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"To Account Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29;Version;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(30;"To Responsibility Center";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(31;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,File Movement,Other';
            OptionMembers = " ","File Movement",Other;
        }
        field(32;"Action Office";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;

            trigger OnValidate()
            begin
                // IF RC.GET("Action Office") THEN
                //  "Action Office Name" := RC.Name;
            end;
        }
        field(33;"Action Office Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Action Officer";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                // Employee.RESET;
                // Employee.SETRANGE(Employee."No.","Action Officer");
                // IF Employee.FIND('-') THEN BEGIN
                // "Action Officer Name":=Employee.FullName;
                //  "Responsiblity Center":=Employee."Global Dimension 1 Code";
                // END;
            end;
        }
        field(35;"Action Officer Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"File Number.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Registry File Creation"."File No" where (Status=const(Current),
                                                                      Disposed=const(false));

            trigger OnValidate()
            begin
                RegistryFile.Reset;
                RegistryFile.SetRange(RegistryFile."File No","File Number.");
                if RegistryFile.FindFirst then
                  "File Subject" := RegistryFile."File Name";
            end;
        }
        field(37;"File Subject";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Dispatch Officer";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.","Dispatch Officer");
                if Employee.Find('-') then begin
                 "Dispatch Officer Name":=Employee.FullName;
                  //"Responsiblity Center":=Employee."Global Dimension 1 Code";
                end;
            end;
        }
        field(39;"Dispatch Officer Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Document Received";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"To Account No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                // Employee.RESET;
                // Employee.SETRANGE(Employee."No.","To Account No.");
                // IF Employee.FIND('-') THEN BEGIN
                //  "To Account Name":=Employee.FullName;
                //  "To Responsibility Center":=Employee."Department Code";
                // END;
            end;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('You do not have permissions to delete this record, Please contact the system administrator');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
           GenLedgerSetup.Get;
            GenLedgerSetup.TestField(GenLedgerSetup."File Movement No. Series");
          NoSeriesMgt.InitSeries(GenLedgerSetup."File Movement No. Series",xRec."No. Series",0D,"No.","No. Series");
        end;
        //Set To Defaut On Insert A New Rec-Kimoo
        "Date Requested":=Today;
        "User ID":=UserId;
        "Requested By":=UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID",UserId);
        if UserSetup.FindFirst then
          "Account No.":=UserSetup."Employee No.";
        "Account Name":=UserSetup."Employee Name";
    end;

    trigger OnModify()
    begin
        //ERROR('You do not have permissions to modify this record, Please contact the system administrator');
    end;

    trigger OnRename()
    begin
        //ERROR('You do not have permissions to rename this record, Please contact the system administrator');
    end;

    var
        GenLedgerSetup: Record "File Locations Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
        Employee: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        FileMovementEntry: Record "File Movement Entry";
        RC: Record "Responsibility Center";
        RegistryFile: Record "Registry File Creation";
        UserSetup: Record "User Setup";
        Employeess: Record Employee;
}

