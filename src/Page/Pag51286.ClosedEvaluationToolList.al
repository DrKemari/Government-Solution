#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51286 "Closed Evaluation Tool List"
{
    // CardPageID = "Closed  Evaluation Tool";
    // PageType = List;
    // SourceTable = UnknownTable51229;
    // SourceTableView = where(Field6 = filter(3));

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
    //             field("Application No."; "Application No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Application No. field.';
    //             }
    //             field("Application Description"; "Application Description")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Application Description field.';
    //             }
    //             field("Created By"; "Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Created By field.';
    //             }
    //             field("Created On"; "Created On")
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Created On field.';
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 ToolTip = 'Specifies the value of the Status field.';
    //             }
    //         }
    //     }
    // }

    // actions
    // {
    //     area(creation)
    //     {
    //         action("Generate Evaluation Tool")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Generate Evaluation Tool';
    //             Image = Percentage;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             Visible = true;
    //             ToolTip = 'Executes the Generate Evaluation Tool action.';
    //             trigger OnAction()
    //             begin
    //                 Rec.SetRange(Code, Code);
    //                 Report.Run(51151, true, true, Rec);
    //             end;
    //         }
    //     }
    // }
}

