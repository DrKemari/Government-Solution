#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51566 "Audit Roadmap Lines"
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
                field(Strength; Strengthstxt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strengthstxt field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Strength);
                        Rec.Strength.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);


                        if Strengthstxt <> Format(Obj) then begin
                            Clear(Rec.Strength);
                            Clear(Obj);
                            Obj.AddText(Strengthstxt);
                            Rec.Strength.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                        end;
                    end;
                }
                field(Weakness; Weaknesstxt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weaknesstxt field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Weakness);
                        Rec.Weakness.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);


                        if Weaknesstxt <> Format(Obj2) then begin
                            Clear(Rec.Weakness);
                            Clear(Obj2);
                            Obj2.AddText(Weaknesstxt);
                            Rec.Weakness.CreateOutstream(ObjOutStr2);
                            Obj2.Write(ObjOutStr2);
                        end;
                    end;
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
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Institution Remarks"; Institutiontxt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institutiontxt field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Institution Remarks");
                        Rec."Institution Remarks".CreateInstream(ObjInstr3);
                        Obj3.Read(ObjInstr3);


                        if Institutiontxt <> Format(Obj3) then begin
                            Clear(Rec."Institution Remarks");
                            Clear(Obj3);
                            Obj3.AddText(Institutiontxt);
                            Rec."Institution Remarks".CreateOutstream(ObjOutStr3);
                            Obj3.Write(ObjOutStr3);
                        end;
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Evidence; Rec.Evidence)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evidence field.';
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

        Rec.CalcFields(Strength);
        Rec.Strength.CreateInstream(ObjInstr1);
        Obj1.Read(ObjInstr1);
        Strengthstxt := Format(Obj1);

        Rec.CalcFields(Weakness);
        Rec.Weakness.CreateInstream(ObjInstr2);
        Obj2.Read(ObjInstr2);
        Weaknesstxt := Format(Obj2);

        Rec.CalcFields("Institution Remarks");
        Rec."Institution Remarks".CreateInstream(ObjInstr3);
        Obj3.Read(ObjInstr3);
        Institutiontxt := Format(Obj3);
    end;

    var
        Recommendtxt: Text;
        ObjInstr: InStream;
        Obj: BigText;
        ObjInstr1: InStream;
        ObjOutStr1: OutStream;
        Obj1: BigText;
        Strengthstxt: Text;
        Weaknesstxt: Text;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        Obj2: BigText;
        ObjOutStr: OutStream;
        ObjInstr3: InStream;
        ObjOutStr3: OutStream;
        Obj3: BigText;
        Institutiontxt: Text;
}

#pragma implicitwith restore

