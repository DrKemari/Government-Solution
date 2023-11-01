#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51216 "Accreditation Comment Line"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Feedback,Evaluation';
            OptionMembers = Feedback,Evaluation;
        }
        field(2;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(3;"Line No.";Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(5;"Code";Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(6;Comment;Text[80])
        {
            Caption = 'Comment';
            DataClassification = ToBeClassified;
        }
        field(7;"Document Line No.";Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = ToBeClassified;
        }
        field(8;"Application No";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","No.","Document Line No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    procedure SetUpNewLine()
    var
        SalesCommentLine: Record "Accreditation Comment Line";
    begin
        SalesCommentLine.SetRange("Document Type","Document Type");
        SalesCommentLine.SetRange("No.","No.");
        SalesCommentLine.SetRange("Document Line No.","Document Line No.");
        SalesCommentLine.SetRange(Date,WorkDate);
        if not SalesCommentLine.FindFirst then
          Date := WorkDate;
    end;

    procedure CopyComments(FromDocumentType: Integer;ToDocumentType: Integer;FromNumber: Code[20];ToNumber: Code[20])
    var
        SalesCommentLine: Record "Accreditation Comment Line";
        SalesCommentLine2: Record "Accreditation Comment Line";
    begin
        SalesCommentLine.SetRange("Document Type",FromDocumentType);
        SalesCommentLine.SetRange("No.",FromNumber);
        if SalesCommentLine.FindSet then
          repeat
            SalesCommentLine2 := SalesCommentLine;
            SalesCommentLine2."Document Type" := ToDocumentType;
            SalesCommentLine2."No." := ToNumber;
            SalesCommentLine2.Insert;
          until SalesCommentLine.Next = 0;
    end;

    procedure DeleteComments(DocType: Option;DocNo: Code[20])
    begin
        SetRange("Document Type",DocType);
        SetRange("No.",DocNo);
        if not IsEmpty then
          DeleteAll;
    end;


    procedure ShowComments(DocType: Option;DocNo: Code[20];DocLineNo: Integer)
    var
        SalesCommentSheet: Page "Accreditation Comment Sheet";
    begin
        SetRange("Document Type",DocType);
        SetRange("No.",DocNo);
        SetRange("Document Line No.",DocLineNo);
        Clear(SalesCommentSheet);
        SalesCommentSheet.SetTableview(Rec);
        SalesCommentSheet.RunModal;
    end;
}

