#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56000 "CRM Training"
{
    DrillDownPageID = "CRM- Trainings";
    LookupPageID = "CRM- Trainings";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                 HumanResourcesSetup.Get();
                  NoSeriesMgt.TestManual(HumanResourcesSetup."CRM Training Nos.");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Duration Units";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6;Duration;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Cost Of Training";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*IF Posted THEN BEGIN
                IF Duration <> xRec.Duration THEN BEGIN
                MESSAGE('%1','You cannot change the costs after posting');
                Duration := xRec.Duration;
                END
                END
                */

            end;
        }
        field(8;Location;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Provider;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                      Vend.Reset;
                         Vend.SetRange(Vend."No.",Provider);
                         if Vend.Find('-') then begin
                            "Provider Name":=Vend.Name;
                         end;

            end;
        }
        field(10;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(12;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(13;Published;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(15;"Provider Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Published By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Published On";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;Attendees;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Total Attendees";Integer)
        {
            CalcFormula = count("CRM Student Applications" where ("Document Type"=filter(Training),
                                                                  "Document ID"=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
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

    trigger OnDelete()
    begin
                 TestField(Posted,false);
    end;

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get();
        HumanResourcesSetup.TestField("CRM Training Nos.");
            if "Document No."='' then begin
                NoSeriesMgt.InitSeries(HumanResourcesSetup."CRM Training Nos.",xRec."No. Series",0D,"Document No.","No. Series");
            end;
    end;

    trigger OnRename()
    begin
                       TestField(Posted,false);
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text000: label 'Cash management setup does not exist';
        HumanResourcesSetup: Record "Human Resources Setup";
        Vend: Record Vendor;
}

