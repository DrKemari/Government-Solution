#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80215 "BR Template Line"
{

    fields
    {
        field(1;"Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Business Research Template"."Template ID";
        }
        field(2;"Section ID";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Template Section"."Section Code" where ("Template ID"=field("Template ID"));
        }
        field(3;"Question ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Question;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Closed Ended,Open Ended';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Option Text Response Type";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Rating Type"=const("Options Text")) w.Code;

            trigger OnValidate()
            begin
                BRResponseCode.Reset;
                BRResponseCode.SetRange("Response Type","Option Text Response Type");
                if BRResponseCode.FindFirst then begin
                   repeat
                     BRTemplateScoreGuide.Init;
                     BRTemplateScoreGuide."Template ID":="Template ID";
                     BRTemplateScoreGuide."Section ID":="Section ID";
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
            TableRelation = "BR Template Line"."Question ID" where ("Template ID"=field("Template ID"));
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

            trigger OnValidate()
            begin
                if "Response Type"="response type"::"Multiple Response" then
                    TestField("Rating Type","rating type"::"Options Text");
            end;
        }
        field(14;Mandatory;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Section ID","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BRResponseCode: Record "BR Response Code";
        BRTemplateScoreGuide: Record "BR Template Score Guide";
        LineNumber: Integer;
}

