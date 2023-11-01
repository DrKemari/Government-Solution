#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51310 "Audit Sections Setup"
{

    fields
    {
        field(1;"Code";Code[10])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"No. Of Topics";Integer)
        {
        }
        field(4;"No. Of Questions";Integer)
        {
        }
        field(5;Category;Option)
        {
            OptionCaption = 'Programme Quality Audit,Institution Quality Audit';
            OptionMembers = "Programme Quality Audit","Institution Quality Audit";
        }
        field(6;"Resource Person Role";Option)
        {
            OptionCaption = ' ,Curriculum Expert,Panel Chair,Finance,Library Expert,QA Expert,Student/Staff Welfare,Architect';
            OptionMembers = " ","Curriculum Expert","Panel Chair",Finance,"Library Expert","QA Expert","Student/Staff Welfare",Architect;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

