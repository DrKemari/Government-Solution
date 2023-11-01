#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59079 "Inward Mail Register"
{

    fields
    {
        field(1;"Mail Register No";Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Mail Register No" <> xRec."Mail Register No" THEN BEGIN
                //    FileLocationsSetup.GET;
                //    //FileLocationsSetup.GET;
                //    NoSeriesManagement.TestManual(FileLocationsSetup."Inward Mail RegisterNo.Series");
                //   "No. Series" := '';
                // END;
            end;
        }
        field(2;"Date received";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Date of letter";Date)
        {
            Caption = 'Date of Dispatch';
            DataClassification = ToBeClassified;
        }
        field(4;"Organization Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Author Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Subject;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"File No";Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Registry File Creation"."File No";
        }
        field(8;"File folio";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. Series";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Incoming Mail,Outgoing Mail';
            OptionMembers = "Inward Register","Outward Register";
        }
        field(11;"Assigned Employee";Code[40])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.","Assigned Employee");
                if Employee.Find('-') then begin
                  "Assigned Employee Names":=Employee.FullName;
                  "Assigned Employee Dept":=Employee."Department Code";
                end;
            end;
        }
        field(12;"Assigned Employee Names";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Assigned Employee Dept";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Dispatched;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Dispatched By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Dispatched Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Dispatch Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Reference Number";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Bring Up Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";
        }
        field(23;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24;"Assigned UserID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID","Assigned UserID");
                if UserSetup.FindSet then
                  "Assigned Employee":=UserSetup."Employee No.";
                Validate("Assigned Employee");
            end;
        }
    }

    keys
    {
        key(Key1;"Mail Register No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type"="document type"::"Inward Register" then begin
        if "Mail Register No" = '' then begin
          FileLocationsSetup.Get;
           //FileLocationsSetup.GET;
            FileLocationsSetup.TestField(FileLocationsSetup."Inward Mail RegisterNo.Series");
           NoSeriesManagement.InitSeries(FileLocationsSetup."Inward Mail RegisterNo.Series",xRec."No. Series",0D,"Mail Register No","No. Series");
        end;
        end;
        if "Document Type"="document type"::"Outward Register" then begin
        if "Mail Register No" = '' then begin
          FileLocationsSetup.Get;
           //FileLocationsSetup.GET;
            FileLocationsSetup.TestField(FileLocationsSetup."Outward Mail Register Nos");
           NoSeriesManagement.InitSeries(FileLocationsSetup."Outward Mail Register Nos",xRec."No. Series",0D,"Mail Register No","No. Series");
        end;
        end;
        UserSetup.Reset;
        UserSetup.SetRange("User ID",UserId);
        if UserSetup.FindSet then begin
          "Created By":=UserId;
          "Employee No":=UserSetup."Employee No.";
          "Employee Name":=UserSetup."Employee Name";
          "Created On":=CurrentDatetime;


        end;
    end;

    var
        NoSeries: Record "No. Series";
        FileLocationsSetup: Record "File Locations Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        UserSetup: Record "User Setup";
}

