#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69272 "Applicant Employment History"
{
    PageType = List;
    SourceTable = "Employee History Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Obstxt; Obstxt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Key Experience';
                    ToolTip = 'Specifies the value of the Key Experience field.';
                    // trigger OnValidate()
                    // begin
                    //     CalcFields("Job ID");
                    //     "Job ID".CreateInstream(ObjInstr);
                    //     Obj.Read(ObjInstr);


                    //     if Obstxt <> Format(Obj) then begin
                    //         Clear("Job ID");
                    //         Clear(Obj);
                    //         Obj.AddText(Obstxt);
                    //         "Job ID".CreateOutstream(ObjOutStr);
                    //         Obj.Write(ObjOutStr);
                    //         // MODIFY;
                    //     end;
                    // end;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                // field("Job Grade"; "Job Grade")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Job Grade field.';
                // }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin


        Rec.CalcFields("Job ID");
        // "Job ID".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        Obstxt := Format(Obj);
    end;

    var
        objEmp: Record Employee;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        Obstxt: Text;
        Rectxt: Text;
}

#pragma implicitwith restore

