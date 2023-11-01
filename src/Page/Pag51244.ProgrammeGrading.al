#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Programme Grading (ID 51244).
/// </summary>
Page 51244 "Programme Grading"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
   // SourceTable = UnknownTable51225;

    layout
    {
        area(content)
        {
            // repeater(Group)
            // {
            //     field(Grade;Grade)
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Minimum %";"Minimum %")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("Maximum %";"Maximum %")
            //     {
            //         ApplicationArea = Basic;
            //     }
            //     field("GPA Points";"GPA Points")
            //     {
            //         ApplicationArea = Basic;
            //         Enabled = GpaChecker;
            //     }
            // }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        GpaChecker:=true;
    end;

    trigger OnOpenPage()
    begin
        // Programme.Reset;
        // Programme.SetRange(Service,"Application No.");
        // if Programme.FindSet then begin
        //   if Programme."GPA?"=false then
        //        GpaChecker:=false;
        // end
    end;

    var
        GpaChecker: Boolean;
        Programme: Record "Acc Fee Schedules";
}

