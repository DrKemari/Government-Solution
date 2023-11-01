#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85317 "Curriculum Resource Lines"
{

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Job No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Job Task Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"),
                                                             "Job Task Type" = filter("Begin-Total"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange("Job No.", "Job No");
                JobTask.SetRange("Job Task No.", "Job Task Code");
                if JobTask.FindSet then begin
                    "Job Task Description" := JobTask.Description;

                end
            end;
        }
        field(4; "Job Task Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text,Employee';
            OptionMembers = Resource,Item,"G/L Account",Text,Employee;
        }
        field(6; "Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = filter(Resource)) Resource where(Blocked = const(false))
            else
            if ("Account Type" = filter(Employee)) Employee where(Department = filter('ACC'));

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No");
                            GLAccount.TestField("Direct Posting", true);
                            "Account No" := GLAccount."No.";
                            "Account Name" := GLAccount.Name;

                        end;

                    "account type"::Resource:
                        begin


                            Resource.Get("Account No");
                            if Resource.Blocked then
                                Error('The resource %1 is currently blocked', Resource."No.");
                            "Account No" := Resource."No.";
                            "Account Name" := Resource.Name;



                        end;
                end;

                //check that the resource person is not existing
                AllocationLines.Reset;
                AllocationLines.SetRange("Resource Card No.", "Resource Card No.");
                AllocationLines.SetRange("Job No", "Job No");
                AllocationLines.SetRange("Job Task Code", "Job Task Code");
                //AllocationLines.SETRANGE("Work Type","Work Type");
                AllocationLines.SetRange("Account No", "Account No");
                if AllocationLines.FindSet then begin
                    Error('The selected resource,%1,already exists for this voucher', AllocationLines."Account No");
                end;
                Validate(Amount);
            end;
        }
        field(7; "Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Work Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = filter(Original)) "Resource Cost"."Work Type Code" where(Code = field("Account No"))
            else
            if (Type = filter(Ammendment)) "Resource Cost"."Work Type Code" where(Code = field("Replacement Account No"));

            trigger OnValidate()
            begin
                if (Resource.Get("Account No") or Resource.Get("Replacement Account No")) then begin
                    WorkTypes.Reset;
                    WorkTypes.SetRange("Work Type Code", "Work Type");
                    if WorkTypes.FindSet then begin
                        Amount := WorkTypes."Direct Unit Cost";

                    end
                end;
            end;
        }
        field(10; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                PVHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
            end;
        }
        field(11; "Total Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; Quantity; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Quantity = 0 then
                    Quantity := 1;
                "Total Cost" := Amount * Quantity;
            end;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Completed;
        }
        field(14; "Resource Card No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Book Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Booked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Confirmed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Job Accepted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Job Rejected"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Team Leader"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Replacement Account No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = if ("Account Type" = filter(Resource)) Resource where(Blocked = const(false));

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No");
                            GLAccount.TestField("Direct Posting", true);
                            "Account No" := GLAccount."No.";
                            "Account Name" := GLAccount.Name;

                        end;

                    "account type"::Resource:
                        begin


                            Resource.Get("Replacement Account No");
                            if Resource.Blocked then
                                Error('The resource %1 is currently blocked', Resource."No.");
                            //check whether the institution exists in his employment history

                            "Replacement Account No" := Resource."No.";
                            "Replacement Account Name" := Resource.Name;



                        end;
                end;
                Validate(Amount);
            end;
        }
        field(22; "Replacement Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Ammendment';
            OptionMembers = Original,Ammendment;
        }
        field(24; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Notified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Appoint; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Appointed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Member Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'ChairPerson,Secretary,Member';
            OptionMembers = ChairPerson,Secretary,Member;
        }
    }

    keys
    {
        key(Key1; "Code", "Resource Card No.", "Job No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        Resource: Record Resource;
        JobTask: Record "Job Task";
        TotalCost: Decimal;
        WorkTypes: Record "Resource Cost";
        //ResourceAllocation: Record resource all
        AllocationLines: Record "Resource Accreditation Lines";
}

