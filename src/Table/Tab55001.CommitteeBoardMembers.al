#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55001 "Committee Board Members"
{
    DrillDownPageID = "Board Members";
    LookupPageID = "Board Members";

    fields
    {
        field(1;Committee;Code[20])
        {
            NotBlank = true;
        }
        field(2;"Code";Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                /*IF Board.GET(Code) THEN BEGIN
                //SurName:=Board.Surname;
                Names:=Board."Job Title";
                END;*/ //commented by Morris
                
                if Directors.Get(Code) then begin
                    Designation := Directors.Name;
                end;

            end;
        }
        field(3;Names;Text[250])
        {
            Editable = false;
        }
        field(4;Designation;Text[100])
        {
        }
        field(5;Role;Option)
        {
            OptionCaption = ' ,Chairman,Vice Chairman,Secretary,Member,Interim Chairman';
            OptionMembers = " ",Chairman,"Vice Chairman",Secretary,Member,"Interim Chairman";
        }
        field(6;"Director No";Code[20])
        {
            TableRelation = Vendor."No." where ("Vendor Type"=filter(Director));

            trigger OnValidate()
            begin
                Directors.Get(Remarks);
                Designation := Directors.Name;
                Email:=Directors.Email;
            end;
        }
        field(7;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Remarks;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Salutation;Option)
        {
            Caption = 'Salutation';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,DR,FCPA,FCS,CPA,CS,FA,ENG,MISS,MR';
            OptionMembers = " ",DR,FCPA,FCS,CPA,CS,FA,ENG,MISS,MR;
        }
        field(12;"Institution Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Committee,"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Designation)
        {
        }
    }

    var
        Board: Record "Staff Establishment Task Lines";
        Directors: Record Vendor;
}

