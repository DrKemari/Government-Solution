#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80224 "BR Response Question"
{

    fields
    {
        field(1;"Survey Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Question ID";Code[30])
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
        field(6;"Response Value";Code[70])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Rating Type"=const("Options Text")) "BR Response Score Guide"."Response Value" where ("Survey Response ID"=field("Survey Response ID"),
                                                                                                                       "Section Code"=field("Section Code"),
                                                                                                                       "Question ID"=field("Question ID"));

            trigger OnValidate()
            begin
                /*IF "Rating Type"="Rating Type"::"Options Text" THEN BEGIN
                    IF NOT ("Response Value"='YES') OR ("Response Value"='NO') THEN BEGIN
                       ERROR('Allowed Response is YES/NO');
                    END;
                END;*/

            end;
        }
        field(7;"General Response Statement";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Assigned Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10;"Option Text Response Type";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Added For Filtering';
            TableRelation = w.Code;
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
        field(14;"No. of Branch Logic Conditions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Branch Logic Question";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Rating Type","rating type"::"Options Text");
                TestField("Response Type","response type"::"Single Response");
            end;
        }
        field(16;Mandatory;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey Response ID","Section Code","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

