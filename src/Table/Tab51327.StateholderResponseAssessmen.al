#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51327 "Stateholder Response Assessmen"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Quality Response No.";Code[30])
        {
        }
        field(3;"Analysis Type";Option)
        {
            OptionCaption = 'Strength,Weakness';
            OptionMembers = Strength,Weakness;

            trigger OnValidate()
            var
                HRCategories: Record "SAR Question Setup";
            begin
            end;
        }
        field(4;Description;Text[100])
        {

            trigger OnLookup()
            begin
                //51328
            end;
        }
        field(5;"Category Type";Option)
        {
            OptionCaption = 'Stakeholder,Programme Description,Programme Content,Programme Organization,Attachment,Teaching Approaches,Student Assessment,Quality of Teaching Staff,Quality of Support Staff,Student Profile';
            OptionMembers = Stakeholder,"Programme Description","Programme Content","Programme Organization",Attachment,"Teaching Approaches","Student Assessment","Quality of Teaching Staff","Quality of Support Staff","Student Profile";
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

