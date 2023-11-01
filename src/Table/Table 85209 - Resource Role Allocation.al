#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85209 "Resource Role Allocation"
{
    DrillDownPageID = "Resource Role Allocation";
    LookupPageID = "Resource Role Allocation";

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Resource No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Course; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field(Course));
        }
        field(5; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field(Course));
        }
        field(6; "Paper ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers.Code where(Course = field(Course),
                                               Level = field(Level));

            trigger OnValidate()
            begin
                if Paperss.Get("Paper ID") then begin

                    "Paper Name" := Paperss.Description;
                end;
            end;
        }
        field(7; "Paper Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Present; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Solution; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Present = false then
                    Error(TXT001);
            end;
        }
        field(11; "Dummy A"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Solution = false then
                    Error(TXT002);
            end;
        }
        field(12; "Dummy B"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy A" = false then
                    Error(TXT003);
            end;
        }
        field(13; "Dummy C"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Dummy B" = false then
                    Error(TXT004);
            end;
        }
        field(14; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Checker,Marker,Invigilator,Moderator,Setter,Reviewer,Chief Examiner,Chief Invigilator';
            OptionMembers = " ",Checker,Marker,Invigilator,Moderator,Setter,Reviewer,"Chief Examiner","Chief Invigilator";

            trigger OnValidate()
            begin
                "Moderator Type" := "moderator type"::"...";
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Resource No", "Resource No");
                RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
                RoleAlloc.SetRange(Role, Role);
                if RoleAlloc.FindFirst then begin
                    RoleAlloc.Reset;
                    RoleAlloc.SetRange("Line No", "Line No");
                    if RoleAlloc.FindSet then begin
                        RoleAlloc.Delete;
                    end;
                    Error('ERROR!, Kindly note that the resource is already assigned');
                end;

                FnChecker();
                FnMarker();
                FnInvigilator();
                FnModerator();
                FnSetter();
                FnReviewer();
                FnChiefExaminer();
            end;
        }
        field(15; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(16; "Moderator Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '...,Internal,External/Panels';
            OptionMembers = "...",Internal,"External/Panels";

            trigger OnValidate()
            begin
                if "Moderator Type" <> "moderator type"::"..." then begin
                    if Role <> Role::Moderator then begin
                        Error('Error!, Kindly note that this only applies to where the role is Moderator.');
                    end;
                end;
            end;
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No", "Resource No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Resource No", Name)
        {
        }
    }

    trigger OnInsert()
    begin
        if Resources.Get("Resource No") then begin
            Name := Resources.Name;

        end;
    end;

    var
        Paperss: Record Papers;
        Resources: Record Resource;
        TXT001: label 'Kindly ensure the marker is marked as present';
        TXT002: label 'Kindly ensure the solution is submitted';
        TXT003: label 'Kindly ensure Dummy A is submitted';
        TXT004: label 'Kindly ensure Dummy B is submitted';
        RoleAlloc: Record "Resource Role Allocation";

    local procedure FnChecker()
    begin
        if Role = Role::Checker then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Checker can not be assigned to any other role');
            end;



        end;
    end;

    local procedure FnMarker()
    begin
        if Role = Role::Marker then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Marker can not be assigned a Checker role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Invigilator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Marker can not be assigned a Invigilator role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Reviewer);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Marker can not be assigned a Reviewer role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::"Chief Examiner");
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Marker can not be assigned a "Chief Examiner" role');
            end;

        end;
    end;

    local procedure FnInvigilator()
    begin
        if Role = Role::Invigilator then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a Checker role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Marker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a Marker role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Moderator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a Moderator role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Setter);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a Setter role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Reviewer);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a Reviewer role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::"Chief Examiner");
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Invigilator can not be assigned a "Chief Examiner" role');
            end;

        end;
    end;

    local procedure FnModerator()
    begin
        if Role = Role::Moderator then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Moderator can not be assigned a Checker role');
            end;


            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Invigilator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Moderator can not be assigned a Invigilator role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::"Chief Examiner");
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Moderator can not be assigned a "Chief Examiner" role');
            end;

        end;
    end;

    local procedure FnSetter()
    begin
        if Role = Role::Setter then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Setter can not be assigned a Checker role');
            end;


            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Invigilator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Setter can not be assigned a Invigilator role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Reviewer);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Setter can not be assigned a Reviewer role');
            end;

        end;
    end;

    local procedure FnReviewer()
    begin
        if Role = Role::Reviewer then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Reviewer can not be assigned a Checker role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Marker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Reviewer can not be assigned a Marker role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Invigilator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Reviewer can not be assigned a Invigilator role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Setter);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a Reviewer can not be assigned a Setter role');
            end;

        end;
    end;

    local procedure FnChiefExaminer()
    begin
        if Role = Role::"Chief Examiner" then begin
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Checker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a "Chief Examiner" can not be assigned a Checker role');
            end;
            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Marker);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a "Chief Examiner" can not be assigned a Marker role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Invigilator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a "Chief Examiner" can not be assigned a Invigilator role');
            end;

            RoleAlloc.Reset;
            RoleAlloc.SetRange("Resource No", "Resource No");
            RoleAlloc.SetFilter("Line No", '<>%1', "Line No");
            RoleAlloc.SetRange(Role, RoleAlloc.Role::Moderator);
            if RoleAlloc.FindFirst then begin
                RoleAlloc.Reset;
                RoleAlloc.SetRange("Line No", "Line No");
                if RoleAlloc.FindSet then begin
                    RoleAlloc.Delete;
                end;
                Error('ERROR!, Kindly note that a "Chief Examiner" can not be assigned a Moderator role');
            end;

        end;
    end;
}
