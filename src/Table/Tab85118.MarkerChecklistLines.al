#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85118 "Marker Checklist  Lines"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3; "Paper Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                end
            end;
        }
        field(4; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No. of Scripts Expected"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Envelope Serial No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Description = '-------Not being used';
        }
        field(8; "Quantity Received"; Integer)
        {
            Editable = false;

            trigger OnValidate()
            var
                TXT001: label 'The scripts for %1 have already been received';
            begin
            end;
        }
        field(9; "No. of Envelopes"; Integer)
        {
            Editable = false;
        }
        field(10; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(11; "Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Scripts Entries"."Center Code" where(Examination = field(Examination),
                                                                        "Paper Code" = field("Paper Code"),
                                                                        "Examination Sitting" = field("Examination Sitting"),
                                                                        Allocated = const(false));

            trigger OnValidate()
            begin
                ScriptsDispatchHeader.Reset;
                ScriptsDispatchHeader.SetRange("Document No.", "Document No.");
                ScriptsDispatchHeader.SetRange("Document Type", ScriptsDispatchHeader."document type"::"Script Dispatch Voucher");
                if ScriptsDispatchHeader.FindSet then begin
                    MarkerConflictofInterest.Reset;
                    MarkerConflictofInterest.SetRange("Marker No", ScriptsDispatchHeader."Marker No");
                    MarkerConflictofInterest.SetRange("Center Code", "Center Code");
                    if MarkerConflictofInterest.FindFirst then begin
                        Error('ERROR!! Kindly note that this Marker has already declared conflict of interest in the center chosen');
                    end;

                end;


                ExamScriptsEntries.Reset;
                ExamScriptsEntries.SetRange("Center Code", "Center Code");
                ExamScriptsEntries.SetRange(Examination, Examination);
                ExamScriptsEntries.SetRange("Paper Code", "Paper Code");
                if ExamScriptsEntries.FindSet then begin
                    "Center Name" := ExamScriptsEntries."Center Name";
                    "No. of Envelopes" := ExamScriptsEntries."No. of Envelopes";
                    "No. of Scripts Expected" := ExamScriptsEntries."No. of Scripts Expected";
                    "Quantity Received" := ExamScriptsEntries."Quantity Received";
                    "Script Receipt No" := ExamScriptsEntries."Document No.";
                    "Line No" := ExamScriptsEntries."Line No.";
                end
            end;
        }
        field(12; "Center Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Script Receipt No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Envelope No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disp Script Envelope Serials"."Envelope Serial No." where("Document No." = field("Script Receipt No"),
                                                                                        "Line No." = field("Line No"),
                                                                                        Allocated = filter(false));

            trigger OnValidate()
            begin
                DispScriptEnvelopeSerials.Reset;
                DispScriptEnvelopeSerials.SetRange("Document No.", "Script Receipt No");
                DispScriptEnvelopeSerials.SetRange("Line No.", "Line No");
                DispScriptEnvelopeSerials.SetRange("Envelope Serial No.", "Envelope No");
                if DispScriptEnvelopeSerials.FindSet then
                    "No. of Envelope Scripts" := DispScriptEnvelopeSerials."No. of Scripts";
            end;
        }
        field(15; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(17; "No. of Envelope Scripts"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Marking Complete"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                ScriptsDispatchLines: Record "Scripts Dispatch Lines";
                TXT001: label 'Kindly complete previous allocated scripts as completed';
            begin
                TestField("Examiner Report");
                ScriptsDispatchLines.Reset;
                ScriptsDispatchLines.SetCurrentkey("Line No");
                ScriptsDispatchLines.SetAscending("Line No", true);
                ScriptsDispatchLines.SetRange("Document No.", "Document No.");
                ScriptsDispatchLines.SetRange("Marking Complete", false);
                ScriptsDispatchLines.SetFilter("Line No", '<>%1', "Line No");
                if ScriptsDispatchLines.FindFirst then
                    Error(TXT001);
            end;
        }
        field(19; "Marksheet Issued"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                ScriptsDispatchLines: Record "Scripts Dispatch Lines";
                TXT001: label 'Kindly complete previous allocated scripts as completed';
            begin
                ScriptsDispatchLines.Reset;
                ScriptsDispatchLines.SetCurrentkey("Line No");
                ScriptsDispatchLines.SetAscending("Line No", true);
                ScriptsDispatchLines.SetRange("Document No.", "Document No.");
                ScriptsDispatchLines.SetRange("Marking Complete", false);
                ScriptsDispatchLines.SetFilter("Line No", '<>%1', "Line No");
                if ScriptsDispatchLines.FindFirst then
                    Error(TXT001);
            end;
        }
        field(20; "Marksheet Returned"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                TXT001: label 'You cannot return a marsheet that is not yet issued';
            begin
                if "Marksheet Issued" = false then
                    Error(TXT001);
            end;
        }
        field(21; "Issued By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Issued Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Receipt By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Receipt Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Completed By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Completed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Marks Distribution"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marksheet Returned");
            end;
        }
        field(28; "Marking Scheme"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marks Distribution");
            end;
        }
        field(29; "Examiner Report"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marking Scheme");
            end;
        }
        field(30; "No. of Scripts Returned"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Script Returned"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Attendance Register"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Signature Register"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Invigilators Reports"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Payment Summary Form"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Daily Attendance Register"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Sitting Plan"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Entry No")
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
        TXT002: label 'You are not allowed to delete an allocated entry';
    begin
        if "Marking Complete" or "Marksheet Returned" or "Marksheet Issued" then
            Error(TXT002);
    end;

    trigger OnInsert()
    begin
        // IF ScriptsDispatchHeader.GET("Document No.") THEN BEGIN
        //  Examination:=ScriptsDispatchHeader.Examination;
        //  "Paper Code":=ScriptsDispatchHeader."Paper Code";
        //  "Examination Sitting":=ScriptsDispatchHeader."Sitting Cycle";
        //  "Paper Name":=ScriptsDispatchHeader."Paper Name";
        //
        // END;
        Validate("Paper Code");
    end;

    var
        StationeryCategory: Record "Stationery Category";
        ExamCenter: Record "Examination Centres";
        ScriptsDispatchHeader: Record "Scripts Dispatch Header";
        ExamScriptsEntries: Record "Exam Scripts Entries";
        DispScriptEnvelopeSerials: Record "Disp Script Envelope Serials";
        MarkerConflictofInterest: Record "Marker Conflict of Interest";
}
