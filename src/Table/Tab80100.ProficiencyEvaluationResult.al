#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80100 "Proficiency Evaluation Result"
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
        field(3;"Competency Template ID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Competency Code";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Competency.Get("Competency Code") then begin
                  "Competency Description":=Competency.Description;
                end;
            end;
        }
        field(5;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Outcome Perfomance Indicator";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Indicator".KPI;

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
        field(8;"Desired Proficiency Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9;"Profiency Rating Scale";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Rating Scale".Code;
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

            trigger OnValidate()
            begin
                if "Self-Review Qty">5 then
                   Error('Score should not be above what is set up in Competency Proficiency Scale');
            end;
        }
        field(13;"AppraiserReview Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Self-Review Qty">5 then
                   Error('Score should not be above what is set up in Competency Proficiency Scale');
                   "Final/Actual Qty":="AppraiserReview Qty";
                    Validate("Final/Actual Qty");
            end;
        }
        field(14;"Final/Actual Qty";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Self-Review Qty">5 then
                   Error('Score should not be above what is set up in Competency Proficiency Scale');

                "Raw Profiency Score":="Final/Actual Qty";
            end;
        }
        field(15;"Raw Profiency Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Final Weighted Line Score";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Intiative No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Competency Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Competency Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Core/Required,Desired/Added Advantage';
            OptionMembers = "Core/Required","Desired/Added Advantage";
        }
    }

    keys
    {
        key(Key1;"Performance Evaluation ID","Line No","Competency Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        Competency: Record Competency;
}

