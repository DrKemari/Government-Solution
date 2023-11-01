#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51234 "Programme Rationale"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    //SourceTable = UnknownTable51236;

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Group)
    //         {
    //             field(Category;Category)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Categorytxt;Categorytxt)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Description';
    //                 MultiLine = true;
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    // }

    // trigger OnAfterGetRecord()
    // begin
    //     CalcFields("Category Description");
    //     if not "Category Description".Hasvalue then
    //       Categorytxt := ''
    //     else begin
    //       "Category Description".CreateInstream(Instr);
    //       Instr.Read(Categorytxt,MaxStrLen(Categorytxt));
    //     end;
    // end;

    // var
    //     Categorytxt: Text;
    //     Instr: InStream;
}

