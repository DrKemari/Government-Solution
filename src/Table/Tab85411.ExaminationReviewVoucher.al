#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85411 "Examination Review Voucher"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Setter,Moderator,Reviewer,Chief Examiner,CEO';
            OptionMembers = Setter,Moderator,Reviewer,"Chief Examiner",CEO;
        }
        field(3; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(6; "Examiner Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(7; "Examiner Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "ID No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Address; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Submitted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Submitted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Moderator No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Moderator No.");
                if Resource.FindFirst then begin
                    "Moderator Name" := Resource.Name;
                end
            end;
        }
        field(16; "Moderator Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "No. of Topics Examined"; Integer)
        {
            CalcFormula = count("Setter Topics" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "No. of Topics in Syllabus"; Integer)
        {
            CalcFormula = count("Paper Topic Setup" where("Paper Code" = field("Paper Code")));
            FieldClass = FlowField;
        }
        field(19; "% of Syllabus Examined"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Paper Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                    Examination := Papers.Course;
                    Level := Papers.Level;

                end;
                if ("Document Type" = "document type"::Reviewer) then begin
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Moderator No." := ReviewVoucher."Moderator No.";
                        Validate("Moderator No.");

                    end;
                end;
                if "Document Type" = "document type"::CEO then begin
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Reviewer);
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Reviewer No." := ReviewVoucher."Resource No.";
                        Validate("Reviewer No.");

                    end;
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Moderator No." := ReviewVoucher."Moderator No.";
                        Validate("Moderator No.");

                    end;
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::"Chief Examiner");
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Chief Examiner  No." := ReviewVoucher."Resource No.";
                        Validate("Chief Examiner  No.");

                    end;
                end;
                if "Document Type" = "document type"::"Chief Examiner" then begin
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Reviewer);
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Reviewer No." := ReviewVoucher."Resource No.";
                        Validate("Reviewer No.");

                    end;
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    ReviewVoucher.SetRange("Paper Code", "Paper Code");
                    ReviewVoucher.SetRange("Examination Sitting", "Examination Sitting");
                    if ReviewVoucher.FindFirst then begin
                        "Moderator No." := ReviewVoucher."Moderator No.";
                        Validate("Moderator No.");

                    end;
                end;
            end;
        }
        field(21; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(23; "Action Taken"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(24; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Courses;
        }
        field(25; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Level;
        }
        field(26; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Active,Accepted,Rejected,Closed,Pending Confirmation';
            OptionMembers = Active,Accepted,Rejected,Closed,"Pending Confirmation";
        }
        field(28; "Final Verdict"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Approved with Comments,Not Approved';
            OptionMembers = " ",Approved,"Approved with Comments","Not Approved";
        }
        field(29; "Final Verdict Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; Comments; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Resource No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Resource No.");
                if Resource.FindFirst then begin
                    "Resource Name" := Resource.Name;
                end
            end;
        }
        field(32; "Resource Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Reviewer No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Reviewer No.");
                if Resource.FindFirst then begin
                    "Reviewer Name" := Resource.Name;
                end
            end;
        }
        field(34; "Reviewer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Chief Examiner  No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Chief Examiner  No.");
                if Resource.FindFirst then begin
                    "Chief Examiner  Name" := Resource.Name;
                end
            end;
        }
        field(36; "Chief Examiner  Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(37; "General Comments"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Awaiting Reviewer,Awaiting Moderator,Closed,Awaiting Chief Examiner,Awaiting CEO';
            OptionMembers = Draft,"Awaiting Reviewer","Awaiting Moderator",Closed,"Awaiting Chief Examiner","Awaiting CEO";
        }
        field(39; "Signed Oath of Secrecy"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Oath of Secrecy Signed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Oath of Secrecy Witness Name"; Text[250])
        {
            DataClassification = ToBeClassified;
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
    begin
        SettingModerationSetup.Get;

        if "Document Type" = "document type"::Moderator then begin
            SettingModerationSetup.TestField("Moderator Specification Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Moderator Specification Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::Reviewer then begin
            SettingModerationSetup.TestField("Reviewer Comment Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Reviewer Comment Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Chief Examiner" then begin
            SettingModerationSetup.TestField("Chief Examiner Comment Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Chief Examiner Comment Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::CEO then begin
            SettingModerationSetup.TestField("CEO Comment Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."CEO Comment Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then
            "Resource No." := UserSetup."Employee No.";
        "Resource Name" := UserSetup."Employee Name";
    end;

    var
        Papers: Record Papers;
        SettingModerationSetup: Record "Setting Moderation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ReviewVoucher: Record "Examination Review Voucher";
        UserSetup: Record "User Setup";
}
