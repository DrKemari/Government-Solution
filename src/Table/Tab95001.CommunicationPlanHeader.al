#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95001 "Communication Plan Header"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.","Project ID");
                if ObjJob.FindSet then
                  begin
                    "Project Name":=ObjJob.Description;
                    "Project Start Date":=ObjJob."Starting Date";
                    "Project End Date":=ObjJob."Ending Date";
                  end;
            end;
        }
        field(4;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
          //  TableRelation = Table72157.Field2 where (Field1=filter(2));
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Primary MIssion";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"No. Of Planned Meetings";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Fred Calcfieds later';
        }
        field(11;"No. Of Meetings Held";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Fred Calcfieds later';
        }
        field(12;"No. Of Project Report";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Fred Calcfieds later';
        }
        field(13;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(15;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Created Date Time";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ObjJob: Record Job;
}

