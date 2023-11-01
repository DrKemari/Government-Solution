#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85073 "Center Dispatch Lines"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Stationery Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stationery Category";

            trigger OnValidate()
            begin
                if StationeryCategory.Get("Stationery Type") then begin
                  "Stationery Name":=StationeryCategory.Description;
                  end
            end;
        }
        field(4;"Stationery Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Unit of Measure";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(6;Quantity;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Serial No From";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Serial No. To";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Serial No From Received";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Serial No. To Received";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Quantity Received";Integer)
        {
            CalcFormula = sum("Script Envelope Serials"."No. of Scripts" where ("Document No."=field("Document No."),
                                                                                "Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            var
                TXT001: label 'The scripts for %1 have already been received';
            begin
                if Posted=true then
                  Error(TXT001,"Paper Code");
                "Created By":=UserId;
                "Last Modified Date":=CurrentDatetime;
            end;
        }
        field(12;"No. of Envelopes";Integer)
        {
            CalcFormula = count("Script Envelope Serials" where ("Document No."=field("Document No."),
                                                                 "Line No."=field("Line No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(14;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Scripts Type"=const(Internal)) Papers
                            else if ("Scripts Type"=const(External)) "External  Papers";

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code,"Paper Code");
                if Papers.FindFirst then begin
                  "Paper Name":=Papers.Description;
                 end
            end;
        }
        field(15;"No. of Scripts Expected";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(17;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Last Modified Date";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;Submitted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Envelope Serial No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(23;Level;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"No Marked";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No. Sampled";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "% Pass":=("No. Passing"/"No. Sampled")*100;
            end;
        }
        field(26;"No. Passing";Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "% Pass":=("No. Passing"/"No. Sampled")*100;
            end;
        }
        field(27;"% Pass";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Scripts Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        TXT001: label 'You are not allowed to delete a submitted entry';
    begin
        if Posted=true then
          Error(TXT001);
    end;

    var
        StationeryCategory: Record "Stationery Category";
}
