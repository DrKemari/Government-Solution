#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51321 "SAR  Template Line"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            TableRelation = "SAR Template Header";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Section ID";Code[30])
        {
            TableRelation = "Audit Sections Setup";
            ValidateTableRelation = true;

            trigger OnValidate()
            begin
                SARSectionsSetup.Reset;
                SARSectionsSetup.SetRange(Code,"Section ID");
                if SARSectionsSetup.FindFirst then begin
                  "Section Name":=SARSectionsSetup.Description;
                  end
            end;
        }
        field(4;"Section Name";Text[100])
        {
            Editable = false;
        }
        field(5;"Question ID";Code[30])
        {
            TableRelation = "SAR Question Setup".Code where ("Section Code"=field("Section ID"));

            trigger OnValidate()
            begin
                SARQuestionSetup.Reset;
                SARQuestionSetup.SetRange(Code,"Question ID");
                if SARQuestionSetup.FindFirst then  begin
                  "Question Description":=SARQuestionSetup.Description;
                  end
            end;
        }
        field(6;"Question Description";Text[250])
        {
            Editable = false;
        }
        field(7;"Question Type";Option)
        {
            OptionCaption = 'Open-Ended,Closed-Ended,Attachment,Date,Table';
            OptionMembers = "Open-Ended","Closed-Ended",Attachment,Date,"Table";
        }
    }

    keys
    {
        key(Key1;"Header No.","Line No.")
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

