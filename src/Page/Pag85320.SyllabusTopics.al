#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85320 "Syllabus Topics"
{
    PageType = ListPart;
    SourceTable = "Application Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Component Code"; Rec."Component Code")
                {
                    ApplicationArea = Basic;
                }
                field("Component Description"; Rec."Component Description")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Component Code"; Rec."Sub-Component Code")
                {
                    ApplicationArea = Basic;
                }
                field("Sub-Component Description"; Rec."Sub-Component Description")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;CommentTxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Clear(Rec.Strength);
                        if CommentTxt <> '' then begin
                            Rec.Strength.CreateOutstream(MemoWriter);
                          MemoWriter.Write(CommentTxt);
                        end;
                    end;
                }
                field(Recommendations;RecommendationTxt)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Clear(Rec.Recommendation);
                        if RecommendationTxt <> '' then begin
                            Rec.Recommendation.CreateOutstream(MemoWriter);
                          MemoWriter.Write(RecommendationTxt);
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
        Rec.CalcFields(Strength);
        Rec.CalcFields(Recommendation);
        if not Rec.Strength.Hasvalue then
          CommentTxt:= ''
        else begin
            Rec.Strength.CreateInstream(MemoReader);
          MemoReader.Read(CommentTxt,MaxStrLen(CommentTxt));
        end;

        if not Rec.Recommendation.Hasvalue then
          RecommendationTxt := ''
        else begin
            Rec.Recommendation.CreateInstream(MemoReader);
          MemoReader.Read(RecommendationTxt,MaxStrLen(RecommendationTxt));
        end;
    end;

    var
        CommentTxt: Text;
        RecommendationTxt: Text;
        InStr: InStream;
        OutStr: OutStream;
        MemoReader: InStream;
        MemoWriter: OutStream;
}

#pragma implicitwith restore

