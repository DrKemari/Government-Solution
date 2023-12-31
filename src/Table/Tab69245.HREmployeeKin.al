#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69245 "HR Employee Kin"
{
    Caption = 'Employee Relative';

    fields
    {
        field(1;"Employee Code";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(2;Relationship;Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where (Type=const("Next of Kin"));
        }
        field(3;SurName;Text[50])
        {
            NotBlank = true;
        }
        field(4;"Other Names";Text[100])
        {
            NotBlank = true;
        }
        field(5;"ID No/Passport No";Text[50])
        {
        }
        field(6;"Date Of Birth";Date)
        {
        }
        field(7;Occupation;Text[100])
        {
        }
        field(8;Address;Text[250])
        {
        }
        field(9;"Office Tel No";Text[100])
        {
        }
        field(10;"Home Tel No";Text[50])
        {
        }
        field(12;Type;Option)
        {
            OptionCaption = 'Next of Kin,Beneficiary';
            OptionMembers = "Next of Kin",Beneficiary;
        }
        field(13;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(14;Comment;Boolean)
        {
            CalcFormula = exist("Human Resource Comment Line" where ("Table Name"=const("Employee Relative"),
                                                                     "No."=field("Employee Code"),
                                                                     "Table Line No."=field("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50000;"E-mail";Text[60])
        {
        }
        field(50001;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002;Age;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;PWD;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Employee Code",Type,Relationship,SurName,"Other Names","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        HRCommentLine: Record "Human Resource Comment Line";
    begin
        HRCommentLine.SetRange("Table Name",HRCommentLine."table name"::"Employee Relative");
        HRCommentLine.SetRange("No.","Employee Code");
        HRCommentLine.DeleteAll;
    end;

    trigger OnInsert()
    begin
        i := 0;
        HRKin.Reset;
        HRKin.SetRange(HRKin."Employee Code",Rec."Employee Code");
        HRKin.SetRange(HRKin.Relationship,Rec.Relationship);
        if HRKin.Find('-') then begin
          repeat
            i := i + 1;
            if (Rec.Relationship = 'SPOUSE') and (i > 0 ) then
              Error('There can only be 1 Spouce for every Employee');
        //    IF (Rec.Relationship = 'CHILD') AND (i > 3 ) THEN
        //      ERROR('There can only be a Maximum of 4 Children for every Employee');
          until HRKin.Next=0;
        end;
    end;

    trigger OnRename()
    begin
        i := 0;
        HRKin.Reset;
        HRKin.SetRange(HRKin."Employee Code",Rec."Employee Code");
        HRKin.SetRange(HRKin.Relationship,Rec.Relationship);
        if HRKin.Find('-') then begin
          repeat
            i := i + 1;
            if (Rec.Relationship = 'SPOUSE') and (i > 0 ) then
              Error('There can only be 1 Spouce for every Employee');
        //    IF (Rec.Relationship = 'CHILD') AND (i > 3 ) THEN
        //      ERROR('There can only be a Maximum of 4 Children for every Employee');
          until HRKin.Next=0;
        end;
    end;

    var
        i: Integer;
        HRKin: Record "HR Employee Kin";
}

