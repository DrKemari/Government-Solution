#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85034 "Exemption Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Section,Paper';
            OptionMembers = Section,Paper;
        }
        field(5;"No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter(Section)) Section where (Course=field("Course Id"))
                            else if (Type=filter(Paper)) Papers where (Course=field("Course Id"));

            // trigger OnValidate()
            // begin
            //     Rate:=1;
            //     if Section.Get("No.") then
            //       Name:=Section.Description;
            //     if Papers.Get("No.") then
            //       Name:=Papers.Description;
            //     //get the cost per paper based on part
            //     Papers.Reset;
            //     Papers.SetRange(Code,"No.");//get paper ppart
            //     if Papers.FindFirst then begin
            //        StudentHeader.Reset;
            //       StudentHeader.SetRange("No.","Header No.");//get the type code
            //       if StudentHeader.FindFirst then begin
            //        Resource.Reset;
            //         Resource.SetRange("Transaction Type",StudentHeader."Type Code");
            //         Resource.SetRange("Part ID",Papers.Level);//Get the fee type code
            //         if Resource.FindFirst then begin
            //            ResourcePrice.Reset;
            //            ResourcePrice.SetRange(Code,Resource."No.");
            //           if ResourcePrice.FindFirst then begin//get the price
            //              Amount:=ResourcePrice."Unit Price";
            //             "Amount LCY":=Rate*Amount;
            //           end;
            //         end;
            //       end;
            //     end
            // end;
        }
        field(6;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(8;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Line No.","Header No.","Course Id")
        {
            Clustered = true;
        }
        key(Key2;"Amount LCY")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        "Last Date Modified":=Today;
        "Last Modified Date Time":=CurrentDatetime;
    end;

    var
        Papers: Record Papers;
        Section: Record Section;
        ResourcePrice: Record "Resource Price";
        ExemptionsSetup: Record "Exemptions Setup";
        StudentHeader: Record "Student Processing Header";
        Resource: Record Resource;
        Rate: Decimal;
}

