#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51347 "SAR Completeness Lines"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Section Code";Code[30])
        {
            TableRelation = "Audit Sections Setup";

            trigger OnValidate()
            begin

                SARSectionsSetup.Reset;
                SARSectionsSetup.SetRange(Code,"Section Code");
                if SARSectionsSetup.FindFirst then begin
                  "Section Description":=SARSectionsSetup.Description;
                  end
            end;
        }
        field(3;"Section Description";Text[100])
        {
            Editable = false;
        }
        field(4;"Sub-Section Code";Code[30])
        {
            Editable = true;
            TableRelation = "SAR Question Setup" where ("Section Code"=field("Section Code"));

            trigger OnValidate()
            begin
                SARQuestionSetup.Reset;
                SARQuestionSetup.SetRange(Code,"Sub-Section Code");
                if SARQuestionSetup.FindFirst then begin
                "Sub-Section Description":=SARQuestionSetup.Description;
                end
            end;
        }
        field(5;"Sub-Section Description";Text[250])
        {
        }
        field(6;"Feedback Comment";Option)
        {
            OptionCaption = 'Incomplete,Complete';
            OptionMembers = Incomplete,Complete;
        }
        field(7;Strength;Blob)
        {
        }
        field(8;"Institution Remarks";Blob)
        {
        }
        field(9;Recommendation;Blob)
        {
        }
        field(10;"Due Date";Date)
        {
        }
        field(11;Status;Option)
        {
            OptionCaption = ' ,Done,Not Done';
            OptionMembers = " ",Done,"Not Done";
        }
        field(12;"Effective Date";Date)
        {
        }
        field(13;Evidence;Boolean)
        {
        }
        field(14;Weakness;Blob)
        {
        }
        field(15;"Resource Person Role";Code[30])
        {
            TableRelation = "Audit Resource";
        }
        field(16;"Resource Feedback Type";Option)
        {
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
        }
        field(17;Findings;Blob)
        {
        }
    }

    keys
    {
        key(Key1;"Code","Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SARSectionsSetup: Record "Audit Sections Setup";
        SARQuestionSetup: Record "SAR Question Setup";
}

