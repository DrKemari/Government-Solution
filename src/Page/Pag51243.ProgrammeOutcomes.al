#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Programme Outcomes (ID 51243).
/// </summary>
Page 51243 "Programme Outcomes"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
   // SourceTable = UnknownTable51224;

    layout
    {
        // area(content)
        // {
        //     repeater(Group)
        //     {
        //         field("Outcome Code";"Outcome Code")
        //         {
        //             ApplicationArea = Basic;
        //             Caption = 'Outcome No.';
        //             ShowMandatory = true;
        //         }
        //         field("Learning Outcome";LearningOutcometxt)
        //         {
        //             ApplicationArea = Basic;
        //             ShowMandatory = true;
        //         }
        //     }
        // }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        // CalcFields("Outcome Description");
        // if not "Outcome Description".Hasvalue then
        //   LearningOutcometxt := ''
        // else begin
        //   "Outcome Description".CreateInstream(InStr);
        //   InStr.Read(LearningOutcometxt,MaxStrLen(LearningOutcometxt));
        // end;
    end;

    var
        LearningOutcometxt: Text;
        InStr: InStream;
        OutStr: OutStream;
}

