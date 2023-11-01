#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69064 "Benefits Attachments"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Benefit Category";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefits Matrix Setup"."Line No.";

            trigger OnValidate()
            begin
                BenefitsMatrixSetup.Reset;
                BenefitsMatrixSetup.SetRange("Line No.","Benefit Category");
                if BenefitsMatrixSetup.FindFirst then begin
                  "Benefit Description":=BenefitsMatrixSetup."Benefit Description";
                end;
            end;
        }
        field(3;"Benefit Description";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Attachment Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Attachment Setup";

            trigger OnValidate()
            begin
                AttachmentSetup.Reset;
                AttachmentSetup.SetRange(Code,"Attachment Code");
                if AttachmentSetup.FindFirst then begin
                  "Attachment Description":=AttachmentSetup."Attachment Description";
                end
            end;
        }
        field(5;"Attachment Description";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Attachment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AttachmentSetup: Record "Attachment Setup";
        BenefitsMatrixSetup: Record "Benefits Matrix Setup";
}

