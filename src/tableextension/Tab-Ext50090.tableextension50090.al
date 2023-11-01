#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50090 "tableextension50090" extends Campaign 
{
    fields
    {
        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023;Requestor;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee where (Status=filter(Active));

            trigger OnValidate()
            begin
                if Employee.Get(Requestor) then begin
                  "Requestor Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                end
            end;
        }
        field(50024;"Requestor Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50025;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50026;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50027;"Subject Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50028;Subject;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50029;"Job No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Job No.") then begin
                  "Job Name":=Job.Description;
                end;
            end;
        }
        field(50030;"Job Task No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Job No."));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange("Job No.","Job No.");
                JobTask.SetRange("Job Task No.","Job Task No.");
                if JobTask.FindFirst then  begin
                  "Task Name":=JobTask.Description;
                  JobTask.CalcFields("Schedule (Total Cost)");
                  JobTask.CalcFields("Usage (Total Cost)");
                  JobTask.CalcFields(Commitments);
                  "Project Budget":=JobTask."Schedule (Total Cost)";
                  Commitments:=JobTask.Commitments;
                  "Actual Used":=JobTask."Usage (Total Cost)";
                  end
            end;
        }
        field(50031;Comments;Text[900])
        {
            DataClassification = ToBeClassified;
        }
        field(50032;"Job Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50033;"Task Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50034;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Campaign,Corporate Function,Advertisement';
            OptionMembers = Campaign,"Corporate Function",Advertisement;
        }
        field(50035;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(50036;Frequency;DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(50037;"Project Budget";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50038;Commitments;Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50039;"Actual Used";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    var
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        Job: Record Job;
        JobTask: Record "Job Task";
}

