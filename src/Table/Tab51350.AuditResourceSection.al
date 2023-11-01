#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51350 "Audit Resource Section"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Resource Category";Code[30])
        {
            TableRelation = "Audit Resource";
        }
        field(3;"Section Code";Code[30])
        {
            TableRelation = "Audit Sections Setup";

            trigger OnValidate()
            begin
                SARSectionsSetup.Reset;
                SARSectionsSetup.SetRange(Code,"Section Code");
                if SARSectionsSetup.FindFirst then begin
                  "Section Name":=SARSectionsSetup.Description;
                  end
            end;
        }
        field(4;"Section Name";Text[100])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Resource Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SARSectionsSetup: Record "Audit Sections Setup";
}

