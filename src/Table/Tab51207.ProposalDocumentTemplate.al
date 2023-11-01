#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51207 "Proposal Document Template"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
          //  TableRelation = Table51218;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Chapter Code";Code[50])
        {
            TableRelation = Entries;

            // trigger OnValidate()
            // begin
            //     if chapters.Get("Inst. Onboarding Nos.") then
            //       "Inst Accreditation Nos.":=chapters."Programme Accreditation No.";
            // end;
        }
        field(4;"Chapter Name";Text[250])
        {
            Editable = false;
        }
        field(5;"Topic Code";Code[50])
        {
            TableRelation = "Accreditation Comment Line" where ("No."=field("Chapter Code"));

            // trigger OnValidate()
            // begin
            //     if topics.Get("Customer Posting Group") then
            //     "Gen. Bus. Posting Group":=topics."Line No.";
            // end;
        }
        field(6;"Topic Name";Text[250])
        {
            Editable = false;
        }
        field(7;"Sub-Topic Code";Code[50])
        {
            // TableRelation = Table51217 where (Field2=field("Topic Code"));

            // trigger OnValidate()
            // begin
            //     if subtopics.Get("Proposal Document Nos.") then
            //       "Programme Accreditation Nos.":=subtopics.Description;
            // end;
        }
        field(8;"Sub-Topic Name";Text[250])
        {
            Editable = false;
        }
        field(9;Comment;Text[250])
        {
        }
        field(10;Status;Option)
        {
            OptionCaption = 'Incomplete,Complete';
            OptionMembers = Incomplete,Complete;
        }
    }

    keys
    {
        key(Key1;"Application No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
       // subtopics: Record UnknownRecord51217;
        chapters: Record Entries;
        topics: Record "Accreditation Comment Line";
        InsAccreditation: Record "Ins. Accreditation Table";
        //Proposalheader: Record UnknownRecord51218;
}

