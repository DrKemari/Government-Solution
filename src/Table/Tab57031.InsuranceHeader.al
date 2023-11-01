#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57031 "Insurance Header"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Insurance Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee."No.";
        }
        field(9;"Employee Name";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Annual Premium";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Premium Per Employee";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Insurance,Insurance Claim';
            OptionMembers = " ",Insurance,"Insurance Claim";
        }
        field(13;"Insurance No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Insurance."No.";

            trigger OnValidate()
            begin
                if  Insurance.Get("Insurance No") then begin

                  "Insurance Type":=Insurance."Insurance Type";
                  "Annual Premium":=Insurance."Annual Premium";
                  "Sum Insured":=Insurance."Total Value Insured";
                  end;
            end;
        }
        field(14;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Asset,Employee';
            OptionMembers = " ",Asset,Employee;
        }
        field(15;"Reference No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16;Comments;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Claim Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=const(Asset)) "Fixed Asset"."No."
                            else if (Type=const(Employee)) Employee."No.";

            trigger OnValidate()
            begin
                if Type=Type::Asset then begin
                  FixedAsset.Reset;
                  FixedAsset.SetRange("No.","No.");
                  if FixedAsset.FindSet then begin
                    Description:=FixedAsset.Description+' Claim';
                    end;
                  end;
                  if Type=Type::Employee then begin
                  Employee.Reset;
                    Employee.SetRange("No.","No.");
                    if Employee.FindSet then begin
                      Description:=Employee."First Name"+' '+Employee."Last Name"+' Claim';
                      end;
                  end;
            end;
        }
        field(22;"Sum Insured";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type"="document type"::Insurance then begin
        FASetup.Get;
        FASetup.TestField("Staff Insurance Nos.");
        "Document No":=NoSeriesManagement.GetNextNo(FASetup."Staff Insurance Nos.",Today,true);
        end;
        if "Document Type"="document type"::"Insurance Claim" then begin
        FASetup.Get;
        FASetup.TestField("Insurance Claim  Nos.");
        "Document No":=NoSeriesManagement.GetNextNo(FASetup."Insurance Claim  Nos.",Today,true);
        end;
        "Created By":=UserId;
        "Created On":=CreateDatetime(Today,Time);
        UserSetup.Reset;
        UserSetup.SetRange("User ID",UserId);
        if UserSetup.FindSet then begin
          "Employee Name":=UserSetup."Employee Name";
          "Employee No":=UserSetup."Employee No.";
          end;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        Insurance: Record Insurance;
}

