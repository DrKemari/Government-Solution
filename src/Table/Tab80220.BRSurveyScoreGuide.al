#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80220 "BR Survey Score Guide"
{
    DrillDownPageID = "BR Survey Score Guide";
    LookupPageID = "BR Survey Score Guide";

    fields
    {
        field(1;"Survey ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Business Research Survey"."Document No.";
        }
        field(2;"Section Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Survey Section"."Section Code" where ("Survey ID"=field("Survey ID"));
        }
        field(3;"Question ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Survey Question"."Question ID" where ("Survey ID"=field("Survey ID"));
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Rating Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Options Text,Open Text';
            OptionMembers = "Options Text","Open Text";
        }
        field(6;"Desired Perfomance Direction";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(7;"Response Value";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BR Response Code"."Response Code";
        }
        field(8;"Score %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey ID","Section Code","Question ID","Line No.","Response Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Response Value","Score %")
        {
        }
    }
}

