#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51200 "Ins. Accreditation Table"
{

    fields
    {
        field(1;"Accreditation No.";Code[20])
        {

            trigger OnValidate()
            begin
                if "Accreditation No." <> xRec."Accreditation No." then begin
                  AccreditationSetups.Get;
                  NoSeriesMgt.TestManual(AccreditationSetups."Inst Accreditation Nos.");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Institution No.";Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                
                if Institution.Get("Institution No.") then begin
                        "Institution Name.":=Institution.Name;
                        "Institution Phone No.":=Institution."Phone No.";
                        Address:=Institution.Address;
                        City:=Institution.City;
                       "Phone No.":=Institution."Phone No.";
                   end;
                   /*
                IF Onboarding.GET("Institution No.") THEN BEGIN
                  "Ministry of Education Code":=Onboarding."Ministry of Education Code";
                  "KRA Pin":=Onboarding."KRA Pin";
                   County:=Onboarding.County;
                   Constituency:=Onboarding."Constituency Code";
                   Contact:=Onboarding."Institutional Website";
                   Email:=Onboarding.Email;
                END
                */

            end;
        }
        field(3;"Institution Name.";Text[30])
        {
        }
        field(4;"Institution Campus";Text[30])
        {
        }
        field(5;"Institution Phone No.";Text[30])
        {
        }
        field(6;"Application Date";Date)
        {
        }
        field(7;"Convereted By";Code[30])
        {
        }
        field(8;"Submission Date";Date)
        {
        }
        field(9;Converted;Boolean)
        {
        }
        field(10;"Verdict Details";Text[250])
        {
        }
        field(11;"Payment Reference No.";Text[30])
        {
        }
        field(12;"Receipt No.";Code[30])
        {
            CalcFormula = lookup("Receipt Lines1"."Receipt No." where ("Applies to ID"=field("Accreditation No.")));
            FieldClass = FlowField;
        }
        field(13;"Payment Amount";Decimal)
        {
        }
        field(14;Status;Option)
        {
            OptionMembers = Open,"CEO Pending","DCS Pending","HOD Pending","Pending Approval","Awaiting Completeness Checks","Awaiting Payment Processing","Awaiting Peer Review","Peer Review Ongoing","Site Inspection Ongoing","Awaiting Board Approval",Completed;
        }
        field(15;"Date Created";Date)
        {
        }
        field(16;"Created By";Code[30])
        {
        }
        field(17;"No. Series";Code[30])
        {
        }
        field(18;"Initial Accreditation Code";Code[30])
        {
        }
        field(19;Paid;Boolean)
        {
        }
        field(23;Address;Text[30])
        {
            Caption = 'Address';
        }
        field(24;Email;Text[30])
        {
            Caption = 'Address 2';
        }
        field(25;City;Text[30])
        {
            Caption = 'City';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City,"Post Code",County,"Country Code",(CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(26;Contact;Text[50])
        {
            Caption = 'Contact';

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
            begin
            end;
        }
        field(27;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(28;"Accreditation Type";Text[30])
        {
        }
        field(29;Submitted;Boolean)
        {
        }
        field(31;"Accreditation Code";Code[30])
        {
            TableRelation = "Proposal Documen Topic";
        }
        field(33;Sponsor;Text[30])
        {
            TableRelation = "AccTask Notifications Schedule"."Job No.";
        }
        field(34;County;Text[30])
        {
            TableRelation = County;
        }
        field(35;Constituency;Code[30])
        {
        }
        field(36;"KRA Pin";Text[30])
        {
        }
        field(37;"Ministry of Education Code";Code[30])
        {
        }
        field(38;"Received Amount";Decimal)
        {
            CalcFormula = sum("Receipt Lines1".Amount where ("Applies to ID"=field("Accreditation No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39;"Invoiced Amount";Decimal)
        {
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where ("Document Type"=filter(Invoice),
                                                                        "External Document No."=field("Accreditation No."),
                                                                        "Customer No."=field("Institution No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40;"Proposal Document";Boolean)
        {
        }
        field(41;"Insitution Campus No.";Code[30])
        {
        }
        field(42;Verdict;Option)
        {
            OptionMembers = " ","Minor Revamp","Major Revamp","Re-Design";
        }
        field(43;"Post Code";Code[30])
        {
            TableRelation = "Post Code".Code;
        }
        field(44;"Country Code";Code[30])
        {
        }
        field(45;"Application Type";Text[30])
        {
        }
        field(46;"Rejection Reason";Text[100])
        {

            trigger OnValidate()
            begin
                "HOD UserID":=UserId;
                "HOD Approval Date":=Today;
            end;
        }
        field(47;"HOD UserID";Code[30])
        {
        }
        field(48;"HOD Approval Date";Date)
        {
        }
        field(49;"DCS Comment";Text[100])
        {

            trigger OnValidate()
            begin
                "DCS UserID":=UserId;
                "DCS Approval Date":=Today;
            end;
        }
        field(50;"DCS UserID";Code[30])
        {
        }
        field(51;"DCS Approval Date";Date)
        {
        }
        field(52;"CEO Comment";Text[100])
        {

            trigger OnValidate()
            begin
                "CEO Approval Date":=Today;
                "CEO UserID":=UserId;
            end;
        }
        field(53;"CEO UserID";Code[30])
        {
        }
        field(54;"CEO Approval Date";Date)
        {
        }
        field(55;Invoiced;Boolean)
        {
        }
        field(56;"Invoice No.";Code[30])
        {
            CalcFormula = lookup("Cust. Ledger Entry"."Document No." where ("Document Type"=filter(Invoice),
                                                                            "External Document No."=field("Accreditation No."),
                                                                            "Customer No."=field("Institution No.")));
            FieldClass = FlowField;
        }
        field(57;"Constituency Name";Text[30])
        {
        }
        field(58;"County Code";Code[30])
        {
            TableRelation = County.Code;

            trigger OnValidate()
            begin
                //IF Counties.GET(Code ) THEN BEGIN
                 // County:=Counties.Description;
                //END
            end;
        }
        field(59;"Proposed Location";Text[50])
        {
            Caption = 'Name 2';
        }
        field(60;"Institutional Website";Text[30])
        {
            Caption = 'Insitutional Website';
            ExtendedDatatype = URL;

            trigger OnLookup()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
                Cont: Record Contact;
            begin
            end;
        }
        field(61;"Application Letter";Boolean)
        {
        }
        field(62;"Payment Document";Boolean)
        {
        }
        field(63;"Reference No.";Text[50])
        {
        }
        field(64;"KRA Copy";Boolean)
        {
        }
        field(65;"University Approval";Option)
        {
            OptionCaption = 'Pending Approval,Approved';
            OptionMembers = "Pending Approval",Approved;
        }
        field(66;Type;Option)
        {
            OptionCaption = 'Original,Version';
            OptionMembers = Original,Version;
        }
        field(67;"Version No.";Integer)
        {
        }
        field(68;"Current Version";Boolean)
        {
        }
        field(69;Published;Boolean)
        {
        }
        field(70;"Assigned Employee No.";Code[30])
        {
            TableRelation = Employee."No." where (Status=filter(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Assigned Employee No.") then begin
                "Assigned Employee Name.":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                end
            end;
        }
        field(71;"Assigned Employee Name.";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Accreditation No.")
        {
            Clustered = true;
        }
        key(Key2;"Institution Name.","Institution Campus")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Accreditation No.","Institution Name.","Institution Campus")
        {
        }
    }

    trigger OnInsert()
    begin
        AccreditationSetups.Get;
        if "Accreditation No."='' then begin
          NoSeriesMgt.InitSeries(AccreditationSetups."Inst Accreditation Nos.",xRec."No. Series",0D,"Accreditation No.","No. Series");
        end;
        "Created By":=UserId;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Institution: Record Customer;
        Onboarding: Record "Accreditation Verdict Setup";
        PostCode: Record "Post Code";
        AccreditationSetups: Record "Accreditation Setups";
        Employee: Record Employee;
}

