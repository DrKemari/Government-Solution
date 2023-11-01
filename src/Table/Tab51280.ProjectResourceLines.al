#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51280 "Project Resource Lines"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Job No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(3;"Job Task Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange("Job No.","Job No");
                JobTask.SetRange("Job Task No.","Job Task Code");
                  if JobTask.FindSet then begin
                    "Job Task Description":=JobTask.Description;

                  end
            end;
        }
        field(4;"Job Task Description";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Resource,Item,G/L Account,Text,Employee';
            OptionMembers = Resource,Item,"G/L Account",Text,Employee;
        }
        field(6;"Account No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=filter(Resource)) Resource where (Blocked=const(false))
                            else if ("Account Type"=filter(Employee)) Employee where (Department=filter('ACC'));

            trigger OnValidate()
            begin
                case  "Account Type" of
                  "account type"::"G/L Account":
                    begin
                     GLAccount.Get("Account No");
                     GLAccount.TestField("Direct Posting",true);
                     "Account No":=GLAccount."No.";
                     "Account Name":=GLAccount.Name;

                       end;

                 "account type"::Resource:
                     begin


                       Resource.Get("Account No");
                       if Resource.Blocked then
                         Error('The resource %1 is currently blocked',Resource."No.");
                              "Account No":=Resource."No.";
                       "Account Name":=Resource.Name;



                           end;
                  end;

                //check that the resource person is not existing
                AllocationLines.Reset;
                AllocationLines.SetRange("Resource Card No.","Resource Card No.");
                AllocationLines.SetRange("Job No","Job No");
                AllocationLines.SetRange("Job Task Code","Job Task Code");
                //AllocationLines.SETRANGE("Work Type","Work Type");
                AllocationLines.SetRange("Account No","Account No");
                if AllocationLines.FindSet then begin
                  Error('The selected resource,%1,already exists for this voucher',AllocationLines."Account No");
                end;
                Validate("Team Leader");
            end;
        }
        field(7;"Account Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Completed;
        }
        field(9;"Resource Card No.";Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = "Resource Accreditation Header";
        }
        field(10;"Team Leader";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Notified;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Notified On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Appoint;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Appointed On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Member Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'ChairPerson,Secretary,Member';
            OptionMembers = ChairPerson,Secretary,Member;
        }
        field(16;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accreditation Application";

            trigger OnValidate()
            var
                AccreditationApplication: Record "Accreditation Application";
            begin

                AccreditationApplication.Reset;
                AccreditationApplication.SetRange("Application No.","Application No.");
                if AccreditationApplication.FindFirst then begin
                  "Application Name":=AccreditationApplication.Name;
                  "Job No":="Application No.";
                end
            end;
        }
        field(17;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"No.of Selected Resources";Integer)
        {
            CalcFormula = count("Resource Accreditation Lines" where ("Resource Card No."=field("Resource Card No."),
                                                                      "Job No"=field("Job No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Application Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Resource Card No.","Line No.")
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
      //  ResourceAllocation: Record UnknownRecord51263;
        AllocationLines: Record "Resource Accreditation Lines";
}

