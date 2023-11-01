#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51212 "Site Inspection Comment"
{

    fields
    {
        field(1;"Code";Code[30])
        {
        }
        field(2;"Inst Application No.";Code[30])
        {
            TableRelation = "Ins. Accreditation Table"."Accreditation No." where (Status=filter("Awaiting Peer Review"));
        }
        field(3;"User ID";Code[30])
        {

            trigger OnValidate()
            begin
                if UserSetup.Get("User ID") then
                  "User Name":=UserSetup."Employee Name";
            end;
        }
        field(4;"User Name";Text[30])
        {
        }
        field(5;"Date Created";Date)
        {
        }
        field(6;"User Category";Option)
        {
            OptionMembers = Architect,Librarian,"Program Specialist",Governance," Finance";
        }
        field(7;Observation;Blob)
        {
        }
        field(8;Recommendation;Blob)
        {
        }
        field(9;"No Series";Code[30])
        {
        }
        field(11;Verdict;Text[30])
        {
            //TableRelation = "Closure Voucher Header";
        }
        field(12;"Report Status";Option)
        {
            OptionMembers = Complete," Incomplete";
        }
        field(13;Comments;Text[250])
        {
        }
        field(14;Published;Boolean)
        {
        }
        field(15;Status;Option)
        {
            OptionMembers = Open,"Pending Approval"," Approved"," Completed";
        }
        field(16;"Assinged officer";Text[200])
        {
            TableRelation = Employee;
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

    trigger OnInsert()
    begin
        AccreditationSetups.Get();
          if Code='' then begin
          NoSeriesMgt.InitSeries(AccreditationSetups."Proposal Document Nos.",xRec."No Series",0D,Code,"No Series");
        end;
        "Date Created":=Today;
        "User ID":=UserId;
    end;

    var
        AccreditationSetups: Record "Accreditation Setups";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}

