#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51559 "Site Visit Lines"
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
                }
                field("Section Description"; Rec."Section Description")
                {
                    ApplicationArea = Basic;
                }
                field(Findings;Findingstxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Findings);
                        Rec.Findings.CreateInstream(ObjInstr3);
                        Obj3.Read(ObjInstr3);


                        if Findingstxt<>Format(Obj3) then
                        begin
                         Clear(Rec.Findings);
                         Clear(Obj3);
                         Obj3.AddText(Findingstxt);
                            Rec.Findings.CreateOutstream(ObjOutStr3);
                         Obj3.Write(ObjOutStr3);
                        end;
                    end;
                }
                field(Strength;Strengthstxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Strength);
                        Rec.Strength.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);


                        if Strengthstxt<>Format(Obj) then
                        begin
                         Clear(Rec.Strength);
                         Clear(Obj);
                         Obj.AddText(Strengthstxt);
                            Rec.Strength.CreateOutstream(ObjOutStr);
                         Obj.Write(ObjOutStr);
                        end;
                    end;
                }
                field(Weakness;Weaknesstxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Weakness);
                        Rec.Weakness.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);


                        if Weaknesstxt<>Format(Obj2) then
                        begin
                         Clear(Rec.Weakness);
                         Clear(Obj2);
                         Obj2.AddText(Weaknesstxt);
                            Rec.Weakness.CreateOutstream(ObjOutStr2);
                         Obj2.Write(ObjOutStr2);
                        end;
                    end;
                }
                field(Recommendation;Recommendtxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Recommendation);
                        Rec.Recommendation.CreateInstream(ObjInstr1);
                        Obj1.Read(ObjInstr1);


                        if Recommendtxt<>Format(Obj1) then
                        begin
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
        Recommendtxt:=Format(Obj);

        Rec.CalcFields(Strength);
        Rec.Strength.CreateInstream(ObjInstr1);
        Obj1.Read(ObjInstr1);
        Strengthstxt:=Format(Obj1);

        Rec.CalcFields(Weakness);
        Rec.Weakness.CreateInstream(ObjInstr2);
        Obj2.Read(ObjInstr2);
        Weaknesstxt:=Format(Obj2);

        Rec.CalcFields(Findings);
        Rec.Findings.CreateInstream(ObjInstr3);
        Obj3.Read(ObjInstr3);
        Findingstxt:=Format(Obj3);
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
        Findingstxt: Text;
        ObjInstr3: InStream;
        ObjOutStr3: OutStream;
        Obj3: BigText;
}

#pragma implicitwith restore

