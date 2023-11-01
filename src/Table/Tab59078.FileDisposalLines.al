#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59078 "File Disposal Lines"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"File System No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Registry File Creation"."System No" where (Status=const("Non-Current"));

            trigger OnValidate()
            begin
                if RegistryFileCreation.Get("File System No") then begin
                  "File No":=RegistryFileCreation."File No";
                  "File Name":=RegistryFileCreation."File Name";
                   Description:=RegistryFileCreation.Description;
                end;
            end;
        }
        field(3;"File No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"File Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","File System No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RegistryFileCreation: Record "Registry File Creation";
}

