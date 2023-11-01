#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85001 "Exam Sitting Cycle"
{
    DrillDownPageID = "Examination Sitting Cycle";
    LookupPageID = "Examination Sitting Cycle";

    fields
    {
        field(1;"Exam Sitting Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Examination Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where ("Record Type"=filter(Examination));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.","Examination Project ID");
                if Job.FindFirst then begin
                  "Project Description":=Job.Description;
                end
            end;
        }
        field(3;"Project Description";Text[50])
        {
        }
        field(4;"Exam Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Exam End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Closed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Sitting Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Ongoing,Upcoming';
            OptionMembers = Active,Ongoing,Upcoming;
        }
        field(8;"Sitting Sequence";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Exam Sitting Cycle","Examination Project ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Job: Record Job;
}

