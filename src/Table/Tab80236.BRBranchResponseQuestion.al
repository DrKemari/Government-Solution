#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80236 "BR Branch Response Question"
{

    fields
    {
        field(1;"Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Parent Question ID";Code[30])
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
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Parent Response";Code[250])
        {
            DataClassification = ToBeClassified;

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
        field(11;"Question ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Survey Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Response ID","Section Code","Parent Question ID","Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

