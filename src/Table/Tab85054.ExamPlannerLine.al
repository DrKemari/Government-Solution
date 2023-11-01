#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85054 "Exam Planner Line"
{

    fields
    {
        field(1;"Planner No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Material Planner Header";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Examination Task No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No.";

            trigger OnValidate()
            begin
                  JobTask.Reset;
                  JobTask.SetRange("Job No.","Project No.");
                  JobTask.SetRange("Job Task No.","Examination Task No.") ;
                  if JobTask.FindFirst then begin
                    Description:=JobTask.Description;
                  end



            end;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(6;Section;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where (Course=field(Examination));
        }
        field(7;"Subject Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                  Papers.Reset;
                  Papers.SetRange(Code,"Subject Code");
                  if Papers.FindSet then begin
                  "Subject Name":=Papers.Description;
                    Section:=Papers.Section;
                   end;
                //check all open entries
                TotalCandidature:=0;
                ExamBookingEntries.Reset;
                ExamBookingEntries.SetRange(Paper,"Subject Code");
                ExamBookingEntries.SetRange(Status,ExamBookingEntries.Status::Open);
                if ExamBookingEntries.FindSet then
                  begin
                    repeat
                      TotalCandidature:=TotalCandidature+1;
                    until ExamBookingEntries.Next=0;
                    "Total Candidature":=TotalCandidature;
                    end

            end;
        }
        field(8;"Subject Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Total Candidature";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Total Quantity";Decimal)
        {
            CalcFormula = sum("Examination Planner Items".Quantity where ("Exam Planner Entry"=field("Line No."),
                                                                          "Exam Planner No."=field("Planner No.")));
            FieldClass = FlowField;
        }
        field(11;"Total Budget";Decimal)
        {
            CalcFormula = sum("Examination Planner Items"."Total Amount" where ("Exam Planner Entry"=field("Line No."),
                                                                                "Exam Planner No."=field("Planner No.")));
            FieldClass = FlowField;
        }
        field(12;"Total Actual Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"BoQ Template Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Boq Template  Header";
        }
        field(14;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));
        }
        field(15;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(16;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(17;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(18;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(21;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(22;"Procurement Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category Header".Category;
        }
        field(23;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Project No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
    }

    keys
    {
        key(Key1;"Planner No.","Line No.",Examination,"Financial Year Code","Project No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;
        Papers: Record Papers;
        Job: Record Job;
        JobTask: Record "Job Task";
        ExamBookingEntries: Record "Exam Booking Entries";
        TotalCandidature: Integer;

    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Exam Planner Line","Planner No.",FieldNumber,ShortcutDimCode);
        Modify;
    end;
}

