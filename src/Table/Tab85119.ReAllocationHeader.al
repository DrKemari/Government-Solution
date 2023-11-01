#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85119 "Re-Allocation Header"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Project No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Project No.") then begin
                    "Project Name" := Job.Description;
                    "Sitting Cycle" := Job."Examination Sitting Cycle";
                    Validate("Sitting Cycle");
                end
            end;
        }
        field(4; "Project Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Sitting Cycle"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            var
                CenterHeader: Record "Center  Header";
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle", "Sitting Cycle");
                if ExamSittingCycle.FindFirst then begin
                    "Examination Start Date" := ExamSittingCycle."Exam Start Date";
                    "Examination End Date" := ExamSittingCycle."Exam End Date";
                    CenterHeader.Reset;
                    CenterHeader.SetRange("Sitting Cycle", "Sitting Cycle");
                    if CenterHeader.FindFirst then begin
                        "Marking Start Date" := CenterHeader."Marking Start Date";
                        "Marking End Date" := CenterHeader."Marking End Date";
                    end;
                end
            end;
        }
        field(6; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Center Code") then begin
                    "Center Name" := ExamCenter.Name;

                end
            end;
        }
        field(7; "Center Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Dispatched,Closed';
            OptionMembers = Open,Dispatched,Closed;
        }
        field(10; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Examination Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Examination End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Script Re-allocation';
            OptionMembers = "Script Re-allocation";
        }
        field(20; "Marking Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Marking End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get(Examination) then begin
                    "Examination Name" := Courses.Description;

                end;
            end;
        }
        field(23; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where(Course = field(Examination));

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                end
            end;
        }
        field(24; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Re-Allocate to Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter("Script Re-allocation")) "Marker Task Allocation"."Resource No" where("Paper ID" = field("Paper Code"));

            trigger OnValidate()
            begin
                if Resources.Get("Re-Allocate to Marker No") then begin
                    "Re-Allocate to Marker Name" := Resources.Name;
                end;
            end;
        }
        field(26; "Re-Allocate to Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Examination Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; "Branch Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "Bank Branch No."; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange("Bank Branch No.", "Bank Branch No.");
                if EmployeeBankAccountX.FindSet then begin
                    "Branch Name" := EmployeeBankAccountX."Branch Name";
                end;
            end;
        }
        field(32; "Bank Account No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Bank Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(Code, "Bank Code");
                if EmployeeBankAccountX.FindSet then begin
                    "Bank Name" := EmployeeBankAccountX."Bank Name";
                end;
            end;
        }
        field(34; "M-Pesa Number"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "ID/Passport No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "KRA PIN NO"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Phone No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(40; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(41; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = const(Person),
                                                  "Exam Task Type" = const(Marker));

            trigger OnValidate()
            begin
                if Resources.Get("Marker No") then begin
                    "Marker Name" := Resources.Name;
                    "Bank Account No." := Resources."Bank Account No.";
                    "Bank Branch No." := Resources."Bank Branch No.";
                    "Bank Code" := Resources."Bank Code";
                    "Bank Name" := Resources."Bank Name";
                    "Branch Name" := Resources."Branch Name";
                    "M-Pesa Number" := Resources."M-Pesa Number";
                    Email := Resources.Email;
                    "ID/Passport No" := Resources."ID/Passport No";
                    Address := Resources.Address;
                    "Address 2" := Resources."Address 2";
                end;
            end;
        }
        field(42; "Marker Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(53; "Envelope Serial No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disp Script Envelope Serials"."Envelope Serial No." where("Marker Code" = field("Marker No"),
                                                                                        "Examination Sitting" = field("Sitting Cycle"),
                                                                                        Allocated = const(true));

            trigger OnValidate()
            begin
                DispScriptEnvelopeSerials.Reset;
                DispScriptEnvelopeSerials.SetRange("Envelope Serial No.", "Envelope Serial No");
                if DispScriptEnvelopeSerials.FindSet then begin
                    "Task Entry No" := DispScriptEnvelopeSerials."Entry No";
                    Examination := DispScriptEnvelopeSerials.Examination;

                    "Sitting Cycle" := DispScriptEnvelopeSerials."Examination Sitting";
                    "Paper Code" := DispScriptEnvelopeSerials."Paper Code";
                    "Paper Name" := DispScriptEnvelopeSerials."Paper Name";
                    "No. of Scripts" := DispScriptEnvelopeSerials."No. of Scripts";
                    "Center Code" := DispScriptEnvelopeSerials."Center Code";
                    "Center Name" := DispScriptEnvelopeSerials."Center Name";

                end;
            end;
        }
        field(54; "Task Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "No. of Scripts"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        CenterHeader: Record "Center  Header";
    begin
        ExaminationSetup.Get;
        if "Document Type" = "document type"::"Script Re-allocation" then begin
            ExaminationSetup.TestField("Script Re-Allocation Vouch Nos");
            if "Document No." = '' then begin
                NoSeriesMgt.InitSeries(ExaminationSetup."Script Re-Allocation Vouch Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
            Description := 'Script Re-Allocation';

        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;

        "Document Date" := Today;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        Job: Record Job;
        ExamSittingCycle: Record "Exam Sitting Cycle";
        Resources: Record Resource;
        Courses: Record Courses;
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
}
