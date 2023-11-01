#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70236 "SettersPortalUsers"
{

    fields
    {
        field(1;"Authentication Email";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Password;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle" where ("Sitting Status"=filter(Active),
                                                        Closed=filter(false|true));

            trigger OnValidate()
            var
                ExaminationResultsBuffer: Record "Fund Types";
                ExamSittingCycle: Record "Exam Sitting Cycle";
            begin
            end;
        }
        field(4;"Last Modified Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Resource No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                 Resource.Reset;
                 Resource.SetRange("No.","Resource No");
                 if Resource.FindFirst then begin
                  "Resource Name":=Resource.Name;
                 end
            end;
        }
        field(25;"Resource Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Authentication Email")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}
