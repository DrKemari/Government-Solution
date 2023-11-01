#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51276 "Course Reference Materials"
{
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    // PageType = List;
    // SourceTable = UnknownTable51226;

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Group)
    //         {
    //             field("Code"; Code)
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Code field.';
    //             }
    //             field("Course Code"; "Course Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Course Code field.';
    //             }
    //             field("Application No."; "Application No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Application No. field.';
    //             }
    //             field("Reference Material"; RecommendedTxt)
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the RecommendedTxt field.';
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    // }

    // trigger OnAfterGetRecord()
    // begin
    //     CalcFields(RecommendedRef);
    //     if not RecommendedRef.Hasvalue then
    //         RecommendedTxt := ''
    //     else begin
    //         RecommendedRef.CreateInstream(InStr);
    //         InStr.Read(RecommendedTxt, MaxStrLen(RecommendedTxt));
    //     end;
    // end;

    // var
    //     RecommendedTxt: Text;
    //     InStr: InStream;
}

