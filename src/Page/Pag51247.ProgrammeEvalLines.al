#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51247 "Programme Eval Lines"
{
    // PageType = ListPart;
    // SourceTable = UnknownTable51231;

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Group)
    //         {
    //             field("Component Code";"Component Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Component Description";"Component Description")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Sub-Component Code";"Sub-Component Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Sub-Component Description";"Sub-Component Description")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Maximum Score";"Maximum Score")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Control12;Score)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Strength;Strengthtxt)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Strengths';
    //                 MultiLine = true;
    //                 ShowMandatory = true;

    //                 trigger OnValidate()
    //                 begin
    //                     CalcFields(Strength);
    //                     Strength.CreateInstream(ObjInstr);
    //                     Obj.Read(ObjInstr);


    //                     if Strengthtxt<>Format(Obj) then
    //                     begin
    //                      Clear(Strength);
    //                      Clear(Obj);
    //                      Obj.AddText(Strengthtxt);
    //                      Strength.CreateOutstream(ObjOutStr);
    //                      Obj.Write(ObjOutStr);
    //                     // MODIFY;
    //                     end;
    //                 end;
    //             }
    //             field(Weakness;Weaknesstxt)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Weaknesses';
    //                 ShowMandatory = true;

    //                 trigger OnValidate()
    //                 begin
    //                     CalcFields(Weakness);
    //                     Weakness.CreateInstream(ObjInstr);
    //                     Obj.Read(ObjInstr);


    //                     if Weaknesstxt<>Format(Obj) then
    //                     begin
    //                      Clear(Weakness);
    //                      Clear(Obj);
    //                      Obj.AddText(Weaknesstxt);
    //                      Weakness.CreateOutstream(ObjOutStr);
    //                      Obj.Write(ObjOutStr);
    //                     // MODIFY;
    //                     end;
    //                 end;
    //             }
    //             field(Recommendation;Recommtxtx)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Recommendations';
    //                 ShowMandatory = true;

    //                 trigger OnValidate()
    //                 begin
    //                     CalcFields(Recommendation);
    //                     Recommendation.CreateInstream(ObjInstr);
    //                     Obj.Read(ObjInstr);


    //                     if Recommtxtx<>Format(Obj) then
    //                     begin
    //                      Clear(Recommendation);
    //                      Clear(Obj);
    //                      Obj.AddText(Recommtxtx);
    //                      Recommendation.CreateOutstream(ObjOutStr);
    //                      Obj.Write(ObjOutStr);
    //                     // MODIFY;
    //                     end;
    //                 end;
    //             }
    //             field("CUE Comment";CUEtxt)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'CUE Comment';
    //                 Enabled = CUEComment;

    //                 trigger OnValidate()
    //                 begin
    //                     CalcFields("CUE Comment");
    //                     "CUE Comment".CreateInstream(ObjInstr);
    //                     Obj.Read(ObjInstr);


    //                     if CUEtxt<>Format(Obj) then
    //                     begin
    //                      Clear("CUE Comment");
    //                      Clear(Obj);
    //                      Obj.AddText(CUEtxt);
    //                      "CUE Comment".CreateOutstream(ObjOutStr);
    //                      Obj.Write(ObjOutStr);
    //                     // MODIFY;
    //                     end;
    //                 end;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group(Scores)
    //         {
    //             action(Score)
    //             {
    //                 ApplicationArea = Basic;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 RunObject = Page Comments;
    //                 RunPageLink = "Line No."=field(Field2),
    //                               "Topic Name"=field(Field6);
    //                 RunPageMode = Edit;
    //             }
    //         }
    //     }
    // }

    // trigger OnAfterGetRecord()
    // begin
    //     ProgrammeEvaluationHeader.Reset;
    //     ProgrammeEvaluationHeader.SetRange(Code,"Evaluation Header No.");
    //     if ProgrammeEvaluationHeader.FindSet then begin
    //       if ProgrammeEvaluationHeader.Type=ProgrammeEvaluationHeader.Type::"1" then
    //          CUEComment:=true;
    //       end;
    //       //blob fields

    //     CalcFields(Weakness);

    //     if not Weakness.Hasvalue then
    //       Weaknesstxt := ''
    //     else begin
    //       Weakness.CreateInstream(BlobReader);
    //       BlobReader.Read(Weaknesstxt,MaxStrLen(Weaknesstxt));
    //     end;

    //     CalcFields(Strength);
    //     Strength.CreateInstream(ObjInstr);
    //     Obj.Read(ObjInstr);
    //     Strengthtxt:=Format(Obj);


    //     CalcFields(Recommendation);
    //     if not Recommendation.Hasvalue then
    //       Recommtxtx := ''
    //     else begin
    //       Recommendation.CreateInstream(BlobReader);
    //       BlobReader.Read(Recommtxtx,MaxStrLen(Recommtxtx));
    //     end;

    //     CalcFields("CUE Comment");
    //     if not "CUE Comment".Hasvalue then
    //       CUEtxt := ''
    //     else begin
    //       "CUE Comment".CreateInstream(BlobReader);
    //       BlobReader.Read(CUEtxt,MaxStrLen(CUEtxt));
    //     end;
    // end;

    // trigger OnInit()
    // begin
    //     CUEComment:=false;
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     ProgrammeEvaluationHeader.Reset;
    //     ProgrammeEvaluationHeader.SetRange(Code,"Evaluation Header No.");
    //     if ProgrammeEvaluationHeader.FindSet then begin
    //       if ProgrammeEvaluationHeader.Type=ProgrammeEvaluationHeader.Type::"1" then
    //          CUEComment:=true;
    //       end
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     ProgrammeEvaluationHeader.Reset;
    //     ProgrammeEvaluationHeader.SetRange(Code,"Evaluation Header No.");
    //     if ProgrammeEvaluationHeader.FindSet then begin
    //       if ProgrammeEvaluationHeader.Type=ProgrammeEvaluationHeader.Type::"1" then
    //          CUEComment:=true;
    //       end
    // end;

    // trigger OnOpenPage()
    // begin
    //     Rec.SetCurrentkey("Component Code");
    //     Rec.SetAscending("Component Code",true);
    // end;

    // var
    //     ProgrammeComponents: Record UnknownRecord51227;
    //     CUEComment: Boolean;
    //     ProgrammeEvaluationHeader: Record UnknownRecord51229;
    //     BlobReader: InStream;
    //     Weaknesstxt: Text;
    //     Strengthtxt: Text;
    //     Recommtxtx: Text;
    //     CUEtxt: Text;
    //     Obj: BigText;
    //     ObjInstr: InStream;
    //     ObjOutStr: OutStream;
    //     Obstxt: Text;
    //     Rectxt: Text;
    //     BlobWriter: OutStream;
}

