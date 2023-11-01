#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85087 "Student Enquiry"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Case Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Enquiry,Complaint,Request,Complement';
            OptionMembers = Enquiry,Complaint,Request,Complement;
        }
        field(3;Subject;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "CRM Cases" where ("Case Type"=field("Case Type"));

            trigger OnValidate()
            begin
                CRMCases.Reset;
                CRMCases.SetRange(Code,Subject);
                if CRMCases.FindFirst then begin
                  "Subject Description":=CRMCases.Description;
                end
            end;
        }
        field(4;"Subject Description";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Customer No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where ("Customer Type"=filter(Student));

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","Customer No.");
                if Customer.FindFirst then begin
                "Customer Name":=Customer.Name;
                end
            end;
        }
        field(6;"Customer Name";Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Origin;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Walk-In,Portal';
            OptionMembers = "Walk-In",Portal;
        }
        field(8;Description;Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,In-Progress,Waiting For Details,Researching Information,Information Provided,Problem Solved';
            OptionMembers = Draft,"In-Progress","Waiting For Details","Researching Information","Information Provided","Problem Solved";
        }
        field(10;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Resolution Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Resolved By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get;
          ExaminationSetup.TestField("CRM Case Nos.");
          if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."CRM Case Nos.",xRec."No. Series",0D,"Document No.","No. Series");
          "Created On":=CurrentDatetime;
          Origin:=Origin::Portal; //assumption the default will always be portal
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CRMCases: Record "CRM Cases";
        Customer: Record Customer;
}

