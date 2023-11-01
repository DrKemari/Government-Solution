#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56092 "Case Register"
{

    fields
    {
        field(1;"No.";Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                  HRSetup.Get;
                  NoSeriesMgt.TestManual(HRSetup."Legal Case Nos");
                  "No series" := '';
                end;
            end;
        }
        field(2;"Case Number";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Case Types";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Types"."Case Type" where ("Case Nature"=field("Nature of Case"));
        }
        field(4;"Nature of Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Case Desscription/Transpired";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Nature of Case";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Nature of Cases";
        }
        field(7;"Last Hearing Date";Date)
        {
            CalcFormula = max("Case Hearing"."Last Hearing Date" where ("Case Entry"=field("No."),
                                                                        "Entry Type"=const(Hearing)));
            FieldClass = FlowField;
        }
        field(8;"Next Hearing Date";Date)
        {
            CalcFormula = lookup("Case Hearing"."Next Hearing Date" where ("Case Entry"=field(upperlimit("No.")),
                                                                           "Entry Type"=const(Hearing)));
            FieldClass = FlowField;
        }
        field(9;"Advocate on Record";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Advocates".Code;

            trigger OnValidate()
            begin
                // CaseHearing.RESET;
                // CaseHearing.SETRANGE(CaseHearing."Case Entry","No.");
                // IF CaseHearing.FINDLAST THEN
                //  REPEAT
                //    CaseHearing."Advocate On Record":="Advocate on Record";
                //    CaseHearing.MODIFY;
                // UNTIL CaseHearing.NEXT = 0;
                
                /*CaseAdvocates.SESET;
                IF CaseAdvocates.SETRANGE();
                CompanyJudge.RESET;
                CompanyJudge.SETRANGE(Code,Judge);
                IF CompanyJudge.FINDSET THEN BEGIN
                  "Judge Name":=CompanyJudge."First Name"+' '+CompanyJudge."Middle Name"+' '+CompanyJudge."Last Name";
                  END;*/
                  CaseAdvocates.Reset;
                  CaseAdvocates.SetRange(Code,"Advocate on Record");
                  if CaseAdvocates.Find('-') then begin
                  "Advocate Firm":=CaseAdvocates."Firm name";
                
                 "Advocate name":=(CaseAdvocates.Code+' '+CaseAdvocates."Second name");
                  end

            end;
        }
        field(10;Progress;Text[250])
        {
            CalcFormula = max("Case Hearing".Progress where ("Case Entry"=field("No.")));
            FieldClass = FlowField;
        }
        field(11;"Name of Parties";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Nature of Claim";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Ongoing,Closed,Appeal';
            OptionMembers = New,Ongoing,Closed,Appeal;
        }
        field(14;Verdict;Option)
        {
            Caption = 'Verdict Status';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Won,Lost';
            OptionMembers = " ",Won,Lost;
        }
        field(15;"Verdict Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Verdict Summary";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"From Document Number";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Employee Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(21;"Last Mention Date";Date)
        {
            CalcFormula = max("Case Hearing"."Last Hearing Date" where ("Case Entry"=field("No."),
                                                                        "Entry Type"=const(Mention)));
            FieldClass = FlowField;
        }
        field(22;"Next Mention Date";Date)
        {
            CalcFormula = lookup("Case Hearing"."Next Hearing Date" where ("Case Entry"=field(upperlimit("No.")),
                                                                           "Entry Type"=const(Mention)));
            FieldClass = FlowField;
        }
        field(23;"Court House";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Court Houses";

            trigger OnValidate()
            begin
                CourtHouses.Reset;
                CourtHouses.SetRange(Code,"Court House");
                if CourtHouses.FindFirst then begin
                 Judge:=CourtHouses."Court Judge";
                  Validate(Judge);
                  end;
            end;
        }
        field(24;Judge;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Judges"."No.";

            trigger OnValidate()
            begin

                CaseJudges.Reset;
                CaseJudges.SetRange("No.",Judge);
                if CaseJudges.Find('-') then begin
                  "Judge Name":=CaseJudges.Names;
                  end;

            end;
        }
        field(25;"Judge Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(27;"No of Attachments";Integer)
        {
            CalcFormula = count("Document Attachment" where ("No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(28;"Advocate Firm";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Advocate name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Legal Case Nos");
          NoSeriesMgt.InitSeries(HRSetup."Legal Case Nos",xRec."No series",0D,"No.","No series");
        end;
    end;

    var
        CaseHearing: Record "Case Hearing";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        UserSetup: Record "User Setup";
        HREmp: Record Employee;
        CompanyJudge: Record "Company Judges";
        CaseAdvocates: Record "Case Advocates";
        CourtHouses: Record "Court Houses";
        CaseJudges: Record "Case Judges";
}

