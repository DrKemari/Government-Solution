#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51250 "Accreditation Application"
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
            TableRelation = Customer;

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","No.");
                if Customer.FindSet then begin
                  Name:=Customer.Name;
                  Address:=Customer.Address;
                  "Address 2":=Customer."Address 2";
                  City:=Customer.City;
                  "Post Code":=Customer."Post Code";
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
            //    // Char: dotnet Char;
            //     i: Integer;
            //     PhoneNoCannotContainLettersErr: label 'Phone Cannot contain Letters';
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //   //    if Char.IsLetter("Phone No."[i]) then
            //     //    Error(PhoneNoCannotContainLettersErr);
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
        field(11;"Application Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Acc Fee Schedules" where (Blocked=filter(false));

            trigger OnValidate()
            var
                AccreditationType: Record "Accreditation Type Series";
            begin
                AccreditationType.Reset;
                AccreditationType.SetRange(Code,"Application Type");
                if AccreditationType.FindFirst then begin
                 "Application Type Name":=AccreditationType.Description;
                  AccFeeSchedules.Reset;
                  AccFeeSchedules.SetRange(Service,AccreditationType.Code);
                  if AccFeeSchedules.FindFirst then begin
                    "Application Fee LCY":=AccFeeSchedules.Amount;
                    "Application Fee":="Application Fee LCY"*1;

                    end;

                end
            end;
        }
        field(12;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;County;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Receipt No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Invoice No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Invoice Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Receipt Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Awaiting Closure,Commitee Pending,HOD Pending,Pending Approval,Awaiting Completeness Checks,Awaiting Payment Processing,Awaiting Peer Review,Peer Review Ongoing,Site Inspection Ongoing,Awaiting Board Approval,Completed';
            OptionMembers = Open,"Awaiting Closure","Commitee Pending","HOD Pending","Pending Approval","Awaiting Completeness Checks","Awaiting Payment Processing","Awaiting Peer Review","Peer Review Ongoing","Site Inspection Ongoing","Awaiting Board Approval",Completed;
        }
        field(22;"Application Type Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Application Fee LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(25;"Application Fee";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Rejection Reason";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Payment  Reference No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Payment Document";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Institution Type Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Institution Types";

            trigger OnValidate()
            begin
                InstitutionTypes.Reset;
                InstitutionTypes.SetRange(Code,"Institution Type Code");
                if InstitutionTypes.FindFirst then begin
                  "Institution Type":=InstitutionTypes.Description;
                end
            end;
        }
        field(31;"Institution Type";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Invoice Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Receipt Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Verdict Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evaluation Verdicts";

            trigger OnValidate()
            begin
                EvaluationVerdicts.Reset;
                EvaluationVerdicts.SetRange(Code,"Verdict Code");
                if EvaluationVerdicts.FindFirst then begin
                  "Verdict Description":=EvaluationVerdicts.Description;
                  end
            end;
        }
        field(35;"Verdict Description";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(123;Submitted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(124;"Job Created";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(125;"Job Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(126;"Job Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(127;Select;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(128;AltEmail;Text[80])
        {
            DataClassification = ToBeClassified;
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
        AccreditationSetups.Get;
        if "Application No."='' then begin
          NoSeriesManagement.InitSeries(AccreditationSetups."Inst Accreditation Nos.",xRec."No. Series",0D,"Application No.","No. Series");
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        AccreditationSetups: Record "Accreditation Setups";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Customer: Record Customer;
        AccFeeSchedules: Record "Acc Fee Schedules";
        InstitutionTypes: Record "Institution Types";
        EvaluationVerdicts: Record "Evaluation Verdicts";
}

