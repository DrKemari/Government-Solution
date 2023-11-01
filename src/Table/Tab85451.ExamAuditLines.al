#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85451 "Exam Audit Lines"
{

    fields
    {
        field(1;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Engagement Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Engagement Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabuses Development,Setting of Examinations,Moderation of Examinations,Printing of Examinations,Delivery of Examinations,Administration of Examinations,Marking Process,Processing of Results,Release of Results,Processing of Certificates,Certificate Dispatch';
            OptionMembers = "Syllabuses Development","Setting of Examinations","Moderation of Examinations","Printing of Examinations","Delivery of Examinations","Administration of Examinations","Marking Process","Processing of Results","Release of Results","Processing of Certificates","Certificate Dispatch";
        }
        field(4;"Lead Officer ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));

            trigger OnValidate()
            begin
                 if Resource.Get("Lead Officer ID") then begin
                  //Resource.TESTFIELD("E-mail Address");
                  "Lead Officer Name":=Resource.Name;
                  end;
            end;
        }
        field(5;"Lead Officer Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Global Dimension Dim 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Global Dimension  Dim 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Exam Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
    }

    keys
    {
        key(Key1;"Audit Plan ID","Engagement Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Engagement Category","Lead Officer Name")
        {
        }
    }

    var
        Resource: Record Resource;
}

