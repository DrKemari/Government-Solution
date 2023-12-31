#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80020 "Strategy Workplan Lines"
{
    DrillDownPageID = "Strategy Workplan Lines";
    LookupPageID = "Strategy Workplan Lines";

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Strategy Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3; "Activity ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategic Initiative".Code where("Strategic Plan ID" = field("Strategy Plan ID"));

            trigger OnValidate()
            begin
                StrategicInt.Reset;
                StrategicInt.SetRange(Code, "Activity ID");
                if StrategicInt.Find('-') then begin
                    Description := StrategicInt.Description;
                end;
            end;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Imported Annual Target Qty"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Imported Annual Target Qty" <> 0 then begin
                    Remainder := ROUND("Imported Annual Target Qty" MOD 4, 1, '=');
                    "Q1 Target" := ("Imported Annual Target Qty" - Remainder) / 4 + Remainder;
                    "Q2 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                    "Q3 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                    "Q4 Target" := ("Imported Annual Target Qty" - Remainder) / 4;
                end;
            end;
        }
        field(6; "Imported Annual Budget Est."; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF ("Imported Annual Budget Est."<>0) THEN BEGIN
                 "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
                 "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
                 "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
                 "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
               END;*/
                /*IF ("Imported Annual Budget Est."<>0) THEN BEGIN
                  "Q1 Budget":=ROUND("Imported Annual Budget Est."*("Q1 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q2 Budget":=ROUND("Imported Annual Budget Est."*("Q2 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q3 Budget":=ROUND("Imported Annual Budget Est."*("Q3 Target"/"Imported Annual Target Qty"),0.01,'=');
                  "Q4 Budget":=ROUND("Imported Annual Budget Est."*("Q4 Target"/"Imported Annual Target Qty"),0.01,'=');
                END;*/

            end;
        }
        field(7; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(8; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(9; "Q1 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Q1 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Q2 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Q2 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Q3 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Q3 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Q4 Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Q4 Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Entry Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(18; "Year Reporting Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(19; "Perfomance Indicator"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator";
        }
        field(20; "Source Of Fund"; Code[50])
        {
            Caption = 'Source Of Fund';
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code where(Blocked = const(false));
        }
        field(21; "Unit of Measure"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Desired Perfomance Direction"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(23; "Framework Perspective"; Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(24; "Strategy Framework"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(25; "Total Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Annual Workplan" = field(No),
                                                                            "Activity ID" = field("Activity ID"),
                                                                            "Entry Type" = const(Actual),
                                                                            "Planning Date" = field("Date Filter")));
            FieldClass = FlowField;
        }
        field(26; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(27; Weight; Decimal)
        {
            DataClassification = ToBeClassified;
            MaxValue = 100;
            MinValue = 0;
        }
        field(28; "Key Performance Indicator"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Strategy Framework";
        }

    }

    keys
    {
        key(Key1; No, "Strategy Plan ID", "Activity ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StrategicInt: Record "Strategic Initiative";
        QQuantity: Integer;
        Remainder: Integer;
}

