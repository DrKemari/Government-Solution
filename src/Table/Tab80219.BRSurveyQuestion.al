#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80219 "BR Survey Question"
{

    fields
    {
        field(1;"Survey ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Survey Section"."Section Code";
        }
        field(3;"Question ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Question;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Close Ended,Open Ended';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Option Text Response Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = w.Code;

            trigger OnValidate()
            begin
                BRResponseCode.Reset;
                BRResponseCode.SetRange("Response Type","Option Text Response Type");
                if BRResponseCode.FindFirst then begin
                   repeat
                     BRTemplateScoreGuide.Init;
                     BRTemplateScoreGuide."Survey ID":="Survey ID";
                     BRTemplateScoreGuide."Section Code":="Section Code";
                     BRTemplateScoreGuide."Question ID":="Question ID";
                     BRTemplateScoreGuide."Line No.":=LineNumber;
                     BRTemplateScoreGuide."Rating Type":="Rating Type";
                     BRTemplateScoreGuide."Response Value":=BRResponseCode."Response Code";
                     BRTemplateScoreGuide."Score %":=BRResponseCode."Score (%)";
                     BRTemplateScoreGuide.Insert;
                   until BRResponseCode.Next=0;
                end;
            end;
        }
        field(7;"Assigned Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(9;"Branch Logic Question";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Rating Type","rating type"::"Options Text");
                TestField("Response Type","response type"::"Single Response");
            end;
        }
        field(10;"No. of Branch Logic Conditions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Parent Question ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Question Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Qualitative,Quantitative';
            OptionMembers = " ",Qualitative,Quantitative;
        }
        field(13;"Response Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Single Response,Multiple Response';
            OptionMembers = " ","Single Response","Multiple Response";
        }
        field(14;Mandatory;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey ID","Section Code","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BRResponseCode: Record "BR Response Code";
        BRTemplateScoreGuide: Record "BR Survey Score Guide";
        LineNumber: Integer;
}

