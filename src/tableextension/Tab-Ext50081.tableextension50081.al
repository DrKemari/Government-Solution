#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50081 "tableextension50081" extends "Job Task" 
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Job No."(Field 1)".


        //Unsupported feature: Code Modification on ""Job Task No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Job Task No." = '' THEN
              EXIT;
            Job.GET("Job No.");
            Job.TESTFIELD("Bill-to Customer No.");
            Cust.GET(Job."Bill-to Customer No.");
            "Job Posting Group" := Job."Job Posting Group";
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..6


            //Examination COdes
            Courses.RESET;
            Courses.SETRANGE(Code,"Job Task No.");
            IF Courses.FINDSET THEN BEGIN
              "Examination Code":=Courses.Code;
              "Examination Type":=Courses.Type;
              END;
            */
        //end;
        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023;"LPO Commitments";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024;"PRN Commitments";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025;"Transaction Codes";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70014;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Directorate Code"));
        }
        field(70018;"Directorate Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(70019;Division;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Division/Section"),
                                                           "Direct Reports To"=field("Department Code"));
        }
        field(70020;Commitments;Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where (Job=field("Job No."),
                                                                  "Job Task No"=field("Job Task No."),
                                                                  Type=const(Committed)));
            FieldClass = FlowField;
        }
        field(70021;"Start Point(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70022;"End Point(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70023;"Funding Source";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(70024;"Procurement Method";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Method";
        }
        field(70025;"Surface Types";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Premix';
            OptionMembers = Premix;
        }
        field(70026;"Road Condition";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Good,Poor,Excellent';
            OptionMembers = Good,Poor,Excellent;
        }
        field(70028;"Completed Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(85000;"Examination Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses.Code;
        }
        field(85001;"Examination Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Technical/Diploma,Professional,Certificate,Vocational,Post-Graduate';
            OptionMembers = "Technical/Diploma",Professional,Certificate,Vocational,"Post-Graduate";
        }
    }

    var
        Courses: Record Courses;
}

