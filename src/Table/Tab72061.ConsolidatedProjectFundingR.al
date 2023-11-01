#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72061 "Consolidated Project Funding R"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Works Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where ("Procurement Type"=filter('WORKS'));
        }
        field(4;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(5;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Directorate));
        }
        field(6;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(7;"Funding Source";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";
        }
        field(9;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Constituency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where ("Region Code"=field(Region));
        }
        field(12;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if RoadAsset.Get("Road Code") then
                  "Road Link Name":=RoadAsset.Description;
            end;
        }
        field(13;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(15;"Funding Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Funding Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        PFVHeader.Reset;
        PFVHeader.SetRange(PFVHeader."Document No","Document No");
        PFVHeader.SetRange(PFVHeader."Document Type",PFVHeader."document type"::PFV);
        if PFVHeader.FindSet then begin
          Region:=PFVHeader.Region;
          Directorate:=PFVHeader.Directorate;
          Department:=PFVHeader.Department;
          "Works Category":=PFVHeader."Default Works Category";
          "Funding Source":=PFVHeader."Default Funding Source";
          "Year Code":=PFVHeader."Year Code";
          "Start Date":=PFVHeader."Start Date";
          "End Date":=PFVHeader."End Date";
          "Currency Code":=PFVHeader."Currency Code";
          end;
    end;

    var
        RoadAsset: Record "Fixed Asset";
        PFVHeader: Record "Project Funding Request Vouche";
}

