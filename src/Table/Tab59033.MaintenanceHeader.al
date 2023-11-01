#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59033 "Maintenance Header"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; Created; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Fixed Asset No"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(8; "Maintenance Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Maintenance.Code;
        }
        field(9; "Maintained On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Maintained By"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Next Maintenance Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(14; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Submitted,Assigned,Escalated,Closed';
            OptionMembers = Open,Submitted,Assigned,Escalated,Closed;
        }
        field(16; "Assigned To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "Assigned To");
                if UserSetup.FindSet then begin
                    if Employee.Get(UserSetup."Employee No.") then begin
                        "Assigned To Employee No" := UserSetup."Employee No.";
                        "Assigned To Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
                        "Assigned On" := Today;
                    end;


                end;
            end;
        }
        field(17; "Assigned To Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";
        }
        field(18; "Assigned To Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Assigned On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;


        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            FASetup.Get;
            FASetup.TestField(FASetup."Maintenance Request  Nos.");
            NoSeriesMgt.InitSeries(FASetup."Maintenance Request  Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;
        Created := CurrentDatetime;
        "Created By" := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            if Employee.Get(UserSetup."Employee No.") then begin

                "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
            end;


        end;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
}

