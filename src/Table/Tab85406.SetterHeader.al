#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85406 "Setter Header"
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
            OptionCaption = 'Setter Disclosure,Setter Claim,Setter Specification,Setter Planning Form,Moderator Disclosure';
            OptionMembers = "Setter Disclosure","Setter Claim","Setter Specification","Setter Planning Form","Moderator Disclosure";
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
            TableRelation = if ("Document Type" = filter("Moderator Disclosure")) "Resource Role Allocation"."Resource No" where(Role = const(Moderator))
            else
            "Resource Role Allocation"."Resource No" where(Role = const(Setter));

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Examiner Code");
                if Resource.FindFirst then begin
                    "Examiner Name" := Resource.Name;
                    "ID No." := Resource."ID/Passport No";
                    Email := Resource.Email;
                    "Bank Code" := Resource."Bank Code";
                    "Bank Account No." := Resource."Bank Account No.";
                    "Bank Branch" := Resource."Bank Branch No.";
                    "Bank Name" := Resource."Bank Name"

                end;
                if "Document Type" = "document type"::"Moderator Disclosure" then begin
                    // ResourceRoleAllocation
                    ResourceRoleAllocation.Reset;
                    ResourceRoleAllocation.SetRange("Resource No", "Examiner Code");
                    if ResourceRoleAllocation.FindSet then begin
                        "Moderator Type" := ResourceRoleAllocation."Moderator Type";
                    end;
                end;
            end;
        }
        field(7; "Examiner Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
            Editable = false;
        }
        field(13; "Submitted On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Submitted By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; Declaration; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Declaration Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "No. of Papers"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "No. of Questions"; Integer)
        {
            CalcFormula = count("Examination Review Lines" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Bank Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Bank Branch"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Bank Account No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "KRA Pin"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(26; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Paper Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Examination),
                                               Level = field(Level));

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                    "MCQ's" := Papers."MCQ's";
                    "MCQ Template" := Papers."MCQ's Question Template";

                end
            end;
        }
        field(28; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(30; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where(Course = field(Examination));

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::"Setter Specification" then begin
                    Levels.Reset;
                    Levels.SetRange(Code, Level);
                    if Levels.FindSet then
                        "PP Application and Analysis" := Levels."Application and Analysis";
                    "PP Evaluation and Creativity" := Levels."Evaluation and Creativity";
                    "PP Knowledge and Comprehension" := Levels."Knowledge and Comprehension";
                end;
            end;
        }
        field(31; "No. of Topics Examined"; Integer)
        {
            CalcFormula = count("Setter Topics" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "No. of Topics in Syllabus"; Integer)
        {
            CalcFormula = count("Paper Topic Setup" where("Paper Code" = field("Paper Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(33; "% of Syllabus Examined"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34; "Student Reg No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Total Setter Claim Amount"; Decimal)
        {
            CalcFormula = sum("Disclosure Papers"."Total Amount" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "Knowledge and Comprehension"; Integer)
        {
            CalcFormula = sum("Examination Review Lines"."Knowledge and Comprehension" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(40; "Application and Analysis"; Integer)
        {
            CalcFormula = sum("Examination Review Lines"."Application and Analysis" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(41; "Evaluation and Creativity"; Integer)
        {
            CalcFormula = sum("Examination Review Lines"."Evaluation and Creativity" where("Document No." = field("Document No.")));
            FieldClass = FlowField;
        }
        field(42; "PP Knowledge and Comprehension"; Text[30])
        {
            Caption = 'Paper Knowledge and Comprehension';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(43; "PP Application and Analysis"; Text[30])
        {
            Caption = 'Paper Application and Analysis';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44; "PP Evaluation and Creativity"; Text[30])
        {
            Caption = 'Paper Evaluation and Creativity';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(45; "Knowledge and Comprehension %"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(46; "Application and Analysis %"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(47; "Evaluation and Creativity %"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(48; "Tos Submission Start Date"; Date)
        {
            Caption = 'Table of Specification Submission Start Date';
            DataClassification = ToBeClassified;
        }
        field(49; "Tos Submission End Date"; Date)
        {
            Caption = 'Table of Specification Submission End Date';
            DataClassification = ToBeClassified;
        }
        field(50; "Moderator Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '...,Internal,External/Panels';
            OptionMembers = "...",Internal,"External/Panels";

            trigger OnValidate()
            begin
                // IF "Moderator Type"<>"Moderator Type"::"..." THEN BEGIN
                //  IF Role<>Role::Moderator THEN BEGIN
                //    ERROR('Error!, Kindly note that this only applies to where the role is Moderator.');
                //    END;
                //  END;
            end;
        }
        field(51; "MCQ's"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "MCQ Template"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(53; Suggested; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Suggest on Schedule"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Signed Oath of Secrecy"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(56; "Oath of Secrecy Signed On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Oath of Secrecy Witness Name"; Text[250])
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
        if "Document Type" = "document type"::"Setter Claim" then begin
            SettingModerationSetup.TestField("Setter Claim Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Setter Claim Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Setter Disclosure" then begin
            SettingModerationSetup.TestField("Setter Disclosure Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Setter Disclosure Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Setter Specification" then begin
            SettingModerationSetup.TestField("Setter Specification Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Setter Specification Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Setter Planning Form" then begin
            SettingModerationSetup.TestField("Setter Planning Form Nos");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Setter Planning Form Nos", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Moderator Disclosure" then begin
            SettingModerationSetup.TestField("Moderator Disclosure Form Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(SettingModerationSetup."Moderator Disclosure Form Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SettingModerationSetup: Record "Setting Moderation Setup";
        Levels: Record Level;
        ResourceRoleAllocation: Record "Resource Role Allocation";
}
