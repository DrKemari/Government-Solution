#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51333 "Audit Qualification Categories"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;Category;Option)
        {
            OptionCaption = 'Full-Time,Part-Time';
            OptionMembers = "Full-Time","Part-Time";
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

    // trigger OnInsert()
    // begin
    //     QualityAuditSetup.Get();
    //      if Code=''  then begin

    //         NoSeriesMgt.InitSeries(QualityAuditSetup."Inst. Quality Audit Nos.",xRec."No. Series",0D,Code,"No. Series");
    //       end;


    //    // "Created By":=UserId;
    //    // "Created On":=CurrentDatetime;
    // end;

    var
     //   QualityAuditSetup: Record UnknownRecord51301;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Institution: Record Customer;
        Onboarding: Record "Accreditation Verdict Setup";
        PostCode: Record "Post Code";
        Counties: Record County;
}

