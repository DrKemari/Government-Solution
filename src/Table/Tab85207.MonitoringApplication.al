#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85207 "Monitoring Application"
{
    //  /*Include currency conversion on application type*/


    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No.";Code[30])
        {
            Caption = 'No.';
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin

                ExamCenter.Reset;
                ExamCenter.SetRange(Code,"No.");
                if ExamCenter.FindSet then begin
                  Name:=ExamCenter.Name;
                  Address:=ExamCenter.Address;
                  "Address 2":=ExamCenter."Address 2";
                  City:=ExamCenter.City;
                  "Post Code":=ExamCenter."Post Code";
                  Validate("Post Code");
                  end
            end;
        }
        field(3;Name;Text[100])
        {
            Caption = 'Name';
        }
        field(4;Address;Text[100])
        {
            Caption = 'Address';
        }
        field(5;"Address 2";Text[50])
        {
            Caption = 'Address 2';
        }
        field(6;City;Text[30])
        {
            Caption = 'City';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.LookupPostCode(City,"Post Code",County,Country);
            end;

            trigger OnValidate()
            var
                PostCode: Record "Post Code";
            begin
                PostCode.ValidateCity(City,"Post Code",County,Country,(CurrFieldNo <> 0) and GuiAllowed);
                //IF (Country/Region Code=CONST()) "Post Code".City ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Country/Region Code))
            end;
        }
        field(7;Contact;Text[100])
        {
            Caption = 'Contact';

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
                TempCust: Record Customer temporary;
            begin
            end;
        }
        field(8;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            //     PhoneNoCannotContainLettersErr: label 'Phone Cannot contain Letters';
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(9;Country;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;County;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Awaiting Site Monitoring,Released,Completed';
            OptionMembers = Open,"Pending Approval","Awaiting Site Monitoring",Released,Completed;
        }
        field(17;"Application Type Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Rejection Reason";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Verdict Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evaluation Verdicts";
        }
        field(21;"Verdict Description";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Application No.")
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
        if "Application No."='' then begin
          NoSeriesManagement.InitSeries(ExaminationSetup."Monitoring Center Nos.",xRec."No. Series",0D,"Application No.","No. Series");
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        ExaminationSetup: Record "Examination Setup";
}

