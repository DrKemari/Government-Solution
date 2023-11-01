#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69100 "Positions"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Job Description";Text[250])
        {
        }
        field(3;"No of Posts";Integer)
        {

            trigger OnValidate()
            begin
                if "No of Posts" <> xRec."No of Posts" then
                "Vacant Positions" :="No of Posts"-"Occupied Positions";
            end;
        }
        field(4;"Occupied Positions";Integer)
        {
            CalcFormula = count(Employee where ("Job ID"=field("Job ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Vacant Positions";Integer)
        {
        }
        field(6;UserID;Code[50])
        {
        }
        field(7;Status;Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(8;"Date Created";Date)
        {
        }
        field(9;"Position Reporting To";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
        }
        field(10;"Reporting To Title";Text[50])
        {
            CalcFormula = lookup(Positions."Job Description" where ("Job ID"=field("Position Reporting To")));
            FieldClass = FlowField;
        }
        field(11;Active;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;Remarks;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Level Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";

            trigger OnValidate()
            begin
                SalaryScales.Reset;
                SalaryScales.SetRange(Scale,"Level Code");
                if SalaryScales.FindSet then begin
                  "Level Description":=SalaryScales.Description;
                end
            end;
        }
        field(14;"Level Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Job ID","Job Description")
        {
        }
    }

    trigger OnInsert()
    begin
        Active:=true;
    end;

    var
        NoOfPosts: Decimal;
        HREmp: Record Employee;
        SalaryScales: Record "Salary Scales";
}

