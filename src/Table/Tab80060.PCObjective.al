#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80060 "PC Objective"
{
    DrillDownPageID = "Workplan Initiatives";
    LookupPageID = "Workplan Initiatives";

    fields
    {
        field(1;"Workplan No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2;"Initiative No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Initiative Type"="initiative type"::Activity then begin
                  StrategicInitiative.Reset;
                  StrategicInitiative.SetRange(Code,"Initiative No.");
                  if StrategicInitiative.FindFirst then begin
                    "Objective/Initiative":=StrategicInitiative.Code;
                    "Unit of Measure":=StrategicInitiative."Unit of Measure";
                    end;
                  end;
                if "Initiative Type"="initiative type"::Board then begin
                  BoardActivities.Reset;
                  BoardActivities.SetRange("Board Activity Code","Initiative No.");
                  if BoardActivities.FindFirst then begin
                    "Objective/Initiative":=BoardActivities."Board Activity Description";
                    "Unit of Measure":=BoardActivities."Unit of Measure";
                    end;
                  end;
            end;
        }
        field(3;"Objective/Initiative";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Goal ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PC Goal Hub"."Goal ID" where ("Performance Contract ID"=field("Workplan No."));
        }
        field(5;"Initiative Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'CSP Activity,Project, PC';
            OptionMembers = Activity,Project,Board;
        }
        field(6;"Task Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(7;Indentation;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Totaling;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Progress;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not started,In progress,Completed';
            OptionMembers = "Not started","In progress",Completed;
        }
        field(10;"%Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Priority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(12;"Strategy Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(13;"Year Reporting Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(14;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Primary Directorate";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(17;"Primary Department";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(18;"Overall Owner";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Outcome Perfomance Indicator";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator".KPI;

            trigger OnValidate()
            begin
                if PerformanceIndicator.Get("Outcome Perfomance Indicator") then begin
                   "Unit of Measure":=PerformanceIndicator."Unit of Measure";
                  end;
            end;
        }
        field(20;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(21;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(22;"KPI Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Lagging,Leading,Not Applicable';
            OptionMembers = Lagging,Leading,"Not Applicable";
        }
        field(23;"Imported Annual Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Q1 Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Q1 Self-Review Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Q1 ManagerReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Q1 Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Q2 Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Q2 Self-Review Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Q2 ManagerReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Q2 Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Q3 Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Q3 Self-Review Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Q3 ManagerReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Q3 Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Q4 Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Q4 Self-Review Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Q4 ManagerReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Q4 Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Global Dimension 1 Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(41;"Global Dimension 2 Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(42;"Planning Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(43;"Goal Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Goal Template";
        }
        field(44;"Individual Achieved Targets";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Performance Contract ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(45;"Functional Achieved Targets";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Functional PC ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(46;"CEO Achieved Targets";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "CEO PC ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(47;"Board Achieved Targets";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Board PC ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(48;"AnnualWorkplan Achieved Target";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Annual Workplan"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(49;EntryNo;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50;"Assigned Weight (%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51;"Plog Achieved Targets";Decimal)
        {
            CalcFormula = sum("Plog Lines"."Achieved Target" where ("Personal Scorecard ID"=field("Workplan No."),
                                                                    "Initiative No."=field("Initiative No."),
                                                                    "Achieved Date"=field("Date filter")));
            FieldClass = FlowField;
        }
        field(52;"Date filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(53;"Framework Perspective";Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where ("Strategy Framework"=field("Strategy Framework"));
        }
        field(54;"Strategy Framework";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(55;"Previous Annual Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Additional Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Activity Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Board,CSP;
        }
        field(58;"Directors Achieved Targets";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Directors PC ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(59;"Department Achieved Target";Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where ("Strategic Plan ID"=field("Strategy Plan ID"),
                                                                            "Year Reporting Code"=field("Year Reporting Code"),
                                                                            "Department/Center PC ID"=field("Workplan No."),
                                                                            "Activity ID"=field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(60;Selected;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(61;"Primary Directorate Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(62;"Primary Department Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workplan No.","Initiative No.","Goal Template ID","Strategy Plan ID",EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        StrategicInitiative: Record "Strategic Initiative";
        BoardActivities: Record "Board Activities";
        RC: Record "Responsibility Center";
}

