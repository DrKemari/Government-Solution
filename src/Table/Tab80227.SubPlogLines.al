#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80227 "Sub Plog Lines"
{

    fields
    {
        field(1; "PLog No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Diary Log".No;
        }
        field(2; "Initiative No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF "Activity Type"="Activity Type"::"Primary Activity" THEN BEGIN
                    StrategicInitiative.RESET;
                    StrategicInitiative.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    StrategicInitiative.SETRANGE("Workplan No.","Personal Scorecard ID");
                    StrategicInitiative.SETRANGE("Initiative No.","Initiative No.");
                    IF StrategicInitiative.FIND('-') THEN BEGIN
                      Description:=StrategicInitiative."Objective/Initiative";
                      "Planned Date":=StrategicInitiative."Start Date";
                      "Target Qty":=StrategicInitiative."Imported Annual Target Qty";
                      "Due Date":=StrategicInitiative."Due Date";
                    END;
                
                    PerformanceDiaryLog.RESET;
                    PerformanceDiaryLog.SETRANGE(No,"PLog No.");
                    IF PerformanceDiaryLog.FINDFIRST THEN BEGIN
                      "Achieved Date":=PerformanceDiaryLog."Document Date";
                      "AWP ID":=PerformanceDiaryLog."AWP ID";
                      "Board PC ID":=PerformanceDiaryLog."Board PC ID";
                      "CEO PC ID":=PerformanceDiaryLog."CEO PC ID";
                      "Functional PC":=PerformanceDiaryLog."Functional PC";
                    END;
                END;
                
                IF "Activity Type"="Activity Type"::"Secondary Activity" THEN BEGIN
                    SecondaryPCObjective.RESET;
                    SecondaryPCObjective.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    SecondaryPCObjective.SETRANGE("Workplan No.","Personal Scorecard ID");
                    SecondaryPCObjective.SETRANGE("Initiative No.","Initiative No.");
                    IF SecondaryPCObjective.FIND('-') THEN BEGIN
                      Description:=SecondaryPCObjective."Objective/Initiative";
                      "Planned Date":=SecondaryPCObjective."Start Date";
                      "Target Qty":=SecondaryPCObjective."Imported Annual Target Qty";
                      "Due Date":=SecondaryPCObjective."Due Date";
                    END;
                
                    PerformanceDiaryLog.RESET;
                    PerformanceDiaryLog.SETRANGE(No,"PLog No.");
                    IF PerformanceDiaryLog.FINDFIRST THEN BEGIN
                      "Achieved Date":=PerformanceDiaryLog."Document Date";
                      "AWP ID":=PerformanceDiaryLog."AWP ID";
                      "Board PC ID":=PerformanceDiaryLog."Board PC ID";
                      "CEO PC ID":=PerformanceDiaryLog."CEO PC ID";
                      "Functional PC":=PerformanceDiaryLog."Functional PC";
                    END;
                END;*/

            end;
        }
        field(3; "Sub Initiative No."; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub PC Objective"."Sub Initiative No." where("Workplan No." = field("Personal Scorecard ID"),
                                                                           "Initiative No." = field("Initiative No."));
        }
        field(4; Description; Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Goal ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Strategy Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(13; "Year Reporting Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(14; "Planned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Achieved Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Primary Directorate"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(17; "Primary Department"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(20; "Unit of Measure"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(21; "Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Achieved Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "AWP ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Board PC ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "CEO PC ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Functional PC"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(28; "Personal Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No;
        }
        field(29; Comments; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Activity Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Primary Activity,Secondary Activity,JD Activity';
            OptionMembers = "Primary Activity","Secondary Activity","JD Activity";
        }
        field(31; EntryNo; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(32; "Remaining Targets"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Weight %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Variances; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Sub Activity No."; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub PC Objective"."Sub Initiative No." where("Workplan No." = field("Personal Scorecard ID"),
                                                                           "Initiative No." = field("Initiative No."));

            trigger OnValidate()
            begin
                SubPCObjective.Reset;
                SubPCObjective.SetRange("Initiative No.", "Initiative No.");
                SubPCObjective.SetRange("Sub Initiative No.", "Sub Activity No.");
                SubPCObjective.SetRange("Strategy Plan ID", "Strategy Plan ID");
                if SubPCObjective.FindSet then begin
                    Description := SubPCObjective."Objective/Initiative";
                    "Goal ID" := SubPCObjective."Goal ID";
                    "Primary Directorate" := SubPCObjective."Primary Directorate";
                    "Primary Department" := SubPCObjective."Primary Department";
                    //   "Weight %" := SubPCObjective."Assigned Weight (%)";
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "PLog No.", "Initiative No.", "Sub Initiative No.", "Personal Scorecard ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    var
        StrategicInitiative: Record "Sub PC Objective";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceIndicator: Record "Performance Indicator";
        SubPCObjective: Record "Sub PC Objective";
}

