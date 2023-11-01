#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50022 "User Setup" extends "User Setup"
{
    fields
    {
        field(50000; "Membership Approver"; Boolean)
        {
        }
        field(50001; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50002; "Accounts Approver"; Boolean)
        {
        }
        field(50003; Pictures; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(50004; "Unlimited Imprest Amt Approval"; Boolean)
        {
        }
        field(50005; "Imprest Amount Approval Limit"; Decimal)
        {
        }
        field(50006; "Unlimited Store RqAmt Approval"; Boolean)
        {
        }
        field(50007; "Store Req. Amt Approval Limit"; Decimal)
        {
        }
        field(50009; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50010; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50011; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50012; "Unlimited ImprestSurr Amt Appr"; Boolean)
        {
        }
        field(50013; "ImprestSurr Amt Approval Limit"; Decimal)
        {
        }
        field(50014; "Unlimited Interbank Amt Appr"; Boolean)
        {
        }
        field(50015; "Interbank Amt Approval Limit"; Decimal)
        {
        }
        field(50016; "Imprest Account"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(50017; UserName; Text[30])
        {
        }
        field(50018; Approvername; Text[30])
        {
        }
        field(50019; Approvermail; Text[30])
        {
        }
        field(50020; "Staff No"; Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF Staff.GET("Staff No")THEN BEGIN
                UserName:=Staff."First Name"+' '+Staff."Middle Name"+' '+Staff."Last Name";
                "E-Mail":=Staff."Company E-Mail";
                "Global Dimension 1 Code":=Staff."HR Department Name";
                "Job Tittle":=Staff."Job Title";
                END
                */

            end;
        }
        field(50021; "Job Tittle"; Text[100])
        {
        }
        field(50022; "Vote User"; Boolean)
        {
        }
        field(50023; Designation; Text[50])
        {
        }
        field(50024; "Allowed To Auto Reverse"; Boolean)
        {
        }
        field(50025; "User Signature"; Blob)
        {
            SubType = Memo;
        }
        field(50026; "Store Requisitioner"; Boolean)
        {
        }
        field(50027; "PV Amount Approval Limit"; Decimal)
        {
        }
        field(50028; "Unlimited PettyAmount Approval"; Boolean)
        {
        }
        field(50029; "Petty C Amount Approval Limit"; Decimal)
        {
        }
        field(50030; "Unlimited PV Amount Approval"; Boolean)
        {
        }
        field(57000; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Employee No.");
                "Employee Name" := Emp."First Name" + ' ' + Emp."Last Name";
                Modify;
            end;
        }
        field(57001; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(57003; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(57006; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(59000; "Create New Job"; Boolean)
        {
            Description = '//Restrict Job creation...Ushindi';
        }
        field(59001; "Update Job Status"; Boolean)
        {
            Description = '//Restrict Job modification...Ushindi';
        }
        field(59002; "Resource No"; Code[20])
        {
            Description = '//Link Resource Code Mapping...Ushindi';
            TableRelation = Resource where(Type = filter(Person));
        }
        field(59015; "Payroll View"; Boolean)
        {
        }
        field(59016; "Post Memo"; Boolean)
        {
        }
        field(59017; "post surrender"; Boolean)
        {
        }
        field(59018; "Post Requisition"; Boolean)
        {
        }
        field(59019; "Accounts User"; Boolean)
        {
            Description = 'Restrict documents view';
        }
        field(59020; "Post Receipts"; Boolean)
        {
        }
        field(59021; "Lock Imprests"; Boolean)
        {
        }
        field(59022; "Procurement officer"; Boolean)
        {
        }
        field(59023; Leave; Boolean)
        {
        }
        field(59024; "Reopen Document"; Boolean)
        {
        }
        field(59025; "Process Claims"; Boolean)
        {
        }
        field(59026; Receiptionist; Boolean)
        {
        }
        field(59027; "Procurement Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59028; CIDO; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59029; "Portal User"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59030; Projects; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59031; "Archive Document"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(59032; "Original Approver ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59033; "From Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(59034; "To Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(59035; "Relieved Approver"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59036; "Delegation Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(59037; "Region Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(70000; "Cancel Invitation For Supply"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Authorized to Cancel Invitation For Supply)';
        }
        field(70001; "Authorize IFS Creator"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70002; "Finance Dept."; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70003; "Post Purchase Documents"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70004; "ICT Administrator"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85000; "Examination Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85001; "Revenue Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85002; "Student Mgmt Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85003; "Exam Support Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85004; "MPESA amounts Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85005; "Examination Results Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85006; "Update FS"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Authorized to update Financial Statements';
        }
        field(85007; "Create Corrective Credit Memo"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85008; "Modify Invoice Posting Date"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85009; "Modify Account Schedules"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85010; "HOD Finance"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85011; "Exam Development"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85012; "Revenue Officer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85013; "Audit & Risk Officer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85014; "Exam Processing"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85015; "Can Change Profile"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85016; "Approval Title"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(85017; "Can Manage Workflow"; Boolean)
        {
            DataClassification = ToBeClassified;
        }


    }


    //Unsupported feature: Property Modification (Id) on "UserSetupManagement(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //UserSetupManagement : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UserSetupManagement : 1651;
    //Variable type has not been exported.
    trigger OnModify()
    var
        UserRec: record "User Setup Permissions";
    begin
        // ProfileID := "Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Modify User Setup" = FALSE then
                ERROR('Please note that you dont have the rights to modify user setup');
        end else begin
            ERROR('Please note that you dont have the rights to modify user setup!');
        end;
    end;

    trigger OnInsert()
    var
        UserRec: record "User Setup Permissions";
    begin
        // ProfileID := "Profile ID";

        if UserRec.get(database.UserId) then begin
            IF UserRec."Can Modify User Setup" = FALSE then
                ERROR('Please note that you dont have the rights to modify user setup');
        end else begin
            ERROR('Please note that you dont have the rights to modify user setup!');
        end;
    end;

    var
        Emp: Record Employee;
}

