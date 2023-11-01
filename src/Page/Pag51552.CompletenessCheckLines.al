#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51552 "Completeness Check Lines"
{
    PageType = ListPart;
    SourceTable = "SAR Completeness Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Description field.';
                }
                field("Feedback Comment"; Rec."Feedback Comment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feedback Comment field.';
                }
                field(Recommendation; Recommendtxt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendtxt field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Recommendation);
                        Rec.Recommendation.CreateInstream(ObjInstr1);
                        Obj1.Read(ObjInstr1);


                        if Recommendtxt <> Format(Obj1) then begin
                            Clear(Rec.Recommendation);
                            Clear(Obj1);
                            Obj1.AddText(Recommendtxt);
                            Rec.Recommendation.CreateOutstream(ObjOutStr1);
                            Obj1.Write(ObjOutStr1);
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Recommendation);
        Rec.Recommendation.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        Recommendtxt := Format(Obj);
    end;

    var
        Recommendtxt: Text;
        ObjInstr: InStream;
        Obj: BigText;
        ObjInstr1: InStream;
        ObjOutStr1: OutStream;
        Obj1: BigText;
}

#pragma implicitwith restore

