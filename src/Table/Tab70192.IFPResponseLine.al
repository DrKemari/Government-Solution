#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70192 "IFP Response Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'IFP Response,EOI Response';
            OptionMembers = "IFP Response","EOI Response";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RFI Response"."Document No.";

            trigger OnValidate()
            begin
                RFIResp.Reset;
                RFIResp.SetRange("Document No.","Document No.");
                if RFIResp.FindSet then begin
                  "RFI Document No.":=RFIResp."RFI Document No.";
                  end;
            end;
        }
        field(3;"Procurement Category";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to RFI Prequalification Category Table. When the procurement category is selcted, the system shall validate the Procurement Category Description, Special Group Reservation, Unique Category Requirement, Restricted Responsibility Center ID, Prequalification Start Date and Prequalification ENd Date fields in the RFI Response Line table';
            TableRelation = "RFI Prequalification Category"."Prequalification Category ID" where ("Document No"=field("RFI Document No."));

            trigger OnValidate()
            begin
                PrequalificationCategory.Reset;
                PrequalificationCategory.SetRange("Prequalification Category ID","Procurement Category");
                if PrequalificationCategory.FindSet then begin
                  "Category Description":=PrequalificationCategory.Description;
                  "Special Group Reservation":=PrequalificationCategory."Special Group Reservation";
                  ;
                  "Restricted Responsbility Cente":=PrequalificationCategory."Restricted RC";
                  "Restricted RC ID":=PrequalificationCategory."Restricted RC Code";
                  "Prequalification Start Date":=PrequalificationCategory."Period Start Date";
                  "Prequalification End Date":=PrequalificationCategory."Period End Date";
                  end;
            end;
        }
        field(4;"Category Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"RFI Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Request For Information".Code;
        }
        field(6;"Vendor No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(7;"Special Group Reservation";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Unique Category Requirements";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Global RC Prequalification";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Restricted Responsbility Cente";Boolean)
        {
            Caption = 'Restricted Responsbility Center';
            DataClassification = ToBeClassified;
        }
        field(11;"Restricted RC ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Restricted Responsibility Center ID';
            TableRelation = "Responsibility Center".Code;
        }
        field(12;"Prequalification Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Prequalification End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Evaluation Decision";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Final evaluation verdict by the Procurement function';
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(15;"Evaluation Score %";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Any % score that may be assigned to each evaluation';
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Procurement Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PrequalificationCategory: Record "RFI Prequalification Category";
        RFIResp: Record "RFI Response";
}

