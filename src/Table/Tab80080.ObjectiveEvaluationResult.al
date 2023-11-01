#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80080 "Objective Evaluation Result"
{

    fields
    {
        field(1;"Performance Evaluation ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Scorecard ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where ("Document Type"=const("Individual Scorecard"));
        }
        field(4;"Scorecard Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Objective/Initiative";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Outcome Perfomance Indicator";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator";

            trigger OnValidate()
            begin
                if PerformanceIndicator.Get("Outcome Perfomance Indicator") then begin
                   //"Unit of Measure":=PerformanceIndicator."Unit of Measure";
                  end;
            end;
        }
        field(7;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9;"Performance Rating Scale";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Rating Scale".Code;

            trigger OnValidate()
            begin
                PerfomanceRatingScale.Reset;
                PerfomanceRatingScale.SetRange(Code,"Performance Rating Scale");
                if PerfomanceRatingScale.Find('-') then begin
                  "Scale Type":=PerfomanceRatingScale."Scale Type";
                end;
            end;
        }
        field(10;"Scale Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Excellent-Poor(5-1),Excellent-Poor(1-5)';
            OptionMembers = "Excellent-Poor(5-1)","Excellent-Poor(1-5)";
        }
        field(11;"Target Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Self-Review Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"AppraiserReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Final/Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                PerformanceRatingRawScore:=0;

                Validate("Performance Rating Scale");
                if ("Desired Perfomance Direction"="desired perfomance direction"::"Increasing KPI") then begin
                   if "Scale Type"="scale type"::"Excellent-Poor(5-1)" then begin
                      "Raw Performance Score":=(((((2*"Target Qty")-"Final/Actual Qty")/(2*"Target Qty"))*-4)+5);
                   end;
                   if "Scale Type"="scale type"::"Excellent-Poor(1-5)" then begin
                      "Raw Performance Score":= (((((2*"Target Qty")-"Final/Actual Qty")/(2*"Target Qty"))*4)+1);
                   end;
                end;

                if ("Desired Perfomance Direction"="desired perfomance direction"::"Decreasing KPI") then begin
                   if "Scale Type"="scale type"::"Excellent-Poor(5-1)" then begin
                      "Raw Performance Score":=((5+(-4*("Final/Actual Qty"/(2*"Target Qty")))));
                   end;
                   if "Scale Type"="scale type"::"Excellent-Poor(1-5)" then begin
                     "Raw Performance Score":=((1+(4*("Final/Actual Qty"/(2*"Target Qty")))));
                   end;
                end;


                PerformanceRatingRawScore:="Raw Performance Score";

                if (PerformanceRatingRawScore<0) then
                    PerformanceRatingRawScore:=0;

                if (PerformanceRatingRawScore>5) then
                   PerformanceRatingRawScore:=5;

                PerfomanceScaleLine.Reset;
                PerfomanceScaleLine.SetRange("Performance Scale ID","Performance Rating Scale");
                if PerfomanceScaleLine.Find('-') then begin
                   repeat
                    if  ((PerformanceRatingRawScore>=PerfomanceScaleLine."Lower Limit Criteria Value") and
                       (PerformanceRatingRawScore<=PerfomanceScaleLine."Upper Limit Criteria Value")) then begin
                         "Raw Performance Grade":=PerfomanceScaleLine."Perfomance Grade";

                    end;
                   until PerfomanceScaleLine.Next=0;
                end;

                Validate("Weight %");
            end;
        }
        field(15;"Raw Performance Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Weight %";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Final Weighted Line Score":=("Weight %"/100)*"Raw Performance Score";
            end;
        }
        field(17;"Final Weighted Line Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Intiative No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(20;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(21;"Raw Performance Grade";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Performance Evaluation ID","Line No","Scorecard ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        PerfomanceRatingScale: Record "Perfomance Rating Scale";
        PerfomanceScaleLine: Record "Perfomance Scale Line";
        PerformanceRatingRawScore: Decimal;
}

